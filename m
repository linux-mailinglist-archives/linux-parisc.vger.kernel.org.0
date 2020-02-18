Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B375C1633CA
	for <lists+linux-parisc@lfdr.de>; Tue, 18 Feb 2020 22:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgBRVEg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 18 Feb 2020 16:04:36 -0500
Received: from mout.gmx.net ([212.227.17.22]:48863 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbgBRVEf (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 18 Feb 2020 16:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582059862;
        bh=UsrI5tVYKA+G+PCU9qX+wCdnd7UplFqbf8apESoxGCc=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=GPUdoOSaixB0R+FArGPt07QfZBr8jhr38qhKcubx7YYmn1YE6a9kO1t1SUwelpdG2
         RFM+wdHyRDqkmH4Rc+NzbyAJLbY0W/RlC/CWL2yfhA43IoF0S9JpLHMrska57OE+de
         +986Qt/IGKhExoL4hdOF+POuui+kJPEnOurQv6bo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.189.17]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowKc-1jnyih3VYU-00qRQb; Tue, 18
 Feb 2020 22:04:21 +0100
Date:   Tue, 18 Feb 2020 22:04:18 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Refactor alternative code to accept multiple
 conditions
Message-ID: <20200218210418.GA11867@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:VXJEvviRH0bp8Xdx50LSwXpOaZT0zUwSDd1FY1nEuUpcFquyiUF
 7kEzE2LpB+pF/BvHcnl5idJ7qbTRqvinHqxb0JGUc3oVb1CJg9Lobndiyq5II3Ea6Bq0XFP
 hcDYsZI/NRIzP2hat2yzZO8ToYoEzDg4wYEm03qgJdsX8uGB7jxoLf8vVLTdLRzoTDFCERn
 jS/9d0PA/yrEqhalRp48Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3gFvzm6UUvI=:0Ig2TFLXD3HE68wb79ECyz
 1YUGpcF6mZosdWq6C9v3E37stXTnmAg97kCfht2sdySbfIi/sDZWa9xHqzk9pvCqBQ3FhHmtA
 G+YyXzAAwYyjOUawcxBMLiGI3MCIzlo7QMAk5+ZLlgFvr6D2qG9fgpZWuo8SrYNpi9iKNZ3Ey
 RpErzaFLWNw3ITCIVOMZVbp/Hv+dJz+r0WVHoY2PwNQxW4OoMQ8PrX8O5XhLGrvuEZ4PBFwjn
 5yHzehyAXqnYRJpvY42kraAbeSKk9PHQAa1Op7SUP8JEYFeWPISG+hnn3bYZ8244Fz1C5+suW
 EKnlEuS/PVf86Rm4chT5uV/JWcICyVyajXCkdCIUwLVvNEb7PBm320cZMgOv61Dzx50bKFrkk
 sSa/PzAefyVZkAfGpv/R64tzoB9gxYw79bYCnOobpiGw9dSaXr3KZU+g+Lct0iss1g1LSL/OU
 4NCa4DEm0NTgaI/UPdO9XvnVj6Y+Z6OEk+f5h2KXkcT3zl9azn5shxPgeeC2MAWn3CMwYwCR6
 7/MIXiDzn45PhqmXYaZwVpUKiv3ffPGm11XgLHhjF/HRk57UEzskbCm0gRHdn+au0MHywjWOA
 2hTQEocUk6hANR0LNlN4sfouynMB5vzlqP9xKJE2ksoIAyvScuRDpHXIr8hQ6JRrAC2IBKBz3
 NhPZWIGelAuPrQsFAGRUQDmIR3EoWwjcfJWVXjP1tWk0D+erpgpY8+Yr8kurGjmwywPl0Xi+3
 K0YBhH9d+NJ0N2O1y+nOQSW/6DnD9BNMRQkAASgmZdmpmPlH/YEROevWaE9beZgxnBpEW4oxM
 UWhmpvRai7KDqYD/HMWLr+gxPhjbExK8VLVOSS0drdANk7FK6FLCWrzRJTlqdq2CajtHLnkqY
 MZIVh3Uld5qu2RnoLXEwJkY9PfCBAp178Gkb0nsZ1eIxUz8cWVLxQM9cfpCA1hBMJGsA7WgaN
 /ib54klhJQod5U23f9/+dRWolVV1StIO2641wnHcZuoFDDv2smT/FIGeOr96n79LPaF2PhEgT
 3cyt9mXCL0vqJM2yzp84qtymd2sLjynpXc79Wpsg7BJwinyJMmP2E6M0cJFIDuC7aiToimKVQ
 xL005ErsShA60s/ssXnA5haoFi2SdtYWEroDLB4vlUJLuqnVphZnGLJkxYrzU+nUeuKcdTtrL
 pzHJ4ycrhhwsLfIsb24uQsy//afbnFN+XOEqeX4CCAZevMbek80vzSsFGJTRhAudx+eVxWTNV
 fVK45Ybhf+yX9iQPm
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Allow the alternative loop to accept multiple conditions when replacing
existing code, e.g.
	ALTERNATIVE(ALT_COND_NO_SMP | ALT_COND_RUN_ON_QEMU, INSN_NOP)

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index 3c66d5c4d90d..fa28c4c9f972 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -25,6 +25,22 @@ void __init_or_module apply_alternatives(struct alt_ins=
tr *start,
 	struct alt_instr *entry;
 	int index =3D 0, applied =3D 0;
 	int num_cpus =3D num_online_cpus();
+	u32 cond_check;
+
+	cond_check =3D ALT_COND_ALWAYS |
+		((num_cpus =3D=3D 1) ? ALT_COND_NO_SMP : 0) |
+		((cache_info.dc_size =3D=3D 0) ? ALT_COND_NO_DCACHE : 0) |
+		((cache_info.ic_size =3D=3D 0) ? ALT_COND_NO_ICACHE : 0) |
+		(running_on_qemu ? ALT_COND_RUN_ON_QEMU : 0) |
+		((split_tlb =3D=3D 0) ? ALT_COND_NO_SPLIT_TLB : 0) |
+		/*
+		 * If the PDC_MODEL capabilities has Non-coherent IO-PDIR bit
+		 * set (bit #61, big endian), we have to flush and sync every
+		 * time IO-PDIR is changed in Ike/Astro.
+		 */
+		(((boot_cpu_data.cpu_type > pcxw_) &&
+		  ((boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC) =3D=3D 0))
+			? ALT_COND_NO_IOC_FDC : 0);

 	for (entry =3D start; entry < end; entry++, index++) {

@@ -38,29 +54,14 @@ void __init_or_module apply_alternatives(struct alt_in=
str *start,

 		WARN_ON(!cond);

-		if (cond !=3D ALT_COND_ALWAYS && no_alternatives)
+		if ((cond & ALT_COND_ALWAYS) =3D=3D 0 && no_alternatives)
 			continue;

 		pr_debug("Check %d: Cond 0x%x, Replace %02d instructions @ 0x%px with 0=
x%08x\n",
 			index, cond, len, from, replacement);

-		if ((cond & ALT_COND_NO_SMP) && (num_cpus !=3D 1))
-			continue;
-		if ((cond & ALT_COND_NO_DCACHE) && (cache_info.dc_size !=3D 0))
-			continue;
-		if ((cond & ALT_COND_NO_ICACHE) && (cache_info.ic_size !=3D 0))
-			continue;
-		if ((cond & ALT_COND_RUN_ON_QEMU) && !running_on_qemu)
-			continue;
-
-		/*
-		 * If the PDC_MODEL capabilities has Non-coherent IO-PDIR bit
-		 * set (bit #61, big endian), we have to flush and sync every
-		 * time IO-PDIR is changed in Ike/Astro.
-		 */
-		if ((cond & ALT_COND_NO_IOC_FDC) &&
-			((boot_cpu_data.cpu_type <=3D pcxw_) ||
-			 (boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC)))
+		/* Bounce out if none of the conditions are true. */
+		if ((cond & cond_check) =3D=3D 0)
 			continue;

 		/* Want to replace pdtlb by a pdtlb,l instruction? */
