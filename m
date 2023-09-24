Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7618A7AC847
	for <lists+linux-parisc@lfdr.de>; Sun, 24 Sep 2023 15:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjIXNPz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 24 Sep 2023 09:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjIXNPy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 24 Sep 2023 09:15:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E0710C;
        Sun, 24 Sep 2023 06:15:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EEDC433CA;
        Sun, 24 Sep 2023 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695561347;
        bh=cX7fWavdVEaDRIk1W78pabfpJl0ZPApGGMObsWt8he4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Piq91H9Wm3p68gVgmJYL4k9iGJeQsvcr9GWWdrEYQ32gFEQxdPTmD7n7k8N/QOg21
         WeXy1sLH05SVRoZwB7jL3/4Ta1jvhHa+YBv1V+xoJDifdUwz84qOdQ6pXGktlCStH5
         Iq41WqBkRzWS9RydKsB1P9WAcrWBooObyEKSY4hjCZQVHbrcpS5RDdaKyUiv4KNHlc
         lFONIzb7L05lghO3PQxL0qLOiBvFhV95HRzTe5/4tKaHFfp0OdduoCkE6ddHpBd3oR
         dvLIQDSRMha6cnmKoQHsto0y3ynR+UxveJu3yRaQg2rL+8+854Z0TIFyU1P86cgIH/
         BWGKvOWX4IGDA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>,
        James.Bottomley@HansenPartnership.com, linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 07/41] parisc: irq: Make irq_stack_union static to avoid sparse warning
Date:   Sun, 24 Sep 2023 09:14:55 -0400
Message-Id: <20230924131529.1275335-7-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131529.1275335-1-sashal@kernel.org>
References: <20230924131529.1275335-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.5
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

[ Upstream commit b1bef1388c427cdad7331a9c8eb4ebbbe5b954b0 ]

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/parisc/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 12c4d4104ade4..2f81bfd4f15e1 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -365,7 +365,7 @@ union irq_stack_union {
 	volatile unsigned int lock[1];
 };
 
-DEFINE_PER_CPU(union irq_stack_union, irq_stack_union) = {
+static DEFINE_PER_CPU(union irq_stack_union, irq_stack_union) = {
 		.slock = { 1,1,1,1 },
 	};
 #endif
-- 
2.40.1

