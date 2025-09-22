Return-Path: <linux-parisc+bounces-4139-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E35B920CA
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Sep 2025 17:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C8691902EE6
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Sep 2025 15:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96C430C36B;
	Mon, 22 Sep 2025 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jJeOGrLG"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961D30504C
	for <linux-parisc@vger.kernel.org>; Mon, 22 Sep 2025 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758556182; cv=none; b=IzEDZjCSCq8K4hStJehDwwCiUgzGlNCGUqfwSCTEfJ2tvuOQv7kjjB9Ig9V6FyL2nGhr0Ti/MUDyZPkxfgl9TD5uXSrIA2H1RLIMx+eYqTneI50eVsXpCqwPY6/0kmFUKUYC7pr86Dil3bH2p88HNO70LPqFSXinyZKizXWbiP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758556182; c=relaxed/simple;
	bh=pnY7yIXTpkGY3uS9XymIrzISP7ZJeyapBkly5cHR7tQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YShYhXfl8Z5y5cygHyp0EbcOZTVf7yCttnNSg+1tBHaXu6pkivvbNsumvwBaPRi1BeCXY6kUiOLAOUzCAClPddT7/dmURO26mxr0rErGUsQXi9W0HJ/I2AXBP0VdBrJLxeH9RPOCLIXIBILj/lGMbnHtHANCAMpvZDc4cfqhxPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jJeOGrLG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758556179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WywYXktQLEVHQCnoOhp4jbR+ceLDEmxLbtgIxFgQwIk=;
	b=jJeOGrLGKGKcnD6NReFX8XT9IRgiiw3U7aVl/PkHgjVkzgete3ALIPnee4gtLEz+xbBN1l
	qIVRKW7505kIXkixedlnN1eDPEJPpWXA84yP8n5MFMnrx9OhFNGn1+pNuvPfrOzxlPgKak
	IM01wcnsMy8SRy1zilLR0HXTjJBtwpw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-OzBv2fuHOsu3Z9WP8AQ05w-1; Mon, 22 Sep 2025 11:49:36 -0400
X-MC-Unique: OzBv2fuHOsu3Z9WP8AQ05w-1
X-Mimecast-MFC-AGG-ID: OzBv2fuHOsu3Z9WP8AQ05w_1758556175
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b0438a5f20fso313575166b.3
        for <linux-parisc@vger.kernel.org>; Mon, 22 Sep 2025 08:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758556174; x=1759160974;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WywYXktQLEVHQCnoOhp4jbR+ceLDEmxLbtgIxFgQwIk=;
        b=Dex4krGbm2hY11a5/kZ3otavScJ/t6gI21WjdRmFXmxGNL7ByW37fmGXaHC0FcdLIu
         g00zYNuVAeghpX0qlGX/H7nxnlqA2qeAWolUVnnnIBst2wIGzbfmB9rcmQFSY6iFD8L0
         gmeb1Pp92wg8nLIEypcpzLCt1NU5FQHTdtpjwB7U+FqE7G1i/UD3zACPysM71mQrsRMY
         tT+dQze8SEzqyoBmiJaqK0VP70kzR6v8eGCEvu5Z8v7yRlKse/vDTf/RpZyAI2QBuIbt
         cljfT70tEwjQlwAPoLlvluYmz64VtXtcgiUbuBKyIs6t0gb/tddC1ZMzxVkTiNETIrGR
         55+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWs/F7+L25WEp+zVbw5OWPzDrvplbaEAHSWAqUTZMzqc9AfOcmRfxuG1mrUTxUQRov5svcDf9P9xiH5aNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCiclYPzgFiM9Sv0yDtKc+EzPC6YCrZNgRYNloJx7kFM7VV3H
	fJqbZ2cqBvzpTejrqC5bxBRnV0LBMcR4+WZRb3ZEB6bstCBRTTdz7n1yB7pltz22GL15Ij+TkMi
	O8He4H0hcfo2u1ZYbRQAl5SITUwOi8ScO90wp7f7mZKyjLL1He8wVvxOAq0IFx/qn0JliY2gRsQ
	==
X-Gm-Gg: ASbGnct1V4JY7QcEjZHqCVLDZr2x3jF6dQOGgoRP25jxm4SY3A+ZZVTbheG1+APPAfJ
	kDQ6A6/jdTFewK50SoPYhH/vvywQ+hmdslbutbYsJ8T1lSpvUKcX0cp+cdwkAUYm3fiPmkIuP6g
	xgf/R8nIt7eNqHeNR93a27IAq/lJD2uiyI3iD5gQTaa4mG62RZEK7Z8/cueIYGWjA9McNo3S0dY
	PuugjfdZSJm1tP+0Qb7wy/jLJZHI6WyohfpXmbgbFi4V7WircsyDw0s6cZ5iv5z3WyikpI9csjL
	DtHNCX0hp0j7ImEi6SQ2OboB5Uj6hfDm1fdiaEN/cXUwBSB93U8Pa6XJc0rrCqO6B40=
X-Received: by 2002:a17:907:1df2:b0:b2d:b5d3:9623 with SMTP id a640c23a62f3a-b2db5d398c8mr186933866b.54.1758556174286;
        Mon, 22 Sep 2025 08:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9PXzNI7iuT6NoL+4FC5uVdHnMWrw8Q4gLh9w8pt9x5WwEnqsqHm/CAfVJFEadke+VixQp6w==
X-Received: by 2002:a17:907:1df2:b0:b2d:b5d3:9623 with SMTP id a640c23a62f3a-b2db5d398c8mr186931566b.54.1758556173806;
        Mon, 22 Sep 2025 08:49:33 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b288062c045sm590259966b.45.2025.09.22.08.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 08:49:33 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id AA3F1276A38; Mon, 22 Sep 2025 17:49:31 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Helge Deller <deller@gmx.de>, Helge Deller <deller@kernel.org>, David
 Hildenbrand <david@redhat.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Linux Memory Management List <linux-mm@kvack.org>,
 netdev@vger.kernel.org, Linux parisc List <linux-parisc@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH][RESEND][RFC] Fix 32-bit boot failure due inaccurate
 page_pool_page_is_pp()
In-Reply-To: <CAHS8izNMHYuRk9w0BUEbXBob38NVkMOVMmvvcq30TstGFpob6A@mail.gmail.com>
References: <aMSni79s6vCCVCFO@p100> <87zfawvt2f.fsf@toke.dk>
 <f64372ec-c127-457f-b8e2-0f48223bd147@gmx.de>
 <CAHS8izMjKub2cPa9Qqiga96XQ7piq3h0Vb_p+9RzNbBXXeGQrw@mail.gmail.com>
 <87y0qerbld.fsf@toke.dk>
 <CAHS8izOY3aSe96aUQBV76ZRpqj5mXwkPenNvmN6yN0cJmceLUA@mail.gmail.com>
 <87tt11qtl8.fsf@toke.dk>
 <CAHS8izNMHYuRk9w0BUEbXBob38NVkMOVMmvvcq30TstGFpob6A@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 22 Sep 2025 17:49:31 +0200
Message-ID: <87cy7iv65w.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mina Almasry <almasrymina@google.com> writes:

> On Wed, Sep 17, 2025 at 3:09=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen =
<toke@redhat.com> wrote:
>>
>> Mina Almasry <almasrymina@google.com> writes:
>>
>> > On Tue, Sep 16, 2025 at 2:27=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgens=
en <toke@redhat.com> wrote:
>> >>
>> >> Mina Almasry <almasrymina@google.com> writes:
>> >>
>> >> > On Mon, Sep 15, 2025 at 6:08=E2=80=AFAM Helge Deller <deller@gmx.de=
> wrote:
>> >> >>
>> >> >> On 9/15/25 13:44, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> >> >> > Helge Deller <deller@kernel.org> writes:
>> >> >> >
>> >> >> >> Commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unm=
ap them when
>> >> >> >> destroying the pool") changed PP_MAGIC_MASK from 0xFFFFFFFC to =
0xc000007c on
>> >> >> >> 32-bit platforms.
>> >> >> >>
>> >> >> >> The function page_pool_page_is_pp() uses PP_MAGIC_MASK to ident=
ify page pool
>> >> >> >> pages, but the remaining bits are not sufficient to unambiguous=
ly identify
>> >> >> >> such pages any longer.
>> >> >> >
>> >> >> > Why not? What values end up in pp_magic that are mistaken for the
>> >> >> > pp_signature?
>> >> >>
>> >> >> As I wrote, PP_MAGIC_MASK changed from 0xFFFFFFFC to 0xc000007c.
>> >> >> And we have PP_SIGNATURE =3D=3D 0x40  (since POISON_POINTER_DELTA =
is zero on 32-bit platforms).
>> >> >> That means, that before page_pool_page_is_pp() could clearly ident=
ify such pages,
>> >> >> as the (value & 0xFFFFFFFC) =3D=3D 0x40.
>> >> >> So, basically only the 0x40 value indicated a PP page.
>> >> >>
>> >> >> Now with the mask a whole bunch of pointers suddenly qualify as be=
ing a pp page,
>> >> >> just showing a few examples:
>> >> >> 0x01111040
>> >> >> 0x082330C0
>> >> >> 0x03264040
>> >> >> 0x0ad686c0 ....
>> >> >>
>> >> >> For me it crashes immediately at bootup when memblocked pages are =
handed
>> >> >> over to become normal pages.
>> >> >>
>> >> >
>> >> > I tried to take a look to double check here and AFAICT Helge is cor=
rect.
>> >> >
>> >> > Before the breaking patch with PP_MAGIC_MASK=3D=3D0xFFFFFFFC, basic=
ally
>> >> > 0x40 is the only pointer that may be mistaken as a valid pp_magic.
>> >> > AFAICT each bit we 0 in the PP_MAGIC_MASK (aside from the 3 least
>> >> > significant bits), doubles the number of pointers that can be mista=
ken
>> >> > for pp_magic. So with 0xFFFFFFFC, only one value (0x40) can be
>> >> > mistaken as a valid pp_magic, with  0xc000007c AFAICT 2^22 values c=
an
>> >> > be mistaken as pp_magic?
>> >> >
>> >> > I don't know that there is any bits we can take away from
>> >> > PP_MAGIC_MASK I think? As each bit doubles the probablity :(
>> >> >
>> >> > I would usually say we can check the 3 least significant bits to te=
ll
>> >> > if pp_magic is a pointer or not, but pp_magic is unioned with
>> >> > page->lru I believe which will use those bits.
>> >>
>> >> So if the pointers stored in the same field can be any arbitrary valu=
e,
>> >> you are quite right, there is no safe value. The critical assumption =
in
>> >> the bit stuffing scheme is that the pointers stored in the field will
>> >> always be above PAGE_OFFSET, and that PAGE_OFFSET has one (or both) of
>> >> the two top-most bits set (that is what the VMSPLIT reference in the
>> >> comment above the PP_DMA_INDEX_SHIFT definition is alluding to).
>> >>
>> >
>> > I see... but where does the 'PAGE_OFFSET has one (or both) of the two
>> > top-most bits set)' assumption come from? Is it from this code?
>>
>> Well, from me grepping through the code and trying to make sense of all
>> the different cases of the preprocessor and config directives across
>> architectures. Seems I did not quite succeed :/
>>
>> > /*
>> >  * PAGE_OFFSET -- the first address of the first page of memory.
>> >  * When not using MMU this corresponds to the first free page in
>> >  * physical memory (aligned on a page boundary).
>> >  */
>> > #ifdef CONFIG_MMU
>> > #ifdef CONFIG_64BIT
>> > ....
>> > #else
>> > #define PAGE_OFFSET _AC(0xc0000000, UL)
>> > #endif /* CONFIG_64BIT */
>> > #else
>> > #define PAGE_OFFSET ((unsigned long)phys_ram_base)
>> > #endif /* CONFIG_MMU */
>> >
>> > It looks like with !CONFIG_MMU we use phys_ram_base and I'm unable to
>> > confirm that all the values of this have the first 2 bits set. I
>> > wonder if his setup is !CONFIG_MMU indeed.
>>
>> Right, that's certainly one thing I missed. As was the parisc arch
>> thing, as Helge followed up with. Ugh :/
>>
>> > It also looks like pp_magic is also union'd with __folio_index in
>> > struct page, and it looks like the data there is sometimes used as a
>> > pointer and sometimes not.
>>
>> Not according to my pahole:
>>
>> [...]
>>                         union {
>>                                 long unsigned int __folio_index; /*    3=
2     8 */
>> [...]
>>         struct {
>>                         long unsigned int pp_magic;      /*     8     8 =
*/
>>
>> So I think we're good with this, no?
>>
>> So given the above, we could do something equivalent to this, I think?
>>
>> diff --git i/include/linux/mm.h w/include/linux/mm.h
>> index 1ae97a0b8ec7..615aaa19c60c 100644
>> --- i/include/linux/mm.h
>> +++ w/include/linux/mm.h
>> @@ -4175,8 +4175,12 @@ int arch_lock_shadow_stack_status(struct task_str=
uct *t, unsigned long status);
>>   */
>>  #define PP_DMA_INDEX_BITS MIN(32, __ffs(POISON_POINTER_DELTA) - PP_DMA_=
INDEX_SHIFT)
>>  #else
>> +#if PAGE_OFFSET > PP_SIGNATURE
>>  /* Always leave out the topmost two; see above. */
>> -#define PP_DMA_INDEX_BITS MIN(32, BITS_PER_LONG - PP_DMA_INDEX_SHIFT - =
2)
>> +#define PP_DMA_INDEX_BITS MIN(32, __fls(PAGE_OFFSET) - PP_DMA_INDEX_SHI=
FT - 1)
>
> Shouldn't have this been:
>
> #define PP_DMA_INDEX_BITS MIN(32, __ffs(PAGE_OFFSET) - PP_DMA_INDEX_SHIFT)
>
> I.e. you're trying to use the space between the least significant bit
> set in PAGE_OFFSET and the most significant bit set in PP_SIGNATURE.
> Hmm. I'm not sure I understand this, I may be reading wrong.

No, you're right, that was me getting things mixed up; but looks like
you got the gist of it so that's good :)

>> +#else
>> +#define PP_DMA_INDEX_BITS 0
>> +#endif /* PAGE_OFFSET > PP_SIGNATURE */
>>  #endif
>>
>>  #define PP_DMA_INDEX_MASK GENMASK(PP_DMA_INDEX_BITS +  PP_DMA_INDEX_SHI=
FT - 1, \
>>
>>
>> Except that it won't work in this form as-is because PAGE_OFFSET is not
>> always a constant (see the #define PAGE_OFFSET ((unsigned
>> long)phys_ram_base) that your quoted above), so we'll have to turn it
>> into an inline function or something.
>>
>> I'm not sure adding this extra complexity is really worth it, or if we
>> should just go with the '#define PP_DMA_INDEX_BITS 0' when
>> POISON_POINTER_DELTA is unset and leave it at that for the temporary
>> workaround. WDYT?
>>
>
> I think this would work. It still wouldn't handle cases where the data
> in pp_magic ends up used as a non-pointer at all or a pointer to some
> static variable in the code like `.mp_ops =3D &dmabuf_devmem_ops,`
> right? Because these were never allocated from memory so are unrelated
> to PAGE_OFFSET.
>
> But I guess things like that would have been a problem with the old
> code anwyway, so should be of no concern?

Yeah, this relies on the overlapping field only ever being used for
kernel-space pointers; which I believe is the case with page->lru (since
it's a list_head).

I'll see if I can find a way around the "PAGE_OFFSET may be a variable
reference" issue and post a proper patch, hopefully tomorrow.

-Toke


