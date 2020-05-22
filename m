Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C061D1DE391
	for <lists+linux-parisc@lfdr.de>; Fri, 22 May 2020 11:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgEVJz4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 22 May 2020 05:55:56 -0400
Received: from mout.gmx.net ([212.227.15.19]:38825 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728249AbgEVJzz (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 22 May 2020 05:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1590141351;
        bh=+gd9T9NRVdLyleOOSGnLHzrsxXK/Agp7tMPZyvuuYjc=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=NjiCEHuh2Ez0hNeJu1G0Mb+ByMFntOZ0051eXsCDI2sTS505WeLr7WupQoluLcBPS
         s/fgzSgErNOUp4GO80pUft6q0wedCn6X4edMng3qSFif+aWv0xYk5ElCu6efOzgsZk
         pGyJcs7gcMup0+PrL3U8jYuOL6sNmPRjYoyjRMbQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.161.201]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtfJd-1ilUeP3I6h-00v8nv; Fri, 22
 May 2020 11:55:50 +0200
Date:   Fri, 22 May 2020 11:55:48 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Update references to parisc website
Message-ID: <20200522095548.GA16829@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:FsJ7zq1ia32/eKIcdM1cPPyiNajw8mRf05gAQJGpdSRO63KfqDC
 uFLphG3HO5uS032UG1DsnkkI0cu6QAjPvWqNib/FYkyz8iVnUXM5gvInK6Fus5owUPOr0Yo
 h3ui6yHb9eewBcDFYghxxC92XH9+OK29v7ARKo+/nBF0zFRH2W33oZMsUUo9dEX+aNOl7dG
 CQ7pG8ayXiErEs3HE3gfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ka5gh7+yY9k=:u9YzDGmY8P8svpvxn+Siwh
 cZczxVvDJX5KbgIdk38ZtmQuhguIsEdkRDATbeIa8fP/dT9K5K1sRH5LNZRUZtBS0H3ZBM5lr
 pqC7hCcWYpYYGs2VeqjWMCQ0nnZ/GpY14Rs/v9yP+1gZjBsILo8wDckWRcYwfK+yMBU92OO6e
 B7ypTbdOupmVwwxPdIhGWCoECOGuHorPMQVW2v+3rmvYoLUqM/KVb7t5ksoT7fg5BD67trsg3
 5ePFD2kYe0TmJPwrxaZgyq6BlWyTfvL9rpIgZaJeaDFnNbwCLj0UUCCBgO2/oXewKK7VHcega
 +z11cg4N4uIY2WO/MlOP/jZHLn1aFYTw4Awmhs/wxStc7fxNEf9qZw/CUA6u4LaxOAlN8E9zn
 z52rwP94MLJFEvo0pAr+GuY8hoESmiB1caz9sc80C7Zxuvq0Iq+ipWIbOxKUHabKUI1y2FUND
 NPagINe8p+HQumelNihuYT9c0jW1GNRfyd8oWuAE0vNWrBYGhEPadCnwXYQjP9n7V7LYBA8xJ
 GvfpT/MgwEiJ7YIfyCsZVI5ilO4RQV0YMuhWpgLzbF+vFnJlnKe0iooCarRG30chDYuJeifeD
 RgKgE2E0AYyq1oaf8b3oB369tz/fIvmu+TD8czhUTAk1ImTNnbSXBSyDB1DbXnzaA9Mr7KDsI
 lfk9v6RWp/Ed7n/G0mHarx26ulMe5X1N6fQAQ+zE4XTtKO5Gafn3/4pHC3lr1K6IX4WGfEXx1
 7WKTKvyO3a8R+423M9jgHEqAccPrcfA+ocM/mC46XPfphRzy14l2ju8SdNRFt80U6BuWnP86A
 OSQIypdQbWKTNlbQiGT75VcDq3usGfcVljnI1uM4qhHZjylWuS0BwmDfSeep8C/64Oz8LvM1/
 7VYSaZHrdjvPiVxXvIymYHoTVzEOItTICAHg7D6jKRwPNanEHIc1/uGXuAdoLkK0lHF0ooVI2
 HT/ZNAteSmLxx75UBHI8uCjffngLSlpu+dLH9ebRn0XnD4EN9q9hnALJSoFUcVdm+2/6Sod+W
 y8QswsZVPMESqKOVIojH+mpdpVnDOEd1RNOWPYqALMXgmJh1E4djcxkg62brxx6QOVB7gbryg
 DpIh/mstdqXsfSMfFcrfU5U7hjXz2pVFtJ4H7ySn0BTADQgqrM6NwYRAggxziSwv1Kn2+GoFM
 SZ7M8MR4kjE1rJqwJUWAJ+yL/0topJj3skU+XFvGSPVF3g1QY7jV8pyfZegGe+1J4ot31ZgQ/
 0YNzMMPBk7E8O/CkB
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The PA-RISC Linux project main web page is now hosted at
the kernel wiki at https://parisc.wiki.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/MAINTAINERS b/MAINTAINERS
index 091ec22c1a23..3cb0f4a0bb09 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12754,7 +12754,7 @@ M:	"James E.J. Bottomley" <James.Bottomley@HansenP=
artnership.com>
 M:	Helge Deller <deller@gmx.de>
 L:	linux-parisc@vger.kernel.org
 S:	Maintained
-W:	http://www.parisc-linux.org/
+W:	https://parisc.wiki.kernel.org
 Q:	http://patchwork.kernel.org/project/linux-parisc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.6.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.=
git
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 3801a2ef9bca..92128f9164ce 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -68,7 +68,7 @@ config PARISC
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
 	  in many of their workstations & servers (HP9000 700 and 800 series,
 	  and later HP3000 series).  The PA-RISC Linux project home page is
-	  at <http://www.parisc-linux.org/>.
+	  at <https://parisc.wiki.kernel.org>.

 config CPU_BIG_ENDIAN
 	def_bool y
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 1d976f2ebff0..665b70086685 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -4,7 +4,8 @@
  *
  *	PDC =3D=3D Processor Dependent Code
  *
- * See http://www.parisc-linux.org/documentation/index.html
+ * See PDC documentation at
+ * https://parisc.wiki.kernel.org/index.php/Technical_Documentation
  * for documentation describing the entry points and calling
  * conventions defined below.
  *
diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index 98c5203c1ab0..17161e72ea29 100644
=2D-- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -6,7 +6,8 @@
  *
  *    Based on the document "PA-RISC 1.1 I/O Firmware Architecture
  *    Reference Specification", March 7, 1999, version 0.96.  This
- *    is available at http://parisc-linux.org/documentation/
+ *    is available at
+ *    https://parisc.wiki.kernel.org/index.php/Technical_Documentation
  *
  *    Copyright 1999 by Alex deVries <alex@onefishtwo.ca>
  *    and copyright 1999 The Puffin Group Inc.
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index 1c50093e2ebe..fac18c623d16 100644
=2D-- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -3,9 +3,9 @@
  *
  *    The best reference for this stuff is probably the Processor-
  *    Specific ELF Supplement for PA-RISC:
- *        http://ftp.parisc-linux.org/docs/arch/elf-pa-hp.pdf
+ *        https://parisc.wiki.kernel.org/index.php/File:Elf-pa-hp.pdf
  *
- *    Linux/PA-RISC Project (http://www.parisc-linux.org/)
+ *    Linux/PA-RISC Project
  *    Copyright (C) 2003 Randolph Chung <tausq at debian . org>
  *    Copyright (C) 2008 Helge Deller <deller@gmx.de>
  *
