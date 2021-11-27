Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C06545FC9E
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 06:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhK0FDS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 00:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbhK0FBR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 00:01:17 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40247C061574
        for <linux-parisc@vger.kernel.org>; Fri, 26 Nov 2021 20:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=JpoOMJMYMW9tcxE94X859etox3VfwYCZQ0qurO9ustY=; b=OZhmPpKbgrBkifLt3TmctHJAkT
        MYxfgYb4vh0t6xBSidvR1uRJ/aHJfKctwweU/JE3b7Njoiq1ELqJASzSgk7ySc8tqFsQOtzUv0LBR
        ktkGOrXxWvkSJz/dUzUhmV87VZNz45IQascPNqOQxz+ZCgopKBlsZI2UtH6LVWhBUdMQ/BVi6J+Is
        Gq9oAmSb2AdjANfBingZIfp0OdZsEsVUI8uyA08pimu5OqxgXP3STwnTJMVeAttyAo2WswyFDimZr
        Vc3txUIU1Gi4cYnF2PF4zDwxTmKMGokKGi3NG6igPkFdjsz+IlIyHpni4MqkJY2Y+xFCtWSq6e91h
        JVVOG+1w==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mqpmg-00CwhV-AM; Sat, 27 Nov 2021 04:57:58 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Kyle McMartin <kyle@mcmartin.ca>,
        David Airlie <airlied@linux.ie>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: [PATCH] agp: parisc-agp: fix section mismatch warning
Date:   Fri, 26 Nov 2021 20:57:57 -0800
Message-Id: <20211127045757.27908-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix section mismatch warning in parisc-agp:

WARNING: modpost: drivers/char/agp/parisc-agp.o(.text+0x7a0): Section mismatch in reference from the function init_module() to the function .init.text:parisc_agp_setup.isra.0()
The function init_module() references
the function __init parisc_agp_setup.isra.0().
This is often because init_module lacks a __init 
annotation or the annotation of parisc_agp_setup.isra.0 is wrong.

Fixes: 08a6436816f7 ("[PARISC] Add support for Quicksilver AGPGART")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: David Airlie <airlied@linux.ie>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 drivers/char/agp/parisc-agp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211126.orig/drivers/char/agp/parisc-agp.c
+++ linux-next-20211126/drivers/char/agp/parisc-agp.c
@@ -378,7 +378,7 @@ find_quicksilver(struct device *dev, voi
 	return 0;
 }
 
-static int
+static int __init
 parisc_agp_init(void)
 {
 	extern struct sba_device *sba_list;
