Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9414E608B3A
	for <lists+linux-parisc@lfdr.de>; Sat, 22 Oct 2022 12:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiJVKF0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 22 Oct 2022 06:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbiJVKEv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 22 Oct 2022 06:04:51 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E9F2E5E3F
        for <linux-parisc@vger.kernel.org>; Sat, 22 Oct 2022 02:20:48 -0700 (PDT)
Received: (qmail 23867 invoked from network); 22 Oct 2022 08:18:28 -0000
Received: from p200300cf0747190076d435fffeb7be92.dip0.t-ipconnect.de ([2003:cf:747:1900:76d4:35ff:feb7:be92]:60696 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sat, 22 Oct 2022 10:18:28 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] parisc: Use signed char for hardware path in pdc.h
Date:   Sat, 22 Oct 2022 10:19:09 +0200
Message-ID: <1948987.QruaqtAZS7@eto.sf-tec.de>
In-Reply-To: <20221021072038.83248-1-deller@gmx.de>
References: <20221021072038.83248-1-deller@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3505395.YnlCFIzDc1"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart3505395.YnlCFIzDc1
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Date: Sat, 22 Oct 2022 10:19:09 +0200
Message-ID: <1948987.QruaqtAZS7@eto.sf-tec.de>
In-Reply-To: <20221021072038.83248-1-deller@gmx.de>
References: <20221021072038.83248-1-deller@gmx.de>
MIME-Version: 1.0

Am Freitag, 21. Oktober 2022, 09:20:38 CEST schrieb Helge Deller:
> Clean up the struct for hardware_path and drop the struct device_path
> with a proper assignment of bc[] and mod members as signed chars.
> 
> This patch prepares for the kbuild change from Jason A. Donenfeld to
> treat char as always unsigned.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/parisc/include/uapi/asm/pdc.h | 36 +++++++++++-------------------
>  drivers/parisc/pdc_stable.c        | 34 ++++++++++++++--------------
>  2 files changed, 30 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/parisc/include/uapi/asm/pdc.h
> b/arch/parisc/include/uapi/asm/pdc.h index e794e143ec5f..7a90070136e8
> 100644
> --- a/arch/parisc/include/uapi/asm/pdc.h
> +++ b/arch/parisc/include/uapi/asm/pdc.h
> @@ -363,20 +363,25 @@
> 
>  #if !defined(__ASSEMBLY__)
> 
> -/* flags of the device_path */
> +/* flags for hardware_path */
>  #define	PF_AUTOBOOT	0x80
>  #define	PF_AUTOSEARCH	0x40
>  #define	PF_TIMER	0x0F
> 
> -struct device_path {		/* page 1-69 */
> -	unsigned char flags;	/* flags see above! */
> -	unsigned char bc[6];	/* bus converter routing info */
> -	unsigned char mod;
> -	unsigned int  layers[6];/* device-specific layer-info */
> -} __attribute__((aligned(8))) ;
> +struct hardware_path {
> +	unsigned char flags;	/* see bit definitions below */
> +	signed   char bc[6];	/* Bus Converter routing info to a specific */
> +				/* I/O adaptor (< 0 means none, > 63 resvd) */
> +	signed   char mod;	/* fixed field of specified module */
> +};
> +
> +struct pdc_module_path {	/* page 1-69 */
> +	struct hardware_path path;
> +	unsigned int layers[6]; /* device-specific info (ctlr #, unit # ...) */
> +} __attribute__((aligned(8)));
> 
>  struct pz_device {
> -	struct	device_path dp;	/* see above */
> +	struct pdc_module_path dp;	/* see above */
>  	/* struct	iomod *hpa; */
>  	unsigned int hpa;	/* HPA base address */
>  	/* char	*spa; */
> @@ -611,21 +616,6 @@ struct pdc_initiator { /* PDC_INITIATOR */
>  	int mode;
>  };
> 
> -struct hardware_path {
> -	char  flags;	/* see bit definitions below */
> -	char  bc[6];	/* Bus Converter routing info to a specific */
> -			/* I/O adaptor (< 0 means none, > 63 resvd) */
> -	char  mod;	/* fixed field of specified module */
> -};
> -
> -/*
> - * Device path specifications used by PDC.
> - */
> -struct pdc_module_path {
> -	struct hardware_path path;
> -	unsigned int layers[6]; /* device-specific info (ctlr #, unit # ...) */
> -};
> -
>  /* Only used on some pre-PA2.0 boxes */
>  struct pdc_memory_map {		/* PDC_MEMORY_MAP */
>  	unsigned long hpa;	/* mod's register set address */
> diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
> index d9e51036a4fa..d6af5726ddf3 100644
> --- a/drivers/parisc/pdc_stable.c
> +++ b/drivers/parisc/pdc_stable.c
> @@ -88,7 +88,7 @@ struct pdcspath_entry {
>  	short ready;			/* entry record is valid if != 0 */
>  	unsigned long addr;		/* entry address in stable storage */
>  	char *name;			/* entry name */
> -	struct device_path devpath;	/* device path in parisc representation */
> +	struct pdc_module_path devpath;	/* device path in parisc representation */
> struct device *dev;		/* corresponding device */
>  	struct kobject kobj;
>  };
> @@ -138,7 +138,7 @@ struct pdcspath_attribute paths_attr_##_name = { \
>  static int
>  pdcspath_fetch(struct pdcspath_entry *entry)
>  {
> -	struct device_path *devpath;
> +	struct pdc_module_path *devpath;
> 
>  	if (!entry)
>  		return -EINVAL;
> @@ -153,7 +153,7 @@ pdcspath_fetch(struct pdcspath_entry *entry)
>  		return -EIO;
> 
>  	/* Find the matching device.
> -	   NOTE: hardware_path overlays with device_path, so the nice cast can
> +	   NOTE: hardware_path overlays with pdc_module_path, so the nice cast can
> be used */
>  	entry->dev = hwpath_to_device((struct hardware_path *)devpath);

Maybe just use &devpath->path instead and scrap the comment?

Regards,

Eike
--nextPart3505395.YnlCFIzDc1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCY1OnfQAKCRBcpIk+abn8
TgRIAJ9WXdmp66qsowsRjUSB9msbWmUtFgCeJ/4ijSwW0n7mvXXxxb+zTuwg1N4=
=5sMO
-----END PGP SIGNATURE-----

--nextPart3505395.YnlCFIzDc1--



