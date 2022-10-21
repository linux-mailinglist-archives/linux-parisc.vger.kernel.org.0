Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BC26071A4
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Oct 2022 10:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiJUIFR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 21 Oct 2022 04:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiJUIFQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 21 Oct 2022 04:05:16 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EEDF07D1
        for <linux-parisc@vger.kernel.org>; Fri, 21 Oct 2022 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666339511;
        bh=TYbgUR/qDXxfxJ3eiCAqBmG8BU64rPEtmG1ejieDqpE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=e8y59b7AmcxPVPQC5zCyW8rGVoMsRL8/ikPKSLD0GFgPTvilzSfBzQwLwBi48g1AP
         6XBjcG/kXYBYKKkAbl52/D4sLcC1o3znM5CXseIGc9ZRQmhqkbjqMtXBUGarXDOrVj
         4ooG62WmFokXJko2SmMyhWvSEH+rnGdiKC42s9G8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.168.94]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOKc-1p6DYf0GMw-00ut55; Fri, 21
 Oct 2022 10:05:11 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Show MPE model string at bootup
Date:   Fri, 21 Oct 2022 10:05:03 +0200
Message-Id: <20221021080503.215792-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TP6NzZ4at8X2HH9VyHl2s+10j4X2KfL1mkGpMwAjhb7EA72vcDk
 GvEaWpR84smufPl8JF2CcsRvEH8/R6//hBbsVS3t1LzmO0iKSPk/WtyN1gyyh5NfMqfSmfO
 KBv0cxbr4m81dO3Stck3S92Uw+VYVMMR2muepgMakhB1yt4C8n9qQ5GQH0H9TfM0AaVnla4
 qNLNjh5CcYkvWxVWTRY5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ujVSqH2/Ejo=:q9iK0EeaeniUzrqx5MOI/k
 eaMv3GwtuXk5vldoQOzWZf+90W9+iHf3DpHQYn13gJ45KKKve019indE+gy/b5Xl5uDSfO1Oe
 StOEM+pFtfr+ottXiv352wqFcG2tebPAPVh37JF0WfcFBwFiPAcTG/s8l4tKA3ZAc6aA4vgEH
 sGPT4gvts13rhRVIv2ttaVbFe5r+JKuuinn3HIY2LHZzLROujhp8TQHpIngNQJKAw7BiNgXBb
 5XNk8vUMU1Bm1JWS1f/NAYy9pQG2Uzd1OVZ+IaUtsaZtr+jBRw1SCF7w7QblF1OpQU2g8azRr
 mNFMPJdebTx0UQityU7tLKk0cD3faFLX/PMR/p0+WI3eqxE5NwKruWSekGaluWtuY2xVDY553
 dSj4y8r1GrH+2dtEKgz4Cohec1YY8+8NGSgpuYi1ZD3/dXbibh7hvLjE3uo4GLRvTibIVvqU2
 sRE2KuZxb/KCHs2oAN/zH6/ghW1L/MKX6MXXbg14lcs/SaFj5ZPhYUy6kUppureD9UgjfAHNZ
 vL93Pc6U+hS5L/w0Wu6Tls1OQcwZjsD3zEaWtsPErb134hmX4bpnopJkIACL+VosS/vQ63tHS
 b+HS+XYR6Y+pOPEACLiFx91G4VgqYFrRQGxTvUwYH1v5ZFitAHA4Ktdmtg+2xfr1gC5i3ccpj
 NgzwXVGNuThJfX7NBixSin/e7UYvxqIUHAqmdVnoGDGuowWw1H0liCvaCoreHvht86mtEa993
 QEaDpXPlFs81paQa3SC43r1TJ67WqIdNCSCSL/HfLtNtq0//TPPmcuiOopfQ/b2/zEc24gyM3
 P2IvnM2MKHicKanXifyavnmSR/Y933ajNf1tOvcPBZd4tFey7sNsJwPug0HzE2qSvGKrKLB+v
 2ylDmWtJRkXzwXf3SBJvzVKea303WtR9gG0OQzD+j3LD2HtLnAu5uE3yWTScV0aRHp8TAnp1C
 X8M0UfEgnz41hAKHPvK1SJHaRhxsLQH2iSANdltEgE1mb/zwoJKLOPCoW53p7bcY0O+bO/UM1
 E6n2cEw/fmj+n2X71S2zDpvBI6W3A+x2B8URf7aH6lAMHMItKc8Q08zDjg6gOR7TONvyvSYwa
 qsDTtrqxFj9Ag/ca6QnhVETgPv/nMOFezTWlpeDat3A+AOVcghstYxKhP9AloXb/T23oGhd4i
 9Cq1AVULD4rqX2Ua8wx9EpNdQxYvls9OWwZr+NkFPnF8sXnhk2vgYsmdkUc/ct/tiVjip1NHp
 tJ+9oUx8SwQ3736KKix0YuN6NrTV4v+OPc5r4I1NUvGghEQkFovBpVKDZmtNE8gdT40okwv9D
 qFQNY5yV5KU/WUOOmVy8niM0lwUPHORWLPfRvmaX0QuW4xFo4IHAW+7/AB8h5xZHeNkTRu740
 oW8EU6DASqjHcPJg1KJhHd0wF/6Xl6MuUeqO2yfzOQQetp8xQvk7JxctpnalBKUZolfLY+QeR
 bT5JofxxtlBtwqfEzgpuk2sz0i2CiX1kL5T+mM4s069NFnY742CWPXtZ8BlH3NgeayrnzMJbB
 oUIysS87YPgfuZhDc5dhJVuQb1m7F8Db3hxD4Q45/S4He
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

If the machine supports running MPE, firmware provides the
MPE specific model name.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/pdc.h  | 2 +-
 arch/parisc/kernel/firmware.c  | 4 ++--
 arch/parisc/kernel/processor.c | 8 ++++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index fcbcf9a96c11..40793bef8429 100644
=2D-- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -37,7 +37,7 @@ int pdc_system_map_find_mods(struct pdc_system_map_mod_i=
nfo *pdc_mod_info,
 int pdc_system_map_find_addrs(struct pdc_system_map_addr_info *pdc_addr_i=
nfo,
 			      long mod_index, long addr_index);
 int pdc_model_info(struct pdc_model *model);
-int pdc_model_sysmodel(char *name);
+int pdc_model_sysmodel(unsigned int os_id, char *name);
 int pdc_model_cpuid(unsigned long *cpu_id);
 int pdc_model_versions(unsigned long *versions, int id);
 int pdc_model_capabilities(unsigned long *capabilities);
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 6a7e315bcc2e..543497342a80 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -527,14 +527,14 @@ int pdc_model_info(struct pdc_model *model)
  * Using OS_ID_HPUX will return the equivalent of the 'modelname' command
  * on HP/UX.
  */
-int pdc_model_sysmodel(char *name)
+int pdc_model_sysmodel(unsigned int os_id, char *name)
 {
         int retval;
 	unsigned long flags;

         spin_lock_irqsave(&pdc_lock, flags);
         retval =3D mem_pdc_call(PDC_MODEL, PDC_MODEL_SYSMODEL, __pa(pdc_r=
esult),
-                              OS_ID_HPUX, __pa(name));
+                              os_id, __pa(name));
         convert_to_wide(pdc_result);

         if (retval =3D=3D PDC_OK) {
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor=
.c
index dddaaa6e7a82..0031b8b7c5aa 100644
=2D-- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -272,10 +272,14 @@ void __init collect_boot_cpu_data(void)
 		printk(KERN_INFO "capabilities 0x%lx\n",
 			boot_cpu_data.pdc.capabilities);

-	if (pdc_model_sysmodel(boot_cpu_data.pdc.sys_model_name) =3D=3D PDC_OK)
-		printk(KERN_INFO "model %s\n",
+	if (pdc_model_sysmodel(OS_ID_HPUX, boot_cpu_data.pdc.sys_model_name) =3D=
=3D PDC_OK)
+		pr_info("HP-UX model name: %s\n",
 			boot_cpu_data.pdc.sys_model_name);

+	serial_no[0] =3D 0;
+	pdc_model_sysmodel(OS_ID_MPEXL, serial_no);
+	pr_info("MPEXL model name: %s\n", serial_no[0] ? serial_no : "n/a");
+
 	dump_stack_set_arch_desc("%s", boot_cpu_data.pdc.sys_model_name);

 	boot_cpu_data.hversion =3D  boot_cpu_data.pdc.model.hversion;
=2D-
2.37.3

