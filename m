Return-Path: <linux-parisc+bounces-2816-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 218AB9A915D
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Oct 2024 22:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39C471C21D09
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Oct 2024 20:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F9B1FBF56;
	Mon, 21 Oct 2024 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="acEmK1PQ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692881FDFA2
	for <linux-parisc@vger.kernel.org>; Mon, 21 Oct 2024 20:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543069; cv=none; b=LrsEkP5U8nldqD85G6CrXysLo6LpOPddSMq7vCaEPMqFiC0jN2SucwPKoN3nb+V4NQOal9DW4ujEcqGONMSYWwFONE2NtalkwkobGK+CE2/EBs7sClS6zKrF8Qe5q2r+bYVkAd0MbEgPI5F8VjZY5g8naHA0SPwxZsqHcGswwg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543069; c=relaxed/simple;
	bh=4T2FKoZ4mH+ucoOjwg7YHPEHwCt6rtp5Fs2QjggPzUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fpetX9ZZJ2qbTJf1etnKVbNaWlIlb5ndtDr1z3XccbcjiNaHnuwrpDDtwOJtItWanvyJoSS2HytO/eJJSgSifpiVen96JUvxyGkTTG9s+CqOubY6kbI1PR0X3lD1tht2gOFJySEp6RM1JThWb/Ut3GvEdfYaCztszuL6vYBg8PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=acEmK1PQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729543066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=J0pdqvyCZGSuoD31ctx2SsdibfeZpHT/ebecW+GGQCc=;
	b=acEmK1PQ6uwFb1wdav7ztvTai1sHjwlF6NEl9mOAK/3692ltNU3Qv1xUQkxEYqzVM8Na0Y
	SE12p7zitBoFE5YF9zVrOuXhbkqMsT2czt6wJ7bpCg1lMx1q8iPLBCnL+SwlGIZyqWvDWW
	zCzrBau6mLSHaiFcxBcUSZu5Elsm1/M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-FXUhWB5wPqa6D7CFTNwCgg-1; Mon, 21 Oct 2024 16:37:44 -0400
X-MC-Unique: FXUhWB5wPqa6D7CFTNwCgg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d563a1af4so2303237f8f.2
        for <linux-parisc@vger.kernel.org>; Mon, 21 Oct 2024 13:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729543063; x=1730147863;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J0pdqvyCZGSuoD31ctx2SsdibfeZpHT/ebecW+GGQCc=;
        b=DBeI+yfi7DQnxiukw46Iu36yIFR3RhbyWTFwIrVYva64PK7QSY2VgSCYm9TJmW8CRu
         Q+m+4j3oMeYVh6m1gKgz2+I5/bzt5ugKJE4MI6BT/eAdY9Lsl6eCF8sH9rQyfrXvqUHu
         fNtCp8FqJpXVCuT6l6Fe1OKg48j4PRSj9FV6Q6SDu+aQlhxxsvU00AtbpTCWW+3r8Orq
         97zHmCYsmGZD3e7rtviEMFYHfjT1fx/gZ02KeGVhhZ6XUV/XrqR9C+N1AXB8KoNcWaXu
         KuX09VGMXj4/7qtM2fij66myKBGV6iK6Nmkbfx3230Y+9J6CvMbqbSX+Vu7YHUv7HSWl
         AK3g==
X-Forwarded-Encrypted: i=1; AJvYcCVtDCRSd805yQPJFzCmQlXXcEw5/uKG9zT5QNdIZaa4ElGo1SasXhwBEO50PJkEUFIuIevVF2iJcu3XHm4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5rW6112NB3SR/S6KoyTiJn2K2Xw4j+GZW+AQOi8WWa9B2gGow
	Ib25GaVWCm2eVrCOk27moCEGqyXbRItL+AR5rVzJQp/3MZH/KO3tEDJzZs7vkqPpTUB3bAG2YBO
	aYi/CRp64nKiTBkbQ6aR4NO4emoppymD7CU8GQJ9Jhqbqngzq26CEJwu8TzHpcw==
X-Received: by 2002:adf:e643:0:b0:37d:4e20:9be0 with SMTP id ffacd0b85a97d-37eab6ebdadmr7980215f8f.51.1729543063294;
        Mon, 21 Oct 2024 13:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRpKAC5c6xVw1HVZUSluiOBC9oQK+3adL0UR00BpCUmVvqAx9WFzjCXc6djAwNuS668eKPQA==
X-Received: by 2002:adf:e643:0:b0:37d:4e20:9be0 with SMTP id ffacd0b85a97d-37eab6ebdadmr7980191f8f.51.1729543062921;
        Mon, 21 Oct 2024 13:37:42 -0700 (PDT)
Received: from [192.168.3.141] (p5b0c6747.dip0.t-ipconnect.de. [91.12.103.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a485dcsm5088945f8f.34.2024.10.21.13.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 13:37:41 -0700 (PDT)
Message-ID: <9727ada4-0048-499b-a43f-ac0a625bae5d@redhat.com>
Date: Mon, 21 Oct 2024 22:37:39 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] mm: madvise: implement lightweight guard page
 mechanism
To: Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, "Paul E . McKenney"
 <paulmck@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-arch@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
 linux-kselftest@vger.kernel.org, Sidhartha Kumar
 <sidhartha.kumar@oracle.com>, Jeff Xu <jeffxu@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, linux-api@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>
References: <cover.1729440856.git.lorenzo.stoakes@oracle.com>
 <fce49bbbfe41b82161a37b022c8eb1e6c20e1d85.1729440856.git.lorenzo.stoakes@oracle.com>
 <c37ada68-5bf5-4ca5-9de8-c0838160c443@suse.cz>
 <6c282299-506f-45c9-9ddc-9ef4de582394@redhat.com>
 <fedd19ce-ea15-4ded-a1b5-ff050de15bba@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fedd19ce-ea15-4ded-a1b5-ff050de15bba@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.10.24 22:25, Vlastimil Babka wrote:
> On 10/21/24 22:17, David Hildenbrand wrote:
>> On 21.10.24 22:11, Vlastimil Babka wrote:
>>> On 10/20/24 18:20, Lorenzo Stoakes wrote:
>>>
>>> <snip>
>>>
>>>> +static long madvise_guard_poison(struct vm_area_struct *vma,
>>>> +				 struct vm_area_struct **prev,
>>>> +				 unsigned long start, unsigned long end)
>>>> +{
>>>> +	long err;
>>>> +
>>>> +	*prev = vma;
>>>> +	if (!is_valid_guard_vma(vma, /* allow_locked = */false))
>>>> +		return -EINVAL;
>>>> +
>>>> +	/*
>>>> +	 * If we install poison markers, then the range is no longer
>>>> +	 * empty from a page table perspective and therefore it's
>>>> +	 * appropriate to have an anon_vma.
>>>> +	 *
>>>> +	 * This ensures that on fork, we copy page tables correctly.
>>>> +	 */
>>>> +	err = anon_vma_prepare(vma);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	/*
>>>> +	 * Optimistically try to install the guard poison pages first. If any
>>>> +	 * non-guard pages are encountered, give up and zap the range before
>>>> +	 * trying again.
>>>> +	 */
>>>
>>> Should the page walker become powerful enough to handle this in one go? :)
>>> But sure, if it's too big a task to teach it to zap ptes with all the tlb
>>> flushing etc (I assume it's something page walkers don't do today), it makes
>>> sense to do it this way.
>>> Or we could require userspace to zap first (MADV_DONTNEED), but that would
>>> unnecessarily mean extra syscalls for the use case of an allocator debug
>>> mode that wants to turn freed memory to guards to catch use after free.
>>> So this seems like a good compromise...
>>
>> Yes please, KIS.
> 
> You mean "require userspace to zap first (MADV_DONTNEED)" ?

Yes, I see from Lorenzo's reply that there is apparently some history to 
this (maybe it's all nicely summarized in the cover letter / this patch, 
have to dig further).

Not sure yet what the problem is, I would have thought it's all 
protected by the PTL, and concurrent faults are user space doing 
something stupid and we'd detect it.

Have to do some more reading on this.

> 
> I'd normally agree with the KIS principle, but..
> 
>> We can always implement support for that later if
> 
> it would either mean later we change behavior (installing guards on
> non-zapped PTEs would have to be an error now but maybe start working later,
> which is user observable change thus can break somebody)
> 
>> really required (leave behavior open when documenting).
> 
> and leaving it open when documenting doesn't really mean anything for the
> "we don't break userspace" promise vs what the implementation actually does.

Not quite I think. You could start return -EEXIST or -EOPNOTSUPP and 
document that this can change in the future to succeed if there is 
something. User space can sense support.

Something failing that at one point starts working is not really 
breaking user space, unless someone really *wants* to fail if there is 
already something (e.g., concurrent fault -> bail out instead of hiding it).

Of course, a more elegant solution would be GUARD_INSTALL vs. 
GUARD_FORCE_INSTALL.

.. but again, there seems to be more history to this.

-- 
Cheers,

David / dhildenb


