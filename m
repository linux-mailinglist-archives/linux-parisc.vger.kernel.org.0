Return-Path: <linux-parisc+bounces-4112-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA57B5922E
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Sep 2025 11:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2078C161DCD
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Sep 2025 09:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2373C280325;
	Tue, 16 Sep 2025 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bHNvd5va"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487D3296BA4
	for <linux-parisc@vger.kernel.org>; Tue, 16 Sep 2025 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758014870; cv=none; b=kSEjJDF31mUiBQmUG5eobWmxqLU2pBGkhEztkFPN+2Kc25yOnnQ1A1kiwsajxgkPe+zq5NRbn3NP5xfYoIDIguYr5O7y3Z5X/JM0NtYwBCrnKZxVUg1lFRh/7phqd2Qo0+PbF52BAtfodGP1+KAloqwBGZ+6aqpyIAqK1dPOZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758014870; c=relaxed/simple;
	bh=f6Hkb2IbHXvzDMjazvLPUHVmBYT9BamRJ6xKHDHBWvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kIfG+Qm7uURKPTbS6g12tznmBkgozCgTaSk7U8b4QcEia2bRfVOHSTWl8k93XUjaLQtiyDUa8+OUrXwFz2FbvREec7VtYVHiYAnMpVwbNE3R9sCT41N0vYoxhMaHB47A17o/ihLs5dtpqgij3jJDXlHaDU+n35TbZ2fsmnGvsyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bHNvd5va; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758014867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J59OiJgG+nalIV3FMKbGlZSlucF0/CWesH+hT77dSmU=;
	b=bHNvd5va2Q/W6oCEz782FceJgXN4pPmBlXu7Fr4BvSm8jXzyEdBkTMrKZEF7Rxd0D6s+qf
	1tncEbsdJ270rpzN2LCMjHZXQStrlHSWxUYVkx1Z4I1tVCqGkbmCCXaD982gwMYHExfY4L
	k8ZEqE0HmO8LG0BGNiTwxMrRnoiM1lE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-9XDebT3bNr6n2M5QoKL_0Q-1; Tue, 16 Sep 2025 05:27:45 -0400
X-MC-Unique: 9XDebT3bNr6n2M5QoKL_0Q-1
X-Mimecast-MFC-AGG-ID: 9XDebT3bNr6n2M5QoKL_0Q_1758014865
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b04a302fb7cso486595766b.3
        for <linux-parisc@vger.kernel.org>; Tue, 16 Sep 2025 02:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758014864; x=1758619664;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J59OiJgG+nalIV3FMKbGlZSlucF0/CWesH+hT77dSmU=;
        b=nxOJq+IiMY5xymLvQC6qEPmKoF4ZYdlAJy4MLihZstwP9t97iK8ln+DF8jusHmeR3x
         HgNHrMhInz+Ngj3K7XNHf8O5sqBKD0B1gLlpnYxGADT9a6H9nqeHHdvsTdFkmdiPRPI1
         1CjI3Paf+Ty8tkVFKbWDdUUX93z28kSSRqQOuEIUgcbFB15/ExnWLCwXxn9Tjlcc/pnG
         wJOiz6pHeh9Fs2oYffFKqZJkSYPdBw5b6qPGrl6EzDjyQ1sZKzf4AePCuTntXX8h2qTp
         GKEja1dD7uqlM6jnibahiEqm3uUfQ59vmEjuAxDBNubrDFVj6/MaQbOx2QiYSecfSNpR
         k/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrghqdRrMchkIt/UY1ZIjh4RLtfMvUaol6/bXtqdaGoR7kNSPu4gu6EBPNIITgM4vZoA7yeDN4ed4uEpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxocgHiMWMMNrLPinOwm6RTBOoDquxcDg32aAdHbp4dMx+ERZO+
	PnxWLjkY2VRSzfYfDsVKsxpBI64OkH8k5t73jWj/cyVbePoz5vOXKEYoOxF81m41Ht1s/mZ5dO4
	VgfFa1ZXMbiSlAmhDyLZBc5i0BMIdo/WlKIpe2Ebt3128ReMldv9gq5MyAkMEGkHC5A==
X-Gm-Gg: ASbGncsoXyi8cQHAHbJm/7B0rKClIxSZKX/VL+HXSvxyZlUWHxzh0pDeSH88K/R5Bbg
	nAGW5HE/zsrY4w3CMRcl/10SiQyiTqOMFwrwBY0/ZgVvBsQXfcOnJgWh2d6zG7x8nd4QGFCq3MT
	kuvLPB585StdknhrIF9zr1Q9w2fTmzTGs5elvZwnsDXj4QdywzAM9Cxyp8oeFXGAmufFTEM9OxQ
	tZhYa1iuhfj2LwtOJPpzw5o24jV0lzTrPRtiwWk70S4MYQeNjbrIzSXrtWrhXp4G1DVEGunubL8
	ug7PpNHPlWos790qamsZrhxDkEc5Euw1+h7vQ8rqoV+wGBNNNk7tmy4HCU5nqwu5
X-Received: by 2002:a17:906:b310:b0:b07:de2c:1268 with SMTP id a640c23a62f3a-b07de2c15famr931579266b.5.1758014864436;
        Tue, 16 Sep 2025 02:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk1ALl6UsSbSFvHQ00Kgc7RvzsxEkP3PZF56LrtF0J0ob9LrtksUQ3RV5zpsIq7u1tOeNfbg==
X-Received: by 2002:a17:906:b310:b0:b07:de2c:1268 with SMTP id a640c23a62f3a-b07de2c15famr931576466b.5.1758014864011;
        Tue, 16 Sep 2025 02:27:44 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b333437bsm1107159566b.95.2025.09.16.02.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:27:43 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 0EDB025C5AA; Tue, 16 Sep 2025 11:27:42 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Mina Almasry <almasrymina@google.com>, Helge Deller <deller@gmx.de>
Cc: Helge Deller <deller@kernel.org>, David Hildenbrand <david@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Linux Memory Management List <linux-mm@kvack.org>, netdev@vger.kernel.org,
 Linux parisc List <linux-parisc@vger.kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH][RESEND][RFC] Fix 32-bit boot failure due inaccurate
 page_pool_page_is_pp()
In-Reply-To: <CAHS8izMjKub2cPa9Qqiga96XQ7piq3h0Vb_p+9RzNbBXXeGQrw@mail.gmail.com>
References: <aMSni79s6vCCVCFO@p100> <87zfawvt2f.fsf@toke.dk>
 <f64372ec-c127-457f-b8e2-0f48223bd147@gmx.de>
 <CAHS8izMjKub2cPa9Qqiga96XQ7piq3h0Vb_p+9RzNbBXXeGQrw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 16 Sep 2025 11:27:42 +0200
Message-ID: <87y0qerbld.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mina Almasry <almasrymina@google.com> writes:

> On Mon, Sep 15, 2025 at 6:08=E2=80=AFAM Helge Deller <deller@gmx.de> wrot=
e:
>>
>> On 9/15/25 13:44, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> > Helge Deller <deller@kernel.org> writes:
>> >
>> >> Commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap the=
m when
>> >> destroying the pool") changed PP_MAGIC_MASK from 0xFFFFFFFC to 0xc000=
007c on
>> >> 32-bit platforms.
>> >>
>> >> The function page_pool_page_is_pp() uses PP_MAGIC_MASK to identify pa=
ge pool
>> >> pages, but the remaining bits are not sufficient to unambiguously ide=
ntify
>> >> such pages any longer.
>> >
>> > Why not? What values end up in pp_magic that are mistaken for the
>> > pp_signature?
>>
>> As I wrote, PP_MAGIC_MASK changed from 0xFFFFFFFC to 0xc000007c.
>> And we have PP_SIGNATURE =3D=3D 0x40  (since POISON_POINTER_DELTA is zer=
o on 32-bit platforms).
>> That means, that before page_pool_page_is_pp() could clearly identify su=
ch pages,
>> as the (value & 0xFFFFFFFC) =3D=3D 0x40.
>> So, basically only the 0x40 value indicated a PP page.
>>
>> Now with the mask a whole bunch of pointers suddenly qualify as being a =
pp page,
>> just showing a few examples:
>> 0x01111040
>> 0x082330C0
>> 0x03264040
>> 0x0ad686c0 ....
>>
>> For me it crashes immediately at bootup when memblocked pages are handed
>> over to become normal pages.
>>
>
> I tried to take a look to double check here and AFAICT Helge is correct.
>
> Before the breaking patch with PP_MAGIC_MASK=3D=3D0xFFFFFFFC, basically
> 0x40 is the only pointer that may be mistaken as a valid pp_magic.
> AFAICT each bit we 0 in the PP_MAGIC_MASK (aside from the 3 least
> significant bits), doubles the number of pointers that can be mistaken
> for pp_magic. So with 0xFFFFFFFC, only one value (0x40) can be
> mistaken as a valid pp_magic, with  0xc000007c AFAICT 2^22 values can
> be mistaken as pp_magic?
>
> I don't know that there is any bits we can take away from
> PP_MAGIC_MASK I think? As each bit doubles the probablity :(
>
> I would usually say we can check the 3 least significant bits to tell
> if pp_magic is a pointer or not, but pp_magic is unioned with
> page->lru I believe which will use those bits.

So if the pointers stored in the same field can be any arbitrary value,
you are quite right, there is no safe value. The critical assumption in
the bit stuffing scheme is that the pointers stored in the field will
always be above PAGE_OFFSET, and that PAGE_OFFSET has one (or both) of
the two top-most bits set (that is what the VMSPLIT reference in the
comment above the PP_DMA_INDEX_SHIFT definition is alluding to).

The crash Helge reported obviously indicates that this assumption
doesn't hold. What I'd like to understand if whether this is because I
have completely misunderstood how things work, or whether it is only on
*some* 32-bit systems that this assumption on the range of kernel
pointers doesn't hold?

> AFAICT, only proper resolution I see is a revert of the breaking patch
> + reland after we can make pp a page-flag and deprecate using
> pp_magic. Sorry about that. Thoughts Toke? Anything better you can
> think of here?

We can just conditionally disable the tracking if we don't have enough
bits? Something like the below (which could maybe be narrowed down
further depending on the answer to my question above).

-Toke


diff --git i/include/linux/mm.h w/include/linux/mm.h
index 1ae97a0b8ec7..3e3b090104d9 100644
--- i/include/linux/mm.h
+++ w/include/linux/mm.h
@@ -4175,8 +4175,8 @@ int arch_lock_shadow_stack_status(struct task_struct =
*t, unsigned long status);
  */
 #define PP_DMA_INDEX_BITS MIN(32, __ffs(POISON_POINTER_DELTA) - PP_DMA_IND=
EX_SHIFT)
 #else
-/* Always leave out the topmost two; see above. */
-#define PP_DMA_INDEX_BITS MIN(32, BITS_PER_LONG - PP_DMA_INDEX_SHIFT - 2)
+/* Can't store the DMA index if we don't have a poison offset */
+#define PP_DMA_INDEX_BITS 0
 #endif
=20
 #define PP_DMA_INDEX_MASK GENMASK(PP_DMA_INDEX_BITS + PP_DMA_INDEX_SHIFT -=
 1, \
diff --git i/net/core/netmem_priv.h w/net/core/netmem_priv.h
index cd95394399b4..afc5a56bba03 100644
--- i/net/core/netmem_priv.h
+++ w/net/core/netmem_priv.h
@@ -38,6 +38,7 @@ static inline void netmem_set_dma_addr(netmem_ref netmem,
=20
 static inline unsigned long netmem_get_dma_index(netmem_ref netmem)
 {
+#if PP_DMA_INDEX_BITS > 0
 	unsigned long magic;
=20
 	if (WARN_ON_ONCE(netmem_is_net_iov(netmem)))
@@ -46,11 +47,13 @@ static inline unsigned long netmem_get_dma_index(netmem=
_ref netmem)
 	magic =3D __netmem_clear_lsb(netmem)->pp_magic;
=20
 	return (magic & PP_DMA_INDEX_MASK) >> PP_DMA_INDEX_SHIFT;
+#endif
 }
=20
 static inline void netmem_set_dma_index(netmem_ref netmem,
 					unsigned long id)
 {
+#if PP_DMA_INDEX_BITS > 0
 	unsigned long magic;
=20
 	if (WARN_ON_ONCE(netmem_is_net_iov(netmem)))
@@ -58,5 +61,6 @@ static inline void netmem_set_dma_index(netmem_ref netmem,
=20
 	magic =3D netmem_get_pp_magic(netmem) | (id << PP_DMA_INDEX_SHIFT);
 	__netmem_clear_lsb(netmem)->pp_magic =3D magic;
+#endif
 }
 #endif
diff --git i/net/core/page_pool.c w/net/core/page_pool.c
index ba70569bd4b0..427fdf92b82c 100644
--- i/net/core/page_pool.c
+++ w/net/core/page_pool.c
@@ -495,6 +495,7 @@ static bool page_pool_dma_map(struct page_pool *pool, n=
etmem_ref netmem, gfp_t g
 		goto unmap_failed;
 	}
=20
+#if PP_DMA_INDEX_BITS > 0
 	if (in_softirq())
 		err =3D xa_alloc(&pool->dma_mapped, &id, netmem_to_page(netmem),
 			       PP_DMA_INDEX_LIMIT, gfp);
@@ -507,6 +508,7 @@ static bool page_pool_dma_map(struct page_pool *pool, n=
etmem_ref netmem, gfp_t g
 	}
=20
 	netmem_set_dma_index(netmem, id);
+#endif
 	page_pool_dma_sync_for_device(pool, netmem, pool->p.max_len);
=20
 	return true;
@@ -688,6 +690,7 @@ static __always_inline void __page_pool_release_netmem_=
dma(struct page_pool *poo
 		 */
 		return;
=20
+#if PP_DMA_INDEX_BITS > 0
 	id =3D netmem_get_dma_index(netmem);
 	if (!id)
 		return;
@@ -698,7 +701,7 @@ static __always_inline void __page_pool_release_netmem_=
dma(struct page_pool *poo
 		old =3D xa_cmpxchg_bh(&pool->dma_mapped, id, page, NULL, 0);
 	if (old !=3D page)
 		return;
-
+#endif
 	dma =3D page_pool_get_dma_addr_netmem(netmem);
=20
 	/* When page is unmapped, it cannot be returned to our pool */


