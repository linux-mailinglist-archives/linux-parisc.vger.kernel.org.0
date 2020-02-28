Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96E3A173320
	for <lists+linux-parisc@lfdr.de>; Fri, 28 Feb 2020 09:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgB1Imh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 28 Feb 2020 03:42:37 -0500
Received: from smtprelay0244.hostedemail.com ([216.40.44.244]:36890 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725877AbgB1Img (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 28 Feb 2020 03:42:36 -0500
X-Greylist: delayed 510 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Feb 2020 03:42:34 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 0551318015DB7
        for <linux-parisc@vger.kernel.org>; Fri, 28 Feb 2020 08:34:04 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 6498E182CED2A;
        Fri, 28 Feb 2020 08:33:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:69:327:355:379:541:800:960:966:973:988:989:1260:1311:1314:1345:1359:1437:1515:1605:1730:1747:1777:1792:2196:2198:2199:2200:2393:2553:2559:2562:2689:2693:2898:2902:2904:3138:3139:3140:3141:3142:3308:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:4385:4605:5007:6117:6119:6121:6261:7875:7903:7904:8603:8957:9036:9040:10004:10848:11026:11473:11658:11914:12043:12048:12294:12296:12297:12438:12555:12679:12683:12895:12986:13894:13972:14394:21060:21080:21222:21324:21451:21627:21740:21795:21809:21939:21966:21983:21987:21990:30003:30026:30029:30034:30051:30054:30070:30075:30080:30090,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: rub45_79f2f505a2410
X-Filterd-Recvd-Size: 30686
Received: from joe-laptop.perches.com (unknown [47.151.143.254])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Fri, 28 Feb 2020 08:33:57 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>
Cc:     linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [PATCH 1/7] parport: Convert printk(KERN_<LEVEL> to pr_<level>(
Date:   Fri, 28 Feb 2020 00:32:12 -0800
Message-Id: <08fcca629679c3100ba96656dab7a07c32e35961.1582878393.git.joe@perches.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1582878393.git.joe@perches.com>
References: <cover.1582878393.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Use the more common kernel style.

Miscellanea:

o Coalesce formats
o Realign arguments

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/parport/daisy.c          |   6 +-
 drivers/parport/ieee1284.c       |   4 +-
 drivers/parport/ieee1284_ops.c   |   3 +-
 drivers/parport/parport_amiga.c  |   2 +-
 drivers/parport/parport_atari.c  |   2 +-
 drivers/parport/parport_cs.c     |   6 +-
 drivers/parport/parport_gsc.c    |   7 +-
 drivers/parport/parport_ip32.c   |  25 ++---
 drivers/parport/parport_mfc3.c   |   2 +-
 drivers/parport/parport_pc.c     | 166 +++++++++++++------------------
 drivers/parport/parport_sunbpp.c |   2 +-
 drivers/parport/probe.c          |   7 +-
 drivers/parport/share.c          |  24 ++---
 13 files changed, 110 insertions(+), 146 deletions(-)

diff --git a/drivers/parport/daisy.c b/drivers/parport/daisy.c
index 3b00e2c..f87cc80 100644
--- a/drivers/parport/daisy.c
+++ b/drivers/parport/daisy.c
@@ -145,8 +145,7 @@ int parport_daisy_init(struct parport *port)
 	    ((num_ports = num_mux_ports(port)) == 2 || num_ports == 4)) {
 		/* Leave original as port zero. */
 		port->muxport = 0;
-		printk(KERN_INFO
-			"%s: 1st (default) port of %d-way multiplexor\n",
+		pr_info("%s: 1st (default) port of %d-way multiplexor\n",
 			port->name, num_ports);
 		for (i = 1; i < num_ports; i++) {
 			/* Clone the port. */
@@ -159,8 +158,7 @@ int parport_daisy_init(struct parport *port)
 				continue;
 			}
 
-			printk(KERN_INFO
-				"%s: %d%s port of %d-way multiplexor on %s\n",
+			pr_info("%s: %d%s port of %d-way multiplexor on %s\n",
 				extra->name, i + 1, th[i + 1], num_ports,
 				port->name);
 
diff --git a/drivers/parport/ieee1284.c b/drivers/parport/ieee1284.c
index ba562bc..f28d6a3 100644
--- a/drivers/parport/ieee1284.c
+++ b/drivers/parport/ieee1284.c
@@ -319,7 +319,7 @@ int parport_negotiate (struct parport *port, int mode)
 #ifndef CONFIG_PARPORT_1284
 	if (mode == IEEE1284_MODE_COMPAT)
 		return 0;
-	printk (KERN_ERR "parport: IEEE1284 not supported in this kernel\n");
+	pr_err("parport: IEEE1284 not supported in this kernel\n");
 	return -1;
 #else
 	int m = mode & ~IEEE1284_ADDR;
@@ -674,7 +674,7 @@ ssize_t parport_write (struct parport *port, const void *buffer, size_t len)
 ssize_t parport_read (struct parport *port, void *buffer, size_t len)
 {
 #ifndef CONFIG_PARPORT_1284
-	printk (KERN_ERR "parport: IEEE1284 not supported in this kernel\n");
+	pr_err("parport: IEEE1284 not supported in this kernel\n");
 	return -ENODEV;
 #else
 	int mode = port->physport->ieee1284.mode;
diff --git a/drivers/parport/ieee1284_ops.c b/drivers/parport/ieee1284_ops.c
index b1c9f51..2c11bd 100644
--- a/drivers/parport/ieee1284_ops.c
+++ b/drivers/parport/ieee1284_ops.c
@@ -579,8 +579,7 @@ size_t parport_ieee1284_ecp_read_data (struct parport *port,
 			pr_debug("ECP read timed out at 45\n");
 
 			if (command)
-				printk (KERN_WARNING
-					"%s: command ignored (%02x)\n",
+				pr_warn("%s: command ignored (%02x)\n",
 					port->name, byte);
 
 			break;
diff --git a/drivers/parport/parport_amiga.c b/drivers/parport/parport_amiga.c
index 3301861f..8c7a598a 100644
--- a/drivers/parport/parport_amiga.c
+++ b/drivers/parport/parport_amiga.c
@@ -212,7 +212,7 @@ static int __init amiga_parallel_probe(struct platform_device *pdev)
 	if (err)
 		goto out_irq;
 
-	printk(KERN_INFO "%s: Amiga built-in port using irq\n", p->name);
+	pr_info("%s: Amiga built-in port using irq\n", p->name);
 	/* XXX: set operating mode */
 	parport_announce_port(p);
 
diff --git a/drivers/parport/parport_atari.c b/drivers/parport/parport_atari.c
index f8dd368b..2ff0fe0 100644
--- a/drivers/parport/parport_atari.c
+++ b/drivers/parport/parport_atari.c
@@ -200,7 +200,7 @@ static int __init parport_atari_init(void)
 		}
 
 		this_port = p;
-		printk(KERN_INFO "%s: Atari built-in port using irq\n", p->name);
+		pr_info("%s: Atari built-in port using irq\n", p->name);
 		parport_announce_port (p);
 
 		return 0;
diff --git a/drivers/parport/parport_cs.c b/drivers/parport/parport_cs.c
index e77044c2..8e7e3ac 100644
--- a/drivers/parport/parport_cs.c
+++ b/drivers/parport/parport_cs.c
@@ -142,10 +142,8 @@ static int parport_config(struct pcmcia_device *link)
 			      link->irq, PARPORT_DMA_NONE,
 			      &link->dev, IRQF_SHARED);
     if (p == NULL) {
-	printk(KERN_NOTICE "parport_cs: parport_pc_probe_port() at "
-	       "0x%3x, irq %u failed\n",
-	       (unsigned int) link->resource[0]->start,
-	       link->irq);
+	    pr_notice("parport_cs: parport_pc_probe_port() at 0x%3x, irq %u failed\n",
+		      (unsigned int)link->resource[0]->start, link->irq);
 	goto failed;
     }
 
diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 922535a..81082d 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -282,7 +282,7 @@ struct parport *parport_gsc_probe_port(unsigned long base,
 	p->size = (p->modes & PARPORT_MODE_EPP)?8:3;
 	p->private_data = priv;
 
-	printk(KERN_INFO "%s: PC-style at 0x%lx", p->name, p->base);
+	pr_info("%s: PC-style at 0x%lx", p->name, p->base);
 	p->irq = irq;
 	if (p->irq == PARPORT_IRQ_AUTO) {
 		p->irq = PARPORT_IRQ_NONE;
@@ -315,8 +315,7 @@ struct parport *parport_gsc_probe_port(unsigned long base,
 	if (p->irq != PARPORT_IRQ_NONE) {
 		if (request_irq (p->irq, parport_irq_handler,
 				 0, p->name, p)) {
-			printk (KERN_WARNING "%s: irq %d in use, "
-				"resorting to polled operation\n",
+			pr_warn("%s: irq %d in use, resorting to polled operation\n",
 				p->name, p->irq);
 			p->irq = PARPORT_IRQ_NONE;
 			p->dma = PARPORT_DMA_NONE;
@@ -347,7 +346,7 @@ static int __init parport_init_chip(struct parisc_device *dev)
 	unsigned long port;
 
 	if (!dev->irq) {
-		printk(KERN_WARNING "IRQ not found for parallel device at 0x%llx\n",
+		pr_warn("IRQ not found for parallel device at 0x%llx\n",
 			(unsigned long long)dev->hpa.start);
 		return -ENODEV;
 	}
diff --git a/drivers/parport/parport_ip32.c b/drivers/parport/parport_ip32.c
index ab215b..4f76e4 100644
--- a/drivers/parport/parport_ip32.c
+++ b/drivers/parport/parport_ip32.c
@@ -1337,9 +1337,8 @@ static unsigned int parport_ip32_fwp_wait_interrupt(struct parport *p)
 			ecr = parport_ip32_read_econtrol(p);
 			if ((ecr & ECR_F_EMPTY) && !(ecr & ECR_SERVINTR)
 			    && !lost_interrupt) {
-				printk(KERN_WARNING PPIP32
-				       "%s: lost interrupt in %s\n",
-				       p->name, __func__);
+				pr_warn(PPIP32 "%s: lost interrupt in %s\n",
+					p->name, __func__);
 				lost_interrupt = 1;
 			}
 		}
@@ -1643,8 +1642,8 @@ static size_t parport_ip32_compat_write_data(struct parport *p,
 				       DSR_nBUSY | DSR_nFAULT)) {
 		/* Avoid to flood the logs */
 		if (ready_before)
-			printk(KERN_INFO PPIP32 "%s: not ready in %s\n",
-			       p->name, __func__);
+			pr_info(PPIP32 "%s: not ready in %s\n",
+				p->name, __func__);
 		ready_before = 0;
 		goto stop;
 	}
@@ -1724,8 +1723,8 @@ static size_t parport_ip32_ecp_write_data(struct parport *p,
 				       DSR_nBUSY | DSR_nFAULT)) {
 		/* Avoid to flood the logs */
 		if (ready_before)
-			printk(KERN_INFO PPIP32 "%s: not ready in %s\n",
-			       p->name, __func__);
+			pr_info(PPIP32 "%s: not ready in %s\n",
+				p->name, __func__);
 		ready_before = 0;
 		goto stop;
 	}
@@ -2064,8 +2063,7 @@ static __init struct parport *parport_ip32_probe_port(void)
 	p->modes |= PARPORT_MODE_TRISTATE;
 
 	if (!parport_ip32_fifo_supported(p)) {
-		printk(KERN_WARNING PPIP32
-		       "%s: error: FIFO disabled\n", p->name);
+		pr_warn(PPIP32 "%s: error: FIFO disabled\n", p->name);
 		/* Disable hardware modes depending on a working FIFO. */
 		features &= ~PARPORT_IP32_ENABLE_SPP;
 		features &= ~PARPORT_IP32_ENABLE_ECP;
@@ -2077,8 +2075,7 @@ static __init struct parport *parport_ip32_probe_port(void)
 	if (features & PARPORT_IP32_ENABLE_IRQ) {
 		int irq = MACEISA_PARALLEL_IRQ;
 		if (request_irq(irq, parport_ip32_interrupt, 0, p->name, p)) {
-			printk(KERN_WARNING PPIP32
-			       "%s: error: IRQ disabled\n", p->name);
+			pr_warn(PPIP32 "%s: error: IRQ disabled\n", p->name);
 			/* DMA cannot work without interrupts. */
 			features &= ~PARPORT_IP32_ENABLE_DMA;
 		} else {
@@ -2091,8 +2088,7 @@ static __init struct parport *parport_ip32_probe_port(void)
 	/* Allocate DMA resources */
 	if (features & PARPORT_IP32_ENABLE_DMA) {
 		if (parport_ip32_dma_register())
-			printk(KERN_WARNING PPIP32
-			       "%s: error: DMA disabled\n", p->name);
+			pr_warn(PPIP32 "%s: error: DMA disabled\n", p->name);
 		else {
 			pr_probe(p, "DMA support enabled\n");
 			p->dma = 0; /* arbitrary value != PARPORT_DMA_NONE */
@@ -2134,8 +2130,7 @@ static __init struct parport *parport_ip32_probe_port(void)
 	parport_ip32_dump_state(p, "end init", 0);
 
 	/* Print out what we found */
-	printk(KERN_INFO "%s: SGI IP32 at 0x%lx (0x%lx)",
-	       p->name, p->base, p->base_hi);
+	pr_info("%s: SGI IP32 at 0x%lx (0x%lx)", p->name, p->base, p->base_hi);
 	if (p->irq != PARPORT_IRQ_NONE)
 		printk(", irq %d", p->irq);
 	printk(" [");
diff --git a/drivers/parport/parport_mfc3.c b/drivers/parport/parport_mfc3.c
index 9f87faf..3190ef0 100644
--- a/drivers/parport/parport_mfc3.c
+++ b/drivers/parport/parport_mfc3.c
@@ -325,7 +325,7 @@ static int __init parport_mfc3_init(void)
 		p->dev = &z->dev;
 
 		this_port[pias++] = p;
-		printk(KERN_INFO "%s: Multiface III port using irq\n", p->name);
+		pr_info("%s: Multiface III port using irq\n", p->name);
 		/* XXX: set operating mode */
 
 		p->private_data = (void *)piabase;
diff --git a/drivers/parport/parport_pc.c b/drivers/parport/parport_pc.c
index 1f17a3..2872c67 100644
--- a/drivers/parport/parport_pc.c
+++ b/drivers/parport/parport_pc.c
@@ -982,28 +982,24 @@ static void show_parconfig_smsc37c669(int io, int key)
 	outb(0xaa, io);
 
 	if (verbose_probing) {
-		printk(KERN_INFO
-			"SMSC 37c669 LPT Config: cr_1=0x%02x, 4=0x%02x, "
-			"A=0x%2x, 23=0x%02x, 26=0x%02x, 27=0x%02x\n",
+		pr_info("SMSC 37c669 LPT Config: cr_1=0x%02x, 4=0x%02x, A=0x%2x, 23=0x%02x, 26=0x%02x, 27=0x%02x\n",
 			cr1, cr4, cra, cr23, cr26, cr27);
 
 		/* The documentation calls DMA and IRQ-Lines by letters, so
 		   the board maker can/will wire them
 		   appropriately/randomly...  G=reserved H=IDE-irq, */
-		printk(KERN_INFO
-	"SMSC LPT Config: io=0x%04x, irq=%c, dma=%c, fifo threshold=%d\n",
-				cr23 * 4,
-				(cr27 & 0x0f) ? 'A' - 1 + (cr27 & 0x0f) : '-',
-				(cr26 & 0x0f) ? 'A' - 1 + (cr26 & 0x0f) : '-',
-				cra & 0x0f);
-		printk(KERN_INFO "SMSC LPT Config: enabled=%s power=%s\n",
-		       (cr23 * 4 >= 0x100) ? "yes" : "no",
-		       (cr1 & 4) ? "yes" : "no");
-		printk(KERN_INFO
-			"SMSC LPT Config: Port mode=%s, EPP version =%s\n",
-				(cr1 & 0x08) ? "Standard mode only (SPP)"
-					      : modes[cr4 & 0x03],
-				(cr4 & 0x40) ? "1.7" : "1.9");
+		pr_info("SMSC LPT Config: io=0x%04x, irq=%c, dma=%c, fifo threshold=%d\n",
+			cr23 * 4,
+			(cr27 & 0x0f) ? 'A' - 1 + (cr27 & 0x0f) : '-',
+			(cr26 & 0x0f) ? 'A' - 1 + (cr26 & 0x0f) : '-',
+			cra & 0x0f);
+		pr_info("SMSC LPT Config: enabled=%s power=%s\n",
+			(cr23 * 4 >= 0x100) ? "yes" : "no",
+			(cr1 & 4) ? "yes" : "no");
+		pr_info("SMSC LPT Config: Port mode=%s, EPP version =%s\n",
+			(cr1 & 0x08) ? "Standard mode only (SPP)"
+			: modes[cr4 & 0x03],
+			(cr4 & 0x40) ? "1.7" : "1.9");
 	}
 
 	/* Heuristics !  BIOS setup for this mainboard device limits
@@ -1013,7 +1009,7 @@ static void show_parconfig_smsc37c669(int io, int key)
 	if (cr23 * 4 >= 0x100) { /* if active */
 		s = find_free_superio();
 		if (s == NULL)
-			printk(KERN_INFO "Super-IO: too many chips!\n");
+			pr_info("Super-IO: too many chips!\n");
 		else {
 			int d;
 			switch (cr23 * 4) {
@@ -1078,26 +1074,24 @@ static void show_parconfig_winbond(int io, int key)
 	outb(0xaa, io);
 
 	if (verbose_probing) {
-		printk(KERN_INFO
-    "Winbond LPT Config: cr_30=%02x 60,61=%02x%02x 70=%02x 74=%02x, f0=%02x\n",
-					cr30, cr60, cr61, cr70, cr74, crf0);
-		printk(KERN_INFO "Winbond LPT Config: active=%s, io=0x%02x%02x irq=%d, ",
-		       (cr30 & 0x01) ? "yes" : "no", cr60, cr61, cr70 & 0x0f);
+		pr_info("Winbond LPT Config: cr_30=%02x 60,61=%02x%02x 70=%02x 74=%02x, f0=%02x\n",
+			cr30, cr60, cr61, cr70, cr74, crf0);
+		pr_info("Winbond LPT Config: active=%s, io=0x%02x%02x irq=%d, ",
+			(cr30 & 0x01) ? "yes" : "no", cr60, cr61, cr70 & 0x0f);
 		if ((cr74 & 0x07) > 3)
 			pr_cont("dma=none\n");
 		else
 			pr_cont("dma=%d\n", cr74 & 0x07);
-		printk(KERN_INFO
-		    "Winbond LPT Config: irqtype=%s, ECP fifo threshold=%d\n",
-					irqtypes[crf0>>7], (crf0>>3)&0x0f);
-		printk(KERN_INFO "Winbond LPT Config: Port mode=%s\n",
-					modes[crf0 & 0x07]);
+		pr_info("Winbond LPT Config: irqtype=%s, ECP fifo threshold=%d\n",
+			irqtypes[crf0 >> 7], (crf0 >> 3) & 0x0f);
+		pr_info("Winbond LPT Config: Port mode=%s\n",
+			modes[crf0 & 0x07]);
 	}
 
 	if (cr30 & 0x01) { /* the settings can be interrogated later ... */
 		s = find_free_superio();
 		if (s == NULL)
-			printk(KERN_INFO "Super-IO: too many chips!\n");
+			pr_info("Super-IO: too many chips!\n");
 		else {
 			s->io = (cr60 << 8) | cr61;
 			s->irq = cr70 & 0x0f;
@@ -1151,9 +1145,8 @@ static void decode_winbond(int efer, int key, int devid, int devrev, int oldid)
 		progif = 0;
 
 	if (verbose_probing)
-		printk(KERN_INFO "Winbond chip at EFER=0x%x key=0x%02x "
-		       "devid=%02x devrev=%02x oldid=%02x type=%s\n",
-		       efer, key, devid, devrev, oldid, type);
+		pr_info("Winbond chip at EFER=0x%x key=0x%02x devid=%02x devrev=%02x oldid=%02x type=%s\n",
+			efer, key, devid, devrev, oldid, type);
 
 	if (progif == 2)
 		show_parconfig_winbond(efer, key);
@@ -1184,9 +1177,8 @@ static void decode_smsc(int efer, int key, int devid, int devrev)
 		type = "37c666GT";
 
 	if (verbose_probing)
-		printk(KERN_INFO "SMSC chip at EFER=0x%x "
-		       "key=0x%02x devid=%02x devrev=%02x type=%s\n",
-		       efer, key, devid, devrev, type);
+		pr_info("SMSC chip at EFER=0x%x key=0x%02x devid=%02x devrev=%02x type=%s\n",
+			efer, key, devid, devrev, type);
 
 	if (func)
 		func(efer, key);
@@ -1358,7 +1350,7 @@ static void detect_and_report_it87(void)
 	dev |= inb(0x2f);
 	if (dev == 0x8712 || dev == 0x8705 || dev == 0x8715 ||
 	    dev == 0x8716 || dev == 0x8718 || dev == 0x8726) {
-		printk(KERN_INFO "IT%04X SuperIO detected.\n", dev);
+		pr_info("IT%04X SuperIO detected\n", dev);
 		outb(0x07, 0x2E);	/* Parallel Port */
 		outb(0x03, 0x2F);
 		outb(0xF0, 0x2E);	/* BOOT 0x80 off */
@@ -1445,8 +1437,8 @@ static int parport_SPP_supported(struct parport *pb)
 	if (user_specified)
 		/* That didn't work, but the user thinks there's a
 		 * port here. */
-		printk(KERN_INFO "parport 0x%lx (WARNING): CTR: "
-			"wrote 0x%02x, read 0x%02x\n", pb->base, w, r);
+		pr_info("parport 0x%lx (WARNING): CTR: wrote 0x%02x, read 0x%02x\n",
+			pb->base, w, r);
 
 	/* Try the data register.  The data lines aren't tri-stated at
 	 * this stage, so we expect back what we wrote. */
@@ -1464,10 +1456,9 @@ static int parport_SPP_supported(struct parport *pb)
 	if (user_specified) {
 		/* Didn't work, but the user is convinced this is the
 		 * place. */
-		printk(KERN_INFO "parport 0x%lx (WARNING): DATA: "
-			"wrote 0x%02x, read 0x%02x\n", pb->base, w, r);
-		printk(KERN_INFO "parport 0x%lx: You gave this address, "
-			"but there is probably no parallel port there!\n",
+		pr_info("parport 0x%lx (WARNING): DATA: wrote 0x%02x, read 0x%02x\n",
+			pb->base, w, r);
+		pr_info("parport 0x%lx: You gave this address, but there is probably no parallel port there!\n",
 			pb->base);
 	}
 
@@ -1642,7 +1633,7 @@ static int parport_ECP_supported(struct parport *pb)
 
 	if (i <= priv->fifo_depth) {
 		if (verbose_probing)
-			printk(KERN_INFO "0x%lx: readIntrThreshold is %d\n",
+			pr_info("0x%lx: readIntrThreshold is %d\n",
 				pb->base, i);
 	} else
 		/* Number of bytes we can read if we get an interrupt. */
@@ -1657,17 +1648,14 @@ static int parport_ECP_supported(struct parport *pb)
 	switch (pword) {
 	case 0:
 		pword = 2;
-		printk(KERN_WARNING "0x%lx: Unsupported pword size!\n",
-			pb->base);
+		pr_warn("0x%lx: Unsupported pword size!\n", pb->base);
 		break;
 	case 2:
 		pword = 4;
-		printk(KERN_WARNING "0x%lx: Unsupported pword size!\n",
-			pb->base);
+		pr_warn("0x%lx: Unsupported pword size!\n", pb->base);
 		break;
 	default:
-		printk(KERN_WARNING "0x%lx: Unknown implementation ID\n",
-			pb->base);
+		pr_warn("0x%lx: Unknown implementation ID\n", pb->base);
 		/* Fall through - Assume 1 */
 	case 1:
 		pword = 1;
@@ -2107,9 +2095,9 @@ struct parport *parport_pc_probe_port(unsigned long int base,
 
 	p->size = (p->modes & PARPORT_MODE_EPP) ? 8 : 3;
 
-	printk(KERN_INFO "%s: PC-style at 0x%lx", p->name, p->base);
+	pr_info("%s: PC-style at 0x%lx", p->name, p->base);
 	if (p->base_hi && priv->ecr)
-		printk(KERN_CONT " (0x%lx)", p->base_hi);
+		pr_cont(" (0x%lx)", p->base_hi);
 	if (p->irq == PARPORT_IRQ_AUTO) {
 		p->irq = PARPORT_IRQ_NONE;
 		parport_irq_probe(p);
@@ -2120,7 +2108,7 @@ struct parport *parport_pc_probe_port(unsigned long int base,
 		p->irq = PARPORT_IRQ_NONE;
 	}
 	if (p->irq != PARPORT_IRQ_NONE) {
-		printk(KERN_CONT ", irq %d", p->irq);
+		pr_cont(", irq %d", p->irq);
 		priv->ctr_writable |= 0x10;
 
 		if (p->dma == PARPORT_DMA_AUTO) {
@@ -2144,21 +2132,21 @@ struct parport *parport_pc_probe_port(unsigned long int base,
 		/* p->ops->ecp_read_data = parport_pc_ecp_read_block_pio; */
 #endif /* IEEE 1284 support */
 		if (p->dma != PARPORT_DMA_NONE) {
-			printk(KERN_CONT ", dma %d", p->dma);
+			pr_cont(", dma %d", p->dma);
 			p->modes |= PARPORT_MODE_DMA;
 		} else
-			printk(KERN_CONT ", using FIFO");
+			pr_cont(", using FIFO");
 	} else
 		/* We can't use the DMA channel after all. */
 		p->dma = PARPORT_DMA_NONE;
 #endif /* Allowed to use FIFO/DMA */
 
-	printk(KERN_CONT " [");
+	pr_cont(" [");
 
 #define printmode(x) \
 	{\
 		if (p->modes & PARPORT_MODE_##x) {\
-			printk(KERN_CONT "%s%s", f ? "," : "", #x);\
+			pr_cont("%s%s", f ? "," : "", #x);	\
 			f++;\
 		} \
 	}
@@ -2174,11 +2162,11 @@ struct parport *parport_pc_probe_port(unsigned long int base,
 	}
 #undef printmode
 #ifndef CONFIG_PARPORT_1284
-	printk(KERN_CONT "(,...)");
+	pr_cont("(,...)");
 #endif /* CONFIG_PARPORT_1284 */
-	printk(KERN_CONT "]\n");
+	pr_cont("]\n");
 	if (probedirq != PARPORT_IRQ_NONE)
-		printk(KERN_INFO "%s: irq %d detected\n", p->name, probedirq);
+		pr_info("%s: irq %d detected\n", p->name, probedirq);
 
 	/* If No ECP release the ports grabbed above. */
 	if (ECR_res && (p->modes & PARPORT_MODE_ECP) == 0) {
@@ -2193,8 +2181,7 @@ struct parport *parport_pc_probe_port(unsigned long int base,
 	if (p->irq != PARPORT_IRQ_NONE) {
 		if (request_irq(p->irq, parport_irq_handler,
 				 irqflags, p->name, p)) {
-			printk(KERN_WARNING "%s: irq %d in use, "
-				"resorting to polled operation\n",
+			pr_warn("%s: irq %d in use, resorting to polled operation\n",
 				p->name, p->irq);
 			p->irq = PARPORT_IRQ_NONE;
 			p->dma = PARPORT_DMA_NONE;
@@ -2204,8 +2191,7 @@ struct parport *parport_pc_probe_port(unsigned long int base,
 #ifdef HAS_DMA
 		if (p->dma != PARPORT_DMA_NONE) {
 			if (request_dma(p->dma, p->name)) {
-				printk(KERN_WARNING "%s: dma %d in use, "
-					"resorting to PIO operation\n",
+				pr_warn("%s: dma %d in use, resorting to PIO operation\n",
 					p->name, p->dma);
 				p->dma = PARPORT_DMA_NONE;
 			} else {
@@ -2215,9 +2201,7 @@ struct parport *parport_pc_probe_port(unsigned long int base,
 						       &priv->dma_handle,
 						       GFP_KERNEL);
 				if (!priv->dma_buf) {
-					printk(KERN_WARNING "%s: "
-						"cannot get buffer for DMA, "
-						"resorting to PIO operation\n",
+					pr_warn("%s: cannot get buffer for DMA, resorting to PIO operation\n",
 						p->name);
 					free_dma(p->dma);
 					p->dma = PARPORT_DMA_NONE;
@@ -2330,7 +2314,7 @@ static int sio_ite_8872_probe(struct pci_dev *pdev, int autoirq, int autodma,
 		}
 	}
 	if (i >= 5) {
-		printk(KERN_INFO "parport_pc: cannot find ITE8872 INTA\n");
+		pr_info("parport_pc: cannot find ITE8872 INTA\n");
 		return 0;
 	}
 
@@ -2339,29 +2323,28 @@ static int sio_ite_8872_probe(struct pci_dev *pdev, int autoirq, int autodma,
 
 	switch (type) {
 	case 0x2:
-		printk(KERN_INFO "parport_pc: ITE8871 found (1P)\n");
+		pr_info("parport_pc: ITE8871 found (1P)\n");
 		ite8872set = 0x64200000;
 		break;
 	case 0xa:
-		printk(KERN_INFO "parport_pc: ITE8875 found (1P)\n");
+		pr_info("parport_pc: ITE8875 found (1P)\n");
 		ite8872set = 0x64200000;
 		break;
 	case 0xe:
-		printk(KERN_INFO "parport_pc: ITE8872 found (2S1P)\n");
+		pr_info("parport_pc: ITE8872 found (2S1P)\n");
 		ite8872set = 0x64e00000;
 		break;
 	case 0x6:
-		printk(KERN_INFO "parport_pc: ITE8873 found (1S)\n");
+		pr_info("parport_pc: ITE8873 found (1S)\n");
 		release_region(inta_addr[i], 32);
 		return 0;
 	case 0x8:
-		printk(KERN_INFO "parport_pc: ITE8874 found (2S)\n");
+		pr_info("parport_pc: ITE8874 found (2S)\n");
 		release_region(inta_addr[i], 32);
 		return 0;
 	default:
-		printk(KERN_INFO "parport_pc: unknown ITE887x\n");
-		printk(KERN_INFO "parport_pc: please mail 'lspci -nvv' "
-			"output to Rich.Liu@ite.com.tw\n");
+		pr_info("parport_pc: unknown ITE887x\n");
+		pr_info("parport_pc: please mail 'lspci -nvv' output to Rich.Liu@ite.com.tw\n");
 		release_region(inta_addr[i], 32);
 		return 0;
 	}
@@ -2396,9 +2379,8 @@ static int sio_ite_8872_probe(struct pci_dev *pdev, int autoirq, int autodma,
 	release_region(inta_addr[i], 32);
 	if (parport_pc_probe_port(ite8872_lpt, ite8872_lpthi,
 				   irq, PARPORT_DMA_NONE, &pdev->dev, 0)) {
-		printk(KERN_INFO
-			"parport_pc: ITE 8872 parallel port: io=0x%X",
-								ite8872_lpt);
+		pr_info("parport_pc: ITE 8872 parallel port: io=0x%X",
+			ite8872_lpt);
 		if (irq != PARPORT_IRQ_NONE)
 			pr_cont(", irq=%d", irq);
 		pr_cont("\n");
@@ -2525,7 +2507,7 @@ static int sio_via_probe(struct pci_dev *pdev, int autoirq, int autodma,
 	pci_write_config_byte(pdev, via->via_pci_superio_config_reg, tmp);
 
 	if (siofunc == VIA_FUNCTION_PARPORT_DISABLE) {
-		printk(KERN_INFO "parport_pc: VIA parallel port disabled in BIOS\n");
+		pr_info("parport_pc: VIA parallel port disabled in BIOS\n");
 		return 0;
 	}
 
@@ -2558,9 +2540,8 @@ static int sio_via_probe(struct pci_dev *pdev, int autoirq, int autodma,
 	case 0x278:
 		port2 = 0x678; break;
 	default:
-		printk(KERN_INFO
-			"parport_pc: Weird VIA parport base 0x%X, ignoring\n",
-									port1);
+		pr_info("parport_pc: Weird VIA parport base 0x%X, ignoring\n",
+			port1);
 		return 0;
 	}
 
@@ -2579,8 +2560,7 @@ static int sio_via_probe(struct pci_dev *pdev, int autoirq, int autodma,
 
 	/* finally, do the probe with values obtained */
 	if (parport_pc_probe_port(port1, port2, irq, dma, &pdev->dev, 0)) {
-		printk(KERN_INFO
-			"parport_pc: VIA parallel port: io=0x%X", port1);
+		pr_info("parport_pc: VIA parallel port: io=0x%X", port1);
 		if (irq != PARPORT_IRQ_NONE)
 			pr_cont(", irq=%d", irq);
 		if (dma != PARPORT_DMA_NONE)
@@ -2589,7 +2569,7 @@ static int sio_via_probe(struct pci_dev *pdev, int autoirq, int autodma,
 		return 1;
 	}
 
-	printk(KERN_WARNING "parport_pc: Strange, can't probe VIA parallel port: io=0x%X, irq=%d, dma=%d\n",
+	pr_warn("parport_pc: Strange, can't probe VIA parallel port: io=0x%X, irq=%d, dma=%d\n",
 		port1, irq, dma);
 	return 0;
 }
@@ -3111,7 +3091,7 @@ static int __init parport_parse_param(const char *s, int *val,
 		if (ep != s)
 			*val = r;
 		else {
-			printk(KERN_ERR "parport: bad specifier `%s'\n", s);
+			pr_err("parport: bad specifier `%s'\n", s);
 			return -1;
 		}
 	}
@@ -3201,10 +3181,7 @@ static int __init parse_parport_params(void)
 				irqval[0] = val;
 				break;
 			default:
-				printk(KERN_WARNING
-					"parport_pc: irq specified "
-					"without base address.  Use 'io=' "
-					"to specify one\n");
+				pr_warn("parport_pc: irq specified without base address.  Use 'io=' to specify one\n");
 			}
 
 		if (dma[0] && !parport_parse_dma(dma[0], &val))
@@ -3214,10 +3191,7 @@ static int __init parse_parport_params(void)
 				dmaval[0] = val;
 				break;
 			default:
-				printk(KERN_WARNING
-					"parport_pc: dma specified "
-					"without base address.  Use 'io=' "
-					"to specify one\n");
+				pr_warn("parport_pc: dma specified without base address.  Use 'io=' to specify one\n");
 			}
 	}
 	return 0;
@@ -3256,12 +3230,12 @@ static int __init parport_setup(char *str)
 
 	val = simple_strtoul(str, &endptr, 0);
 	if (endptr == str) {
-		printk(KERN_WARNING "parport=%s not understood\n", str);
+		pr_warn("parport=%s not understood\n", str);
 		return 1;
 	}
 
 	if (parport_setup_ptr == PARPORT_PC_MAX_PORTS) {
-		printk(KERN_ERR "parport=%s ignored, too many ports\n", str);
+		pr_err("parport=%s ignored, too many ports\n", str);
 		return 1;
 	}
 
diff --git a/drivers/parport/parport_sunbpp.c b/drivers/parport/parport_sunbpp.c
index d5a669..e840c1b 100644
--- a/drivers/parport/parport_sunbpp.c
+++ b/drivers/parport/parport_sunbpp.c
@@ -314,7 +314,7 @@ static int bpp_probe(struct platform_device *op)
 	value_tcr &= ~P_TCR_DIR;
 	sbus_writeb(value_tcr, &regs->p_tcr);
 
-	printk(KERN_INFO "%s: sunbpp at 0x%lx\n", p->name, p->base);
+	pr_info("%s: sunbpp at 0x%lx\n", p->name, p->base);
 
 	dev_set_drvdata(&op->dev, p);
 
diff --git a/drivers/parport/probe.c b/drivers/parport/probe.c
index e5e6a46..10ed0d1 100644
--- a/drivers/parport/probe.c
+++ b/drivers/parport/probe.c
@@ -38,7 +38,7 @@ static void pretty_print(struct parport *port, int device)
 {
 	struct parport_device_info *info = &port->probe_info[device + 1];
 
-	printk(KERN_INFO "%s", port->name);
+	pr_info("%s", port->name);
 
 	if (device >= 0)
 		printk (" (addr %d)", device);
@@ -58,7 +58,7 @@ static void parse_data(struct parport *port, int device, char *str)
 	struct parport_device_info *info = &port->probe_info[device + 1];
 
 	if (!txt) {
-		printk(KERN_WARNING "%s probe: memory squeeze\n", port->name);
+		pr_warn("%s probe: memory squeeze\n", port->name);
 		return;
 	}
 	strcpy(txt, str);
@@ -98,7 +98,8 @@ static void parse_data(struct parport *port, int device, char *str)
 						goto rock_on;
 					}
 				}
-				printk(KERN_WARNING "%s probe: warning, class '%s' not understood.\n", port->name, sep);
+				pr_warn("%s probe: warning, class '%s' not understood\n",
+					port->name, sep);
 				info->class = PARPORT_CLASS_OTHER;
 			} else if (!strcmp(p, "CMD") ||
 				   !strcmp(p, "COMMAND SET")) {
diff --git a/drivers/parport/share.c b/drivers/parport/share.c
index d6920eb..b0f451 100644
--- a/drivers/parport/share.c
+++ b/drivers/parport/share.c
@@ -554,8 +554,8 @@ void parport_announce_port(struct parport *port)
 #endif
 
 	if (!port->dev)
-		printk(KERN_WARNING "%s: fix this legacy no-device port driver!\n",
-		       port->name);
+		pr_warn("%s: fix this legacy no-device port driver!\n",
+			port->name);
 
 	parport_proc_register(port);
 	mutex_lock(&registration_lock);
@@ -727,7 +727,8 @@ parport_register_device(struct parport *port, const char *name,
 
 	if (flags & PARPORT_DEV_LURK) {
 		if (!pf || !kf) {
-			printk(KERN_INFO "%s: refused to register lurking device (%s) without callbacks\n", port->name, name);
+			pr_info("%s: refused to register lurking device (%s) without callbacks\n",
+				port->name, name);
 			return NULL;
 		}
 	}
@@ -996,7 +997,7 @@ void parport_unregister_device(struct pardevice *dev)
 
 #ifdef PARPORT_PARANOID
 	if (!dev) {
-		printk(KERN_ERR "parport_unregister_device: passed NULL\n");
+		pr_err("%s: passed NULL\n", __func__);
 		return;
 	}
 #endif
@@ -1137,8 +1138,7 @@ int parport_claim(struct pardevice *dev)
 	unsigned long flags;
 
 	if (port->cad == dev) {
-		printk(KERN_INFO "%s: %s already owner\n",
-		       dev->port->name,dev->name);
+		pr_info("%s: %s already owner\n", dev->port->name, dev->name);
 		return 0;
 	}
 
@@ -1158,9 +1158,8 @@ int parport_claim(struct pardevice *dev)
 			 * I think we'll actually deadlock rather than
 			 * get here, but just in case..
 			 */
-			printk(KERN_WARNING
-			       "%s: %s released port when preempted!\n",
-			       port->name, oldcad->name);
+			pr_warn("%s: %s released port when preempted!\n",
+				port->name, oldcad->name);
 			if (port->cad)
 				goto blocked;
 		}
@@ -1320,8 +1319,8 @@ void parport_release(struct pardevice *dev)
 	write_lock_irqsave(&port->cad_lock, flags);
 	if (port->cad != dev) {
 		write_unlock_irqrestore(&port->cad_lock, flags);
-		printk(KERN_WARNING "%s: %s tried to release parport when not owner\n",
-		       port->name, dev->name);
+		pr_warn("%s: %s tried to release parport when not owner\n",
+			port->name, dev->name);
 		return;
 	}
 
@@ -1361,7 +1360,8 @@ void parport_release(struct pardevice *dev)
 			if (dev->port->cad) /* racy but no matter */
 				return;
 		} else {
-			printk(KERN_ERR "%s: don't know how to wake %s\n", port->name, pd->name);
+			pr_err("%s: don't know how to wake %s\n",
+			       port->name, pd->name);
 		}
 	}
 
-- 
2.24.0

