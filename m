Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146EB6F5B62
	for <lists+linux-parisc@lfdr.de>; Wed,  3 May 2023 17:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjECPjb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 May 2023 11:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjECPja (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 May 2023 11:39:30 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA276E95
        for <linux-parisc@vger.kernel.org>; Wed,  3 May 2023 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1683128365; i=deller@gmx.de;
        bh=bMgXoypls00rlc7mDdobU0bNSCsLLdjANtYP7md7XBE=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=m8sOJfhoYZX3roA/Q1ceTSKkzl2Uzh/ELM273GklU6FzpUgu8CC0C8dxWFkgYQANd
         npZTrUsp7IealNU3zwuUpKOisQ7pBnoinol14PqUrliEGZyiU+eqlFtwNcvSg+eMV4
         0/iT3R6NnW7lo7/LxmV58Y6k4b/iJCiM7UcOu3mBjqyf6AMwiPvWpY3jBYtkteyVw0
         6cI9gViFUtOf/p+sL7kq39TnDLI4UW/1Ovfe0Naly756JcPW3sYmNFIAonWMhjDvXg
         UNNQKL7mchAQHJ36sH0t7j1HZrhRm7HTYwv7UgS+XWJa/fgyJJRg/QkKbm59JJxkNm
         UKHS2A5+H8A9A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.144.191]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MybKp-1qAyHI0FAr-00ywML; Wed, 03
 May 2023 17:39:25 +0200
Date:   Wed, 3 May 2023 17:39:23 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Fix STI console on 64-bit only machines
Message-ID: <ZFKAK7Z4oi8f/ro4@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:nkgMpiDo7GrkAJ/6vc/u0m864vFZN94XiqChpvRVQx19x4m+x6v
 0DWj62Kk/rDbixT0I/Dv9EJiKuT9RA6IDNKvmKkY4+webLByw3DzJp8WbmOHbqhgfCemvf9
 g/V8Q9+MxsC2ZprFIbh07z/mEcV9+mOkWugMweDXwYBMJc/gNwD1X89+r5JBsNpvwqnqbdx
 U9I6sbJZdQpg2xoa8Flcg==
UI-OutboundReport: notjunk:1;M01:P0:RHltlhD7MoI=;hR1HYSWORLvlajR5CdYnP0nOt4V
 QvBSFavNak3DnMAbTxcYnU4xwYXhw3uaaHeFP8PpDh2IzRoSMA1qemYh9ap30ef4Za9wa6haX
 QTRkZJu0yRXLsZ+40eOpRqf5R7BF98Pmo2MVxPoIhpEwvF8Cp3ViCHju3DRb8k7sV5/2bIlaz
 h/2W7yY/y7eU71p8G5iTDI/N1FIgvxo2EsDh9MKwE3rSgPkoVOEWgjdgb6PDe6nXUL5bM/6S4
 JlT1uH2OZmwZpHhV/FOYOpK3c8T0ljBMtR3mII4XhjxLeZHH4ITt5QZv0LMx5PcGeVGQlWoB2
 ghbMPRe8IGsju8LxXgaZ3jCqTBhjJS2oKsjYg3cbU3yrieHyvOByrHMUZD5qlBPVmQdrq6jM5
 T5jFBm2/rSFWN1xALBZqsaOLePvH3OqUo/JhY/lmiNVaQlPwqlXg8H6RzKCBLGlaiXzNMMeRX
 vaG7HfSmkla2o7vPi14elxlo+CJoXLG8R1mkE7Y+t+AKEaMyZJf+JVnm7QSgSvnvqnF494h+m
 JHhvWnpV0tIQEa1kefQ3UmH/jvbH5DoT+591WwJDc4XuTlRbGRvU+C7cEvnmCxJl33fEzs1GS
 1nAEMscjyNknYa7lxRgDLzOmvbwzK8EooOTEJ9riI0VvWA91uKt773aYdOdVhxFq1U9k16X2Y
 XOAIJTt31kZQML9r0dhB8ovF7WLaigmMJbb/5U1ZHkCX64AJzbmV577saQ5bkSooXjuuWV5hE
 /9mQdv8RsMRHQntYybNvcam3Tmk/ANMnbkpMyz96PC7D+cBgBliPH81EfU77G/pFGCRWrEWEN
 Idje20PCXQ7qSx/LrQUpDoewLvAA8bi99eAP9r4LdAoXkaaP48kNFARn5SkrVoNQD1YQYzfXT
 Z+8eSrPTFX9vgs1CSz5gy6CDw2dDotz2cKrDhphsoi/V4CpHZOshAdHuAE9gHuUCgM2GjZp4B
 L/LhQSwRKv0fqlMNqjZuOI3S12Q=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix the STI console to be able to execute 64-bit STI ROM code in addition
to 32-bit STI ROM code.

This is necessary on 64-bit only machines (e.g. C8000 workstation) which
will now support HP graphic cards like Visualize-FX5/10 and Visualize-FXe
in STI text mode (no graphics mode yet).

This patch is for kernel v6.3 and below.
In upstream kernels some of the touched files will be moved
by queued changes in drm-misc-next git tree.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 2b4fad8328e8..4258c8998ebe 100644
=2D-- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -89,7 +89,7 @@ int pdc_iodc_print(const unsigned char *str, unsigned co=
unt);
 void pdc_emergency_unlock(void);
 int pdc_sti_call(unsigned long func, unsigned long flags,
                  unsigned long inptr, unsigned long outputr,
-                 unsigned long glob_cfg);
+                 unsigned long glob_cfg, int sti_call_64bit);

 int __pdc_cpu_rendezvous(void);
 void pdc_cpu_rendezvous_lock(void);
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index cc124d9f1f7f..03bfdc324146 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1390,16 +1390,23 @@ int pdc_iodc_getc(void)

 int pdc_sti_call(unsigned long func, unsigned long flags,
                  unsigned long inptr, unsigned long outputr,
-                 unsigned long glob_cfg)
+                 unsigned long glob_cfg, int sti_call_64bit)
 {
-        int retval;
+	int retval;
 	unsigned long irqflags;

-        spin_lock_irqsave(&pdc_lock, irqflags);
-        retval =3D real32_call(func, flags, inptr, outputr, glob_cfg);
-        spin_unlock_irqrestore(&pdc_lock, irqflags);
+	spin_lock_irqsave(&pdc_lock, irqflags);
+	if (IS_ENABLED(CONFIG_64BIT) && sti_call_64bit) {
+#ifdef CONFIG_64BIT
+		retval =3D real64_call(func, flags, inptr, outputr, glob_cfg);
+#else
+		BUG();
+#endif
+	} else
+		retval =3D real32_call(func, flags, inptr, outputr, glob_cfg);
+	spin_unlock_irqrestore(&pdc_lock, irqflags);

-        return retval;
+	return retval;
 }
 EXPORT_SYMBOL(pdc_sti_call);

diff --git a/drivers/video/console/sticore.c b/drivers/video/console/stico=
re.c
index db568f67e4dc..7a81f0054b58 100644
=2D-- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -4,7 +4,7 @@
  *	core code for console driver using HP's STI firmware
  *
  *	Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
- *	Copyright (C) 2001-2020 Helge Deller <deller@gmx.de>
+ *	Copyright (C) 2001-2023 Helge Deller <deller@gmx.de>
  *	Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de=
>
  *
  * TODO:
@@ -42,6 +42,31 @@ static struct sti_struct *default_sti __read_mostly;
 static int num_sti_roms __read_mostly;
 static struct sti_struct *sti_roms[MAX_STI_ROMS] __read_mostly;

+static void *store_sti_val(struct sti_struct *sti, void *ptr, unsigned lo=
ng val)
+{
+	u32 *ptr32 =3D ptr;
+
+	if (!IS_ENABLED(CONFIG_64BIT) ||
+	    (IS_ENABLED(CONFIG_64BIT) && sti->sti_call_64bit)) {
+		unsigned long *ptr2 =3D ptr;
+
+		if (IS_ENABLED(CONFIG_64BIT) && sti->sti_call_64bit)
+			ptr2 =3D PTR_ALIGN(ptr2, sizeof(void *));
+
+		*ptr2++ =3D val;
+		return ptr2;
+	}
+
+	/* when on 64-bit kernel executing a 32-bit STI: */
+	*ptr32++ =3D val;
+	return ptr32;
+}
+
+static void *store_sti_ptr(struct sti_struct *sti, void *ptr, void *val)
+{
+	unsigned long val2 =3D virt_to_phys(val);
+	return store_sti_val(sti, ptr, val2);
+}

 /* The colour indices used by STI are
  *   0 - Black
@@ -88,8 +113,8 @@ static int sti_init_graph(struct sti_struct *sti)
 	memset(inptr, 0, sizeof(*inptr));
 	inptr->text_planes =3D 3; /* # of text planes (max 3 for STI) */
 	memset(inptr_ext, 0, sizeof(*inptr_ext));
-	inptr->ext_ptr =3D STI_PTR(inptr_ext);
-	outptr->errno =3D 0;
+	store_sti_ptr(sti, &inptr->ext_ptr, inptr_ext);
+	memset(outptr, 0, sizeof(*outptr));

 	ret =3D sti_call(sti, sti->init_graph, &default_init_flags, inptr,
 		outptr, sti->glob_cfg);
@@ -119,8 +144,8 @@ static void sti_inq_conf(struct sti_struct *sti)
 	unsigned long flags;
 	s32 ret;

-	outptr->ext_ptr =3D STI_PTR(&sti->sti_data->inq_outptr_ext);
-
+	store_sti_ptr(sti, &outptr->ext_ptr, &sti->sti_data->inq_outptr_ext);
+
 	do {
 		spin_lock_irqsave(&sti->lock, flags);
 		memset(inptr, 0, sizeof(*inptr));
@@ -139,9 +164,9 @@ void
 sti_putc(struct sti_struct *sti, int c, int y, int x,
 	 struct sti_cooked_font *font)
 {
-	struct sti_font_inptr *inptr =3D &sti->sti_data->font_inptr;
+	struct sti_font_inptr *inptr;
 	struct sti_font_inptr inptr_default =3D {
-		.font_start_addr =3D STI_PTR(font->raw),
+		.font_start_addr =3D (void *)STI_PHYS(font->raw),
 		.index		=3D c_index(sti, c),
 		.fg_color	=3D c_fg(sti, c),
 		.bg_color	=3D c_bg(sti, c),
@@ -154,7 +179,13 @@ sti_putc(struct sti_struct *sti, int c, int y, int x,

 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		*inptr =3D inptr_default;
+		inptr =3D &inptr_default;
+		if (IS_ENABLED(CONFIG_64BIT) && !sti->sti_call_64bit) {
+			/* use copy if calling 32-bit on LP64 kernel */
+			inptr =3D &sti->sti_data->font_inptr;
+			*inptr =3D inptr_default;
+			inptr =3D (void *)(((unsigned long)inptr) + sizeof(u32));
+		}
 		ret =3D sti_call(sti, sti->font_unpmv, &default_font_flags,
 			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
@@ -171,7 +202,7 @@ void
 sti_set(struct sti_struct *sti, int src_y, int src_x,
 	int height, int width, u8 color)
 {
-	struct sti_blkmv_inptr *inptr =3D &sti->sti_data->blkmv_inptr;
+	struct sti_blkmv_inptr *inptr;
 	struct sti_blkmv_inptr inptr_default =3D {
 		.fg_color	=3D color,
 		.bg_color	=3D color,
@@ -188,7 +219,12 @@ sti_set(struct sti_struct *sti, int src_y, int src_x,

 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		*inptr =3D inptr_default;
+		inptr =3D &inptr_default;
+		if (IS_ENABLED(CONFIG_64BIT) && !sti->sti_call_64bit) {
+			/* use copy if calling 32-bit on LP64 kernel */
+			inptr =3D &sti->sti_data->blkmv_inptr;
+			*inptr =3D inptr_default;
+		}
 		ret =3D sti_call(sti, sti->block_move, &clear_blkmv_flags,
 			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
@@ -199,7 +235,7 @@ void
 sti_clear(struct sti_struct *sti, int src_y, int src_x,
 	  int height, int width, int c, struct sti_cooked_font *font)
 {
-	struct sti_blkmv_inptr *inptr =3D &sti->sti_data->blkmv_inptr;
+	struct sti_blkmv_inptr *inptr;
 	struct sti_blkmv_inptr inptr_default =3D {
 		.fg_color	=3D c_fg(sti, c),
 		.bg_color	=3D c_bg(sti, c),
@@ -216,7 +252,12 @@ sti_clear(struct sti_struct *sti, int src_y, int src_=
x,

 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		*inptr =3D inptr_default;
+		inptr =3D &inptr_default;
+		if (IS_ENABLED(CONFIG_64BIT) && !sti->sti_call_64bit) {
+			/* use copy if calling 32-bit on LP64 kernel */
+			inptr =3D &sti->sti_data->blkmv_inptr;
+			*inptr =3D inptr_default;
+		}
 		ret =3D sti_call(sti, sti->block_move, &clear_blkmv_flags,
 			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
@@ -232,7 +273,7 @@ sti_bmove(struct sti_struct *sti, int src_y, int src_x=
,
 	  int dst_y, int dst_x, int height, int width,
 	  struct sti_cooked_font *font)
 {
-	struct sti_blkmv_inptr *inptr =3D &sti->sti_data->blkmv_inptr;
+	struct sti_blkmv_inptr *inptr;
 	struct sti_blkmv_inptr inptr_default =3D {
 		.src_x		=3D src_x * font->width,
 		.src_y		=3D src_y * font->height,
@@ -247,7 +288,12 @@ sti_bmove(struct sti_struct *sti, int src_y, int src_=
x,

 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		*inptr =3D inptr_default;
+		inptr =3D &inptr_default;
+		if (IS_ENABLED(CONFIG_64BIT) && !sti->sti_call_64bit) {
+			/* use copy if calling 32-bit on LP64 kernel */
+			inptr =3D &sti->sti_data->blkmv_inptr;
+			*inptr =3D inptr_default;
+		}
 		ret =3D sti_call(sti, sti->block_move, &default_blkmv_flags,
 			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
@@ -360,42 +406,31 @@ __setup("sti_font=3D", sti_font_setup);



-static void sti_dump_globcfg(struct sti_glob_cfg *glob_cfg,
-			     unsigned int sti_mem_request)
+static void sti_dump_globcfg(struct sti_struct *sti)
 {
-	struct sti_glob_cfg_ext *cfg;
-
+	struct sti_glob_cfg *glob_cfg =3D sti->glob_cfg;
+	struct sti_glob_cfg_ext *cfg =3D &sti->sti_data->glob_cfg_ext;
+
 	pr_debug("%d text planes\n"
 		"%4d x %4d screen resolution\n"
 		"%4d x %4d offscreen\n"
-		"%4d x %4d layout\n"
-		"regions at %08x %08x %08x %08x\n"
-		"regions at %08x %08x %08x %08x\n"
-		"reent_lvl %d\n"
-		"save_addr %08x\n",
+		"%4d x %4d layout\n",
 		glob_cfg->text_planes,
 		glob_cfg->onscreen_x, glob_cfg->onscreen_y,
 		glob_cfg->offscreen_x, glob_cfg->offscreen_y,
-		glob_cfg->total_x, glob_cfg->total_y,
-		glob_cfg->region_ptrs[0], glob_cfg->region_ptrs[1],
-		glob_cfg->region_ptrs[2], glob_cfg->region_ptrs[3],
-		glob_cfg->region_ptrs[4], glob_cfg->region_ptrs[5],
-		glob_cfg->region_ptrs[6], glob_cfg->region_ptrs[7],
-		glob_cfg->reent_lvl,
-		glob_cfg->save_addr);
+		glob_cfg->total_x, glob_cfg->total_y);

 	/* dump extended cfg */
-	cfg =3D PTR_STI((unsigned long)glob_cfg->ext_ptr);
 	pr_debug("monitor %d\n"
 		"in friendly mode: %d\n"
 		"power consumption %d watts\n"
 		"freq ref %d\n"
-		"sti_mem_addr %08x (size=3D%d bytes)\n",
+		"sti_mem_addr %px (size=3D%d bytes)\n",
 		cfg->curr_mon,
 		cfg->friendly_boot,
 		cfg->power,
 		cfg->freq_ref,
-		cfg->sti_mem_addr, sti_mem_request);
+		cfg->sti_mem_addr, sti->sti_mem_request);
 }

 static void sti_dump_outptr(struct sti_struct *sti)
@@ -415,7 +450,7 @@ static int sti_init_glob_cfg(struct sti_struct *sti, u=
nsigned long rom_address,
 {
 	struct sti_glob_cfg *glob_cfg;
 	struct sti_glob_cfg_ext *glob_cfg_ext;
-	void *save_addr;
+	void *save_addr, *ptr;
 	void *sti_mem_addr;
 	int i, size;

@@ -433,9 +468,7 @@ static int sti_init_glob_cfg(struct sti_struct *sti, u=
nsigned long rom_address,
 	save_addr	=3D &sti->sti_data->save_addr;
 	sti_mem_addr	=3D &sti->sti_data->sti_mem_addr;

-	glob_cfg->ext_ptr =3D STI_PTR(glob_cfg_ext);
-	glob_cfg->save_addr =3D STI_PTR(save_addr);
-	for (i=3D0; i<8; i++) {
+	for (i =3D 0; i < STI_REGION_MAX; i++) {
 		unsigned long newhpa, len;

 		if (sti->pd) {
@@ -458,13 +491,10 @@ static int sti_init_glob_cfg(struct sti_struct *sti,=
 unsigned long rom_address,
 			REGION_OFFSET_TO_PHYS(sti->regions[i], newhpa);

 		len =3D sti->regions[i].region_desc.length * 4096;
-		if (len)
-			glob_cfg->region_ptrs[i] =3D sti->regions_phys[i];

-		pr_debug("region #%d: phys %08lx, region_ptr %08x, len=3D%lukB, "
+		pr_debug("region #%d: phys %08lx, len=3D%lukB, "
 			 "btlb=3D%d, sysonly=3D%d, cache=3D%d, last=3D%d\n",
-			i, sti->regions_phys[i], glob_cfg->region_ptrs[i],
-			len/1024,
+			i, sti->regions_phys[i], len/1024,
 			sti->regions[i].region_desc.btlb,
 			sti->regions[i].region_desc.sys_only,
 			sti->regions[i].region_desc.cache,
@@ -475,11 +505,17 @@ static int sti_init_glob_cfg(struct sti_struct *sti,=
 unsigned long rom_address,
 			break;
 	}

-	if (++i<8 && sti->regions[i].region)
-		pr_warn("future ptr (0x%8x) not yet supported !\n",
-			sti->regions[i].region);
+	ptr =3D &glob_cfg->region_ptrs;
+	for (i =3D 0; i < STI_REGION_MAX; i++) {
+		ptr =3D store_sti_val(sti, ptr, sti->regions_phys[i]);
+	}
+
+	*(s32 *)ptr =3D 0;	/* set reent_lvl */
+	ptr +=3D sizeof(s32);
+	ptr =3D store_sti_ptr(sti, ptr, save_addr);
+	ptr =3D store_sti_ptr(sti, ptr, glob_cfg_ext);

-	glob_cfg_ext->sti_mem_addr =3D STI_PTR(sti_mem_addr);
+	store_sti_ptr(sti, &glob_cfg_ext->sti_mem_addr, sti_mem_addr);

 	sti->glob_cfg =3D glob_cfg;

@@ -796,17 +832,26 @@ static int sti_read_rom(int wordmode, struct sti_str=
uct *sti,
 	if (raw->region_list)
 		memcpy(sti->regions, ((void *)raw)+raw->region_list, sizeof(sti->region=
s));

-	address =3D (unsigned long) STI_PTR(raw);
+	address =3D (unsigned long) STI_PHYS(raw);

 	pr_info("STI %s ROM supports 32 %sbit firmware functions.\n",
 		wordmode ? "word mode" : "byte mode",
 		raw->alt_code_type =3D=3D ALT_CODE_TYPE_PA_RISC_64
 		? "and 64 " : "");

-	sti->font_unpmv =3D address + (raw->font_unpmv & 0x03ffffff);
-	sti->block_move =3D address + (raw->block_move & 0x03ffffff);
-	sti->init_graph =3D address + (raw->init_graph & 0x03ffffff);
-	sti->inq_conf   =3D address + (raw->inq_conf   & 0x03ffffff);
+	if (IS_ENABLED(CONFIG_64BIT) &&
+	    raw->alt_code_type =3D=3D ALT_CODE_TYPE_PA_RISC_64) {
+		sti->sti_call_64bit =3D 1;
+		sti->font_unpmv =3D address + (raw->font_unp_addr   & 0x03ffffff);
+		sti->block_move =3D address + (raw->block_move_addr & 0x03ffffff);
+		sti->init_graph =3D address + (raw->init_graph_addr & 0x03ffffff);
+		sti->inq_conf   =3D address + (raw->inq_conf_addr   & 0x03ffffff);
+	} else {
+		sti->font_unpmv =3D address + (raw->font_unpmv & 0x03ffffff);
+		sti->block_move =3D address + (raw->block_move & 0x03ffffff);
+		sti->init_graph =3D address + (raw->init_graph & 0x03ffffff);
+		sti->inq_conf   =3D address + (raw->inq_conf   & 0x03ffffff);
+	}

 	sti->rom =3D cooked;
 	sti->rom->raw =3D raw;
@@ -819,7 +864,13 @@ static int sti_read_rom(int wordmode, struct sti_stru=
ct *sti,
 	sti_font_convert_bytemode(sti, sti->font);
 	sti_dump_font(sti->font);

+	pr_info("    using %d-bit STI ROM functions\n",
+		(IS_ENABLED(CONFIG_64BIT) && sti->sti_call_64bit) ? 64:32);
+
 	sti->sti_mem_request =3D raw->sti_mem_req;
+	pr_debug("    mem_request =3D %d,  reentsize %d\n",
+		sti->sti_mem_request, raw->reentsize);
+
 	sti->graphics_id[0] =3D raw->graphics_id[0];
 	sti->graphics_id[1] =3D raw->graphics_id[1];

@@ -878,9 +929,14 @@ static struct sti_struct *sti_try_rom_generic(unsigne=
d long address,

 test_rom:
 	/* if we can't read the ROM, bail out early.  Not being able
-	 * to read the hpa is okay, for romless sti */
-	if (pdc_add_valid(address))
+	 * to read the hpa is okay, for romless sti. The pdc_add_valid check
+	 * fails on machines which support 64-bit only. */
+
+	if ((!IS_ENABLED(CONFIG_64BIT) ||
+	     (boot_cpu_data.pdc.capabilities & PDC_MODEL_OS32)) &&
+	    pdc_add_valid(address)) {
 		goto out_err;
+	}

 	sig =3D gsc_readl(address);

@@ -950,7 +1006,7 @@ static struct sti_struct *sti_try_rom_generic(unsigne=
d long address,
 		goto out_err;

 	sti_inq_conf(sti);
-	sti_dump_globcfg(sti->glob_cfg, sti->sti_mem_request);
+	sti_dump_globcfg(sti);
 	sti_dump_outptr(sti);

 	pr_info("    graphics card name: %s\n",
@@ -1130,10 +1186,10 @@ int sti_call(const struct sti_struct *sti, unsigne=
d long func,
 		const void *flags, void *inptr, void *outptr,
 		struct sti_glob_cfg *glob_cfg)
 {
-	unsigned long _flags =3D STI_PTR(flags);
-	unsigned long _inptr =3D STI_PTR(inptr);
-	unsigned long _outptr =3D STI_PTR(outptr);
-	unsigned long _glob_cfg =3D STI_PTR(glob_cfg);
+	unsigned long _flags =3D STI_PHYS(flags);
+	unsigned long _inptr =3D STI_PHYS(inptr);
+	unsigned long _outptr =3D STI_PHYS(outptr);
+	unsigned long _glob_cfg =3D STI_PHYS(glob_cfg);
 	int ret;

 #ifdef CONFIG_64BIT
@@ -1142,8 +1198,8 @@ int sti_call(const struct sti_struct *sti, unsigned =
long func,
 			"Out of 32bit-range pointers!"))
 		return -1;
 #endif
-
-	ret =3D pdc_sti_call(func, _flags, _inptr, _outptr, _glob_cfg);
+	ret =3D pdc_sti_call(func, _flags, _inptr, _outptr, _glob_cfg,
+		sti->sti_call_64bit);

 	return ret;
 }
diff --git a/drivers/video/fbdev/sticore.h b/drivers/video/fbdev/sticore.h
index 0ebdd28a0b81..4b2c84d28a96 100644
=2D-- a/drivers/video/fbdev/sticore.h
+++ b/drivers/video/fbdev/sticore.h
@@ -36,8 +36,7 @@

 #define STI_WAIT 1

-#define STI_PTR(p)	( virt_to_phys(p) )
-#define PTR_STI(p)	( phys_to_virt((unsigned long)p) )
+#define STI_PHYS(p)	virt_to_phys(p)

 #define sti_onscreen_x(sti) (sti->glob_cfg->onscreen_x)
 #define sti_onscreen_y(sti) (sti->glob_cfg->onscreen_y)
@@ -76,8 +75,8 @@ struct sti_glob_cfg_ext {
 	 u8 friendly_boot;		/* in friendly boot mode */
 	s16 power;			/* power calculation (in Watts) */
 	s32 freq_ref;			/* frequency reference */
-	u32 sti_mem_addr;		/* pointer to global sti memory (size=3Dsti_mem_reque=
st) */
-	u32 future_ptr; 		/* pointer to future data */
+	u32 *sti_mem_addr;		/* pointer to global sti memory (size=3Dsti_mem_requ=
est) */
+	u32 *future_ptr; 		/* pointer to future data */
 };

 struct sti_glob_cfg {
@@ -88,10 +87,10 @@ struct sti_glob_cfg {
 	s16 offscreen_y;		/* offset height in pixels */
 	s16 total_x;			/* frame buffer width in pixels */
 	s16 total_y;			/* frame buffer height in pixels */
-	u32 region_ptrs[STI_REGION_MAX]; /* region pointers */
+	u32 *region_ptrs[STI_REGION_MAX]; /* region pointers */
 	s32 reent_lvl;			/* storage for reentry level value */
-	u32 save_addr;			/* where to save or restore reentrant state */
-	u32 ext_ptr;			/* pointer to extended glob_cfg data structure */
+	u32 *save_addr;			/* where to save or restore reentrant state */
+	u32 *ext_ptr;			/* pointer to extended glob_cfg data structure */
 };


@@ -117,26 +116,26 @@ struct sti_init_flags {
 	u32 caller_kernel : 1;	/* set only by kernel for each call */
 	u32 caller_other : 1;	/* set only by non-[BR/K] caller */
 	u32 pad	: 14;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };

 struct sti_init_inptr_ext {
 	u8  config_mon_type;	/* configure to monitor type */
 	u8  pad[1];		/* pad to word boundary */
 	u16 inflight_data;	/* inflight data possible on PCI */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };

 struct sti_init_inptr {
 	s32 text_planes;	/* number of planes to use for text */
-	u32 ext_ptr;		/* pointer to extended init_graph inptr data structure*/
+	u32 *ext_ptr;		/* pointer to extended init_graph inptr data structure*/
 };


 struct sti_init_outptr {
 	s32 errno;		/* error number on failure */
 	s32 text_planes;	/* number of planes used for text */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };


@@ -146,17 +145,17 @@ struct sti_init_outptr {
 struct sti_conf_flags {
 	u32 wait : 1;		/* should routine idle wait or not */
 	u32 pad : 31;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };

 struct sti_conf_inptr {
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };

 struct sti_conf_outptr_ext {
 	u32 crt_config[3];	/* hardware specific X11/OGL information */
 	u32 crt_hdw[3];
-	u32 future_ptr;
+	u32 *future_ptr;
 };

 struct sti_conf_outptr {
@@ -172,7 +171,7 @@ struct sti_conf_outptr {
 	s32 planes;		/* number of fb planes in system */
 	 u8 dev_name[STI_DEV_NAME_LENGTH]; /* null terminated product name */
 	u32 attributes;		/* flags denoting attributes */
-	u32 ext_ptr;		/* pointer to future data */
+	u32 *ext_ptr;		/* pointer to future data */
 };

 struct sti_rom {
@@ -256,25 +255,25 @@ struct sti_cooked_rom {
 /* STI font printing function structs */

 struct sti_font_inptr {
-	u32 font_start_addr;	/* address of font start */
+	u32 *font_start_addr;	/* address of font start */
 	s16 index;		/* index into font table of character */
 	u8 fg_color;		/* foreground color of character */
 	u8 bg_color;		/* background color of character */
 	s16 dest_x;		/* X location of character upper left */
 	s16 dest_y;		/* Y location of character upper left */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };

 struct sti_font_flags {
 	u32 wait : 1;		/* should routine idle wait or not */
 	u32 non_text : 1;	/* font unpack/move in non_text planes =3D1, text =3D0=
 */
 	u32 pad : 30;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };

 struct sti_font_outptr {
 	s32 errno;		/* error number on failure */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };

 /* STI blockmove structs */
@@ -285,7 +284,7 @@ struct sti_blkmv_flags {
 	u32 clear : 1;		/* clear during move? */
 	u32 non_text : 1;	/* block move in non_text planes =3D1, text =3D0 */
 	u32 pad : 28;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };

 struct sti_blkmv_inptr {
@@ -297,12 +296,12 @@ struct sti_blkmv_inptr {
 	s16 dest_y;		/* dest upper left pixel y location */
 	s16 width;		/* block width in pixels */
 	s16 height;		/* block height in pixels */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };

 struct sti_blkmv_outptr {
 	s32 errno;		/* error number on failure */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };


@@ -328,7 +327,7 @@ struct sti_all_data {
 	struct sti_font_outptr		font_outptr;

 	/* leave as last entries */
-	unsigned long save_addr[1024 / sizeof(unsigned long)];
+	u32 save_addr[256];
 	   /* min 256 bytes which is STI default, max sti->sti_mem_request */
 	unsigned long sti_mem_addr[256 / sizeof(unsigned long)];
 	/* do not add something below here ! */
@@ -345,10 +344,12 @@ struct sti_struct {

 	struct sti_cooked_rom *rom;

+	/* STI function entry points */
 	unsigned long font_unpmv;
 	unsigned long block_move;
 	unsigned long init_graph;
 	unsigned long inq_conf;
+	int sti_call_64bit; /* functions execute 64bit code */

 	/* all following fields are initialized by the generic routines */
 	int text_planes;
diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 3feb6e40d56d..ec786791d2f3 100644
=2D-- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -71,9 +71,9 @@

 #include "sticore.h"

-/* REGION_BASE(fb_info, index) returns the virtual address for region <in=
dex> */
+/* REGION_BASE(fb_info, index) returns the physical address for region <i=
ndex> */
 #define REGION_BASE(fb_info, index) \
-	F_EXTEND(fb_info->sti->glob_cfg->region_ptrs[index])
+	F_EXTEND(fb_info->sti->regions_phys[index])

 #define NGLEDEVDEPROM_CRT_REGION 1

