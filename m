Return-Path: <linux-parisc+bounces-4359-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F589CCEFFC
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Dec 2025 09:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A70A307C6FF
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Dec 2025 08:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66752E7622;
	Fri, 19 Dec 2025 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="H3YFKixL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9F2E717B
	for <linux-parisc@vger.kernel.org>; Fri, 19 Dec 2025 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766133325; cv=none; b=ZUlQRDht8GKJNRWvY42PuUGerM1c9xA3JRVzoknxrfa3CogRd6EjH1/Lw402DkB7J7fNrhgmtSHUD1jDwJhvG2BR/W3x3hpZJ3mjctkETWBN6BF9eMydW65ClCkiq/zULxjStWvAOdq05LZqVt+kevNAUhF9oBUyENGaOCZtFTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766133325; c=relaxed/simple;
	bh=MnfBnsueAlzyyZ4hfxpp7jX9Vg25gtagC4PUBY+JuFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=RRUvOBiMUm9qodrdDDtykcmXeEr2gxcMj4ZipHkuomhphzUehnvBASldgygGW1hDTXq/eTao9ir3U1Wzd/5dv56frFY8A8iEFQHtwnmz+cr1Mty07vfUCPO+GWXtqAOV21Zn/YlmSnwQOaj3LyZg0iH72dWku+w8BhUbTxMO/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=H3YFKixL; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251219083521euoutp01814a00c0f2a17de404d41d2bb34a1568~CkOXxfKqe0432604326euoutp01C
	for <linux-parisc@vger.kernel.org>; Fri, 19 Dec 2025 08:35:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251219083521euoutp01814a00c0f2a17de404d41d2bb34a1568~CkOXxfKqe0432604326euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1766133321;
	bh=1PH6P/DVddRiAw2KzL+2rBNfnh97XhcKGIuZA2HaWRk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=H3YFKixL66KPg7yCHDZB87SgBD2qXcWVC4NR9o71DjlnNtfwNR9bkGLeecykhwJfW
	 cai8HB+zZkBmh8e3TgigwyOY0eZzOwl3LDhe1LlhFA78IapxLuSR2RUJujrG7b3xpo
	 k9QsRfrlVx0UYyJcH3eZ4d0phfgJSuXNogqOcWsk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251219083520eucas1p1897f86ce73b5e4ae6ff41f275751e05f~CkOXcgpY91112111121eucas1p1I;
	Fri, 19 Dec 2025 08:35:20 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251219083519eusmtip210cce1b130f66137137fe846453c9a60~CkOWpSnDe0188601886eusmtip2k;
	Fri, 19 Dec 2025 08:35:19 +0000 (GMT)
Message-ID: <eb983a65-ca78-4290-bad2-3e8955de5d69@samsung.com>
Date: Fri, 19 Dec 2025 09:35:19 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_parisc=3A_Set_valid_bit_in_high_byte_of?=
 =?UTF-8?Q?_64=E2=80=91bit_physical_address?=
To: Leon Romanovsky <leon@kernel.org>, Helge Deller <deller@gmx.de>, "James
 E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Gunthorpe
	<jgg@ziepe.ca>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter
	Roeck <linux@roeck-us.net>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <91700541-3c17-4c2f-aa6b-b4e1a36749f9@app.fastmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251219083520eucas1p1897f86ce73b5e4ae6ff41f275751e05f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251218212903eucas1p2c61be3f993dbf4e1384f9660737f139a
X-EPHeader: CA
X-CMS-RootMailID: 20251218212903eucas1p2c61be3f993dbf4e1384f9660737f139a
References: <20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com>
	<23342800-92be-4288-a9cd-e9e436a2ef87@gmx.de>
	<CGME20251218212903eucas1p2c61be3f993dbf4e1384f9660737f139a@eucas1p2.samsung.com>
	<91700541-3c17-4c2f-aa6b-b4e1a36749f9@app.fastmail.com>

On 18.12.2025 22:28, Leon Romanovsky wrote:
> On Thu, Dec 18, 2025, at 20:27, Helge Deller wrote:
>> On 12/18/25 13:08, Leon Romanovsky wrote:
>>> On 32‑bit systems, phys_addr_t is defined as u32. However, parisc
>>> expects physical addresses to be 64‑bit values so it can store a
>>> validity bit in the upper byte.
>>> ...
>>> Also remove the now‑obsolete macro.
>> Your patch is OK, but could you please keep the lpa() macro?
>> It's unrelated to your patch, and sometimes we need the lpa()
>> e.g. when adding debug code, so I'd prefer to keep it.
> The parch was already accepted and if Marek agrees, he can easily revert the deleted hunk and rebase my parch.
>
> However from upstream perspective, we don't keep code which is not used and if this macro would be function, we would get compilation warning for that.
>
> Isn't lpa(x/) equal to virt_to_phys(x)?

I can drop the lpa() related change, but let us know what is the 
advantage of it compared to virt_to_phys()?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


