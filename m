Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D00D17CCEB
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 21:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfGaThm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 15:37:42 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:33628 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726268AbfGaThm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:37:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 919ED8EE12F;
        Wed, 31 Jul 2019 12:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564601861;
        bh=x5QOBSA4xszi1a6dbXI/YhshZORd0jP0DPhRKkwELqE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=kOmMEMVL+fEp8PJJ4GRvYyKwmUjCGEXODctpz7iZtPfqd7ywK3H5RdCED/rnU4uJQ
         Qz36kUWaEbzPI/bPvkpRTQIqBOg8Ar0NkELS6pOQHr65IVR2Dz7ulsKzG43805vNpS
         DXJbCDZIqUqY62GC9ZScPHXHd1PiwzbqJl1A3hR4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 04NgCuu2f9a3; Wed, 31 Jul 2019 12:37:41 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B77C88EE10C;
        Wed, 31 Jul 2019 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564601860;
        bh=x5QOBSA4xszi1a6dbXI/YhshZORd0jP0DPhRKkwELqE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=IPddmm7qPQoynWR6NmsTGhC9A9r+/2Z6hNNwO6N7jZbzqRqDR/rqkXKTffX2QQbQp
         3Oi+9fpvtUcrCaQRRZmnhqbFNafeV+/4I17letta7RkMD2vmAmazgucCre0fjor+FR
         zaEFPvjb+42tdTT+W9XsSub2K9ecnAv5JN8R8wm0=
Message-ID: <1564601859.3319.43.camel@HansenPartnership.com>
Subject: Re: [PATCH] parisc: strip debug information when building
 compressed images
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
Date:   Wed, 31 Jul 2019 12:37:39 -0700
In-Reply-To: <20190731192835.GA14352@ls3530.fritz.box>
References: <20190731171923.24155-1-svens@stackframe.org>
         <20190731192835.GA14352@ls3530.fritz.box>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 2019-07-31 at 21:28 +0200, Helge Deller wrote:
> * Sven Schnelle <svens@stackframe.org>:
> > When compiling the kernel with debug information i got the
> > following error:
> > 
> > hppa-linux-gnu-ld: section .text LMA
> > [0000000000e78000,0000000000e7b41f] overlaps section
> > .rodata.compressed LMA [00000000000e0078,00000000015ad43d]
> > make[3]: *** [/home/svens/parisc-
> > linux/src/arch/parisc/boot/compressed/Makefile:28:
> > arch/parisc/boot/compressed/vmlinux] Error 1
> > make[2]: *** [/home/svens/parisc-
> > linux/src/arch/parisc/boot/Makefile:17:
> > arch/parisc/boot/compressed/vmlinux] Error 2
> > make[2]: Target 'arch/parisc/boot/bzImage' not remade because of
> > errors.
> > 
> > While this might also be fixed by adjusting the linker script, i
> > think we
> > should strip the debug information when generating the compressed
> > image. This
> > reduces the size of vmlinuz/lifimage from ~69MB to 6.6MB when full
> > debug
> > information is enabled.
> 
> I think keeping debug info is good.
> Can you test this patch instead?
> It converts a 141MB vmlinux boot file (with debug info) to a 32M
> vmlinuz for me.
> 
> Ideally I would prefer something like
>   . = MIN_OR_HIGHER_THAN_CURRENT_ADDR((SZ_end - SZparisc_kernel_start
> + KERNEL_BINARY_TEXT_START));
> to avoid the ifdef, but I'm missing the linker script expert
> knowledge...
> 
> Helge
> 
> ------------------------
> [PATCH] parisc: Allow building a compressed vmlinuz with
> CONFIG_DEBUG_INFO enabled.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S
> b/arch/parisc/boot/compressed/vmlinux.lds.S
> index bfd7872739a3..dac000ec3861 100644
> --- a/arch/parisc/boot/compressed/vmlinux.lds.S
> +++ b/arch/parisc/boot/compressed/vmlinux.lds.S
> @@ -49,7 +49,10 @@ SECTIONS
>  	}
> 
>  	/* bootloader code and data starts behind area of extracted
> kernel */
> +#if !defined(CONFIG_DEBUG_INFO)
> +	/* ensure at least max address when compiled without debug
> info: */
>  	. = (SZ_end - SZparisc_kernel_start +
> KERNEL_BINARY_TEXT_START);
> +#endif

This would cause the kernel to be built in a single section for the
!defined(CONFIG_DEBUG_INFO) case, meaning we'd always blow through the
0x00100000-end text hole we need to leave for the compressed kernel to
decompress into.

James

