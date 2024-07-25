Return-Path: <linux-parisc+bounces-1850-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D66093C94D
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 22:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB1962835D5
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2024 20:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49D62E639;
	Thu, 25 Jul 2024 20:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="4BGiOFeM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0696A8CF
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2024 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721937918; cv=none; b=rOoAsHL2+izbI4G/I/nrUPmjrBNut4w88HramrBWSpcwrm5PlZFvlPKWMnq8PiBA46Kilx6u3dse72Qiqu5bctbt2yM6ghbxifNb8x6fyNjQ6fJgh0FliKRs2dX/Wvp5ibtCgsWezsBb/VeBvn3f9ZYbmhcUP07lwxPFzVT2VVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721937918; c=relaxed/simple;
	bh=XG8ZjXkmKyiDapUZGf2pfbA78mL+XNaX0Z4masSh584=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=OcqnRNTUAJUzTsyAdvdlLtahWX1opUFA3EqgwCwdVgbOhtTj+vxiFOdiau0w81Ns3mNIDORFetLbAE5P+XJhqqYvKc4fA/ozFJ7nCHWEJ5s40TARdZkypvssNu1SSdX8H9Tp0d/KbwSHdb+6SZSfGGiiznQdIM1XfsObLu3umZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=4BGiOFeM; arc=none smtp.client-ip=209.71.208.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1721937916; 
        bh=6JmjSy9/cHfuhCbFYhxr+yx6EbjWWFJG6hQGXZvE0CU=;
        h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To;
        b=4BGiOFeMMg5tMGjvfBkgtzWHXTk8Lip0aB/uSDmOhJycL/hp9YRwh+h0SdVjtj2F1X0vfWIuq8QxI+2BH6qAyQAEJnrcOxDig43B4C3mi7XqohkDMprGDHth/e8Aw006wSksTATZZuNJNqxKxSSx7l8LggQoaYH+HGnyQVvApquo/aVNopEn1HsCKOZI/pp+r2LCzz7rylymfbGpViR0VLGIFTa5Tt/n40YoQHUpMiXXj7ZdW2caBBqpCVi4hhUVH6BM9KuJrz5Upv6KrrsO4y1VbhhAskN7+y4q1qg2Tgo/PFzgubc+UvTRedvf9lquheX/emi8OS1WGQ0wWBIT9w==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 66A27566000828EF
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeeftddrieefgddugeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtkfffgggfuffvvehfhfgjsehmtderredtvdejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpeevtdegieeffeevheduvefhjeehvdeiveekffdvueetudfhjeejveeiieetueeigeenucfkphepudejgedrkeekrdelkedrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedujeegrdekkedrleekrddvvddtpdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplfgrmhgvshdruehothhtohhmlhgvhiesjfgrnhhsvghnrfgrrhhtnhgvrhhshhhiphdrtghomhdprhgtphhtthhopegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdprhgtphhtthhopegurghvvgesphgrrhhishgtqdhlihhnuhigrdhorhhgpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
	thhopehmphgrthhotghkrgesrhgvughhrghtrdgtohhmpdhrvghvkffrpegsrhgrshdqsggrshgvqdhothifrghonhdtledtieifqdhgrhgtqdegvddqudejgedqkeekqdelkedqvddvtddrughslhdrsggvlhhlrdgtrgdprghuthhhpghushgvrhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvght
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (174.88.98.220) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 66A27566000828EF; Thu, 25 Jul 2024 16:05:07 -0400
Content-Type: multipart/mixed; boundary="------------DqyWvvAssCBqcMndBSWMaHdL"
Message-ID: <ff54aa24-15be-4bca-8b9e-1b1166b0e0d9@bell.net>
Date: Thu, 25 Jul 2024 16:05:08 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARCH_DMA_MINALIGN on PA-RISC
To: John David Anglin <dave@parisc-linux.org>,
 Mikulas Patocka <mpatocka@redhat.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <93fcf9-f61b-7620-b5f1-d44449d280c9@redhat.com>
 <ef1f849ca7ace78c67b9a398440f012fd29db2c1.camel@HansenPartnership.com>
 <54cb80b8-9c89-4b61-b1cd-1e626daf6719@bell.net>
 <fa37987e-568f-9716-719e-85e3da8db47@redhat.com>
 <f3f59d8a-3ea4-4a21-8b0d-ba0d63ef1ff6@bell.net>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <f3f59d8a-3ea4-4a21-8b0d-ba0d63ef1ff6@bell.net>

This is a multi-part message in MIME format.
--------------DqyWvvAssCBqcMndBSWMaHdL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-07-25 3:13 p.m., John David Anglin wrote:
>> L1_CACHE_BYTES is a performance hint that is used to avoid cache line
>> ping-pong when multiple CPUs modify nearby data.
> Our L1_CACHE_BYTES define is wrong.  PA7100 has a L1 length of 16 bytes.
> PA7200 to PA7300LC have a length of 32 bytes.  PA8000 to PA8700 have a length of 64
> bytes.  PA8800 and PA8900 have a L1 length of 128 bytes (this is from ERS D_Stride).
>
The attached patch fixes the defines for L1_CACHE_SHIFT, L1_CACHE_BYTES and
ARCH_DMA_MINALIGN.  I left ARCH_DMA_MINALIGN at 16 as I believe this gives
128-byte alignment.

Testing.

Dave

-- 
John David Anglin  dave.anglin@bell.net

--------------DqyWvvAssCBqcMndBSWMaHdL
Content-Type: text/plain; charset=UTF-8; name="L1_CACHE_BYTES.d"
Content-Disposition: attachment; filename="L1_CACHE_BYTES.d"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL2NhY2hlLmggYi9hcmNoL3Bh
cmlzYy9pbmNsdWRlL2FzbS9jYWNoZS5oCmluZGV4IDJhNjBkN2E3MmYxZi4uZTliMDA4MTU0
NmM5IDEwMDY0NAotLS0gYS9hcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9jYWNoZS5oCisrKyBi
L2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL2NhY2hlLmgKQEAgLTksMTggKzksMjEgQEAKICNp
bmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KIAogLyoKLSAqIFBBIDIuMCBwcm9jZXNzb3Jz
IGhhdmUgNjQgYW5kIDEyOC1ieXRlIEwyIGNhY2hlbGluZXM7IFBBIDEuMSBwcm9jZXNzb3Jz
Ci0gKiBoYXZlIDMyLWJ5dGUgY2FjaGVsaW5lcy4gIFRoZSBMMSBsZW5ndGggYXBwZWFycyB0
byBiZSAxNiBieXRlcyBidXQgdGhpcwotICogaXMgbm90IGNsZWFybHkgZG9jdW1lbnRlZC4K
KyAqIFBBIDIuMCBwcm9jZXNzb3JzIGhhdmUgNjQgYW5kIDEyOC1ieXRlIGNhY2hlbGluZXM7
IFBBIDEuMSBwcm9jZXNzb3JzCisgKiBoYXZlIDMyLWJ5dGUgY2FjaGVsaW5lcy4KICAqLwot
I2RlZmluZSBMMV9DQUNIRV9CWVRFUyAxNgotI2RlZmluZSBMMV9DQUNIRV9TSElGVCA0Cisj
aWZkZWYgQ09ORklHX1BBMjAKKyNkZWZpbmUgTDFfQ0FDSEVfU0hJRlQgNworI2Vsc2UKKyNk
ZWZpbmUgTDFfQ0FDSEVfU0hJRlQgNQorI2VuZGlmCisjZGVmaW5lIEwxX0NBQ0hFX0JZVEVT
ICgxIDw8IEwxX0NBQ0hFX1NISUZUKQogCiAjaWZuZGVmIF9fQVNTRU1CTFlfXwogCiAjZGVm
aW5lIFNNUF9DQUNIRV9CWVRFUyBMMV9DQUNIRV9CWVRFUwogCi0jZGVmaW5lIEFSQ0hfRE1B
X01JTkFMSUdOCUwxX0NBQ0hFX0JZVEVTCisjZGVmaW5lIEFSQ0hfRE1BX01JTkFMSUdOCTE2
CiAKICNkZWZpbmUgX19yZWFkX21vc3RseSBfX3NlY3Rpb24oIi5kYXRhLi5yZWFkX21vc3Rs
eSIpCiAK

--------------DqyWvvAssCBqcMndBSWMaHdL--

