Return-Path: <linux-parisc+bounces-1894-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A4594462D
	for <lists+linux-parisc@lfdr.de>; Thu,  1 Aug 2024 10:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B3B9280FB1
	for <lists+linux-parisc@lfdr.de>; Thu,  1 Aug 2024 08:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1C213BC25;
	Thu,  1 Aug 2024 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EpyhvPbn"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77D21EB490
	for <linux-parisc@vger.kernel.org>; Thu,  1 Aug 2024 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722499599; cv=none; b=MWEUOC/ccMFExTxOjO20U+OE/poxIST7f8n4HVtHLfFIc39vHXy0s83NHCGQ0c/ykC8bVC+rHcDfehtuky6MXdUsXdZJa+jqPNkVViCelt668xMvUF6NdXfU2XmzfqllhPwGAuNKO5oSKGzar5Q2kF3ldmX75AQsYfdrxMe+gXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722499599; c=relaxed/simple;
	bh=6BYvKLNb6BV3URZIk1kh02MAmESjQqs+BlrBJ4CDJrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwQu9PT8Z+2+60fF3+ig8F/5coSdhlXEJJzygQBk1qDQjPBM1o3UBAMSDt4k91uvMqytYbVf2YchXBrTfUP/pO3oocbmrWskKqrk3InJ5od1URP8MqKtDK20wIY+CrcSBaN2ljec8QRx8uDSV7KJmzbKzOTFGqQgRz6zGqvZDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EpyhvPbn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722499596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fSbKvwYBQ6IDwLVCp8S4T0F+fvx1pgc6qaCobZqxwZs=;
	b=EpyhvPbnjhJWOHHu5ToorsICCuPHWuEx9hBbxgHxdrT5eshjwAs9PpigrGFdrWngaR6DvP
	G40Cu4SZ6rychvmOtifjt4+c1yhAyMK7XOOXtNI0PtZb5TPmVteDgj0f0rAx42YATmT3IZ
	1DcU/5EO2gFEsvGF/QFSflbV7KIejLo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-TFWl_QnlNk28QTHEv63VRg-1; Thu, 01 Aug 2024 04:06:35 -0400
X-MC-Unique: TFWl_QnlNk28QTHEv63VRg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-36873a449dfso954043f8f.0
        for <linux-parisc@vger.kernel.org>; Thu, 01 Aug 2024 01:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722499594; x=1723104394;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fSbKvwYBQ6IDwLVCp8S4T0F+fvx1pgc6qaCobZqxwZs=;
        b=jXVae5nx3VzjOuvxl6paj5eQPVwLzNbiF8DoOBpTtHj/l23t3MwAM0ECiUTl+rBZUF
         o2mdinXM+/dmbLgjrRicNRYowvYD2fZbnccbwYsJ6kJteobCqQSnB3qvJZLf15AV490j
         M2AgXWhHkhQAclc9szZs0kK1zRvX1cx/nhBv8gqlliOQy6xbog1poi1H/uwDi/49kGzE
         aicII/ANT7PKe87b6u9Umtp/vrMANQC2Lvm/SH8G2c3sWbCiumY01Rn8SKIcBcOu0AnK
         v26ezVIKLDcM7O9IODjvgf2M00f9wSXj58TeEIbEN6Tn4cEFEFAdxXvwiTulKFeVyYjZ
         VH6g==
X-Forwarded-Encrypted: i=1; AJvYcCXA5hPFlIcrrHdflWxkRlnAz0LSj3x3Eov1XhepXjr5JQcPWM9VcW0PGn59Mk47cpRhmgWio/0TeeqBkZLJVgjjV/6VjnUuE/yH90af
X-Gm-Message-State: AOJu0YzTiACmpB55lpSBgJ9mmT7yJUaC+cAaPsjnSRVF+AP2p7V+yGz9
	E9KuCNwXZpuUXtKhzexLUGRcGDPaa7wPW8PxGVeW+B7CwKug5CHmFS9Zee+MlXlg/E6rXESLzvB
	PLCoSQPdpGYZtV/RmNhFc1hAMwP5+c5yWf8+f7Cqqc2ti3H+5b7jj/xmd7TCTPA==
X-Received: by 2002:adf:f689:0:b0:362:d7ac:ae70 with SMTP id ffacd0b85a97d-36bb358fd39mr544354f8f.5.1722499594271;
        Thu, 01 Aug 2024 01:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdQkA9Thfc/zZtwRGa6zF8YZ/zBF7A8+btq9cjaLSxpyF6gczDx4HontSXF8Yig0G3FrgBDA==
X-Received: by 2002:adf:f689:0:b0:362:d7ac:ae70 with SMTP id ffacd0b85a97d-36bb358fd39mr544300f8f.5.1722499593669;
        Thu, 01 Aug 2024 01:06:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:5c00:e650:bcd7:e2a0:54fe? (p200300cbc7075c00e650bcd7e2a054fe.dip0.t-ipconnect.de. [2003:cb:c707:5c00:e650:bcd7:e2a0:54fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0113sm18763970f8f.14.2024.08.01.01.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 01:06:33 -0700 (PDT)
Message-ID: <a530a614-41a3-4bd1-a2df-40ade7eca002@redhat.com>
Date: Thu, 1 Aug 2024 10:06:30 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] mm: introduce MADV_DEMOTE/MADV_PROMOTE
To: BiscuitOS Broiler <zhang.renze@h3c.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, James.Bottomley@HansenPartnership.com, deller@gmx.de,
 linux-parisc@vger.kernel.org, tsbogend@alpha.franken.de,
 rdunlap@infradead.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
 richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 linux-alpha@vger.kernel.org, jiaoxupo@h3c.com, zhou.haofan@h3c.com
References: <20240801075610.12351-1-zhang.renze@h3c.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240801075610.12351-1-zhang.renze@h3c.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.08.24 09:56, BiscuitOS Broiler wrote:
> Sure, here's the Scalable Tiered Memory Control (STMC)
> 
> **Background**
> 
> In the era when artificial intelligence, big data analytics, and
> machine learning have become mainstream research topics and
> application scenarios, the demand for high-capacity and high-
> bandwidth memory in computers has become increasingly important.
> The emergence of CXL (Compute Express Link) provides the
> possibility of high-capacity memory. Although CXL TYPE3 devices
> can provide large memory capacities, their access speed is lower
> than traditional DRAM due to hardware architecture limitations.
> 
> To enjoy the large capacity brought by CXL memory while minimizing
> the impact of high latency, Linux has introduced the Tiered Memory
> architecture. In the Tiered Memory architecture, CXL memory is
> treated as an independent, slower NUMA NODE, while DRAM is
> considered as a relatively faster NUMA NODE. Applications allocate
> memory from the local node, and Tiered Memory, leveraging memory
> reclamation and NUMA Balancing mechanisms, can transparently demote
> physical pages not recently accessed by user processes to the slower
> CXL NUMA NODE. However, when user processes re-access the demoted
> memory, the Tiered Memory mechanism will, based on certain logic,
> decide whether to promote the demoted physical pages back to the
> fast NUMA NODE. If the promotion is successful, the memory accessed
> by the user process will reside in DRAM; otherwise, it will reside in
> the CXL NODE. Through the Tiered Memory mechanism, Linux balances
> betweenlarge memory capacity and latency, striving to maintain an
> equilibrium for applications.
> 
> **Problem**
> Although Tiered Memory strives to balance between large capacity and
> latency, specific scenarios can lead to the following issues:
> 
>    1. In scenarios requiring massive computations, if data is heavily
>       stored in CXL slow memory and Tiered Memory cannot promptly
>       promote this memory to fast DRAM, it will significantly impact
>       program performance.
>    2. Similar to the scenario described in point 1, if Tiered Memory
>       decides to promote these physical pages to fast DRAM NODE, but
>       due to limitations in the DRAM NODE promote ratio, these physical
>       pages cannot be promoted. Consequently, the program will keep
>       running in slow memory.
>    3. After an application finishes computing on a large block of fast
>       memory, it may not immediately re-access it. Hence, this memory
>       can only wait for the memory reclamation mechanism to demote it.
>    4. Similar to the scenario described in point 3, if the demotion
>       speed is slow, these cold pages will occupy the promotion
>       resources, preventing some eligible slow pages from being
>       immediately promoted, severely affecting application efficiency.
> 
> **Solution**
> We propose the **Scalable Tiered Memory Control (STMC)** mechanism,
> which delegates the authority of promoting and demoting memory to the
> application. The principle is simple, as follows:
> 
>    1. When an application is preparing for computation, it can promote
>       the memory it needs to use or ensure the memory resides on a fast
>       NODE.
>    2. When an application will not use the memory shortly, it can
>       immediately demote the memory to slow memory, freeing up valuable
>       promotion resources.
> 
> STMC mechanism is implemented through the madvise system call, providing
> two new advice options: MADV_DEMOTE and MADV_PROMOTE. MADV_DEMOTE
> advises demote the physical memory to the node where slow memory
> resides; this advice only fails if there is no free physical memory on
> the slow memory node. MADV_PROMOTE advises retaining the physical memory
> in the fast memory; this advice only fails if there are no promotion
> slots available on the fast memory node. Benefits brought by STMC
> include:
> 
>    1. The STMC mechanism is a variant of on-demand memory management
>       designed to let applications enjoy fast memory as much as possible,
>       while actively demoting to slow memory when not in use, thus
>       freeing up promotion slots for the NODE and allowing it to run in
>       an optimized Tiered Memory environment.
>    2. The STMC mechanism better balances large capacity and latency.
> 
> **Shortcomings of STMC**
> The STMC mechanism requires the caller to manage memory demotion and
> promotion. If the memory is not promptly demoting after an promotion,
> it may cause issues similar to memory leaks
Ehm, that sounds scary. Can you elaborate what's happening here and why 
it is "similar to memory leaks"?


Can you also point out why migrate_pages() is not suitable? I would 
assume demote/promote is in essence simply migrating memory between nodes.

-- 
Cheers,

David / dhildenb


