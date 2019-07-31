Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 656657CD45
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 21:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfGaT5r (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 15:57:47 -0400
Received: from mout.gmx.net ([212.227.15.15]:56419 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfGaT5q (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564603062;
        bh=Vn/wty4CV6nsIrLPoi1zaNHFbRL8q4GbcE3hiRPJHIY=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=cYd86dCDaqsIwClwiR+HhQY8keLOFY6phuhTEZb88nDyjP553v/D2c0OPWZq6YCP/
         P+5ZkXCodUxSCcDlTW/WCIX/ndtMQ85iDWk1iRfHjCYUoeuqE7IPLizB6WDG3ppeVv
         HEtEmoOX/MYvFeJsLFMNorbxUpUdSlZo9XynsBA0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.24]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1iYZ4Q0d44-00fzIZ; Wed, 31
 Jul 2019 21:57:42 +0200
Subject: Re: Compressed kernels currently won't boot
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <1564591443.3319.30.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <b0b3cac2-682a-cde5-3a62-9aa8328431f8@gmx.de>
Date:   Wed, 31 Jul 2019 21:57:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564591443.3319.30.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GEbox2gJ+dzEe2dsTJqMBte0f3IzJ6erv5KyiZSe7ymWkihdy1j
 Cb1SFe2MutsQmkg4xvr3k6V4OBkU1fisSI3ySFjdkVh4Jb8hFZNjtEecma/mwqqTcvBZeQx
 iYs82SMNyiMJm/Er1JxwSRTEln5lYCi6vGPOXZQ+Z5es+TrQwrgCRYUC144FjK46T5y1usr
 axiPEwfZUBaL971+t0RBQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A83JpPdCby0=:X2Bvc7QOWR2WooaW1v+Y5O
 KtwCwmo+w4MdIqqD0RLscbXVAkODd3qocAMAwvVM1t6LHrAQNXMIhQaXlHCp2dWU3pwPSvwb0
 rkJHRan74ktKa1+G6WwGZN/SweDEF1PjrLkOAiEL3Wo5nTrNGN6Ef/0NFl7V7X1w8la+c0zpl
 TLu/2CmseB+fVdSxwEOeorwPky056fV4uHdKr14tnVMwvG/njbg1Gd5KBHFAJtXYPYrMgy37j
 xkCo7ZSriiNRK9SfpaXijxTC8a/wFZepGYLHyBEZ5l7WPnafAw/fnpAlo1AMqxiXKvPDpcYT/
 nuipKzoKrWPWl+pnT13HdGkdEkMomNi90uAd4IpNyFK5MhOl1hvaOem8yM5TxjdTeMASUN8rT
 uhZ5Hdpv9t48xhTd2d5JhTkhOIQBkozs7TzFdU9iWAXgQQWDrY00MkP4yXk6T8Ediz9J6f4mO
 LnjSNlL3wrjrwuOPYmL8hCtaALnUHl3F2mox2tWV5sVz3OZK3hIdJDH0dgWQPrNrmBc7pBi9W
 kmtNCrcs7SQy5woygwjKQCnLQIAR3B9htpVWghBa+JLxpLNzvnM+gh1UQe1FFsrZFxbOQRAbM
 Wi6NDI+Ru4Z26nCI3JQyKtPg6wR2UQA0bkXTT5Hg1XlK3malL6jbOk52x3BEV/+XUGUDasPXg
 DFItSwoyXZUss0wgMzWx/mPLTtRnQggNLeWBqciLd5aNXwGXnLXtWF5Segz6JumfxN43lCpyO
 OC52AY5L1T9PHF18zjqvlAJwHQQQcpSEWq9kEXjEPLuRWz5G7clWONSzIMnMUcvMNQaAU7ZIt
 d/K5LoxEGDz9YlRCMA9BR5QNMnu6ZZ0y9Mp14zWxrjeofwHyTqxLjsqaGtY4WOGPlEoxSncgf
 95asNPwOuF3u1svqVdkKOf+DSpzSySw4CZNAjf4wfkcWlrhMla1FcJ6o4hv9eRGZFXjKFUDJn
 4om1I2OpNFoNZwPFDLLJKQGaVgcV5dXCiIrCMN0t0VDBP9T4yE6T3SerQTB5CGjYzFMLpNLhH
 2tGlU2/IXJZ50h07gM5j+lzuwBjTSzWgGzPF+gqnD3okIll3LHHwmGXUaj7JE3QSIYxOIYAQC
 z5bzMLRNC7v53U=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 31.07.19 18:44, James Bottomley wrote:
> I noticed this trying to test out compressed kernel booting.  The
> problem is that a compressed kernel is divided into two pieces, one of
> which starts at 0x000e0000 and is the bootstrap code which is
> uncompressed into 0x00100000 and the rest of which is the real
> compressed kernel which is loaded above the end of the current
> decompressed size of the entire kernel.  palo decompresses the head and
> jumps to it and it then decompresses the rest of the kernel into place.
>   This means that the first part of the compressed image can't be larger
> than 0x20000 =3D=3D 131072 because otherwise it will be loaded into an a=
rea
> that decompression will alter.
>
> The problem is that a change was introduced by
>
> commit 34c201ae49fe9e0bf3b389da5869d810f201c740
> Author: Helge Deller <deller@gmx.de>
> Date:   Mon Oct 15 22:14:01 2018 +0200
>
>      parisc: Include compressed vmlinux file in vmlinuz boot kernel
>
>
> Which moved the compressed vmlinux from the second segment to the
> first, which is what makes it too big for me.  This patch reverting
> that piece allows me to boot again.

There are two requirements:
1. Make sure not to use too much memory for "old" machines. Otherwise
you won't be able to boot a compressed kernel on e.g. a 16MB machine.

If you move the compressed data behind where the kernel would
self-extract itself, you double the amount of memory required.
I think with the patch below I won't be able to boot my 715/64
any longer.

2. Old palo versions had a bug which prevented the ELF loader
to load sections above 16MB. So, one needs to keep everything
thin in the low memory without extracting over oneself.

3. There might have been other reasons too, but currently I
don't remember :-)

I believe the the patch I sent for arch/parisc/boot/compressed/vmlinux.lds=
.S:
+       /* bootloader code and data starts at least behind area of extract=
ed kernel */
+       . =3D MAX(ABSOLUTE(.), (SZ_end - SZparisc_kernel_start + KERNEL_BI=
NARY_TEXT_START));
keeps everything bootable (on low-memory-machines and with palo ELF bootlo=
ader bug).

Helge

>
> diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boo=
t/compressed/vmlinux.lds.S
> index bfd7872739a3..5841aa373c03 100644
> --- a/arch/parisc/boot/compressed/vmlinux.lds.S
> +++ b/arch/parisc/boot/compressed/vmlinux.lds.S
> @@ -42,12 +42,6 @@ SECTIONS
>   #endif
>   	_startcode_end =3D .;
>
> -	/* vmlinux.bin.gz is here */
> -	. =3D ALIGN(8);
> -	.rodata.compressed : {
> -		*(.rodata.compressed)
> -	}
> -
>   	/* bootloader code and data starts behind area of extracted kernel */
>   	. =3D (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_TEXT_START);
>
> @@ -73,6 +67,12 @@ SECTIONS
>   		*(.rodata.*)
>   		_erodata =3D . ;
>   	}
> +	/* vmlinux.bin.gz is here */
> +	. =3D ALIGN(8);
> +	.rodata.compressed : {
> +		*(.rodata.compressed)
> +	}
> +
>   	. =3D ALIGN(8);
>   	.bss : {
>   		_bss =3D . ;
>

