Return-Path: <linux-parisc+bounces-1860-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A193E587
	for <lists+linux-parisc@lfdr.de>; Sun, 28 Jul 2024 15:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BC31B21470
	for <lists+linux-parisc@lfdr.de>; Sun, 28 Jul 2024 13:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB3A1A28D;
	Sun, 28 Jul 2024 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="NhwDKsvY"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C09E1B86C2
	for <linux-parisc@vger.kernel.org>; Sun, 28 Jul 2024 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722173128; cv=none; b=mSAYyuJArC3e1SfN6/zKnRiCAdAKEtjX/04GTbVOTz9bCQGoGcKKbsN3PNrEuMxcPi2Ap/QDdnwAu7w26Ir3NTM9HIiSuWTLmeh7qfK79CX2DE17zDwT+QQ4v0LM9zBeGnSYIMBYnnHD/+aGvCEIMUe+u4SkPqNk7X7bxu1nYPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722173128; c=relaxed/simple;
	bh=wFbcfMWIRqWGXS6tQ9IER55I+HJItjaqEBrtIqBemh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eawhG2ZIBCYBPiNbwcIl6qifoJRguElle1w/dLuYnWGFMovQBeuH1y0/eLaE22tBSaJ+R1DvrNQCiaOJbIhlZhk/bO+zs8iNbeK0sVt4aYdjl2G1M/dQZw9P0iZULgRXr7UF+OG0I952R2O6l5oJD4IMDfD1czdH8oMgfXYdq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=NhwDKsvY; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1722173116; x=1722777916; i=deller@gmx.de;
	bh=6u3OmaPbOzBEzWz/Kc0uqQiFPQNBMIQtVucgdHc2pz0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NhwDKsvYlN20uU+99/eGfOOMBiXmmNQvQTHAmvrQ0A9SER//a19FcA7ZR5qRoEYA
	 hEEb4lv2stSpmywemRE+G9C9WUex1bsbbG8+YflopQ5EAEfDw18AqwI2heS46pYVO
	 eA5lJ98ED+nASejq6QN6WQqs6xCqjv0P270J7lkJTNUzeARWL/pVSVGBNGcoL4UWB
	 6D14pbViyCCVLc3uyp++IjpZCIXimoUANp/yUzy54bx3x/HXOJT2YV7yj+MOTIe89
	 ZdgS+ZIB4UysjZrFa15j1xUavk7gkOuPmSa/RYnXayn9wnLjpS6TRb0F+C197KlzX
	 nLSq8hsnkq7RU8JSFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.33]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNY2-1rz0840bGC-00m7Jp; Sun, 28
 Jul 2024 15:25:16 +0200
Message-ID: <c629285c-6113-417d-ae29-18345b2533d0@gmx.de>
Date: Sun, 28 Jul 2024 15:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] parisc: fix a possible DMA corruption
To: Mikulas Patocka <mpatocka@redhat.com>,
 John David Anglin <dave.anglin@bell.net>
Cc: John David Anglin <dave@parisc-linux.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 linux-parisc@vger.kernel.org
References: <76f39b33-4066-a891-94e5-671b1d82df27@redhat.com>
 <38510add-ed4d-4e99-beca-e29efaf94f4b@bell.net>
 <a233f8cd-ec48-3d2c-cfca-d863bb9912f5@redhat.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <a233f8cd-ec48-3d2c-cfca-d863bb9912f5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qIRxGD6dFyqqFwSAWLsFBi3/T0bXyhnJIUVwP5p2+hEteubhLy1
 3JkKuGhZzlLnnL5ZVpl4DUikKoqSMQPJbEGjYhukZpZ37JBZoCUaEO2IQ0vTcAfYL8tD8+s
 3iGDNiMZ+bsz2qhYX09uVOHabCULe9UAJbsFWuxeJAaCMple8EKCIbDAQ6S07t/gafWyhMn
 /2Gzb/mt0N/lW/4cZURkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qSnDBh3RS8s=;fj7Wq14MtDCilVomfJGdLmjnLZX
 FjorAiaMajS4A8CyaTvfoYJJu7WY3WuXLzk91yq3Rlo17179sq3ez2YoEXiSJ/wopIcMdY/5b
 VGwDCiXDmezOVJH5HWf+S27oemYEEW0gbOVWAPfDSQgY/TAdvBtkw03dTwwyTF26+4xzLt1Cy
 mpCUGHTNrE74sc1aDrtVsMPInOyKgMxT5hzL3hRqcxR6sLbMh+dgS0dj1prJ4wiMK53MUWvYg
 qqVCirPYp1WDW2iJPlOCQiqCK0WdH7TxniRFlLNGGup1iuFQON1vB1tc3cDAxZXA0AXD2k9KS
 NiyHXJvGc5bK/8xnpF0v2byXFoV4PQnAG476dOpPKEe+w3JyeWuupLPSsQ0JY6z/taD0+y/4c
 bbJNx0Zsnry6+bW3QLSlc0QXfn4j1AdjNleG48Z2k4Rf/6EzF2bsxInlLXShC1q7yJnmCjPnE
 xwHT33zL1l3xzLEQ1mj8nyO6+mBQnsWhdWFxwG2y4U9Apb4ZTpCzcmA8e5MRodV72iQw+dyDT
 waFnhxR1iyvOoNlp2FEF/Qat/7WXnTHYJgsO3jBWXm6BIBLfRFxBSr5F+NR9xwDBVRXeJ9V45
 nDHZzRT2ZH5CZP+TJ3gg0LEDHI8MxiJH0vwutYxdq32NBSxUDhCJIGBjfj7c26MEqNSIptPst
 UAcdNTR4LLt93kvehmlnMuqQ4ViwOI15a4cQIDcILLuWIxULjIjiCCxpnA69oej1Ll1fQzvug
 mmFCpsjZWbfETr5PpjXuT25qvwS89vM6amdkyG8qDPN5yedxaeTvutH0owUMTTSGLrm85WR5Y
 J5L5xStdIOUaiF47PC1Al/9A==

On 7/27/24 20:22, Mikulas Patocka wrote:
> ARCH_DMA_MINALIGN was defined as 16 - this is too small - it may be
> possible that two unrelated 16-byte allocations share a cache line. If
> one of these allocations is written using DMA and the other is written
> using cached write, the value that was written with DMA may be
> corrupted.
>
> This commit changes ARCH_DMA_MINALIGN to be 128 on PA20 and 32 on PA1.1 =
-
> that's the largest possible cache line size.
>
> As different parisc microarchitectures have different cache line size, w=
e
> define arch_slab_minalign(), cache_line_size() and
> dma_get_cache_alignment() so that the kernel may tune slab cache
> parameters dynamically, based on the detected cache line size.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org

applied.

Thanks!
Helge

>
> ---
>   arch/parisc/Kconfig             |    1 +
>   arch/parisc/include/asm/cache.h |   11 ++++++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
>
> Index: linux-6.10/arch/parisc/include/asm/cache.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-6.10.orig/arch/parisc/include/asm/cache.h	2023-09-18 11:33:40.=
000000000 +0200
> +++ linux-6.10/arch/parisc/include/asm/cache.h	2024-07-27 19:28:18.00000=
0000 +0200
> @@ -20,7 +20,16 @@
>
>   #define SMP_CACHE_BYTES L1_CACHE_BYTES
>
> -#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
> +#ifndef CONFIG_PA20
> +#define ARCH_DMA_MINALIGN	32
> +#else
> +#define ARCH_DMA_MINALIGN	128
> +#endif
> +#define ARCH_KMALLOC_MINALIGN	16	/* ldcw requires 16-byte alignment */
> +
> +#define arch_slab_minalign()	((unsigned)dcache_stride)
> +#define cache_line_size()	dcache_stride
> +#define dma_get_cache_alignment cache_line_size
>
>   #define __read_mostly __section(".data..read_mostly")
>
> Index: linux-6.10/arch/parisc/Kconfig
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-6.10.orig/arch/parisc/Kconfig	2024-07-23 20:35:34.000000000 +0=
200
> +++ linux-6.10/arch/parisc/Kconfig	2024-07-26 19:41:15.000000000 +0200
> @@ -20,6 +20,7 @@ config PARISC
>   	select ARCH_SUPPORTS_HUGETLBFS if PA20
>   	select ARCH_SUPPORTS_MEMORY_FAILURE
>   	select ARCH_STACKWALK
> +	select ARCH_HAS_CACHE_LINE_SIZE
>   	select ARCH_HAS_DEBUG_VM_PGTABLE
>   	select HAVE_RELIABLE_STACKTRACE
>   	select DMA_OPS
>


