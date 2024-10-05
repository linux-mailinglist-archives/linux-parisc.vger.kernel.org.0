Return-Path: <linux-parisc+bounces-2479-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 306709918C1
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 19:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B06A01F22034
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 17:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D281C158D8D;
	Sat,  5 Oct 2024 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uKE1gLyu"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6EA156F39
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728148512; cv=none; b=SrDsn7YZcwPqIhMsmgaohos8tfKeptfZVsAm81CaGaGzdozo5NseVrP1u00c3c6QIxDbzdU7MQLnqFMkYka4/LDRgoXyw7v7kqiozk3ytwG+tgzE0v4zVfJxL3pigqvjmCoW/VKOWm8jVBWoxFflXxNohgzw5RNymWmJtQDcfts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728148512; c=relaxed/simple;
	bh=0EKWa++LIGWPJOXg+W2i41EvTac5ZqFtx7xj65QJuQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tP9F8l1ChxBgRB9B/L5BKs0nkO92DaizIvzASNK8mn9yDtKFMDWr2s+iXB18P0FccUR/rSssC04ZkdwQB7DAPuw+HaDUbxg9U5gnIn1gRQWMNd/WI1sVyb7AZrnYr+QGhW5PoBGIhhYQImF5wsiWoj3ptl3QWTy+CkNPqsX56Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uKE1gLyu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20b93887decso25893415ad.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728148510; x=1728753310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsW7EQNzqFODn0fjV/O1dRd6PWZq45kEsuDrh2KXW2Y=;
        b=uKE1gLyuJHXRd0uN3cS3nHcGiW+jAoG+QOm8dF/GfSapC41fmEzhP2mWipbTsYvdZT
         MC689PFD6NG7ziT/WKSGRDilrvaM6BR/KlbM9YgBILl/z9+lQNJ+8iwzJ3huso7fNziU
         fY2IggVQt4LT/KTeq1UaGkwj0LixMEsE44cL8K2MmAcI+D1N32n6/VjFIJMPW2Xb6Cyi
         q/jbytXepcHVMNfDek6GRAtMem9X+T/EwxGJ6FIM9V2p0rk1JxOvkVZj+nJ0ZJgW4QLc
         H0jSOGYgoz/KeV2mFzvn7pgTbFlu+OI/jvkoPBy4V/WXA+Zxkj6cqFWrD6YjLe8LyS+h
         JW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728148510; x=1728753310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsW7EQNzqFODn0fjV/O1dRd6PWZq45kEsuDrh2KXW2Y=;
        b=mrna+DWsagcXPkpWlMt5KUJpDTN+YHO9gGlkTbJBU9B2SiiPXIu43BaCDTYugSDHx1
         A6JAWR7YTNy+s/tkHC8IHoTCAHHA9WDv9ihR6feRX/HMUC7Bb0V/6sA00FKd9oM4JMOk
         TOkxDQUBvtcrVI3RHuq+qHcyrP1w5gfHIyY7X2LKuXX/+zFaVcRfIjdUvsw5jHYpuyiP
         5lg/TRv+fHbaIV8YgOV0U2dzw/cMTANVTDgQbk0ErMieu2fQe2mvcCp/hjFZ2NKyrZ/3
         NWL0DZEUcARdGqkC09kZsXQD0V3TE19RW3hVzpcVRie04SOPAYwI+6FqYf1TbLSeHD9n
         LtiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWABaKJ7D+p6ikb4EqtwWP98dOQXAUo9xEuq8xe9b2EgKBE6GEfwK+7wsOGx57QJeVt3cT1NEX08qnL/zE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0tr5yV2IcB1NMGRP56QRCMCx9r6JRJDeZhjgRQj5Blish1Pmn
	aNetxTqL8/N0QXc6YoAtdUGtlu4dbQMq6DkmrgXi1NM4xjBLYqUn/xNt76nPv6w=
X-Google-Smtp-Source: AGHT+IENbFDG/A+fVoOl/3+aASUI1BapHoAWqdH3kxJgz5oqEs9gbrypUJkbtSsFqXqIWpDd5XosEA==
X-Received: by 2002:a17:902:fc46:b0:20b:8bd0:7387 with SMTP id d9443c01a7336-20bff1ca475mr95440335ad.52.1728148510524;
        Sat, 05 Oct 2024 10:15:10 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c139317desm15149965ad.125.2024.10.05.10.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 10:15:10 -0700 (PDT)
Message-ID: <99346751-30b3-4245-974b-94be618cf5bd@linaro.org>
Date: Sat, 5 Oct 2024 10:15:06 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] asm-generic: use asm-generic/mman-common.h on parisc
 and alpha
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Damien Le Moal <dlemoal@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Helge Deller <deller@gmx.de>,
 Kees Cook <kees@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-5-arnd@kernel.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240925210615.2572360-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/24 14:06, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
> 
> These two architectures each have their own set of MAP_* flags, like
> powerpc, mips and others do. In addition, the msync() flags are also
> different, here both define the same flags but in a different order.
> Finally, alpha also has a custom MADV_DONTNEED flag for madvise.
> 
> Make the generic MADV_DONTNEED and MS_* definitions conditional on
> them already being defined and then include the common header
> header from both architectures, to remove the bulk of the contents.
> 
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>
> ---
>   arch/alpha/include/uapi/asm/mman.h     | 68 +++-----------------------
>   arch/parisc/include/uapi/asm/mman.h    | 66 +------------------------
>   include/uapi/asm-generic/mman-common.h |  5 ++
>   3 files changed, 13 insertions(+), 126 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

