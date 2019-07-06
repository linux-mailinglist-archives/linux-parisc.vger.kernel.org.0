Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD29A612F3
	for <lists+linux-parisc@lfdr.de>; Sat,  6 Jul 2019 22:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfGFUeT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 6 Jul 2019 16:34:19 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:50920 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726531AbfGFUeT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Jul 2019 16:34:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 4BAF58EE188
        for <linux-parisc@vger.kernel.org>; Sat,  6 Jul 2019 13:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562445258;
        bh=tA5D2T7Vz7RiDBKkXjGIRr8xuIG+vzeZdDdFdgHCCAA=;
        h=Subject:From:To:Date:From;
        b=ba9KP0dMxemKwJTZMxeY2pP4xk8R8JsZ4QzMn/tNz74kp1pGLbyKlfWOa7CCVxgr+
         8gp9YmJDOUJ1hGhMfc1nB7X33H6RXqYqrNH/A9SkEkpR1u6/S+hsT78cEypiNuZnjE
         qwwxnDameN68jfflVTPZay+72rc1XSf44A3mYkVY=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uDWeLGUbTjgi for <linux-parisc@vger.kernel.org>;
        Sat,  6 Jul 2019 13:34:18 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id ED0E38EE0ED
        for <linux-parisc@vger.kernel.org>; Sat,  6 Jul 2019 13:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562445258;
        bh=tA5D2T7Vz7RiDBKkXjGIRr8xuIG+vzeZdDdFdgHCCAA=;
        h=Subject:From:To:Date:From;
        b=ba9KP0dMxemKwJTZMxeY2pP4xk8R8JsZ4QzMn/tNz74kp1pGLbyKlfWOa7CCVxgr+
         8gp9YmJDOUJ1hGhMfc1nB7X33H6RXqYqrNH/A9SkEkpR1u6/S+hsT78cEypiNuZnjE
         qwwxnDameN68jfflVTPZay+72rc1XSf44A3mYkVY=
Message-ID: <1562445256.3225.3.camel@HansenPartnership.com>
Subject: [PATCH] palo: place iplboot inside disk label if it's big enough
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Sat, 06 Jul 2019 13:34:16 -0700
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Ever since the widespread adoption of gpt and 4k emulation disks,
we've been starting the first partition at sector 2048 instead of 63.
Since we only need 512 sectors for iplboot, this offers the
opportunity of placing iplboot directly inside the disk label.

The way this patch works is that if no palo (F0) partition is found
and the first partition starts high enough, initialise the disk with
the ipl boot just below the first partition.  If the disk isn't big
enough, error out as previously and if an F0 partition is found,
proceed as usual.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 ipl/ipl.c   | 11 +++++++++--
 palo/palo.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/ipl/ipl.c b/ipl/ipl.c
index 03fe4ba..2a25e7c 100644
--- a/ipl/ipl.c
+++ b/ipl/ipl.c
@@ -486,6 +486,7 @@ iplmain(int is_interactive, char *initialstackptr, int started_wide)
     char kern_name[128], rd_name[128];
     char kern_fullname[128+10];
     int ok = 1;
+    const char *str;
 
     /* BSS clear */
     bzero(&_edata, &_end - &_edata);
@@ -527,8 +528,14 @@ iplmain(int is_interactive, char *initialstackptr, int started_wide)
 	print_ptab_pretty(partition, sizeof partition / sizeof partition[0]);
     }
 
-    printf("\n%s contains:\n",
-	partitioned ? "PALO(F0) partition" : "Boot image");
+    if (partitioned && f.ipl_addr < partition[0].start * 512)
+	str = "PALO within boot label";
+    else if (partitioned)
+	str = "PALO(F0) partition";
+    else
+	str = "Boot image";
+
+    printf("\n%s contains:\n", str);
 
     if(partitioned && f.version >= 4 && (f.flags & PFLAG_EXT2)) {
 	printf("PALO is formatted EXT2/3\n");
diff --git a/palo/palo.c b/palo/palo.c
index 26da01b..7f3260e 100644
--- a/palo/palo.c
+++ b/palo/palo.c
@@ -450,6 +450,30 @@ do_cdrom(int media, int kernel32, int kernel64,
  * filesystem or define EXT2_OFFSET to (259*EXT2_BLOCKSIZE)*/
 #define EXT2_OFFSET	(4*EXT2_BLOCKSIZE)
 
+int
+do_at_start(int init, int media, int start,
+	    int bootloaderfd, const char *commandline)
+{
+    struct firstblock f;
+
+    STRUCTREAD(media, f, 0);
+
+    if (init) {
+	fb_init(&f);
+    } else if (f.ipl_addr != start) {
+	printf("Current IPL start not consistent with disklabel, use -I to reinitialise\n");
+	error(11);
+    }
+
+    if(commandline)
+	strncpy(f.cmdline, commandline, sizeof(f.cmdline)-1);
+
+    write_bootloader(media, bootloaderfd, start,
+		     start + MAXBLSIZE, &f);
+
+    STRUCTWRITE(media, f, 0);
+}
+
 int
 do_formatted(int init, int media, const char *medianame, int partition,
 	     int f0start, int f0length, int bootloaderfd, int do_format,
@@ -916,6 +940,7 @@ main(int argc, char *argv[])
 	    int partitioned;
 	    int f0;
 	    struct firstblock f;
+	    int at_start = 0;	/* place ipl before first partition */
 
 	    memset(ptab, 0, sizeof ptab);
 
@@ -943,16 +968,34 @@ main(int argc, char *argv[])
 		if (ptab[f0].id == PALO_PARTITION)
 		    break;
 	    }
-	    if (f0 == MAXPARTS)
-		error(11);
+	    if (f0 == MAXPARTS) {
+		/* is the partition layout sufficient to support
+		 * iplboot before the first parition.  Allow 64
+		 * sectors for the gpt label (like we'll ever support
+		 * gpt, but just in case) allow for 8 extra sectors to
+		 * align the iplboot */
+		if (ptab[0].start > 64 + MAXBLSIZE/512 + 8)
+		    at_start = (ptab[0].start * 512 - MAXBLSIZE) & ~0xfff;
+		else
+		    error(11);
+	    }
 	    if(verbose) {
 		print_ptab_pretty(ptab, MAXPARTS);
 
-		printf("F0 partition start sector %d length %d\n",
-		    ptab[f0].start, ptab[f0].length);
+		if (at_start)
+		    printf("Placing bootloader within disk label at %d\n",
+			   at_start/512);
+		else
+		    printf("F0 partition start sector %d length %d\n",
+			   ptab[f0].start, ptab[f0].length);
 	    }
 
-	    if (format_as) {
+	    if (at_start) {
+		if (format_as)
+		    printf("No F0(palo) partition found, placing iplboot inside label\n");
+
+		do_at_start(init, media, at_start, bootloader, commandline);
+	    } else if (format_as) {
 		/* if we're going to be a formatted partition, we can't
 		 * load anything into it, so check we haven't been asked
 		 * to */
-- 
2.16.4

