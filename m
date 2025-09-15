Return-Path: <linux-parisc+bounces-4093-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CBDB578C3
	for <lists+linux-parisc@lfdr.de>; Mon, 15 Sep 2025 13:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A90AD4429A4
	for <lists+linux-parisc@lfdr.de>; Mon, 15 Sep 2025 11:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A992F49F6;
	Mon, 15 Sep 2025 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A/Bg+oES"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C252EA482
	for <linux-parisc@vger.kernel.org>; Mon, 15 Sep 2025 11:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757936672; cv=none; b=o/TaKFXMPR8fbRWiYEPXCmbPJ9w9xfhJEfPnAX2nVy4ZU2KaQekvHzlztJB63DggYSbDln/gzBYu2lOrI0U/HiFefxMIF1prIq9E+EH9qyyrY/IIcOuUXFpB4c4uaJx3p/EzV2JYH4z1z+amrBcapl1F5qrT83jWxEX3PfLjgr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757936672; c=relaxed/simple;
	bh=cNrkaf1zcYZ6OYMY83uyni6z7lKaEV/DOsgxV2yxxOQ=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m39/QUty/U4JL7A9+gx55QyekwEZs3y1iyODBpwKTc0vEd4WcPFj0zUSiMs8CEjvS87iXMcb2Nk1uwDCn4WIaPqj98CgZ4w6ISy1LO4O/QDZvD+ZLJxTxXptoLR/VGJFPTEhygCIEHVMiQjqspgQ4X/9mRaPZoP1WJJz3TGCJMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A/Bg+oES; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757936669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSHPRUFaXeFg56s3ZlnqQHiikskw++1DW2WVyVaExKo=;
	b=A/Bg+oESRCg26BBsfm4gv3DRy4BLgLqJX8s3QEdtpVavxeWOE59GVXGo+QbHOzlxWmLxBG
	Q3OQDsLuccXIvwa7XJfydRQy95hrkAhYYB9twPHnGwH03KUH7HCHVDalNho4dXYLc0G42a
	ksocGzFaxYIiGPc9HEQuQPRsJvxA1LU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-lXCEsqV7MBK_hd5C_NZnjA-1; Mon, 15 Sep 2025 07:44:28 -0400
X-MC-Unique: lXCEsqV7MBK_hd5C_NZnjA-1
X-Mimecast-MFC-AGG-ID: lXCEsqV7MBK_hd5C_NZnjA_1757936667
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b0467f38c91so525198966b.0
        for <linux-parisc@vger.kernel.org>; Mon, 15 Sep 2025 04:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757936667; x=1758541467;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSHPRUFaXeFg56s3ZlnqQHiikskw++1DW2WVyVaExKo=;
        b=mCjZx1w9D+iZOE4BxaZhJ/c/oA2wtscVReo+28pumCzm+fX/tLyGkzR9HxBW8jtDGS
         iDuuA+0kEkUiXsOn+5ic3rOXyqPYpAvaQtKSGTVu0iTWNA/imz9VecmRrzkMUgqYCzOq
         9SX1sfAVjy9xCucWK8l34Ls1Cmk3k1Hn4rhKGjY7IB6ugs7wssRjOYio/cy5J2Cycq2W
         JvzlaUqJIE7to3LpSXt028+Va2Dxb4Yb1uDD6OyGaMZ/xL2wtMgAkvsZUKJtpbr1aMmn
         NksfXrigdczHfWWsKmI2RmfOTpLgP+BfSD6L+4T1h9stLs4WgKx9ApQbaOS9i8+JCt6H
         uvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqxp2AI621JhqxFmCj/aYwGOA4UoSVf4RPNMSMTAz68uZJpBLzy+KhpUg6cAZg+/t//HC5Njg86c1NKaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb4FFJPODI/yyyeDKiu1+6irm9rox07dJtDvCKWxld0kA2iMYl
	qgwv5NfVuZvzSHAR07BewLs+w3J4KhknLxpIvM/H+MsUhhhMDS6lk3/+m9aGBfkJ/enWx6VGx4s
	zEM3SlStuoM0ZkvC+VjsZ+lpBidkLvR/Qj6Vc2fmZVnnomfQ7HUJz2Y+6WZX46YoXgA==
X-Gm-Gg: ASbGncvFImHNuDPmQ+l0rS0Evzsvmg2mLeb8m5RrmMDnAKXnguC5bGc+TFfqzHrqjX4
	wjbsyI5CgO3K/7GIBIeh7o9nz8ERkTRCpuisazu7ACxH7RASgLUiwLUnzMcc3jWWNQcgYEFgBYO
	hERJXlt+ICWsliF/ENWPGOx+Y63jyZzmd+jSn99PPqNnRAmXzb9yw6WoZ6GaJN6npo8OxMqfa4j
	lzEHZL/LGUI/rsPUpPP2bSMHR42XbLKD8/pSeO4nznJtbLEI/I8EIz8GErwb0Mm3X9pUCGKj4zr
	zgpR5jYw55plI/QOP7f+NJM3ji+E3h0yGUlPeCOE1av2uHMDdMayBJxlatIvFsbR
X-Received: by 2002:a17:907:3cd4:b0:b04:626e:f43d with SMTP id a640c23a62f3a-b07c386845emr1107737866b.47.1757936666840;
        Mon, 15 Sep 2025 04:44:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP/rnaPf4TLpT9wQUB5MJEnJsUtYxAdTzEBrkYO+7lF79YJ4d63LszUhAd2mHJ20+wHOss3Q==
X-Received: by 2002:a17:907:3cd4:b0:b04:626e:f43d with SMTP id a640c23a62f3a-b07c386845emr1107735566b.47.1757936666370;
        Mon, 15 Sep 2025 04:44:26 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da289sm914339566b.17.2025.09.15.04.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:44:25 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 9FC69215498; Mon, 15 Sep 2025 13:44:24 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Helge Deller <deller@kernel.org>, David Hildenbrand <david@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Linux Memory Management List <linux-mm@kvack.org>, netdev@vger.kernel.org,
 Linux parisc List <linux-parisc@vger.kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH][RESEND][RFC] Fix 32-bit boot failure due inaccurate
 page_pool_page_is_pp()
In-Reply-To: <aMSni79s6vCCVCFO@p100>
References: <aMSni79s6vCCVCFO@p100>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 15 Sep 2025 13:44:24 +0200
Message-ID: <87zfawvt2f.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Helge Deller <deller@kernel.org> writes:

> Commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them when
> destroying the pool") changed PP_MAGIC_MASK from 0xFFFFFFFC to 0xc000007c on
> 32-bit platforms.
>
> The function page_pool_page_is_pp() uses PP_MAGIC_MASK to identify page pool
> pages, but the remaining bits are not sufficient to unambiguously identify
> such pages any longer.

Why not? What values end up in pp_magic that are mistaken for the
pp_signature?

As indicated by the comment above the definition of the PP_DMA_INDEX_*
definitions, I did put some care into ensuring that the values would not
get mistaken, see specifically this:

(...) On arches where POISON_POINTER_DELTA is
 * 0, we make sure that we leave the six topmost bits empty, as that guarantees
 * we won't mistake a valid kernel pointer for a value we set, regardless of the
 * VMSPLIT setting.

So if that does not hold, I'd like to understand why not?

> So page_pool_page_is_pp() now sometimes wrongly reports pages as page pool
> pages and as such triggers a kernel BUG as it believes it found a page pool
> leak.
>
> There are patches upcoming where page_pool_page_is_pp() will not depend on
> PP_MAGIC_MASK and instead use page flags to identify page pool pages. Until
> those patches are merged, the easiest temporary fix is to disable the check
> on 32-bit platforms.

As Jesper pointed out, we also use this check internally in the network
stack, and the patch as proposed will at least trigger the
DEBUG_NET_WARN_ON_ONCE() in include/net/netmem.h. I think a better
solution would be, as Jesper also alludes to, simply adding more bits to
the mask. For instance, the patch below reserves (somewhat arbitrarily)
six bits instead of two, changing the mask to 0xfc00007c; would that
work?

-Toke

diff --git i/include/linux/mm.h w/include/linux/mm.h
index 1ae97a0b8ec7..17cb8157ba08 100644
--- i/include/linux/mm.h
+++ w/include/linux/mm.h
@@ -4159,12 +4159,12 @@ int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
  * since this value becomes part of PP_SIGNATURE; meaning we can just use the
  * space between the PP_SIGNATURE value (without POISON_POINTER_DELTA), and the
  * lowest bits of POISON_POINTER_DELTA. On arches where POISON_POINTER_DELTA is
- * 0, we make sure that we leave the two topmost bits empty, as that guarantees
+ * 0, we make sure that we leave the six topmost bits empty, as that guarantees
  * we won't mistake a valid kernel pointer for a value we set, regardless of the
  * VMSPLIT setting.
  *
  * Altogether, this means that the number of bits available is constrained by
- * the size of an unsigned long (at the upper end, subtracting two bits per the
+ * the size of an unsigned long (at the upper end, subtracting six bits per the
  * above), and the definition of PP_SIGNATURE (with or without
  * POISON_POINTER_DELTA).
  */
@@ -4175,8 +4175,8 @@ int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
  */
 #define PP_DMA_INDEX_BITS MIN(32, __ffs(POISON_POINTER_DELTA) - PP_DMA_INDEX_SHIFT)
 #else
-/* Always leave out the topmost two; see above. */
-#define PP_DMA_INDEX_BITS MIN(32, BITS_PER_LONG - PP_DMA_INDEX_SHIFT - 2)
+/* Always leave out the topmost six; see above. */
+#define PP_DMA_INDEX_BITS MIN(32, BITS_PER_LONG - PP_DMA_INDEX_SHIFT - 6)
 #endif
 
 #define PP_DMA_INDEX_MASK GENMASK(PP_DMA_INDEX_BITS + PP_DMA_INDEX_SHIFT - 1, \


