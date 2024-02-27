Return-Path: <linux-parisc+bounces-710-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FF869E59
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Feb 2024 18:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B54BC280EDC
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Feb 2024 17:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE334EB46;
	Tue, 27 Feb 2024 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="TZyWEU8Y"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC2347A7D
	for <linux-parisc@vger.kernel.org>; Tue, 27 Feb 2024 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709056495; cv=none; b=FvDgSenaMOGNBoDw4j6oogxBP1JKuRZvN/DYjZetUAPTd5TGb2nhzyfQpKVgGGc3+BPx9Yb5RgToo0F2+chb8UTIZHofx8Owcl3VSLubgV+8OXKG9flnrVLbQlLm3bPodutsS52ZtIrW5g4TvgN8cbGAaXeaPKP6QHqALGJLgvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709056495; c=relaxed/simple;
	bh=VUAaY8wxXr5bUffmJpFRqHV2oMwBf/vlf3I5G3UUTGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHLyqNq7cui4VhHOZY3coagXGLRl3ICIwA3EaPBAXOiRkkwqq7epBDez/fbcPZG/zCn6XUdFYyhNf12lAOx/zq6f/GoS/fZgE5bY5yj22154Y1tsl7garJFVN2aLzV8OKNV0nj5RBzuMkouliO+ER5Cc2CamQsOx2BB9+LphNM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=TZyWEU8Y; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5e4613f2b56so3154490a12.1
        for <linux-parisc@vger.kernel.org>; Tue, 27 Feb 2024 09:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709056493; x=1709661293; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIdksP1jXgRqd1isvnR0Pk+ChLgtGPiZTFxnnPSsol0=;
        b=TZyWEU8YoReS0giYCuMX1yk0jFICaJG4jcTNykPXsJyGXS0HB3e575BABK55a37ndj
         RA9Jq1AZc9Fo0YiGhRES7wMMw1hd5DMFGHQmIbl+3dISOBQtnNoB1PIF0EwBR3Q4ud2U
         OgUK7jkuXJnp3DaEEKtIqz8fwdYV34vv3uC4+Vykw0v/ZxuLe28u5alurmnyQyn44Lq8
         SRgnrLEBF004FrIBQTzf3vQhDgxTy0TPu45xbgUTU1pqjb8FghAmkNybbnnA0NFBTSfS
         +lGFOD9+hnorDVSbGrGzyNybkSBySiIWJ8WSecbsgA7IpVJR2kdD8lNv7Y1XqBwsAeaI
         JMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709056493; x=1709661293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIdksP1jXgRqd1isvnR0Pk+ChLgtGPiZTFxnnPSsol0=;
        b=R8FPqYI/Hk+FzKqLtLpE1G/T2vDQ1+Do2yXXYm1oWvddCd9+cCNRvuFLr9mv7siQOk
         u8yRHFMPqcJx1dFWYvPWor96ePjETfMbKfBJ4cC2m77JUBAJdB0qLsE496jhVtjARxX8
         rs4r1EtwTn8wU7CJ7274WV1XbRls6c/l2j2ZnDVvDAG4EZR87gwlUz2yVZ/e3qjgyFMm
         3yfZc9X5xLGR14S8G+JvL+vwAri0bkAVXFQs7BxRQ9p+D3JzSBra8Sq9Zg2K++zCsi6Z
         hi6IAFb7wBJlIP9s0utRDlNxmdPE5mx58fqy0u7zA0wyplrV4OcDzm+3xfCLD0RkNiwu
         uOUw==
X-Forwarded-Encrypted: i=1; AJvYcCUa+Rg1zHi5o+fUnnnoDYjn+3SonEV9KePXdo2gyaMymXEce88dFvH/dvEkfL5/WxQQcfP8UdjdLU5mRbDN8dXev9/D9jRTeTE4T/lP
X-Gm-Message-State: AOJu0Yz1u+g7h1CoFe6w8Q6A6bzMv9rWWIB1iq4VirXOuQKKcJGsu13M
	aUfVdKX2agFFtY6B1Gui8lhnno7+Ls0VWF7tH+L/wisTk2I0oh3m/QF2Qn4tMOA=
X-Google-Smtp-Source: AGHT+IFz6f/uoaRRDlAo9FUesEjMdjsM1i3WorOHOm7Rgb/Bu93+PnLqfHQ9b5gv518bhE6IEAiu6A==
X-Received: by 2002:a17:90a:6f01:b0:299:75aa:8949 with SMTP id d1-20020a17090a6f0100b0029975aa8949mr7822691pjk.22.1709056493179;
        Tue, 27 Feb 2024 09:54:53 -0800 (PST)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id n15-20020a17090ade8f00b002995e9aca72sm6856207pjv.29.2024.02.27.09.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:54:52 -0800 (PST)
Date: Tue, 27 Feb 2024 09:54:49 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Guenter Roeck <linux@roeck-us.net>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v10] lib: checksum: Use aligned accesses for ip_fast_csum
 and csum_ipv6_magic tests
Message-ID: <Zd4h6ZhvLSWfWJG/@ghost>
References: <e11fea7a-e99e-4539-a489-0aa145ee65f0@roeck-us.net>
 <ZdzPgSCTntY7JD5i@shell.armlinux.org.uk>
 <ZdzZ5tk459bgUrgz@ghost>
 <ZdzhRntTHApp0doV@shell.armlinux.org.uk>
 <b13b8847977d4cfa99b6a0c9a0fcbbcf@AcuMS.aculab.com>
 <Zd0b8SDT8hrG/0yW@ghost>
 <cdd09f7a-83b2-41ba-a32c-9886dd79c43e@roeck-us.net>
 <9b4ce664-3ddb-4789-9d5d-8824f9089c48@csgroup.eu>
 <Zd25XWTkDPuIjpF8@shell.armlinux.org.uk>
 <c8ddcc98-acb0-4d2d-828a-8dd12e771b5f@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8ddcc98-acb0-4d2d-828a-8dd12e771b5f@csgroup.eu>

On Tue, Feb 27, 2024 at 11:32:19AM +0000, Christophe Leroy wrote:
> 
> 
> Le 27/02/2024 � 11:28, Russell King (Oracle) a �crit�:
> > On Tue, Feb 27, 2024 at 06:47:38AM +0000, Christophe Leroy wrote:
> >>
> >>
> >> Le 27/02/2024 � 00:48, Guenter Roeck a �crit�:
> >>> On 2/26/24 15:17, Charlie Jenkins wrote:
> >>>> On Mon, Feb 26, 2024 at 10:33:56PM +0000, David Laight wrote:
> >>>>> ...
> >>>>>> I think you misunderstand. "NET_IP_ALIGN offset is what the kernel
> >>>>>> defines to be supported" is a gross misinterpretation. It is not
> >>>>>> "defined to be supported" at all. It is the _preferred_ alignment
> >>>>>> nothing more, nothing less.
> >>>>
> >>>> This distinction is arbitrary in practice, but I am open to being proven
> >>>> wrong if you have data to back up this statement. If the driver chooses
> >>>> to not follow this, then the driver might not work. ARM defines the
> >>>> NET_IP_ALIGN to be 2 to pad out the header to be on the supported
> >>>> alignment. If the driver chooses to pad with one byte instead of 2
> >>>> bytes, the driver may fail to work as the CPU may stall after the
> >>>> misaligned access.
> >>>>
> >>>>>
> >>>>> I'm sure I've seen code that would realign IP headers to a 4 byte
> >>>>> boundary before processing them - but that might not have been in
> >>>>> Linux.
> >>>>>
> >>>>> I'm also sure there are cpu which will fault double length misaligned
> >>>>> memory transfers - which might be used to marginally speed up code.
> >>>>> Assuming more than 4 byte alignment for the IP header is likely
> >>>>> 'wishful thinking'.
> >>>>>
> >>>>> There is plenty of ethernet hardware that can only write frames
> >>>>> to even boundaries and plenty of cpu that fault misaligned accesses.
> >>>>> There are even cases of both on the same silicon die.
> >>>>>
> >>>>> You also pretty much never want a fault handler to fixup misaligned
> >>>>> ethernet frames (or really anything else for that matter).
> >>>>> It is always going to be better to check in the code itself.
> >>>>>
> >>>>> x86 has just made people 'sloppy' :-)
> >>>>>
> >>>>>  ����David
> >>>>>
> >>>>> -
> >>>>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> >>>>> MK1 1PT, UK
> >>>>> Registration No: 1397386 (Wales)
> >>>>>
> >>>>
> >>>> If somebody has a solution they deem to be better, I am happy to change
> >>>> this test case. Otherwise, I would appreciate a maintainer resolving
> >>>> this discussion and apply this fix.
> >>>>
> >>> Agreed.
> >>>
> >>> I do have a couple of patches which add explicit unaligned tests as well as
> >>> corner case tests (which are intended to trigger as many carry overflows
> >>> as possible). Once I get those working reliably, I'll be happy to submit
> >>> them as additional tests.
> >>>
> >>
> >> The functions definitely have to work at least with and without VLAN,
> >> which means the alignment cannot be greater than 4 bytes. That's also
> >> the outcome of the discussion.
> > 
> > Thanks for completely ignoring what I've said. No. The alignment ends up
> > being commonly 2 bytes.
> > 
> > As I've said several times, network drivers do _not_ have to respect
> > NET_IP_ALIGN. There are 32-bit ARM drivers which have a DMA engine in
> > them which can only DMA to a 32-bit aligned address. This means that
> > the start of the ethernet header is placed at a 32-bit aligned address
> > making the IP header misaligned to 32-bit.
> > 
> > I don't see what is so difficult to understand about this... but it
> > seems that my comments on this are being ignored time and time again,
> > and I can only think that those who are ignoring my comments have
> > some alterior motive here.
> > 
> 
> I'm sorry for this misunderstanding. I'm not ignoring what you said at 
> all. I understood that ARM is able to handle unaligned accesses with 
> some exception handlers at worst case and that DMA constraints may lead 
> to the IP header beeing on a 2 bytes alignment only.
> 
> However I also understood from others that some architectures can't 
> handle such a 2 bytes only alignments.
> 
> It's been suggested during the discussion that alignment tests should be 
> added later in a follow-up patch. So for the time being I'm trying to 
> find a compromise and get the existing tests working on all platforms 
> but with a smaller alignment than the 16-bytes alignment brought by 
> Charlie's v10 patch. And a 4 bytes alignment seemed to me to be a good 
> compromise for this fix. The idea is also to make the fix as minimal as 
> possible, unlike Charlie's patch that is churning up the tests quite 
> heavily.

Do you have a list of platforms this is failing on? I haven't seen any
reports that haven't been fixed.

- Charlie

> 
> But maybe I misunderstood some of the discussion and indeed 2 bytes 
> alignment would work on all platforms and only an odd alignment is 
> problematic ?

