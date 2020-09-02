Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC16625AF7E
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Sep 2020 17:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgIBPkU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 2 Sep 2020 11:40:20 -0400
Received: from mout.gmx.net ([212.227.15.19]:39511 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726794AbgIBPj5 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1599061186;
        bh=+vDFz1s2/Tsi0y7/tMsq/ZOI6SDFFdLXoWtqoTtS2c0=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=VpyMe0u0s0TN6+UO1d0p76FjxpeBne6rcJYIUs8ownFjQ0XoG/74idZY63lQ6SMUa
         YHzAS9beK8TF92DT/Po7CC78BrgU2V+AY/l7RmEx1BwoyQK5ifqsfC5QhS5WY4bMW2
         B2xnweaIPf5GF1Ex2Fbfc/NVvZScOOcpJN28jQYw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.155.63]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQvCv-1jyQI11Ek3-00O1q1; Wed, 02
 Sep 2020 17:39:46 +0200
Date:   Wed, 2 Sep 2020 17:39:43 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org, linux-fbdev@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc/stifb: Convert STI core driver to dynamic printk
Message-ID: <20200902153943.GA16250@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Umg/OjOpgUCSvZW3nYgmb9eivldKOGCVC0ur83jz7r7/xokALuO
 xphtSQg9Pni8Kd/jEAEn8DdAS+KkNIDmPdfTcr3HNZriyiuJrihw+nBceg/yk0DpwUSkiaM
 fNd2LZQiDiDsEDMORCnqSY8D6jbCfIWWx7PoS+PXUyagFj03pMc+N6tMxAP+gTkdf+1Bgs/
 i/QE4w+PvrcMO0oWuZs1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ORPYNsMP6W4=:r8VXu8FGX4KFyNPh4CzsBx
 37xCTd4cDwR5dtORU0n7d6zoNl40RxK1FTCTzx9rAZ3dfpwQo8x6t2tYasHJyjyzKzC1JqLNo
 WKVy+lZPrCPJwN1CnET9xYiUqGHnP9VaD7vokG33qxMpy7SFci3OHp+/8MvTY5sfOhThGP9ml
 1l9JrfI1KkaQN7WnkW0aFG6Zneuz6mOfjbEPUnieWpgZBXoP53ksFV/BV+6IMgLkV5TGjQVbL
 KaJ/atpJTjx6fIcXIttDHCEKV76AcEDqlZudWHtU7Bd5NrVmALcjGsHX3HzLYcpLclJD2jLPr
 yxXPsfJFbH6frh50oFa8iEKznzi/TysG7PRny2hADF46SXUapg32y/GfZS48cJloH60soIUGz
 tAsKOoywMTrm4eFAo891LG+m5psSIMgQNnYOzz6FEk3hzpJ8pMAoAQkat10OBAfkZ3nqxNmqt
 YtkjU+OVGpEzTTeiCBWS6wUyM2v8h0EnXD6s3kdNfUaUhnghBPtwlQeC+RW4qZekeII/MVFaQ
 PaTyTT8A3tOn5UINGOMMGbxrp4uXz6CKtq43dx/s3F7c9NShrS9qokqScHSrrnns0BqufAM1f
 cefKn3U3DdTOeNSckOBRHV7CMvy/WTthT/NweMP3+IHcktW0iVWAh0ShHDAdBtPyEj85gV8Wc
 ACj78k4eeZxuJraOrNSExJLyI45wsQnXIBByiB+WQ9DTKq1J+GaOzHwBgROOU4tNTiPzIK89T
 46x4pZ1+KSkINMfkchT/0mA6u7bFi0RUqyzuhSyEAJ/CoDOohM0at+USqcgSCVvSZXh4RDwRb
 jrqHc/PsnGjnNfRrZBtWjoIdhd4sWWDoO2LJ01gap8p53w2ksPpxMzHMAPjDovxoGLwnS1wSL
 PIYLL1gFZg0Z5J0ulzt/2A8yea937FaPUmeP5uKWt2L/c5pWoBP13/h99UESauGrCb6c2MVfq
 JjI5EAbzF4Q5wu4Dd36ds5uhBAiw6jwWtA7yDOcs9gwLJeIeP8ocAfoWM2yQlG3txoMDbgnW0
 4lLJDR6BB4Wmz+B4C9as/JFSN8cZdRBNQuvjj9DD4SIe7YRs4+T200nUOrRyhBNXUV3ynhku1
 +X+Cyruabsn8M9vz53/QDdZs062ImySMwq4IRRoJvg4Cs7psJXjmCI8+341SLD96kUfgz/zUt
 FUfH8xNsd8DngLcVORw9m2ld8RaFsGAQezmOslGtvLbyFojrlQBwmjVEyRSAquNqxQ0iu1MDT
 ZjRNkbZi0e/MCLtCB
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Convert to dynamic printk - this helps me during development of the STI
emulation for qemu.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/console/sticore.c b/drivers/video/console/stico=
re.c
index 84c3ca37040a..41b6f2505e16 100644
=2D-- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -14,6 +14,8 @@
  *
  */

+#define pr_fmt(fmt) "%s: " fmt, KBUILD_MODNAME
+
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -364,8 +366,7 @@ static void sti_dump_globcfg(struct sti_glob_cfg *glob=
_cfg,
 {
 	struct sti_glob_cfg_ext *cfg;

-	DPRINTK((KERN_INFO
-		"%d text planes\n"
+	pr_debug("%d text planes\n"
 		"%4d x %4d screen resolution\n"
 		"%4d x %4d offscreen\n"
 		"%4d x %4d layout\n"
@@ -382,13 +383,12 @@ static void sti_dump_globcfg(struct sti_glob_cfg *gl=
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
-		"in friendly mode: %d\n"
+	pr_debug("monitor %d\n"
+		"   in friendly mode: %d\n"
 		"power consumption %d watts\n"
 		"freq ref %d\n"
 		"sti_mem_addr %08x (size=3D%d bytes)\n",
@@ -396,20 +396,19 @@ static void sti_dump_globcfg(struct sti_glob_cfg *gl=
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
@@ -448,8 +447,7 @@ static int sti_init_glob_cfg(struct sti_struct *sti, u=
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
@@ -464,14 +462,14 @@ static int sti_init_glob_cfg(struct sti_struct *sti,=
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
@@ -479,8 +477,8 @@ static int sti_init_glob_cfg(struct sti_struct *sti, u=
nsigned long rom_address,
 	}

 	if (++i<8 && sti->regions[i].region)
-		printk(KERN_WARNING "%s: *future ptr (0x%8x) not yet supported !\n",
-				__FILE__, sti->regions[i].region);
+		pr_warn("future ptr (0x%8x) not yet supported !\n",
+			sti->regions[i].region);

 	glob_cfg_ext->sti_mem_addr =3D STI_PTR(sti_mem_addr);

@@ -580,18 +578,18 @@ static struct sti_cooked_font *sti_select_font(struc=
t sti_cooked_rom *rom,

 static void sti_dump_rom(struct sti_rom *rom)
 {
-	printk(KERN_INFO "    id %04x-%04x, conforms to spec rev. %d.%02x\n",
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
 }


@@ -747,7 +745,7 @@ static int sti_read_rom(int wordmode, struct sti_struc=
t *sti,
 		goto out_err;

 	if (!sti_cook_fonts(cooked, raw)) {
-		printk(KERN_ERR "No font found for STI at %08lx\n", address);
+		pr_warn("No font found for STI at %08lx\n", address);
 		goto out_err;
 	}

@@ -804,9 +802,9 @@ static int sti_read_rom(int wordmode, struct sti_struc=
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
@@ -823,7 +821,7 @@ static struct sti_struct *sti_try_rom_generic(unsigned=
 long address,
 	u32 sig;

 	if (num_sti_roms >=3D MAX_STI_ROMS) {
-		printk(KERN_WARNING "maximum number of STI ROMS reached !\n");
+		pr_warn("maximum number of STI ROMS reached !\n");
 		return NULL;
 	}

@@ -849,16 +847,15 @@ static struct sti_struct *sti_try_rom_generic(unsign=
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
@@ -867,29 +864,28 @@ static struct sti_struct *sti_try_rom_generic(unsign=
ed long address,
 			*rm++ =3D gsc_readl(address+rm_offset+0x04);
 			*rm++ =3D gsc_readl(address+rm_offset+0x08);
 			*rm++ =3D gsc_readl(address+rm_offset+0x0c);
-			DPRINTK(("PCI region Mapper offset =3D %08x: ",
-				rm_offset));
+			pr_debug("PCI region map offset =3D %08x: ", rm_offset);
 			for (i=3D0; i<16; i++)
-				DPRINTK(("%02x ", sti->rm_entry[i]));
-			DPRINTK(("\n"));
+				pr_debug("%02x ", sti->rm_entry[i]);
+			pr_debug("\n");
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

@@ -906,7 +902,7 @@ static struct sti_struct *sti_try_rom_generic(unsigned=
 long address,
 		unsigned long rom_base;
 		rom_base =3D pci_resource_start(sti->pd, PCI_ROM_RESOURCE);
 		pci_write_config_dword(sti->pd, PCI_ROM_ADDRESS, rom_base & ~PCI_ROM_AD=
DRESS_ENABLE);
-		DPRINTK((KERN_DEBUG "STI PCI ROM disabled\n"));
+		pr_debug("STI PCI ROM disabled\n");
 	}

 	if (sti_init_graph(sti))
@@ -981,14 +977,14 @@ static int sticore_pci_init(struct pci_dev *pd, cons=
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
@@ -998,8 +994,7 @@ static int sticore_pci_init(struct pci_dev *pd, const =
struct pci_device_id *ent)
 	}

 	if (!sti) {
-		printk(KERN_WARNING "Unable to handle STI device '%s'\n",
-			pci_name(pd));
+		pr_warn("Unable to handle STI device '%s'\n", pci_name(pd));
 		return -ENODEV;
 	}
 #endif /* CONFIG_PCI */
@@ -1058,7 +1053,7 @@ static void sti_init_roms(void)

 	sticore_initialized =3D 1;

-	printk(KERN_INFO "STI GSC/PCI core graphics driver "
+	pr_info("STI GSC/PCI core graphics driver "
 			STI_DRIVERVERSION "\n");

 	/* Register drivers for native & PCI cards */
diff --git a/drivers/video/fbdev/sticore.h b/drivers/video/fbdev/sticore.h
index fb8f58f9867a..9c7f4aa92a16 100644
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
