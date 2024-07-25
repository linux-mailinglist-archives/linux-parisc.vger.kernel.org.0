Return-Path: <linux-parisc+bounces-1849-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D093C8A5
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 21:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D35E41F223F3
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 19:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682061C6BE;
	Thu, 25 Jul 2024 19:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="PVXUGGyv";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="PVXUGGyv"
X-Original-To: linux-parisc@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9372901
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2024 19:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721935185; cv=none; b=OfiQS3kOHvcf/bJWJ68l6ewsW1ByU15MXNgEb9uoLx8LrZaCBZltOPm0XaVEWiP1V5TsqtZQGXnY31m3NP6Wn0fqGdi4iFdJdxhUcebZ3UPmZHYouBq/pcXRd9szG8GHfZ/35G9yakMtAEcj61/Zr5f5OPAVjmxVWezov4ewCMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721935185; c=relaxed/simple;
	bh=naLtpa5EUAb0ERItFPkQvPZ6pDK7amSWq2JjWnuA7HA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RoD9fdp4/rPCYMdX8GqxtnQ/1Wx5cuokzlrGiYzeL3sD9enyue9C7rb67Prf/uqDcTPqkfRweK8liZJuE8fkV1t1WLc2ROkq2pXlpxZDqtIV5QldOvHwcm2aqxHNoCgHX3dySNa3itQtgawLcog3347BfynvtyU+J130TS7gqmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=PVXUGGyv; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=PVXUGGyv; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721935182;
	bh=naLtpa5EUAb0ERItFPkQvPZ6pDK7amSWq2JjWnuA7HA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=PVXUGGyvoSM1h+vcy7W63Xu54QXF6NAXYGz95BxKAbh+c1Ird0g6GLxfvCJo77Ehr
	 6lIBKKMhvTSBGE+4xicK5DIQZX5i7u46Qadv/PAO073k2NVXJkDD0TsBMP3y1Sefdw
	 JkGb+cQJ0lBy50ZhTNk80MA4Wgnv4GARElK4g+Ak=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id CCBBF128686F;
	Thu, 25 Jul 2024 15:19:42 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Pj3aHjXOGZUZ; Thu, 25 Jul 2024 15:19:42 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721935182;
	bh=naLtpa5EUAb0ERItFPkQvPZ6pDK7amSWq2JjWnuA7HA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=PVXUGGyvoSM1h+vcy7W63Xu54QXF6NAXYGz95BxKAbh+c1Ird0g6GLxfvCJo77Ehr
	 6lIBKKMhvTSBGE+4xicK5DIQZX5i7u46Qadv/PAO073k2NVXJkDD0TsBMP3y1Sefdw
	 JkGb+cQJ0lBy50ZhTNk80MA4Wgnv4GARElK4g+Ak=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id AEE6A128684B;
	Thu, 25 Jul 2024 15:19:41 -0400 (EDT)
Message-ID: <7ba1e7372f40ec88f4c0c085c46785e6c95fe86f.camel@HansenPartnership.com>
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: John David Anglin <dave.anglin@bell.net>, John David Anglin
	 <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org
Date: Thu, 25 Jul 2024 15:19:40 -0400
In-Reply-To: <ba2ff9e3-257c-43d7-e74b-e3bede258e8@redhat.com>
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com>
	 <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com>
	 <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net>
	 <fa37987e-568f-9716-719e-85e3da8db47@redhat.com>
	 <3b09e01e90d144043934eafed8b9c70da3b754b4.camel@HansenPartnership.com>
	 <ba2ff9e3-257c-43d7-e74b-e3bede258e8@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2024-07-25 at 19:46 +0200, Mikulas Patocka wrote:
> 
> 
> On Thu, 25 Jul 2024, James Bottomley wrote:
> 
> > > > #define ARCH_DMA_MINALIGN       (128)
> > > > #define ARCH_KMALLOC_MINALIGN   (8)
> > > > 
> > > > L1_CACHE_BYTES is 64 on arm64.
> > > > 
> > > > Possibly, the same can occur on parisc.
> > > > 
> > > > Dave
> > > 
> > > L1_CACHE_BYTES is a performance hint that is used to avoid cache
> > > line ping-pong when multiple CPUs modify nearby data.
> > > 
> > > ARCH_DMA_MINALIGN is the biggest possible cache line size to
> > > avoid DMA data corruption. As there are some arm64 machines with
> > > 128-byte cache line, arm64 has to define it to 128.
> > > 
> > > James said that the L2 cache on PA8800/8900 is coherent with PCI.
> > > So, I  think that ARCH_DMA_MINALIGN should be 64 (is that the L1
> > > cache line size  on PA8800/8900?).
> > 
> > By default, if unset, ARCH_DMA_MINALIGN defaults to alignof(long
> > long), so it is already 64 on parisc.
> > 
> > James
> 
> No, alignof(long long) is 8 :-)

Sorry, thinking in bits not bytes.  We definitely need that to be at
least 16 for all the pure VIPT systems.

James



