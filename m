Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 093A07CCFF
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 21:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfGaTkO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 15:40:14 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:33738 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726232AbfGaTkO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:40:14 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id BFD2A8EE12F;
        Wed, 31 Jul 2019 12:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564602013;
        bh=QOqkWTz27sUPKibneZYX1UGsEGYQ/E4YdBbwN+w6wmM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=xgGGtDVhJU1MUKbZGOJpvRofGLUWSYbRz9tDZzyvQJkoXPV1andYDqTcf4iy3mXzc
         liZSLMmCuhFwJEmIn6ERf1k/iRcWpnNhcs3nDL6kmbLk4+r1X0BP+ds3/wEj9O6Kp3
         8bawxtkON3bF3Osi9ZEHDjpIrJgtgN+tAYWCL5FE=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id toNbEhEqhouu; Wed, 31 Jul 2019 12:40:13 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3A6628EE10C;
        Wed, 31 Jul 2019 12:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564602013;
        bh=QOqkWTz27sUPKibneZYX1UGsEGYQ/E4YdBbwN+w6wmM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=xgGGtDVhJU1MUKbZGOJpvRofGLUWSYbRz9tDZzyvQJkoXPV1andYDqTcf4iy3mXzc
         liZSLMmCuhFwJEmIn6ERf1k/iRcWpnNhcs3nDL6kmbLk4+r1X0BP+ds3/wEj9O6Kp3
         8bawxtkON3bF3Osi9ZEHDjpIrJgtgN+tAYWCL5FE=
Message-ID: <1564602012.3319.45.camel@HansenPartnership.com>
Subject: Re: Compressed kernels currently won't boot
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Wed, 31 Jul 2019 12:40:12 -0700
In-Reply-To: <1564595402.3319.40.camel@HansenPartnership.com>
References: <1564591443.3319.30.camel@HansenPartnership.com>
         <20190731173016.GA23520@t470p.stackframe.org>
         <1564595402.3319.40.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 2019-07-31 at 10:50 -0700, James Bottomley wrote:
> On Wed, 2019-07-31 at 19:30 +0200, Sven Schnelle wrote:
> > Hi,
> > 
> > On Wed, Jul 31, 2019 at 09:44:03AM -0700, James Bottomley wrote:
> > > I noticed this trying to test out compressed kernel booting.  The
> > > problem is that a compressed kernel is divided into two pieces,
> > > one
> > > of which starts at 0x000e0000 and is the bootstrap code which is
> > > uncompressed into 0x00100000 and the rest of which is the real
> > > compressed kernel which is loaded above the end of the current
> > > decompressed size of the entire kernel.  palo decompresses the
> > > head
> > > and jumps to it and it then decompresses the rest of the kernel
> > > into place.  This means that the first part of the compressed
> > > image
> > > can't be larger than 0x20000 == 131072 because otherwise it will
> > > be
> > > loaded into an area that decompression will alter.
> > > 
> > > The problem is that a change was introduced by 
> > > 
> > > commit 34c201ae49fe9e0bf3b389da5869d810f201c740
> > > Author: Helge Deller <deller@gmx.de>
> > > Date:   Mon Oct 15 22:14:01 2018 +0200
> > 
> > Hmm. This is what i've been facing as well.
> 
> Yes, except you're a more extreme case than me ... you actually have
> the compressed segment overlapping the end of the decompressed text. 
> that does seem to mean we have a lot of no-load debug information
> which
> isn't useful to the compressed image.
> 
> >  After reading this commit i'm not sure that the patch i've just
> > sent ("parisc: strip debug information when building compressed
> > images") is really wanted. However, it is really a pain to always
> > copy huge lifimages around when booting parisc machines via LAN.
> > Does someone really extract the vmlinux file from a compressed
> > kernel images? Should we keep that?
> 
> Well, it's a thing.  There's a script in the kernel source tree
> 
> scripts/extract-vmlinux
> 
> that does it.  It doesn't seem to be packaged by debian, though.

What about causing the compressed make to build both a stripped and a
non-stripped bzImage (say sbzImage and bzImage).  That way you always
have the stripped one available for small size things like boot from
tape or DVD?  but in the usual case we use the bzImage with full
contents.

James

