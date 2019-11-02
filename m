Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88369ECFCA
	for <lists+linux-parisc@lfdr.de>; Sat,  2 Nov 2019 17:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKBQnS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 2 Nov 2019 12:43:18 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:39761 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726450AbfKBQnS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 2 Nov 2019 12:43:18 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20191102164317.BXTO7367.torfep02.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 2 Nov 2019 12:43:17 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20191102164317.IALW29322.torspm01.bell.net@[192.168.2.49]>;
          Sat, 2 Nov 2019 12:43:17 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Avoid spurious inequivalent alias kernel error
 messages
Openpgp: preference=signencrypt
Message-ID: <523d1e70-27c4-cd0e-30ba-9a1db0c04f30@bell.net>
Date:   Sat, 2 Nov 2019 12:43:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=MeAgGD-zjQ4A:10 a=FBHGMhGWAAAA:8 a=BLsFjivSME__CrEfNi4A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfKKnzjPhXxxNV9Yz0y8i69m+Q3OvmehWz/3BGFM//rqExOdhyYP48zlVsdqu9vzGAMF4rWueoa6dUp91N+s30NnG4yqZgGritLL0rWjc/xaLO9+dSBat NYmvsTFZiPDuM2hgJmqrwokNahgXPVoODYFEtCzHNlFG2tMElBtPyuudM5uIheMEtxLdQ4eSPktHGA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch changes flush_dcache_page() to only print inequivalent alias error messages
on systems that require coherency.  Inequivalent aliases can occur on systems that don't
require coherency and this can cause spurious messages.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---
 arch/parisc/kernel/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index a82b3eaa5398..2407b0b789d3 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -365,7 +365,7 @@ void flush_dcache_page(struct page *page)
 		if (old_addr == 0 || (old_addr & (SHM_COLOUR - 1))
 				      != (addr & (SHM_COLOUR - 1))) {
 			__flush_cache_page(mpnt, addr, page_to_phys(page));
-			if (old_addr)
+			if (parisc_requires_coherency() && old_addr)
 				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %pD\n", old_addr, addr, mpnt->vm_file);
 			old_addr = addr;
 		}

