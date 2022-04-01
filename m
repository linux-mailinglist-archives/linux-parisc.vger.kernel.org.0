Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA234EE922
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Apr 2022 09:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbiDAHeK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 Apr 2022 03:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244722AbiDAHeJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 Apr 2022 03:34:09 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8711225E32B
        for <linux-parisc@vger.kernel.org>; Fri,  1 Apr 2022 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648798331;
        bh=6KOrpts29Pohn7oENhQPsa7ZEgeWmI3n3wrYVR6DbfI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=WW4m/rbY3GH/9FqRlSFUtIyAW40U3ed+AVaorhzCQi5IsrmFodijJBDZvpDYFBeP7
         D7eSYAXC0pzpQK+tCIc9ywmMstWAJC0dKb9EQuVkTAmzQvGb2ZhRs8NItT34tpgq68
         7qJXI4ck+VAx1cdcMKcwPzePn3nqBkJdb5SBL3J4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.191.12]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2wGs-1nbHh13Lqu-003MmZ; Fri, 01
 Apr 2022 09:32:11 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Only list existing CPUs in cpu_possible_mask
Date:   Fri,  1 Apr 2022 09:32:10 +0200
Message-Id: <20220401073210.33645-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZMP7anWF7Il0Qs5dVISnXxMJyb3NnVHgeY+7zOaYEouq5bz2IWM
 PA2RoOYholO5I0BX1tvomUHQGfbSHA9LVz7gtna5BnDfBtuKKxOujpX5AYFX4QhEc5wlybE
 MHGQd4KrLwPCyiA5s992hDabtjwlNX6L//cGeGsfnZ65IxioqCGobbEU0CRAQxP0+RM3M7O
 DfXH1GKmvivM7J56UWJAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xfdaH0yqvI8=:vM1y/i8MT/tocKDXQTOvaQ
 wxby0vI/eHUFXWTgWsc6B2mdLTNMyqD55zMbmz1AA4D77NPtlHC5GiTm/au/2DmwWNNCT+OI/
 3tIyYx3bGeWDQjChv/oECCSrGa6Mgs8XeSCozOBcJTPQjkKh6kMzK95Je4vgA90ylG1cWhP/E
 Uf4E5quDrsh4uTOak6tmxh/CnYQXLsUD/J8T2OvyarsCStkD9LKf2l02YblUZ0ZR+DzVMUpAt
 J+ogXV7gUMrihv1/GhdkwPjH22Ln1MszlFmfiSL0fLFxcWnrzoTLtb3UU+HUqsD0+4ANffJVY
 tef8rQZmLcZsD2Z6P8ObEJnVxOdWUQsJ00+x/VBaUKEcLNCPsz41ZV7BuGdwrAjnKUDNH9jgm
 ebrbB4sa5hbQCyh/NA2Mgm3hEF7mfxFug96gYCgHAK6aYD3h4QmP7aer48+YBg3XCS/qNLvSf
 PbRYFg901z07SytwbbIdZbmQhAr2fzWLi5sTCV/7y3zGsBcrtMIBnP0mtnskM7BR0792RVV10
 tcEXflCR/0Zlug5xOXkKkU0e7fL6iFqAyrIjnRha9nxp+9ak1CtIEu3oDVMdLSgriZhI+QObN
 loxfEZNBd6OM8m+AyGK48PGrNDFXsGsS9EIWNFvfARLpeNJaY8B75bW6q8Eyh7Krq5Yie6YfM
 O3GMZeL43r9ASKu7jT9p7TFaFV+Lz3V+pSnBIZf0kYyIQtdttq2fsUGY/shRO3Rr1xtMbuXXP
 Q20nZwS5nQWkRvvNKC9PWa0UNsqa4KZkOjvpTXNBmARHjDCxbAjvqUOcDmj/7TAIbL9emQ+a6
 cXWCuSQ3iytu8eiYyIYlKyDkC8K2W24wwB5u9IbTtLWxWeqtpwkTjgopkLCE5UZ+qBMQM9cs8
 lt3qLGVfdLGn9CWuDmAmIxaPt6BVr+OVFgIcY6vgwzlH0LHNy7oepm4TUxWTchGiDJ2Wx2YaF
 lslIAmDPuP7grUhmqOm+CyUfWW7+evSQGO29U8CBjz1l90j1R4yuRnuFwRT7/qI7rdUVO8B8a
 XOlNStda1Vk3ThN2QzTP4G88qF1Yc5cL13IMsYbCHEVr+7ReJclFIWonQh42tCPWhTOEzFBea
 NAUh4JqFehOiwI=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The inventory knows which CPUs are in the system, so this bitmask should
be in cpu_possible_mask instead of the bitmask based on CONFIG_NR_CPUS.

Reset the cpu_possible_mask before scanning the system for CPUs, and
mark each existing CPU as possible during initialization of that CPU.

This avoids those warnings later on too:

 register_cpu_capacity_sysctl: too early to get CPU4 device!

Signed-off-by: Helge Deller <deller@gmx.de>
Noticed-by: John David Anglin <dave.anglin@bell.net>
=2D--
 arch/parisc/kernel/processor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor=
.c
index d98692115221..9e92b76b0ce0 100644
=2D-- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -171,6 +171,7 @@ static int __init processor_probe(struct parisc_device=
 *dev)
 	p->cpu_num =3D cpu_info.cpu_num;
 	p->cpu_loc =3D cpu_info.cpu_loc;

+	set_cpu_possible(cpuid, true);
 	store_cpu_topology(cpuid);

 #ifdef CONFIG_SMP
@@ -461,6 +462,13 @@ static struct parisc_driver cpu_driver __refdata =3D =
{
  */
 void __init processor_init(void)
 {
+	unsigned int cpu;
+
 	reset_cpu_topology();
+
+	/* reset possible mask. We will mark those which are possible. */
+	for_each_possible_cpu(cpu)
+		set_cpu_possible(cpu, false);
+
 	register_parisc_driver(&cpu_driver);
 }
=2D-
2.35.1

