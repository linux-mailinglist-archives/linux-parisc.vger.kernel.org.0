Return-Path: <linux-parisc+bounces-3991-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C4B3F793
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Sep 2025 10:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52406481541
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Sep 2025 08:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C79A2E8B6C;
	Tue,  2 Sep 2025 08:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MureTfam"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC292E88BB
	for <linux-parisc@vger.kernel.org>; Tue,  2 Sep 2025 08:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756800283; cv=none; b=g3K+d62Pye6+5R+sUQhiPjzyCusVF3SSxUgYCIxYhEi7QXzAA3mXFTlQ+Vak+Bzu8Ap1u6VXtt2fiRIgWF2cNnw1/OXcGRTAOfBoidAS9lRHElUbCIYMVrSvEO5B3ZuQD5QIAfmHCHymWg1C2pawnjSVak6CLqVLZmkEIkrTxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756800283; c=relaxed/simple;
	bh=TixXyMucQg9+dePO0Ne+94/MuOkd/h8327/+KdJ5y3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CJxj103Si6XB/aNae+oPe2JSkxqxFKobWWWmlGE8XynKWcaRKYsxjZ3aMI50srf/zgOg6zktTJ1sYuNuI661p5fdgvAi02+DwYfTfLuS7CJlLgANFaWcPHNZ896ikfE1MEs4/HOU66W3eaTZEN+hxhdi/12sSAzZmFR3ILAb1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MureTfam; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756800280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EalNFtN+chVt1kWXz+7zLRnU4M2yFGPucN423JGrZeY=;
	b=MureTfamOKk2vF4ZEYMNZHKRtSK3SInOpYzwrQgjxDiEnOReem8TqxwLSsuoStIDP8d019
	+it04sg4cFrwEa60fwTGSwyv/P7B1eZwVFhwC3luX7H3ecoryYhA/sLPCCbFNwSNPEYb1e
	Tm+GnpltEuKJpGaRom8P4xqDcDYFwwI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-wkS1v3vvMKqob6DvglcD-w-1; Tue, 02 Sep 2025 04:04:38 -0400
X-MC-Unique: wkS1v3vvMKqob6DvglcD-w-1
X-Mimecast-MFC-AGG-ID: wkS1v3vvMKqob6DvglcD-w_1756800277
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45b7d84d8a0so13098015e9.1
        for <linux-parisc@vger.kernel.org>; Tue, 02 Sep 2025 01:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756800277; x=1757405077;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EalNFtN+chVt1kWXz+7zLRnU4M2yFGPucN423JGrZeY=;
        b=YSG5jaI0iLAan/7rUUvZaM/Yci4kBHYsJXaJzVylCl7gr36JO+2rDfmHA5WGQyt6zh
         swdI4iRYJLyrrUePxv8GCM7h+UbRGsTEeaW6g2SnUUNEWZ0FFG0fX7yoYHxc/PlseO2Y
         4ovMdYSf4OU3yxzOkrC3G0s4KUhF/ArAKSocJH+1qu+t+vfCx24tryEVfmvWzcNd0Rf9
         L7CrP27P0eM5FmZKXSAb+D51VOYFuTYAU7ryHc8xsxaJKzB23PwBjxB2ku2ix1yBqari
         WegFH/eksiJzG9tk1Y+43U4fAQuu/S6pL5A07W4c9Ws5eHwJ5WdsWx77EDeh0hI/92Xj
         0xtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgGX5cGivBVhr/Zq74vuTBR7Lel9A20wcNYF+izgQgMA2KvMQgeDN8gFOEb7InGcZ04+0lDb4D1x/oW4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63U55Sfm/R1CJjJtxLVCTBsl9slbNV0DvnjMWoCblqm5KZpE7
	6dx896J1S/pNSrLDN3pa8c9M51A0cCeoP2HpeUUTTvaZg2mEqV+JPqpNjd7LHx/b/2ZhePZHeAk
	CSz8mkE3US66g5DRULDNtfnIK7HvK9n8JeN/z1Qe7ZTZk/MXR2EjHMX4MuVAPeV4ehg==
X-Gm-Gg: ASbGncsLbp9jh7/8O8/e9eZ7tyq5xz0JMA7gSB7S1SY7F6MpZU8SZIL2MDbayvUTaSS
	iMC1F1/YMkrFM01DPed/PSwpCuw5au85r5x4Pa8TcRGQwJgPrlV1PuKv80iF632VfDn+Vxl8a0o
	NAmEhW2E3qOI0TvzIBpXngd0npnD61oqStFmMgZDztpii9U9U9gWjyvbLaQ4mNUDd1vPDjceVD+
	s+PQg7VPAzcbiVmcYQSqvU5hRnegy3l4JQh49OQSw9CaKWA4hX3w3IO4l71lb1VsToAVWisl6nR
	UmnFEy27jsY+VcSq4j09SKppwSENm6pYmoTjTt2h5167sH5C6QpwW68mwoXuOC/fnDIFa04OyWS
	6AtzyBaUFH+THQVmKldBweb2bjnHPJu6hA2PVMaAl7mB/lMeAH61Uxn2F0xXZz5i5OYw=
X-Received: by 2002:a05:600c:8b23:b0:459:d5d1:d602 with SMTP id 5b1f17b1804b1-45b8553f3ffmr76826745e9.3.1756800277243;
        Tue, 02 Sep 2025 01:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUEZtP95ugs646PGz4UIdMjajX1YQHCtEc6TeS6pl/GiZHBNAyUJLa/Gk3WYfSoVppsVojEw==
X-Received: by 2002:a05:600c:8b23:b0:459:d5d1:d602 with SMTP id 5b1f17b1804b1-45b8553f3ffmr76826165e9.3.1756800276684;
        Tue, 02 Sep 2025 01:04:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:3f00:731a:f5e5:774e:d40c? (p200300d82f1f3f00731af5e5774ed40c.dip0.t-ipconnect.de. [2003:d8:2f1f:3f00:731a:f5e5:774e:d40c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8d0d106esm41976555e9.2.2025.09.02.01.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 01:04:35 -0700 (PDT)
Message-ID: <dfd5a1e5-b655-484f-8a6c-31bbce6fc79a@redhat.com>
Date: Tue, 2 Sep 2025 10:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/12] parisc: constify mmap_upper_limit() parameter
To: Max Kellermann <max.kellermann@ionos.com>, akpm@linux-foundation.org,
 axelrasmussen@google.com, yuanchu@google.com, willy@infradead.org,
 hughd@google.com, mhocko@suse.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, vishal.moola@gmail.com,
 linux@armlinux.org.uk, James.Bottomley@HansenPartnership.com, deller@gmx.de,
 agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 davem@davemloft.net, andreas@gaisler.com, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org, hpa@zytor.com, chris@zankel.net,
 jcmvbkbc@gmail.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, weixugc@google.com, baolin.wang@linux.alibaba.com,
 rientjes@google.com, shakeel.butt@linux.dev, thuth@redhat.com,
 broonie@kernel.org, osalvador@suse.de, jfalempe@redhat.com,
 mpe@ellerman.id.au, nysal@linux.ibm.com,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20250901205021.3573313-1-max.kellermann@ionos.com>
 <20250901205021.3573313-8-max.kellermann@ionos.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250901205021.3573313-8-max.kellermann@ionos.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.09.25 22:50, Max Kellermann wrote:
> For improved const-correctness.
> 
> This piece is necessary to make the `rlim_stack` parameter to
> mmap_base() const.
> 
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


