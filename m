Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0270B441DBC
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Nov 2021 17:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhKAQMy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 1 Nov 2021 12:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbhKAQMx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Nov 2021 12:12:53 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8D3C061714
        for <linux-parisc@vger.kernel.org>; Mon,  1 Nov 2021 09:10:20 -0700 (PDT)
Received: (qmail 26742 invoked from network); 1 Nov 2021 16:10:17 -0000
Received: from p200300cf070a020010bf80fffe6f49ef.dip0.t-ipconnect.de ([2003:cf:70a:200:10bf:80ff:fe6f:49ef]:43404 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 01 Nov 2021 17:10:17 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Cc:     Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] video: fbdev: add HP Visualize FX driver
Date:   Mon, 01 Nov 2021 17:10:09 +0100
Message-ID: <2799287.e9J7NaK4W3@eto.sf-tec.de>
In-Reply-To: <20211031204952.25678-2-svens@stackframe.org>
References: <20211031204952.25678-1-svens@stackframe.org> <20211031204952.25678-2-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3136760.aeNJFYEL58"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart3136760.aeNJFYEL58
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 31. Oktober 2021, 21:49:52 CET schrieb Sven Schnelle:
> This adds a framebuffer driver for HP's visualize series of
> cards. The aim is to support all FX2 - FX10 types but currently only
> FX5 is tested as i don't have any other card.
> 
> Currently no mmap of video memory is supported as i haven't figured
> out how to access VRAM directly.

Besides the DRM things here are a few more things I spotted.

> +struct visfx_par {

What is "par"? Maybe a little more descriptive name would help, _param or 
something?

> +	u32 pseudo_palette[256];
> +	unsigned long debug_reg;
> +	void __iomem *reg_base;
> +	unsigned long reg_size;
> +	int open_count;
> +};

I would move the more often used members to the top, that should make accesses 
of the often used members slightly more efficient as there is no offset 
needed.

> +static ssize_t visfx_sysfs_show_reg(struct device *dev,
> +				    struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct fb_info *info = pci_get_drvdata(container_of(dev, struct 
pci_dev,
> dev)); +	struct visfx_par *par = info->par;
> +
> +	return sprintf(buf, "%08x\n", visfx_readl(info, par->debug_reg));
> +}
> +
> +static ssize_t visfx_sysfs_store_reg(struct device *dev,
> +				     struct device_attribute 
*attr,
> +				     const char *buf, size_t 
count)
> +{
> +	struct fb_info *info = pci_get_drvdata(container_of(dev, struct 
pci_dev,
> dev)); +	struct visfx_par *par = info->par;
> +	unsigned long data;
> +	char *p;
> +
> +	p = strchr(buf, '=');
> +	if (p)
> +		*p = '\0';

No -EINVAL without '='?

> +	if (kstrtoul(buf, 16, &par->debug_reg))
> +		return -EINVAL;
> +
> +	if (par->debug_reg > par->reg_size)
> +		return -EINVAL;
> +
> +	if (p) {
> +		if (kstrtoul(p+1, 16, &data))

Spaces around +

> +			return -EINVAL;
> +		visfx_writel(info, par->debug_reg, data);
> +	}
> +	return count;
> +}
> +
> +static DEVICE_ATTR(reg, 0600, visfx_sysfs_show_reg, visfx_sysfs_store_reg);

Sysfs API is public API, so it needs to be documented and such. Also I bet 
there are helpers to do this better. But I think this should be debugfs 
attributes, not sysfs ones.

> +static void visfx_imageblit_mono(struct fb_info *info, const char *data,
> int dx, int dy, +				 int width, int 
height, int fg_color, int bg_color)
> +{
> +	int _width, x, y;

Having variables named width and _width is just asking for future trouble 
IMHO. Maybe just call the local one "w" or something.

> +	u32 tmp;

You can move that into a more local scope to make it more obvious it doesn't 
carry and state between loop iterations.

> +	visfx_set_bmove_color(info, fg_color, bg_color);
> +	visfx_writel(info, VISFX_VRAM_WRITE_MODE, 
VISFX_VRAM_WRITE_MODE_COLOR);
> +	visfx_writel(info, VISFX_VRAM_MASK, 0xffffffff);
> +
> +	for (x = 0, _width = width; _width > 0; _width -= 32, x += 4) {
> +		visfx_set_vram_addr(info, dx + x * 8, dy);
> +		if (_width >= 32) {
> +			for (y = 0; y < height; y++) {
> +				memcpy(&tmp, &data[y * (width / 8) 
+ x], 4);
> +				visfx_write_vram(info, 
VISFX_VRAM_WRITE_DATA_INCRY, tmp);
> +			}
> +		} else {
> +			visfx_writel(info, VISFX_VRAM_MASK, 
GENMASK(31, 31 - _width + 1));
> +			for (y = 0; y < height; y++) {
> +				tmp = 0;
> +				memcpy(&tmp, &data[y * (width / 8) 
+ x], ((_width-1)/8)+1);
> +				visfx_write_vram(info, 
VISFX_VRAM_WRITE_DATA_INCRY, tmp);
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

A little comment about these numbers would be good, even if it is just 
"recorded from HP-UX driver, no idea what it does".

> +static int visfx_check_var(struct fb_var_screeninfo *var, struct fb_info
> *info) +{
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

Something went wrong with the indentation here.

> +static int visfx_release(struct fb_info *info, int user)
> +{
> +	struct visfx_par *par = info->par;
> +
> +	if (user)
> +		par->open_count--;

Check for underflow, just out of paranoia?

> +static int visfx_probe(struct pci_dev *pdev,
> +		       const struct pci_device_id *ent)
> +{
> +	struct visfx_par *par;
> +	struct fb_info *info;
> +	int ret;
> +
> +	info = framebuffer_alloc(sizeof(struct visfx_par), &pdev->dev);

sizeof(*par)

> +	if (!info)
> +		return -ENOMEM;
> +
> +	par = info->par;
> +
> +	ret = pci_enable_device(pdev);

If you don't have a really good reason to do so you should used 
pcim_enable_device(), which will do half of the following error cleanups and 
the remove handling for you.

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

module_pci_driver(&visfx_driver);

Greetings,

Eike
--nextPart3136760.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYYARYQAKCRBcpIk+abn8
TtXpAJ9BMYf5HJmpVqPej6JyXjRui3EBGACbBpzTjXBB4oaNd9UM2lgwsEFc6Gs=
=dQaR
-----END PGP SIGNATURE-----

--nextPart3136760.aeNJFYEL58--



