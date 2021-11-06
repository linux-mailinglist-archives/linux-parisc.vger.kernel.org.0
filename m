Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E3E447072
	for <lists+linux-parisc@lfdr.de>; Sat,  6 Nov 2021 21:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhKFUqY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 6 Nov 2021 16:46:24 -0400
Received: from outbound5a.eu.mailhop.org ([3.124.88.253]:54053 "EHLO
        outbound5a.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhKFUqX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Nov 2021 16:46:23 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1636231356; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=vzEXtx0UU6P0mCVxWN6eKChHYwBqKvk06a7miExepcsdST6rWX8/E0n5+Drw596Xji+wMioRvPbv0
         ix5TsjyvDbx8m0W+ShHO16uwaazlaUmiEwSrRId7yB/yjc/kc/ZX4oPTKXt5sRghxTGYtgKpf945cH
         OhNChXsishynDUAROJALjHjUkCe7OsE7TP7HihLjn9itvr9QOIvNW+itFhHPrUD9IFQTymjwX3xDgj
         pmkCD2KvjCIuNnRakHSwmXfM+y0dNM68SKjpxq6wtlMC3v7rG5WHH6KIWUBB/Rc1Le/nDs+1oK7SUF
         D6eECk/Rjs7ctCqYsx35vXhXDztvD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
         date:references:subject:cc:to:from:dkim-signature:dkim-signature:from;
        bh=7HRhBebQXD0S5PT+uNtjVTpXnEiI9VxE/+1AWolVJv8=;
        b=N9tAtoxtMIoWtlPB0+Jp8sOuE3jhP1I2oqW9uyOIKJiMP3MCw1XACydBhQTdSEUA9RHgeXWP+q33I
         GDvREvE24pf7y4vz2HgtlXgtdFGLg+4OaZFKqpstQtWWlA/be3GJXuSAx2CbdxCl6Xh2WGxMN8y+7n
         nPbwXAqzYW4aokUgciKo9Z0vAqdNYbKhHiazkQ5h+9gRAVzjre9IoC+mxxqYm2Og8p9xYlV5dETi6C
         0R3hxXRw94rwq5Dm2DOCQPyUAFirGFb+vO9EzEr1vTNe0mRHwWiXf+42t5G6b836BOy7DRphEE40FP
         NJcB6hLFQzzRaY6WBlT9ku/DulUQy9Q==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
         date:references:subject:cc:to:from:from;
        bh=7HRhBebQXD0S5PT+uNtjVTpXnEiI9VxE/+1AWolVJv8=;
        b=Wc7HqaR5hm/mD9lYJsMAcCAvsTY7Ge0aabZbdJg8bkJMCFVDIm2yWjlUbm9iY84ihfuoTddXw42E1
         JKtaSrNC7JyhAO0qt289TFy1Nxo/VEbUy/JizBQcYbdsgjiNEvlRWxjqkjxJhATkRVhd9kGrZkj2DP
         Ic00XV+iXttRrzEQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
         date:references:subject:cc:to:from:from;
        bh=7HRhBebQXD0S5PT+uNtjVTpXnEiI9VxE/+1AWolVJv8=;
        b=XkKP3Q5sH2CIMsVm+aoy3RVjUVr74NoVfzmiMXeHWIiea4mJsyOumSTdUQY5tvBJXteYQwwqjpQv1
         OETibeJuMAJasviiR+nluy+DpYKvHyJtRU1NS9XsMq1l5QRViiD4WPh0JPyFQ+zFeQzyNhC2Bmim8s
         2Wdut8j4sHUq7C6mhk9lIFF/rffy65nFKkxu/A+SaLCgewpX7GT3/hq8DTwc6lVdzaDTfnjuBOtInd
         rsBVbc6Qr9hJLMzskWG8ZKuNYqwZGVZ+TGJs8f6hxrA6KjGPqFmyPuzl/Ct0/1cWPyuUhDwmrXeCcv
         5Rkoh31iJ98KrGz9JPLhsMRMgNySr5g==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 0d017351-3f42-11ec-8886-95b64d6800c5
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound3.eu.mailhop.org (Halon) with ESMTPSA
        id 0d017351-3f42-11ec-8886-95b64d6800c5;
        Sat, 06 Nov 2021 20:42:32 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mjSW9-00DrTm-CS; Sat, 06 Nov 2021 22:42:25 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix code/instruction patching on PA1.x machines
References: <YX8HK7ZZZhjRQzcr@ls3530>
        <91b3d125-18ae-e10f-3000-1b17a43a156f@bell.net>
        <cf2c5fa8-5b98-50b7-00ef-0e86df918e8e@gmx.de>
        <a3568fd4-79be-798e-3078-60b187ddaea7@bell.net>
        <f8a7f1fa-dc97-224b-8726-25bb66653aa3@gmx.de>
Date:   Sat, 06 Nov 2021 21:42:23 +0100
In-Reply-To: <f8a7f1fa-dc97-224b-8726-25bb66653aa3@gmx.de> (Helge Deller's
        message of "Thu, 4 Nov 2021 21:48:17 +0100")
Message-ID: <87fss9hv80.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Helge Deller <deller@gmx.de> writes:

> Hi Dave,
>
> On 11/4/21 18:57, John David Anglin wrote:
>> On 2021-11-03 5:08 p.m., Helge Deller wrote:
>>> On 11/3/21 21:12, John David Anglin wrote:
>>>> I think the real problem is that neither flush_kernel_vmap_range() or
>>>> invalidate_kernel_vmap_range() flush the icache.=C2=A0 They only opera=
te
>>>> on the data cache. flush_icache_range will flush both caches.
>>> Yes.
>>> But we write the new instructions to a congruently memory are (same
>>> physical memory like the kernel code), then flush/invalidate the
>>> D-Cache, and finally flush the I-cache of kernel code memory.
>>> See last function call of __patch_text_multiple().
>>>
>>> So, logically I think it should work (and it does on PA2.x).
>>
>> I still believe it is incorrect to use invalidate_kernel_vmap_range() to=
 flush the writes in
>> __patch_text_multiple() to memory.=C2=A0 Both the PA 1.1 and 2.0 archite=
cture documents state that
>> it is implementation dependent whether pdc writes back dirty lines to me=
mory at priority 0.
>> If the writes are not flushed to memory, the patch won't install.
>>
>>> Or do you mean to flush the I-Cache of both mappings?
>>
>> I reviewed the flush operations in __patch_text_multiple().=C2=A0 I beli=
eve the current code is more or
>> less correct, but not optimal.=C2=A0 I believe the final call to flush_i=
cache_range() is unnecessary.=C2=A0 We
>> can also eliminate one range flush in the calls to make sure we don't ha=
ve any aliases in the cache.
>> See change attached below.
>>
>> The big problem with __patch_text_multiple() is can only patch code that=
 the patch code doesn't depend
>> on.=C2=A0 This line in __patch_text_multiple() will cause a TLB fault on=
 the first execution after a new
>> patch_map is setup. We do alternative patching to the TLB handler when A=
LT_COND_NO_SMP is true.
>
> I believe the alternative code patching isn't critical.
> It just patches in NOPs, so even if the newly patched NOPs aren't visible=
 yet (when the TLB handler is
> executed), it uses the old instructions which shouldn't harm anything. Th=
ey were executed before the
> whole time.
>
> I do agree, that patching other code paths (with non-NOPs) could be criti=
al.
>
> By the way, to narrow down the problem, I do boot those tests here with t=
he "no-alternatives"
> kernel parameter, which effectively disables the alternatives-patching.
>

I think there are two paths in code patching, that are mixed up in the
text above:

a) __patch_text_multiple(), which is only used by ftrace (and kprobes on
   ftrace). This patches the functions as follows:

   - it patches the trampoline located before the function start
   - after doing so, it patches the branch which sits right at the
     beginning of the function. When removing, it first removes the branch
     and the trampoline code afterwards. This is done via two calls to
     __patch_text_multiple(), which isn't ideal. See
     ftrace_make_nop()/ftrace_make_call()

b) The alternative patching, which replaces code with memcpy(), which
   might suffer from the tlb problem mentioned above.

Sven

