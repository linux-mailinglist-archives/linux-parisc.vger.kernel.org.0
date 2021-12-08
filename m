Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B38146DCCC
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Dec 2021 21:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhLHURA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Dec 2021 15:17:00 -0500
Received: from outbound5e.eu.mailhop.org ([52.28.168.19]:37987 "EHLO
        outbound5e.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhLHURA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Dec 2021 15:17:00 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1638994403; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=BLbs+6hRY3PConzLX42t5yjlr2nKjvBq1hAk/ltEsJz3m4OIDY7bjSVxhNcs3wxztWQIWJeE4oApL
         75Wiyp4hAnfFpO4PDXxrp0oVMIIPBiFQZlL1ePi9/mrZB1OYJAsIehIOTBxc/FlqCUPsG9h+PtET2J
         T0mV3cD7B4dWvkGH0eEGSrQT4YDJQ64T36z6+I+Mi4/6ycUgCnalKtrNFhvxxZw4y38as533kKlo9z
         77SS4Y8NME3ZXOL72XZmbI8Ms8LI0cW9pHz8Xc8jEyPwP+yrRy4TWTT90avUeSIMNpkLTiAxRf6twF
         wYh4VYxfMFpBdLfsNVEL4fpUY5WCnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
         date:references:subject:cc:to:from:dkim-signature:dkim-signature:from;
        bh=cUMWeVLq9XEzPhhILfb4HZdGcsvSmXKaz4HApsQXzvo=;
        b=p9uH0aDl4eoGpbWF5HAYzHWuyfaPf64UG4HIsuOct9zCuEmcjSMumSuAAelLE6rSmnpnn6Got9M4x
         DkObuOxGCyanWaMrGsf+3l7K3MMYNqTeGka1jWeiu/danj1p4gAMjrt6/gB7J7UXiO25UCk0LRGY3+
         Rxeztn4kdV8kbgnASO1c8uLduIvguHe8TMm2wmAoQPzIiAkjFiKl30FSDu6mrYSWPM9Jn+KfG96+W/
         AzCOLN3OiRogwfvkQYSKw9Ju+6askFRnenPX1bKu4CemKGSu9+GdBgm4aRd3xIrhfjuZG9C8wQunQM
         EPYs/bkDXnu+/L74MZ1oq0sldTI51yg==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
         date:references:subject:cc:to:from:from;
        bh=cUMWeVLq9XEzPhhILfb4HZdGcsvSmXKaz4HApsQXzvo=;
        b=l/+dLBH4o3D5Q1daWdlr53kerzx47qAuYf/98UiZZl1JbrvOSuPOgxa5MdqWs1Z/2VCSht4AGpf2e
         xAxLtgfzD3hOoFjIqI5kQR3EO4/MmGUEoLXebyWRHqWbIujvmrCdAttkHqEYcHn9u2DhvEtuRCSYCx
         DYHYgGLS9T34rxVc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
         date:references:subject:cc:to:from:from;
        bh=cUMWeVLq9XEzPhhILfb4HZdGcsvSmXKaz4HApsQXzvo=;
        b=YIQfPtHeuI8678TUiuMCz7pAKDkKg43PIOI+2T8Fhp/Zmx3b2tLPS69DUzr+/qhZCyuw5XzEASbEj
         xiJUTHokzJGQpGbBO6MZ/bYtl2nwjFkJe6PQTeTOPKajDx1vP72S0VqNCmy51B4L/L9hRX3Q3vbRRS
         NTV5JsM3GVao/EI9GoXaVj7NaWxMI29e8AqekiLjYiKkXh8vRZK9nRpzL/8TCNn3mGQLpaM/JB2Cdm
         gzSoeiI0i3aqTPKX9uXbP7f75vJM0j2pxRaKu2ebW3yjR0D5JqzcHsDV6yQW/zkmxL6168t8VaEOJs
         9SsMHBHCpoRI1zVyT5LfivwnGHbNuTw==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 48a1a078-5863-11ec-a073-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id 48a1a078-5863-11ec-a073-973b52397bcb;
        Wed, 08 Dec 2021 20:13:19 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mv3JV-00027A-6P; Wed, 08 Dec 2021 22:13:18 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>, deller@kernel.org
Subject: Re: glibc tst-minsigstksz-5 failure
References: <c58ea7e4-f0df-3840-478e-0c3459aa4318@bell.net>
        <3b28b1a5-2a49-af75-bcf2-52eb114be348@gmx.de>
        <24997ae3-a6e2-9207-8935-9b52369f4fbb@gmx.de>
        <fb3f869d-d9c8-5997-c641-f0d7dc1aa4e6@bell.net>
Date:   Wed, 08 Dec 2021 21:13:13 +0100
In-Reply-To: <fb3f869d-d9c8-5997-c641-f0d7dc1aa4e6@bell.net> (John David
        Anglin's message of "Wed, 8 Dec 2021 09:28:51 -0500")
Message-ID: <87sfv2ua7a.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

John David Anglin <dave.anglin@bell.net> writes:

> On 2021-12-08 8:05 a.m., Helge Deller wrote:
>> On 12/8/21 13:51, Helge Deller wrote:
>>> On 12/7/21 22:47, John David Anglin wrote:
>>>> The glibc tst-minsigstksz-5 test fails with a protection id trap.
>>>> tst-minsigstksz (pid 19958): Protection id trap (code 7) at 00000000f5=
b00497
>>>>
>>>> The problem seems to be that the signal return trampoline is placed
>>>> on the alternate stack but the alternate is not executable.  It is
>>>> allocated by malloc.> ...
>>>> Stacks are normally executable on hppa so the trampoline works.  But
>>>> user code wouldn't normally make an alternate stack executable.
>>> True, I think most people just forget that such architectures exist.
>>>
>>> Anyway, the glibc testcase is interesting.
>>> The pretty similar sigaltstack testcase from LTP does work:
>>> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/=
syscalls/sigaltstack/sigaltstack01.c
>>>
>>> Both use malloc() to allocate the memory, the only difference is the si=
ze allocated.
>>> If you change the glibc testcase to:
>>> -- size_t stack_buffer_size =3D 64 * 1024 * 1024;
>>> ++ size_t stack_buffer_size =3D SIGSTKSZ;
>>> it allocates only 8kB instead of 64MB.
>>> It seems glibc uses brk() in both cases, but when allocating 64MB it ad=
ditionally adds a mmap() with READ/WRITE permissions only:
>>> brk(0x606000)                           =3D 0x606000
>>> mmap2(NULL, 67112960, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, =
-1, 0) =3D 0xf303f000
>>>
>>> This will then break - as you mentioned - the signal handling on parisc.
>>>
>>> I see those options to fix it:/usr/include/hppa-linux-gnu/asm/signal.h:=
#define MINSIGSTKSZ    2048
> I wonder about defining MINSIGSTKSZ to 2048 as it is smaller than a page.
>
> mprotect requires a page aligned address.=C2=A0 Alternate stack isn't goi=
ng to be page aligned if it is allocated by
> malloc.=C2=A0 Malloc alignment isn't sufficient for nominal 64-byte stack=
 alignment specified in runtime.
>>> /usr/include/hppa-linux-gnu/asm/signal.h:#define SIGSTKSZ       8192
>>>
>>> a) Fix the application to map the memory +x
> Doesn't fix problem..
>>> b) Add some code to glibc to map the memory +x when sigaltstack is call=
ed.
> See mprotect comment.
>>> c) Add some (parisc-only) code to kernel to set the permission.
> Again, I think region needs to be page aligned.
>> Option d):
>> Enhance the kernel to create a per-process new page and map it +rx into =
the userspace
>> at process start time. Kernel sets up the page to contain the signal tra=
mpoline code.
>>
>> Option e):
>> Finally implement vDSO, which then includes option d)
>>
>> With options d) and e) we could get completely rid of executable stacks.
> I like the later two options.

Note that programs are allowed to unmap the vdso. Valgrind is doing that (g=
uess it
doesn't support hppa anyways). OTOH valgrind uses SA_RESTORER, so it
would still work. While i don't think the possibility of unmapping the
vdso would be a real issue, i thought i mention it.

Regards
Sven
