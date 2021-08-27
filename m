Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881B13F97C6
	for <lists+linux-parisc@lfdr.de>; Fri, 27 Aug 2021 12:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244492AbhH0KES (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 27 Aug 2021 06:04:18 -0400
Received: from mout.gmx.net ([212.227.15.18]:54339 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233121AbhH0KER (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 27 Aug 2021 06:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630058602;
        bh=2qOljDdP3SK4uxru7u6iNbtgVlZcIcOOIS8O5m3m4gE=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=S9U8afcuL8mg1TB6eIerrVavj24QsA+mBXzpZr6H97I7N+iIMfFQSW4KvkPUoFmKf
         qN0sF7xUUJYNu11wMsdOIvIdY5qwoKhe/tZMqJmGroE+9y/u4Ke6OJSdnHzi2Ruun2
         3Izpi5FQg/q8ta8qQLSMnlL6ah7P35yHBC6vvCWs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.133.192]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1n6fDF1P2R-0153dk; Fri, 27
 Aug 2021 12:03:22 +0200
Subject: Re: [PATCH v2] parisc: remove unused arch/parisc/boot/install.sh and
 its phony target
To:     Masahiro Yamada <masahiroy@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org
References: <20210824154820.293290-1-masahiroy@kernel.org>
From:   Helge Deller <deller@gmx.de>
Message-ID: <0b2be22d-b2d8-f243-b5e1-c7027a5996a8@gmx.de>
Date:   Fri, 27 Aug 2021 12:01:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824154820.293290-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/YwvbASipWdw6dITpUAbj1BnFt6c5mI1vxdQh81azwtMHH3Eo1T
 85t8O6LNVIdoqcFZlwv5A7Fj70DRnhdWIvm0LXEI4F/Uayt7JbG5T95Pt0jJSW/o9RLWBdZ
 w+22CH6P0QK6UeLUmE9ENuDP/NN4lP+I+x1UwSR3KMhOsojqioCRWKj94+J7Xyd+crSi+tL
 1zMguMhMW75OroMQfaUTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nx6FjQhoy7Y=:C1EPw03iQJ8L0aqPKDETBA
 fTXBqgir1zgHNN0XQne/wP87MRhr5dm7odfYqjRc+0nxu6s55WcM9kn6EdJ9H1B3lp8566uS7
 72p+7TccB2VVZnASeQEusecrXer39Txhbcy/FDRmqT/WaeKjicWU1kM82zGF14tmX8w5F52VR
 6tZYgDICW0XotH5uxaxAVGVweoQbdv9e9ZIdtuHBAAGfTyvJsNly54Mr6xCkglQgkhmN2CXEW
 fYm/W1AsAYwxYOR5IMPJZfKpo6J1KYWT4wEB13wP4zJwd2ceJRBkx8z8da8NVj1sXKhLbraAf
 7mc1VrbEoXO75xMJ5eh/Bi4Xta/LfWm4FmhykmHJmRZjdD/VpEHi63mAkVaGv0mk1uDm31l8K
 imoK2yOuxXXp/ojQ4aVadapE8RrOJ5csUbTpvpRQ10dToGrhoz5Sckcv57WAL2aASEClOT5FW
 gU18bG2g0yx9hBczzfsm/ack6m6SJUOmlZTi/v9EIX0KLdxDLvf1NxwfwK0alPyvpVjtUzprI
 lujp+FY8efafVJLbyjEU5VK7S0CAmcygkH2fuFudmHeZYgek4x/gxkPva/MG3AT4bSdeW34L1
 dTQuZKU7lNPR0ytoVqHQ3sCZjx3WP1y7fUhb5xsOln60Z41goftlC+ZpI5p/e5ZFRIjhN2wVC
 AzGQee1j9VSXksH8QtFkZKx10r5RJ1B+vTYVcasKha8Qw28Ttk0MDNu42WGwKmE3XPBm5u26S
 JBEobuUwOaQnfOwZBk/uf2OS9cbU3bo1ZNYoX28lE6uIAiTJ9ZAgMTry4vrBuOUsopQb/NW95
 JmgtopT3Jsg5F4GNr27+Sneh2D1KnEEItG6DcivtbrQ6MIoTtHdZ9j84h8rTL3ad8K+bBV1rd
 AozoMUA0kdpEySLWPAwdC6h3OW+u9sn/P8+VkNojq09Ggv5vsXVzuH6YXKeGWBQOCzJlW6mPt
 SbQnrdVu1adW0wX02ed4d+TBdal4HqA1JHmctHH+CNvz2638gvn8iTG6bfieYeQAd6zisfd2S
 /npvLovzm4c4K11QqS4FFUGv9w7e3TxPI+98VWJnCmuynu54bWVavbtb9uYQOuef7QG1v0Bku
 B/CRZ/Y6fzhPh9oKL+Oqq9UidQLOhprS32j
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/24/21 5:48 PM, Masahiro Yamada wrote:
> Parisc has two similar installation scripts:
>
>    arch/parisc/install.sh
>    arch/parisc/boot/install.sh
>
> The latter is never used because 'make ARCH=3Dparisc install' always
> invokes the 'install' target in arch/parisc/Makefile.
>
> The target in arch/parisc/boot/Makefile is not used either.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks, applied!

Helge

> ---
>
> Changes in v2:
>    - Remove arch/parisc/boot/install.sh
>
>   arch/parisc/boot/Makefile   |  4 ---
>   arch/parisc/boot/install.sh | 65 -------------------------------------
>   2 files changed, 69 deletions(-)
>   delete mode 100644 arch/parisc/boot/install.sh
>
> diff --git a/arch/parisc/boot/Makefile b/arch/parisc/boot/Makefile
> index 61f44142cfe1..b873ee4720ca 100644
> --- a/arch/parisc/boot/Makefile
> +++ b/arch/parisc/boot/Makefile
> @@ -15,7 +15,3 @@ $(obj)/bzImage: $(obj)/compressed/vmlinux FORCE
>
>   $(obj)/compressed/vmlinux: FORCE
>   	$(Q)$(MAKE) $(build)=3D$(obj)/compressed $@
> -
> -install: $(CONFIGURE) $(obj)/bzImage
> -	sh -x  $(srctree)/$(obj)/install.sh $(KERNELRELEASE) $(obj)/bzImage \
> -	      System.map "$(INSTALL_PATH)"
> diff --git a/arch/parisc/boot/install.sh b/arch/parisc/boot/install.sh
> deleted file mode 100644
> index 8f7c365fad83..000000000000
> --- a/arch/parisc/boot/install.sh
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -#!/bin/sh
> -#
> -# arch/parisc/install.sh, derived from arch/i386/boot/install.sh
> -#
> -# This file is subject to the terms and conditions of the GNU General P=
ublic
> -# License.  See the file "COPYING" in the main directory of this archiv=
e
> -# for more details.
> -#
> -# Copyright (C) 1995 by Linus Torvalds
> -#
> -# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
> -#
> -# "make install" script for i386 architecture
> -#
> -# Arguments:
> -#   $1 - kernel version
> -#   $2 - kernel image file
> -#   $3 - kernel map file
> -#   $4 - default install path (blank if root directory)
> -#
> -
> -verify () {
> -	if [ ! -f "$1" ]; then
> -		echo ""                                                   1>&2
> -		echo " *** Missing file: $1"                              1>&2
> -		echo ' *** You need to run "make" before "make install".' 1>&2
> -		echo ""                                                   1>&2
> -		exit 1
> -	fi
> -}
> -
> -# Make sure the files actually exist
> -
> -verify "$2"
> -verify "$3"
> -
> -# User may have a custom install script
> -
> -if [ -n "${INSTALLKERNEL}" ]; then
> -  if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$=
@"; fi
> -  if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$=
@"; fi
> -fi
> -
> -# Default install
> -
> -if [ "$(basename $2)" =3D "zImage" ]; then
> -# Compressed install
> -  echo "Installing compressed kernel"
> -  base=3Dvmlinuz
> -else
> -# Normal install
> -  echo "Installing normal kernel"
> -  base=3Dvmlinux
> -fi
> -
> -if [ -f $4/$base-$1 ]; then
> -  mv $4/$base-$1 $4/$base-$1.old
> -fi
> -cat $2 > $4/$base-$1
> -
> -# Install system map file
> -if [ -f $4/System.map-$1 ]; then
> -  mv $4/System.map-$1 $4/System.map-$1.old
> -fi
> -cp $3 $4/System.map-$1
>

