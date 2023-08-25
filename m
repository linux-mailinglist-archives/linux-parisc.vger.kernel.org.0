Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEC8788E3B
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Aug 2023 20:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjHYSKO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Aug 2023 14:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbjHYSJj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Aug 2023 14:09:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E3D2685
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 11:09:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ABEE965EBA
        for <linux-parisc@vger.kernel.org>; Fri, 25 Aug 2023 18:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B15C433C9;
        Fri, 25 Aug 2023 18:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692986973;
        bh=hStuhHoHhFgHQ3ZJUdisAp4UO7pO4h4yoSc82rLlzBI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kDV7OPVhhagOjHy5zr5zc0MyTfAaEI0B9/V8EbgI1mFXQauOK4PzPImhSmpgBYV8X
         1jqmSTYTVLIEu83OS+W3SHju4k/MXSm3WkjkIYT7kNZZLegrYBhHOb2NGENVZjhf8+
         Rk/zOAhZmMWYmUfdJQyIdKCUVvzCB5ItwLW/I7EXUYGA04c7wLevXskOQqG6L30Xq4
         pX4fXQkwB3E/PkVliAJSD5WAFq0mNgUYdv8hi835gzSOxuvwTJxEyo7OEi/Zcud/h3
         VsBjxpXfP74kfOqBLXCHDWBlVDYlwALsXXLlqG/FNWcFTVk4jfVrWOnyhbsk4MyX6w
         4eK/x2RZz8PZw==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH 2/3] parisc: led: Switch LCD/LED driver to use a kthread
Date:   Fri, 25 Aug 2023 20:09:27 +0200
Message-ID: <20230825180928.205499-2-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825180928.205499-1-deller@kernel.org>
References: <20230825180928.205499-1-deller@kernel.org>
MIME-Version: 1.0
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

Rewrite and clean up the LCD/LED driver, mostly by switching to
a kthread instead of using workqueues to update the LEDs.
The benefit of the kthread is that it avoids creating new
kworker nodes for updates, which is pretty slow on hppa.

Clean up the detection code too, use initcalls and fix kdoc issues.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/led.h |  11 +-
 arch/parisc/kernel/setup.c    |   5 -
 drivers/parisc/led.c          | 697 +++++++++++++++-------------------
 3 files changed, 304 insertions(+), 409 deletions(-)

diff --git a/arch/parisc/include/asm/led.h b/arch/parisc/include/asm/led.h
index 6de13d08a388..b99dffe02646 100644
--- a/arch/parisc/include/asm/led.h
+++ b/arch/parisc/include/asm/led.h
@@ -25,19 +25,16 @@
 #define LED_CMD_REG_NONE 0		/* NULL == no addr for the cmd register */
 
 /* register_led_driver() */
-int __init register_led_driver(int model, unsigned long cmd_reg, unsigned long data_reg);
+int register_led_driver(int model, unsigned long cmd_reg, unsigned long data_reg);
 
 /* registers the LED regions for procfs */
-void __init register_led_regions(void);
+void register_led_regions(void);
 
 #ifdef CONFIG_CHASSIS_LCD_LED
 /* writes a string to the LCD display (if possible on this h/w) */
-int lcd_print(const char *str);
+void lcd_print(const char *str);
 #else
-#define lcd_print(str)
+#define lcd_print(str)	do { } while (0)
 #endif
 
-/* main LED initialization function (uses PDC) */ 
-int __init led_init(void);
-
 #endif /* LED_H */
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 3e95b5417a50..7a2444c8b25b 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -143,11 +143,6 @@ void __init setup_arch(char **cmdline_p)
 	parisc_cache_init();
 	paging_init();
 
-#ifdef CONFIG_CHASSIS_LCD_LED
-	/* initialize the LCD/LED after boot_cpu_data is available ! */
-	led_init();		/* LCD/LED initialization */
-#endif
-
 #ifdef CONFIG_PA11
 	dma_ops_init();
 #endif
diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index 765f19608f60..fadd1d8d52aa 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -1,26 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *    Chassis LCD/LED driver for HP-PARISC workstations
+ *	Chassis LCD/LED driver for HP-PARISC workstations
  *
- *      (c) Copyright 2000 Red Hat Software
- *      (c) Copyright 2000 Helge Deller <hdeller@redhat.com>
- *      (c) Copyright 2001-2009 Helge Deller <deller@gmx.de>
- *      (c) Copyright 2001 Randolph Chung <tausq@debian.org>
+ *	(c) Copyright 2000 Red Hat Software
+ *	(c) Copyright 2000 Helge Deller <hdeller@redhat.com>
+ *	(c) Copyright 2001-2023 Helge Deller <deller@gmx.de>
+ *	(c) Copyright 2001 Randolph Chung <tausq@debian.org>
  *
- * TODO:
- *	- speed-up calculations with inlined assembler
- *	- interface to write to second row of LCD from /proc (if technically possible)
- *
- * Changes:
- *      - Audit copy_from_user in led_proc_write.
- *                                Daniele Bellucci <bellucda@tiscali.it>
- *	- Switch from using a tasklet to a work queue, so the led_LCD_driver
- *	  	can sleep.
- *	  			  David Pye <dmp@davidmpye.dyndns.org>
+ *	TODO:
+ *	- use Linux LED triggers
  */
 
 #include <linux/module.h>
-#include <linux/stddef.h>	/* for offsetof() */
+#include <linux/stddef.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/ioport.h>
@@ -47,31 +39,23 @@
 #include <asm/pdc.h>
 #include <linux/uaccess.h>
 
-/* The control of the LEDs and LCDs on PARISC-machines have to be done 
-   completely in software. The necessary calculations are done in a work queue
-   task which is scheduled regularly, and since the calculations may consume a 
-   relatively large amount of CPU time, some of the calculations can be 
-   turned off with the following variables (controlled via procfs) */
-
-static int led_type __read_mostly = -1;
-static unsigned char lastleds;	/* LED state from most recent update */
-static unsigned int led_heartbeat __read_mostly = 1;
-static unsigned int led_diskio    __read_mostly;
-static unsigned int led_lanrxtx   __read_mostly;
-static char lcd_text[32]          __read_mostly;
-static char lcd_text_default[32]  __read_mostly;
-static int  lcd_no_led_support    __read_mostly = 0; /* KittyHawk doesn't support LED on its LCD */
-
+/* The control of the LEDs and LCDs on PARISC-machines have to be done
+   completely in software. The necessary calculations may consume a relatively
+   large amount of CPU time, so some of the calculations can be turned off
+   with the following variables (controlled via procfs) */
 
-static struct workqueue_struct *led_wq;
-static void led_work_func(struct work_struct *);
-static DECLARE_DELAYED_WORK(led_task, led_work_func);
+#define LED_HAS_LCD 1
+#define LED_HAS_LED 2
 
-#if 0
-#define DPRINTK(x)	printk x
-#else
-#define DPRINTK(x)
-#endif
+static unsigned char led_type;		/* bitmask of LED_HAS_XXX */
+static unsigned char lastleds;		/* LED state from most recent update */
+static unsigned char led_heartbeat = 1;
+static unsigned char led_diskio;
+static unsigned char led_lanrxtx;
+static unsigned char lcd_new_text;
+static unsigned char lcd_text[20];
+static unsigned char lcd_text_default[20];
+static unsigned char lcd_no_led_support; /* KittyHawk doesn't support LED on its LCD */
 
 struct lcd_block {
 	unsigned char command;	/* stores the command byte      */
@@ -80,7 +64,7 @@ struct lcd_block {
 };
 
 /* Structure returned by PDC_RETURN_CHASSIS_INFO */
-/* NOTE: we use unsigned long:16 two times, since the following member 
+/* NOTE: we use unsigned long:16 two times, since the following member
    lcd_cmd_reg_addr needs to be 64bit aligned on 64bit PA2.0-machines */
 struct pdc_chassis_lcd_info_ret_block {
 	unsigned long model:16;		/* DISPLAY_MODEL_XXXX */
@@ -100,15 +84,15 @@ struct pdc_chassis_lcd_info_ret_block {
 
 
 /* LCD_CMD and LCD_DATA for KittyHawk machines */
-#define KITTYHAWK_LCD_CMD  F_EXTEND(0xf0190000UL) /* 64bit-ready */
-#define KITTYHAWK_LCD_DATA (KITTYHAWK_LCD_CMD+1)
+#define KITTYHAWK_LCD_CMD  F_EXTEND(0xf0190000UL)
+#define KITTYHAWK_LCD_DATA (KITTYHAWK_LCD_CMD + 1)
 
-/* lcd_info is pre-initialized to the values needed to program KittyHawk LCD's 
+/* lcd_info is pre-initialized to the values needed to program KittyHawk LCD's
  * HP seems to have used Sharp/Hitachi HD44780 LCDs most of the time. */
 static struct pdc_chassis_lcd_info_ret_block
-lcd_info __attribute__((aligned(8))) __read_mostly =
+lcd_info __attribute__((aligned(8)))  =
 {
-	.model =		DISPLAY_MODEL_LCD,
+	.model =		-1, /* uninitialized, else: DISPLAY_MODEL_LCD */
 	.lcd_width =		16,
 	.lcd_cmd_reg_addr =	KITTYHAWK_LCD_CMD,
 	.lcd_data_reg_addr =	KITTYHAWK_LCD_DATA,
@@ -119,48 +103,25 @@ lcd_info __attribute__((aligned(8))) __read_mostly =
 
 
 /* direct access to some of the lcd_info variables */
-#define LCD_CMD_REG	lcd_info.lcd_cmd_reg_addr	 
-#define LCD_DATA_REG	lcd_info.lcd_data_reg_addr	 
+#define LCD_CMD_REG	lcd_info.lcd_cmd_reg_addr
+#define LCD_DATA_REG	lcd_info.lcd_data_reg_addr
 #define LED_DATA_REG	lcd_info.lcd_cmd_reg_addr	/* LASI & ASP only */
 
-#define LED_HASLCD 1
-#define LED_NOLCD  0
-
-/* The workqueue must be created at init-time */
-static int start_task(void) 
-{	
-	/* Display the default text now */
-	if (led_type == LED_HASLCD) lcd_print( lcd_text_default );
-
-	/* KittyHawk has no LED support on its LCD */
-	if (lcd_no_led_support) return 0;
-
-	/* Create the work queue and queue the LED task */
-	led_wq = create_singlethread_workqueue("led_wq");	
-	if (!led_wq)
-		return -ENOMEM;
-
-	queue_delayed_work(led_wq, &led_task, 0);
-
-	return 0;
-}
-
-device_initcall(start_task);
-
 /* ptr to LCD/LED-specific function */
-static void (*led_func_ptr) (unsigned char) __read_mostly;
+static void (*led_func_ptr) (unsigned char);
+
+/* kthread handler */
+static struct task_struct *kthread_led_task;
 
-#ifdef CONFIG_PROC_FS
 static int led_proc_show(struct seq_file *m, void *v)
 {
-	switch ((long)m->private)
-	{
-	case LED_NOLCD:
+	switch ((long)m->private) {
+	case LED_HAS_LED:
 		seq_printf(m, "Heartbeat: %d\n", led_heartbeat);
 		seq_printf(m, "Disk IO: %d\n", led_diskio);
 		seq_printf(m, "LAN Rx/Tx: %d\n", led_lanrxtx);
 		break;
-	case LED_HASLCD:
+	case LED_HAS_LCD:
 		seq_printf(m, "%s\n", lcd_text);
 		break;
 	default:
@@ -194,9 +155,8 @@ static ssize_t led_proc_write(struct file *file, const char __user *buf,
 
 	cur = lbuf;
 
-	switch ((long)data)
-	{
-	case LED_NOLCD:
+	switch ((long)data) {
+	case LED_HAS_LED:
 		d = *cur++ - '0';
 		if (d != 0 && d != 1) goto parse_error;
 		led_heartbeat = d;
@@ -214,22 +174,23 @@ static ssize_t led_proc_write(struct file *file, const char __user *buf,
 		led_lanrxtx = d;
 
 		break;
-	case LED_HASLCD:
+	case LED_HAS_LCD:
 		if (*cur && cur[strlen(cur)-1] == '\n')
 			cur[strlen(cur)-1] = 0;
-		if (*cur == 0) 
+		if (*cur == 0)
 			cur = lcd_text_default;
 		lcd_print(cur);
 		break;
 	default:
 		return 0;
 	}
-	
+
 	return count;
 
 parse_error:
-	if ((long)data == LED_NOLCD)
-		printk(KERN_CRIT "Parse error: expect \"n n n\" (n == 0 or 1) for heartbeat,\ndisk io and lan tx/rx indicators\n");
+	if ((long)data == LED_HAS_LED)
+		pr_warn("Parse error: expect \"n n n\" (n == 0 or 1) for "
+			"heartbeat,\ndisk io and lan tx/rx indicators\n");
 	return -EINVAL;
 }
 
@@ -243,36 +204,28 @@ static const struct proc_ops led_proc_ops = {
 
 static int __init led_create_procfs(void)
 {
-	struct proc_dir_entry *proc_pdc_root = NULL;
-	struct proc_dir_entry *ent;
+	struct proc_dir_entry *proc_pdc_root;
 
-	if (led_type == -1) return -1;
+	if (!led_type)
+		return -1;
 
 	proc_pdc_root = proc_mkdir("pdc", NULL);
-	if (!proc_pdc_root) return -1;
+	if (!proc_pdc_root)
+		return -1;
 
-	if (!lcd_no_led_support)
-	{
-		ent = proc_create_data("led", 0644, proc_pdc_root,
-					&led_proc_ops, (void *)LED_NOLCD); /* LED */
-		if (!ent) return -1;
-	}
+	if (led_type & LED_HAS_LED)
+		proc_create_data("led", 0644, proc_pdc_root,
+				&led_proc_ops, (void *)LED_HAS_LED);
 
-	if (led_type == LED_HASLCD)
-	{
-		ent = proc_create_data("lcd", 0644, proc_pdc_root,
-					&led_proc_ops, (void *)LED_HASLCD); /* LCD */
-		if (!ent) return -1;
-	}
+	if (led_type & LED_HAS_LCD)
+		proc_create_data("lcd", 0644, proc_pdc_root,
+				&led_proc_ops, (void *)LED_HAS_LCD);
 
 	return 0;
 }
-#endif
 
-/*
-   ** 
-   ** led_ASP_driver()
-   ** 
+/**
+ *	led_ASP_driver() - LED driver for the ASP controller chip
  */
 #define	LED_DATA	0x01	/* data to shift (0:on 1:off) */
 #define	LED_STROBE	0x02	/* strobe to clock data */
@@ -290,11 +243,8 @@ static void led_ASP_driver(unsigned char leds)
 	}
 }
 
-
-/*
-   ** 
-   ** led_LASI_driver()
-   ** 
+/**
+ *	led_LASI_driver() - LED driver for the LASI controller chip
  */
 static void led_LASI_driver(unsigned char leds)
 {
@@ -302,18 +252,15 @@ static void led_LASI_driver(unsigned char leds)
 	gsc_writeb( leds, LED_DATA_REG );
 }
 
-
-/*
-   ** 
-   ** led_LCD_driver()
-   **   
+/**
+ *	led_LCD_driver() - LED & LCD driver for LCD chips
  */
 static void led_LCD_driver(unsigned char leds)
 {
 	static int i;
 	static unsigned char mask[4] = { LED_HEARTBEAT, LED_DISK_IO,
 		LED_LAN_RCV, LED_LAN_TX };
-	
+
 	static struct lcd_block * blockp[4] = {
 		&lcd_info.heartbeat,
 		&lcd_info.disk_io,
@@ -321,34 +268,27 @@ static void led_LCD_driver(unsigned char leds)
 		&lcd_info.lan_tx
 	};
 
-	/* Convert min_cmd_delay to milliseconds */
-	unsigned int msec_cmd_delay = 1 + (lcd_info.min_cmd_delay / 1000);
-	
-	for (i=0; i<4; ++i) 
-	{
-		if ((leds & mask[i]) != (lastleds & mask[i])) 
-		{
-			gsc_writeb( blockp[i]->command, LCD_CMD_REG );
-			msleep(msec_cmd_delay);
-			
-			gsc_writeb( leds & mask[i] ? blockp[i]->on : 
-					blockp[i]->off, LCD_DATA_REG );
-			msleep(msec_cmd_delay);
-		}
+	for (i = 0; i < 4; ++i) {
+		if ((leds & mask[i]) == (lastleds & mask[i]))
+			continue;
+
+		gsc_writeb( blockp[i]->command, LCD_CMD_REG );
+		udelay(lcd_info.min_cmd_delay);
+
+		gsc_writeb( leds & mask[i] ? blockp[i]->on :
+				blockp[i]->off, LCD_DATA_REG );
+		udelay(lcd_info.min_cmd_delay);
 	}
 }
 
-
-/*
-   ** 
-   ** led_get_net_activity()
-   ** 
-   ** calculate if there was TX- or RX-throughput on the network interfaces
-   ** (analog to dev_get_info() from net/core/dev.c)
-   **   
+/**
+ *	led_get_net_activity()
+ *
+ *	Calculate if there was TX- or RX-throughput on the network interfaces
+ *	(analog to dev_get_info() from net/core/dev.c)
  */
-static __inline__ int led_get_net_activity(void)
-{ 
+static int led_get_net_activity(void)
+{
 #ifndef CONFIG_NET
 	return 0;
 #else
@@ -358,7 +298,7 @@ static __inline__ int led_get_net_activity(void)
 	int retval;
 
 	rx_total = tx_total = 0;
-	
+
 	/* we are running as a workqueue task, so we can use an RCU lookup */
 	rcu_read_lock();
 	for_each_netdev_rcu(&init_net, dev) {
@@ -392,15 +332,13 @@ static __inline__ int led_get_net_activity(void)
 }
 
 
-/*
-   ** 
-   ** led_get_diskio_activity()
-   ** 
-   ** calculate if there was disk-io in the system
-   **   
+/**
+ *	led_get_diskio_activity()
+ *
+ *	calculate if there was disk-io in the system.
  */
-static __inline__ int led_get_diskio_activity(void)
-{	
+static int led_get_diskio_activity(void)
+{
 	static unsigned long last_pgpgin, last_pgpgout;
 	unsigned long events[NR_VM_EVENT_ITEMS];
 	int changed;
@@ -417,101 +355,145 @@ static __inline__ int led_get_diskio_activity(void)
 	return (changed ? LED_DISK_IO : 0);
 }
 
+static void lcd_print_now(void)
+{
+	int i;
+	char *str = lcd_text;
 
+	if (lcd_info.model != DISPLAY_MODEL_LCD)
+		return;
 
-/*
-   ** led_work_func()
-   ** 
-   ** manages when and which chassis LCD/LED gets updated
+	if (!lcd_new_text)
+		return;
+	lcd_new_text = 0;
+
+	/* Set LCD Cursor to 1st character */
+	gsc_writeb(lcd_info.reset_cmd1, LCD_CMD_REG);
+	udelay(lcd_info.min_cmd_delay);
+
+	/* Print the string */
+	for (i = 0; i < lcd_info.lcd_width; i++) {
+		gsc_writeb(*str ? *str++ : ' ', LCD_DATA_REG);
+		udelay(lcd_info.min_cmd_delay);
+	}
+}
 
-    TODO:
-    - display load average (older machines like 715/64 have 4 "free" LED's for that)
-    - optimizations
+/**
+ *	lcd_print()
+ *
+ *	@str: string to show on the LCD. If NULL, print current string again.
+ *
+ *	Displays the given string on the LCD-Display of newer machines.
  */
+void lcd_print(const char *str)
+{
+	/* copy display string to buffer for procfs */
+	if (str)
+		strscpy(lcd_text, str, sizeof(lcd_text));
+	lcd_new_text = 1;
+
+	/* a LCD without LEDs, has no kthread and thus print it now */
+	if (!kthread_led_task)
+		lcd_print_now();
+}
 
+
+/**
+ *	led_mainlook()
+ *
+ *	Kernel thread which updates chassis LCD and LEDs
+ */
 #define HEARTBEAT_LEN (HZ*10/100)
 #define HEARTBEAT_2ND_RANGE_START (HZ*28/100)
 #define HEARTBEAT_2ND_RANGE_END   (HEARTBEAT_2ND_RANGE_START + HEARTBEAT_LEN)
 
-#define LED_UPDATE_INTERVAL (1 + (HZ*19/1000))
+#define LED_UPDATE_INTERVAL (HEARTBEAT_LEN / 2)
 
-static void led_work_func (struct work_struct *unused)
+static int led_mainloop(void *unused)
 {
-	static unsigned long last_jiffies;
-	static unsigned long count_HZ; /* counter in range 0..HZ */
-	unsigned char currentleds = 0; /* stores current value of the LEDs */
-
-	/* exit if not initialized */
-	if (!led_func_ptr)
-	    return;
-
-	/* increment the heartbeat timekeeper */
-	count_HZ += jiffies - last_jiffies;
-	last_jiffies = jiffies;
-	if (count_HZ >= HZ)
-	    count_HZ = 0;
-
-	if (likely(led_heartbeat))
-	{
-		/* flash heartbeat-LED like a real heart
-		 * (2 x short then a long delay)
-		 */
-		if (count_HZ < HEARTBEAT_LEN || 
-				(count_HZ >= HEARTBEAT_2ND_RANGE_START &&
-				count_HZ < HEARTBEAT_2ND_RANGE_END)) 
-			currentleds |= LED_HEARTBEAT;
-	}
+	unsigned long timeout = LED_UPDATE_INTERVAL;
 
-	if (likely(led_lanrxtx))  currentleds |= led_get_net_activity();
-	if (likely(led_diskio))   currentleds |= led_get_diskio_activity();
-
-	/* blink LEDs if we got an Oops (HPMC) */
-	if (unlikely(oops_in_progress)) {
-		if (boot_cpu_data.cpu_type >= pcxl2) {
-			/* newer machines don't have loadavg. LEDs, so we
-			 * let all LEDs blink twice per second instead */
-			currentleds = (count_HZ <= (HZ/2)) ? 0 : 0xff;
-		} else {
-			/* old machines: blink loadavg. LEDs twice per second */
-			if (count_HZ <= (HZ/2))
-				currentleds &= ~(LED4|LED5|LED6|LED7);
-			else
-				currentleds |= (LED4|LED5|LED6|LED7);
-		}
-	}
+	unsigned long count_HZ = 0; /* counter in range 0..HZ */
+	unsigned char currentleds; /* stores current value of the LEDs */
 
-	if (currentleds != lastleds)
-	{
-		led_func_ptr(currentleds);	/* Update the LCD/LEDs */
-		lastleds = currentleds;
-	}
+	for (;;) {
+		set_current_state(TASK_INTERRUPTIBLE);
+		schedule_timeout(timeout);
 
-	queue_delayed_work(led_wq, &led_task, LED_UPDATE_INTERVAL);
-}
+		/* show new string on LCD display? */
+		lcd_print_now();
 
-/*
-   ** led_halt()
-   ** 
-   ** called by the reboot notifier chain at shutdown and stops all
-   ** LED/LCD activities.
-   ** 
- */
+		if (kthread_should_stop()) {
+			/* at exit turn all LEDs ON */
+			led_func_ptr(0xff);
+			return 0;
+		}
 
-static int led_halt(struct notifier_block *, unsigned long, void *);
+		/* increment the heartbeat timekeeper */
+		count_HZ += timeout;
+		if (count_HZ >= HZ)
+		    count_HZ -= HZ;
+
+		/* start with LEDs disabled */
+		currentleds = 0;
+
+		if (likely(led_heartbeat)) {
+			/* flash heartbeat-LED like a real heart
+			 * (2 x short then a long delay)
+			 */
+			if (count_HZ < HEARTBEAT_LEN ||
+					(count_HZ >= HEARTBEAT_2ND_RANGE_START &&
+					count_HZ < HEARTBEAT_2ND_RANGE_END))
+				currentleds |= LED_HEARTBEAT;
+		}
 
-static struct notifier_block led_notifier = {
-	.notifier_call = led_halt,
-};
-static int notifier_disabled = 0;
+		if (unlikely(led_lanrxtx))
+			currentleds |= led_get_net_activity();
+		if (unlikely(led_diskio))
+			currentleds |= led_get_diskio_activity();
+
+		/* blink LEDs if we got an Oops (HPMC) */
+		if (unlikely(oops_in_progress)) {
+			if (boot_cpu_data.cpu_type >= pcxl2) {
+				/* newer machines don't have loadavg. LEDs, so we
+				 * let all LEDs blink twice per second instead */
+				currentleds = (count_HZ <= (HZ/2)) ? 0 : 0xff;
+			} else {
+				/* old machines: blink loadavg. LEDs twice per second */
+				if (count_HZ <= (HZ/2))
+					currentleds &= ~(LED4|LED5|LED6|LED7);
+				else
+					currentleds |= (LED4|LED5|LED6|LED7);
+			}
+		}
 
-static int led_halt(struct notifier_block *nb, unsigned long event, void *buf) 
-{
-	char *txt;
+		if (led_heartbeat | led_lanrxtx | led_diskio)
+			timeout = LED_UPDATE_INTERVAL;
+		else {
+			/* if all disabled, just blink heartbeat once per
+			 * second */
+			currentleds = lastleds & LED_HEARTBEAT;
+			currentleds ^= LED_HEARTBEAT;
+			timeout = HZ;
+		}
 
-	if (notifier_disabled)
-		return NOTIFY_OK;
+		if (currentleds != lastleds) {
+			led_func_ptr(currentleds);	/* Update the LCD/LEDs */
+			lastleds = currentleds;
+		}
+	}
+}
+
+/**
+ *	led_halt()
+ *
+ *	Called by the reboot notifier chain at shutdown. Stops all
+ *	LED/LCD activities.
+ */
+static int led_halt(struct notifier_block *nb, unsigned long event, void *buf)
+{
+	const char *txt;
 
-	notifier_disabled = 1;
 	switch (event) {
 	case SYS_RESTART:	txt = "SYSTEM RESTART";
 				break;
@@ -521,48 +503,42 @@ static int led_halt(struct notifier_block *nb, unsigned long event, void *buf)
 				break;
 	default:		return NOTIFY_DONE;
 	}
-	
-	/* Cancel the work item and delete the queue */
-	if (led_wq) {
-		cancel_delayed_work_sync(&led_task);
-		destroy_workqueue(led_wq);
-		led_wq = NULL;
-	}
- 
-	if (lcd_info.model == DISPLAY_MODEL_LCD)
-		lcd_print(txt);
-	else
-		if (led_func_ptr)
-			led_func_ptr(0xff); /* turn all LEDs ON */
-	
+
+	lcd_print(txt);
+	kthread_stop(kthread_led_task);
+	kthread_led_task = NULL;
+
 	return NOTIFY_OK;
 }
 
-/*
-   ** register_led_driver()
-   ** 
-   ** registers an external LED or LCD for usage by this driver.
-   ** currently only LCD-, LASI- and ASP-style LCD/LED's are supported.
-   ** 
- */
+static struct notifier_block led_notifier = {
+	.notifier_call = led_halt,
+};
 
+/**
+ *	register_led_driver()
+ *
+ *	Registers an external LED or LCD for usage by this driver.
+ *	Only LCD-, LASI- and ASP-style LCD/LED's are supported.
+ */
 int __init register_led_driver(int model, unsigned long cmd_reg, unsigned long data_reg)
 {
-	static int initialized;
-	
-	if (initialized || !data_reg)
+	if (led_func_ptr || !data_reg)
 		return 1;
-	
+
 	lcd_info.model = model;		/* store the values */
 	LCD_CMD_REG = (cmd_reg == LED_CMD_REG_NONE) ? 0 : cmd_reg;
 
 	switch (lcd_info.model) {
 	case DISPLAY_MODEL_LCD:
 		LCD_DATA_REG = data_reg;
-		printk(KERN_INFO "LCD display at %lx,%lx registered\n", 
+		pr_info("LCD display at %#lx & %#lx\n",
 			LCD_CMD_REG , LCD_DATA_REG);
 		led_func_ptr = led_LCD_driver;
-		led_type = LED_HASLCD;
+		if (lcd_no_led_support)
+			led_type = LED_HAS_LCD;
+		else
+			led_type = LED_HAS_LCD | LED_HAS_LED;
 		break;
 
 	case DISPLAY_MODEL_LASI:
@@ -571,51 +547,49 @@ int __init register_led_driver(int model, unsigned long cmd_reg, unsigned long d
 			return 1;
 		LED_DATA_REG = data_reg;
 		led_func_ptr = led_LASI_driver;
-		printk(KERN_INFO "LED display at %lx registered\n", LED_DATA_REG);
-		led_type = LED_NOLCD;
+		pr_info("LED display at %#lx\n", LED_DATA_REG);
+		led_type = LED_HAS_LED;
 		break;
 
 	case DISPLAY_MODEL_OLD_ASP:
 		LED_DATA_REG = data_reg;
 		led_func_ptr = led_ASP_driver;
-		printk(KERN_INFO "LED (ASP-style) display at %lx registered\n", 
+		pr_info("LED (ASP-style) display at %#lx\n",
 		    LED_DATA_REG);
-		led_type = LED_NOLCD;
+		led_type = LED_HAS_LED;
 		break;
 
 	default:
-		printk(KERN_ERR "%s: Wrong LCD/LED model %d !\n",
-		       __func__, lcd_info.model);
+		pr_err("Unknown LCD/LED model type %d !\n", lcd_info.model);
 		return 1;
 	}
-	
-	pr_info("LED: Enable disk and LAN activity LEDs "
-		"via /proc/pdc/led\n");
-
-	/* mark the LCD/LED driver now as initialized and 
-	 * register to the reboot notifier chain */
-	initialized++;
-	register_reboot_notifier(&led_notifier);
-
-	/* Ensure the work is queued */
-	if (led_wq) {
-		queue_delayed_work(led_wq, &led_task, 0);
+
+	if (led_type & LED_HAS_LED) {
+		if (IS_ENABLED(CONFIG_PROC_FS))
+			pr_info("LED: Enable disk and LAN activity LEDs "
+				"via /proc/pdc/led\n");
+
+		/* kthread needed for LEDs only */
+		kthread_led_task = kthread_run(&led_mainloop, NULL, "kledd");
+		if (PTR_ERR_OR_ZERO(kthread_led_task))
+			return -ENOMEM;
 	}
 
-	return 0;
+	if (IS_ENABLED(CONFIG_PROC_FS))
+		led_create_procfs();
+
+	return register_reboot_notifier(&led_notifier);
 }
 
-/*
-   ** register_led_regions()
-   ** 
-   ** register_led_regions() registers the LCD/LED regions for /procfs.
-   ** At bootup - where the initialisation of the LCD/LED normally happens - 
-   ** not all internal structures of request_region() are properly set up,
-   ** so that we delay the led-registration until after busdevices_init() 
-   ** has been executed.
-   **
+/**
+ *	register_led_regions()
+ *
+ *	Register_led_regions() registers the LCD/LED regions for /procfs.
+ *	At bootup - where the initialisation of the LCD/LED normally happens
+ *	not all internal structures of request_region() are properly set up,
+ *	so that we delay the led-registration until after busdevices_init()
+ *	has been executed.
  */
-
 void __init register_led_regions(void)
 {
 	switch (lcd_info.model) {
@@ -630,70 +604,25 @@ void __init register_led_regions(void)
 	}
 }
 
-
-/*
-   ** 
-   ** lcd_print()
-   ** 
-   ** Displays the given string on the LCD-Display of newer machines.
-   ** lcd_print() disables/enables the timer-based led work queue to
-   ** avoid a race condition while writing the CMD/DATA register pair.
-   **
- */
-int lcd_print( const char *str )
-{
-	int i;
-
-	if (!led_func_ptr || lcd_info.model != DISPLAY_MODEL_LCD)
-	    return 0;
-	
-	/* temporarily disable the led work task */
-	if (led_wq)
-		cancel_delayed_work_sync(&led_task);
-
-	/* copy display string to buffer for procfs */
-	strscpy(lcd_text, str, sizeof(lcd_text));
-
-	/* Set LCD Cursor to 1st character */
-	gsc_writeb(lcd_info.reset_cmd1, LCD_CMD_REG);
-	udelay(lcd_info.min_cmd_delay);
-
-	/* Print the string */
-	for (i=0; i < lcd_info.lcd_width; i++) {
-	    if (str && *str)
-		gsc_writeb(*str++, LCD_DATA_REG);
-	    else
-		gsc_writeb(' ', LCD_DATA_REG);
-	    udelay(lcd_info.min_cmd_delay);
-	}
-	
-	/* re-queue the work */
-	if (led_wq) {
-		queue_delayed_work(led_wq, &led_task, 0);
-	}
-
-	return lcd_info.lcd_width;
-}
-
-/*
-   ** led_init()
-   ** 
-   ** led_init() is called very early in the bootup-process from setup.c 
-   ** and asks the PDC for an usable chassis LCD or LED.
-   ** If the PDC doesn't return any info, then the LED
-   ** is detected by lasi.c or asp.c and registered with the
-   ** above functions lasi_led_init() or asp_led_init().
-   ** KittyHawk machines have often a buggy PDC, so that
-   ** we explicitly check for those machines here.
+/**
+ *	led_init()
+ *
+ *	led_init() is called very early in the bootup-process from setup.c and
+ *	asks the PDC for an usable chassis LCD or LED. If the PDC doesn't
+ *	return any info, then the LED is detected by lasi.c or asp.c and
+ *	registered with the above functions lasi_led_init() or asp_led_init().
+ *	KittyHawk machines have often a buggy PDC, so that we explicitly check
+ *	for those machines here.
  */
-
-int __init led_init(void)
+static int __init led_init(void)
 {
 	struct pdc_chassis_info chassis_info;
 	int ret;
 
 	snprintf(lcd_text_default, sizeof(lcd_text_default),
 		"Linux %s", init_utsname()->release);
+	strcpy(lcd_text, lcd_text_default);
+	lcd_new_text = 1;
 
 	/* Work around the buggy PDC of KittyHawk-machines */
 	switch (CPU_HVERSION) {
@@ -702,8 +631,9 @@ int __init led_init(void)
 	case 0x582:		/* KittyHawk DC3 100 (K400) */
 	case 0x583:		/* KittyHawk DC3 120 (K410) */
 	case 0x58B:		/* KittyHawk DC2 100 (K200) */
-		printk(KERN_INFO "%s: KittyHawk-Machine (hversion 0x%x) found, "
-				"LED detection skipped.\n", __FILE__, CPU_HVERSION);
+		pr_info("LCD on KittyHawk-Machine found.\n");
+		/* KittyHawk has no LED support on its LCD, so skip LED detection */
+		lcd_info.model = DISPLAY_MODEL_LCD;
 		lcd_no_led_support = 1;
 		goto found;	/* use the preinitialized values of lcd_info */
 	}
@@ -713,71 +643,44 @@ int __init led_init(void)
 	chassis_info.actcnt = chassis_info.maxcnt = 0;
 
 	ret = pdc_chassis_info(&chassis_info, &lcd_info, sizeof(lcd_info));
-	if (ret == PDC_OK) {
-		DPRINTK((KERN_INFO "%s: chassis info: model=%d (%s), "
-			 "lcd_width=%d, cmd_delay=%u,\n"
-			 "%s: sizecnt=%d, actcnt=%ld, maxcnt=%ld\n",
-		         __FILE__, lcd_info.model,
-			 (lcd_info.model==DISPLAY_MODEL_LCD) ? "LCD" :
-			  (lcd_info.model==DISPLAY_MODEL_LASI) ? "LED" : "unknown",
-			 lcd_info.lcd_width, lcd_info.min_cmd_delay,
-			 __FILE__, sizeof(lcd_info), 
-			 chassis_info.actcnt, chassis_info.maxcnt));
-		DPRINTK((KERN_INFO "%s: cmd=%p, data=%p, reset1=%x, reset2=%x, act_enable=%d\n",
-			__FILE__, lcd_info.lcd_cmd_reg_addr, 
-			lcd_info.lcd_data_reg_addr, lcd_info.reset_cmd1,  
-			lcd_info.reset_cmd2, lcd_info.act_enable ));
-	
-		/* check the results. Some machines have a buggy PDC */
-		if (chassis_info.actcnt <= 0 || chassis_info.actcnt != chassis_info.maxcnt)
-			goto not_found;
+	if (ret != PDC_OK)
+		goto not_found;
 
-		switch (lcd_info.model) {
-		case DISPLAY_MODEL_LCD:		/* LCD display */
-			if (chassis_info.actcnt < 
-				offsetof(struct pdc_chassis_lcd_info_ret_block, _pad)-1)
-				goto not_found;
-			if (!lcd_info.act_enable) {
-				DPRINTK((KERN_INFO "PDC prohibited usage of the LCD.\n"));
-				goto not_found;
-			}
-			break;
+	/* check the results. Some machines have a buggy PDC */
+	if (chassis_info.actcnt <= 0 || chassis_info.actcnt != chassis_info.maxcnt)
+		goto not_found;
 
-		case DISPLAY_MODEL_NONE:	/* no LED or LCD available */
-			printk(KERN_INFO "PDC reported no LCD or LED.\n");
+	switch (lcd_info.model) {
+	case DISPLAY_MODEL_LCD:		/* LCD display */
+		if (chassis_info.actcnt <
+			offsetof(struct pdc_chassis_lcd_info_ret_block, _pad)-1)
 			goto not_found;
-
-		case DISPLAY_MODEL_LASI:	/* Lasi style 8 bit LED display */
-			if (chassis_info.actcnt != 8 && chassis_info.actcnt != 32)
-				goto not_found;
-			break;
-
-		default:
-			printk(KERN_WARNING "PDC reported unknown LCD/LED model %d\n",
-			       lcd_info.model);
+		if (!lcd_info.act_enable) {
+			/* PDC tells LCD should not be used. */
 			goto not_found;
-		} /* switch() */
+		}
+		break;
 
-found:
-		/* register the LCD/LED driver */
-		register_led_driver(lcd_info.model, LCD_CMD_REG, LCD_DATA_REG);
-		return 0;
+	case DISPLAY_MODEL_NONE:	/* no LED or LCD available */
+		goto not_found;
 
-	} else { /* if() */
-		DPRINTK((KERN_INFO "pdc_chassis_info call failed with retval = %d\n", ret));
-	}
+	case DISPLAY_MODEL_LASI:	/* Lasi style 8 bit LED display */
+		if (chassis_info.actcnt != 8 && chassis_info.actcnt != 32)
+			goto not_found;
+		break;
 
+	default:
+		pr_warn("PDC reported unknown LCD/LED model %d\n",
+		       lcd_info.model);
 not_found:
-	lcd_info.model = DISPLAY_MODEL_NONE;
-	return 1;
-}
+		lcd_info.model = DISPLAY_MODEL_NONE;
+		return 1;
+	}
 
-static void __exit led_exit(void)
-{
-	unregister_reboot_notifier(&led_notifier);
-	return;
+found:
+	/* register the LCD/LED driver */
+	register_led_driver(lcd_info.model, LCD_CMD_REG, LCD_DATA_REG);
+	return 0;
 }
 
-#ifdef CONFIG_PROC_FS
-module_init(led_create_procfs)
-#endif
+arch_initcall_sync(led_init);
-- 
2.41.0

