Return-Path: <linux-parisc+bounces-4011-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ADDB5541F
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Sep 2025 17:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22F311D65F1E
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Sep 2025 15:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0E53112D3;
	Fri, 12 Sep 2025 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QPK6QKqu"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4470330DD12
	for <linux-parisc@vger.kernel.org>; Fri, 12 Sep 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757692162; cv=none; b=gYPDMBZb0Qb/hBHxzMVJCVu7NCVUvcmPgOYeYgE2I2Iq2PUHUlLIXzriNkjC7uePZaA45fv/yV67ZASgZsXleNCy2mYDPsh/vPFl0vRZKSWVk+fr0EKXvxxvWvcM5eR2SBl31HvcX98MJxivq0kvi5fOOA42jZvnFJK8U2M68oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757692162; c=relaxed/simple;
	bh=pMPYnuEschJXlHKZ3sTeB4Qm2PdJMj5HbUlKJeN/wcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=PZqaR2RVhJkzBrtorHfR2o3+8bRPWQZ5Nvhf9VMAruTTd8Fr9h+7RNz1AQFFakeSy5vhAmWXsprD7hh+nEAne6rwIGzVpLxhOEY1uDbbpgwaNKW4nO1wrv6k5MkAOO/udt1MsWCW6CCDo/dXtW0x5lPIolPZycFiQdGazfKlsgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QPK6QKqu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757692160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a06OtopBSfhX5lhpDNYUFFeXKxatnjbMpyicog5pOn0=;
	b=QPK6QKquNzaP/1wJ0HDlJB7NU+BnY+Mw1bxWrV3lNbEZoYbdTfM6jXaH0mEuehToz+NjD2
	2wzm4ZFHH8+IZN7m+LHgJsvr0KAeXC18lZXwdK5xR5HGgqWcnep4Q2IWU0N1aKV1U17omg
	cIH2ezdhz/6tuuF6X40aN0Tbq8i8M/c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-A81kVUSlNc-cqj1YdJ35lA-1; Fri, 12 Sep 2025 11:49:18 -0400
X-MC-Unique: A81kVUSlNc-cqj1YdJ35lA-1
X-Mimecast-MFC-AGG-ID: A81kVUSlNc-cqj1YdJ35lA_1757692157
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3e75fcdddbdso1028770f8f.2
        for <linux-parisc@vger.kernel.org>; Fri, 12 Sep 2025 08:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757692157; x=1758296957;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a06OtopBSfhX5lhpDNYUFFeXKxatnjbMpyicog5pOn0=;
        b=RryLUbDynStIpvRj9mpLdHK2Y0xlQ9gRDDqqSCGg25fcljd6Zy72rnPv0+q86VSWJ4
         dTW1n/8CtnPQHMrAfhJuwU2dBC40HuBVy78roJjZlA6tVEso0B4Gs4mgUPLU3IIiYk0G
         zPrVcBbnw4feJpotyslBtpCImKlGXtFEN8PYdR3dv8G162D2bKHrEZOkQntKJ3sUlXDq
         YdSoSAgToZkaNknZx7mJA04LOP88TsvQkjNfJ6qVNnRj/h6UCgT3KUDUln9NOWgiU9R5
         U3m14N8SlaOUyFg48F/gqP8HFuIp0IwTNH+Y/5aONCuzGS1V9DCEiTq7H/YwgR5A6W5X
         OVgA==
X-Forwarded-Encrypted: i=1; AJvYcCVPqoaTpZ2PgjefE+zG5yLBaesnWGOIkmt/gsJmX1GWCGnm1peYRExMEfxF3/x69xZHypDxS87ioo9Of7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYdITSCL1mdz4NAii1rFr3EPziy3hY08PgGcM+YjLGyzTIGXS
	hFJsieBRqOKmFYa12f8uelq3mW/liqAniZQMdLp/ggkCN7PI11CLLnw0n+s4szGzySbDoVqKczz
	ykttv60W/eUvVkTAPmUWcOgn/5T91Q1Hlk3wvGko8WRk7lIC21WjQ5Hu2LLmcVWwO+g==
X-Gm-Gg: ASbGnct3DufjJSjohPOeGzeKoLzwYHzfbEzlENJjCuP6zicuxQ3V8+DwSQfmNMhKD4o
	Xos3AKtbIgBqN2SsBegClGoNN05rQQDMVfbIiwBEOa0mal5qHMJ+rggOyuxIIxSmcipeQ8LOcZS
	eB/LBsQ5PlBWd8U8A2IWmEAp0HDlVdxqFMajd1N3jQHErrXfGZv1GVXkHM9AT1FUVLqbKbHPXDg
	obzbwQ0+dWQoO0rT9XJXbDc21V0mxbLomZ75lIgu1KNHvWNXxmSAkTXo3pKlDWn/17wN8lsMM44
	5A23Jaw1ZVhzhZCaktqy+icWgZe0PX37OGRZBxUKgUYEgFG+HI/P9JnJ8XYr2C0VX3SR/1+ow6j
	N4K9tSQ4A+4z4qAoFjwnNLadgcJxe5Eot9C1sLjPR834T+yrLYBFGXrjAWwx+4aQX//Q=
X-Received: by 2002:a5d:4708:0:b0:3e7:ff32:1ab with SMTP id ffacd0b85a97d-3e7ff32024dmr643936f8f.50.1757692157456;
        Fri, 12 Sep 2025 08:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl9S+wAnCCxDRaW4xWiSnXeBRS1RCaVsMhAEEDftlMbaARMa7MEMEkEWpkHwU6BaD+M3Gp3A==
X-Received: by 2002:a5d:4708:0:b0:3e7:ff32:1ab with SMTP id ffacd0b85a97d-3e7ff32024dmr643916f8f.50.1757692157053;
        Fri, 12 Sep 2025 08:49:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d? (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de. [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760775b13sm7174457f8f.10.2025.09.12.08.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 08:49:16 -0700 (PDT)
Message-ID: <cf235550-f29b-4f22-b5b5-c3e7a576239d@redhat.com>
Date: Fri, 12 Sep 2025 17:49:15 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix 32-bit boot failure due inaccurate
 page_pool_page_is_pp()
To: Helge Deller <deller@kernel.org>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@redhat.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux parisc List <linux-parisc@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <aMQ2ZjZNyNwAiUk-@p100>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Cc: Byungchul Park <byungchul@sk.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aMQ2ZjZNyNwAiUk-@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.09.25 17:04, Helge Deller wrote:
> Commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them when
> destroying the pool") changed PP_MAGIC_MASK from 0xFFFFFFFC to 0xc000007c on
> 32-bit platforms.
> 
> The function page_pool_page_is_pp() uses PP_MAGIC_MASK to identify page pool
> pages, but the remaining bits are not sufficient to unambiguously identify
> such pages any longer.
> 
> So page_pool_page_is_pp() now sometimes wrongly reports pages as page pool
> pages and as such triggers a kernel BUG as it believes it found a page pool
> leak.
> 
> There are patches upcoming where page_pool_page_is_pp() will not depend on
> PP_MAGIC_MASK and instead use page flags to identify page pool pages. Until
> those patches are merged, the easiest temporary fix is to disable the check
> on 32-bit platforms.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Toke Høiland-Jørgensen <toke@redhat.com>
> Cc: Linux Memory Management List <linux-mm@kvack.org>
> Cc: Linux parisc List <linux-parisc@vger.kernel.org>
> Cc: <stable@vger.kernel.org> # v6.15+
> Signed-off-by: Helge Deller <deller@gmx.de>
> Link: https://www.spinics.net/lists/kernel/msg5849623.html
> Fixes: ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them when destroying the pool")
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 1ae97a0b8ec7..f3822ae70a81 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4190,7 +4190,7 @@ int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
>    */
>   #define PP_MAGIC_MASK ~(PP_DMA_INDEX_MASK | 0x3UL)
>   
> -#ifdef CONFIG_PAGE_POOL
> +#if defined(CONFIG_PAGE_POOL) && defined(CONFIG_64BIT)
>   static inline bool page_pool_page_is_pp(const struct page *page)
>   {
>   	treturn (page->pp_magic & PP_MAGIC_MASK) == PP_SIGNATURE;
> 

As a temporary fix this LGTM.

But I want to hear other opinions.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


