Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CB52E72D3
	for <lists+linux-parisc@lfdr.de>; Tue, 29 Dec 2020 18:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgL2Rzi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 29 Dec 2020 12:55:38 -0500
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:43014 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726158AbgL2Rzi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Dec 2020 12:55:38 -0500
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id DE66412803DB;
        Tue, 29 Dec 2020 09:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1609264497;
        bh=sMn8IYEKXz1t9GkWNF5dTut9rmzEq1iLEugkSA4wBWc=;
        h=Message-ID:Subject:From:To:Date:From;
        b=HDGS29X+PMG3tYvKEXI9XvFb/k65bmPcEv+WrZq8WHpxoVsp3l38L2lkN5v55X6AU
         NN8nnD/SKOLDwfvS14ZCqcaZVi8y/raCXiK+0UDMxEypAHbpNjH/lR9iQfc7PrXR5v
         nAAvoqu70cqGGzZOOziZz4JECVINoq366++fHGSI=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FCqZ-sQReBlZ; Tue, 29 Dec 2020 09:54:57 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9583F12803B2;
        Tue, 29 Dec 2020 09:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1609264497;
        bh=sMn8IYEKXz1t9GkWNF5dTut9rmzEq1iLEugkSA4wBWc=;
        h=Message-ID:Subject:From:To:Date:From;
        b=HDGS29X+PMG3tYvKEXI9XvFb/k65bmPcEv+WrZq8WHpxoVsp3l38L2lkN5v55X6AU
         NN8nnD/SKOLDwfvS14ZCqcaZVi8y/raCXiK+0UDMxEypAHbpNjH/lR9iQfc7PrXR5v
         nAAvoqu70cqGGzZOOziZz4JECVINoq366++fHGSI=
Message-ID: <1966d5a160c16fffce4cf67466637f00f6aee3f8.camel@HansenPartnership.com>
Subject: [PATCH palo] remove useless files from directory listing
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Parisc List <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>
Date:   Tue, 29 Dec 2020 09:54:56 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The directory listing command 'l' currently shows deleted files plus
other filetypes that couldn't possibly be booted.  Eliminate deleted
files and make it show only regular/symlink and directory entries.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 ipl/ext2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/ipl/ext2.c b/ipl/ext2.c
index 86b8259..8a96b9b 100644
--- a/ipl/ext2.c
+++ b/ipl/ext2.c
@@ -728,6 +728,7 @@ static struct ext2_dir_entry_2 *ext2_readdiri(struct ext2_inode *dir_inode,
 			return NULL;
 	}
 
+ repeat:
 #ifdef DEBUG
 	printf("ext2_readdiri: blkoffset %d diroffset %d len %d\n",
 		blockoffset, diroffset, dir_inode->i_size);
@@ -751,6 +752,15 @@ static struct ext2_dir_entry_2 *ext2_readdiri(struct ext2_inode *dir_inode,
 	dp = (struct ext2_dir_entry_2 *) (blkbuf + blockoffset);
 	swapde(dp);
 	blockoffset += dp->rec_len;
+	/* ext2 deletes a file by zeroing its inode.  We skip deleted
+	 * files, corrupt entries and entries that aren't a regular
+	 * file or a symlink */
+	if (dp->name_len == 0 || dp->inode == 0)
+		goto repeat;
+	if (dp->file_type != EXT2_FT_REG_FILE &&
+	    dp->file_type != EXT2_FT_SYMLINK &&
+	    dp->file_type != EXT2_FT_DIR)
+		goto repeat;
 #ifdef DEBUG
 	printf("ext2_readdiri: returning %p = %.*s\n", dp, dp->name_len, dp->name);
 #endif
-- 
2.30.0.rc2


