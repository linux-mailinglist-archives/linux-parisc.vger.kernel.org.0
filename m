Return-Path: <linux-parisc+bounces-4108-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1194B5889A
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Sep 2025 01:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40C543A4753
	for <lists+linux-parisc@lfdr.de>; Mon, 15 Sep 2025 23:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7612D7DC3;
	Mon, 15 Sep 2025 23:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gQwbMWGp"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9318FC86
	for <linux-parisc@vger.kernel.org>; Mon, 15 Sep 2025 23:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757980299; cv=none; b=JQFult5UCbU9xgKFUIjrWfivNA5hvcpxbRhESlli1fYT75+t/0pHHXycWZD9Wenlj/rMsYxprWSgseBM6LKhP8fAu7uI8LKNjI3YI5091qyGfibk4W/MJz0tlAdtI10h4h5hPXJJcYyEQesecigg8qz8RYPZjWnqxd5xk7sdw9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757980299; c=relaxed/simple;
	bh=eliaRJLX7HQmX0oBI6ci9T+Cenfd4Lgby8UQAyIhUoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5/s6n84+KYb9qGuoUms7IvZ1YKykDEoU/sZCnBGROlYnW74lGYlzTtUrVlBxJO/gbwdNRhATsBIl/nf5XcQxItPl4DHwMuoNuavyCNoVIWvkS+/xYvvyxVzR4JTub36pZ7nXiZwOqDdjixFQiR4jSR7CGDHcI/RR50WXXIFyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gQwbMWGp; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-572e153494eso1264e87.1
        for <linux-parisc@vger.kernel.org>; Mon, 15 Sep 2025 16:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757980295; x=1758585095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AW5j7gH90N0KHAK5Rp1VJX/iqgngX55U8vMWYrXM/c=;
        b=gQwbMWGp82H1KIo11wgq/6vCTG2Y1Tm4fiGBO4VXSoC4GURuXLZEug0MClH814pbI2
         I4pmV4VI0PjZqBkQPup3atP8VgcyMCnoSqfxIVSyyT971xyP00BYvnv3hCqVT9tH6P3U
         iTs3c4h1lckno+xM+YWeW83Vx3Kcrv35/Q4TYD/GCyat+4zbL8bH4rTC9HDDWLp+fz+v
         m7CnoBteOICPPR/eJV+UgHizG5qHhZG/VPVtfxEJ1OUHK9dwwOu6/trdLmF1/DKB5XM1
         M4Tih4FKc1/PGaC0qQNBBXMlVj6hlo/SRX+tKa3tYtm7Qab123cj/Fv7lDvkYyyYdL9E
         AxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757980295; x=1758585095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AW5j7gH90N0KHAK5Rp1VJX/iqgngX55U8vMWYrXM/c=;
        b=jSYQlzSY87N6SqVpDAit+ykvvu+95sQiue0ZwxgSrxBegRiVBXYoBqOZuQinClrGsS
         lzTWM2NFi7Cb/bQoKrEFTaBjCNnHfZ5CFiq+RH+t2c12FN66qIR/xQUcj2rDBwzXuu+c
         pM8xirn6u3C4yaG+bAVGklE8WgJbQkvJF3DXiwVDoH5vK0TTFUJ941IUWSfjunpoh5oq
         VhZWL3qryRYT5C7jxMzWNjXsZE+0TwDUjb7PXP3i40xP4lDPBwVsbb8fmx09sL9l3q55
         hW/6z3t154BLHsLR6m4+T6uy0kh6Wv8ABA0xnYnVTlCPQwann2YsKSJOdFh269TTmpUJ
         6feg==
X-Forwarded-Encrypted: i=1; AJvYcCXkkMK3jp7wOZglElLCTA5VL4h0jGDkpKfrgmRyaPinfU29n1qjo0MEGcW+f1TVA/xsxHtXCjnJDmICp8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJJRmV3oMxGB+QQJvDfm4Xo2Bn9Z7RUpDergjbEsHlpQc9pDC
	oz7Hybe/JLa8wBvX6Wk6m3vxwDbk3IirYYHi1EQVrYsloZEyMYq7Zz+vFHeTWMNMxc918GSkvre
	C3YX5Te1fUf1kL2uPxDpkUVid3pJ+I/IXbuF/0i5X
X-Gm-Gg: ASbGncttdfBke8RP5HJYqNMfbx44vriMFeRufCpZoJEO0FHxvR8aGKVjEkxB4nXzcF8
	NEN8aNGRhgiM/KnsSCbJJB5mt0JQbTyWMoJVTQVDu9FQaxs7V8hbCHLCHr26G590yEao0bWa7av
	zUak3OInHe57HTtNVSit32ysCs9/2sxo8dSl5q43G0H5aYzQnb90omLGEiqQi/1Oo4z5VkLzn8T
	SGKN0cRckcoiK4qqPiVWqXRWe7J4oofE7xnihLcJK3t1pvPJDG207A=
X-Google-Smtp-Source: AGHT+IHxvjAgcwmbl7i4qIGx4IZFATPmsddKAtgs9jLnh4/bbrdOaxSwmwp0X3FOGMej3r5ilGUywPi3vDMfM91nRr8=
X-Received: by 2002:ac2:58eb:0:b0:56c:8abf:2f84 with SMTP id
 2adb3069b0e04-575f17cd140mr128995e87.6.1757980295277; Mon, 15 Sep 2025
 16:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMSni79s6vCCVCFO@p100> <87zfawvt2f.fsf@toke.dk> <f64372ec-c127-457f-b8e2-0f48223bd147@gmx.de>
In-Reply-To: <f64372ec-c127-457f-b8e2-0f48223bd147@gmx.de>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 15 Sep 2025 16:51:23 -0700
X-Gm-Features: AS18NWBQSIQoWON_0Lqkp-hzdof6vglmBL66-QqAsvHEfvhsjjn3e7ulAH9_zlI
Message-ID: <CAHS8izMjKub2cPa9Qqiga96XQ7piq3h0Vb_p+9RzNbBXXeGQrw@mail.gmail.com>
Subject: Re: [PATCH][RESEND][RFC] Fix 32-bit boot failure due inaccurate page_pool_page_is_pp()
To: Helge Deller <deller@gmx.de>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Helge Deller <deller@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Linux Memory Management List <linux-mm@kvack.org>, netdev@vger.kernel.org, 
	Linux parisc List <linux-parisc@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 6:08=E2=80=AFAM Helge Deller <deller@gmx.de> wrote:
>
> On 9/15/25 13:44, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> > Helge Deller <deller@kernel.org> writes:
> >
> >> Commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them=
 when
> >> destroying the pool") changed PP_MAGIC_MASK from 0xFFFFFFFC to 0xc0000=
07c on
> >> 32-bit platforms.
> >>
> >> The function page_pool_page_is_pp() uses PP_MAGIC_MASK to identify pag=
e pool
> >> pages, but the remaining bits are not sufficient to unambiguously iden=
tify
> >> such pages any longer.
> >
> > Why not? What values end up in pp_magic that are mistaken for the
> > pp_signature?
>
> As I wrote, PP_MAGIC_MASK changed from 0xFFFFFFFC to 0xc000007c.
> And we have PP_SIGNATURE =3D=3D 0x40  (since POISON_POINTER_DELTA is zero=
 on 32-bit platforms).
> That means, that before page_pool_page_is_pp() could clearly identify suc=
h pages,
> as the (value & 0xFFFFFFFC) =3D=3D 0x40.
> So, basically only the 0x40 value indicated a PP page.
>
> Now with the mask a whole bunch of pointers suddenly qualify as being a p=
p page,
> just showing a few examples:
> 0x01111040
> 0x082330C0
> 0x03264040
> 0x0ad686c0 ....
>
> For me it crashes immediately at bootup when memblocked pages are handed
> over to become normal pages.
>

I tried to take a look to double check here and AFAICT Helge is correct.

Before the breaking patch with PP_MAGIC_MASK=3D=3D0xFFFFFFFC, basically
0x40 is the only pointer that may be mistaken as a valid pp_magic.
AFAICT each bit we 0 in the PP_MAGIC_MASK (aside from the 3 least
significant bits), doubles the number of pointers that can be mistaken
for pp_magic. So with 0xFFFFFFFC, only one value (0x40) can be
mistaken as a valid pp_magic, with  0xc000007c AFAICT 2^22 values can
be mistaken as pp_magic?

I don't know that there is any bits we can take away from
PP_MAGIC_MASK I think? As each bit doubles the probablity :(

I would usually say we can check the 3 least significant bits to tell
if pp_magic is a pointer or not, but pp_magic is unioned with
page->lru I believe which will use those bits.

AFAICT, only proper resolution I see is a revert of the breaking patch
+ reland after we can make pp a page-flag and deprecate using
pp_magic. Sorry about that. Thoughts Toke? Anything better you can
think of here?

--=20
Thanks,
Mina

