Return-Path: <linux-parisc+bounces-3754-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A56AF9F0D
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Jul 2025 10:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F9494A7891
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Jul 2025 08:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3546318FDDB;
	Sat,  5 Jul 2025 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="fbWZX+bE"
X-Original-To: linux-parisc@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8AB347D5
	for <linux-parisc@vger.kernel.org>; Sat,  5 Jul 2025 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751702856; cv=none; b=eTRq5jaWa9erl2UI5Y7p7vxd76J0pSfEkLiDwBOkZvqS/GBoDWLe9Q6Zqzd2r4Eys2W64zEJtbryzL9WShWHfDzmgLwSxlQS0wT589zR4zha9RpgpOkiDEC5QHgVeHZsHADtYhxyTYqjxa0efMm/I+dc2it8DCWzXLh+mM3cqcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751702856; c=relaxed/simple;
	bh=yaf4Zb6jVvPC2GjCJPyG/lXlMBjSljVV3ZZ6u8SKkVs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FI151WeJ2pBVi/Uqg26YaQr1AKzfDWqkxKpQ6q9BmwHgyzDZE1HT2yhZ9fAwBaU9Arz0u13txjfvPQrmrNqqD+2Uxfoqv8lFumjiJqNRgSLi4Xwg/d1PA2CjAyHwZiM8aJevasDns22oREqqvFEqrg3D88ybJ6C1YY9Xj0knxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=fbWZX+bE; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: f1c8d841-5977-11f0-beb8-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id f1c8d841-5977-11f0-beb8-005056992ed3;
	Sat, 05 Jul 2025 10:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:message-id:subject:to:from:date;
	bh=FPok0vXSOZl0/1Y+WR3SGcKolmA37YwSgJBEIEO6j84=;
	b=fbWZX+bEuZkuennW796XmS3j15qJh1TN3X4eC4sq3H8n6oW1M/QdPM0Wc3asxsMaKoKnZq3q8oIPo
	 3D9qFaQuxxx5z6G7glWyBRxp9CqnyYY3vg6hWNoZSf0UF9f4csftyUpUUzB50KdrxTuDFTMtUk91Uc
	 gSGe7xPnPhPfnAE5ZwNhxEvndLDUJlY4HoBZJPZ/6g+PLlcv76aBVH0KVjgprBT0ASNVIByLAPNBUF
	 2HcuzL0Hz1yqd5hJA8S5mcBElTS/7gB4GEVrbIBW/MZgRx6x4nwRwoICoLuXs0XKPrXBBMB8u8W5VX
	 o/7/FmnF24CgabHb5aw/t98TUaRFXug==
X-KPN-MID: 33|f7uCe1bJNaHosZMWkzZAlA+5xkaZKguGTogCQwFCqAZBJQxaXjSimArl7VTwdOz
 hlKwmKt0seld7lznwdorQbvgb6GBR4wBFsexQpzd+60w=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|68JSyp+0xbQ4fx4UXPeUM5O9x91OKPXLMbq92w94eJAvxKFoKDs1Lw2LVkAfUfB
 G7SGRK4j4MyDhtu2CR/4LPQ==
Received: from del.fritz.box (82-169-217-143.fixed.kpn.net [82.169.217.143])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id f07a82db-5976-11f0-9dd2-00505699b758;
	Sat, 05 Jul 2025 10:06:22 +0200 (CEST)
Date: Sat, 5 Jul 2025 10:06:22 +0200
From: Jeroen Roovers <jer@xs4all.nl>
To: Dave Anglin <dave@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>, linux-parisc
 <linux-parisc@vger.kernel.org>
Subject: Re: parisc kernel cache flush issue with mprotect()
Message-ID: <20250705100622.1555c47b@del.fritz.box>
In-Reply-To: <4b9a23d2-bd36-4f8d-81b8-ba7f6d027d38@parisc-linux.org>
References: <1793f351-614b-489d-9c44-a044aec46eec@gmx.de>
	<08ea1631-5c5f-4081-bbab-5feb38c19957@parisc-linux.org>
	<4b9a23d2-bd36-4f8d-81b8-ba7f6d027d38@parisc-linux.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Jul 2025 15:49:07 -0400
Dave Anglin <dave@parisc-linux.org> wrote:

> Attached is the current patch that I'm testing on mx3210.=C2=A0 I believe
> it fixes everything that I noticed debugging the mprotect-testcase.
> It also has your command line patch and some old radeon changes.
>=20
> Dave
>=20

     While the kernel can't directly write user pages which have
     _PAGE_WRITE zero, it can read pages pages which have [...]
                                   ^^^^^ ^^^^^

Kind regards,
     jer

