Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B2F28AEDB
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Oct 2020 09:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgJLHOX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Oct 2020 03:14:23 -0400
Received: from mout.gmx.net ([212.227.15.19]:42235 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbgJLHOX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 03:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602486849;
        bh=tvwZ2I0Vln5S0HztNHbj8QjwhCfYwhcbxul41O/9SB8=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=atxkmnD9JgCDk5k1myLMiBKntJOOK1bFXHBFybKpZSNyZ5dlf2CTpRrfqpkag1uG0
         Piw9oVZ0eKjWVHpOjZbAmwl5iDCVI4srJwBIzDn3gL0Q8Br8G7KfknR8uscr1IRhs9
         qQeimswqrUl0VNUsnV/lqibjb2LwLRUGVJVTVWAI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.158.71]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1ML9yS-1kk5ND1Kra-00IFYS; Mon, 12
 Oct 2020 09:14:09 +0200
Date:   Mon, 12 Oct 2020 09:14:06 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc/sticon: Add user font support
Message-ID: <20201012071406.GA15312@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:qEm+G85IB4AfUH9HQ9iDecQTPfp4bcWCFtWETaPsNt02yRRbMRD
 Ytd2GzO+IooBAiqiv9WDSy1nHhdD0JlheWlLRqvfgX6bblsUEXeu5z84Jv713J6vOwtT4RE
 ybtjWe9EPbFqjKAcf16f5VhPVhJHe6Ofogk/tTDQUKHOnGKdamlWJHzhCiKGZgV8De3n0gP
 hU3XgLW1Nn03e9mB7W4wg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B36Z7hbNIho=:47Yna323n7MDpKh9xo1tgF
 eQNAcue1VCBWjgg+3qAVyOX31pxtLJIq/W95Nc8WOvFZ60JOZsfBY+EPuwMa1V5fAVtEKzVya
 HUxSUdcpuYwEC2bFWp3d6pYteDPEyC1kaFIRSQZza5EloNENPbW2G7ikDOpWUeCFLBEdJeLzF
 kqWDk+i5l6qYiz3MedkNPFNbhpVCtJLuKSCRPh7gpaNSx2yCUK8tASTbblwrXCwWGlxxJmcS3
 /r5ZyvuwWYSJNwj4f1SziIF+THqxkBOfSoXPzsVXtdOw63J8vtxg5Mg5KFrWN37fIcmR7Df2m
 +4wkSWZzsI4mLUdCIEOmv2Kl8gsvxJfWgwi4hH4AxXObcDtrWb/6i5GYXXGdzY2HzE0h80+rf
 j8otnZuG6z4SpMq6902XGvZ91w5U+jFLhQdgHZWj6gHeCoh+EjSWgwhADyppHXhmOax7wPRhf
 Bk+5qWj4JuFOnOUURLg2W+nQmE3EcfoXvylF+70D/1k2P3Vw0uPWCsGk/wUMpVsqotcw9OSg6
 akY1TlpEGVIHerAFyY3qnzXoVJ4YsxHAw11rTNfluHluN465QEl8CK8Gm45xaDh5ggYvVCTa+
 XrD4Xp7By1KRx/jxdZVmH1oz0NJfP2LFcp3Rz0zlbiqSvEhwe1zLBXYIg584K3kxeZLvZNXI8
 N1kpsMgVIQ8vBtS3NVp+5CFFbOyId+kNyAeTnsQWM1wsYqKOisEy6WuKdbLEfWfvlJyjXJTVW
 DwRPmKTKX2t0pxO+bCBu1TyzitbpisGZgU1h9PGjc9g8EYtXPBok+xu/ciRiEx3i6rVL4cEUA
 qezY6ixx44hjojWXCgIkx9mwi96BzMsjEMaoHCXM+YH8Bi/ZOBxXI/41/GZA0QNeM8x/RGKfh
 5Miy8BEL6SfD5Ve51H+pIaUD4iIXF+xaCcfYVB6nij74Utnxo+KLmqTXw9SNN7mmdN7kxTRzp
 MU/SDhhV3msG+3gTd4VHxLMC/PV4rcaP+9cmwEENIaavG1VOWXNZpbrXubgIstZcb+KLnpqKP
 VsS4/JvaiX61Q+Xi+pxvnOFqo60GnvCLM9dn9G/zM0auME14xc4CjoItjlwnu460eMWAXKJp1
 1azlycuXTHTCjzej7vehpGf1uaSvYCVO6ZSE2UHly2GkMoSPeGSqemVjGUDPBMdWCWHKQrRII
 ZpuyHZXSrlWtMpnyAI1R43jAbczrDub5thpfHxnqUn8ZMq3rRoDsl75GiLd2TXPGqbwsw6nKB
 F80G+XzCfNWx1vel2
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is a major rework of the sticon (parisc text console) driver in
order to support user font support.

Usually one want to use the stifb (parisc framebuffer driver) which is
based on fbcon and does support fonts and colors, but some old machines
(e.g. HP 730 workstations) don't provide a supported stifb graphic card,
and for those user fonts are preferred.

This patch drops unused code for software cursor and scrollback,
enhances the debug output and adds better documentation.

The code was tested on various machines with byte-mode and word-mode
graphic cards on GSC- and PCI-busses.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 39deb22a4180..ee33b8ec62bb 100644
=2D-- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -119,6 +119,7 @@ config STI_CONSOLE
 	bool "STI text console"
 	depends on PARISC && HAS_IOMEM
 	select FONT_SUPPORT
+	select CRC32
 	default y
 	help
 	  The STI console is the builtin display/keyboard on HP-PARISC
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon=
.c
index 8647d2b654b1..43b3fc8d6292 100644
=2D-- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -2,7 +2,7 @@
  *  linux/drivers/video/console/sticon.c - console driver using HP's STI =
firmware
  *
  *	Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
- *	Copyright (C) 2002 Helge Deller <deller@gmx.de>
+ *	Copyright (C) 2002-2020 Helge Deller <deller@gmx.de>
  *
  *  Based on linux/drivers/video/vgacon.c and linux/drivers/video/fbcon.c=
,
  *  which were
@@ -43,6 +43,9 @@
 #include <linux/kd.h>
 #include <linux/selection.h>
 #include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/font.h>
+#include <linux/crc32.h>

 #include <asm/io.h>

@@ -52,27 +55,15 @@
 #define BLANK 0
 static int vga_is_gfx;

-/* this is the sti_struct used for this console */
-static struct sti_struct *sticon_sti;
-
-/* Software scrollback */
-static unsigned long softback_buf, softback_curr;
-static unsigned long softback_in;
-static unsigned long /* softback_top, */ softback_end;
-static int softback_lines;
-
-/* software cursor */
-static int cursor_drawn;
-#define CURSOR_DRAW_DELAY		(1)
-#define DEFAULT_CURSOR_BLINK_RATE	(20)
+#define STI_DEF_FONT	sticon_sti->font

-static int vbl_cursor_cnt;
+/* borrowed from fbcon.c */
+#define FNTREFCOUNT(fd)	(fd->refcount)
+#define FNTCRC(fd)	(fd->crc)
+static struct sti_cooked_font *font_data[MAX_NR_CONSOLES];

-static inline void cursor_undrawn(void)
-{
-    vbl_cursor_cnt =3D 0;
-    cursor_drawn =3D 0;
-}
+/* this is the sti_struct used for this console */
+static struct sti_struct *sticon_sti;

 static const char *sticon_startup(void)
 {
@@ -81,61 +72,43 @@ static const char *sticon_startup(void)

 static void sticon_putc(struct vc_data *conp, int c, int ypos, int xpos)
 {
-    int redraw_cursor =3D 0;
-
     if (vga_is_gfx || console_blanked)
 	    return;

     if (conp->vc_mode !=3D KD_TEXT)
     	    return;
-#if 0
-    if ((p->cursor_x =3D=3D xpos) && (p->cursor_y =3D=3D ypos)) {
-	    cursor_undrawn();
-	    redraw_cursor =3D 1;
-    }
-#endif

-    sti_putc(sticon_sti, c, ypos, xpos);
-
-    if (redraw_cursor)
-	    vbl_cursor_cnt =3D CURSOR_DRAW_DELAY;
+    sti_putc(sticon_sti, c, ypos, xpos, font_data[conp->vc_num]);
 }

 static void sticon_putcs(struct vc_data *conp, const unsigned short *s,
 			 int count, int ypos, int xpos)
 {
-    int redraw_cursor =3D 0;
-
     if (vga_is_gfx || console_blanked)
 	    return;

     if (conp->vc_mode !=3D KD_TEXT)
     	    return;

-#if 0
-    if ((p->cursor_y =3D=3D ypos) && (xpos <=3D p->cursor_x) &&
-	(p->cursor_x < (xpos + count))) {
-	    cursor_undrawn();
-	    redraw_cursor =3D 1;
-    }
-#endif
-
     while (count--) {
-	sti_putc(sticon_sti, scr_readw(s++), ypos, xpos++);
+	sti_putc(sticon_sti, scr_readw(s++), ypos, xpos++,
+		 font_data[conp->vc_num]);
     }
-
-    if (redraw_cursor)
-	    vbl_cursor_cnt =3D CURSOR_DRAW_DELAY;
 }

 static void sticon_cursor(struct vc_data *conp, int mode)
 {
     unsigned short car1;

+    /* no cursor update if screen is blanked */
+    if (vga_is_gfx || console_blanked)
+	return;
+
     car1 =3D conp->vc_screenbuf[conp->state.x + conp->state.y * conp->vc_=
cols];
     switch (mode) {
     case CM_ERASE:
-	sti_putc(sticon_sti, car1, conp->state.y, conp->state.x);
+	sti_putc(sticon_sti, car1, conp->state.y, conp->state.x,
+		 font_data[conp->vc_num]);
 	break;
     case CM_MOVE:
     case CM_DRAW:
@@ -146,7 +119,7 @@ static void sticon_cursor(struct vc_data *conp, int mo=
de)
 	case CUR_TWO_THIRDS:
 	case CUR_BLOCK:
 	    sti_putc(sticon_sti, (car1 & 255) + (0 << 8) + (7 << 11),
-		     conp->state.y, conp->state.x);
+		     conp->state.y, conp->state.x, font_data[conp->vc_num]);
 	    break;
 	}
 	break;
@@ -165,42 +138,164 @@ static bool sticon_scroll(struct vc_data *conp, uns=
igned int t,

     switch (dir) {
     case SM_UP:
-	sti_bmove(sti, t + count, 0, t, 0, b - t - count, conp->vc_cols);
-	sti_clear(sti, b - count, 0, count, conp->vc_cols, conp->vc_video_erase_=
char);
+	sti_bmove(sti, t + count, 0, t, 0, b - t - count, conp->vc_cols,
+		  font_data[conp->vc_num]);
+	sti_clear(sti, b - count, 0, count, conp->vc_cols,
+		  conp->vc_video_erase_char, font_data[conp->vc_num]);
 	break;

     case SM_DOWN:
-	sti_bmove(sti, t, 0, t + count, 0, b - t - count, conp->vc_cols);
-	sti_clear(sti, t, 0, count, conp->vc_cols, conp->vc_video_erase_char);
+	sti_bmove(sti, t, 0, t + count, 0, b - t - count, conp->vc_cols,
+		  font_data[conp->vc_num]);
+	sti_clear(sti, t, 0, count, conp->vc_cols,
+		  conp->vc_video_erase_char, font_data[conp->vc_num]);
 	break;
     }

     return false;
 }

+static int sticon_set_def_font(int unit, struct console_font *op)
+{
+	if (font_data[unit] !=3D STI_DEF_FONT) {
+		if (--FNTREFCOUNT(font_data[unit]) =3D=3D 0) {
+			kfree(font_data[unit]->raw_ptr);
+			kfree(font_data[unit]);
+		}
+		font_data[unit] =3D STI_DEF_FONT;
+	}
+
+	return 0;
+}
+
+static int sticon_set_font(struct vc_data *vc, struct console_font *op)
+{
+	struct sti_struct *sti =3D sticon_sti;
+	int vc_cols, vc_rows, vc_old_cols, vc_old_rows;
+	int unit =3D vc->vc_num;
+	int w =3D op->width;
+	int h =3D op->height;
+	int size, i, bpc, pitch;
+	struct sti_rom_font *new_font;
+	struct sti_cooked_font *cooked_font;
+	unsigned char *data =3D op->data, *p;
+
+	if ((w < 6) || (h < 6) || (w > 32) || (h > 32)
+	    || (op->charcount !=3D 256 && op->charcount !=3D 512))
+		return -EINVAL;
+	pitch =3D ALIGN(w, 8) / 8;
+	bpc =3D pitch * h;
+	size =3D bpc * op->charcount;
+
+	new_font =3D kmalloc(sizeof(*new_font) + size, STI_LOWMEM);
+	if (!new_font)
+		return -ENOMEM;
+
+	new_font->first_char =3D 0;
+	new_font->last_char =3D op->charcount - 1;
+	new_font->width =3D w;
+	new_font->height =3D h;
+	new_font->font_type =3D STI_FONT_HPROMAN8;
+	new_font->bytes_per_char =3D bpc;
+	new_font->underline_height =3D 0;
+	new_font->underline_pos =3D 0;
+
+	cooked_font =3D kzalloc(sizeof(*cooked_font), GFP_KERNEL);
+	if (!cooked_font) {
+		kfree(new_font);
+		return -ENOMEM;
+	}
+	cooked_font->raw =3D new_font;
+	cooked_font->raw_ptr =3D new_font;
+	cooked_font->width =3D w;
+	cooked_font->height =3D h;
+	FNTREFCOUNT(cooked_font) =3D 0;	/* usage counter */
+
+	p =3D (unsigned char *) new_font;
+	p +=3D sizeof(*new_font);
+	for (i =3D 0; i < op->charcount; i++) {
+		memcpy(p, data, bpc);
+		data +=3D pitch*32;
+		p +=3D bpc;
+	}
+	FNTCRC(cooked_font) =3D crc32(0, new_font, size + sizeof(*new_font));
+	sti_font_convert_bytemode(sti, cooked_font);
+	new_font =3D cooked_font->raw_ptr;
+
+	/* check if font is already used by other console */
+	for (i =3D 0; i < MAX_NR_CONSOLES; i++) {
+		if (font_data[i] !=3D STI_DEF_FONT
+		    && (FNTCRC(font_data[i]) =3D=3D FNTCRC(cooked_font))) {
+			kfree(new_font);
+			kfree(cooked_font);
+			/* current font is the same as the new one */
+			if (i =3D=3D unit)
+				return 0;
+			cooked_font =3D font_data[i];
+			new_font =3D cooked_font->raw_ptr;
+			break;
+		}
+	}
+
+	/* clear screen with old font: we now may have less rows */
+	vc_old_rows =3D vc->vc_rows;
+	vc_old_cols =3D vc->vc_cols;
+	sti_clear(sticon_sti, 0, 0, vc_old_rows, vc_old_cols,
+		  vc->vc_video_erase_char, font_data[vc->vc_num]);
+
+	/* delete old font in case it is a user font */
+	sticon_set_def_font(unit, NULL);
+
+	FNTREFCOUNT(cooked_font)++;
+	font_data[unit] =3D cooked_font;
+
+	vc_cols =3D sti_onscreen_x(sti) / cooked_font->width;
+	vc_rows =3D sti_onscreen_y(sti) / cooked_font->height;
+	vc_resize(vc, vc_cols, vc_rows);
+
+	/* need to repaint screen if cols & rows are same as old font */
+	if (vc_cols =3D=3D vc_old_cols && vc_rows =3D=3D vc_old_rows)
+		update_screen(vc);
+
+	return 0;
+}
+
+static int sticon_font_default(struct vc_data *vc, struct console_font *o=
p, char *name)
+{
+	return sticon_set_def_font(vc->vc_num, op);
+}
+
+static int sticon_font_set(struct vc_data *vc, struct console_font *font,
+			   unsigned int flags)
+{
+	return sticon_set_font(vc, font);
+}
+
 static void sticon_init(struct vc_data *c, int init)
 {
     struct sti_struct *sti =3D sticon_sti;
     int vc_cols, vc_rows;

     sti_set(sti, 0, 0, sti_onscreen_y(sti), sti_onscreen_x(sti), 0);
-    vc_cols =3D sti_onscreen_x(sti) / sti->font_width;
-    vc_rows =3D sti_onscreen_y(sti) / sti->font_height;
+    vc_cols =3D sti_onscreen_x(sti) / sti->font->width;
+    vc_rows =3D sti_onscreen_y(sti) / sti->font->height;
     c->vc_can_do_color =3D 1;

     if (init) {
 	c->vc_cols =3D vc_cols;
 	c->vc_rows =3D vc_rows;
     } else {
-	/* vc_rows =3D (c->vc_rows > vc_rows) ? vc_rows : c->vc_rows; */
-	/* vc_cols =3D (c->vc_cols > vc_cols) ? vc_cols : c->vc_cols; */
 	vc_resize(c, vc_cols, vc_rows);
-/*	vc_resize_con(vc_rows, vc_cols, c->vc_num); */
     }
 }

 static void sticon_deinit(struct vc_data *c)
 {
+    int i;
+
+    /* free memory used by user font */
+    for (i =3D 0; i < MAX_NR_CONSOLES; i++)
+	sticon_set_def_font(i, NULL);
 }

 static void sticon_clear(struct vc_data *conp, int sy, int sx, int height=
,
@@ -209,7 +304,8 @@ static void sticon_clear(struct vc_data *conp, int sy,=
 int sx, int height,
     if (!height || !width)
 	return;

-    sti_clear(sticon_sti, sy, sx, height, width, conp->vc_video_erase_cha=
r);
+    sti_clear(sticon_sti, sy, sx, height, width,
+	      conp->vc_video_erase_char, font_data[conp->vc_num]);
 }

 static int sticon_switch(struct vc_data *conp)
@@ -217,11 +313,6 @@ static int sticon_switch(struct vc_data *conp)
     return 1;	/* needs refreshing */
 }

-static int sticon_set_origin(struct vc_data *conp)
-{
-    return 0;
-}
-
 static int sticon_blank(struct vc_data *c, int blank, int mode_switch)
 {
     if (blank =3D=3D 0) {
@@ -229,65 +320,13 @@ static int sticon_blank(struct vc_data *c, int blank=
, int mode_switch)
 	    vga_is_gfx =3D 0;
 	return 1;
     }
-    sticon_set_origin(c);
-    sti_clear(sticon_sti, 0,0, c->vc_rows, c->vc_cols, BLANK);
+    sti_clear(sticon_sti, 0, 0, c->vc_rows, c->vc_cols, BLANK,
+	      font_data[c->vc_num]);
     if (mode_switch)
 	vga_is_gfx =3D 1;
     return 1;
 }

-static u16 *sticon_screen_pos(struct vc_data *conp, int offset)
-{
-    int line;
-    unsigned long p;
-
-    if (conp->vc_num !=3D fg_console || !softback_lines)
-    	return (u16 *)(conp->vc_origin + offset);
-    line =3D offset / conp->vc_size_row;
-    if (line >=3D softback_lines)
-    	return (u16 *)(conp->vc_origin + offset - softback_lines * conp->vc_=
size_row);
-    p =3D softback_curr + offset;
-    if (p >=3D softback_end)
-    	p +=3D softback_buf - softback_end;
-    return (u16 *)p;
-}
-
-static unsigned long sticon_getxy(struct vc_data *conp, unsigned long pos=
,
-				  int *px, int *py)
-{
-    int x, y;
-    unsigned long ret;
-    if (pos >=3D conp->vc_origin && pos < conp->vc_scr_end) {
-    	unsigned long offset =3D (pos - conp->vc_origin) / 2;
-
-    	x =3D offset % conp->vc_cols;
-    	y =3D offset / conp->vc_cols;
-    	if (conp->vc_num =3D=3D fg_console)
-    	    y +=3D softback_lines;
-    	ret =3D pos + (conp->vc_cols - x) * 2;
-    } else if (conp->vc_num =3D=3D fg_console && softback_lines) {
-    	unsigned long offset =3D pos - softback_curr;
-
-    	if (pos < softback_curr)
-    	    offset +=3D softback_end - softback_buf;
-    	offset /=3D 2;
-    	x =3D offset % conp->vc_cols;
-    	y =3D offset / conp->vc_cols;
-	ret =3D pos + (conp->vc_cols - x) * 2;
-	if (ret =3D=3D softback_end)
-	    ret =3D softback_buf;
-	if (ret =3D=3D softback_in)
-	    ret =3D conp->vc_origin;
-    } else {
-    	/* Should not happen */
-    	x =3D y =3D 0;
-    	ret =3D conp->vc_origin;
-    }
-    if (px) *px =3D x;
-    if (py) *py =3D y;
-    return ret;
-}
-
 static u8 sticon_build_attr(struct vc_data *conp, u8 color,
 			    enum vc_intensity intens,
 			    bool blink, bool underline, bool reverse,
@@ -318,10 +357,6 @@ static void sticon_invert_region(struct vc_data *conp=
, u16 *p, int count)
     }
 }

-static void sticon_save_screen(struct vc_data *conp)
-{
-}
-
 static const struct consw sti_con =3D {
 	.owner			=3D THIS_MODULE,
 	.con_startup		=3D sticon_startup,
@@ -334,23 +369,25 @@ static const struct consw sti_con =3D {
 	.con_scroll		=3D sticon_scroll,
 	.con_switch		=3D sticon_switch,
 	.con_blank		=3D sticon_blank,
-	.con_set_origin		=3D sticon_set_origin,
-	.con_save_screen	=3D sticon_save_screen,
+	.con_font_set		=3D sticon_font_set,
+	.con_font_default	=3D sticon_font_default,
 	.con_build_attr		=3D sticon_build_attr,
 	.con_invert_region	=3D sticon_invert_region,
-	.con_screen_pos		=3D sticon_screen_pos,
-	.con_getxy		=3D sticon_getxy,
 };



 static int __init sticonsole_init(void)
 {
-    int err;
+    int err, i;
+
     /* already initialized ? */
     if (sticon_sti)
 	 return 0;

+    for (i =3D 0; i < MAX_NR_CONSOLES; i++)
+	font_data[i] =3D STI_DEF_FONT;
+
     sticon_sti =3D sti_get_rom(0);
     if (!sticon_sti)
 	return -ENODEV;
diff --git a/drivers/video/console/sticore.c b/drivers/video/console/stico=
re.c
index 84c3ca37040a..6a26a364f9bd 100644
=2D-- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -4,7 +4,7 @@
  *	core code for console driver using HP's STI firmware
  *
  *	Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
- *	Copyright (C) 2001-2013 Helge Deller <deller@gmx.de>
+ *	Copyright (C) 2001-2020 Helge Deller <deller@gmx.de>
  *	Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de=
>
  *
  * TODO:
@@ -14,6 +14,8 @@
  *
  */

+#define pr_fmt(fmt) "%s: " fmt, KBUILD_MODNAME
+
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -133,16 +135,17 @@ static const struct sti_font_flags default_font_flag=
s =3D {
 };

 void
-sti_putc(struct sti_struct *sti, int c, int y, int x)
+sti_putc(struct sti_struct *sti, int c, int y, int x,
+	 struct sti_cooked_font *font)
 {
 	struct sti_font_inptr *inptr =3D &sti->sti_data->font_inptr;
 	struct sti_font_inptr inptr_default =3D {
-		.font_start_addr=3D STI_PTR(sti->font->raw),
+		.font_start_addr =3D STI_PTR(font->raw),
 		.index		=3D c_index(sti, c),
 		.fg_color	=3D c_fg(sti, c),
 		.bg_color	=3D c_bg(sti, c),
-		.dest_x		=3D x * sti->font_width,
-		.dest_y		=3D y * sti->font_height,
+		.dest_x		=3D x * font->width,
+		.dest_y		=3D y * font->height,
 	};
 	struct sti_font_outptr *outptr =3D &sti->sti_data->font_outptr;
 	s32 ret;
@@ -193,18 +196,18 @@ sti_set(struct sti_struct *sti, int src_y, int src_x=
,

 void
 sti_clear(struct sti_struct *sti, int src_y, int src_x,
-	  int height, int width, int c)
+	  int height, int width, int c, struct sti_cooked_font *font)
 {
 	struct sti_blkmv_inptr *inptr =3D &sti->sti_data->blkmv_inptr;
 	struct sti_blkmv_inptr inptr_default =3D {
 		.fg_color	=3D c_fg(sti, c),
 		.bg_color	=3D c_bg(sti, c),
-		.src_x		=3D src_x * sti->font_width,
-		.src_y		=3D src_y * sti->font_height,
-		.dest_x		=3D src_x * sti->font_width,
-		.dest_y		=3D src_y * sti->font_height,
-		.width		=3D width * sti->font_width,
-		.height		=3D height* sti->font_height,
+		.src_x		=3D src_x * font->width,
+		.src_y		=3D src_y * font->height,
+		.dest_x		=3D src_x * font->width,
+		.dest_y		=3D src_y * font->height,
+		.width		=3D width * font->width,
+		.height		=3D height * font->height,
 	};
 	struct sti_blkmv_outptr *outptr =3D &sti->sti_data->blkmv_outptr;
 	s32 ret;
@@ -225,16 +228,17 @@ static const struct sti_blkmv_flags default_blkmv_fl=
ags =3D {

 void
 sti_bmove(struct sti_struct *sti, int src_y, int src_x,
-	  int dst_y, int dst_x, int height, int width)
+	  int dst_y, int dst_x, int height, int width,
+	  struct sti_cooked_font *font)
 {
 	struct sti_blkmv_inptr *inptr =3D &sti->sti_data->blkmv_inptr;
 	struct sti_blkmv_inptr inptr_default =3D {
-		.src_x		=3D src_x * sti->font_width,
-		.src_y		=3D src_y * sti->font_height,
-		.dest_x		=3D dst_x * sti->font_width,
-		.dest_y		=3D dst_y * sti->font_height,
-		.width		=3D width * sti->font_width,
-		.height		=3D height* sti->font_height,
+		.src_x		=3D src_x * font->width,
+		.src_y		=3D src_y * font->height,
+		.dest_x		=3D dst_x * font->width,
+		.dest_y		=3D dst_y * font->height,
+		.width		=3D width * font->width,
+		.height		=3D height * font->height,
 	};
 	struct sti_blkmv_outptr *outptr =3D &sti->sti_data->blkmv_outptr;
 	s32 ret;
@@ -301,36 +305,32 @@ __setup("sti=3D", sti_setup);



-static char *font_name[MAX_STI_ROMS];
-static int font_index[MAX_STI_ROMS],
-	   font_height[MAX_STI_ROMS],
-	   font_width[MAX_STI_ROMS];
+static char *font_name;
+static int font_index,
+	   font_height,
+	   font_width;
 #ifndef MODULE
 static int sti_font_setup(char *str)
 {
-	char *x;
-	int i =3D 0;
+	/*
+	 * The default font can be selected in various ways.
+	 * a) sti_font=3DVGA8x16, sti_font=3D10x20, sti_font=3D10*20 selects
+	 *    an built-in Linux framebuffer font.
+	 * b) sti_font=3D<index>, where index is (1..x) with 1 selecting
+	 *    the first HP STI ROM built-in font..
+	 */

-	/* we accept sti_font=3DVGA8x16, sti_font=3D10x20, sti_font=3D10*20
-	 * or sti_font=3D7 style command lines. */
+	if (*str >=3D '0' && *str <=3D '9') {
+		char *x;

-	while (i<MAX_STI_ROMS && str && *str) {
-		if (*str>=3D'0' && *str<=3D'9') {
-			if ((x =3D strchr(str, 'x')) || (x =3D strchr(str, '*'))) {
-				font_height[i] =3D simple_strtoul(str, NULL, 0);
-				font_width[i] =3D simple_strtoul(x+1, NULL, 0);
-			} else {
-				font_index[i] =3D simple_strtoul(str, NULL, 0);
-			}
+		if ((x =3D strchr(str, 'x')) || (x =3D strchr(str, '*'))) {
+			font_height =3D simple_strtoul(str, NULL, 0);
+			font_width =3D simple_strtoul(x+1, NULL, 0);
 		} else {
-			font_name[i] =3D str;	/* fb font name */
+			font_index =3D simple_strtoul(str, NULL, 0);
 		}
-
-		if ((x =3D strchr(str, ',')))
-			*x++ =3D 0;
-		str =3D x;
-
-		i++;
+	} else {
+		font_name =3D str;	/* fb font name */
 	}

 	return 1;
@@ -344,7 +344,7 @@ static int sti_font_setup(char *str)
  *		framebuffer font names (e.g. VGA8x16, SUN22x18).
  *		This is only available if the fonts have been statically compiled
  *		in with e.g. the CONFIG_FONT_8x16 or CONFIG_FONT_SUN12x22 options.
- *	- sti_font=3D<number>
+ *	- sti_font=3D<number>	(<number> =3D 1,2,3,...)
  *		most STI ROMs have built-in HP specific fonts, which can be selected
  *		by giving the desired number to the sticon driver.
  *		NOTE: This number is machine and STI ROM dependend.
@@ -364,8 +364,7 @@ static void sti_dump_globcfg(struct sti_glob_cfg *glob=
_cfg,
 {
 	struct sti_glob_cfg_ext *cfg;

-	DPRINTK((KERN_INFO
-		"%d text planes\n"
+	pr_debug("%d text planes\n"
 		"%4d x %4d screen resolution\n"
 		"%4d x %4d offscreen\n"
 		"%4d x %4d layout\n"
@@ -382,12 +381,11 @@ static void sti_dump_globcfg(struct sti_glob_cfg *gl=
ob_cfg,
 		glob_cfg->region_ptrs[4], glob_cfg->region_ptrs[5],
 		glob_cfg->region_ptrs[6], glob_cfg->region_ptrs[7],
 		glob_cfg->reent_lvl,
-		glob_cfg->save_addr));
+		glob_cfg->save_addr);

 	/* dump extended cfg */
 	cfg =3D PTR_STI((unsigned long)glob_cfg->ext_ptr);
-	DPRINTK(( KERN_INFO
-		"monitor %d\n"
+	pr_debug("monitor %d\n"
 		"in friendly mode: %d\n"
 		"power consumption %d watts\n"
 		"freq ref %d\n"
@@ -396,20 +394,19 @@ static void sti_dump_globcfg(struct sti_glob_cfg *gl=
ob_cfg,
 		cfg->friendly_boot,
 		cfg->power,
 		cfg->freq_ref,
-		cfg->sti_mem_addr, sti_mem_request));
+		cfg->sti_mem_addr, sti_mem_request);
 }

 static void sti_dump_outptr(struct sti_struct *sti)
 {
-	DPRINTK((KERN_INFO
-		"%d bits per pixel\n"
+	pr_debug("%d bits per pixel\n"
 		"%d used bits\n"
 		"%d planes\n"
 		"attributes %08x\n",
 		 sti->sti_data->inq_outptr.bits_per_pixel,
 		 sti->sti_data->inq_outptr.bits_used,
 		 sti->sti_data->inq_outptr.planes,
-		 sti->sti_data->inq_outptr.attributes));
+		 sti->sti_data->inq_outptr.attributes);
 }

 static int sti_init_glob_cfg(struct sti_struct *sti, unsigned long rom_ad=
dress,
@@ -448,8 +445,7 @@ static int sti_init_glob_cfg(struct sti_struct *sti, u=
nsigned long rom_address,
 			if (offs !=3D PCI_ROM_ADDRESS &&
 			    (offs < PCI_BASE_ADDRESS_0 ||
 			     offs > PCI_BASE_ADDRESS_5)) {
-				printk (KERN_WARNING
-					"STI pci region mapping for region %d (%02x) can't be mapped\n",
+				pr_warn("STI pci region mapping for region %d (%02x) can't be mapped\=
n",
 					i,sti->rm_entry[i]);
 				continue;
 			}
@@ -464,14 +460,14 @@ static int sti_init_glob_cfg(struct sti_struct *sti,=
 unsigned long rom_address,
 		if (len)
 			glob_cfg->region_ptrs[i] =3D sti->regions_phys[i];

-		DPRINTK(("region #%d: phys %08lx, region_ptr %08x, len=3D%lukB, "
+		pr_debug("region #%d: phys %08lx, region_ptr %08x, len=3D%lukB, "
 			 "btlb=3D%d, sysonly=3D%d, cache=3D%d, last=3D%d\n",
 			i, sti->regions_phys[i], glob_cfg->region_ptrs[i],
 			len/1024,
 			sti->regions[i].region_desc.btlb,
 			sti->regions[i].region_desc.sys_only,
 			sti->regions[i].region_desc.cache,
-			sti->regions[i].region_desc.last));
+			sti->regions[i].region_desc.last);

 		/* last entry reached ? */
 		if (sti->regions[i].region_desc.last)
@@ -479,8 +475,8 @@ static int sti_init_glob_cfg(struct sti_struct *sti, u=
nsigned long rom_address,
 	}

 	if (++i<8 && sti->regions[i].region)
-		printk(KERN_WARNING "%s: *future ptr (0x%8x) not yet supported !\n",
-				__FILE__, sti->regions[i].region);
+		pr_warn("future ptr (0x%8x) not yet supported !\n",
+			sti->regions[i].region);

 	glob_cfg_ext->sti_mem_addr =3D STI_PTR(sti_mem_addr);

@@ -538,6 +534,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, c=
onst char *fbfont_name)
 	}

 	cooked_font->raw =3D nf;
+	cooked_font->raw_ptr =3D nf;
 	cooked_font->next_font =3D NULL;

 	cooked_rom->font_start =3D cooked_font;
@@ -552,24 +549,38 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom,=
 const char *fbfont_name)
 }
 #endif

-static struct sti_cooked_font *sti_select_font(struct sti_cooked_rom *rom=
,
-		int (*search_font_fnc)(struct sti_cooked_rom *, int, int))
+static int sti_search_font(struct sti_cooked_rom *rom, int height, int wi=
dth)
+{
+	struct sti_cooked_font *font;
+	int i =3D 0;
+
+	for (font =3D rom->font_start; font; font =3D font->next_font, i++) {
+		if ((font->raw->width =3D=3D width) &&
+		    (font->raw->height =3D=3D height))
+			return i;
+	}
+	return 0;
+}
+
+static struct sti_cooked_font *sti_select_font(struct sti_cooked_rom *rom=
)
 {
 	struct sti_cooked_font *font;
 	int i;
-	int index =3D num_sti_roms;

 	/* check for framebuffer-font first */
-	if ((font =3D sti_select_fbfont(rom, font_name[index])))
-		return font;
+	if (!font_index) {
+		font =3D sti_select_fbfont(rom, font_name);
+		if (font)
+			return font;
+	}

-	if (font_width[index] && font_height[index])
-		font_index[index] =3D search_font_fnc(rom,
-				font_height[index], font_width[index]);
+	if (font_width && font_height)
+		font_index =3D sti_search_font(rom,
+				font_height, font_width);

-	for (font =3D rom->font_start, i =3D font_index[index];
-	    font && (i > 0);
-	    font =3D font->next_font, i--);
+	for (font =3D rom->font_start, i =3D font_index - 1;
+		font && (i > 0);
+		font =3D font->next_font, i--);

 	if (font)
 		return font;
@@ -578,20 +589,35 @@ static struct sti_cooked_font *sti_select_font(struc=
t sti_cooked_rom *rom,
 }


-static void sti_dump_rom(struct sti_rom *rom)
+static void sti_dump_rom(struct sti_struct *sti)
 {
-	printk(KERN_INFO "    id %04x-%04x, conforms to spec rev. %d.%02x\n",
+	struct sti_rom *rom =3D sti->rom->raw;
+	struct sti_cooked_font *font_start;
+	int nr;
+
+	pr_info("  id %04x-%04x, conforms to spec rev. %d.%02x\n",
 		rom->graphics_id[0],
 		rom->graphics_id[1],
 		rom->revno[0] >> 4,
 		rom->revno[0] & 0x0f);
-	DPRINTK(("      supports %d monitors\n", rom->num_mons));
-	DPRINTK(("      font start %08x\n", rom->font_start));
-	DPRINTK(("      region list %08x\n", rom->region_list));
-	DPRINTK(("      init_graph %08x\n", rom->init_graph));
-	DPRINTK(("      bus support %02x\n", rom->bus_support));
-	DPRINTK(("      ext bus support %02x\n", rom->ext_bus_support));
-	DPRINTK(("      alternate code type %d\n", rom->alt_code_type));
+	pr_debug("  supports %d monitors\n", rom->num_mons);
+	pr_debug("  font start %08x\n", rom->font_start);
+	pr_debug("  region list %08x\n", rom->region_list);
+	pr_debug("  init_graph %08x\n", rom->init_graph);
+	pr_debug("  bus support %02x\n", rom->bus_support);
+	pr_debug("  ext bus support %02x\n", rom->ext_bus_support);
+	pr_debug("  alternate code type %d\n", rom->alt_code_type);
+
+	font_start =3D sti->rom->font_start;
+	nr =3D 0;
+	while (font_start) {
+		struct sti_rom_font *f =3D font_start->raw;
+
+		pr_info("    built-in font #%d: size %dx%d, chars %d-%d, bpc %d\n", ++n=
r,
+			f->width, f->height,
+			f->first_char, f->last_char, f->bytes_per_char);
+		font_start =3D font_start->next_font;
+	}
 }


@@ -628,39 +654,34 @@ static int sti_cook_fonts(struct sti_cooked_rom *coo=
ked_rom,
 	return 1;
 }

-
-static int sti_search_font(struct sti_cooked_rom *rom, int height, int wi=
dth)
-{
-	struct sti_cooked_font *font;
-	int i =3D 0;
-
-	for (font =3D rom->font_start; font; font =3D font->next_font, i++) {
-		if ((font->raw->width =3D=3D width) &&
-		    (font->raw->height =3D=3D height))
-			return i;
-	}
-	return 0;
-}
-
 #define BMODE_RELOCATE(offset)		offset =3D (offset) / 4;
 #define BMODE_LAST_ADDR_OFFS		0x50

-static void *sti_bmode_font_raw(struct sti_cooked_font *f)
+void sti_font_convert_bytemode(struct sti_struct *sti, struct sti_cooked_=
font *f)
 {
 	unsigned char *n, *p, *q;
-	int size =3D f->raw->bytes_per_char*256+sizeof(struct sti_rom_font);
-
+	int size =3D f->raw->bytes_per_char * 256 + sizeof(struct sti_rom_font);
+	struct sti_rom_font *old_font;
+
+	if (sti->wordmode)
+		return;
+
+	old_font =3D f->raw_ptr;
 	n =3D kcalloc(4, size, STI_LOWMEM);
+	f->raw_ptr =3D n;
 	if (!n)
-		return NULL;
+		return;
 	p =3D n + 3;
-	q =3D (unsigned char *)f->raw;
+	q =3D (unsigned char *) f->raw;
 	while (size--) {
 		*p =3D *q++;
-		p+=3D4;
+		p +=3D 4;
 	}
-	return n + 3;
+	/* store new ptr to byte-mode font and delete old font */
+	f->raw =3D (struct sti_rom_font *) (n + 3);
+	kfree(old_font);
 }
+EXPORT_SYMBOL(sti_font_convert_bytemode);

 static void sti_bmode_rom_copy(unsigned long base, unsigned long count,
 			       void *dest)
@@ -747,7 +768,7 @@ static int sti_read_rom(int wordmode, struct sti_struc=
t *sti,
 		goto out_err;

 	if (!sti_cook_fonts(cooked, raw)) {
-		printk(KERN_ERR "No font found for STI at %08lx\n", address);
+		pr_warn("No font found for STI at %08lx\n", address);
 		goto out_err;
 	}

@@ -756,7 +777,8 @@ static int sti_read_rom(int wordmode, struct sti_struc=
t *sti,

 	address =3D (unsigned long) STI_PTR(raw);

-	pr_info("STI ROM supports 32 %sbit firmware functions.\n",
+	pr_info("STI %s ROM supports 32 %sbit firmware functions.\n",
+		wordmode ? "word mode" : "byte mode",
 		raw->alt_code_type =3D=3D ALT_CODE_TYPE_PA_RISC_64
 		? "and 64 " : "");

@@ -767,18 +789,17 @@ static int sti_read_rom(int wordmode, struct sti_str=
uct *sti,

 	sti->rom =3D cooked;
 	sti->rom->raw =3D raw;
-
-	sti->font =3D sti_select_font(sti->rom, sti_search_font);
-	sti->font_width =3D sti->font->raw->width;
-	sti->font_height =3D sti->font->raw->height;
-	if (!wordmode)
-		sti->font->raw =3D sti_bmode_font_raw(sti->font);
+	sti_dump_rom(sti);
+
+	sti->wordmode =3D wordmode;
+	sti->font =3D sti_select_font(sti->rom);
+	sti->font->width =3D sti->font->raw->width;
+	sti->font->height =3D sti->font->raw->height;
+	sti_font_convert_bytemode(sti, sti->font);

 	sti->sti_mem_request =3D raw->sti_mem_req;
 	sti->graphics_id[0] =3D raw->graphics_id[0];
 	sti->graphics_id[1] =3D raw->graphics_id[1];
-
-	sti_dump_rom(raw);

 	/* check if the ROM routines in this card are compatible */
 	if (wordmode || sti->graphics_id[1] !=3D 0x09A02587)
@@ -804,9 +825,9 @@ static int sti_read_rom(int wordmode, struct sti_struc=
t *sti,
 	return 1;

 msg_not_supported:
-	printk(KERN_ERR "Sorry, this GSC/STI card is not yet supported.\n");
-	printk(KERN_ERR "Please see http://parisc-linux.org/faq/"
-			"graphics-howto.html for more info.\n");
+	pr_warn("Sorry, this GSC/STI card is not yet supported.\n");
+	pr_warn("Please see https://parisc.wiki.kernel.org/"
+		"index.php/Graphics_howto for more info.\n");
 	/* fall through */
 out_err:
 	kfree(raw);
@@ -823,7 +844,7 @@ static struct sti_struct *sti_try_rom_generic(unsigned=
 long address,
 	u32 sig;

 	if (num_sti_roms >=3D MAX_STI_ROMS) {
-		printk(KERN_WARNING "maximum number of STI ROMS reached !\n");
+		pr_warn("maximum number of STI ROMS reached !\n");
 		return NULL;
 	}

@@ -849,16 +870,15 @@ static struct sti_struct *sti_try_rom_generic(unsign=
ed long address,
 		if (i !=3D 1) {
 			/* The ROM could have multiple architecture
 			 * dependent images (e.g. i386, parisc,...) */
-			printk(KERN_WARNING
-				"PCI ROM is not a STI ROM type image (0x%8x)\n", i);
+			pr_warn("PCI ROM is not a STI ROM type image (0x%8x)\n", i);
 			goto out_err;
 		}

 		sti->pd =3D pd;

 		i =3D gsc_readl(address+0x0c);
-		DPRINTK(("PCI ROM size (from header) =3D %d kB\n",
-			le16_to_cpu(i>>16)*512/1024));
+		pr_debug("PCI ROM size (from header) =3D %d kB\n",
+			le16_to_cpu(i>>16)*512/1024);
 		rm_offset =3D le16_to_cpu(i & 0xffff);
 		if (rm_offset) {
 			/* read 16 bytes from the pci region mapper array */
@@ -867,29 +887,24 @@ static struct sti_struct *sti_try_rom_generic(unsign=
ed long address,
 			*rm++ =3D gsc_readl(address+rm_offset+0x04);
 			*rm++ =3D gsc_readl(address+rm_offset+0x08);
 			*rm++ =3D gsc_readl(address+rm_offset+0x0c);
-			DPRINTK(("PCI region Mapper offset =3D %08x: ",
-				rm_offset));
-			for (i=3D0; i<16; i++)
-				DPRINTK(("%02x ", sti->rm_entry[i]));
-			DPRINTK(("\n"));
 		}

 		address +=3D le32_to_cpu(gsc_readl(address+8));
-		DPRINTK(("sig %04x, PCI STI ROM at %08lx\n", sig, address));
+		pr_debug("sig %04x, PCI STI ROM at %08lx\n", sig, address);
 		goto test_rom;
 	}

 	ok =3D 0;

 	if ((sig & 0xff) =3D=3D 0x01) {
-		DPRINTK(("    byte mode ROM at %08lx, hpa at %08lx\n",
-		       address, hpa));
+		pr_debug("    byte mode ROM at %08lx, hpa at %08lx\n",
+		       address, hpa);
 		ok =3D sti_read_rom(0, sti, address);
 	}

 	if ((sig & 0xffff) =3D=3D 0x0303) {
-		DPRINTK(("    word mode ROM at %08lx, hpa at %08lx\n",
-		       address, hpa));
+		pr_debug("    word mode ROM at %08lx, hpa at %08lx\n",
+		       address, hpa);
 		ok =3D sti_read_rom(1, sti, address);
 	}

@@ -906,7 +921,7 @@ static struct sti_struct *sti_try_rom_generic(unsigned=
 long address,
 		unsigned long rom_base;
 		rom_base =3D pci_resource_start(sti->pd, PCI_ROM_RESOURCE);
 		pci_write_config_dword(sti->pd, PCI_ROM_ADDRESS, rom_base & ~PCI_ROM_AD=
DRESS_ENABLE);
-		DPRINTK((KERN_DEBUG "STI PCI ROM disabled\n"));
+		pr_debug("STI PCI ROM disabled\n");
 	}

 	if (sti_init_graph(sti))
@@ -981,14 +996,14 @@ static int sticore_pci_init(struct pci_dev *pd, cons=
t struct pci_device_id *ent)
 	rom_len =3D pci_resource_len(pd, PCI_ROM_RESOURCE);
 	if (rom_base) {
 		pci_write_config_dword(pd, PCI_ROM_ADDRESS, rom_base | PCI_ROM_ADDRESS_=
ENABLE);
-		DPRINTK((KERN_DEBUG "STI PCI ROM enabled at 0x%08lx\n", rom_base));
+		pr_debug("STI PCI ROM enabled at 0x%08lx\n", rom_base);
 	}

-	printk(KERN_INFO "STI PCI graphic ROM found at %08lx (%u kB), fb at %08l=
x (%u MB)\n",
+	pr_info("STI PCI graphic ROM found at %08lx (%u kB), fb at %08lx (%u MB)=
\n",
 		rom_base, rom_len/1024, fb_base, fb_len/1024/1024);

-	DPRINTK((KERN_DEBUG "Trying PCI STI ROM at %08lx, PCI hpa at %08lx\n",
-		    rom_base, fb_base));
+	pr_debug("Trying PCI STI ROM at %08lx, PCI hpa at %08lx\n",
+		    rom_base, fb_base);

 	sti =3D sti_try_rom_generic(rom_base, fb_base, pd);
 	if (sti) {
@@ -998,8 +1013,7 @@ static int sticore_pci_init(struct pci_dev *pd, const=
 struct pci_device_id *ent)
 	}

 	if (!sti) {
-		printk(KERN_WARNING "Unable to handle STI device '%s'\n",
-			pci_name(pd));
+		pr_warn("Unable to handle STI device '%s'\n", pci_name(pd));
 		return -ENODEV;
 	}
 #endif /* CONFIG_PCI */
@@ -1058,7 +1072,7 @@ static void sti_init_roms(void)

 	sticore_initialized =3D 1;

-	printk(KERN_INFO "STI GSC/PCI core graphics driver "
+	pr_info("STI GSC/PCI core graphics driver "
 			STI_DRIVERVERSION "\n");

 	/* Register drivers for native & PCI cards */
diff --git a/drivers/video/fbdev/sticore.h b/drivers/video/fbdev/sticore.h
index fb8f58f9867a..c338f7848ae2 100644
=2D-- a/drivers/video/fbdev/sticore.h
+++ b/drivers/video/fbdev/sticore.h
@@ -4,12 +4,6 @@

 /* generic STI structures & functions */

-#if 0
-#define DPRINTK(x)	printk x
-#else
-#define DPRINTK(x)
-#endif
-
 #define MAX_STI_ROMS 4		/* max no. of ROMs which this driver handles */

 #define STI_REGION_MAX 8	/* hardcoded STI constants */
@@ -246,8 +240,12 @@ struct sti_rom_font {
 /* sticore internal font handling */

 struct sti_cooked_font {
-        struct sti_rom_font *raw;
+	struct sti_rom_font *raw;	/* native ptr for STI functions */
+	void *raw_ptr;			/* kmalloc'ed font data */
 	struct sti_cooked_font *next_font;
+	int height, width;
+	int refcount;
+	u32 crc;
 };

 struct sti_cooked_rom {
@@ -341,9 +339,6 @@ struct sti_all_data {
 struct sti_struct {
 	spinlock_t lock;

-	/* the following fields needs to be filled in by the word/byte routines =
*/
-	int font_width;
-	int font_height;
 	/* char **mon_strings; */
 	int sti_mem_request;
 	u32 graphics_id[2];
@@ -362,6 +357,7 @@ struct sti_struct {

 	struct sti_glob_cfg *glob_cfg;	/* points into sti_all_data */

+	int wordmode;
 	struct sti_cooked_font *font;	/* ptr to selected font (cooked) */

 	struct pci_dev *pd;
@@ -380,6 +376,7 @@ struct sti_struct {
 /* sticore interface functions */

 struct sti_struct *sti_get_rom(unsigned int index); /* 0: default sti */
+void sti_font_convert_bytemode(struct sti_struct *sti, struct sti_cooked_=
font *f);


 /* sticore main function to call STI firmware */
@@ -391,12 +388,14 @@ int sti_call(const struct sti_struct *sti, unsigned =
long func,

 /* functions to call the STI ROM directly */

-void sti_putc(struct sti_struct *sti, int c, int y, int x);
+void sti_putc(struct sti_struct *sti, int c, int y, int x,
+		struct sti_cooked_font *font);
 void sti_set(struct sti_struct *sti, int src_y, int src_x,
-	     int height, int width, u8 color);
+		int height, int width, u8 color);
 void sti_clear(struct sti_struct *sti, int src_y, int src_x,
-	       int height, int width, int c);
+		int height, int width, int c, struct sti_cooked_font *font);
 void sti_bmove(struct sti_struct *sti, int src_y, int src_x,
-	       int dst_y, int dst_x, int height, int width);
+		int dst_y, int dst_x, int height, int width,
+		struct sti_cooked_font *font);

 #endif	/* STICORE_H */
