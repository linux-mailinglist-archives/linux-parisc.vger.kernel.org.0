Return-Path: <linux-parisc+bounces-1857-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8762893DFC9
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 16:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148781F219C5
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 14:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7924917A91B;
	Sat, 27 Jul 2024 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="4Yj6S1Yr"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-001.bell.net [209.71.212.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2DC17E479
	for <linux-parisc@vger.kernel.org>; Sat, 27 Jul 2024 14:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722091169; cv=none; b=sxkH8OiQ+VfTaOn14HLWawoGpGbUJnHUNrB9MjhqxGMAEt79r5AydFutFYvxv/pJxuR4Snw1ZaxUXZnad/xMSw+em4mzx6aSza4aAhlW8k+YTe5e1pKlFKDO9glPfo5aEYB8UnYJupJPHuOErOFe/fhk5RHZ0OPhIJhRrn1glJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722091169; c=relaxed/simple;
	bh=n3Ts2JzTDLdkxLHBdNS/3oV6efYtxkrD6E8/Ko3tzQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJ+nKbI6POmLlmzZX2+w8PCNl8CrvJsRMvIVhMUjCgpZmZO+w3Gfk6mm0+ezL65sHYylPTKUeB0BlHc9RtuuMEdI59JKiaoAVMcXmCjtNiPn837zPlUQPZMw2SuGdS8PLu7OtfamW6rbWBSwODFeKkYmZOJroQYkiQnySi0hmTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=4Yj6S1Yr; arc=none smtp.client-ip=209.71.212.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1722091167; 
        bh=L5WTrtQYsgTJeY6U2DE6HCKNIc2Jqm6hoFn13K//agQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=4Yj6S1YrRJIyexOLjRojXeLwKRxITjCV8wZ3hL4UeLfs6Cpb1FWzrLmvVFqLwCnF5NvqY6HhZ9cnqzpnPHhdXONwgHwTXQ8LW/iwtWIbTDS3EXp3Ar11tyFeAYuhn1nTYDsYuIDH/jRVTsnvjgBPj9SquJxTHfEW90DWNZVunQJ8O+mlzNprQ3LWj4LChJ3nhgfkYNfagYw7tjO8mu1bMuycsFhtEH0Tx7PpCSC9luE8GWMWJtcYlKIYyFW07qHZkGAQeVqc5ZpR9MrGI/xCkw9tJFfG6VQgx19ymtODBwmJUTfei42mofY/1x5UBI9SuWJ+XHUtLhzuuiU68HAwhA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 669E799D00A7B4AB
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeeftddrieejgdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceugffnnfdpqfgfvfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpeejleffffejhefggfeuheelgeefgeeuieegtdekffegudeuteffgeffjedukefgueenucfkphepudejgedrkeekrdelkedrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedujeegrdekkedrleekrddvvddtpdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplfgrmhgvshdruehothhtohhmlhgvhiesjfgrnhhsvghnrfgrrhhtnhgvrhhshhhiphdrtghomhdprhgtphhtthhopegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdprhgtphhtthhopegurghvvgesphgrrhhishgtqdhlihhnuhigrdhorhhgpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
	thhopehmphgrthhotghkrgesrhgvughhrghtrdgtohhmpdhrvghvkffrpegsrhgrshdqsggrshgvqdhothifrghonhdtledtieifqdhgrhgtqdegvddqudejgedqkeekqdelkedqvddvtddrughslhdrsggvlhhlrdgtrgdprghuthhhpghushgvrhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvght
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (174.88.98.220) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 669E799D00A7B4AB; Sat, 27 Jul 2024 10:39:09 -0400
Message-ID: <38510add-ed4d-4e99-beca-e29efaf94f4b@bell.net>
Date: Sat, 27 Jul 2024 10:39:09 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: fix a possible DMA corruption
To: Mikulas Patocka <mpatocka@redhat.com>,
 John David Anglin <dave@parisc-linux.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
References: <76f39b33-4066-a891-94e5-671b1d82df27@redhat.com>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 xsFNBFJfN1MBEACxBrfJ+5RdCO+UQOUARQLSsnVewkvmNlJRgykqJkkI5BjO2hhScE+MHoTK
 MoAeKwoLfBwltwoohH5RKxDSAIWajTY5BtkJBT23y0hm37fN2JXHGS4PwwgHTSz63cu5N1MK
 n8DZ3xbXFmqKtyaWRwdA40dy11UfI4xzX/qWR3llW5lp6ERdsDDGHm5u/xwXdjrAilPDk/av
 d9WmA4s7TvM/DY3/GCJyNp0aJPcLShU2+1JgBxC6NO6oImVwW07Ico89ETcyaQtlXuGeXYTK
 UoKdEHQsRf669vwcV5XbmQ6qhur7QYTlOOIdDT+8zmBSlqBLLe09soATDciJnyyXDO1Nf/hZ
 gcI3lFX86i8Fm7lQvp2oM5tLsODZUTWVT1qAFkHCOJknVwqRZ8MfOvaTE7L9hzQ9QKgIKrSE
 FRgf+gs1t1vQMRHkIxVWb730C0TGiMGNn2oRUV5O5QEdb/tnH0Te1l+hX540adKZ8/CWzzW9
 vcx+qD9IWLRyZMsM9JnmAIvYv06+YIcdpbRYOngWPd2BqvktzIs9mC4n9oU6WmUhBIaGOGnt
 t/49bTRtJznqm/lgqxtE2NliJN79dbZJuJWe5HkjVa7mP4xtsG59Rh2hat9ByUfROOfoZ0dS
 sVHF/N6NLWcf44trK9HZdT/wUeftEWtMV9WqxIwsA4cgSHFR2QARAQABzTdKb2huIERhdmlk
 IEFuZ2xpbiAoRGViaWFuIFBvcnRzKSA8ZGF2ZS5hbmdsaW5AYmVsbC5uZXQ+wsF3BBMBCAAh
 BQJSXzdTAhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEF2/za5fGU3xs/4P/15sNizR
 ukZLNYoeGAd6keRtNcEcVGEpRgzc/WYlXCRTEjRknMvmCu9z13z8qB9Y9N4JrPdp+NQj5HEs
 ODPI+1w1Mjj9R2VZ1v7suFwhjxMTUQUjCsgna1H+zW/UFsrL5ERX2G3aUKlVdYmSWapeGeFL
 xSMPzawPEDsbWzBzYLSHUOZexMAxoJYWnpN9JceEcGvK1SU2AaGkhomFoPfEf7Ql1u3Pgzie
 ClWEr2QHl+Ku1xW0qx5OLKHxntaQiu30wKHBcsF0Zx2uVGYoINJl/syazfZyKTdbmJnEYyNa
 Bdbn7B8jIkVCShLOWJ8AQGX/XiOoL/oE9pSZ60+MBO9qd18TGYByj0X2PvH+OyQGul5zYM7Q
 7lT97PEzh8xnib49zJVVrKDdJds/rxFwkcHdeppRkxJH0+4T0GnU2IZsEkvpRQNJAEDmEE8n
 uRfssr7RudZQQwaBugUGaoouVyFxzCxdpSYL6zWHA51VojvJYEBQDuFNlUCqet9LtNlLKx2z
 CAKmUPTaDwPcS3uOywOW7WZrAGva1kz9lzxZ+GAwgh38HAFqQT8DQvW8jnBBG4m4q7lbaum3
 znERv7kcfKWoWS7fzxLNTIitrbpYA3E7Zl9D2pDV3v55ZQcO/M35K9teRo6glrtFDU/HXM+r
 ABbh8u9UnADbPmJr9nb7J0tZUSS/zsFNBFJfN1MBEADBzhVn4XyGkPAaFbLPcMUfwcIgvvPF
 UsLi9Q53H/F00cf7BkMY40gLEXvsvdUjAFyfas6z89gzVoTUx3HXkJTIDTiPuUc1TOdUpGYP
 hlftgU+UqW5O8MMvKM8gx5qn64DU0UFcS+7/CQrKOJmzktr/72g98nVznf5VGysa44cgYeoA
 v1HuEoqGO9taA3Io1KcGrzr9cAZtlpwj/tcUJlc6H5mqPHn2EdWYmJeGvNnFtxd0qJDmxp5e
 YVe4HFNjUwsb3oJekIUopDksAP41RRV0FM/2XaPatkNlTZR2krIVq2YNr0dMU8MbMPxGHnI9
 b0GUI+T/EZYeFsbx3eRqjv1rnNg2A6kPRQpn8dN3BKhTR5CA7E/cs+4kTmV76aHpW8m/NmTc
 t7KNrkMKfi+luhU2P/sKh7Xqfbcs7txOWB2V4/sbco00PPxWr20JCA5hYidaKGyQxuXdPUlQ
 Qja4WJFnAtBhh3Oajgwhbvd6S79tz1acjNXZ89b8IN7yDm9sQ+4LhWoUQhB5EEUUUVQTrzYS
 yTGN1YTTO5IUU5UJHb5WGMnSPLLArASctOE01/FYnnOGeU+GFIeQp91p+Jhd07hUr6KWYeJY
 OgEmu+K8SyjfggCWdo8aGy0H3Yr0YzaHeK2HrfC3eZcUuo+yDW3tnrNwM1rd1i3F3+zJK18q
 GnBxEQARAQABwsFfBBgBCAAJBQJSXzdTAhsMAAoJEF2/za5fGU3xNDQP/ikzh1NK/UBrWtpN
 yXLbype4k5/zyQd9FIBxAOYEOogfKdkp+Yc66qNf36gO6vsokxsDXU9me1n8tFoB/DCdzKbQ
 /RjKQRMNNR4fT2Q9XV6GZYSL/P2A1wzDW06tEI+u+1dV40ciQULQ3ZH4idBW3LdN+nloQf/C
 qoYkOf4WoLyhSzW7xdNPZqiJCAdcz9djN79FOz8US+waBCJrL6q5dFSvvsYj6PoPJkCgXhiJ
 hI91/ERMuK9oA1oaBxCvuObBPiFlBDNXZCwmUk6qzLDjfZ3wdiZCxc5g7d2e2taBZw/MsKFc
 k+m6bN5+Hi1lkmZEP0L4MD6zcPuOjHmYYzX4XfQ61lQ8c4ztXp5cKkrvaMuN/bD57HJ6Y73Q
 Y+wVxs9x7srl4iRnbulCeiSOAqHmwBAoWaolthqe7EYL4d2+CjPCcfIuK7ezsEm8c3o3EqC4
 /UpL1nTi0rknRTGc0VmPef+IqQUj33GGj5JRzVJZPnYyCx8sCb35Lhs6X8ggpsafUkuKrH76
 XV2KRzaE359RgbM3pNEViXp3NclPYmeu+XI8Ls/y6tSq5e/o/egktdyJj+xvAj9ZS18b10Jp
 e67qK8wZC/+N7LGON05VcLrdZ+FXuEEojJWbabF6rJGN5X/UlH5OowVFEMhD9s31tciAvBwy
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <76f39b33-4066-a891-94e5-671b1d82df27@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-07-27 6:06 a.m., Mikulas Patocka wrote:
> ARCH_DMA_MINALIGN was defined as 16 - this is too small - it may be
> possible that two unrelated 16-byte allocations share a cache line. If one
> of these allocations is written using DMA and the other is written using
> cached write, the value that was written with DMA may be corrupted.
Agreed.
>
> This commit changes ARCH_DMA_MINALIGN to be 128 - that's the largest
> possible cache line size on parisc.
We could use 32 if CONFIG_PA20 isn't defined.
>
> As different parisc microarchitectures have different cache line size, we
> define arch_slab_minalign(), cache_line_size() and
> dma_get_cache_alignment() so that the kernel may tune slab cache
> parameters dynamically, based on the detected cache line size.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
>
> ---
>   arch/parisc/Kconfig             |    1 +
>   arch/parisc/include/asm/cache.h |    7 ++++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> Index: linux-6.10/arch/parisc/include/asm/cache.h
> ===================================================================
> --- linux-6.10.orig/arch/parisc/include/asm/cache.h	2023-09-18 11:33:40.000000000 +0200
> +++ linux-6.10/arch/parisc/include/asm/cache.h	2024-07-26 20:27:06.000000000 +0200
> @@ -20,7 +20,12 @@
>   
>   #define SMP_CACHE_BYTES L1_CACHE_BYTES
>   
> -#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
> +#define ARCH_DMA_MINALIGN	128
I would use 128 for if CONFIG_PA20 is defined and 32 otherwise.
> +#define ARCH_KMALLOC_MINALIGN	8
Looks okay if we don't need 16-byte alignment for ldcw.  Because PA 2.0 has
coherent ldcw support, we would only see this on PA 1.1 build.

Default is ARCH_DMA_MINALIGN.  So, current value is 16.
> +
> +#define arch_slab_minalign()	((unsigned)dcache_stride)
> +#define cache_line_size()	dcache_stride
> +#define dma_get_cache_alignment cache_line_size
>   
>   #define __read_mostly __section(".data..read_mostly")
>   
> Index: linux-6.10/arch/parisc/Kconfig
> ===================================================================
> --- linux-6.10.orig/arch/parisc/Kconfig	2024-07-23 20:35:34.000000000 +0200
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

Dave

-- 
John David Anglin  dave.anglin@bell.net


