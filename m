Return-Path: <linux-parisc+bounces-3954-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8D2B3E8C0
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 17:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5EFA7A1FE4
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 15:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B95B35CEC1;
	Mon,  1 Sep 2025 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="IyVq172b"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF393451DA
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 15:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739193; cv=none; b=Fm5dlZvAMmOw+FSWhKxiLG26TNbA6vrH4/uvdL8+yXDv2qIBza2dPnOJyeNSte7Rr3L9P9A5TfbjTu9h04axaGtBNTDJZRSdK08DNKUwGipegV4d5bEFVxpEnXQZ7f1q4/+OB/85GDzwVVsx1roBBDmWO5WK1SnUY+ckBuZhFRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739193; c=relaxed/simple;
	bh=RTksJ8/0/nMOSHK1v6hFgH7Xl8rur3P7qYdlo1+hL9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1+arlffir18A5JxRJTdLqFJZkmmlgmcCBGJLlR5l8KS31jkeQjYLR5h1ZOSZ+iaIxtD0sfid+KXPtDeRhmxIDIpZd3igVlO/RqPSJOSYFhBPtIVgxf9LokEGpgofxk5e/1vZBsZFR0ru000mYY0SuSk1/xcdwzgYueHAmCYKfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=IyVq172b; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78ead12so724122866b.1
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756739189; x=1757343989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bwNSdY68Wls82Q0k25WMNjJlHUk0r0pQNA4NzN+C5M=;
        b=IyVq172bBaLcYBrl9lLB+7k/X6SfaztrXkqA6O0iqHoUsJ4lzBzbgcL9gvPUNB90wF
         V98plQRUO8aCDpp1TxjvHB4sNQbfgVaU1r6A/qMFGeOAwt3007eIRCKb6cX8QhW3JTl3
         /FMlQvPXhq074a/+q2pHf4fx0DL++gG4yrr5GeNqQvOsdLHbO21enQjAtsjibvnznilV
         r3fSbXiowoecUTw+tHR9UJ8TSH88rZurYZBrNKjX5xezi1TPDwQbmPIWhgi3iYkqLkHz
         iS/KNmAY4cfbOl7YDy7grDQCm8X9R8g9PgMFiSlE285UcKhVXiLstSkvjyjuTitCT+7f
         7b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756739189; x=1757343989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bwNSdY68Wls82Q0k25WMNjJlHUk0r0pQNA4NzN+C5M=;
        b=eHjmnI38Ysn3gZphCIgWLnJc3pvzhzBAmyLHR/YQmCzdgdZK+ydckzVbItKqWc62vn
         H8j4Uk0CXbhO+ieIhEmCI/yLHMtsoabiCm+wNXMavEkkGOoQPHfnUstmGv5OmPY/boNY
         I/tDeAJ1fYjODqU0Fx8J9UH022jAgfO31cHPj7ffttn9AJ4Z94zEaCB0b8d4/3BkZPSs
         4b7epUUeEMGCJVKQLkYUd9AV8gw3uRBlpRrSNl7wL2e8Uq5nrREiHR+fYu9YAuKrrwSd
         Bz5SDQeXwH9zZU2jKrufRTjJJMTwDD8edg0H5pAEu3amv7c4fHfBYWuffFljYor9Jj/p
         qtZg==
X-Forwarded-Encrypted: i=1; AJvYcCVLopJ63JrTGiwtdpgT4opyAGwfArA7A5veUrgiU9xQdmfERwcGR/ogVQcMd1V2m8zTuAOsK0j4fLC+PM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuzBxYwQoL2XPNSrk/ZTOJLNOG/5ki2PFtOyITRLpP7NQWdE/c
	CabuVPbODJQ8nBUCgCkApCxksPt7UlAWY7oIp9Q9Zm1yURypYkVX4r20OezY3m7Yu3kjomL6K7Q
	mJK/6d+OOiK9/MkEr+R1pzloCvj7GiEwo6wAouq1How==
X-Gm-Gg: ASbGncvqOnh2qCT60bn/pAPiWzUBZe7gIBkzfvy7v3UIbmDGdsQ0OddHdHYsPge6Ar4
	Lvux2dnn6LiYDHBXDKuCZMvaLmLv31fPcQfBHnZj8X9Ht7L/h7D3UKbfu1QXUy/bRr0tmbAX4oJ
	LtHKDjqreNJz+PQ7CQNIIX+5/csVqn5TOqfbdg2a+CPc+883BkPM48BQW8nZ+X+02xBsJ70cMr+
	ExZkQh08Y9XWUtbLqjrUcwLY/FAEzZMm3EqzD9OL8GG1Q==
X-Google-Smtp-Source: AGHT+IG0FxeUic5SFzE3UNYIN3B9+gaajPRoU8Y0dXCHXgh8kVRRqajKZHy7y0TqbZFDzgzomSvfHMhYlurHNOihACs=
X-Received: by 2002:a17:907:1b10:b0:afe:85d5:a318 with SMTP id
 a640c23a62f3a-b01d9755f83mr810176666b.36.1756739188996; Mon, 01 Sep 2025
 08:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901123028.3383461-1-max.kellermann@ionos.com>
 <20250901123028.3383461-9-max.kellermann@ionos.com> <2ad655ca-7003-4030-bb2d-1c4bcfda30cc@redhat.com>
In-Reply-To: <2ad655ca-7003-4030-bb2d-1c4bcfda30cc@redhat.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 1 Sep 2025 17:06:18 +0200
X-Gm-Features: Ac12FXwds-_H2NdWifPwev4VbqOwXfa3OcMVFnDeIo9bGQG09tjqsarnzZrb6S4
Message-ID: <CAKPOu+-_bPwE4sCcb6n-nfi3nWy6L0gBAoHgRz3qwdUHByE_Lg@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] mm: constify arch_pick_mmap_layout() for
 improved const-correctness
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, yuanchu@google.com, 
	willy@infradead.org, hughd@google.com, mhocko@suse.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	vishal.moola@gmail.com, linux@armlinux.org.uk, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net, 
	andreas@gaisler.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, weixugc@google.com, 
	baolin.wang@linux.alibaba.com, rientjes@google.com, shakeel.butt@linux.dev, 
	thuth@redhat.com, broonie@kernel.org, osalvador@suse.de, jfalempe@redhat.com, 
	mpe@ellerman.id.au, nysal@linux.ibm.com, linux-arm-kernel@lists.infradead.org, 
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 3:58=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
> > index 2201da0afecc..0232d983b715 100644
> > --- a/include/linux/sched/mm.h
> > +++ b/include/linux/sched/mm.h
> > @@ -178,7 +178,7 @@ static inline void mm_update_next_owner(struct mm_s=
truct *mm)
> >   #endif
> >
> >   extern void arch_pick_mmap_layout(struct mm_struct *mm,
> > -                               struct rlimit *rlim_stack);
> > +                               const struct rlimit *rlim_stack);
> >
> >   unsigned long
> >   arch_get_unmapped_area(struct file *filp, unsigned long addr,
> > @@ -211,7 +211,7 @@ generic_get_unmapped_area_topdown(struct file *filp=
, unsigned long addr,
> >                                 unsigned long flags, vm_flags_t vm_flag=
s);
> >   #else
> >   static inline void arch_pick_mmap_layout(struct mm_struct *mm,
> > -                                      struct rlimit *rlim_stack) {}
> > +                                      const struct rlimit *rlim_stack)=
 {}
> >   #endif
>
> Should both these cases also use *const?
>
> (for the latter we probably don't care either, but maybe just to be
> consistent)

Actually, it would *only* make sense on the latter, because the former
is a prototype...

