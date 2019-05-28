Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82D2F2C563
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 13:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfE1L2v (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 07:28:51 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:38345 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbfE1L2v (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 07:28:51 -0400
Received: (qmail 20035 invoked from network); 28 May 2019 11:28:15 -0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69]:57842 HELO webmail.sf-mail.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <svens@stackframe.org>; Tue, 28 May 2019 13:28:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 May 2019 13:28:12 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc-owner@vger.kernel.org
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
In-Reply-To: <20190528110627.GA16860@t470p.stackframe.org>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
 <20190527201538.GD29337@t470p.stackframe.org>
 <20190528110627.GA16860@t470p.stackframe.org>
Message-ID: <8250bd3cf4a0bf32ff3ecb21dd81eca6@sf-tec.de>
X-Sender: eike-kernel@sf-tec.de
User-Agent: Roundcube Webmail/1.3.8
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> FWIW, i hacked up a small driver to read the firmware, i'm attaching it 
> to this
> Mail. Would be nice if some people could try reading the firmware from
> their PA-RISC
> system so we can collect and archive them. Note that it HPMC's in 32 
> Bit Mode,
> but it worked in 64 Bit mode on my C3750/J5000.

Nice!

> +static int __init pdc_firmware_register_sysfs(void)
> +{
> +	struct bin_attribute *attr;
> +	int size, err = -ENOMEM;
> +
> +	attr = kzalloc(sizeof(*attr), 0);
> +	if (!attr)
> +		return -ENOMEM;
> +
> +	size = 1048576; // FIXME
> +
> +	sysfs_bin_attr_init(attr);
> +
> +	attr->size = size;
> +	attr->attr.name = "pdcrom";
> +	attr->attr.mode = S_IRUSR;
> +	attr->read = pdc_firmware_read_rom;
> +#ifdef CONFIG_64BIT
> +	attr->private = ioremap(0xfffffff0f0000000, size);
> +#else
> +	attr->private = ioremap(0xf0000000, size);
> +#endif
> +	if (!attr->private)
> +		goto err_attr;
> +
> +	err = sysfs_create_bin_file(firmware_kobj, attr);
> +	if (err)
> +		goto err_unmap;
> +
> +	pdc_firmware_attr = attr;
> +	return 0;
> +
> +err_unmap:
> +	iounmap(attr->private);
> +err_attr:
> +	kfree(attr);
> +	return err;
> +}
> +
> +static int __init pdc_firmware_init(void)
> +{
> +	return pdc_firmware_register_sysfs();
> +}

Any particular reason you are not simply using BIN_ATTR_RO?

Eike
