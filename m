Return-Path: <linux-parisc+bounces-4361-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C549CCFE91
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Dec 2025 13:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18B47315328F
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Dec 2025 12:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6CB2E11A6;
	Fri, 19 Dec 2025 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="upqsDX/u"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE951F7098
	for <linux-parisc@vger.kernel.org>; Fri, 19 Dec 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766148501; cv=none; b=IRhLVMqBaTVmkDUFM/ubAzPzRCoRiGaH5K366QNLKb7S7+719i7wSrAHhbsMTNYICRVqGyoCCxlrQIERTH43frYx+ppTqPUiLjYYgyvCsOPS0c+4jZRPnxoAqhX7S2c0NbK0A/McSBv9GY7VQYPfcnIy7VqtDj+3evFtr+bjnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766148501; c=relaxed/simple;
	bh=k7ceKjOo2GoaU/tykJYLAzfIGi3TmrBdl2efZPk1GCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=pgU/cNerrFcPdoTWUH/C0dxtZzW8rxawTZOtTorMZ75zcPD+p9Vevcyufa/uvBitYIXSUwb9LwYc26ETuW+hfuW/yKJrbqX5OZp0Ig+CSCeFkw8FfYqWGS1tLca6CsrvP5lc6vZuhAu1fDEjK457jhyZVfC/6VIIZs3EWS8b9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=upqsDX/u; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251219124817euoutp010936a248bb0a104b8421516cd8930464~CnrNvNErG2722527225euoutp01b
	for <linux-parisc@vger.kernel.org>; Fri, 19 Dec 2025 12:48:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251219124817euoutp010936a248bb0a104b8421516cd8930464~CnrNvNErG2722527225euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1766148497;
	bh=yIQDyMybLHNqin7NAAAUvAQtoQviI0aOKedDv+Mkc1Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=upqsDX/uMioioNuRz1VWl3MEb5Be/TjXQbE6NgRtXxD98MDY1jOps420iq3DpmftB
	 vT1r7GmQIPMCHcUUiz1drVlw+IPe0RDcY3Qr3bfhiLmxajFryJztCW+Ody684f6TyD
	 erHfjAHfKaDL4QKsvGOKcs54UWCRbcrtkF+BcS6s=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251219124817eucas1p23a472c2546f837da858b963abea4a56b~CnrNiVC9N1230212302eucas1p2D;
	Fri, 19 Dec 2025 12:48:17 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251219124816eusmtip1a80f877747e0e44ab4e218ea7d8f2e45~CnrM-jMCU1293212932eusmtip1I;
	Fri, 19 Dec 2025 12:48:16 +0000 (GMT)
Message-ID: <fb9e642f-e5dd-48f2-b9b0-4ab2a63727f7@samsung.com>
Date: Fri, 19 Dec 2025 13:48:16 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_parisc=3A_Set_valid_bit_in_high_byte_of?=
 =?UTF-8?Q?_64=E2=80=91bit_physical_address?=
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Leon Romanovsky
	<leon@kernel.org>, Helge Deller <deller@gmx.de>, Jason Gunthorpe
	<jgg@ziepe.ca>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter
	Roeck <linux@roeck-us.net>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <1528bd45c80a962dd172c9a9ed97c6ea3e8f295a.camel@HansenPartnership.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251219124817eucas1p23a472c2546f837da858b963abea4a56b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251218212903eucas1p2c61be3f993dbf4e1384f9660737f139a
X-EPHeader: CA
X-CMS-RootMailID: 20251218212903eucas1p2c61be3f993dbf4e1384f9660737f139a
References: <20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com>
	<23342800-92be-4288-a9cd-e9e436a2ef87@gmx.de>
	<CGME20251218212903eucas1p2c61be3f993dbf4e1384f9660737f139a@eucas1p2.samsung.com>
	<91700541-3c17-4c2f-aa6b-b4e1a36749f9@app.fastmail.com>
	<eb983a65-ca78-4290-bad2-3e8955de5d69@samsung.com>
	<1528bd45c80a962dd172c9a9ed97c6ea3e8f295a.camel@HansenPartnership.com>

On 19.12.2025 13:38, James Bottomley wrote:
> On Fri, 2025-12-19 at 09:35 +0100, Marek Szyprowski wrote:
>> On 18.12.2025 22:28, Leon Romanovsky wrote:
>>> On Thu, Dec 18, 2025, at 20:27, Helge Deller wrote:
>>>> On 12/18/25 13:08, Leon Romanovsky wrote:
>>>>> On 32‑bit systems, phys_addr_t is defined as u32. However,
>>>>> parisc expects physical addresses to be 64‑bit values so it can
>>>>> store a validity bit in the upper byte.
>>>>> ...
>>>>> Also remove the now‑obsolete macro.
>>>> Your patch is OK, but could you please keep the lpa() macro?
>>>> It's unrelated to your patch, and sometimes we need the lpa()
>>>> e.g. when adding debug code, so I'd prefer to keep it.
>>> The parch was already accepted and if Marek agrees, he can easily
>>> revert the deleted hunk and rebase my parch.
>>>
>>> However from upstream perspective, we don't keep code which is not
>>> used and if this macro would be function, we would get compilation
>>> warning for that.
>>>
>>> Isn't lpa(x/) equal to virt_to_phys(x)?
>> I can drop the lpa() related change, but let us know what is the
>> advantage of it compared to virt_to_phys()?
> Um, well same as on every architecture: virt_to_phys only gives correct
> results on the offset map since it's defined as an offset map
> subtraction; lpa() gives the the CPU view of the mapping through the
> page table entries, so is correct even in the vmap (and iomap, etc)
> range.

Thanks for the explanation. I will drop the lpa() removal chunk from 
dma-mapping-fixes branch then.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


