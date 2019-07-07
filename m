Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B6461762
	for <lists+linux-parisc@lfdr.de>; Sun,  7 Jul 2019 22:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfGGUBw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 7 Jul 2019 16:01:52 -0400
Received: from mout.gmx.net ([212.227.15.15]:54219 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbfGGUBw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Jul 2019 16:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562529707;
        bh=C2htkzgoFGXj5AnK/gqS0N5ZQr48DCvCTGySKO1k8Gw=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=TlqTMtxhAiIW9o4V2UfRimnlb1Y6iMRCGfA6Q/yIBAwvrgy3is8tNObibjO4G7qeY
         xJY2kTs/L8QYL4mRvslM1a2C5duuuslhoSAV+G0iuv6Lffrh13BRCkBvZ4DJ/bsmoZ
         9i2omjF+ZdSEQ8uJqJ4rrssM5uAVpdtoiykHQYi4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.149.140]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LaFmY-1iDWDd112s-00m4fL; Sun, 07
 Jul 2019 22:01:47 +0200
Subject: Re: [PATCH] Update palo documentation
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <1562522488.3216.15.camel@HansenPartnership.com>
 <ff1f3d02-20bc-c1fa-5ff6-0520e9ebe8e0@gmx.de>
 <1562528703.3216.17.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <70b4c08b-de2e-91f7-890d-767cad3dfad1@gmx.de>
Date:   Sun, 7 Jul 2019 22:01:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562528703.3216.17.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p6b7yUvkprap2yzQWYrCzCTBPEprnpiE31sL6EYQ52bal1tOOGj
 dQ4XRlReAh2XLKdBH5pCtC3phLGURE2ZzixdZesQbc/1y2qJal+Ak2oTVZDiEONxI5aQfIg
 caK3GsW3jnscR9ItgVSskSQfRuYOnbLjkTxvmNfjrYaOoABp7aD/qJz3aCtTRwyJs+ywlIG
 xL3OY5KlnQN1hjraomqyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i1Zf1INcGeU=:C4a4Sa+ceUmWK4KUgz0ckT
 K5vY03XIp2KDECByARZDxOPYMqKeBoKeZu83hc/TLOqv3n7qoMZ0G+fXucuIzHWrAXAc2PNZ9
 0ugcNVmiKR5bBKOHrPiaNaaoRP287eSufLBIE5F7HxtXT+ZRxqdcrTYq2KUJl5kgdwG5YqyRf
 AGfFDsdK3n0YOv+abI5foNQotLO79nP6GTUJAf9L2tcAOyycvTEymjLf/h7cAQMZUfZym1ReL
 TI4Rfy6jqNXC/RtCtVCgDVhoj5RbAHKaLw8NvX/Y6tyJmR4V9AR97W32upEiSmqueoErMW11/
 +Q4P4XwyQLOAhzNeKS7kgXgRQaWtM2Im6Vf6nhWh6urjasJM7mOyVGW16YLMxNiVLleNassTg
 eylc+0eeO7jdq8+KVc8gYCFeGjg67s+hhlWy9iYm0mTF0fjbs9OzcjzpvWlcM/W00FZjQDoBp
 +Sa5Wne2AAEHfgGGsdtQs30PrzrZNLuiAtBqKR0Y+jNILzJxCi5I9BFhBGIMBKQ7mWi0x7W2O
 1WYgt8N3ItWSZVlef/goXsPUiJ8L9JNIk6dZqXie73NwVDjb8aOtgRSPDg4aUFfTMJOWb/EX9
 kODn72tRxuSvUt+3ldNSpbZpLWHGqwnxLNPVjmM3O9XNJO7oduwmzYlyPyHiWIZoJ3y+lXxRl
 laVi/jYb0KVsJo6sh0PyQ3hmnUAqapogGY2pqCOLMRZmPk/gsvJ3ZgONXej0JrTf9f++k+tiZ
 kGSrhstETtcOH0xNnLYr9/7MAjEPd+ylNCfcMy3NvegwSivxjeprjY3qjk3upGNPbG//KaWG+
 XcdeIBe+zGFxtA8ob68mOdqSIQivfNswmkSt9YipqpBjkdZcONt3mSPUVx2FNKYdMZcWI7Mqn
 MCBdwv257w0cmlv3QoGQCOMyScjQ5u3a6QO7k7XK/QVotuDEFaFHJPOFfF4hx4ZOZuphgGs5j
 lXveg9sSdvQYPKjFRkPxbzP2C2khFHuJ3qmi0nw2rY7WmGi3sruuY0WA1e9byS3hUTnCGzTzQ
 76Nz3/NxgDY13R/zCdDTtWiGhVdqzdshwGKpfjZAZzQWFu6jPs4eZU2uILoQNTwpBSZQid3Ay
 M1mfWtVE0P/tpk=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 07.07.19 21:45, James Bottomley wrote:
> On Sun, 2019-07-07 at 20:44 +0200, Helge Deller wrote:
>> On 07.07.19 20:01, James Bottomley wrote:
> [...]
>>> +Palo allows you to specify a kernel command line, which is stored
>>> in
>>> +the firstboot partition.  The format should be kernel first
>>> followed
>>> +by an optional initrd=3D and then the rest of the kernel parameters.
>>> +For parisc system, you should specify a boot console as console=3D
>>> on
>>> +the command line.
>>
>> No, that's not recommended.
>> palo will detect the currently used console and add it automatically,
>> so one should NOT specify a console parameter.
>
> Ah well, I've got an rp3430 so its console name changes depending on
> kernel, which is why I specify it, but I can remove that from "For
> parisc system, you should ..."

The rp34xx series should work fine as well.
Can you give details, because I pushed a patch into stable series
which should have fixed that:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3Dbcf3f1752a622f1372d3252d0fea8855d89812e7

Helge
