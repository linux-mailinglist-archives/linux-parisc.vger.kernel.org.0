Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A28A52DF65
	for <lists+linux-parisc@lfdr.de>; Wed, 29 May 2019 16:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfE2OPp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 29 May 2019 10:15:45 -0400
Received: from mout.gmx.net ([212.227.17.22]:34147 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbfE2OPp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 29 May 2019 10:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1559139306;
        bh=Rq7oObVF7PbBU8BCo/pmurx3OjQKoIDTsbGxtlW2Dy8=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=cjiDkunAUr6yN5sZFn+h6RqPz0oraBvTeDB9fwihj0PwLpbNGGY7rZ3UkWGCV28BY
         bPSZmQ3HLKjpJte3SKfH845+Cinv8QlHFIRZsHa0DzIPaqBz8mn9hWPU69xsUMb/zo
         aQicZ4Af5c4atCPiOqOlUFU2fNR67QR4BACIAp4U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.134.91]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJmGP-1hCXaq3m6j-00K5Pe; Wed, 29
 May 2019 16:15:06 +0200
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <20190528153815.GB16860@t470p.stackframe.org>
 <674f8b61-e897-f657-68a2-648babca00be@bell.net>
 <1943613.tnj53yOHQY@daneel.sf-tec.de>
 <20190528173922.GA32192@t470p.stackframe.org>
 <f782e9cd-0824-6c29-09bc-986813dd1e56@bell.net>
From:   Helge Deller <deller@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=deller@gmx.de; keydata=
 xsBNBFDPIPYBCAC6PdtagIE06GASPWQJtfXiIzvpBaaNbAGgmd3Iv7x+3g039EV7/zJ1do/a
 y9jNEDn29j0/jyd0A9zMzWEmNO4JRwkMd5Z0h6APvlm2D8XhI94r/8stwroXOQ8yBpBcP0yX
 +sqRm2UXgoYWL0KEGbL4XwzpDCCapt+kmarND12oFj30M1xhTjuFe0hkhyNHkLe8g6MC0xNg
 KW3x7B74Rk829TTAtj03KP7oA+dqsp5hPlt/hZO0Lr0kSAxf3kxtaNA7+Z0LLiBqZ1nUerBh
 OdiCasCF82vQ4/y8rUaKotXqdhGwD76YZry9AQ9p6ccqKaYEzWis078Wsj7p0UtHoYDbABEB
 AAHNHEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT7CwJIEEwECADwCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEE9M/0wAvkPPtRU6Boh8nBUbUeOGQFAlrHzIICGQEACgkQh8nB
 UbUeOGT1GAgAt+EeoHB4DbAx+pZoGbBYp6ZY8L6211n8fSi7wiwgM5VppucJ+C+wILoPkqiU
 +ZHKlcWRbttER2oBUvKOt0+yDfAGcoZwHS0P+iO3HtxR81h3bosOCwek+TofDXl+TH/WSQJa
 iaitof6iiPZLygzUmmW+aLSSeIAHBunpBetRpFiep1e5zujCglKagsW78Pq0DnzbWugGe26A
 288JcK2W939bT1lZc22D9NhXXRHfX2QdDdrCQY7UsI6g/dAm1d2ldeFlGleqPMdaaQMcv5+E
 vDOur20qjTlenjnR/TFm9tA1zV+K7ePh+JfwKc6BSbELK4EHv8J8WQJjfTphakYLVM7ATQRQ
 zyD2AQgA2SJJapaLvCKdz83MHiTMbyk8yj2AHsuuXdmB30LzEQXjT3JEqj1mpvcEjXrX1B3h
 +0nLUHPI2Q4XWRazrzsseNMGYqfVIhLsK6zT3URPkEAp7R1JxoSiLoh4qOBdJH6AJHex4CWu
 UaSXX5HLqxKl1sq1tO8rq2+hFxY63zbWINvgT0FUEME27Uik9A5t8l9/dmF0CdxKdmrOvGMw
 T770cTt76xUryzM3fAyjtOEVEglkFtVQNM/BN/dnq4jDE5fikLLs8eaJwsWG9k9wQUMtmLpL
 gRXeFPRRK+IT48xuG8rK0g2NOD8aW5ThTkF4apznZe74M7OWr/VbuZbYW443QQARAQABwsBf
 BBgBAgAJBQJQzyD2AhsMAAoJEIfJwVG1HjhkNTgH/idWz2WjLE8DvTi7LvfybzvnXyx6rWUs
 91tXUdCzLuOtjqWVsqBtSaZynfhAjlbqRlrFZQ8i8jRyJY1IwqgvHP6PO9s+rIxKlfFQtqhl
 kR1KUdhNGtiI90sTpi4aeXVsOyG3572KV3dKeFe47ALU6xE5ZL5U2LGhgQkbjr44I3EhPWc/
 lJ/MgLOPkfIUgjRXt0ZcZEN6pAMPU95+u1N52hmqAOQZvyoyUOJFH1siBMAFRbhgWyv+YE2Y
 ZkAyVDL2WxAedQgD/YCCJ+16yXlGYGNAKlvp07SimS6vBEIXk/3h5Vq4Hwgg0Z8+FRGtYZyD
 KrhlU0uMP9QTB5WAUvxvGy8=
Message-ID: <61253aef-2571-f8bb-756a-bf2018e533e4@gmx.de>
Date:   Wed, 29 May 2019 16:15:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f782e9cd-0824-6c29-09bc-986813dd1e56@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c8XS9a7ceqywHz9QKIn7wPf4gmuED6SqPnJz9Y/n9dTJiFKWn0J
 gzAJd/Wqv3rYTygXkbWUMTYEKJWsl0gWXf5drMaPfmTVD75J2E8kbiTrAiS3XfPQ6514vBC
 0/DJtkGAOFCCPqiPwFHzhh7xN8JzlLvujW1pQPDV3zxJQxWxiewOjff7yH9ajJG3QKzRBk9
 1vHt49BgzPO5iTtij+yUg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+HjgOU7T0Hg=:jwFhSUPWtc52do9LYRoUET
 aRYN6i6kIaOxKK6HndR8cNbDCSgzP+jKoABjXbFhe6mLF0lLBQn1NBmN65lsVpsdWAJ9xkhhZ
 7N7UMi6dEhq9ucs+B2Z8LUAlc+0pokOaRqmGYhgpKPWXkD4LWeJXUIyH4ga3EXmkRrucXJ+fQ
 lG0TvjDG4DKkExajW6peilfSEnyTFGsDfAyQKoA1xhQTosSBcUvdPllg9sgcVrc3yF4phnPZ1
 hKV7lVMOX1PD9kKUrnbgUGLh0nUSVzB5xo8UPmAopkPAsuiEYP27W5KtQndxWkFkBVupk80cF
 1LVPHwPpdbEp0qXkrKlntVS2ca65RKEfz/p0dQZFQEL34ig8cXkUIlrdPEJ5Q1zSSHAw/Mtwq
 se0hSiwigFuwd8wu4FIynv2tB+2wh/8de7IIsXKJinbX/cIaKcrHaftNO1A52kI9lEyKn3Jgy
 Mqvg8oE0O4rLAdmje4i9NtavR5Yh9rUlBj7Ifh3xdibFmcSNEKp1faxTbCa2Jv776/wwHFuH5
 R2BkEjJQ/oinWXJu+57MOzmDiBqFjbHnPTo7rDTTj9LJXs3e7XM569tfdGgDoI659LhWyTsGz
 mB7NOasLzC/WNXiKfGMh+tdxjMZE85TghBf1dy60aIaWiBpJMTIew8qA/LV7+9olO+Pf8MDJU
 yN7LH7p/3ohqNUEDOZoMOWOtTyKiRD/PG2MPnGyD8tt+VkCxHYP9RQCFvs5hWRaY8asVcqbfj
 JVpNVZ3bk3EUZF73iqeQtcG0Wr4Kq5mffXfibOpv5WFfG6NDN7Uw2EaIrYQ0052SXaBC4J/Tl
 EJWNXgt6tbTHJ4I8eRPuKRxyd6OXxJ1/yo9pKoESvT7G0oCasnv62uQKCBR+Aq0nR8gafNbkB
 DTMHAkeO4GkoPmSwsGugtlh34ewfvnYrmbOzSWy86P9LmQmw2VNytRLTb1fpFATlVEfyMaTO1
 1LBOjwnxoiBRo86JZ/kF270WXSpRwT6bwg2Vr+nACEVy/neRCip1Q
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 28.05.19 20:40, John David Anglin wrote:
> On 2019-05-28 1:39 p.m., Sven Schnelle wrote:
>> Hi,
>>
>> On Tue, May 28, 2019 at 07:24:29PM +0200, Rolf Eike Beer wrote:
>>> Am Dienstag, 28. Mai 2019, 19:06:48 CEST schrieb John David Anglin:
>>>> On 2019-05-28 11:38 a.m., Sven Schnelle wrote:
>>>>> Interesting. Now that you mention it i see that my C3750 reports the=
 same.
>>>>> Google returned the following page
>>>>> https://support.hpe.com/hpsc/swd/public/detail?swItemId=3DPF_CCJ7002=
0
>>>>>
>>>>> Which is 2.0, and only mentions "C3650/C3700/C3750/J6700/J6750 firmw=
are"
>>>>> So maybe these machines have NP set, and machines "below" (like C360=
0)
>>>>> don't have it set.
>>>>>
>>>>> I wonder what happens if you try to flash a 5.0 firmware to such a b=
ox.
>>>>
>>>> From what I see, the "C3650/C3700/C3750/J6700/J6750" and "HP 9000 Mod=
el
>>>> B1000/C3000/J5000/J7000" use different firmware.
>>>
>>> Which makes sense as the former have use a 8600 CPU, while the latter =
have
>>> 8700 ones.
>>
>> Exactly. And as:
>>
>> a) All C3600 PDC versions clear the NP bit
>> b) All C37XX/J5000 PDC version set the NP bit
>>
>> i don't think there's some bug in the PDC. I would guess that the patch=
 Carlo
>> reported to fix issues is just hiding the real problem. Would be intere=
sting
>> to run Carlo's Test on a C37XX.
>
> Probably, hardware cache coherent I/O is not implemented correctly for E=
lroy based systems.
> https://www.hpl.hp.com/hpjournal/96feb/feb96a6.pdf
> Does it work on C360?

I slowly start to get confused...
Just thinking about another possibility: Maybe we can rely on the value of=
 the
NP iopdir_fdc bit only on machines with >=3D PA8700 CPUs?
For older machines (which would need opdir_fdc) HP-UX or other operating
systems decides on the found CPU.
This would explain why it's not  set on Carlo's C3600, and if Sven's C240
(with a PA8200 CPU) doesn't has the bit set too, then this could explain t=
his theory.

Helge
