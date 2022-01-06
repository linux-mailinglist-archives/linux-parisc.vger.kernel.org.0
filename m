Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A44486933
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Jan 2022 18:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242433AbiAFRxt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 6 Jan 2022 12:53:49 -0500
Received: from mout.gmx.net ([212.227.17.22]:58251 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241987AbiAFRxs (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 6 Jan 2022 12:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641491621;
        bh=exHKsgYsSeVEw2Xqgw1RPv1SpM1JAAbPwtRWZ57D01Q=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=YG5MK0nDotEbO9URVsYk8f9Walcjyh/nedxW8rwUkelxJxars6WwQqtoJMsaEyRhs
         CJWf3Oa9Iwrh3UiTnPj6Rf1JG42glChyZvC7UvIBWQCazpj8PZ1NHgjKkUSjwhIo4X
         7Cj51LBreyvBGfeImx1nxgvl6lJw9UUmOSs5w46s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.152.191]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLi8m-1mo06W3shM-00Hcip; Thu, 06
 Jan 2022 18:53:40 +0100
Message-ID: <0216976a-a383-7707-d94e-3b3b827a5bf3@gmx.de>
Date:   Thu, 6 Jan 2022 18:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH, RESEND] parisc: io: Improve the outb(), outw() and outl()
 macros
Content-Language: en-US
To:     Bart Van Assche <bvanassche@acm.org>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-parisc@vger.kernel.org
References: <20220106172900.122992-1-bvanassche@acm.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220106172900.122992-1-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hg7OuaLsd6ukG3RjcNUAFRs1tDpvFeRusD2macPXlStVs8s4FSi
 yRxdcenhJKe1wNq2oKBIU/Aly3iBFrGGPBSbar52kzgmgbbOAykCtVFfouEFq19Bzg/SxdE
 rA6DXukz3KrW6odhVhNnv45MXL6pUd6tiqsYYc8TOmLAnaLzmxbOJ/ALRfT3i3aVS+qwox9
 MSmpYT+Q6CJx8dI5vOQZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dpEfd6GnLu8=:2HWxz9UySfpd5sm/vo6zEu
 4fox9xFg2e855UpsURVI5uFE8ysJmZu/TNOKsBQrDjXPYXWeAUHXG0mO12CYz7nlhXe9BJ6/n
 hKE9eWhyusnEXj0J4M7Youwm8wNilFTDNdpaOu678hIjsjoyeh1HMrNSb+YMWhg1nU8KE7weS
 eBqtDjKf+6j3T93mbYYmJXU4e3I8N4/0p1It6lxVthWGgQvxEOm+26kpHzwDXiGEho3ZTsAPB
 MgCRH33+dVDbNefVRi6AdRPO7lh79FTBcX39T37tQVFdAwsdSVsacylz+Q6+JEIbAGTSLyWOt
 FwqA6uuKQjxdR/GudUs3w89wXeiI4F6W93mozC4AY+4IdKflPQKVkoOSFSQai6DGgk4Mw0BvX
 5OQP7+IWmuO9pK5ukBCr1jOp+xwPcvhm8LVzQqo7TXxEijqmwN4WcRwQR3bSNBpYmUcBk+WaR
 oii51E6o06YO69DWCaD6KrQ2wh6HnrUhCmAgLwQEuBB89xEH502ol1Behhl6Jp7DIJYucz60Y
 SyzR9fYnh+UXoHdyrjtuU3/rXy1dqG6ROtdXRPZ4trO6k9ByYMVaX+Q6ZDotxJddZsP3nIe2I
 E1tXEIQzAH6Z3oLybJ/DJAvZTkT57+BrTK2Ck4joBVufuyo8bcG/NJQLiyMmhFAHv4KdbFpDL
 CgsghalyBSox4gClg6ovzWyPVWWQo4fEuH3ZdqfaYFhg/A4E1Z7QCxVwpHlv3ShtRpfzBPYCG
 6fklUDO9vcrh6DSeFhCAbLfC2P8VU0ei2mhuZyXCAkXCc3PhwiYYEBImr/IBN1ToEIV4tZ7mC
 djb9zNHUZfnvR3AKnjn8W2cMxVPnEK8OIqgSLthNnahPhTH0aeid2jK/i2cWQjIXaD4eJRBbx
 JHuFP2H8F+E40W8VzOgze2+qXuVdsL5LVeI8pfBpmj97ZS5xnlTO/41ZYKZJM/4MUfyq4Ohar
 MMEvvOEpLfVPbHBkOLHokjgR9u2K5ofOzh8fQEUCGNaDZEkKMiDe9X7QRCnzA/IEtlEoJ/oNJ
 YFg6T9U6adoAaFDdxfqJ4lAiU+Yjt61CPlI4dvXip9zfnejOh0ftxfMahwjbxeABT8I5OfpCW
 xawftZqfWakMKk=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/6/22 18:29, Bart Van Assche wrote:
> This patch fixes the following build error for source file
> drivers/scsi/pcmcia/sym53c500_cs.c:
>
> In file included from ./include/linux/bug.h:5,
>                  from ./include/linux/cpumask.h:14,
>                  from ./include/linux/mm_types_task.h:14,
>                  from ./include/linux/mm_types.h:5,
>                  from ./include/linux/buildid.h:5,
>                  from ./include/linux/module.h:14,
>                  from drivers/scsi/pcmcia/sym53c500_cs.c:42:
> drivers/scsi/pcmcia/sym53c500_cs.c: In function =E2=80=98SYM53C500_intr=
=E2=80=99:
> ./arch/parisc/include/asm/bug.h:28:2: error: expected expression before =
=E2=80=98do=E2=80=99
>    28 |  do {        \
>       |  ^~
> ./arch/parisc/include/asm/io.h:276:20: note: in expansion of macro =E2=
=80=98BUG=E2=80=99
>   276 | #define outb(x, y) BUG()
>       |                    ^~~
> drivers/scsi/pcmcia/sym53c500_cs.c:124:19: note: in expansion of macro =
=E2=80=98outb=E2=80=99
>   124 | #define REG0(x)  (outb(C4_IMG, (x) + CONFIG4))
>       |                   ^~~~
> drivers/scsi/pcmcia/sym53c500_cs.c:362:2: note: in expansion of macro =
=E2=80=98REG0=E2=80=99
>   362 |  REG0(port_base);
>       |  ^~~~
>
> Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-parisc@vger.kernel.org
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

applied to parisc-next tree.
Thanks!
Helge



> ---
>  arch/parisc/include/asm/io.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
> index 0b5259102319..837ddddbac6a 100644
> --- a/arch/parisc/include/asm/io.h
> +++ b/arch/parisc/include/asm/io.h
> @@ -273,9 +273,9 @@ static inline int inl(unsigned long addr)
>  	return -1;
>  }
>
> -#define outb(x, y)	BUG()
> -#define outw(x, y)	BUG()
> -#define outl(x, y)	BUG()
> +#define outb(x, y)	({(void)(x); (void)(y); BUG(); 0;})
> +#define outw(x, y)	({(void)(x); (void)(y); BUG(); 0;})
> +#define outl(x, y)	({(void)(x); (void)(y); BUG(); 0;})
>  #endif
>
>  /*
>

