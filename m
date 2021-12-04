Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210EE46877A
	for <lists+linux-parisc@lfdr.de>; Sat,  4 Dec 2021 21:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbhLDUli (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 4 Dec 2021 15:41:38 -0500
Received: from mout.gmx.net ([212.227.15.15]:50491 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231989AbhLDUlh (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 4 Dec 2021 15:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638650284;
        bh=t54xJGSs+JjgFoceoSFiTferjoJ/fNtWj3Vw6GSlmeM=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=dBnIcEAQi2GCNfwrdjGHiTPmpjbMWMFT/b30EVzKJTN0uLmyMlIV4fCTcEt9CpYqX
         K4mfC636f9W33ITKDRmQPunXP9vlVvq2ekJQ2wktwuVkKQ3fky7uwRfd65oH6BKGK/
         Nf+joxZbZLJ+Zto91cplb/oVIYRgITnYfSAFE89Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.151.242]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDJd-1mDymB1r3v-00qm58; Sat, 04
 Dec 2021 21:38:04 +0100
Date:   Sat, 4 Dec 2021 21:37:55 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Fix "make install" on newer debian releases
Message-ID: <YavRozpXHXjzzBlp@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Npj9ZplO848tsjsoDAcZ9rE5c6sp3SXzIfahdNqFqWxt/WBHqn/
 uj9poY7pRNGcTAgBhUq1xH09P6UMPtzn195mR7ttB7r+1oMYf8QqDN5ZBG1b6ptMpYoYfpk
 GZ7RSzPGk2oUZLcyh4qQkc7cQ9ByqVRFQ/QxVMHr8JJlXqP7ZAocLIipyS25WZNPDQ0b4yr
 Optb5YI3MrB/YPQFXjgBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uXctQrzywFI=:bAmu3A/tV1sN8G92CZVsKC
 UjYXRmClekhVMd3seOmU73vrVqAEbqcDkbKxdCeD3Syj1Fn9MjSqB69cxETbwTwsILQsxuGKz
 U2lD+RGS7A07wZ1Utwhh0FNKagyNFSwx6vbwHj/m+BZR8PGv7qWmKhNFcuW5idT0sTnxMmBS8
 Lw84ERXQURgZQKIvNcANlfFmI2lY2dsTjBkNC9cIc7a7agrdnj7Wc4XQgGer4XH6aiNW0qnlT
 TF8hbbtCGkO9ucYhPYiSbI14DDXUzRpo6+J7+hUsdr7TV1oUhLV0pU1F4iMeb3vgfir5S0eHv
 AdYKwHgu88mm5uW+IyiXHdCsK0SzlGmjqz7j6XCMroos1y0qJ7S5v9eqEsHgOFIeFSJVwDZf/
 +3v0ISIlA3T9gOwnMtxFAwLVcU4gnIcIWZJfwGezDyWAY/Y/EyAcn/LfOkf9dYVFOICxb6X2x
 nOkMILCuSrU3IGFBK88wcT5d1FbNBlfC1t8RRfJ6umfVpx1deeuWjDYgfHDCqCJFOL9FiZQdZ
 tqvlb/gEFyqXABSFhu6F5baHcQNJbtF3oVX4VfDkl/VGkAVTwFBe3VWpGkyk4A/1sb5TQFT9a
 dLCBp7mOLF/PCgIs/WcAgAWfDehYigjlGP4R1UpV/DGzqS+qvL1QcB9SOmGnrRRfSXncUdcxI
 gweHe9KqaXmPr3+rti3wUXMZPwaK/Nm1w02d9kB5FnbYvrAzsrvDhYV5r0GqOssgDKMHm+wPg
 Ltrt6pldcMHdtT9qTkdTJhHq6isYz9T04bIoRXZeX0rKQz02lJtMKEeZUnHmNLRdKJQ+8tdyD
 X3jHciTHzjJUgUc2Z7ZDWWteH8Akm/sXRXm10o5DUP4vUEBtro7NsVUqxFRrLBXOyGxe/7nMI
 u/bdiV48PZCx6xFE+sojZdEeQZ9IUQSdwgw9xLH8YfLOkB9MgBAOOQtWYq4Kn5AD0wu4qQwrV
 ufingHoIphoMh3lfXwxUXS02NnKLNWr+NkLpPY7jG6VX4MGkOZb53QGMFGwZb5a64/kkt1HwH
 vAkmhd0gbRWi2pd8JSx2GcFo+uAanlW+2K6Mbei094Xc7UdYyuzZd+98ocQvLyNhGWCOW1Jnu
 35OxIA8cowT+48=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On newer debian releases the debian-provided "installkernel" script is
installed in /usr/sbin. Fix the kernel install.sh script to look for the
script in this directory as well.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # v3.13+

diff --git a/arch/parisc/install.sh b/arch/parisc/install.sh
index 056d588befdd..70d3cffb0251 100644
=2D-- a/arch/parisc/install.sh
+++ b/arch/parisc/install.sh
@@ -39,6 +39,7 @@ verify "$3"
 if [ -n "${INSTALLKERNEL}" ]; then
   if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"=
; fi
   if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"=
; fi
+  if [ -x /usr/sbin/${INSTALLKERNEL} ]; then exec /usr/sbin/${INSTALLKERN=
EL} "$@"; fi
 fi

 # Default install
