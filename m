Return-Path: <linux-parisc+bounces-361-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C91B831405
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Jan 2024 09:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 166681F21C82
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Jan 2024 08:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2072E3EB;
	Thu, 18 Jan 2024 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rp0y5fyR"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A82E415;
	Thu, 18 Jan 2024 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705564752; cv=none; b=k/5Jp24QDGfIHXetmFCo38VZmIwOnkn9z36sDhs+CD47rm3rnF5x8IQBnTQOndqFTgvq24gWA568djNYNCJbWttLQaUTs+llJM7hoCHHzpIlUp9WfyCWA+AbZh4fNP/8avrNoMEJBSZGXZzxGMEvyZTtr+bSWQdMDi0GCZijyjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705564752; c=relaxed/simple;
	bh=sWdw69RTGW8wkTF4nCHD10DhuNSKeBaHpeIrGzhwVTI=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=k/5k3Cu44EI5dXMft9A3qOf/oMnBhpmu0Xx2fSYFFmkqg7MB4Nz9BQSLVIaBCtjMRv3fpd4nApoMoQy8kKzReqFdnsFx/45oHYVqXB3vnbYcKx/x7DVkrFT5bVxOq57f8GXw9i16xw5mBMdp6eqewwLfpq0RN8MlF7H+IXdOVxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rp0y5fyR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96711C433A6;
	Thu, 18 Jan 2024 07:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705564752;
	bh=sWdw69RTGW8wkTF4nCHD10DhuNSKeBaHpeIrGzhwVTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rp0y5fyRiI8JmKdCwxJjSlQjCa3xtxG3CYpRTOA5D/Mb+2uiHdXAuCYnfEZObisjV
	 PUNke+wnIe9f3cIVL7BwH+54cD+74J0R4pj/U3xkTYDESMrqemSW+QpXLG7PZXm0vp
	 hQ+sFjcBEmhoa1l3oeHpWFBBTJiw41DKVuyQ2Y52DRDW5HSDGHHCRPTbH7FP221qRV
	 mVq7nEQYULSsnxJ3/oMeCkSZZCLcd7XrIdLPwjGJNHZ8ej+JqdUumzxIfEJs3zEmUS
	 cEm3a0q7gkp5f4hqjWRjH4piGsJjdk0bdSXnI5fF8TMsU57kEr9mXS4zfjk5joZ+wt
	 R1vm3gOgDJgMA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH 32/45] tty: vt: use enum for VESA blanking modes
Date: Thu, 18 Jan 2024 08:57:43 +0100
Message-ID: <20240118075756.10541-33-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118075756.10541-1-jirislaby@kernel.org>
References: <20240118075756.10541-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch VESA macros to an enum and add and use VESA_BLANK_MAX. This
improves type checking in consw::con_blank().

There is a downside of this. The macros were defined twice: in
linux/console.h and uapi/linux/fb.h. We cannot remove the latter (uapi
header), but nor we want to expand them in the kernel too. So protect
them using __KERNEL__. In the kernel case, include linux/console.h
instead. This header dependency is preexisting.

Alternatively, we could create a vesa.h header with that sole enum and
include it. If it turns out linux/console.h is too much for fb.h.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/tty/vt/vt.c                 |  4 ++--
 drivers/video/console/dummycon.c    |  6 ++++--
 drivers/video/console/mdacon.c      |  3 ++-
 drivers/video/console/newport_con.c |  3 ++-
 drivers/video/console/sticon.c      |  3 ++-
 drivers/video/console/vgacon.c      |  7 ++++---
 drivers/video/fbdev/core/fbcon.c    |  3 ++-
 include/linux/console.h             | 18 +++++++++++-------
 include/uapi/linux/fb.h             |  5 ++++-
 9 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 6f46fefedcfb..756291f37d47 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -175,7 +175,7 @@ int do_poke_blanked_console;
 int console_blanked;
 EXPORT_SYMBOL(console_blanked);
 
-static int vesa_blank_mode; /* 0:none 1:suspendV 2:suspendH 3:powerdown */
+static enum vesa_blank_mode vesa_blank_mode;
 static int vesa_off_interval;
 static int blankinterval;
 core_param(consoleblank, blankinterval, int, 0444);
@@ -4334,7 +4334,7 @@ static int set_vesa_blanking(u8 __user *mode_user)
 		return -EFAULT;
 
 	console_lock();
-	vesa_blank_mode = (mode < 4) ? mode : VESA_NO_BLANKING;
+	vesa_blank_mode = (mode <= VESA_BLANK_MAX) ? mode : VESA_NO_BLANKING;
 	console_unlock();
 
 	return 0;
diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index c8d5aa0e3ed0..d86c1d798690 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -79,7 +79,8 @@ static void dummycon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 	raw_notifier_call_chain(&dummycon_output_nh, 0, NULL);
 }
 
-static int dummycon_blank(struct vc_data *vc, int blank, int mode_switch)
+static int dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
+			  int mode_switch)
 {
 	/* Redraw, so that we get putc(s) for output done while blanked */
 	return 1;
@@ -89,7 +90,8 @@ static void dummycon_putc(struct vc_data *vc, u16 c, unsigned int y,
 			  unsigned int x) { }
 static void dummycon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 			   unsigned int ypos, unsigned int xpos) { }
-static int dummycon_blank(struct vc_data *vc, int blank, int mode_switch)
+static int dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
+			  int mode_switch)
 {
 	return 0;
 }
diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index 4485ef923bb3..63e3ce678aab 100644
--- a/drivers/video/console/mdacon.c
+++ b/drivers/video/console/mdacon.c
@@ -451,7 +451,8 @@ static bool mdacon_switch(struct vc_data *c)
 	return true;	/* redrawing needed */
 }
 
-static int mdacon_blank(struct vc_data *c, int blank, int mode_switch)
+static int mdacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			int mode_switch)
 {
 	if (mda_type == TYPE_MDA) {
 		if (blank) 
diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index ad3a09142770..38437a53b7f1 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -476,7 +476,8 @@ static bool newport_switch(struct vc_data *vc)
 	return true;
 }
 
-static int newport_blank(struct vc_data *c, int blank, int mode_switch)
+static int newport_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			 int mode_switch)
 {
 	unsigned short treg;
 
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index 817b89c45e81..e9d5d1f92883 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -298,7 +298,8 @@ static bool sticon_switch(struct vc_data *conp)
     return true;	/* needs refreshing */
 }
 
-static int sticon_blank(struct vc_data *c, int blank, int mode_switch)
+static int sticon_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			int mode_switch)
 {
     if (blank == VESA_NO_BLANKING) {
 	if (mode_switch)
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 910dc73874b7..a4bd97ab502d 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -81,7 +81,7 @@ static unsigned int	vga_video_num_lines;			/* Number of text lines */
 static bool		vga_can_do_color;			/* Do we support colors? */
 static unsigned int	vga_default_font_height __read_mostly;	/* Height of default screen font */
 static unsigned char	vga_video_type		__read_mostly;	/* Card type */
-static int		vga_vesa_blanked;
+static enum vesa_blank_mode vga_vesa_blanked;
 static bool 		vga_palette_blanked;
 static bool 		vga_is_gfx;
 static bool 		vga_512_chars;
@@ -683,7 +683,7 @@ static struct {
 	unsigned char ClockingMode;	/* Seq-Controller:01h */
 } vga_state;
 
-static void vga_vesa_blank(struct vgastate *state, int mode)
+static void vga_vesa_blank(struct vgastate *state, enum vesa_blank_mode mode)
 {
 	/* save original values of VGA controller registers */
 	if (!vga_vesa_blanked) {
@@ -797,7 +797,8 @@ static void vga_pal_blank(struct vgastate *state)
 	}
 }
 
-static int vgacon_blank(struct vc_data *c, int blank, int mode_switch)
+static int vgacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			int mode_switch)
 {
 	switch (blank) {
 	case VESA_NO_BLANKING:		/* Unblank */
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index d5d924225209..69be5f2106bc 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2198,7 +2198,8 @@ static void fbcon_generic_blank(struct vc_data *vc, struct fb_info *info,
 	}
 }
 
-static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
+static int fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
+		       int mode_switch)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
diff --git a/include/linux/console.h b/include/linux/console.h
index f7c6b5fc3a36..5ea984b8c5e4 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -31,6 +31,15 @@ enum con_scroll {
 	SM_DOWN,
 };
 
+/* Note: fbcon defines the below as macros for userspace (in fb.h). */
+enum vesa_blank_mode {
+	VESA_NO_BLANKING	= 0,
+	VESA_VSYNC_SUSPEND	= 1,
+	VESA_HSYNC_SUSPEND	= 2,
+	VESA_POWERDOWN		= VESA_VSYNC_SUSPEND | VESA_HSYNC_SUSPEND,
+	VESA_BLANK_MAX		= VESA_POWERDOWN,
+};
+
 enum vc_intensity;
 
 /**
@@ -69,7 +78,8 @@ struct consw {
 			unsigned int bottom, enum con_scroll dir,
 			unsigned int lines);
 	bool	(*con_switch)(struct vc_data *vc);
-	int	(*con_blank)(struct vc_data *vc, int blank, int mode_switch);
+	int	(*con_blank)(struct vc_data *vc, enum vesa_blank_mode blank,
+			     int mode_switch);
 	int	(*con_font_set)(struct vc_data *vc, struct console_font *font,
 			unsigned int vpitch, unsigned int flags);
 	int	(*con_font_get)(struct vc_data *vc, struct console_font *font,
@@ -520,12 +530,6 @@ void vcs_remove_sysfs(int index);
  */
 extern atomic_t ignore_console_lock_warning;
 
-/* VESA Blanking Levels */
-#define VESA_NO_BLANKING        0
-#define VESA_VSYNC_SUSPEND      1
-#define VESA_HSYNC_SUSPEND      2
-#define VESA_POWERDOWN          3
-
 extern void console_init(void);
 
 /* For deferred console takeover */
diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
index 3a49913d006c..562bdbb76ad9 100644
--- a/include/uapi/linux/fb.h
+++ b/include/uapi/linux/fb.h
@@ -294,11 +294,14 @@ struct fb_con2fbmap {
 };
 
 /* VESA Blanking Levels */
+#ifdef __KERNEL__
+#include <linux/console.h>
+#else
 #define VESA_NO_BLANKING        0
 #define VESA_VSYNC_SUSPEND      1
 #define VESA_HSYNC_SUSPEND      2
 #define VESA_POWERDOWN          3
-
+#endif
 
 enum {
 	/* screen: unblanked, hsync: on,  vsync: on */
-- 
2.43.0


