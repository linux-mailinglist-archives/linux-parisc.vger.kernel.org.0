Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC477B538
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jul 2019 23:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfG3Vrz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 30 Jul 2019 17:47:55 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:40094 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726869AbfG3Vrz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 30 Jul 2019 17:47:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 551058EE12F;
        Tue, 30 Jul 2019 14:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564523275;
        bh=99BVcOh7SLhgxpKXrDSNRr/jEP8JA7djb6dWOJjWc+I=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=AqTLTE3rokybCVQI/hbNGUsHW61K9HsXMpQOH7WbpSn6i7rqcSktTfxyXyvaPnX1R
         8fOHmZGSJ+F9otBeM9a952lTfhIhKRUM65s5vQznZh6eZOU2Th5OHm85G5Ha/lR+VO
         SUORO/NADoP2lUbv7tZ5ZRtvVLr/mwGo3NxICGRM=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ya4F4F9HQ53p; Tue, 30 Jul 2019 14:47:55 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id E4C608EE0E3;
        Tue, 30 Jul 2019 14:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564523275;
        bh=99BVcOh7SLhgxpKXrDSNRr/jEP8JA7djb6dWOJjWc+I=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=AqTLTE3rokybCVQI/hbNGUsHW61K9HsXMpQOH7WbpSn6i7rqcSktTfxyXyvaPnX1R
         8fOHmZGSJ+F9otBeM9a952lTfhIhKRUM65s5vQznZh6eZOU2Th5OHm85G5Ha/lR+VO
         SUORO/NADoP2lUbv7tZ5ZRtvVLr/mwGo3NxICGRM=
Message-ID: <1564523273.4300.43.camel@HansenPartnership.com>
Subject: Re: Do NOT upgrade to palo v2.10
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Date:   Tue, 30 Jul 2019 14:47:53 -0700
In-Reply-To: <1564522225.4300.39.camel@HansenPartnership.com>
References: <bff56161-3d9c-d4f1-c1cb-fd04de28eb59@gmx.de>
         <1564522225.4300.39.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 2019-07-30 at 14:30 -0700, James Bottomley wrote:
> On Tue, 2019-07-30 at 22:58 +0200, Helge Deller wrote:
> > PALO version 2.10 was released last week, but it has a bug
> > which may prevent that you are able to boot your kernels:
> > 
> > Entry 000e0000 first 000e0000 n 2
> > Segment 0 load 000e0000 size 8249207 mediaptr 0x1000
> > Abort: Would overwrite palo 00060000-000f8e30 or data 3faef580
> > areas.
> > ERROR: failed to load kernel
> 
> Ah, that's unfortunate.  It must be an artifact of compressed kernels
> because my uncompressed one boots here:
> 
> Entry 00100000 first 00100000 n 5
> Segment 0 load 00100000 size 508616 mediaptr 0x1000
> Segment 1 load 0017d000 size 370864 mediaptr 0x7e000
> Segment 2 load 00200000 size 12026224 mediaptr 0xd9000
> Segment 3 load 00d79000 size 3850884 mediaptr 0xc52000
> Segment 4 load 01200000 size 2690120 mediaptr 0xfff000
> Loading ramdisk 24263780 bytes @ 3e8ca000...
> 
> which would be why I never saw this.

This is what I'm currently testing as the fix; it reduces the bss from

  6 .bss          0008d8b0  0006b580  0006b580  0000b5f8  2**6
                  ALLOC

To

  6 .bss          0003d8b0  0006b600  0006b600  0000b654  2**6
                  ALLOC

Which will get us under 0x000e0000 assuming that's the lowest address a
kernel can be loaded at ...

James

---
diff --git a/ipl/ext2.c b/ipl/ext2.c
index 31b8469..d8b0c2f 100644
--- a/ipl/ext2.c
+++ b/ipl/ext2.c
@@ -475,17 +475,25 @@ static int ext3_extent_node_find(struct ext2_inode *ip,
 static int ext3_extent_load_find(struct ext2_inode *ip, int leaf, int d,
 				 int blkoff)
 {
-	static char blockbuf[EXTENT_MAX_DEPTH][EXT2_MAX_BLOCK_SIZE];
+	static char *blockbuf;
 	static int cached_blockno[EXTENT_MAX_DEPTH];
 	struct ext3_extent_header *hdr;
 
-	hdr = (struct ext3_extent_header *)blockbuf[d];
+	if (!blockbuf) {
+		blockbuf = malloc(EXTENT_MAX_DEPTH*EXT2_MAX_BLOCK_SIZE);
+		if (!blockbuf) {
+			printf("Failed to allocate memory for block buffer\n");
+			return -1;
+		}
+	}
+
+	hdr = (struct ext3_extent_header *)&blockbuf[d * EXT2_MAX_BLOCK_SIZE];
 	if (cached_blockno[d] != leaf) {
 		printf("load extent tree[%d] block at %d\n", d, leaf);
 
-		if (cons_read(dev, blockbuf[d], sizeof(blockbuf[d]),
+		if (cons_read(dev, hdr, EXT2_MAX_BLOCK_SIZE,
 			      leaf * ext2_blocksize) !=
-		    sizeof(blockbuf[d])) {
+		    EXT2_MAX_BLOCK_SIZE) {
 			printf("ext3_extent_load_find: read error\n");
 			return -1;
 		}
@@ -504,7 +512,7 @@ static int ext3_extent_load_find(struct ext2_inode *ip, int leaf, int d,
 		return -1;
 	}
 	if (sizeof(hdr) + sizeof(struct ext3_extent)*hdr->eh_entries >
-	    sizeof(blockbuf[d])) {
+	    EXT2_MAX_BLOCK_SIZE) {
 		printf("ext3_extent_load_find: extent is larger than buffer\n");
 		return -1;
 	}

