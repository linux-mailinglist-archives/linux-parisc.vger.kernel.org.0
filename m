Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1CD441117
	for <lists+linux-parisc@lfdr.de>; Sun, 31 Oct 2021 22:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhJaV6t (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 31 Oct 2021 17:58:49 -0400
Received: from mout.gmx.net ([212.227.17.20]:58809 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230025AbhJaV6t (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 31 Oct 2021 17:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635717374;
        bh=TatL8GP+853d/0gmkS3tuoSjk5TNd8lh91Oj+pOYu+4=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=PjsxtdTDVAu4rn+5YzbyL1jtDMEPTrhW0scWJJqovVIe39OZ5PHouq3IFzhKe5pFs
         Kf4RBYSEUID3/7kAfvO8drHedt7Vqrn3vJmVTlndLeRUxEf7pMj7oZ7qIlEjv0qIBj
         wPx2xt3U9r/1r2Z+CKfOivFR5QTaydkCmKqoZi1c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.201]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1mQpj02f6q-00Gczk; Sun, 31
 Oct 2021 22:56:14 +0100
Message-ID: <e7b3c6fb-5a3a-d097-3a27-66b55cba3f27@gmx.de>
Date:   Sun, 31 Oct 2021 22:55:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] video: fbdev: add HP Visualize FX driver
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>, linux-parisc@vger.kernel.org
References: <20211031204952.25678-1-svens@stackframe.org>
 <20211031204952.25678-2-svens@stackframe.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20211031204952.25678-2-svens@stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RClBeu2n0WmdMQEC8Y2mE8K9VL2e9p7Hr6w8H4u58D7zYFU6DHi
 y1G9bEmM2akcTy+Ga53Sxo0udfUiGpRmRSsEHXEQ66YoZHxL0rhkCTcoS44ezZXpay2asxY
 rrwbkxXJ/7CMvydBsAQt+uVpl17C8o9Nr/9Fnqgi/NUd+Imqrj3QqNynmp5+scQEZ0ShOkm
 lNFYAZOqv4n6baadv3cNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H1UmcDzc3dk=:lMJi9AHpVeUZuEhATWfCQu
 m0oWIg8kNwkD7LCDpyERj/205lfTdmCBpq/mpclW4oRYwJh4HuSZEY7LbtLR1haupx3v6t4sN
 pKlyO4TYjavgOc4VM5BzQWyLqdRRVSAvLsBUDArMvrfdkfrpEMkBM4xdp6F9aGi0aZX0FS8kb
 C4BeJoHmB8VPl+PL3VfB4ablyDMmrR3CiVLBPmoRqT58no0ORoRtHAEvlbPPrWCjzoLkbPvuZ
 d9mwggCoLetEjaocUwgWISv1TQId2QiHVg3rKGh4jfpdoF2M6/PyKSDhKjRlodor7HayYq7Hx
 cf9hlEnp6QH83EI0W//ePpZNMyGl/g1kAMVt2wAPD/bXmHb6ZnGzhLGWpSg84U4+ljEluW1mV
 cJ38BRaEY65WS9Ms+k6TKUSkb054bzBVuThUlkavw4VrMOuoMUpFNoiOky+iOVK66mfSZhyWT
 yWmJlouIcPY/C4s7jmG96q0AHjijAp46ysjHSKejVlLiBUGrRDZ77nwbJleoFk9WRytiZlLeP
 vES3l8/+PBve2y06UENZBq6K5Wq5sZk6A1JDPd4AhwGlltekRPAQTdTgIO+8jFBSodIBkhnra
 eZFnbpSEFkqv5ohXfGSvgXjDnwjMRtIo11lojhqyi3yYoY8Ju8Kfs4+SqgXv5fSZsCsiE3Yi0
 4sIOemPzz7k3FhleeIikwuH9wUBN4tg+z6FVzaWJkipm/IuTh6TS+vA26si6dVOXaX4e0BC07
 MQBzxF+c8ryKs2O9M1vS3pAqk8q5jD9ePhu7KYfR4bgk7YzxilwLRfBkWCs6L20eEUiWVIwVc
 iSSCGZjM5kbMh6oRfSqh2IgqfP6mzCoRHNkpRpgu/zMWnSuqFSj/kb135qYhyoVW9qX4aji7A
 90Kue4iDh4C26896SZfAiLWMO84Z+ia+HhExCm7S4BZmDrzZ9ZIE9EXdYJA1LRwGW77tSXfOw
 VSesuC3F9S8y6j8p+B4HpQKsi4J8vL6eGrRqEnxUDrAD1x/t8xCtbbSuiQ+vUGSWlW1K0jYnQ
 mC1GfmcWHzT74mBPdHUMEU9z9t1HiUe7Sr9HRa4K+37PUoDeixeADIVUdTK/wLHqcskzfA0vu
 2PCGcEmbnR6tNQ=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/31/21 21:49, Sven Schnelle wrote:
> This adds a framebuffer driver for HP's visualize series of
> cards. The aim is to support all FX2 - FX10 types but currently only
> FX5 is tested as i don't have any other card.
>
> Currently no mmap of video memory is supported as i haven't figured
> out how to access VRAM directly.
>
> Signed-off-by: Sven Schnelle <svens@stackframe.org>

That's really cool!



> ---
>  drivers/video/fbdev/Kconfig       |  14 +
>  drivers/video/fbdev/Makefile      |   2 +-
>  drivers/video/fbdev/visualizefx.c | 602 ++++++++++++++++++++++++++++++
>  3 files changed, 617 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/video/fbdev/visualizefx.c
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 6ed5e608dd04..ee963f755047 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -566,6 +566,20 @@ config FB_STI
>
>  	  It is safe to enable this option, so you should probably say "Y".
>
> +config FB_VISUALIZEFX
> +	tristate "HP Visualize FX support"
> +	depends on FB && PCI && PARISC
> +	select FB_CFB_FILLRECT
> +	select FB_CFB_COPYAREA
> +	select FB_CFB_IMAGEBLIT
> +	select RATIONAL

You should add "default y", so that it automatically gets enabled on paris=
c machines:

        default y

Other than that you may add an:

Acked-by: Helge Deller <deller@gmx.de>

Thanks!
Helge


> +	  help
> +	    Frame buffer driver for the HP Visualize FX cards. These cards are
> +	    commonly found in PA-RISC workstations. Currently only FX5 has bee=
n
> +	    tested.
> +
> +	    Say Y if you have such a card.
> +
>  config FB_MAC
>  	bool "Generic Macintosh display support"
>  	depends on (FB =3D y) && MAC
> diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
> index 477b9624b703..3ef26907a3a4 100644
> --- a/drivers/video/fbdev/Makefile
> +++ b/drivers/video/fbdev/Makefile
> @@ -129,6 +129,6 @@ obj-$(CONFIG_FB_MX3)		  +=3D mx3fb.o
>  obj-$(CONFIG_FB_DA8XX)		  +=3D da8xx-fb.o
>  obj-$(CONFIG_FB_SSD1307)	  +=3D ssd1307fb.o
>  obj-$(CONFIG_FB_SIMPLE)           +=3D simplefb.o
> -
> +obj-$(CONFIG_FB_VISUALIZEFX)	  +=3D visualizefx.o
>  # the test framebuffer is last
>  obj-$(CONFIG_FB_VIRTUAL)          +=3D vfb.o
> diff --git a/drivers/video/fbdev/visualizefx.c b/drivers/video/fbdev/vis=
ualizefx.c
> new file mode 100644
> index 000000000000..9318e07be1aa
> --- /dev/null
> +++ b/drivers/video/fbdev/visualizefx.c
> @@ -0,0 +1,602 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Framebuffer driver for Visualize FX cards commonly found in PA-RISC =
machines
> + *
> + * Copyright (c) 2021 Sven Schnelle <svens@stackframe.org>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/pci.h>
> +#include <linux/fb.h>
> +#include <linux/delay.h>
> +#include <linux/rational.h>
> +
> +#define VISFX_VRAM_ENDIANESS_WRITE	0xa4303c
> +#define VISFX_VRAM_ENDIANESS_READ	0xaa0408
> +#define VISFX_VRAM_ENDIANESS_BIG	0xe4e4e4e4
> +#define VISFX_VRAM_ENDIANESS_LITTLE	0x1b1b1b1b
> +
> +#define VISFX_STATUS			0x641400
> +
> +#define VISFX_COLOR_MASK		0x800018
> +#define VISFX_COLOR_INDEX		0x800020
> +#define VISFX_COLOR_VALUE		0x800024
> +
> +#define VISFX_SYNC_POLARITY		0x800044
> +#define VISFX_SYNC_VISIBLE_SIZE		0x80005c
> +#define VISFX_SYNC_HORIZ_CONF		0x800060
> +#define VISFX_SYNC_VERT_CONF		0x800068
> +#define VISFX_SYNC_MASTER_PLL		0x8000a0
> +#define VISFX_SYNC_PLL_STATUS		0x8000b8
> +
> +#define VISFX_VRAM_WRITE_MODE		0xa00808
> +#define VISFX_VRAM_MASK			0xa0082c
> +#define VISFX_FGCOLOR			0xa0083c
> +#define VISFX_BGCOLOR			0xa00844
> +#define VISFX_WRITE_MASK		0xa0084c
> +#define VISFX_VRAM_WRITE_DATA_INCRX	0xa60000
> +#define VISFX_VRAM_WRITE_DATA_INCRY	0xa68000
> +#define VISFX_SCREEN_SIZE		0xac1054
> +#define VISFX_VRAM_WRITE_DEST		0xac1000
> +
> +#define VISFX_START			0xb3c000
> +#define VISFX_SIZE			0xb3c808
> +#define VISFX_HEIGHT			0xb3c008
> +#define VISFX_DST			0xb3cc00
> +
> +#define VISFX_DFP_ENABLE		0x10000
> +#define VISFX_HSYNC_POSITIVE		0x40000
> +#define VISFX_VSYNC_POSITIVE		0x80000
> +
> +#define VISFX_SYNC_PLL_BASE		49383 /* 20.25MHz in ps */
> +
> +#define VISFX_CURSOR_POS		0x400000
> +#define VISFX_CURSOR_INDEX		0x400004
> +#define VISFX_CURSOR_DATA		0x400008
> +#define VISFX_CURSOR_COLOR		0x400010
> +#define VISFX_CURSOR_ENABLE		0x80000000
> +
> +#define VISFX_VRAM_WRITE_MODE_BITMAP	0x02000000
> +#define VISFX_VRAM_WRITE_MODE_COLOR	0x050004c0
> +#define VISFX_VRAM_WRITE_MODE_FILL	0x05000080
> +
> +#define VISFX_FB_LENGTH			0x01000000
> +#define VISFX_FB_OFFSET			0x01000000
> +#define NR_PALETTE 256
> +
> +struct visfx_par {
> +	u32 pseudo_palette[256];
> +	unsigned long debug_reg;
> +	void __iomem *reg_base;
> +	unsigned long reg_size;
> +	int open_count;
> +};
> +
> +static u32 visfx_readl(struct fb_info *info, int reg)
> +{
> +	struct visfx_par *par =3D info->par;
> +
> +	return le32_to_cpu(readl(par->reg_base + reg));
> +}
> +
> +static void visfx_writel(struct fb_info *info, int reg, u32 val)
> +{
> +	struct visfx_par *par =3D info->par;
> +
> +	return writel(cpu_to_le32(val), par->reg_base + reg);
> +}
> +
> +static void visfx_write_vram(struct fb_info *info, int reg, u32 val)
> +{
> +	struct visfx_par *par =3D info->par;
> +
> +	return writel(val, par->reg_base + reg);
> +}
> +
> +static void visfx_bmove_wait(struct fb_info *info)
> +{
> +	while (visfx_readl(info, VISFX_STATUS));
> +}
> +
> +static ssize_t visfx_sysfs_show_reg(struct device *dev,
> +				    struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct fb_info *info =3D pci_get_drvdata(container_of(dev, struct pci_=
dev, dev));
> +	struct visfx_par *par =3D info->par;
> +
> +	return sprintf(buf, "%08x\n", visfx_readl(info, par->debug_reg));
> +}
> +
> +static ssize_t visfx_sysfs_store_reg(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct fb_info *info =3D pci_get_drvdata(container_of(dev, struct pci_=
dev, dev));
> +	struct visfx_par *par =3D info->par;
> +	unsigned long data;
> +	char *p;
> +
> +	p =3D strchr(buf, '=3D');
> +	if (p)
> +		*p =3D '\0';
> +
> +	if (kstrtoul(buf, 16, &par->debug_reg))
> +		return -EINVAL;
> +
> +	if (par->debug_reg > par->reg_size)
> +		return -EINVAL;
> +
> +	if (p) {
> +		if (kstrtoul(p+1, 16, &data))
> +			return -EINVAL;
> +		visfx_writel(info, par->debug_reg, data);
> +	}
> +	return count;
> +}
> +
> +static DEVICE_ATTR(reg, 0600, visfx_sysfs_show_reg, visfx_sysfs_store_r=
eg);
> +
> +static void visfx_set_vram_addr(struct fb_info *info, int x, int y)
> +{
> +	visfx_writel(info, VISFX_VRAM_WRITE_DEST, (y << 16) | x);
> +}
> +
> +static void visfx_set_bmove_color(struct fb_info *info, int fg, int bg)
> +{
> +	visfx_writel(info, VISFX_BGCOLOR, 0x01010101 * bg);
> +	visfx_writel(info, VISFX_FGCOLOR, 0x01010101 * fg);
> +}
> +
> +static void visfx_imageblit_mono(struct fb_info *info, const char *data=
, int dx, int dy,
> +				 int width, int height, int fg_color, int bg_color)
> +{
> +	int _width, x, y;
> +	u32 tmp;
> +
> +	visfx_set_bmove_color(info, fg_color, bg_color);
> +	visfx_writel(info, VISFX_VRAM_WRITE_MODE, VISFX_VRAM_WRITE_MODE_COLOR)=
;
> +	visfx_writel(info, VISFX_VRAM_MASK, 0xffffffff);
> +
> +	for (x =3D 0, _width =3D width; _width > 0; _width -=3D 32, x +=3D 4) =
{
> +		visfx_set_vram_addr(info, dx + x * 8, dy);
> +		if (_width >=3D 32) {
> +			for (y =3D 0; y < height; y++) {
> +				memcpy(&tmp, &data[y * (width / 8) + x], 4);
> +				visfx_write_vram(info, VISFX_VRAM_WRITE_DATA_INCRY, tmp);
> +			}
> +		} else {
> +			visfx_writel(info, VISFX_VRAM_MASK, GENMASK(31, 31 - _width + 1));
> +			for (y =3D 0; y < height; y++) {
> +				tmp =3D 0;
> +				memcpy(&tmp, &data[y * (width / 8) + x], ((_width-1)/8)+1);
> +				visfx_write_vram(info, VISFX_VRAM_WRITE_DATA_INCRY, tmp);
> +			}
> +		}
> +	}
> +}
> +
> +static void visfx_setup_unknown(struct fb_info *info)
> +{
> +	visfx_writel(info, 0xb08044, 0x1b);
> +	visfx_writel(info, 0xb08048, 0x1b);
> +	visfx_writel(info, 0x920860, 0xe4);
> +	visfx_writel(info, 0xa00818, 0);
> +	visfx_writel(info, 0xa00404, 0);
> +	visfx_writel(info, 0x921110, 0);
> +	visfx_writel(info, 0x9211d8, 0);
> +	visfx_writel(info, 0xa0086c, 0);
> +	visfx_writel(info, 0x921114, 0);
> +	visfx_writel(info, 0xac1050, 0);
> +	visfx_writel(info, 0xa00858, 0xb0);
> +
> +	visfx_writel(info, VISFX_VRAM_WRITE_MODE, VISFX_VRAM_WRITE_MODE_BITMAP=
);
> +	visfx_writel(info, VISFX_WRITE_MASK, 0xffffffff);
> +	visfx_writel(info, VISFX_VRAM_MASK, 0xffffffff);
> +#ifdef __BIG_ENDIAN
> +	visfx_writel(info, VISFX_VRAM_ENDIANESS_READ, VISFX_VRAM_ENDIANESS_BIG=
);
> +	visfx_writel(info, VISFX_VRAM_ENDIANESS_WRITE, VISFX_VRAM_ENDIANESS_BI=
G);
> +#else
> +	visfx_writel(info, VISFX_VRAM_ENDIANESS_READ, VISFX_VRAM_ENDIANESS_LIT=
TLE);
> +	visfx_writel(info, VISFX_VRAM_ENDIANESS_WRITE, VISFX_VRAM_ENDIANESS_LI=
TTLE);
> +#endif
> +}
> +
> +static void visfx_imageblit(struct fb_info *info, const struct fb_image=
 *image)
> +{
> +	int x, y;
> +
> +	visfx_bmove_wait(info);
> +	visfx_writel(info, VISFX_WRITE_MASK, 0xffffffff);
> +
> +	switch (image->depth) {
> +	case 1:
> +		visfx_imageblit_mono(info, image->data, image->dx, image->dy,
> +				     image->width, image->height,
> +				     image->fg_color, image->bg_color);
> +		break;
> +	case 8:
> +		visfx_writel(info, VISFX_VRAM_WRITE_MODE, VISFX_VRAM_WRITE_MODE_BITMA=
P);
> +
> +		for (y =3D 0; y < image->height; y++) {
> +			u32 data =3D 0;
> +			int pos =3D 0;
> +
> +			visfx_writel(info, VISFX_WRITE_MASK, 0xffffffff);
> +			visfx_set_vram_addr(info, image->dx, image->dy + y);
> +
> +			for (x =3D 0; x < image->width; x++) {
> +				pos =3D x & 3;
> +				data |=3D ((u8 *)image->data)[y * image->height + x] << (pos * 8);
> +				if (pos =3D=3D 3) {
> +					visfx_write_vram(info, VISFX_VRAM_WRITE_DATA_INCRX, data);
> +					data =3D 0;
> +				}
> +			}
> +
> +			if (x && pos !=3D 3) {
> +				visfx_write_vram(info, VISFX_WRITE_MASK, (1 << ((pos+1) * 8))-1);
> +				visfx_write_vram(info, VISFX_VRAM_WRITE_DATA_INCRX, data);
> +			}
> +		}
> +		break;
> +
> +	default:
> +		break;
> +	}
> +}
> +
> +static void visfx_fillrect(struct fb_info *info, const struct fb_fillre=
ct *fr)
> +{
> +	visfx_bmove_wait(info);
> +	visfx_writel(info, VISFX_WRITE_MASK, 0xffffffff);
> +	visfx_writel(info, VISFX_VRAM_WRITE_MODE, VISFX_VRAM_WRITE_MODE_FILL);
> +	visfx_set_bmove_color(info, fr->color, 0);
> +	visfx_writel(info, VISFX_START, (fr->dx << 16) | fr->dy);
> +	visfx_writel(info, VISFX_SIZE, (fr->width << 16) | fr->height);
> +}
> +
> +static u32 visfx_cmap_entry(struct fb_cmap *cmap, int color)
> +{
> +	return (((cmap->blue[color] & 0xff)) |
> +		((cmap->green[color] & 0xff) << 8) |
> +		(cmap->red[color] & 0xff) << 16);
> +}
> +
> +static int visfx_setcmap(struct fb_cmap *cmap, struct fb_info *info)
> +{
> +	int i;
> +
> +	visfx_writel(info, VISFX_COLOR_INDEX, cmap->start);
> +
> +	for (i =3D 0; i < cmap->len; i++)
> +		visfx_writel(info, VISFX_COLOR_VALUE, visfx_cmap_entry(cmap, i));
> +
> +	visfx_writel(info, VISFX_COLOR_MASK, 0xff);
> +	visfx_writel(info, 0x80004c, 0xc);
> +	visfx_writel(info, 0x800000, 0);
> +	return 0;
> +}
> +
> +static void visfx_get_video_mode(struct fb_info *info)
> +{
> +	struct fb_var_screeninfo *var =3D &info->var;
> +	unsigned long n, d;
> +	u32 tmp;
> +
> +	tmp =3D visfx_readl(info, VISFX_SYNC_VISIBLE_SIZE);
> +	var->xres =3D (tmp & 0xffff) + 1;
> +	var->yres =3D (tmp >> 16) + 1;
> +
> +	tmp =3D visfx_readl(info, VISFX_SYNC_MASTER_PLL);
> +	n =3D (tmp & 0xff) + 1;
> +	d =3D ((tmp >> 8) & 0xff) + 1;
> +	var->pixclock =3D (VISFX_SYNC_PLL_BASE / d) * n;
> +
> +	tmp =3D visfx_readl(info, VISFX_SYNC_HORIZ_CONF);
> +	var->left_margin =3D ((tmp >> 20) & 0x1ff) + 1;
> +	var->hsync_len =3D (((tmp >> 12) & 0xff) + 1) * 4;
> +	var->right_margin =3D (tmp & 0x1ff) + 1;
> +
> +	tmp =3D visfx_readl(info, VISFX_SYNC_VERT_CONF);
> +	var->upper_margin =3D ((tmp >> 16) & 0xff) + 1;
> +	var->vsync_len =3D ((tmp >> 8) & 0xff) + 1;
> +	var->lower_margin =3D (tmp & 0xff) + 1;
> +
> +	tmp =3D visfx_readl(info, VISFX_SYNC_POLARITY);
> +	if (tmp & VISFX_HSYNC_POSITIVE)
> +		var->sync |=3D FB_SYNC_HOR_HIGH_ACT;
> +	if (tmp & VISFX_VSYNC_POSITIVE)
> +		var->sync |=3D FB_SYNC_VERT_HIGH_ACT;
> +
> +	var->red.length =3D 8;
> +	var->green.length =3D 8;
> +	var->blue.length =3D 8;
> +	var->bits_per_pixel =3D 8;
> +	var->grayscale =3D 0;
> +	var->xres_virtual =3D var->xres;
> +	var->yres_virtual =3D var->yres;
> +	info->screen_size =3D 2048 * var->yres;
> +}
> +
> +static void visfx_set_pll(struct fb_info *info, unsigned long clock)
> +{
> +	unsigned long n, d, tmp;
> +
> +	rational_best_approximation(clock, VISFX_SYNC_PLL_BASE, 0x3f, 0x3f, &n=
, &d);
> +	tmp =3D (((d * 4) - 1) << 8) | ((n * 4) - 1);
> +	visfx_writel(info, VISFX_SYNC_MASTER_PLL, 0x520000 | tmp);
> +	while (visfx_readl(info, VISFX_SYNC_PLL_STATUS) & 0xffffff)
> +		udelay(10);
> +	visfx_writel(info, VISFX_SYNC_MASTER_PLL, 0x530000 | tmp);
> +	while (visfx_readl(info, VISFX_SYNC_PLL_STATUS) & 0xffffff)
> +		udelay(10);
> +}
> +
> +static int visfx_set_par(struct fb_info *info)
> +{
> +	u32 xres, yres, hbp, hsw, hfp, vbp, vsw, vfp, tmp;
> +	struct fb_var_screeninfo *var =3D &info->var;
> +
> +
> +	xres =3D var->xres;
> +	yres =3D var->yres;
> +	hsw =3D var->hsync_len / 4 - 1;
> +	hfp =3D var->right_margin - 1;
> +	hbp =3D var->left_margin - 1;
> +	vsw =3D var->vsync_len - 1;
> +	vfp =3D var->lower_margin - 1;
> +	vbp =3D var->upper_margin - 1;
> +
> +	visfx_set_pll(info, var->pixclock);
> +	visfx_writel(info, VISFX_SYNC_VISIBLE_SIZE, ((yres - 1) << 16) | (xres=
 - 1));
> +	visfx_writel(info, VISFX_SYNC_HORIZ_CONF, (hbp << 20) | (hsw << 12) | =
(0xc << 8) | hfp);
> +	visfx_writel(info, VISFX_SYNC_VERT_CONF, (vbp << 16) | (vsw << 8) | vf=
p);
> +	visfx_writel(info, VISFX_SCREEN_SIZE, (xres << 16) | yres);
> +
> +	tmp =3D VISFX_DFP_ENABLE;
> +	if (var->sync & FB_SYNC_HOR_HIGH_ACT)
> +		tmp |=3D VISFX_HSYNC_POSITIVE;
> +	if (var->sync & FB_SYNC_VERT_HIGH_ACT)
> +		tmp |=3D VISFX_VSYNC_POSITIVE;
> +	visfx_writel(info, VISFX_SYNC_POLARITY, tmp);
> +
> +	visfx_writel(info, VISFX_VRAM_WRITE_MODE, VISFX_VRAM_WRITE_MODE_BITMAP=
);
> +
> +	visfx_get_video_mode(info);
> +	return 0;
> +}
> +
> +static int visfx_check_var(struct fb_var_screeninfo *var, struct fb_inf=
o *info)
> +{
> +	if (var->pixclock > VISFX_SYNC_PLL_BASE ||
> +	    var->left_margin > 512 ||
> +	    var->right_margin > 512 ||
> +	    var->hsync_len > 512 ||
> +	    var->lower_margin > 256 ||
> +	    var->upper_margin > 256 ||
> +	    var->vsync_len > 256 ||
> +		var->xres > 2048 ||
> +		var->yres > 2048)
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +static void visfx_update_cursor_image_line(struct fb_info *info,
> +					   struct fb_cursor *cursor, int y)
> +{
> +	unsigned int x, bytecnt;
> +	u32 data[2] =3D { 0 };
> +	u8 d, m;
> +
> +	bytecnt =3D cursor->image.width / 8;
> +
> +	for (x =3D 0; x < bytecnt && x < 8; x++) {
> +		m =3D cursor->mask[y * bytecnt + x];
> +		d =3D cursor->image.data[y * bytecnt + x];
> +
> +		if (cursor->rop =3D=3D ROP_XOR)
> +			((u8 *)data)[x] =3D d ^ m;
> +		else
> +			((u8 *)data)[x] =3D d & m;
> +	}
> +
> +	visfx_writel(info, VISFX_CURSOR_DATA, data[0]);
> +	visfx_writel(info, VISFX_CURSOR_DATA, data[1]);
> +}
> +
> +static void visfx_update_cursor_image(struct fb_info *info,
> +				      struct fb_cursor *cursor)
> +{
> +	int y, height =3D cursor->image.height;
> +
> +	if (height > 128)
> +		height =3D 128;
> +
> +	visfx_writel(info, VISFX_CURSOR_INDEX, 0);
> +	for (y =3D 0; y < height; y++)
> +		visfx_update_cursor_image_line(info, cursor, y);
> +
> +	for (; y < 256; y++)
> +		visfx_writel(info, VISFX_CURSOR_DATA, 0);
> +}
> +
> +static int visfx_cursor(struct fb_info *info, struct fb_cursor *cursor)
> +{
> +	u32 tmp;
> +
> +	if (cursor->set & (FB_CUR_SETIMAGE|FB_CUR_SETSHAPE))
> +		visfx_update_cursor_image(info, cursor);
> +
> +	if (cursor->set & FB_CUR_SETCMAP) {
> +		tmp =3D visfx_cmap_entry(&info->cmap, cursor->image.fg_color);
> +		visfx_writel(info, VISFX_CURSOR_COLOR, tmp);
> +	}
> +
> +	tmp =3D (cursor->image.dx << 16) | (cursor->image.dy & 0xffff);
> +	if (cursor->enable)
> +		tmp |=3D VISFX_CURSOR_ENABLE;
> +	visfx_writel(info, VISFX_CURSOR_POS, tmp);
> +	return 0;
> +}
> +
> +static int visfx_open(struct fb_info *info, int user)
> +{
> +	struct visfx_par *par =3D info->par;
> +
> +	if (user && par->open_count++ =3D=3D 0)
> +		visfx_writel(info, VISFX_VRAM_WRITE_MODE, VISFX_VRAM_WRITE_MODE_BITMA=
P);
> +
> +	return 0;
> +}
> +
> +static int visfx_release(struct fb_info *info, int user)
> +{
> +	struct visfx_par *par =3D info->par;
> +
> +	if (user)
> +		par->open_count--;
> +
> +	return 0;
> +}
> +
> +static const struct fb_ops visfx_ops =3D {
> +	.owner		=3D THIS_MODULE,
> +	.fb_open	=3D visfx_open,
> +	.fb_release	=3D visfx_release,
> +	.fb_setcmap	=3D visfx_setcmap,
> +	.fb_fillrect	=3D visfx_fillrect,
> +	.fb_imageblit	=3D visfx_imageblit,
> +	.fb_set_par	=3D visfx_set_par,
> +	.fb_check_var	=3D visfx_check_var,
> +	.fb_cursor	=3D visfx_cursor,
> +};
> +
> +static struct fb_fix_screeninfo visfx_fix =3D {
> +	.type =3D FB_TYPE_PACKED_PIXELS,
> +	.visual =3D FB_VISUAL_PSEUDOCOLOR,
> +	.id =3D "Visualize FX",
> +};
> +
> +static int visfx_probe(struct pci_dev *pdev,
> +		       const struct pci_device_id *ent)
> +{
> +	struct visfx_par *par;
> +	struct fb_info *info;
> +	int ret;
> +
> +	info =3D framebuffer_alloc(sizeof(struct visfx_par), &pdev->dev);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	par =3D info->par;
> +
> +	ret =3D pci_enable_device(pdev);
> +	if (ret)
> +		goto err_out_free;
> +
> +	ret =3D pci_request_regions(pdev, KBUILD_MODNAME);
> +	if (ret)
> +		goto err_out_disable;
> +
> +	par->reg_size =3D pci_resource_len(pdev, 0);
> +	par->reg_base =3D pci_ioremap_bar(pdev, 0);
> +	par->open_count =3D 0;
> +
> +	if (!par->reg_base) {
> +		ret =3D -ENOMEM;
> +		goto err_out_release;
> +	}
> +
> +	pci_set_drvdata(pdev, info);
> +
> +	info->fbops =3D &visfx_ops;
> +	info->flags =3D FBINFO_DEFAULT | FBINFO_HWACCEL_FILLRECT | FBINFO_HWAC=
CEL_IMAGEBLIT;
> +	info->fix =3D visfx_fix;
> +	info->pseudo_palette =3D par->pseudo_palette;
> +	info->fix.smem_start =3D pci_resource_start(pdev, 0) + VISFX_FB_OFFSET=
;
> +	info->fix.smem_len =3D VISFX_FB_LENGTH;
> +	info->screen_base =3D par->reg_base + VISFX_FB_OFFSET;
> +	info->fix.type =3D FB_TYPE_PACKED_PIXELS;
> +	info->fix.visual =3D FB_VISUAL_PSEUDOCOLOR;
> +	info->fix.line_length =3D 2048;
> +	info->fix.accel =3D FB_ACCEL_NONE;
> +
> +	visfx_setup_unknown(info);
> +	visfx_get_video_mode(info);
> +	info->var.accel_flags =3D info->flags;
> +
> +	ret =3D device_create_file(&pdev->dev, &dev_attr_reg);
> +	if (ret)
> +		goto err_out_iounmap;
> +
> +	ret =3D fb_alloc_cmap(&info->cmap, NR_PALETTE, 0);
> +	if (ret)
> +		goto err_out_remove;
> +
> +	ret =3D register_framebuffer(info);
> +	if (ret)
> +		goto err_out_dealloc_cmap;
> +	return 0;
> +
> +err_out_dealloc_cmap:
> +	fb_dealloc_cmap(&info->cmap);
> +err_out_remove:
> +	device_remove_file(&pdev->dev, &dev_attr_reg);
> +err_out_iounmap:
> +	pci_iounmap(pdev, par->reg_base);
> +err_out_release:
> +	pci_release_regions(pdev);
> +err_out_disable:
> +	pci_disable_device(pdev);
> +err_out_free:
> +	framebuffer_release(info);
> +	return ret;
> +}
> +
> +static void __exit visfx_remove(struct pci_dev *pdev)
> +{
> +	struct fb_info *info =3D pci_get_drvdata(pdev);
> +	struct visfx_par *par =3D info->par;
> +
> +	device_remove_file(&pdev->dev, &dev_attr_reg);
> +	unregister_framebuffer(info);
> +	pci_iounmap(pdev, par->reg_base);
> +	framebuffer_release(info);
> +	pci_release_regions(pdev);
> +	pci_disable_device(pdev);
> +}
> +
> +static const struct pci_device_id visfx_pci_tbl[] =3D {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_HP, 0x1008) },
> +	{ 0 },
> +};
> +MODULE_DEVICE_TABLE(pci, visfx_pci_tbl);
> +
> +static struct pci_driver visfx_driver =3D {
> +	.name      =3D KBUILD_MODNAME,
> +	.id_table  =3D visfx_pci_tbl,
> +	.probe     =3D visfx_probe,
> +	.remove    =3D visfx_remove,
> +};
> +
> +static int __init visfx_init(void)
> +{
> +	return pci_register_driver(&visfx_driver);
> +}
> +module_init(visfx_init);
> +
> +static void __exit visfx_exit(void)
> +{
> +	pci_unregister_driver(&visfx_driver);
> +}
> +module_exit(visfx_exit);
> +
> +MODULE_AUTHOR("Sven Schnelle <svens@stackframe.org>");
> +MODULE_DESCRIPTION("Framebuffer driver for HP Visualize FX cards");
> +MODULE_LICENSE("GPL");
>

