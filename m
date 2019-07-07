Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2B6615C7
	for <lists+linux-parisc@lfdr.de>; Sun,  7 Jul 2019 20:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbfGGSBa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 7 Jul 2019 14:01:30 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:37640 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726044AbfGGSBa (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Jul 2019 14:01:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 235AA8EE1CB
        for <linux-parisc@vger.kernel.org>; Sun,  7 Jul 2019 11:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562522490;
        bh=eVgzon/rNZhnE4WkLUyYzxeFikHdxr2Qu6NKMVY6Ats=;
        h=Subject:From:To:Date:From;
        b=wRTtIMLMiVAGbpf99NcySZNTEq2TNPEYaLWxv1fk9pPf+OI8Mz843sSDZ+FidMRLK
         XdofMeWG2QGSIyXMZ1NH/C2+Ai3Qysu+jd4GCg4OB5gBeMI2sueWfpCX7Id7yYs7dp
         FJkhWiRZU4yEbtxa6nXQmnFlaAMmlaLl0KH5vqEM=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id NJDgGyTjXHxH for <linux-parisc@vger.kernel.org>;
        Sun,  7 Jul 2019 11:01:30 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id C24B08EE1B2
        for <linux-parisc@vger.kernel.org>; Sun,  7 Jul 2019 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562522489;
        bh=eVgzon/rNZhnE4WkLUyYzxeFikHdxr2Qu6NKMVY6Ats=;
        h=Subject:From:To:Date:From;
        b=GayoXcknn5Ni7iIRl+QpAIfACYeth3hYY7p+xXrjjCbeRU6wIbuoa8dqifx2H40Dv
         R1Va1OZOkfwvNZDqFMpw3u3xufFWWFx5o3fVLOEJScoYOsPyhWIDDKmN+tE6/tLJsc
         7gcZCvN2fGvetk71DTTpyxE8haRSIN1vBGldjVOM=
Message-ID: <1562522488.3216.15.camel@HansenPartnership.com>
Subject: [PATCH] Update palo documentation
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Sun, 07 Jul 2019 11:01:28 -0700
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Now that we support ext4 and palo within the boot label, update the
documentation to reflect this.  Also beef up the man page with
examples and remove reference to palo in the gnu info system because
it doesn't exist.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 Makefile       |  8 ++++---
 README.html    | 44 ++++++++++++++++++++---------------
 palo.8         | 73 ++++++++++++++++++++++++++++++++++++++++++----------------
 palo.help2man  | 47 +++++++++++++++++++++++++++++++++++++
 palo/usage.txt |  8 +++----
 5 files changed, 134 insertions(+), 46 deletions(-)
 create mode 100644 palo.help2man

diff --git a/Makefile b/Makefile
index 8c76693..a372617 100644
--- a/Makefile
+++ b/Makefile
@@ -66,7 +66,7 @@ CMDLINE = 0/vmlinux HOME=/ TERM=linux $(ROOT) $(EISAIRQ) $(CONSOLE)
 HELP2MAN := $(shell command -v help2man 2> /dev/null)
 
 all: makepalo README palo.conf
-	
+
 README:	README.html
 	lynx -dump README.html > README
 
@@ -106,10 +106,12 @@ distclean:
 	cd ipl && $(MAKE) distclean
 	cd palo && $(MAKE) distclean
 
-palo.8.gz:	palo/palo palo/usage.txt
 ifdef HELP2MAN
-		help2man ./palo/palo > palo.8
+palo.8:		palo/palo palo/usage.txt palo.help2man
+	help2man --no-info -i palo.help2man ./palo/palo > palo.8
 endif
+
+palo.8.gz:	palo.8
 	gzip -9 < palo.8 > palo.8.gz
 
 changelog.gz:	debian/changelog
diff --git a/README.html b/README.html
index 0711890..784c86e 100644
--- a/README.html
+++ b/README.html
@@ -26,7 +26,7 @@ Partition number '0' is magic and refers to
 the kernel (ramdisk) you placed on the boot medium with '-k' ('-r').
 The path name on the '0' partition is ignored, '0/vmlinux' and '0/xyzzy'
 work identically, but it's a good idea to be consistent with what
-you'll call kernels and ramdisks on an ext2 partition.
+you'll call kernels and ramdisks on an ext2/3/4 partition.
 
 <h2 align=center>Creating and Maintaining Bootable Disks </h2>
 Partitioned media usually refers to disks, in this case disks partitioned
@@ -35,14 +35,20 @@ Normally your disk is properly initialized when you install
 PA-RISC Linux, but if you need to do it by hand here are some clues:
 
 <ul>
-    <li>Use <i>fdisk</i> or something to (re)partition the disk.
-    When you are finished, the disk <b>must</b> have a partition of
-    type "F0"
-    somewhere in the first 2Gb.  This is where the boot loader
-    and an optional kernel and ramdisk will be stored, so make it
-    big enough for that -- at least 4Mb (I like 8-16Mb).
-    There must also be an ext2 partition within the first 2Gb
-    where you'll store your Linux kernel.
+    <li>Use <i>fdisk</i> or something to (re)partition the disk.  When
+    you are finished, the disk may need to have a partition of type
+    "F0" somewhere in the first 2Gb.  This is where the boot loader
+    and an optional kernel and ramdisk will be stored, so make it big
+    enough for that -- at least 4Mb (I like 8-16Mb).  There must also
+    be an ext2/3/4 partition within the first 2Gb where you'll store your
+    Linux kernel.
+
+    <li>If <i>fdisk</i> created the first partition at sector 2048,
+    which is usual for modern fdisk, you don't need a F0 partition, so
+    set all partition types to 82 swap or 83 linux and palo will place
+    the boot loader inside the disk label.  You still need a /boot
+    partition <2GB from the beginning of the disk formatted as
+    ext2/3/4 where you keep your boot kernels and initial ramdisks.
 
     <p><li>Use <i>mke2fs</i> and <i>mkswap</i> as usual.
 
@@ -67,16 +73,16 @@ and running <i>palo</i>.
     <p> <b>-k&nbsp;path/to/vmlinux</b> designates a kernel to be stored
     along with the boot loader in the "F0" partition.
     You can omit this if you want, since you'll usually be booting
-    a kernel from an ext2 partition instead.  I like to have a kernel
-    there just in case the ext2 one is lost for some reason.  I
+    a kernel from an ext2/3/4 partition instead.  I like to have a kernel
+    there just in case the ext2/3/4 one is lost for some reason.  I
     call it a <i><b>recovery kernel</b></i>.
 
     <p> <b>-c&nbsp;5/vmlinux</b> must be changed for your situation.  The
-    number, 5, is the partition number of your ext2 partition as
+    number, 5, is the partition number of your ext2/3/4 partition as
     reported by fdisk, the same number you use
     when you mounted the partition (e.g., "mount /dev/sdb5 /mnt").
     "/vmlinux" is the path to
-    your kernel executable within your ext2 partition.
+    your kernel executable within your ext2/3/4 partition.
     The special partition number "0" is used to load the "recovery"
     kernel which you placed into the "F0" partition with <b>-k</b>.
 
@@ -90,7 +96,7 @@ and running <i>palo</i>.
 <p>You now have a partitioned bootable disk, try it!
 
 <p>There is no need to run <i>palo</i> when you change the
-kernel in your ext2 partition because it is located dynamically
+kernel in your ext2/3/4 partition because it is located dynamically
 by the <i>palo</i> boot loader when you boot.  However there are probably
 some tasks which will again require <i>palo</i>.
 
@@ -143,7 +149,7 @@ stored contiguously on a 2k boundary.  Luckily the ISO file system
 meets all these criteria except for the mod-2k length, which is achieved
 by padding iplboot.
 The palo bootloader (iplboot) requires requires the kernel to be stored
-contiguously (except when booting from ext2), and the ISO file system
+contiguously (except when booting from ext2/3/4), and the ISO file system
 works well for this too.
 
 <p>When you run <i>palo</i>, it locates the boot loader and kernel
@@ -308,10 +314,10 @@ that somewhat larger kernels and boot loaders can be added later
 without re-writing the rest of the F0 partition (this feature may
 not yet be supported by <i>palo</i> however).
 
-<p>On partitioned media, <i>palo</i> can load a kernel from any ext2-formatted
-partition which falls within the first 2G of the medium, in addition
-to having a "sequential" kernel, perhaps best seen as a recovery kernel,
-within the <b>F0</b> partition.
+<p>On partitioned media, <i>palo</i> can load a kernel from any
+ext2/3/4-formatted partition which falls within the first 2G of the
+medium, in addition to having a "sequential" kernel, perhaps best seen
+as a recovery kernel, within the <b>F0</b> partition.
 
 
 <h2 align=center>Really Building <i>palo</i></h2>
diff --git a/palo.8 b/palo.8
index 7362621..e0ccc37 100644
--- a/palo.8
+++ b/palo.8
@@ -1,12 +1,12 @@
-.\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.5.
-.TH PALO "1" "January 2018" "palo version 2.00" "User Commands"
+.\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.10.
+.TH PALO "1" "July 2019" "palo version 2.01" "User Commands"
 .SH NAME
-palo \- manual page for palo version 2.00
+palo \- manual page for palo version 2.01
 .SH SYNOPSIS
 .B palo
 [\fI\,options\/\fR]
 .SH DESCRIPTION
-palo version 2.00
+palo version 2.01
 .TP
 \-?, \fB\-\-help\fR
 Print this information
@@ -83,10 +83,10 @@ Provide more verbose information when running palo
 \fB\-e\fR, \fB\-\-format\-as\fR=\fI\,type\/\fR
 .IP
 This is only for partitioned media. Format the palo
-partition as an ext2 (type == 2) or ext3 (type == 3)
-partition. With this option, you cannot specify any
-parameters, kernels or ramdisks to be loaded into
-the palo partition
+partition as an ext2 (type == 2), ext3 (type == 3) or
+ext4 (type == 4) partition. With this option, you
+cannot specify any parameters, kernels or ramdisks to
+be loaded into the palo partition
 .PP
 \&'palo' with no arguments whatsoever is equivalent to 'palo \fB\-f\fR \fI\,/etc/palo\/\fP.conf'.
 .PP
@@ -94,15 +94,48 @@ When more than one of \fB\-I\fR, \fB\-U\fR, \fB\-s\fR and \fB\-C\fR are used, on
 last one is effective.
 .PP
 http://www.parisc\-linux.org \- Wed, 17 Jan 2018 15:15:40 +0100
-.SH "SEE ALSO"
-The full documentation for
-.B palo
-is maintained as a Texinfo manual.  If the
-.B info
-and
-.B palo
-programs are properly installed at your site, the command
-.IP
-.B info palo
-.PP
-should give you access to the complete manual.
+
+palo is the installation and management tool for the parisc
+bootloader, called iplboot.  The size required for the iplboot binary
+is 256kb.  Older MS-DOS label disks begin the first partition at
+sector 63 and there is no room for iplboot within the disk label, so
+you must create a palo partition of type F0 to hold iplboot.  If your
+disk was formatted more recently it should have a newer MS-DOS label
+where the first partition begins at sector 2048 meaning there is room
+for iplboot within the disk label and a palo (F0) partition is not
+required.
+
+If you have a palo partition (type F0), it must occur within the first
+2GB of the beginning of the disk.  If you choose to have a palo
+partition, you may store both the kernel and the initrd in this
+partition, meaning you have to update it every time you update the
+kernel, or you may choose to have a /boot partition, which must be
+formatted as an ext2/3/4 filesystem, from which palo will load
+kernels.  This /boot partition also must be within the first 2GB of
+the beginning of the disk.  If you have no palo partition, and palo is
+installed inside the disk label, you must have a /boot partition
+because the disk label is still too small to contain a kernel and a
+ramdisk.
+
+Palo allows you to specify a kernel command line, which is stored in
+the firstboot partition.  The format should be kernel first followed
+by an optional initrd= and then the rest of the kernel parameters.
+For parisc system, you should specify a boot console as console= on
+the command line.  The format of the kernel and initial ramdisk files
+is <partition number>/<path to file>.  It is recommended, but not
+required, that both the kernel and the initial ramdisk be in the root
+directory of the filesystem.
+.SH EXAMPLES
+
+Create a Bootable disk on sda for the first time by installing palo
+
+    $ palo -c "1/vmlinux initrd=1/initrd.img console=tty" -I /dev/sda
+
+Update the bootloader command line without re-installing it
+
+    $ palo -c "1/vmlinux.new initrd=1/initrd.img.new console=tty" -U /dev/sda
+
+Format the palo partition as ext4 and install iplboot within that
+partition using ext4 badblocks [requires a palo (type F0) partition]:
+
+    $ palo  palo -c "1/vmlinux initrd=1/initrd.img console=tty" --format-as=4 -I /dev/sda
diff --git a/palo.help2man b/palo.help2man
new file mode 100644
index 0000000..40c92f5
--- /dev/null
+++ b/palo.help2man
@@ -0,0 +1,47 @@
+[>description]
+
+palo is the installation and management tool for the parisc
+bootloader, called iplboot.  The size required for the iplboot binary
+is 256kb.  Older MS-DOS label disks begin the first partition at
+sector 63 and there is no room for iplboot within the disk label, so
+you must create a palo partition of type F0 to hold iplboot.  If your
+disk was formatted more recently it should have a newer MS-DOS label
+where the first partition begins at sector 2048 meaning there is room
+for iplboot within the disk label and a palo (F0) partition is not
+required.
+
+If you have a palo partition (type F0), it must occur within the first
+2GB of the beginning of the disk.  If you choose to have a palo
+partition, you may store both the kernel and the initrd in this
+partition, meaning you have to update it every time you update the
+kernel, or you may choose to have a /boot partition, which must be
+formatted as an ext2/3/4 filesystem, from which palo will load
+kernels.  This /boot partition also must be within the first 2GB of
+the beginning of the disk.  If you have no palo partition, and palo is
+installed inside the disk label, you must have a /boot partition
+because the disk label is still too small to contain a kernel and a
+ramdisk.
+
+Palo allows you to specify a kernel command line, which is stored in
+the firstboot partition.  The format should be kernel first followed
+by an optional initrd= and then the rest of the kernel parameters.
+For parisc system, you should specify a boot console as console= on
+the command line.  The format of the kernel and initial ramdisk files
+is <partition number>/<path to file>.  It is recommended, but not
+required, that both the kernel and the initial ramdisk be in the root
+directory of the filesystem.
+
+[examples]
+
+Create a Bootable disk on sda for the first time by installing palo
+
+    $ palo -c "1/vmlinux initrd=1/initrd.img console=tty" -I /dev/sda
+
+Update the bootloader command line without re-installing it
+
+    $ palo -c "1/vmlinux.new initrd=1/initrd.img.new console=tty" -U /dev/sda
+
+Format the palo partition as ext4 and install iplboot within that
+partition using ext4 badblocks [requires a palo (type F0) partition]:
+
+    $ palo  palo -c "1/vmlinux initrd=1/initrd.img console=tty" --format-as=4 -I /dev/sda
diff --git a/palo/usage.txt b/palo/usage.txt
index 893316a..e3b9302 100644
--- a/palo/usage.txt
+++ b/palo/usage.txt
@@ -49,10 +49,10 @@ Usage: palo [options]
 		Provide more verbose information when running palo
     -e, --format-as=type
 		This is only for partitioned media. Format the palo
-		partition as an ext2 (type == 2) or ext3 (type == 3)
-		partition. With this option, you cannot specify any
-		parameters, kernels or ramdisks to be loaded into
-		the palo partition
+		partition as an ext2 (type == 2), ext3 (type == 3) or
+		ext4 (type == 4) partition. With this option, you
+		cannot specify any parameters, kernels or ramdisks to
+		be loaded into the palo partition
 
 
 'palo' with no arguments whatsoever is equivalent to 'palo -f /etc/palo.conf'.
-- 
2.16.4

