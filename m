Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEB01DAFF4
	for <lists+linux-parisc@lfdr.de>; Wed, 20 May 2020 12:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgETKUi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 20 May 2020 06:20:38 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:54119 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726560AbgETKUi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 20 May 2020 06:20:38 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud8.xs4all.net with ESMTPA
        id bLpajamuCdPgTbLpmjLtQS; Wed, 20 May 2020 12:20:36 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>,
        James.Bottomley@HansenPartnership.com,
        Jeroen Roovers <jer@gentoo.org>
Subject: [PATCH 320/320] ipl: Ensure no GCC builtins replace string functions
Date:   Wed, 20 May 2020 12:19:45 +0200
Message-Id: <20200520101945.9676-1-jer@gentoo.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMN0c0AO19CHABgc9GyBRH09jlwwOFgw+CjZSApReW1Nb4YtoAc25rX6iMK62tGgi9veGHyRhvhFpJr+PE3uBdNrm9uIObLqhvaxWtd5LIE11M25gggl
 OrBOSi4b3+UW/rxpVE8nxco1ShtHb4DIhazHoer8f/e9ccsXfk9Xev1AbT/hNIho2maiGxG1sLGUcyQCnQtgaxlEfur0efIgP4kHL5jODWUEBXQFYc7eHJq2
 xNrj76M2kw1b6ddfVk1WJoV9fZ0p3AEixCjOsDHk60g=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

With GCC 10, the ipl is built with the compiler overriding local
definitions of some string functions, causing the ipl to trigger an
HPMC. Fix this by setting the -fno-builtin compiler flag.

Signed-off-by: Jeroen Roovers <jer@gentoo.org>
---
 ipl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipl/Makefile b/ipl/Makefile
index 913ec66..c1d608b 100644
--- a/ipl/Makefile
+++ b/ipl/Makefile
@@ -39,7 +39,7 @@ endif
 VPATH=../lib:.
 
 AFLAGS	= -I../lib
-CFLAGS	= -DIPL_LOADER -I. -I../lib -I../include -O2 -mdisable-fpregs -Wall -fno-delete-null-pointer-checks
+CFLAGS	= -DIPL_LOADER -I. -I../lib -I../include -O2 -mdisable-fpregs -Wall -fno-delete-null-pointer-checks -fno-builtin
 LDFLAGS  = -N --section-start .init=0x60000 -e '$$START$$'
 
 all:	iplelf
-- 
2.26.2

