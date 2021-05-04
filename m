Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77353730E2
	for <lists+linux-parisc@lfdr.de>; Tue,  4 May 2021 21:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbhEDTgZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 May 2021 15:36:25 -0400
Received: from mout.gmx.net ([212.227.17.22]:38531 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232153AbhEDTgX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 May 2021 15:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620156912;
        bh=MhF99iUbOVHs7xfjC0V5C02iXA7xw2GgNnWLAdTqJL0=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=eIsDoKp4ZyQ4bxwTr/yGBocpZxgn4++CQz23AnXiB6MDWGDUQA1ANQ/3eZGxHHp8P
         XtVxzMLkMoJ8leITuyG+l4Gyc1JixYWCCdZlAoKZibIDJaesFNIEyV02O9BkXnU1sc
         SsN82Bt6EoSqWLDVRj/GHW7wk2AkK3HvwkqesyhM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.6]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDkm-1lKAaO2LN2-00xa3Q; Tue, 04
 May 2021 21:35:12 +0200
To:     linux-parisc <linux-parisc@vger.kernel.org>,
        gentoo-hppa@lists.gentoo.org,
        HPPA porters <debian-hppa@lists.debian.org>
From:   Helge Deller <deller@gmx.de>
Subject: Donation of a HP PARISC machine?
Message-ID: <dc034df5-04f8-a9a2-80a9-297545355753@gmx.de>
Date:   Tue, 4 May 2021 21:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:IbyZl7DwB5do5th3RmXisNIgpS4Gh35OcowTCYbUprrcNxUfCMQ
 iv2NRYGar7wEeoe2pExKJWr8QYH0y8AVV0832PTnHsYVjGj1jNnu4ecmbqdG6+lqs9KXg73
 fo4CwPaPVcFbUHZD375RYLgAVxP2nFJX+uIt/JpMwPoUx+AI0Qo+7z45Sji6RnJrpLYIlft
 +iZnKGB5F6JszItajiXzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QVGctdbTAX8=:XfJayBt/CEzkeryVoDGU4+
 GFEE+rW0g0bG+y0Fm066uZTxdtWgr71URjRpvvvtklee+dxXHqufjGaAHCwLQtwEf7DbmMn10
 0vZ//q+IG9LrKeDY6wAwSR98A5LrcqYZNMbAui64CFVXW56xPrK7BrRVJENkoKCWq5rsh34a0
 Hve7cCOgOchVT3+tTRK8jj22lX6smDEgB7OhOLfVMNnbSEku972TntCtl5lU2l4A4kgdfhHFw
 N7F3/gbCR8bKDEH9yisZpOHWctf32fUlJZzZq4iMTn4f/KMWFKKx+9Co1Xcu0ItFZfyTd0qQw
 kfuHO81nlqGJOWmJj2h32YSwYpDfxfequ89LVn0mw8Hs0wTCRBRYHjKnxQK5SEwUbzk56rydC
 /icxo4d/3At0mX73SKsdwNikagnNtBZBCEnVoHLvdDSIwPqa21L9lrOR78goB+jJH979v3Vg4
 K2wdkSeakjlqFObgQzyVqipbLqTS1J4PfuWFcoyYiJLg6qpj2J1TQ+u8Zbsu+ZHWM53yW0xoy
 zLaqpDkenHLUZiID/mJ57ZYr7CqxHFpEsC8jHPKqavxPI7xJ4WsjS368a34uLIXRqOW+SP94y
 re22PRdYG9fLHPrUq58A3ZQpcyJGUiLseGTa3xEILN9AEtZmQQ/HWZarV6hzjwp2FugJg8C8e
 ISRkbSuK2X0r3v8hRCNJ/uqR4qrSItKOGizK67Ib/wGjpqV0q1Kh9nC0yY5DqlJVFN4bsk+EH
 j8I/Ixkms78mY2gNS4auLOx8mvoI/NEKxYIhi9RJw5anzvEgf51Fm8kkYBJmo5yVhx7qmQS4X
 q1jbs6GSSTIib48IizJaIysYMPYkUjOYB1X4tdJrGFZYLQCWAUHrwHjQSiG08bEcV4jhbo0Os
 mYS91YO0oHVq2N8cZDA1wCtuzQ1XwRG5grtdA0LGvyEv2WjYjuTXUeRmMvWDtkuv3MF6FICSg
 Rqm8WFllr6adNmNuwoI5HFyM7PtxZHoEEHsyz5GcYop9P6jaQ5emGmnTJJUmCD3SVK73C5IQ0
 a/Le7mxMK6EF5swYTMXNDJIHXmdYFIkp5UjSP1MAXjLw+yvWvAlY8YQ14wmnbM2KrRYMGSVLu
 mWhNdnw6Mh8XFQwrUyZQ4tCrZz7tFsSY9H6CsyhLbYuAVffLqL8ekHuNN1Sz/flpMTwCs8dAg
 qAxl6YIyRoAPOZQTPCz0GpKJ8iL2KEdhYVibdfKwmzUD5Q7n3smDqzewGUaJOaKogDRLM=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Dear PARISC Linux fans,

Sadly the power supply unit of our main PARISC machine (http://a500.parisc-linux.org) died.
It hosted old mailing lists, the parisc FTP website and was building debian packages.

It was an old HP A500-44 machine (rp24xx) which was sponsored by HP around year 2000
to the PA-RISC Linux project, and hosted since 2014 at OSUOSL in the US.

If you own a PA-RISC server in the US which you would like to offer for free to the parisc project,
now is the time to stand up and get your name mentioned on the PA-RISC sponsor list!

Helge
