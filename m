Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F5147C77D
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Dec 2021 20:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbhLUTeZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Dec 2021 14:34:25 -0500
Received: from mout.gmx.net ([212.227.15.19]:43901 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233313AbhLUTeZ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Dec 2021 14:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1640115228;
        bh=m+T324+PawvYBQSf3v0UUHS4w9rC1HtnRavNqc1VMd0=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=KHVY4HEfSDgJwVpr6sdl88wDdtKAdcZGLR3WN5xK3mkzkH6hMmVxIJx9BLPZ7fCeK
         BhKMB/fAP5i1Uu44EjxzSKQ2ROCT3t3e5CeqRuzeoFwXDSayNMKrJq3Xp2lS2f8YvL
         Hx+3USXm/I3XQ/hhKPLrXc2LOBrBStW0JME8MIqQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.148.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTAFh-1mu0Q83b83-00UY9T; Tue, 21
 Dec 2021 20:33:47 +0100
Message-ID: <04363b9a-64e9-fead-f183-1c0051765eb0@gmx.de>
Date:   Tue, 21 Dec 2021 20:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] parisc: Fix mask used to select futex spinlock
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <8186e8fe-1c64-c9fd-ca3c-f7514fb40428@bell.net>
 <5778770.lOV4Wx5bFT@daneel.sf-tec.de>
 <7ec01f4d-e0e4-b01f-246a-0185fe2d8111@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <7ec01f4d-e0e4-b01f-246a-0185fe2d8111@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tqOCuilyVe9NuKXHBG3tHuumpy9ZgbMKOkA1Z0Pbhzb1G6tUiGw
 6Ld+BwSsi7aKn5eZJcmG73uCd4/Y2NO0N5DnhLcxe5mDP7ZpQcRTu2dBWSrAYfkkOZ1739C
 BRnR3HHKsRsXJ7Am5HGAqEGHGLs4TMx3OnKV5PCNQzrH2gqxZ6kaYzqzoI3n5uVKklO8v0N
 rdEu/tpLX4uVw7y/CDfqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:s/VtPlVpFUI=:cThnNJ6oNYLEo1UOlOPrtu
 jpb3Zf/3I4j1dvV9hvqWYtcjc4ZkIkvo+dW8uA61tvGM8nstK5nT+g49P+RumGKSH2DVOPFwU
 +zwjsVSxWYBq4Kno2NF2HWeOpsdPIbAsYS7tvIfs6JgGT3Mh3xCXUbBW2SQ7WrqlxLL1RqpDr
 FfuF9fUXHzUAdbI9h7uPc06jmdmyxzEBbya8Na8W5wbV7YidE5XlWxKlURjt5j5onIhl3A8Hg
 JAtNMEmXkCFvL6EmKYvETa0sH8OlpH9fsT9ajIn6U+/qv0pexTntdBEsigGkgSYXNwljqCDZM
 6NePXbI0LF4NRnq8ewK62QQRzi8RoVItBPsVR+vcKh44qDeNqMcxpiN9bAZzoWbzemuqM74jp
 actfm7fnXkMCjlCrxQxo3GOe1xl24TrBeVY2qVxja6/r2XFDkgd3A8TG/MnF3LIWcUZSjDIVE
 vPUKr4uDcqZtuh2b3DcxTcnjK8QieLwHk+F2aKK9pL25+J2B5pDcJ7amghbB0WCGyo8XlLPHu
 HuiQzRChWR1lc3q0l+W6xvGmKp3CW8FEc7b7+Pt1HqKiJWS+GhZqeu8DYE6qujK0A9tjuEGnk
 DbFYo4oRWJ8SwcMILcIC1hjGxIf3CgJ2gjG3eM+AsZ8wWWbADdks195VtTU8b52cpeAlw19Rj
 zP+3WR0UmVxFCBSzrV+Gy+i83CmSFZuQ8F3N/o/szejsV2ACN08Vg9VJd5l8IF9SWTMk2Of0q
 88duFa3I/zmzCb9PQO85NKaJJlhKoh+4jIEOiPYPZEOzhnaJP0QlqOz32wnBZOje8/OLui8Yp
 leIER4C5vlgWVfzh23DhAGvVD0yAy1tESt4ezVk0M245462DoI0opIaccheaRc4JK0yqbEHPF
 T9oS9DY15ceTZIF0l9q0bk0RJoXI133g4d9TqJgeQaWQxj9VGOI8QyMI7t0WPXgWqvQvN0Hct
 eDOqXsAioPt0pkg/0HAqbHVHBqsgRWHPXeXaRr4anJqfbqtdPdFtQA8SD8mwGNck9NDlmvxoX
 jmBCy/nfYRS1q8teQnfFO/b5hQerQPxmHOCTAk5WeitI38MCr8qmJFbnopJYnoUJt/B3iQr7U
 UsDj+wnovZAxT4=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/21/21 20:27, John David Anglin wrote:
> On 2021-12-21 1:45 p.m., Rolf Eike Beer wrote:
>> Am Dienstag, 21. Dezember 2021, 19:33:16 CET schrieb John David Anglin:
>>> Fix mask used to select futex spinlock.
>>>
>>> The address bits used to select the futex spinlock need to match those=
 used
>>> in the LWS code in syscall.S. The mask 0x3f8 only selects 7 bits.=C2=
=A0 It
>>> should select 8 bits.
>> This change looks like this should become a helper macro or something l=
ike
>> that so the code will stay in sync. Can the mask be shared with the LWS=
 code
>> with a constant while at it so it will also include that?
> I understand the point but it's rather convoluted.=C2=A0 We would need a=
 macro for the assembly
> code.=C2=A0 Then the macro would need to be embedded in an asm for C. Th=
en, there's the shift
> for the int* type in the C code.
>
> I am proposing to rewrite this code so the spinlock pointer is only comp=
uted once, but Helge
> wanted a change that could be easily back ported.

Right.
I think this is a small but important fix, which I can easily push back in=
to older kernels.

See Dave's other patch ("[PATCH v1] parisc: Rewrite light-weight syscall a=
nd futex code").
There he rewrote the code anyway.

Helge
