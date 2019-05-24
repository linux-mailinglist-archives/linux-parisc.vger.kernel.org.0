Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA77429B3F
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 17:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389419AbfEXPiW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 11:38:22 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:44675 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389385AbfEXPiV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 11:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:To:From:Date;
        bh=cUovIx5kaSxzpHTfoyih7Fjp3pj6r16UjdgnRSitOpQ=; b=tscHpY3QnvxMXBN2c5gDQkYHqK
        lqKpB2xivEtlRRpGkPbCidiJRMj4RaMIO0XTIATHcUiO2NElczrxg2lPpM8lq11mgrDIurlPW4quL
        UwdtAkblBbRY7WtYpAPvQJvwtH1krK7sm9Jjje9izn0ISuctTnShXuTDlDRHyyVOkqmE=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hUCGy-0003TB-Hq
        for linux-parisc@vger.kernel.org; Fri, 24 May 2019 17:38:20 +0200
Date:   Fri, 24 May 2019 17:38:19 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: PCI HPMC on C240 with alternatives Patching
Message-ID: <20190524153819.GA778@t470p.stackframe.org>
References: <20190524065850.GA9849@t470p.stackframe.org>
 <20190524105003.GE9450@t470p.stackframe.org>
 <20190524113241.GA11609@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524113241.GA11609@t470p.stackframe.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

On Fri, May 24, 2019 at 01:32:41PM +0200, Sven Schnelle wrote:
> > Did a quick test, removing ALT_COND_N_IOC_FDC from asm_io_fdc() seems to fix this
> > issue. Haven't looked in more detail into this though.
> 
> Added some debugging:
> 
> [   25.405365] boot_cpu_data.pdc_capabilities: 2
> 
> So PDC says IO-PDIR fetches are not performed coherently, *BUT*:
> 
> When this bit is clear, flushes and syncs are not required. This
> bit is only applicable to SBAs, and does not apply to Legacy IOAs.
> 
> With my limited understand i would think that C240 has a 'Legacy IOA' while
> C3xxx has SBA? So i think we would need to add some check whether we have
> an IOA or SBA in the alternatives code?

I did the patch below to check for legacy IO Adapters. Is HW_BCPORT the right
type? On my C240 both GSC Adapters are HW_BCPORT.


From a5a444d0eb4960d7a1c7c4acf5eeb86b4e11e358 Mon Sep 17 00:00:00 2001
From: Sven Schnelle <svens@stackframe.org>
Date: Fri, 24 May 2019 17:33:28 +0200
Subject: [PATCH] parisc: fix alternative patching for Legacy IO systems

On systems with legacy IO Adapters we must ignore the IO-PDIR
bit we get in the PDC_MODEL response. This fixes booting on
HP9000/C240.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/hardware.h |  1 +
 arch/parisc/kernel/alternative.c   |  8 +++++---
 arch/parisc/kernel/drivers.c       | 14 ++++++++++++++
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/hardware.h b/arch/parisc/include/asm/hardware.h
index 9d3d7737c58b..5fb7a3c3eb46 100644
--- a/arch/parisc/include/asm/hardware.h
+++ b/arch/parisc/include/asm/hardware.h
@@ -121,6 +121,7 @@ extern void init_parisc_bus(void);
 extern struct device *hwpath_to_device(struct hardware_path *modpath);
 extern void device_to_hwpath(struct device *dev, struct hardware_path *path);
 extern int machine_has_merced_bus(void);
+extern int machine_has_ioa(void);
 
 /* inventory.c: */
 extern void do_memory_inventory(void);
diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alternative.c
index bf2274e01a96..ca6368e6e96a 100644
--- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -25,6 +25,7 @@ void __init_or_module apply_alternatives(struct alt_instr *start,
 	struct alt_instr *entry;
 	int index = 0, applied = 0;
 	int num_cpus = num_online_cpus();
+	int has_ioa = machine_has_ioa();
 
 	for (entry = start; entry < end; entry++, index++) {
 
@@ -53,10 +54,11 @@ void __init_or_module apply_alternatives(struct alt_instr *start,
 		/*
 		 * If the PDC_MODEL capabilities has Non-coherent IO-PDIR bit
 		 * set (bit #61, big endian), we have to flush and sync every
-		 * time IO-PDIR is changed in Ike/Astro.
+		 * time IO-PDIR is changed in Ike/Astro. If legacy IOAs are
+		 * present we're not allowed to skip these flushes/syncs.
 		 */
-		if ((cond & ALT_COND_NO_IOC_FDC) &&
-			(boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC))
+		if (((cond & ALT_COND_NO_IOC_FDC) && (has_ioa ||
+		      (boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC))))
 			continue;
 
 		/* Want to replace pdtlb by a pdtlb,l instruction? */
diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index 00a181f1ecc6..4c93b416df99 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -282,6 +282,20 @@ int __init machine_has_merced_bus(void)
 	return ret ? 1 : 0;
 }
 
+static int __init is_IOA_device(struct device *dev, void *data)
+{
+	struct parisc_device *pdev = to_parisc_device(dev);
+
+	if (!check_dev(dev))
+		return 0;
+	return pdev->id.hw_type == HPHW_BCPORT;
+}
+
+int __init machine_has_ioa(void)
+{
+	return !!for_each_padev(is_IOA_device, NULL);
+}
+
 /**
  * find_pa_parent_type - Find a parent of a specific type
  * @dev: The device to start searching from
-- 
2.20.1

