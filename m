Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F2F7A64D6
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Sep 2023 15:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbjISN0q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Sep 2023 09:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbjISN0p (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Sep 2023 09:26:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37B5EC
        for <linux-parisc@vger.kernel.org>; Tue, 19 Sep 2023 06:26:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F25C433C8;
        Tue, 19 Sep 2023 13:26:38 +0000 (UTC)
Date:   Tue, 19 Sep 2023 15:26:35 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix crash with nr_cpus=1 option
Message-ID: <ZQmhi9UoJUerNFAB@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

John David Anglin reported that giving "nr_cpus=1" on the command
line causes a crash, while "maxcpus=1" works.

Reported-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 4098f9a0964b..2019c1f04bd0 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -440,7 +440,9 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 	if (cpu_online(cpu))
 		return 0;
 
-	if (num_online_cpus() < setup_max_cpus && smp_boot_one_cpu(cpu, tidle))
+	if (num_online_cpus() < nr_cpu_ids &&
+		num_online_cpus() < setup_max_cpus &&
+		smp_boot_one_cpu(cpu, tidle))
 		return -EIO;
 
 	return cpu_online(cpu) ? 0 : -EIO;
