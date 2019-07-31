Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6647CCE2
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 21:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730948AbfGaTgH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 15:36:07 -0400
Received: from mout.gmx.net ([212.227.17.22]:44681 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729851AbfGaTgH (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564601763;
        bh=2thnIsCfw3kfPZ6hkHLhDXEx1ZkkCHdvkcvdOW5ks9Y=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=aESDlE7W/riA3QBnyJgRlWzffOGkNpqCAnyJi/HSeyC9fK8tJcA7ePsmk8E7T6oCa
         neZDtpRCKY9DN4EwWV2bpaXdDCjLHmsqpEvLEO5fjWYBoPHg+wzc6mSj213+w802Qq
         O2pt1+hULHeL48bp/b3irKZKlJgF4B6eQZDvyInk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.174.24]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LeALI-1iiRA71Clo-00pw5d; Wed, 31
 Jul 2019 21:36:03 +0200
Date:   Wed, 31 Jul 2019 21:36:01 +0200
From:   Helge Deller <deller@gmx.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: strip debug information when building compressed
 images
Message-ID: <20190731193601.GA26551@ls3530.fritz.box>
References: <20190731171923.24155-1-svens@stackframe.org>
 <20190731192835.GA14352@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731192835.GA14352@ls3530.fritz.box>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:YsD5+sYbcHwtjpYL0p5TmXjTd+t5tf+xTbC17wtz0Rwn5NR9KAe
 DEomsoOnh4ynMNVSsrFqc9fxjCrjMbFurpCixmbHcv8cC5kFROjcPT7rMhwTypDlOaK4s6b
 i2uhAeFTzLH4fCYcL3s2xTLvLJP3/LUdZsdpUM9x1h9wzMRGnhVnHBSMwEbPvUz9g6UnSQm
 56gRWX1HT2tQ0fBZcdjxg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:unDLY3h86dE=:CG6uzGBbPh/+P0/K+ffhmw
 O6/huquZJ2iJqDIsUKbGRhQM1pJZ4T34dD6/toswWqKQLK01wAE/3ZulyyIN+QGE51Kpy5vb3
 Voh1yAY7CjlgCinBsNWxoyQffY5H+8dmUCJPtShrSp0hAfn12YvTjjSUz5juGtjlJBRROeqAU
 A7pf4PFVJY5R+4bSZsmeZG6K6x7pZ7vwVU28qCwNgLOdOwljceg3ZmbZf4i+LBUQhCyrS8QLl
 AmIMf59lykQb7OYbak859ah3XGZiw/uvKlqY/f5xeSdUS4NvHWIcBGpm0q4TUSdgpU7JpAID9
 tASHZBeoxc+xxBRAPd2TG2PG5+/02GliowTPvet55ZtP9XqEtKPuY8rUDbbd8TRkA6ZTvXkRt
 +lRG7zVwVUrhznvFPCUaSiG/MGaSWFm3Vgb83OwMJfAyZBAtaWGuSNS9fuG8MCMRrWpM1wRlT
 pLdBdT7mDTR/6wFivYqWq8yT/tyjcKrrWzrN191RcCZBdja+mqo9oRjDDN+8atErYbUm+SpC5
 ssUegZjUfk28rZqwphFziMOcoRIdixzR1VdtU+HyoOkMWRtoytXadnMr3dQh+VIvOugfMvK5a
 KdbQ47D+xXr6Zu4G7202oJdKePuNsrxZQQJey1rTkuPs/TpSKCrXAk9tdua/PBZj1KHJ03IGA
 Sv1xiR+jgTHlUMKKOifZWljtkCHqOncRwKK8csj1THh0mDksHImwQQ8fMw0o2vXV5gcRd8+f3
 vXb6KB5hfWuM7sHE4wukrETKTM7xiRuJ0nv3ZOCTrHAJ72UtkJZuSV/+/iflcEMUeqsTZTtsV
 NhReku0DPkoTnhdjWXgreD+KiuZYcqeKMTqIieEyKWFPVKWpIjYoDI83T0608mTWgQd47I1cQ
 qoNsI0MvJz3RYGITy4Ohk8QrXimgtyu1Z35wQSW+IBVISoqMjsExLKOBn8MZ4n4XHnFt185WD
 tS+4brR2rDsztVdG37IDJ8UgMsZ7DwPYUEQc6H5ty3I3HROBoBbHq85WTuB2XgiLv0ZArwi/q
 npIplqDKCwzClKqfMUmgJNoKiM8uB9qGl7Nj4MXz+xZbVQJV6YnNugo/C7phZpaZ9g==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Helge Deller <deller@gmx.de>:
> * Sven Schnelle <svens@stackframe.org>:
> > When compiling the kernel with debug information i got the following e=
rror:
> >
> > hppa-linux-gnu-ld: section .text LMA [0000000000e78000,0000000000e7b41=
f] overlaps section .rodata.compressed LMA [00000000000e0078,00000000015ad=
43d]
> > make[3]: *** [/home/svens/parisc-linux/src/arch/parisc/boot/compressed=
/Makefile:28: arch/parisc/boot/compressed/vmlinux] Error 1
> > make[2]: *** [/home/svens/parisc-linux/src/arch/parisc/boot/Makefile:1=
7: arch/parisc/boot/compressed/vmlinux] Error 2
> > make[2]: Target 'arch/parisc/boot/bzImage' not remade because of error=
s.
> >
> > While this might also be fixed by adjusting the linker script, i think=
 we
> > should strip the debug information when generating the compressed imag=
e. This
> > reduces the size of vmlinuz/lifimage from ~69MB to 6.6MB when full deb=
ug
> > information is enabled.
>
> I think keeping debug info is good.
> Can you test this patch instead?
> It converts a 141MB vmlinux boot file (with debug info) to a 32M vmlinuz=
 for me.
>
> Ideally I would prefer something like
>   . =3D MIN_OR_HIGHER_THAN_CURRENT_ADDR((SZ_end - SZparisc_kernel_start =
+ KERNEL_BINARY_TEXT_START));
> to avoid the ifdef, but I'm missing the linker script expert knowledge..=
.

Here is an updated patch without ifdefs:
Helge

diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot/=
compressed/vmlinux.lds.S
index bfd7872739a3..2ac3a643f2eb 100644
=2D-- a/arch/parisc/boot/compressed/vmlinux.lds.S
+++ b/arch/parisc/boot/compressed/vmlinux.lds.S
@@ -48,8 +48,8 @@ SECTIONS
 		*(.rodata.compressed)
 	}

-	/* bootloader code and data starts behind area of extracted kernel */
-	. =3D (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_TEXT_START);
+	/* bootloader code and data starts at least behind area of extracted ker=
nel */
+	. =3D MAX(ABSOLUTE(.), (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_T=
EXT_START));

 	/* align on next page boundary */
 	. =3D ALIGN(4096);
