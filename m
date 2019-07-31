Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50EB7CCBC
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 21:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727411AbfGaT2k (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 15:28:40 -0400
Received: from mout.gmx.net ([212.227.17.22]:39003 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbfGaT2k (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564601318;
        bh=qdWLW2oRMhFlhYSsQqaqt42UzFbZh7hB7wg8CphwJI8=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=dRrXjZMtrrIXrMKVCb1vNGC/T1yXazyOKuE8qCc6HQvjhmiPnDY9VkS0SzvnpLQ0h
         s53XcfLm3R5ghDhOZqUv74kBvFWKEi9BaJCVhgp1W+8Ol7MYjLxYLPnu0p8J1ODMXI
         0sTKbFLZGvVKJ+y1QYxh5yrua9We+0c187V/aIBQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.174.24]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvcG-1hoQ8z3ZOi-00Uqky; Wed, 31
 Jul 2019 21:28:37 +0200
Date:   Wed, 31 Jul 2019 21:28:35 +0200
From:   Helge Deller <deller@gmx.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: strip debug information when building compressed
 images
Message-ID: <20190731192835.GA14352@ls3530.fritz.box>
References: <20190731171923.24155-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731171923.24155-1-svens@stackframe.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:AFvJNSFC82/pWIJM2ePZ3qDAWfqSMK3lEg+P8yGhu+azxq5Ytk1
 Y5/w9XBpN6sXIYrezu4ppjwkGo0dJskaNX49XzYR/cuRjrPy/qAcV+YP6n9vFHpGJFiutF1
 jULahmgclZtqTJljcZG2ecX+0GZtlxb1o5gNmgDNDRUaoHIhECOn6rTISXodCNecZJQXfDh
 0m/O+5OTFAxKRJ0LUhoUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:O9M2yiCy1+A=:Agj+aadTwSCcEZ1O3Ik4n6
 iLxGW676Ah/Zxy5iPEfC0ChJwwh0OHFNmOS/k32QtJ9+j31J8rp3ObuCSb3kBlazWtnlkNrsk
 x1JsqpxdOlkSL62UtCMJHpcwtagr87YiA6OzTTjXoYqh2Jd/LOyxzSKTAsmfcmEpGWVhTPhJD
 HUqpKdtLJQVjv860R0ky5Y4tIfcom6RjH0IerIIsIZloDSPMJ3G77/sRDDN/JBy8QKXf0aemM
 QKVIrTs0uWBU6Z4fxzqwTmZZ6I5u6Cnh8sG+ONQ82fkzuRgAkikoq8NwDOVtFaLXc8kqtqTYB
 D3wrv7oWUDDBqi5NnF3yJjVDS+m/MNImosv4BWDkzUeuNRETYcqriI01eeVszF0yRvy4bWgbG
 RLoEZSIkrY8bV2+1sn+unx4A97z5bJOXqDkMLDKuOyFi5CkabN/LjvjCUunsJ66CgkXVUjDjL
 K6fADkKpNICFAR1iWXz6ppHwHcILm4uRDW7WtJJwjxlUWIPo4rD8pObxhuGZ52trgy9CxAyzy
 hqPwtBRyao/xqG9ZD4KaLyNPeyu9Xe80ZSlBmSySIBTxM/x7MLhq/uMG5MhM6n2B+myIB7uZ6
 AvUBUOs/EpHcwK6qTfXXCflW89kqwmICMAJYMifXPCceEAwEZ+4d2TyC6Mkr3NtRrxekyhQat
 L9CW8l1GJKfd84nLY2opRA+RFU3xBf7KhPiuTp4L7MGTqtk5Z4VdCtSKZ/mXPgAhC+wMwcyqt
 OrKm6bXBDU0v6/v4dqhRlZLkV8/KQUtvZT4L31SXH6aD2ziWVrSh87M4gr1GglH3gnDyKeuzJ
 xDW0lrRJOvWprZ20c4VdaG/5gt/p3Bk8BGJ4NXqs7N+KAopLmEd0g0yq/346S1RfnIUxszuP9
 6pdFBo2YsnZOQEEVsTCBIi0ydz0DMm4mAARpE72bQO6AJbiY4Axf+HyaqgK4ba2n2JxJTG4MP
 6YUHH3PRkdmXMT2BQqYaegnC5ezmIeV4pCVq2ffojegldFvCGXEQxm6hoCm1Henr0ldYSR73b
 w8hsP/F+vGyW3eI9FJaNUGuL5BEIKGkVg4p2BtXC+VDEyDoLLStYEBEiluNpwNqiOg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Sven Schnelle <svens@stackframe.org>:
> When compiling the kernel with debug information i got the following err=
or:
>
> hppa-linux-gnu-ld: section .text LMA [0000000000e78000,0000000000e7b41f]=
 overlaps section .rodata.compressed LMA [00000000000e0078,00000000015ad43=
d]
> make[3]: *** [/home/svens/parisc-linux/src/arch/parisc/boot/compressed/M=
akefile:28: arch/parisc/boot/compressed/vmlinux] Error 1
> make[2]: *** [/home/svens/parisc-linux/src/arch/parisc/boot/Makefile:17:=
 arch/parisc/boot/compressed/vmlinux] Error 2
> make[2]: Target 'arch/parisc/boot/bzImage' not remade because of errors.
>
> While this might also be fixed by adjusting the linker script, i think w=
e
> should strip the debug information when generating the compressed image.=
 This
> reduces the size of vmlinuz/lifimage from ~69MB to 6.6MB when full debug
> information is enabled.

I think keeping debug info is good.
Can you test this patch instead?
It converts a 141MB vmlinux boot file (with debug info) to a 32M vmlinuz f=
or me.

Ideally I would prefer something like
  . =3D MIN_OR_HIGHER_THAN_CURRENT_ADDR((SZ_end - SZparisc_kernel_start + =
KERNEL_BINARY_TEXT_START));
to avoid the ifdef, but I'm missing the linker script expert knowledge...

Helge

=2D-----------------------
[PATCH] parisc: Allow building a compressed vmlinuz with CONFIG_DEBUG_INFO=
 enabled.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot/=
compressed/vmlinux.lds.S
index bfd7872739a3..dac000ec3861 100644
=2D-- a/arch/parisc/boot/compressed/vmlinux.lds.S
+++ b/arch/parisc/boot/compressed/vmlinux.lds.S
@@ -49,7 +49,10 @@ SECTIONS
 	}

 	/* bootloader code and data starts behind area of extracted kernel */
+#if !defined(CONFIG_DEBUG_INFO)
+	/* ensure at least max address when compiled without debug info: */
 	. =3D (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_TEXT_START);
+#endif

 	/* align on next page boundary */
 	. =3D ALIGN(4096);
