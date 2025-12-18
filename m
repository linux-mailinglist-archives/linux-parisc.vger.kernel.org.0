Return-Path: <linux-parisc+bounces-4356-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFAECCCF39
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 18:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E61F3028FE0
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 17:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B631279DC2;
	Thu, 18 Dec 2025 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="l+EV+syb"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87F2264B0
	for <linux-parisc@vger.kernel.org>; Thu, 18 Dec 2025 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766078061; cv=none; b=C8nuMGJ6BAPIMF3mKceBfcKz/DQeL+N3eoV5ijnopLf6c5MGYyLgycINmKQnDbXjzm6//M/J96/Q4r5pkQYkrksAVJ9LculledlC66efLwq1I/L7bZXItxA3aVA/buU1y0Ba1D5VrdTD+K4ptFdmN64r6QX9VOlc63jYGY72Xtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766078061; c=relaxed/simple;
	bh=Qhs5ORVqnjXvaeSFqDMAtW+oNyE2+3Tk018hljg/REQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=PbSFlMCLBIEhPuWrH3InUBLjr9X/JlpNJoQQEVI94yoFIc0mSiRlHyqmpfSeBKEG4N6V4UK/NwqKKOoIkCNe/gciqj/0nmLRGL2Zm52T8n0iZuLKNjflYWUfn5MpWsftTafUetA9HXuViHpeFtEr3MH08vWLeFRZ2o++clUYHKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=l+EV+syb; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251218171416euoutp02f211a4c8f30473bac9e6d0294b505907~CXqKocok22428824288euoutp021
	for <linux-parisc@vger.kernel.org>; Thu, 18 Dec 2025 17:14:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251218171416euoutp02f211a4c8f30473bac9e6d0294b505907~CXqKocok22428824288euoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1766078056;
	bh=spX0COcADzTS9DNdtY+f6S/Jl0c4PfT3ws41xWdNtJ4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=l+EV+sybeTO6jB1n36J4dtGy1hIfsouP35fqX3JvClLqmXR+gceNDAI2skbM+CkJD
	 y+k690T/cSNbnQJDToNJzaYEWdig+mBtOpGxtmipbXc5P4kgsbM+I7yA30ru/LTC7A
	 SpnOVSo22PD2GzM+GO5dvZ9ycVJorM6kXbKji1Ds=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251218171415eucas1p25950ec3b07a1e2162051b94d385c6da3~CXqJ5lb3c1495914959eucas1p2t;
	Thu, 18 Dec 2025 17:14:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251218171415eusmtip2d7b0c87cb0d4ba0b9b4965d3b550a529~CXqJifzZk1322413224eusmtip2j;
	Thu, 18 Dec 2025 17:14:15 +0000 (GMT)
Message-ID: <14660520-f338-4719-9cd6-4d6c7d667106@samsung.com>
Date: Thu, 18 Dec 2025 18:14:14 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_parisc=3A_Set_valid_bit_in_high_byte_of?=
 =?UTF-8?Q?_64=E2=80=91bit_physical_address?=
To: Guenter Roeck <linux@roeck-us.net>, Leon Romanovsky <leon@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
	<deller@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <bc6a3b96-8954-4c79-928d-4035179b09e6@roeck-us.net>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251218171415eucas1p25950ec3b07a1e2162051b94d385c6da3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251218162227eucas1p1f2ea5ed7ed4bc7c98f2455bf089bc72f
X-EPHeader: CA
X-CMS-RootMailID: 20251218162227eucas1p1f2ea5ed7ed4bc7c98f2455bf089bc72f
References: <20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com>
	<CGME20251218162227eucas1p1f2ea5ed7ed4bc7c98f2455bf089bc72f@eucas1p1.samsung.com>
	<bc6a3b96-8954-4c79-928d-4035179b09e6@roeck-us.net>

On 18.12.2025 17:22, Guenter Roeck wrote:
> On 12/18/25 04:08, Leon Romanovsky wrote:
>> From: Leon Romanovsky <leonro@nvidia.com>
>>
>> On 32‑bit systems, phys_addr_t is defined as u32. However, parisc
>> expects physical addresses to be 64‑bit values so it can store a
>> validity bit in the upper byte.
>>
>> Resolve this mismatch by casting the physical address to unsigned
>> long, ensuring it is treated as a 64‑bit value where required. This
>> fixes the failure to start block device drivers on the C3700
>> platform, as reported by Guenter.
>>
>> Also remove the now‑obsolete macro.
>>
>> QEMU command line to reproduce the issue (with Debian SID as rootfs):
>>    qemu-system-hppa -machine C3700 \
>>     -kernel arch/parisc/boot/bzImage \
>>     -append "console=ttyS0 \
>>     root=/dev/sda rw rootwait panic=-1" \
>>     -nographic \
>>     -device lsi53c895a \
>>     -drive file=rootfs-hppa.img,if=none,format=raw,id=hd0 \
>>     -device scsi-hd,drive=hd0
>>
>> Fixes: 96ddf2ef58ec ("parisc: Convert DMA map_page to map_phys 
>> interface")
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Closes: 
>> https://lore.kernel.org/all/b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net/
>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks for the initial report and a quick fix. I'm sorry that this issue 
slipped through the review and tests in linux-next. I've applied it to 
dma-mapping-fixes branch.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


