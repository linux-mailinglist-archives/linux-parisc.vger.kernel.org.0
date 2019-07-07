Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE5561780
	for <lists+linux-parisc@lfdr.de>; Sun,  7 Jul 2019 22:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfGGU6P (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 7 Jul 2019 16:58:15 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:39902 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727073AbfGGU6P (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Jul 2019 16:58:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id DCA178EE1CB;
        Sun,  7 Jul 2019 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562533094;
        bh=gCbzP+d1Gq3LqXojYVGeIGgzCioC5Pq/IC69nFCkgvs=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=W9LyN1J9o2N8JjaBjNpRnp9/0fX1XvWWCOdNSzf5t+8WTKAeE0Q0mg7rGlnHJjL8O
         duGTI0VYqb78Nm1vO8fHbGfW7yy2ggWdocNYBfIvKh6UJ2fSqjYsy8+MKyzOP9Oiko
         ZhiZxLayk5Tibk7FsgMCEHr+Y5Mpd1KMfDC9t+UQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id esDDKfvDYI02; Sun,  7 Jul 2019 13:58:14 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 717398EE1B2;
        Sun,  7 Jul 2019 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562533094;
        bh=gCbzP+d1Gq3LqXojYVGeIGgzCioC5Pq/IC69nFCkgvs=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=W9LyN1J9o2N8JjaBjNpRnp9/0fX1XvWWCOdNSzf5t+8WTKAeE0Q0mg7rGlnHJjL8O
         duGTI0VYqb78Nm1vO8fHbGfW7yy2ggWdocNYBfIvKh6UJ2fSqjYsy8+MKyzOP9Oiko
         ZhiZxLayk5Tibk7FsgMCEHr+Y5Mpd1KMfDC9t+UQ=
Message-ID: <1562533092.3216.20.camel@HansenPartnership.com>
Subject: Re: [PATCH] Update palo documentation
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Date:   Sun, 07 Jul 2019 13:58:12 -0700
In-Reply-To: <70b4c08b-de2e-91f7-890d-767cad3dfad1@gmx.de>
References: <1562522488.3216.15.camel@HansenPartnership.com>
         <ff1f3d02-20bc-c1fa-5ff6-0520e9ebe8e0@gmx.de>
         <1562528703.3216.17.camel@HansenPartnership.com>
         <70b4c08b-de2e-91f7-890d-767cad3dfad1@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, 2019-07-07 at 22:01 +0200, Helge Deller wrote:
> On 07.07.19 21:45, James Bottomley wrote:
> > On Sun, 2019-07-07 at 20:44 +0200, Helge Deller wrote:
> > > On 07.07.19 20:01, James Bottomley wrote:
> > 
> > [...]
> > > > +Palo allows you to specify a kernel command line, which is
> > > > stored
> > > > in
> > > > +the firstboot partition.  The format should be kernel first
> > > > followed
> > > > +by an optional initrd= and then the rest of the kernel
> > > > parameters.
> > > > +For parisc system, you should specify a boot console as
> > > > console=
> > > > on
> > > > +the command line.
> > > 
> > > No, that's not recommended.
> > > palo will detect the currently used console and add it
> > > automatically,
> > > so one should NOT specify a console parameter.
> > 
> > Ah well, I've got an rp3430 so its console name changes depending
> > on kernel, which is why I specify it, but I can remove that from
> > "For parisc system, you should ..."
> 
> The rp34xx series should work fine as well.
> Can you give details, because I pushed a patch into stable series
> which should have fixed that:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co
> mmit/?id=bcf3f1752a622f1372d3252d0fea8855d89812e7

It's a 3.16 based rescue kernel and ramdisk I built long ago and keep
around just in case.

James

