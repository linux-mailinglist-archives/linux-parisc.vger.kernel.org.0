Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AB8427D61
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 22:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhJIUki (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 16:40:38 -0400
Received: from mout.gmx.net ([212.227.17.21]:38477 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhJIUki (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 16:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633811918;
        bh=2fBI2AxTjTZk/gTKtsHiC8jXdsYfYKqwuIwowY11te0=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=VvLUzaBpVPi8XQOyuBhptlk4tSxk+V36/I6Re1rXivKO4u8C2pPuVKYxyQNzBMr+r
         2MxY5/29snMc22tTp+idjUpGk7EPAMAWPznrpNbp04/h3NFz7+zrTbDSDHLlk3dtre
         wtHSx0AdSvt71aYm4mzve5gVjwOI077cPFU8ZVW8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.158.18]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mof57-1n5pah1DhZ-00p6J3; Sat, 09
 Oct 2021 22:38:38 +0200
Message-ID: <dd823436-2558-a7f6-f440-571c65b776b5@gmx.de>
Date:   Sat, 9 Oct 2021 22:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/5] parisc: fixes for CONFIG_PREEMPT
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20211009182439.30016-1-svens@stackframe.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20211009182439.30016-1-svens@stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2XVCsM6X73gO+AEqLZG95hcm+WvmWEaQeYT9gFwP/LnSXjp7krR
 aLlPEXfcFobbrpfezGfzBvRPFiH/sENTwNM7n7eBfsL+wh/dcRBwZ96UzRlSAh6uDP9e0tf
 5MiPu8QZICAy9KBq7Livay8+w3NjXBmNVVcej2Y/6TXsXUU4+nG/oBiR5upIIxZHDVc0P8v
 GGZu2scrS+x2yoZ3CbMoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F7L/EbVOPxo=:jcoYCVQ/oK31ZvGVNXhctF
 /vj4W22zQOFVIfIL53gBkqkcqe9PUboOW+b9yfSRNMaoRCx0YLSgFGKtde0yF1oUbEiKKAerk
 oBTRQyKp4q1FHY2Mtc8Qzxodtw+5mh8gMsxuMTlS63EudIWD+EXQeAVMpeHr/EFuA85C5L/jh
 qE1kdMVVOy+VrsTMKa9tXbw0Qzir6d/PKehU9BK+T4GHMzq2fcYo2QLz9HB0abMTkhFKwh3/4
 fQXAoHOkymdXG32Z7vv6CYad2t4EENoxv7xFgUZCq4hd/1SkUl1LatAjq0zJFTveXLeMXJweg
 GbAvsh9vHLNlW4fLyUlsyqZEuc5oyNZ9edSmYo6NUkAvHRfK+n/WO1OZxQUgHE2lpohz7MCIf
 v0y8JFZqHHN94b2aZ+TMHuQVYYcKBb5gQuu/n7Q7BKtaJA8uc4jxfFkC8M2qtkzTh5QJKBU3K
 +QFzPUh/gLJyRccvOJsXhTtw6NfXCuUixAaoAXIkH+ME8OM9V5rTmt3IWikGHbmXzGcCi5Dar
 FJG7my3Qn3ddhA5wASgUW7dCj/5xXvnBZqio671ujE6Cb2zlWGcwSOuIvVODDctoCCtaahNgg
 1n8fWK7c79KiZs1u3ve4lYC+hfV1UXghSr6UkjylEljbCdcWDmCNZF1JZtAi3iao3tMtpoY+z
 0xezDLDvJNbZFRlMCNt0+4UBRkWAErfgZ/0zQsbB8QqqwKlSkHCuuN7ut5ACNJoEwrS6eH4Zn
 oJvps1hw1b9seekvVsIHnG6/2EkaUK4f/bJwof7+XskUy0fxtstm6ay+za3brfunaEgRYs5Vb
 F3DkVkpK+hfMSJn71YDHtbM3IrbOoNMtJZtJcsnPG06vhG8WB914PTJAOBYeSPaPIVVpTBg0f
 ndNOgfmyjwTD57MhVOmoVQjk5KPZ6wNy9eEeOvD4YH6di4g4SFu0Mow8SOKWoleN8uFo8Angz
 WaF3yIHwhAAP005Ynw0XhiJo3HuyW5OKzIzPwFjeMarWfNvTyD0C/kV7rv5OmIxQUHQG7R+n1
 TEHYcuJF4ZpSJAw3pA35WH2Wru3u1nR/KoIEOfHXU9KTueKMq7I0jLSkO56KKFvkii5eCmPRb
 0nKpDPLO7z3Mp8=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/9/21 20:24, Sven Schnelle wrote:
> Out of curiosity i enabled CONFIG_PREEMPT on my c8000. The kernel didn't
> even compile. After fixing compilation i noticed a lot of segmentation
> faults - usually a few processes crashed already at boot, with sshd the
> most notable one. Most of the time the processes where crashing with a
> DTLB or ITLB miss.
>
> With these fixes, i was able to compile a linux kernel on the c8000
> with preemption enabled without crashes.

Thank you Sven.
I've merged this series into my for-next-v5.15 branch:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/lo=
g/?h=3Dfor-next-v5.15

Helge



> Changes in v2:
> - also fix flush_cache_range(), also extend the preemption-disabled
>   region to the end of the function, as there's also a tlb flush in
>   the last for loop
> - add patch to deduplicate code a bit
>
> Sven Schnelle (5):
>   parisc: disable preemption during local tlb flush
>   parisc: deduplicate code in flush_cache_mm() and flush_cache_range()
>   parisc: fix preempt_count() check in entry.S
>   parisc: disable preemption in send_IPI_allbutself()
>   parisc: fix warning in flush_tlb_all
>
>  arch/parisc/kernel/cache.c | 87 ++++++++++++++++----------------------
>  arch/parisc/kernel/entry.S |  4 +-
>  arch/parisc/kernel/smp.c   |  4 +-
>  arch/parisc/mm/init.c      |  4 +-
>  4 files changed, 43 insertions(+), 56 deletions(-)
>

