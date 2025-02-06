Return-Path: <linux-parisc+bounces-3302-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE71A2AB83
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Feb 2025 15:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04EB1889DA7
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Feb 2025 14:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA17236441;
	Thu,  6 Feb 2025 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hITuI10I"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19E2236433
	for <linux-parisc@vger.kernel.org>; Thu,  6 Feb 2025 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852568; cv=none; b=BWNPxLxtLKSnh2yGoPoIu7ujpNGNREye+5F+tNsfjQEctHiX/+dni+khjqOcxqQ7OSgL6V6d84jkeqWo1bonk76s1h6Brqb9p39g1LO7L4ama+jfB8amcbMJKWAKXYzYp+cU1/1V992AbUJvj85jSwN5rUPsxRHlyqfu/nX1LLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852568; c=relaxed/simple;
	bh=iO43D0PL+o1QdnLJZ0VQ/BtvTi+SA72B/I1+koMgHj8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mk66C2Geq1PYNZXwaIjvaV9pka4q1vmMcJycHvzql/piJdkVoIT8NXF+aApJxi2nAxQd19Yvhp0ANBMn2gO+rPflnAdaCpSJcoibWWE4QLOikJ8TNAt4bhkapKLVfm6PY2y1zbOzANCpyX170clJJFWp8x7CYuo6+vsM2YHsLlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hITuI10I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738852565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQmwnNYhVl7y4z+j+mWJ9koQSChBra4hwvud7jF7bEM=;
	b=hITuI10IsrhRa2eEBKY8eKW8HOK8cdZpCVHLcb4dg5NWeOOd723mvUzVgQK5u8OKzbjVQA
	/Uel2q4qirWlvTj4mZApHMbT1ABXx16mV5kGpUwZOubyHJFTq85/q3TKY84c7sPmSeCEHd
	6sw2TI3XkG9kAbtB12t16kcrs5TB8D8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-vONUF2SNO-m0hIG_rpfBLw-1; Thu, 06 Feb 2025 09:36:02 -0500
X-MC-Unique: vONUF2SNO-m0hIG_rpfBLw-1
X-Mimecast-MFC-AGG-ID: vONUF2SNO-m0hIG_rpfBLw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38c24ac3706so654926f8f.0
        for <linux-parisc@vger.kernel.org>; Thu, 06 Feb 2025 06:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852561; x=1739457361;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yQmwnNYhVl7y4z+j+mWJ9koQSChBra4hwvud7jF7bEM=;
        b=bdZ8z5D+C8haW5o0tJvaYNK5Mo268UaiDIqjffcMBxugerfROSdljZymZl6iTM11ov
         9dEp4Pf3O3i2Oal7iwmzdIzavijO5k25mPBX0cAtho/5IGgYfaOtPlNrsGvxGuPO9Fz9
         ps3TplxxZkL8eVCWsZw09Fp6gWhTfZMy020EDA28FyfeuY8KGwr8HsBK7MN8QaTnKPPG
         IfDVLJPSyukQa1MvFCb0/xOyT27m1FsE54o7kU3LyUvv7E6yD3b3yIjYQZTFThNYl9AQ
         5LiSt/lGs9TggxgnQb+W6XLgVrS0RbVN8BMniZKL6ZoMw3TnZYKLmpBYn2mD6tDztl/U
         QHGw==
X-Forwarded-Encrypted: i=1; AJvYcCVk3K5YXvc37GdA1lSbTTEwM9p6wbVjSc5+9zdqqoxgA1uLlzHih8Qs2HRt3C+0FjI3vclTg56iNFiUgq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzID3ffFKDmOK+FNbV3eeYIk2ttAxFjp0GmOs6goVS3grAIHqq1
	lu+jdW4lrDoG6zYixd79oy2O2EvfpnCOn2oCmPhkTqpJa+l4tgUf4Dsltg6koGtG5dzsVf7f32j
	nVKcerfP671lUDx34ykpy4uCvbaPMWOOxie9FRPjErSZHajSgVBS++K1obTuEXA==
X-Gm-Gg: ASbGnctWJD7QY/Ci78ENrg6yH/ESbBMy0wgZdsHdaLixSQivQQ8ybfHTJrMtK242321
	1oEDhe1a1jEMUkdixkEApcNbrEyl4Cg58xtdyHOX659HGILjNoq6TzcEOwHB3lRhjvOmrBTSs8o
	3o+cDgscqamTfpaccBgzigG5neM+3MJkMtDG47KOcga/s+XQlCExLVbpkaw5XU0XTLXQa+iJcMu
	DchiYN4h6rLbr9+PMskcrLIjEHcVwE4KZYfoxB+e7nFRCJPNPb6n3hj98hEbqZcxtUenPP6RVUG
	RtvFZXOiPpV03f8i1YlGmj3Knzw/a9oSx+OmmLC6V2sqn5lC0Yb6EfusD4/NPE6ni2PWY4JlmIh
	4+yUX2cyaFTQk/Dv1ARAeGBRERe32GguUcMeUj38=
X-Received: by 2002:adf:f9ce:0:b0:386:3835:9fec with SMTP id ffacd0b85a97d-38db492a155mr5075620f8f.44.1738852560942;
        Thu, 06 Feb 2025 06:36:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWL+AzOHE6y1/ZV3p8MQR6Ck4yDVM/9HbJTRC8drQg9XkPqYLMfOUri6+TKbLHY9CtZKzhGw==
X-Received: by 2002:adf:f9ce:0:b0:386:3835:9fec with SMTP id ffacd0b85a97d-38db492a155mr5075602f8f.44.1738852560598;
        Thu, 06 Feb 2025 06:36:00 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d3c:3d00:a7b1:b563:1454:3233? (200116b82d3c3d00a7b1b56314543233.dip.versatel-1u1.de. [2001:16b8:2d3c:3d00:a7b1:b563:1454:3233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7c7sm56422415e9.14.2025.02.06.06.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 06:36:00 -0800 (PST)
Message-ID: <7547778507b5e98e103c0cb54e7705b9d65f93e3.camel@redhat.com>
Subject: Re: [PATCH] serial: 8250_pci: Fix Warning at
 drivers/pci/devres.c:603 pcim_add_mapping_to_legacy_table
From: Philipp Stanner <pstanner@redhat.com>
To: Helge Deller <deller@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-parisc@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Jiri Slaby <jirislaby@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Date: Thu, 06 Feb 2025 15:35:59 +0100
In-Reply-To: <Z5XmLKzhKpLAlzHt@p100>
References: <Z5XmLKzhKpLAlzHt@p100>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-01-26 at 08:37 +0100, Helge Deller wrote:
> Some PA-RISC servers have BMC management cards (Diva) with up to 5
> serial
> UARTS per memory PCI bar. This triggers since at least kernel 6.12
> for each of
> the UARTS (beside the first one) the following warning in devres.c:
>=20
> =C2=A00000:00:02.0: ttyS2 at MMIO 0xf0822000 (irq =3D 21, base_baud =3D
> 115200) is a 16550A
> =C2=A00000:00:02.0: ttyS3 at MMIO 0xf0822010 (irq =3D 21, base_baud =3D
> 115200) is a 16550A
> =C2=A0------------[ cut here ]------------
> =C2=A0WARNING: CPU: 1 PID: 1 at drivers/pci/devres.c:603
> pcim_add_mapping_to_legacy_table+0x5c/0x8c
> =C2=A0CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.11+ #2621
> =C2=A0Hardware name: 9000/778/B160L
> =C2=A0
> =C2=A0 IAOQ[0]: pcim_add_mapping_to_legacy_table+0x5c/0x8c
> =C2=A0 IAOQ[1]: pcim_add_mapping_to_legacy_table+0x60/0x8c
> =C2=A0 RP(r2): pcim_add_mapping_to_legacy_table+0x4c/0x8c
> =C2=A0Backtrace:
> =C2=A0 [<10c1eb10>] pcim_iomap+0xd4/0x10c
> =C2=A0 [<10ca8784>] serial8250_pci_setup_port+0xa8/0x11c
> =C2=A0 [<10ca9a34>] pci_hp_diva_setup+0x6c/0xc4
> =C2=A0 [<10cab134>] pciserial_init_ports+0x150/0x324
> =C2=A0 [<10cab470>] pciserial_init_one+0xfc/0x20c
> =C2=A0 [<10c14780>] pci_device_probe+0xc0/0x190
> =C2=A0 ...
> =C2=A0---[ end trace 0000000000000000 ]---
>=20
> I see three options to avoid this warning:
> a) drop the WARNING() from devrec.c,
> b) modify pcim_iomap() to return an existing mapping if it exists
> =C2=A0=C2=A0 instead of creating a new mapping, or
> c) change serial8250_pci_setup_port() to only create a new mapping
> =C2=A0=C2=A0 if none exists yet.
>=20
> This patch implements option c).
>=20
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: <stable@vger.kernel.org> # v6.12+
>=20
>=20
> diff --git a/drivers/tty/serial/8250/8250_pcilib.c
> b/drivers/tty/serial/8250/8250_pcilib.c
> index ea906d721b2c..fc024bf86c1f 100644
> --- a/drivers/tty/serial/8250/8250_pcilib.c
> +++ b/drivers/tty/serial/8250/8250_pcilib.c
> @@ -19,7 +19,9 @@ int serial8250_pci_setup_port(struct pci_dev *dev,
> struct uart_8250_port *port,
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	if (pci_resource_flags(dev, bar) & IORESOURCE_MEM) {
> -		if (!pcim_iomap(dev, bar, 0) &&
> !pcim_iomap_table(dev))
> +		/* might have been mapped already with other offset
> */
> +		if (!pcim_iomap_table(dev) ||
> !pcim_iomap_table(dev)[bar] ||
> +			!pcim_iomap(dev, bar, 0))
> =C2=A0			return -ENOMEM;
> =C2=A0
> =C2=A0		port->port.iotype =3D UPIO_MEM;
>=20

[Answering despite the ignore-hint to provide some tips for a v2]

Alright, so this worked before 6.12 because pcim_iomap() just silently
returned NULL if a mapping already existed. Which it still does, but
with a warning.

If you have to rework 8250_pcilib.c anyways, would be good to get rid
of pcim_iomap_table() as you're at it, because it's deprecated and
problematic.

It seems to me that this driver would be best of it could store in its
state (uart_8250_port) whether that BAR has already been mapped, and if
yes, take the existing addr and add the offset as needed for your new
addr.

Feel free to reach out if I can provide further tips


Greetings
P.


