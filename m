Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A54224C0D
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jul 2020 16:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgGROv5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Jul 2020 10:51:57 -0400
Received: from mout.gmx.net ([212.227.15.18]:50243 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726611AbgGROv5 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Jul 2020 10:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1595083905;
        bh=cJ1OG1hTwQyC5mzafMwVQg5rXs8YW6mbmR4v36w73ig=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=gt6CGW0gJgpFNrmUHMB+3pW6JdvaeO8W96/5rmnM149JUGay6uGXkh5Ax1OaBExHA
         rlFXfGbIQ53K+uGF9k3xYFxf3gIlGgJtgL7VZ2yjEeB3doKlEIfiQwFCkO7w7hPbKN
         HH6QPRSfdIP/4azkRZHSSuM0lsxYSF3L4y5Qvr0w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.179.241]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ3n-1kJkXM0XSf-00WJ57; Sat, 18
 Jul 2020 16:51:45 +0200
Subject: Re: [PATCH v2] parisc: Fix spinlock barriers
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
 <7e4fa270-7fb7-d726-da01-7da04f109747@bell.net>
 <d5d093f1-8e7b-24bc-2f72-215381821043@gmx.de>
 <6257f3f4-d5a6-5a70-0152-80156470bb10@bell.net>
 <7bf9267c-1151-ea8e-bb86-fa846f3a7d4e@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <280e42a9-5b6c-5117-0d21-5b4f27ac5a67@gmx.de>
Date:   Sat, 18 Jul 2020 16:51:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7bf9267c-1151-ea8e-bb86-fa846f3a7d4e@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gFfAN+H9pLlfNPiHvbbK6AG8WJTkh/6GJFeF6AM3hljJonVvCxA
 Bs0F2iNzIdXzXsCnwQItnSib4Scas3Hvjmu3iBLVVIIhNfLx0FHY3pHsKFWP157KiKxNHYa
 DxEhlgyQnjQOJKkrs6IRW6akUk0flx6D/G7Sl6CVwnVQw+mjW27ZwP7wwqu7ou9VCgBoci3
 8tC1TXp8/G8PCTba0GEEQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IX0SCqHoROQ=:KA15blPkp7UIQS/4g/uuHA
 ZdRjVp6DSxosey2tpPePZbQ5F+fYLadCJOdXnKnKICG0P04UD3lFcz9B4f3FEc1cBFQJzoxrm
 xnIYltwzYl5wnJ9TD9J1W9NZTyT6lIYoul1kkO6btCyJI9ak4NxocHZJxdx4iag000gwpKnah
 5/mSIT4epM3jT4DyKw4eULt+u7LBR7JjMvtRUg4rD19z+c/vvNHoT5OUeqLcuLXh/JbemudBW
 xu+s72O1MTw8Hubt1ig3otBu9sG7LcDR8C4m6TiJGtRJLzNUmJgV1wixzK1H+0kBab/mHJax2
 tOMtkHNNEQcmQ0ubJ1uuyVFUvOEyZNDXOUBIf8mhZ29jomuLRfEVG53BIuv30sxqsHr+4z5ix
 iD9Gles6uPc2nyjRnbzQDHyzmV2yhv8yEbr9cyNOqnM4wmm7D4Qz4rrYq8BxZE2amAkQ1rp9v
 FXOM98BwPCsqFpsJxR9pJEoSsgyi0cYYogNbEBVgsSK/5SQyrvZAUPAoR6M4DBRFROym98H0E
 TukoKolTxQGibvS7D43EIV6zkNLWFJsr11bIvZ3hXc2q8uliY8jW8c40BiM1S5vR+ShOBtk5V
 XfgTKbUJHi8F1OpWrKFEJLC+rO529D9QGfjKFLKyNtl0Pt3dfXaarnl3GPKzjO67KfNdCVhgK
 fOcV5GABxTIU9g6gEp/y1IcS2p2TG7So6VXzuEHu3qN1VsBUyQWkQNS1NBUWK9H55hrJA9ehK
 MjtCkpdAcnjv1qhatQWCo1h4ONysnJWI8HnMPE25tDA8tSulV4o2p5Dxd5ShSJLduawgeG7P9
 bAYuw3b2ffYV1rCDuHf45f+ZxZr6bIXGyqqRZmtvmY7UiMd3N7PN3vOc3SpAIgRY8YeMw5SzD
 CSmnk5B7khz/GaQHK9adEmaYgqBobrj6gMQLrdRa/1Ld95/WD2HDv8PHIVBoxSYssQdcPwRbw
 n4Vbj/lfKhFhaMsHpgBEKDBrSZqysfg4cNISNx42fnKSy+D7Bp9J0jts/VRWhzUV7GFTCvHfm
 xxmSeVEBfqcmwgom1B040WurNpidSwXkW8UtJ7alSt/Vy9RTNbPa3TtQE89dwuowlvOfm0MTb
 SbOS0hX+p80qrA7mXAcmul3B0D+W90U9NanHhyu0G3QCWqe9mpAvIJ6Rsf5g7763WUiI8kxti
 XYQhW0/Woh+Ky6suI55IK3mDNIwptskDhDH2X3mij1vtKgCJ2d98GLid1sut87dzkTiSrSBqK
 tSVYla5L4EAvbudJn
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 18.07.20 15:48, John David Anglin wrote:
> On 2020-07-18 9:08 a.m., John David Anglin wrote:
>>>> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscal=
l.S
>>>> index f05c9d5b6b9e..4ba43a3c7c67 100644
>>>> --- a/arch/parisc/kernel/syscall.S
>>>> +++ b/arch/parisc/kernel/syscall.S
>>>> @@ -659,8 +678,15 @@ cas_action:
>>>>  	/* Error occurred on load or store */
>>>>  	/* Free lock */
>>>>  #ifdef CONFIG_SMP
>>>> -98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
>>>> +98:	sync			/* Barrier */
>>>>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
>>>> +	nop
>>>> +	nop
>>>> +	nop
>>>> +	nop
>>>> +	nop
>>>> +	nop
>>>> +	nop
>>> I think you should put those nop's before the 99:ALTERNATIVE() instruc=
tion above.
>>> That way they all get replaced by one jump instead of multiple nops (w=
hen
>>> there is only one CPU in the SMP system).
>> Okay.=C2=A0 I'll test.=C2=A0 Thought the replacement was just nops.
> Do we know that a jump is faster than 8 nops?

I don't know if it's faster.

> We need ALTERNATIVE conditions for the barrier defines.

Yes, that's Ok.

Helge
