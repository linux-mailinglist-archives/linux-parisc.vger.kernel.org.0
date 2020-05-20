Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E08921DB03F
	for <lists+linux-parisc@lfdr.de>; Wed, 20 May 2020 12:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgETKcL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 20 May 2020 06:32:11 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41421 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726443AbgETKcK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 20 May 2020 06:32:10 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud8.xs4all.net with ESMTPA
        id bM15jarQCdPgTbM1BjLwCW; Wed, 20 May 2020 12:32:09 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>,
        James.Bottomley@HansenPartnership.com,
        Jeroen Roovers <jer@gentoo.org>
Subject: [PATCH palo] ipl: Ensure no GCC builtins replace string functions
Date:   Wed, 20 May 2020 12:30:56 +0200
Message-Id: <20200520103055.31943-1-jer@gentoo.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPznz3lIHqGy16su/Hu3hXypMUKpamMC2OGrHPErUod9A7C1+0wBNjk81pI7ezWic8fjL4/OnVVrgRlkuH+YxdhwQeXKOA9U+RtPZd4IE2S+1IeeUZIt
 t9HDOFOuisGK9Xn4lz299Kw16LvjcWsVTxoQCUOAdShGTOV6MPAi4BVoR3H3gbpCFmMivDGy1VYP3FCB+/86gdaLJguBOABN5FH4OCOadNhVNUQfUaR/5FB2
 AzdrxeGoz6X0V8d1ryjOPD0NrnxjYcfRMWu1KYg3fNg=
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

