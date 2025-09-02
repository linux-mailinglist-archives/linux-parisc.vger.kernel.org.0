Return-Path: <linux-parisc+bounces-3997-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EECEB3F80F
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Sep 2025 10:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41FC83B29CC
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Sep 2025 08:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8EA2E8B66;
	Tue,  2 Sep 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WHpQGuJr"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F62E8B7C
	for <linux-parisc@vger.kernel.org>; Tue,  2 Sep 2025 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756800922; cv=none; b=e8Z39kjC0UQKxb3k5dgFGdXxi5IyPyXapEnsUz++6UjXK+ERoKC0uSJBBao6VGKbp1Z+ycmXJl+qgwzPhXNaXHnG5D/Fp37lTC3qET0oPdnOfVw4y0+kZMywhxfDFev0y50g76iAkOaZyRyuehJiXqh08+borVyb9HDR2tGRnO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756800922; c=relaxed/simple;
	bh=nlvpDZpVsMSgg6ylECp9wiLPXOziu9eL4qa/tmhy99E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhHHZXuhQ9Pb61X4o/2uAbNbcZH6pcyc0uKcCpoqULPb82wUSlCeZtzFQdcP4Yk7NcvavJwLPiqI2nJDifrWk7Wh8gU8ManaZq02T0G0EU2t+fzEIBN4qEH/awsF4X3AszyJFWWQOiuYtw4zjrFj0ad91ES9YhITFpP1lo/gkRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WHpQGuJr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756800920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RogoUtOEfOYQJN4afGzglkQECVqWaZjyfEy0cHwYDVI=;
	b=WHpQGuJr5YfQvCjea+ITojT0FIlv7EOUoIFLjeN+PNtnEF9Iw+tjqkyKU0ExuDNpI3avMe
	E/Sacpeaesnxs3w/8RKZfJNleO/Hr60zt9aZbY29AofO2A4zMhivn/VvGbmfoSdw5oMq5s
	MoIFQRfozLSVqZ5VoawMS4IuzdXaCxk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-RwT0DbVcNcqY8y147ZsotQ-1; Tue, 02 Sep 2025 04:15:17 -0400
X-MC-Unique: RwT0DbVcNcqY8y147ZsotQ-1
X-Mimecast-MFC-AGG-ID: RwT0DbVcNcqY8y147ZsotQ_1756800912
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b7d497abbso29932875e9.0
        for <linux-parisc@vger.kernel.org>; Tue, 02 Sep 2025 01:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756800912; x=1757405712;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RogoUtOEfOYQJN4afGzglkQECVqWaZjyfEy0cHwYDVI=;
        b=p+JSNVQyksw64mr6q9y20cTrUoNiUKOPFRifavSuUpc4ca7b5uXQvyKhDgzvynaKif
         hivMglbP6kCngMRxJg/SZgJrY4ZzZBSKtrvVhME4CoKDlGiDOsmIKUi2dTYL0GcYBX0l
         aprCO66mgv/V6qhd6/2mszYFBsBJ5kK2HfoaF7Qcdt3DhPh5f0hYH0Vz5QkieLMtLG/8
         S6krDLkYVuhw4HWxLhqUiHB4SmXF09m23gOFqt/+Ij+3alcwnNVHIgSyrsgP1BN6fNkI
         NK0029GDVFYuVRD0JjgXwOzz1IMfciM2YkrvujHB4jByjiVkkVcCwJiwH3mqLdtyv7U+
         m+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgM1dIeUI2xMXVTnplKcgenKJFaIgEdiLy7t0FgxqlQPtBC1A7VpGnHObNC2ep1ZZb91ze+SiagVKKJqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWqw2/GgyOoBWQ2q2SjB+5er5JwkZVQ65RcF6fi/IBOvgiC983
	v0/PVlsOnv427Zh8EAm7ljCfWIkI+iRyq+cqmR8ntb7Z92XAZPXeLGTvpdwQ/08JN6QRRcEGUNy
	Ex0vHzD3h4OO9io/uRE1UtfsnTDLEb9uQM/cmTi5fpjGox7kJjXuwzWMd4GO35xns7Q==
X-Gm-Gg: ASbGncv/ZZ1OODqRSuh3zm1VZ72S//f888CjvLfFzRWdhzjUvdG1rmW8UYAHwi0uajL
	JrYlWffw9nRu5n1W2O5A1Gj3/27a7qqUKa3NG4OIQCUhJlEf2mT/cgTKLK+OHXAx6Eq+viPJxMz
	4Lto+IVx/A+ek8kwGAAYwLUnm2caXHP5nn6SExxvnk76E7CdCqqrUr0y/pSU51E1csJroi7R4Sn
	1+dGzK791DRWCqHDq604QKXgh0FdUg0Fc3Hw8r/vlteuDBeKO8OoOwX1opEssPiJ9L/0esRfx/m
	8dwQJsarT9YGbwPlO4awWNmX67n3lcN2OMhyYaEdYNJhHjg0H+QCMVjzAnrNjqfBC9MtA2y5Wvs
	YZE520iryBBmPCCC9fWNx6eN31BpfktD+RkvaSMvZIv327yRtsCLvyHVD8dtjW8hjOWU=
X-Received: by 2002:a05:6000:2889:b0:3d1:61f0:d256 with SMTP id ffacd0b85a97d-3d1e01d549cmr9068688f8f.42.1756800912121;
        Tue, 02 Sep 2025 01:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZfeVU3LdB4bHgw3FzcrRO99gHX9zuEWOnoc0/0BZioqs0USiyiN4hqenDT8lLo0/e6yv0pQ==
X-Received: by 2002:a05:6000:2889:b0:3d1:61f0:d256 with SMTP id ffacd0b85a97d-3d1e01d549cmr9068645f8f.42.1756800911636;
        Tue, 02 Sep 2025 01:15:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:3f00:731a:f5e5:774e:d40c? (p200300d82f1f3f00731af5e5774ed40c.dip0.t-ipconnect.de. [2003:d8:2f1f:3f00:731a:f5e5:774e:d40c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fba9fbsm18677434f8f.50.2025.09.02.01.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 01:15:11 -0700 (PDT)
Message-ID: <59c1ef6e-fd26-4d95-ae96-1e1f23c789fa@redhat.com>
Date: Tue, 2 Sep 2025 10:15:08 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/12] mm: establish const-correctness for pointer
 parameters
To: Matthew Wilcox <willy@infradead.org>,
 Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, yuanchu@google.com,
 hughd@google.com, mhocko@suse.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, vishal.moola@gmail.com,
 linux@armlinux.org.uk, James.Bottomley@hansenpartnership.com, deller@gmx.de,
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
References: <20250901123028.3383461-1-max.kellermann@ionos.com>
 <aLZbaHf-euLQ0isT@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aLZbaHf-euLQ0isT@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.09.25 04:50, Matthew Wilcox wrote:
> On Mon, Sep 01, 2025 at 02:30:16PM +0200, Max Kellermann wrote:
>> For improved const-correctness.
> 
> SLOW DOWN.
> 
> This series is unimportant churn.  There's no way it should be up to v5
> already.  Wait a freaking week before you send another version.

... while we have v6 already on the list :D

In this case, it was reasonable to follow up rather sooner than later 
(too much drama and v6 now seems to make people happy, I wouldn't want 
that spanning over multiple weeks).

But yeah, too many revisions on a single day.

-- 
Cheers

David / dhildenb


