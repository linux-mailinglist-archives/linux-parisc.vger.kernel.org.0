Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 616AA7CF5B
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 23:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729190AbfGaVIW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 17:08:22 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:40765 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfGaVIW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 17:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=0WVLgDtCTKMu0uyzk3QL3EjYuVer6Jad86ge8XH+tSY=; b=YFEwC0nh/i+LNhRAbjRI4nxcbu
        cOIizoIgteiltoF2D/LAgkH9giWmcUU1srDc8ruRGsV9Q6gwO5XB8YVgPa+avNBL0yi4bUO0He4th
        8cd3JWQgFGk+gFsjTSQFeE9270o39BMUYvlM0A2ztRQH9yUpKU70EA4zGYkqWv48UF1A=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hsvpd-00028Y-BX; Wed, 31 Jul 2019 23:08:21 +0200
Date:   Wed, 31 Jul 2019 23:08:19 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Parisc List <linux-parisc@vger.kernel.org>, deller@gmx.de
Subject: Re: Compressed kernels currently won't boot
Message-ID: <20190731210819.GE23520@t470p.stackframe.org>
References: <1564591443.3319.30.camel@HansenPartnership.com>
 <20190731173016.GA23520@t470p.stackframe.org>
 <1564595402.3319.40.camel@HansenPartnership.com>
 <1564602012.3319.45.camel@HansenPartnership.com>
 <20190731194413.GB23520@t470p.stackframe.org>
 <1564606894.3319.72.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564606894.3319.72.camel@HansenPartnership.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Wed, Jul 31, 2019 at 02:01:34PM -0700, James Bottomley wrote:
> On Wed, 2019-07-31 at 21:44 +0200, Sven Schnelle wrote:
> > Hi James,
> > 
> > On Wed, Jul 31, 2019 at 12:40:12PM -0700, James Bottomley wrote:
> > 
> > > What about causing the compressed make to build both a stripped and
> > > a non-stripped bzImage (say sbzImage and bzImage).  That way you
> > > always have the stripped one available for small size things like
> > > boot from tape or DVD?  but in the usual case we use the bzImage
> > > with full contents.
> > 
> > In that case we would also need to build two lifimages - how about
> > adding a config option option? Something like "Strip debug
> > information from compressed kernel images"?
> 
> Actually, I just looked at what x86 does.  It has this in the
> arch/x86/boot/compressed/Makefile:
> 
> OBJCOPYFLAGS_vmlinux.bin :=  -R .comment -S
> $(obj)/vmlinux.bin: vmlinux FORCE
> 	$(call if_changed,objcopy)
> 
> So it basically strips all the debug information from the kernel before
> compressing, which argues there's no need to retain the information
> because x86 doesn't bother.

Nice. So we could convince Helge by saying "Look, x86 is also stripping it"! :-)

Regards
Sven
