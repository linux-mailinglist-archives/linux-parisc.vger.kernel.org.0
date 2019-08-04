Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E698680B6F
	for <lists+linux-parisc@lfdr.de>; Sun,  4 Aug 2019 17:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfHDP0W (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 4 Aug 2019 11:26:22 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:48362 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726181AbfHDP0W (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 4 Aug 2019 11:26:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id C5CF88EE19C
        for <linux-parisc@vger.kernel.org>; Sun,  4 Aug 2019 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564932381;
        bh=wugH/yPtoe4CVFG0Mtd3rW28LazcoE4+Vnt+Ol6SjaI=;
        h=Subject:From:To:Date:From;
        b=Xhg50RY7ukNJwwGCNnUppVEQq5LH7UicCDkeQQhMygF11D/J15c90SB38E+ihx0rk
         wR6j2ITlsez7UGPD/EPnfjj3rpsiBiVpd4kcyj3TJ6iLML1Y5XrEWo6/B2XIQifmLd
         5Zc8QcKRpxpqq6GZojkGlH8dK24I9dcjX5XZnSlk=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id M-BWXI7XBtl8 for <linux-parisc@vger.kernel.org>;
        Sun,  4 Aug 2019 08:26:21 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 51B4E8EE104
        for <linux-parisc@vger.kernel.org>; Sun,  4 Aug 2019 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564932381;
        bh=wugH/yPtoe4CVFG0Mtd3rW28LazcoE4+Vnt+Ol6SjaI=;
        h=Subject:From:To:Date:From;
        b=Xhg50RY7ukNJwwGCNnUppVEQq5LH7UicCDkeQQhMygF11D/J15c90SB38E+ihx0rk
         wR6j2ITlsez7UGPD/EPnfjj3rpsiBiVpd4kcyj3TJ6iLML1Y5XrEWo6/B2XIQifmLd
         5Zc8QcKRpxpqq6GZojkGlH8dK24I9dcjX5XZnSlk=
Message-ID: <1564932380.3401.1.camel@HansenPartnership.com>
Subject: [PATCH palo] ext2: fix ext4 group cache
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Sun, 04 Aug 2019 08:26:20 -0700
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The ext4 group cache is truncated because the read that populates it
is assuming ext2 fixed group size and not using the ext4 variable
group size.  This only shows up with large inode numbers because the
read stops before their contents is read.  The upshot is when you try
to do ext2_iget() for an ext4 inode above a certain number it fails
because the group descriptor is random junk.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 ipl/ext2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipl/ext2.c b/ipl/ext2.c
index 96f6e4d..0729429 100644
--- a/ipl/ext2.c
+++ b/ipl/ext2.c
@@ -287,7 +287,7 @@ int ext2_mount(long cons_dev, long p_offset, long quiet)
 	if (Debug) printf("ext2 block size %d\n", ext2_blocksize);
 
 	/* read in the group descriptors (immediately follows superblock) */
-	cons_read(dev, gds, ngroups * sizeof(struct ext2_group_desc),
+	cons_read(dev, gds, ngroups * group_size,
 		  partition_offset +
                   ext2_blocksize * (EXT2_MIN_BLOCK_SIZE/ext2_blocksize + 1));
 	for (i = 0; i < ngroups; i++)
-- 
2.16.4

