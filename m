Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C556570A599
	for <lists+linux-parisc@lfdr.de>; Sat, 20 May 2023 07:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjETFLc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 20 May 2023 01:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjETFLG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 20 May 2023 01:11:06 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A36F1701
        for <linux-parisc@vger.kernel.org>; Fri, 19 May 2023 22:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684559455; i=deller@gmx.de;
        bh=Y0/5zMRnvdvzauPKdYx83NFel+82dnGtRQqqXx2M8Uw=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=m+e/mcAnA8l/V2wXygVawoLjaKHuKlYMerrSFzPfDQOOEoJ2idgtEcmU2tP9lTVPi
         YS5OXIIH5LKIKxjwrmFVALYze/b+rQPO+lkHJbKf2BV7pWYTshPkq1NgC3ZtZGpIz2
         BXevJ+cdhHMKJvmPAVo4y2DKfo2OUSQYAiOCCBWqQuTCAKHPkYKfZWSO/5wdy97Y/G
         f+p+KId3FhEEqrufLcV57GTqYWya59PGETRBXGkRJgcf+9dwVaycPC8LJp6plVG0fM
         Z9usEM78yR5btr0RemJjL0wGm1VdzTDSOHhhTTcwfjb90Uy5q3lF3hNMpaANrPEefD
         h3B2b4EuPHUAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.147.136]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzay-1paLzp1VOU-00Qz68; Sat, 20
 May 2023 07:10:55 +0200
Message-ID: <86484810-11e7-ea49-b093-c1c2144738ee@gmx.de>
Date:   Sat, 20 May 2023 07:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] parisc: improve cach flushing in arch_sync_dma_for_cpu()
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
References: <ZGJ8ZcPZbckX7VNB@p100>
 <4664024c-1312-64b5-5150-e60bf3fc49bb@bell.net>
 <7bcc14b4-408a-d884-a78c-b0436789e58d@gmx.de>
 <0c0a6071-d518-4d6c-17be-934e5f1a1199@bell.net> <ZGPEwk3JEc/skrBx@p100>
 <fe9e116a-a814-36f0-a4d0-fd5dbcb692f6@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <fe9e116a-a814-36f0-a4d0-fd5dbcb692f6@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PqKVZ25dG59RWo0tp+rw56ZG+fgohXPGb2JDpsJfJBcaa9GEmzr
 KZWDrNmf+45roUiGXmH3ktq1FjUhJnQk8Hika3navApo/Wdti/TBFXESZRhdUyoA3OQU0ow
 aKdpFMrBsh/UNPQlTDtcV5WKOQteopz9Wgs7uh3f0eDu9WGhBIYqAcva0TR5jIHKARh7SEN
 L8mRKAKUOahp4sTCmQMKg==
UI-OutboundReport: notjunk:1;M01:P0:9WHaMcKSXX8=;MxAm+0qb/Rk26VJmeU7ojCPYyHj
 kUmbnrJWAnQL8H0Qv5K/ZA6jry+iZxTol6kOOzvTn7vTO3ImcDXN1lAJ1msX6QlEG/l374DVX
 VyqquXDufmrcY8oe2hVdXYgPPpy/KrJStHhk1f+j1odinkDHLDD/+pqEer8WiKREoXBzNZywx
 s0UBfyXTjSUl4H8DI5pq7jWXSm8hlsibDyNcKHBuX0LmGxg9O4mtupmeeyXwqD5lzsuOK9ryO
 k7iGVANNoUv+mLoEPWIB81KbdfY8i0E1Li45wmXX/rpurr4VOGgYuMGgnfRs3HsbtsPVhiGFH
 y6sv4A2/WO062OyuWTazKUdgkE2+P/DdvCNJggEsevqW7UJfrNqWa2vOEKpjAhEhBok1yShst
 0LbUWCC2Lg3+b6xxsInzwUOsr2bZ+nlQzdxnKZgP0Uvn5dALC1SVF3D/CFqCawrMOROK8OFHi
 HRlHHMYiEFgDKVem13dUn59+9abLHsq80TGXgdu/lypnhvuBQ31d/i7gqE+kpkeThrsCSbWHq
 ++cHGRDZr7UJZ1eyyzGvVYh3XXpoGMNqImryDc5S7Zc4wDtnh54B2SC54G0wTB8Y70KAnnX22
 +hGByWJQvg1FZPPnyJEhkWOcbipbeQgCq6IV8TaZGsbX9gjAN+1k7Xj6giiTNyCOnsZZ0B/Wn
 r3b+CaRka/zlFM1lqRT2EbRFqLhbFpXyO6CdNIM7UxQCRh+Cr2tTEph1m3oTZkXDOuG5CR49r
 uwa/ewIBbZlmYTl8D69TCNG1EmJ7WPoi/u+thEMRTL2HC3oX0pq/rFkMIXgVnw1D7GP1XIfcQ
 Fcyh2G7FX3nAAvGVrZLAhiyhH9OtmNvewD3aMYw9E+Rpx52hOe/NlzjajNqPS9Or8tlc+4lUc
 JfqYYMU+lRkkvIf4N2OoeyMrOpUAAD9JtPrk06FxNtfM4NidVqyjFquObDYe302CpEsSwtpEa
 12l4QA==
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/19/23 18:07, John David Anglin wrote:
> On 2023-05-16 2:00 p.m., Helge Deller wrote:
>> * John David Anglin <dave.anglin@bell.net>:
>>> On 2023-05-16 3:09 a.m., Helge Deller wrote:
>>>> On 5/16/23 00:28, John David Anglin wrote:
>>>>> On 2023-05-15 2:39 p.m., Helge Deller wrote:
>>>>>> +=C2=A0=C2=A0=C2=A0 case DMA_BIDIRECTIONAL:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_kernel_dcache_ran=
ge(addr, size);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_kernel_dcache_ran=
ge_asm(addr, addr + size);
>>>>> I don't think flush and purge are both needed.
>>>> I'm not sure...
>>>>
>>>> Just to fully understand it. Is this short summary correct: ?
>>>> - flush_kernel_dcache_range: flush cache back to memory, but keep dat=
a in cache.
>>> No.=C2=A0 If present, fdc writes addressed cache line to memory if and=
 only if line is dirty.=C2=A0 It
>>> then invalidates line.=C2=A0 It does not keep data in cache.
>>>
>>> Next read loads from memory.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Next read fetches the data which is sti=
ll in the cache, thus the next
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0read doesn't checks if data in memory h=
as been modified in the meantime (e.g. via DMA).
>>>> - purge_kernel_dcache_range_asm: ignore currently cached data & drop =
any cached data in that range.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Even if cache has dirty memory which ha=
sn't been written back yet, drop it and don't write back.
>>> if present, pdc invalidates line.=C2=A0 At privilege level zero, an im=
plementation may optionally write
>>> back a dirty line to memory.=C2=A0 At non-zero privilege levels, fdc a=
nd pdc are effectively the same.
>>>
>>> I don't know how to determine whether pdc does write back or not. It w=
ould be specified in processor
>>> ERS.
>> Thanks for the explanation!
>> With that, I've attached an updated (untested) patch below.

> Seems to work okay on c8000.=C2=A0 Don't know if it helps performance.

Probably no performance change for c8000.
I noticed that pci-dma.c is only compiled on 32-bit kernels (for PCX-T mac=
hines) :-)

Helge
