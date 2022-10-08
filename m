Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 956975F870F
	for <lists+linux-parisc@lfdr.de>; Sat,  8 Oct 2022 21:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiJHTWh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 8 Oct 2022 15:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiJHTWg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Oct 2022 15:22:36 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38E33CBC5
        for <linux-parisc@vger.kernel.org>; Sat,  8 Oct 2022 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1665256945;
        bh=z9j1u5a3jlUBHVLbOTLPrawL+bj6EWH2Kop93YFnFzo=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=Ib3I5Q++Q2xrNULi8HzIO8l4KyM8WLikxy99zaO5EHTlBCYX3dmG/EVIqVgxcdG25
         SCR8HMbQOGA1sLtOaAW5BMblVlnOBZYvnewUlQmwpqwJVzGNV/F4l7qaX1vo+ZsrUi
         qdYPLqs43W/u9CBao+TTeZdBQAyeFQf49JrB+eGM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.144.139]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Fs-1pVCnW4BqI-00oC3A; Sat, 08
 Oct 2022 21:22:25 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 2/2] parisc: Convert PDC console to an early console
Date:   Sat,  8 Oct 2022 21:22:23 +0200
Message-Id: <20221008192223.491837-2-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221008192223.491837-1-deller@gmx.de>
References: <20221008192223.491837-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bTBiaH0k05IrxZLXHMuv/4oyRcC0mLNY4xVR20bcn83xZyqC2W1
 tQzW32PObDOECuR63Sg0+3TYdttI7o+DAEh4svfufLCJP4IsFrRHIMm+1WpwILAYdIvQg2/
 ABdVNWx2uSUOwUpJMSJsSyRfAx9nLlJrf8Lq1N6cOwymVwp5s4Hhy7z/W8infM/i8+TqCZN
 e+U6kaFacJN86rUjF2ekw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qk+LSPvNBsc=:8V5hmyhEOx2NbBlJJ5zdMQ
 iIpNwBcVqPNNkzT494ugyKOntDe8iidlJqT2rq+3vhD6+wZ2JtxbfPX1Men/ETQHT8UlTjPH0
 XhTKvelrOHEdqGwGnfZe/7Zbez1vAS0xdT4F5yfsYzlW2RlnHE26DMbyGvxbPm40rTfhsWNUx
 cHcw1dm82kvFODfNmETAwu1KtBlVi/5ekv6Oq9eDVaNJ9EFfZGLbBSwDxlyu2SBtqkByTddOf
 mceSxeAAbyg9wMzhninjEaGDccD3/Hmc+mE5Yx8mcnbeMeV9es+1ydGH6bVokkhwTmUnQboG9
 vkwD7iUzeg03S7T6YVnVYopBvK0Dh/r9JwSgr+IR1Jk7NdWrrmV0kdpTdE0fYrCo1jym21wMv
 ISE5HHO+UmMTgjNJWniKb2TBx/kgCtEfGtBPhQkd4w4Q8t4NBQjIQEcgnFlIgldRyS3vuNiMh
 nxYXSJorI9cUD8VB5A5DetDAiGzb2KNC/uW4bCic5qVcSi5xEynQnISXa/+LPaUfqjYI+Q/vL
 +/yVkZtH9ne6+Ih85IXxUP0kgDIy7UgavRTx9jD635yAK2AQPwLbU0Oa6IIe6P9s2+ikt1BbQ
 ckoIGwbsk+MeVW2nqZTyefhKV0zmdgZC9kB9FFNDxTMqqOcNTPSEUZGe0HRVy+uYO6HZJ6783
 ijL7S/p3RorbJsDkMCreTP7jcMvOCHEiq8rc7kYZABcalB99xfDi5FEErLv1srJ+Ji+XWYonF
 neeN15Xc1EuZ3MR3ezG7WZb1N7sK2bYxQ9GkPnzAvDOMzyg2iHUOiiY4u+fooR1D42aohDzJS
 9GAMd6CM/RHc7Bc3AJnNNopEEOeZf6P5Lbu1VAWt/0dyTzBBTnIzvOOOG5+FBmNVv6plIP6Pe
 ehQyrIsI+TLLE6D1qPHoxHCx/NnPaY/w1QxfINbdvx26bvUzsf3JX8nZmLwKIIwT/5dw4M54L
 tyjtoJ4BwgsFwXZRPznh/Eh/lTOcrEdzXhotmU5i9KagnShkRoEkLzk+F3B6n+TG7+bymT9MZ
 UlgIg9CBZQLo7KMVKnRb1gEDHhhp0dIJGisa0BBOejlmVzeOrNRCBH3TksSnhJwVQAX7FR1q6
 HOHWMF9TlNrsl40MqHwzbhAdfyApEnvaY1UqAqkQFKL3ffJvrC58KtCGGq1F8855K9B3Md8nc
 vqGY+O0npF41jD7IhX6jJ4w9L9EyruwD6KEuUdofXBVs2oFoVHElwyuS6S/3/JuFsGMRlgcxX
 fetSPZPUydlfH9zeuKGKL16i2pZ/k6KylUheCXb/AgoMFL49WAt8eRGYT+iJXgbYhWZwOGr2q
 762Zk8ViqyL+Bwj1tRuCFSG8nJlV4Of0sUf2GCYNRg5jn3YdpinKCv+JUHQMMM0+voCp3QJDs
 3hE89P/vEWNGCpP7/FRTqamFMKb8h4zSxGxokvVJbw4Y1yUn7zCLvhSbhXEcL07/73WzneiPD
 bqJxKsNPEbyIiCy1g+82BajrGdLQN4B8V7kmIJXUg+1OlCRbpTCCnOw8+Egl0sAxzO0jxo00t
 pgXl8IbnfGf4k+jyaAns1UoVKtHS00uYJoclaCQIaV08+
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Rewrite the PDC console to become an early console.
Beside the fact that now boot information is visible until another
(text- or graphics) console takes over, this benefits as well machines
with a yet-unsupported STI console and kgdb.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/pdc.h |   3 -
 arch/parisc/kernel/pdc_cons.c | 240 ++++------------------------------
 arch/parisc/kernel/setup.c    |   6 +-
 arch/parisc/kernel/traps.c    |  15 +--
 drivers/tty/serial/Kconfig    |  15 ---
 lib/Kconfig.kgdb              |   2 +-
 6 files changed, 32 insertions(+), 249 deletions(-)

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index b643092d4b98..fcbcf9a96c11 100644
=2D-- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -19,9 +19,6 @@ extern unsigned long parisc_pat_pdc_cap; /* PDC capabili=
ties (PAT) */
 #define PDC_TYPE_SYSTEM_MAP	 1 /* 32-bit, but supports PDC_SYSTEM_MAP */
 #define PDC_TYPE_SNAKE		 2 /* Doesn't support SYSTEM_MAP */

-void pdc_console_init(void);	/* in pdc_console.c */
-void pdc_console_restart(void);
-
 void setup_pdc(void);		/* in inventory.c */

 /* wrapper-functions from pdc.c */
diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
index 2661cdd256ae..7d0989f523d0 100644
=2D-- a/arch/parisc/kernel/pdc_cons.c
+++ b/arch/parisc/kernel/pdc_cons.c
@@ -1,46 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *    PDC Console support - ie use firmware to dump text via boot console
+ *    PDC early console support - use PDC firmware to dump text via boot =
console
  *
- *    Copyright (C) 1999-2003 Matthew Wilcox <willy at parisc-linux.org>
- *    Copyright (C) 2000 Martin K Petersen <mkp at mkp.net>
- *    Copyright (C) 2000 John Marvin <jsm at parisc-linux.org>
- *    Copyright (C) 2000-2003 Paul Bame <bame at parisc-linux.org>
- *    Copyright (C) 2000 Philipp Rumpf <prumpf with tux.org>
- *    Copyright (C) 2000 Michael Ang <mang with subcarrier.org>
- *    Copyright (C) 2000 Grant Grundler <grundler with parisc-linux.org>
- *    Copyright (C) 2001-2002 Ryan Bradetich <rbrad at parisc-linux.org>
- *    Copyright (C) 2001 Helge Deller <deller at parisc-linux.org>
- *    Copyright (C) 2001 Thomas Bogendoerfer <tsbogend at parisc-linux.or=
g>
- *    Copyright (C) 2002 Randolph Chung <tausq with parisc-linux.org>
- *    Copyright (C) 2010 Guy Martin <gmsoft at tuxicoman.be>
+ *    Copyright (C) 2001-2022 Helge Deller <deller@gmx.de>
  */

-/*
- *  The PDC console is a simple console, which can be used for debugging
- *  boot related problems on HP PA-RISC machines. It is also useful when =
no
- *  other console works.
- *
- *  This code uses the ROM (=3DPDC) based functions to read and write cha=
racters
- *  from and to PDC's boot path.
- */
-
-/* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems.
- * On production kernels EARLY_BOOTUP_DEBUG should be undefined. */
-#define EARLY_BOOTUP_DEBUG
-
-
-#include <linux/kernel.h>
 #include <linux/console.h>
-#include <linux/string.h>
 #include <linux/init.h>
-#include <linux/major.h>
-#include <linux/tty.h>
+#include <linux/serial_core.h>
+#include <linux/kgdb.h>
 #include <asm/page.h>		/* for PAGE0 */
 #include <asm/pdc.h>		/* for iodc_call() proto and friends */

 static DEFINE_SPINLOCK(pdc_console_lock);
-static struct console pdc_cons;

 static void pdc_console_write(struct console *co, const char *s, unsigned=
 count)
 {
@@ -54,7 +26,8 @@ static void pdc_console_write(struct console *co, const =
char *s, unsigned count)
 	spin_unlock_irqrestore(&pdc_console_lock, flags);
 }

-int pdc_console_poll_key(struct console *co)
+#ifdef CONFIG_KGDB
+static int kgdb_pdc_read_char(void)
 {
 	int c;
 	unsigned long flags;
@@ -63,201 +36,40 @@ int pdc_console_poll_key(struct console *co)
 	c =3D pdc_iodc_getc();
 	spin_unlock_irqrestore(&pdc_console_lock, flags);

-	return c;
-}
-
-static int pdc_console_setup(struct console *co, char *options)
-{
-	return 0;
-}
-
-#if defined(CONFIG_PDC_CONSOLE)
-#include <linux/vt_kern.h>
-#include <linux/tty_flip.h>
-
-#define PDC_CONS_POLL_DELAY (30 * HZ / 1000)
-
-static void pdc_console_poll(struct timer_list *unused);
-static DEFINE_TIMER(pdc_console_timer, pdc_console_poll);
-static struct tty_port tty_port;
-
-static int pdc_console_tty_open(struct tty_struct *tty, struct file *filp=
)
-{
-	tty_port_tty_set(&tty_port, tty);
-	mod_timer(&pdc_console_timer, jiffies + PDC_CONS_POLL_DELAY);
-
-	return 0;
+	return (c <=3D 0) ? NO_POLL_CHAR : c;
 }

-static void pdc_console_tty_close(struct tty_struct *tty, struct file *fi=
lp)
+static void kgdb_pdc_write_char(u8 chr)
 {
-	if (tty->count =3D=3D 1) {
-		del_timer_sync(&pdc_console_timer);
-		tty_port_tty_set(&tty_port, NULL);
-	}
+	if (PAGE0->mem_cons.cl_class !=3D CL_DUPLEX)
+		pdc_console_write(NULL, &chr, 1);
 }

-static int pdc_console_tty_write(struct tty_struct *tty, const unsigned c=
har *buf, int count)
-{
-	pdc_console_write(NULL, buf, count);
-	return count;
-}
-
-static unsigned int pdc_console_tty_write_room(struct tty_struct *tty)
-{
-	return 32768; /* no limit, no buffer used */
-}
-
-static const struct tty_operations pdc_console_tty_ops =3D {
-	.open =3D pdc_console_tty_open,
-	.close =3D pdc_console_tty_close,
-	.write =3D pdc_console_tty_write,
-	.write_room =3D pdc_console_tty_write_room,
+static struct kgdb_io kgdb_pdc_io_ops =3D {
+	.name =3D "kgdb_pdc",
+	.read_char =3D kgdb_pdc_read_char,
+	.write_char =3D kgdb_pdc_write_char,
 };
-
-static void pdc_console_poll(struct timer_list *unused)
-{
-	int data, count =3D 0;
-
-	while (1) {
-		data =3D pdc_console_poll_key(NULL);
-		if (data =3D=3D -1)
-			break;
-		tty_insert_flip_char(&tty_port, data & 0xFF, TTY_NORMAL);
-		count ++;
-	}
-
-	if (count)
-		tty_flip_buffer_push(&tty_port);
-
-	if (pdc_cons.flags & CON_ENABLED)
-		mod_timer(&pdc_console_timer, jiffies + PDC_CONS_POLL_DELAY);
-}
-
-static struct tty_driver *pdc_console_tty_driver;
-
-static int __init pdc_console_tty_driver_init(void)
-{
-	struct tty_driver *driver;
-	int err;
-
-	/* Check if the console driver is still registered.
-	 * It is unregistered if the pdc console was not selected as the
-	 * primary console. */
-
-	struct console *tmp;
-
-	console_lock();
-	for_each_console(tmp)
-		if (tmp =3D=3D &pdc_cons)
-			break;
-	console_unlock();
-
-	if (!tmp) {
-		printk(KERN_INFO "PDC console driver not registered anymore, not creati=
ng %s\n", pdc_cons.name);
-		return -ENODEV;
-	}
-
-	printk(KERN_INFO "The PDC console driver is still registered, removing C=
ON_BOOT flag\n");
-	pdc_cons.flags &=3D ~CON_BOOT;
-
-	driver =3D tty_alloc_driver(1, TTY_DRIVER_REAL_RAW |
-			TTY_DRIVER_RESET_TERMIOS);
-	if (IS_ERR(driver))
-		return PTR_ERR(driver);
-
-	tty_port_init(&tty_port);
-
-	driver->driver_name =3D "pdc_cons";
-	driver->name =3D "ttyB";
-	driver->major =3D MUX_MAJOR;
-	driver->minor_start =3D 0;
-	driver->type =3D TTY_DRIVER_TYPE_SYSTEM;
-	driver->init_termios =3D tty_std_termios;
-	tty_set_operations(driver, &pdc_console_tty_ops);
-	tty_port_link_device(&tty_port, driver, 0);
-
-	err =3D tty_register_driver(driver);
-	if (err) {
-		printk(KERN_ERR "Unable to register the PDC console TTY driver\n");
-		tty_port_destroy(&tty_port);
-		tty_driver_kref_put(driver);
-		return err;
-	}
-
-	pdc_console_tty_driver =3D driver;
-
-	return 0;
-}
-device_initcall(pdc_console_tty_driver_init);
-
-static struct tty_driver * pdc_console_device (struct console *c, int *in=
dex)
-{
-	*index =3D c->index;
-	return pdc_console_tty_driver;
-}
-#else
-#define pdc_console_device NULL
 #endif

-static struct console pdc_cons =3D {
-	.name =3D		"ttyB",
-	.write =3D	pdc_console_write,
-	.device =3D	pdc_console_device,
-	.setup =3D	pdc_console_setup,
-	.flags =3D	CON_BOOT | CON_PRINTBUFFER,
-	.index =3D	-1,
-};
-
-static int pdc_console_initialized;
-
-static void pdc_console_init_force(void)
+static int __init pdc_earlycon_setup(struct earlycon_device *device,
+				     const char *opt)
 {
-	if (pdc_console_initialized)
-		return;
-	++pdc_console_initialized;
-
+	struct console *earlycon_console;
+
 	/* If the console is duplex then copy the COUT parameters to CIN. */
 	if (PAGE0->mem_cons.cl_class =3D=3D CL_DUPLEX)
 		memcpy(&PAGE0->mem_kbd, &PAGE0->mem_cons, sizeof(PAGE0->mem_cons));

-	/* register the pdc console */
-	register_console(&pdc_cons);
-}
+	earlycon_console =3D device->con;
+	earlycon_console->write =3D pdc_console_write;
+	device->port.iotype =3D UPIO_MEM32BE;

-void __init pdc_console_init(void)
-{
-#if defined(EARLY_BOOTUP_DEBUG) || defined(CONFIG_PDC_CONSOLE)
-	pdc_console_init_force();
+#ifdef CONFIG_KGDB
+	kgdb_register_io_module(&kgdb_pdc_io_ops);
 #endif
-#ifdef EARLY_BOOTUP_DEBUG
-	printk(KERN_INFO "Initialized PDC Console for debugging.\n");
-#endif
-}
-
-
-/*
- * Used for emergencies. Currently only used if an HPMC occurs. If an
- * HPMC occurs, it is possible that the current console may not be
- * properly initialised after the PDC IO reset. This routine unregisters
- * all of the current consoles, reinitializes the pdc console and
- * registers it.
- */
-
-void pdc_console_restart(void)
-{
-	struct console *console;
-
-	if (pdc_console_initialized)
-		return;

-	/* If we've already seen the output, don't bother to print it again */
-	if (console_drivers !=3D NULL)
-		pdc_cons.flags &=3D ~CON_PRINTBUFFER;
-
-	while ((console =3D console_drivers) !=3D NULL)
-		unregister_console(console_drivers);
-
-	/* force registering the pdc console */
-	pdc_console_init_force();
+	return 0;
 }
+
+EARLYCON_DECLARE(pdc, pdc_earlycon_setup);
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index f005ddedb50e..375f38d6e1a4 100644
=2D-- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -70,6 +70,10 @@ void __init setup_cmdline(char **cmdline_p)
 			strlcat(p, "tty0", COMMAND_LINE_SIZE);
 	}

+	/* default to use early console */
+	if (!strstr(p, "earlycon"))
+		strlcat(p, " earlycon=3Dpdc", COMMAND_LINE_SIZE);
+
 #ifdef CONFIG_BLK_DEV_INITRD
 		if (boot_args[2] !=3D 0) /* did palo pass us a ramdisk? */
 		{
@@ -139,8 +143,6 @@ void __init setup_arch(char **cmdline_p)
 	if (__pa((unsigned long) &_end) >=3D KERNEL_INITIAL_SIZE)
 		panic("KERNEL_INITIAL_ORDER too small!");

-	pdc_console_init();
-
 #ifdef CONFIG_64BIT
 	if(parisc_narrow_firmware) {
 		printk(KERN_INFO "Kernel is using PDC in 32-bit mode.\n");
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index b78f1b9d45c1..f9696fbf646c 100644
=2D-- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -239,13 +239,6 @@ void die_if_kernel(char *str, struct pt_regs *regs, l=
ong err)
 	/* unlock the pdc lock if necessary */
 	pdc_emergency_unlock();

-	/* maybe the kernel hasn't booted very far yet and hasn't been able
-	 * to initialize the serial or STI console. In that case we should
-	 * re-enable the pdc console, so that the user will be able to
-	 * identify the problem. */
-	if (!console_drivers)
-		pdc_console_restart();
-
 	if (err)
 		printk(KERN_CRIT "%s (pid %d): %s (code %ld)\n",
 			current->comm, task_pid_nr(current), str, err);
@@ -429,10 +422,6 @@ void parisc_terminate(char *msg, struct pt_regs *regs=
, int code, unsigned long o
 	/* unlock the pdc lock if necessary */
 	pdc_emergency_unlock();

-	/* restart pdc console if necessary */
-	if (!console_drivers)
-		pdc_console_restart();
-
 	/* Not all paths will gutter the processor... */
 	switch(code){

@@ -482,9 +471,7 @@ void notrace handle_interruption(int code, struct pt_r=
egs *regs)
 	unsigned long fault_space =3D 0;
 	int si_code;

-	if (code =3D=3D 1)
-	    pdc_console_restart();  /* switch back to pdc if HPMC */
-	else if (!irqs_disabled_flags(regs->gr[0]))
+	if (!irqs_disabled_flags(regs->gr[0]))
 	    local_irq_enable();

 	/* Security check:
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 877173907c53..898728ab2c18 100644
=2D-- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -602,21 +602,6 @@ config SERIAL_MUX_CONSOLE
 	select SERIAL_CORE_CONSOLE
 	default y

-config PDC_CONSOLE
-	bool "PDC software console support"
-	depends on PARISC && !SERIAL_MUX && VT
-	help
-	  Saying Y here will enable the software based PDC console to be
-	  used as the system console.  This is useful for machines in
-	  which the hardware based console has not been written yet.  The
-	  following steps must be completed to use the PDC console:
-
-	    1. create the device entry (mknod /dev/ttyB0 c 11 0)
-	    2. Edit the /etc/inittab to start a getty listening on /dev/ttyB0
-	    3. Add device ttyB0 to /etc/securetty (if you want to log on as
-		 root on this console.)
-	    4. Change the kernel command console parameter to: console=3DttyB0
-
 config SERIAL_SUNSAB
 	tristate "Sun Siemens SAB82532 serial support"
 	depends on SPARC && PCI
diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
index 05dae05b6cc9..3b9a44008433 100644
=2D-- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -121,7 +121,7 @@ config KDB_DEFAULT_ENABLE

 config KDB_KEYBOARD
 	bool "KGDB_KDB: keyboard as input device"
-	depends on VT && KGDB_KDB
+	depends on VT && KGDB_KDB && !PARISC
 	default n
 	help
 	  KDB can use a PS/2 type keyboard for an input device
=2D-
2.37.3

