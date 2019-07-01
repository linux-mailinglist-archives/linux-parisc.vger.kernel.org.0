Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7C0E5C504
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Jul 2019 23:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfGAVdC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 1 Jul 2019 17:33:02 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:34238 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726586AbfGAVdC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Jul 2019 17:33:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 007608EE0E3;
        Mon,  1 Jul 2019 14:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562016782;
        bh=6h80u+ZZS1go2CGzt9PRA08wVUZRYO2jNtoj4P0hwYs=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=nhI1gSvCcbiiC0U/nY/k39T3msG5ngg/xRqmPzhza09iYmqn3HXOzN0XnEwDaKg+x
         8vVQISiBVOjVqOfO+yJfQZ1NR7HuUlzHBMbpPxxePa/+BhMcI/dkfcBqqGQYKX0xgO
         1Tviti5Ea1p8LC8+e5VOAxS2vNMPEJy3FJkw2+CU=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Lyb31yVWMpzQ; Mon,  1 Jul 2019 14:33:01 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 7FB4F8EE0E0;
        Mon,  1 Jul 2019 14:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562016781;
        bh=6h80u+ZZS1go2CGzt9PRA08wVUZRYO2jNtoj4P0hwYs=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=IlrEFWVw8gXzCwJmYzztt82un50jS7ngflnpl6RQxjU5LdKz8bIuQko3XB19tlwsh
         IbtriOIAYGo0u7GxAuQc/9ffQdKYObQ5h92HFAyn4M7FXPKjFYS6HiIXZNZH0dRuNB
         DgGBmlS4bi8WQUUo+LNDwk3EIl7umJtfwoiS96o4=
Message-ID: <1562016779.2762.19.camel@HansenPartnership.com>
Subject: Re: palo not working on ext2/ext3 partitions
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Date:   Mon, 01 Jul 2019 14:32:59 -0700
In-Reply-To: <cec14b8a-4230-8320-990c-f4808f0ab9f8@gmx.de>
References: <1562010854.2762.8.camel@HansenPartnership.com>
         <cec14b8a-4230-8320-990c-f4808f0ab9f8@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, 2019-07-01 at 22:05 +0200, Helge Deller wrote:
> On 01.07.19 21:54, James Bottomley wrote:
> > I recently had the pleasure of a complete reinstall and found that
> > I
> > can't set up palo on the new system (at least not palo that loads
> > from
> > an ext2/ext3 filesystem).  The problem doesn't seem to be within
> > palo
> > itself, but the fact that mke2fs is no longer working for us.  The
> > symptom I see is that after a couple of uses the palo partition
> > corrupts itself and then e2fsck destroys the iplboot stored in the
> > badblocks list.
> > 
> > The problem seems to be with the badblock list because if I do
> > 
> > palo -I /dev/sdb
> > 
> > Followed by a fsck -f on the palo partition, it finds errors and
> > wants
> > to clear the badblock inode.
> > 
> > I can reproduce this simply by doing
> > 
> > dd if=/dev/zero of=bbtest.img bs=1M count=100
> > losetup /dev/loop0 bbtest.img
> > a=237; while [ $a -le 450 ]; do echo $a >> bblist.txt; a=$[$a+1];
> > done
> > mke2fs -b 1024 -l /home/jejb/bblist.txt  /dev/loop0
> > e2fsck -f /dev/loop0
> > 
> > With no palo involvement, so I don't think it's our fault.
> > 
> > I'll take this to the ext2 tools development list.  Whatever it is
> > seems to be really old because I unearthed an mke2fs from 2011 that
> > still has the problem.
> 
> Thanks for trying to fix it.
> I'm not using this boot-from-extfs feature on any of my machines.
> All boot from a palo partition, so I agree, that hasn't been tested
> much.

Heh, I suppose I'm the only one who keeps tons of kernels in the boot
partition and needs a filesystem to select them.  I suppose I did write
the feature, it makes sense I'm the only one using it.

Empirically, I've found that as long as the badblocks don't include any
block from 0-250 ext2/3 seems to be happy creating a valid filesystem. 
Unfortunately with the label being 64k (so even if the palo partition
is first it starts at an offset of 64k) and our alignment being on 256k
 absolute, we usually end up starting the badblocks at around block
224.

I also dumped an older functional palo partition and found that even
there the bad blocks start at 224, so it definitely is something that
changed in mke2fs.

James

