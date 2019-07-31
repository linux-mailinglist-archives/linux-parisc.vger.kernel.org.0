Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B677CA4F
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 19:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbfGaRaT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 13:30:19 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:36512 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729993AbfGaRaT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 13:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=YD8++FvId5PM2bJXQRwW8cE4CclRUTzEl6czrbLcYoU=; b=S92TY3iMJGAD3+tdZsR3poomjt
        MgA88zziTYejxmuNcKwYwXkuGTd8QJpSSBFah9IOKNkdr7qLsDtNdnu/WFVMe1MmbGMs1J+zOm5T9
        BNuYdMRDYEWZS7pfv0nRX4v0kzM+wMrPNMfffWdwLB1Hv0Rq8BpYi5E50Bnpd9prAcfA=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hssQb-0006ex-Ef; Wed, 31 Jul 2019 19:30:17 +0200
Date:   Wed, 31 Jul 2019 19:30:16 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Subject: Re: Compressed kernels currently won't boot
Message-ID: <20190731173016.GA23520@t470p.stackframe.org>
References: <1564591443.3319.30.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564591443.3319.30.camel@HansenPartnership.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Wed, Jul 31, 2019 at 09:44:03AM -0700, James Bottomley wrote:
> I noticed this trying to test out compressed kernel booting.  The
> problem is that a compressed kernel is divided into two pieces, one of
> which starts at 0x000e0000 and is the bootstrap code which is
> uncompressed into 0x00100000 and the rest of which is the real
> compressed kernel which is loaded above the end of the current
> decompressed size of the entire kernel.  palo decompresses the head and
> jumps to it and it then decompresses the rest of the kernel into place.
>  This means that the first part of the compressed image can't be larger
> than 0x20000 == 131072 because otherwise it will be loaded into an area
> that decompression will alter.
> 
> The problem is that a change was introduced by 
> 
> commit 34c201ae49fe9e0bf3b389da5869d810f201c740
> Author: Helge Deller <deller@gmx.de>
> Date:   Mon Oct 15 22:14:01 2018 +0200

Hmm. This is what i've been facing as well. After reading this commit i'm not
sure that the patch i've just sent ("parisc: strip debug information when
building compressed images") is really wanted. However, it is really a pain
to always copy huge lifimages around when booting parisc machines via LAN.
Does someone really extract the vmlinux file from a compressed kernel images?
Should we keep that?

Regards
Sven
