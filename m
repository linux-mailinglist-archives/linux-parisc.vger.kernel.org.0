Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9299144115A
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Nov 2021 00:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhJaXKq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 31 Oct 2021 19:10:46 -0400
Received: from mout.gmx.net ([212.227.15.15]:42333 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229982AbhJaXKq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 31 Oct 2021 19:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635721688;
        bh=lIJ/BXcWFimx1sXBuWtyaizuvkammDKfcEsJnfaa+MA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=X9BybBSW1eu7GNtmmt9qvyAW7/IY3bmdplUcDIHnmgbZd6IN3XNTJPpDNa9KIqUDv
         K9pLpTX+2P+kFR0bSnDIjcCRK3268JfUlmJQ76JeyhxwnUT1frUueTnUIRiaZhAXF+
         9MvZarsaoCsbzwjQ2j0RnpY0NgT4SStifvTZ2VXA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.201]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwZ4-1mvq0i1Uce-00uGAp; Mon, 01
 Nov 2021 00:08:08 +0100
Message-ID: <c25d8ffb-be2b-fb56-f0c9-11323d256a15@gmx.de>
Date:   Mon, 1 Nov 2021 00:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: fixmap problem on PA11 hardware
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     deller@kernel.org
References: <3b8410fd-f688-862f-3c3c-7ccf5d523075@gmx.de>
 <a10ff403-3869-9eb1-8213-b51e6ca8d219@bell.net>
 <0a068f90-84bb-dbe1-b8b3-6fd7709b814a@gmx.de>
 <dba5227c-0616-f51e-b716-9569304804bd@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <dba5227c-0616-f51e-b716-9569304804bd@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3txX499OGGqp5Or1m7oa9U1xF0QfPzvb88IhysMixdHRx30rihb
 ulcbZdxCUOvjlmD9k+R8Yezg4dxi3J4SoaQra7C4yXIXBQuxCJY4KdMfKOC2POacDO1cUm3
 9NF/tYEbisBkt4Wr40CRbCiv5GLgdR/cr03Fh1dOGQ7SeVdX6PGMkzCAA9k5tBOCz/+N0vr
 gZlaZTz9rnZ1mVwd4cLOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mF/xaQqkUvc=:CbzhItuKskZG43GQWAyVKE
 i6fl9TyADsqYMjbF9U7Q6K8b1LF/fr/bG1yxiXduIyuIcC52JPiYAv9CB2JcUjjFYdEZSefev
 3GLPRf/j0ADLXgDMtaLudxTKhY+Asg2sYqo44w6ZKh/slxBKh5Ssxl7AF5kokICRjKI59BpMu
 UNArXuNUMITDKeSrT/2bAZzANAa2XLZgd8Y3meDgios4qk9+hP/3bit5ukqPhC5JXGST0FlzY
 VNmpZWXdctyEcXU3AVSMN+QcZSPFm2dvn8q4DqMviWCKmk4ISFlqQVm28eEjf7TEGfGOJgdKc
 2nkl9uY+CDhHwqFf+chXVOl2xQdE9OzigwUuFekgE99FZ3ngzZh54ctFwZCLvWFGIK8Dpj7iR
 dQZ/cZcisIg1Xsl+qPjiFlW/Mrrn+mYGO2Usgx9QnkNxzMCZO0Yi35NJX8KRkVpy1FuzX1MDp
 Fj3qi1ykzToeMO9n9Nwh+tiHhtBThVpbjrEJ/RLNk1I/MGFQ58ixsTEwHi05WCCU2xZWJGdxG
 l3rhggFpAuaH9jEhBP4Ts9iE0hvaVm/6O+84YXGybbADgu2RDYcU2rYy1SY/dwQxY/XYE+Gx0
 ENPrwR24PvbiG4r7KHHxWzjSH30bGE1HLwmI9VEeT7nx+VowS2FPlPwHv8KBeNA950ytnqgYs
 3Zc9Hcd+8ciGnoG7x4h69l1AqAAnFx4chPfll/IUcWGvBmnPlm1RZ5vgjaveRlPbVZdXbgUls
 9e/Nd9CiLb5m5KVAI3OGvupkZERvoj7VqnDliI5ytfvLesLlqm4l7yu17bZPWRflnRoYxHMdr
 RI0GmMITxR+IelPJCGLHGZxP5TOKAb0dm2DY7ssZX21Bq7GdjZAjZmvUEBStFuD0NZcRbI97y
 rfE5uUnfJZmXCNJAA4sI/7NIjElCkjqw/AFL7coVBe3A3mEtnwFpnXGOnJz25gpHJSaRcXqSw
 RpcWcdrBCheQpOSjsA/oq9OQfYBXwsmeAchKqz+qdYnqsNlTmo2ux57UcaqZ3zUN2tPC3FGfB
 CroXRy5JGSJOwdJmIc72W1/+r8McjXct9q6Nr+7M5zTWOzRroh6fpEvwdqJuMeJX3N3j3ZtOv
 Ud4TeKW8EhqA38=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Dave,

On 10/31/21 23:47, John David Anglin wrote:
> My sense is the invalidate patch isn't correct.=C2=A0 The main differenc=
e between pdc and fdc is that
> it is optional whether pdc writes the cache line back to memory when it'=
s dirty at priority 0.

That's true, nevertheless I've seen different behaviour on real hardware.

It might be, that:

-	flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
+	invalidate_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
(here the flush might be sufficient)
 	if (mapped)
 		patch_unmap(FIX_TEXT_POKE0, &flags);
+	invalidate_kernel_vmap_range((void *)start, end - start);
(but here the pdc is necessary to actually drop data from I-cache)
 	flush_icache_range(start, end);

I can test tomorrow...

> Note also that flush_kernel_vmap_range and invalidate_kernel_vmap_range =
both have this hunk
> which may behave differently:
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((!IS_ENABLED(CONFIG_SMP) =
|| !arch_irqs_disabled()) &&
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsi=
gned long)size >=3D parisc_cache_flush_threshold) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 flush_tlb_kernel_range(start, end);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 flush_data_cache();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

Yes, but even when patching 4 bytes the patch above did worked (and
parisc_cache_flush_threshold was bigger).

Helge

>
> Dave
>
> On 2021-10-31 5:22 p.m., Helge Deller wrote:
>> On 10/27/21 22:14, John David Anglin wrote:
>>> On 2021-10-27 3:09 p.m., Helge Deller wrote:
>>>> In the archives I found this old thread, which might be related:
>>>> https://www.spinics.net/lists/linux-parisc/msg09391.html
>>> These seems unlikely as both 7100LC and 7300LC are PA-RISC 1.1 process=
ors (1.1c vs. 1.1e).=C2=A0 Big difference
>>> seems to be cache.
>> Yes, there were at least two problems.
>> I just sent two patches to the list which fix the crashes.
>> But FTRACE still doesn't work on PA1.x machines as expected,
>> while the same code seems to work on PA2.x machines (running the same 3=
2bit kernel).
>
>

