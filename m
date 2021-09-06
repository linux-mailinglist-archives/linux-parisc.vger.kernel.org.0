Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A924020A9
	for <lists+linux-parisc@lfdr.de>; Mon,  6 Sep 2021 22:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236274AbhIFUSP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 6 Sep 2021 16:18:15 -0400
Received: from mout.gmx.net ([212.227.17.22]:36817 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229717AbhIFUSP (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 6 Sep 2021 16:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630959419;
        bh=rc1JPdJzjP3+7O+ipFiK9Jt5bmTFQmAxWikqy24t040=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Dv7TvVCNAyYB7CeQi8PEDZW/r11grwXhXGGG9TA7RPhAnW1M+sw0Aot3WUROykcja
         XjUuoL7gr8cgkknYzMUFXC4KV4iE+KBioVWEr10F0JoF1iUG63PxI4gWfikZXi1IVm
         naJhUxChoSEw9nyNBvldUU/5foBooj9YWZ9XbjZg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.85.61] ([80.187.112.14]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9UK-1nD6I3213M-00s4uV; Mon, 06
 Sep 2021 22:16:59 +0200
Subject: Re: [PATCH v2] parisc: Fix boot with kernel v5.14
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <YS6VGsZ7fZtZeu/i@ls3530> <YTDaZAMvAipdvkaB@ls3530>
 <CAK8P3a0zwnEUK_ztPRBx0H9VGBoPVY-+aASFV97zSKrL=diXUA@mail.gmail.com>
 <51d6b8cb-a64f-0cf7-1545-4c2fee89799e@gmx.de>
 <CAK8P3a3oJo496dXpAWHQKG=Sdr+RSfScYbWKyGrk8HNfH5G1CQ@mail.gmail.com>
 <41e38a49-5a11-4f93-6771-b67d8184a673@gmx.de>
 <CAK8P3a0Tzi8L3+7YypPMukjDM+D8a_dxK1q7fOK357LATsouoA@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <97c68f9c-b646-042d-a865-1be9b28ed24e@gmx.de>
Date:   Mon, 6 Sep 2021 22:15:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0Tzi8L3+7YypPMukjDM+D8a_dxK1q7fOK357LATsouoA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ya1SMfNYPTMpRAsZmCi7kR+vXVUP5wDF0uuWO1KdSZhVANaDgCr
 8wl+QdL3fMr9UMLsngxLLQSSUqNXrz3AHwOKKF9dJGM2fvaBPz7QyLOmwp1Fq1leeyM2iId
 coYTL24Ko3I+gF17AubnMPLOUajjW8CzSU8OIXUUneBdJKlc1KbqIyC6ERUGRyw3+pdzkKZ
 QvLEMNi+WOfVOH/Frbe3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DkQshkg6P8w=:hqLlPgzAFI42BvqaMzPBSK
 2D7anDfDgbk4AAz1rF3AtSZybLXnHTgkPlZmf3MSnTgc7QWyn1dcDP7noHzOGNyhm81f1fMf2
 2aCluF92ePtXC+VX6CDrxJSGg5Vfd97oX4MBxSvY04QClnlZ1d3ONQc2Iv8oqj0WZ3saSF62S
 SR81j/dldc1L++T3ypLah+9SsHmblp11X4XsZiJJLJxd9Ir3PV0hhSFSMU3QmA294xPvsPuvp
 mDWim1I+MKM7tSE9e1COEJ/92zuo9264hheUY/0MIvCvPGWVV+DDZjVuWqUBFESSgnnDAOrqC
 cce74XVkwk+Ih4r8HMpc3ZQ1Lm7G8I027xWXvTMIXOvLzVi4OU05+Qkoa83O/WA9RchzK51uL
 crWqKR6XXA1MTIVddUjVll8y0pNFV+Ekod83j3Phf+GmQ56CI1mE84RQHR0zpohj6atDDv4YA
 ddT0HrZpq1Emo/7MDIzIN/M9Fk3QLzvzU/AgT7d46qfzzQSPbqcUgF2xA1U6TO+TbZ3q45LQG
 vFApq1rLCOLcLQfc/j2pXZpC5t0Vvr9OGmMFCj1o4vB8yWR/zpHAHPnaNZjADHcyTfbd4ByrO
 HEvnmLRQeytddQ53XPm1MJCWl90DwCjSxesTmgEHKXRiYXfBVt3PNMt3e5r8102GqgsCJ5Hwq
 hT6XZt22AGt/FRtfHAkI1ypX0FTX9pRCKAzy+Z3Bf+7O5lpC9KWffjoG32LKHL0MeOheFjaK0
 PXhtAmDko2V7BpAhT6sGs5U3IQm9t63iKlc21PsB2KuPomLRN94sL9sLFE7+NHYBRQaHVSZt/
 y3nUQ3cUKHMg5UCplo1aGjGR5REKnhBDTkVdzkfgD5xNjMmoma8xna+eG1G74vb0TSZjiT+u7
 n/g2ex6U+JCm/thvO7awO8Vxl7Uy8uhsR8k5faMvTgWvj5BPdsNVjyzwq+I1NCmrezgOF4PpE
 U5++BqrGLB0cO55vWm6epc9lPHDOoFIGQQwoGU03St0A6RW0tpBMWaUSWA1NVu2AqBtMqdlvb
 lOKR2BhQ2QEulBtitQJH5xnsfaDnIbClHubbz8AHDRhLi+zuMwP/DEabuAFw48TQvWp3Fz2fD
 itVQCDg5Swan2MU3MYD2YOv17MjvHiG/eR33MpLAPjuzwbDZqHiTbMKrw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/6/21 12:54 PM, Arnd Bergmann wrote:
> On Sun, Sep 5, 2021 at 11:40 PM Helge Deller <deller@gmx.de> wrote:
>> On 9/2/21 10:41 PM, Arnd Bergmann wrote:
>>>
>>> The reason that the "output_len" access breaks is that gcc explicitly =
optimizes
>>> the bytewise access  into word accesses because it assumes that global=
 variables
>>> are correctly declared, and that they are aligned according to the req=
uirements
>>> of the ABI.
>>> This may be surprising and even unfortunate, but I can see why they di=
d
>>> this optimization, and that it helps in other cases as well.
>>
>> Arnd, you were absolutely correct and I was wrong.
>>
>> It seems to work nicely now after I changed the output_len variable to
>> become an "extern char".
>
> Ok, that's a relief, at least my patch wasn't the main cause then.

Yes, that's good!

> Changing the declaration to 'extern char' of course is still incorrect, =
so
> this might cause other problems in the future, the same way that the
> old declaration caused the problem by decaring the wrong alignment.

Possibly. For the current use case it's enough.

> I think declaring it as an array of four characters, or a struct with re=
duced
> alignment would be the safer choice here.

Sure, I'll change that if it becomes necessary.

> Ideally however you would
> change the linker script to insert a
>
>      . =3D ALIGN(4);
>
> before the output to make the variable properly aligned according to
> the ABI. See 'git log arch/arm/kernel/vmlinux.lds.S' for a long history
> of alignment changes we did there.

This here is a special case and it's not just parisc.
This happens when the linux kernel gets compressed, and at the end of
the compressed file bzip/gzip/lz4 and such gets added the size of the
compressed file.
See in generic Makefile scripts/Makefile.lib, line 392ff.
During make then this happens (for lz4 compression):
  { cat arch/parisc/boot/compressed/vmlinux.bin | lz4c -l -c1 stdin stdout=
; printf \\350\\044\\232\\000; } > arch/parisc/boot/compressed/vmlinux.bin=
.lz4
which is then later added as binary input to the linker to generate final =
file.

The printf() is the one which is then read afterwards.
Changing this isn't IMHO simply possible or useful, because gzip already d=
oes it that way
and it should be compatible independend which compression algorithm is use=
d.
And if I'd change it I would need to change it for x86, sh and um arches t=
oo.
So, for now I don't think it's worth messing around here.

Helge
