Return-Path: <linux-parisc+bounces-728-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9721A86A45C
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 01:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAF711C213E5
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 00:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B47536B;
	Wed, 28 Feb 2024 00:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="G0olBR/7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9D363
	for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 00:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709079850; cv=none; b=ERlyw6Anw2mo9ssKFZooMeb8wFB5VoKvODau/GjanfR0VyVgbtgGlW3qGNOLFi2ADBOGS5lD0ZS4G7Qzohs1lQgOejB/2ofVE3priVPiEvSVY6FGv4QgPD0vJsFIp7bPzHAqWDdR77M2Ne/IKslWQhUxNecmyoXYSpDWamEJB0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709079850; c=relaxed/simple;
	bh=3SsDuWj0X+1CAlviyNiAM5PZ4YHxEQBBVSH2FuLqqgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI0eOdObAxBwrhX6ERWTTAYmk0Opd9vvJY4ZMP3fA/67f6I0l3KdEdrERohH6yoG9w6rowXMDzI7jP7nHNDBqv9HgCB69zvkfSNfOE/ux8WKiFsxzxiNZKvMpwn9HcDojJbk5qquCm4nujepvUCQ5pHo3lrgZ3E37OkKAAvLNqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=G0olBR/7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dc49b00bdbso43686585ad.3
        for <linux-parisc@vger.kernel.org>; Tue, 27 Feb 2024 16:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709079848; x=1709684648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6iv04Dkt7tZFI9zaXahrycahhIwPU4ZPmiteAipA/o=;
        b=G0olBR/7e36rt2d8DBvM6QRXSoQaLq38eXjELJZGkd5cr0SAmBB6yQyZp3b5Dpvk2e
         a+rmpjaEnPI6GocBmy21Dhyw2iAvQVwrr69oRHehj8ZzooPCv9PJVYMWGk9ZZRjEe57U
         J8VqQWlwc7U0cADNm+uvsF/UaXxBk/ZB6Is0x7fOFwSc8T8vn29QcDWdjYYmV15MAOiu
         ht22KMcc5X5Svkmy2HDDx2FFchqQitCVDu9KFjJnBoGtb4pH6p205LocyyYR7jEK5x/0
         S7/W4oV1q920wOto+n0fNExRNP+nNV+psvyNPH5SQOnfEOD1Hra6rm6s2/OXh/3cxY9w
         2/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709079848; x=1709684648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6iv04Dkt7tZFI9zaXahrycahhIwPU4ZPmiteAipA/o=;
        b=ITshBYrLV78TS6zXzQBe/YDddQQ9/8xEic9B4GfYs9VIYO6hI4JFFlYFsOSV7KXPPz
         /nCVUQvyohzPyLHXFlrJI70iTrYy1N3v2aLcddWC1SL0m6ByZsa8OM6HKZMiVQJlw65L
         Y6VaObe7LKw4DxuGgcP2ek5c2iI/Wjm6DrdLLoYVFOtUN5tRXmQ3te01Px+GC8itSiHh
         FzOJ49ShA7w8PQZjRiaFRbB6lfWNsptWKUU0CF+IQ3JATZ5kJW1OjysL9SPfYngR+AAl
         cBtMPwehdsLlVuTPGVsuPdacD4xi8esdlk2j2gaMEqfU4z/66Uw34mw0rPZdo69XyhXc
         sPBw==
X-Forwarded-Encrypted: i=1; AJvYcCX9KwX6vwAPlWw+9GEQdd646oGQYopkXW99WCmd81FJYBVZBshbrONOu+z7dVVTtEseNbu5Pd9BV8FrHa68QxxeM9QZOdzDBshOz+Wu
X-Gm-Message-State: AOJu0YzIou4kgNcL+q1ThnmjBwg8vXyW3Fgd4inVZ7ePVq45rUd8ITmO
	ef7R6G4/57uf1J3nbjiFyRkYU89vnlJdaJq/wtmULtrIliWDc3BC2L98QhPnxCQ=
X-Google-Smtp-Source: AGHT+IGLMc9uRF3ZVwoUIS1lRxMHgDIj4ey00zVGV9uFOoNEBv0/G2IIu30jCPmEe06WY5C3nNKZ5g==
X-Received: by 2002:a17:903:2310:b0:1dc:418f:890b with SMTP id d16-20020a170903231000b001dc418f890bmr13941783plh.40.1709079847965;
        Tue, 27 Feb 2024 16:24:07 -0800 (PST)
Received: from ghost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id mh13-20020a17090309cd00b001dc9893b03bsm2105835plb.272.2024.02.27.16.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 16:24:07 -0800 (PST)
Date: Tue, 27 Feb 2024 16:24:05 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
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
Message-ID: <Zd59JXTPPcqJblgD@ghost>
References: <ZdzZ5tk459bgUrgz@ghost>
 <ZdzhRntTHApp0doV@shell.armlinux.org.uk>
 <b13b8847977d4cfa99b6a0c9a0fcbbcf@AcuMS.aculab.com>
 <Zd0b8SDT8hrG/0yW@ghost>
 <cdd09f7a-83b2-41ba-a32c-9886dd79c43e@roeck-us.net>
 <9b4ce664-3ddb-4789-9d5d-8824f9089c48@csgroup.eu>
 <Zd25XWTkDPuIjpF8@shell.armlinux.org.uk>
 <c8ddcc98-acb0-4d2d-828a-8dd12e771b5f@csgroup.eu>
 <Zd4h6ZhvLSWfWJG/@ghost>
 <4d5ce145-22be-4683-b3a9-4de77da87b76@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d5ce145-22be-4683-b3a9-4de77da87b76@roeck-us.net>

On Tue, Feb 27, 2024 at 11:31:01AM -0800, Guenter Roeck wrote:
> On 2/27/24 09:54, Charlie Jenkins wrote:
> 
> > > It's been suggested during the discussion that alignment tests should be
> > > added later in a follow-up patch. So for the time being I'm trying to
> > > find a compromise and get the existing tests working on all platforms
> > > but with a smaller alignment than the 16-bytes alignment brought by
> > > Charlie's v10 patch. And a 4 bytes alignment seemed to me to be a good
> > > compromise for this fix. The idea is also to make the fix as minimal as
> > > possible, unlike Charlie's patch that is churning up the tests quite
> > > heavily.
> > 
> > Do you have a list of platforms this is failing on? I haven't seen any
> > reports that haven't been fixed.
> > 
> 
> This is what I carry locally on top of v6.8-rc6:
> 
> 097b149e4acb parisc: More csum_ipv6_magic fixes
> 15bf67a115eb kunit: Fix again checksum tests on big endian CPUs
> bebe776d36ea parisc: Fix csum_ipv6_magic on 64-bit systems
> 523208f03063 parisc: Fix csum_ipv6_magic on 32-bit systems
> a9dda1971c72 parisc: Fix ip_fast_csum
> 2ad0a6850b64 Revert "sh: Handle calling csum_partial with misaligned data"
> 7113cc414860 lib: checksum: Use aligned accesses for ip_fast_csum and csum_ipv6_magic tests
> 
> I also have
> 0dd01a364cb7 lib: checksum: Add some corner cases to IPv6 checksum tests
> e767cce6598b lib: checksum: Add tests for unaligned IPv6 addresses
> 
> which I may submit or not depending on the outcome of this discussion.
> 
> In other words, parisc and sh4 are currently known to be broken in the
> upstream kernel, with fixes pending. On top of that, arm:mps2-an385
> (probably all arm:nommu systems) crashes hard if csum_ipv6_magic()
> is called with an unaligned address.
> 
> This is the "known" list of failures. I don't currently run kunit tests
> on nios2 or riscv32, for example, nor on any architectures with no qemu
> support.
> 
> On a side note, most architectures don't handle "len + proto" overflows.
> While 'len' is a 32-bit parameter, IPv6 only allows for a 16-bit length
> field. Many implementations of csum_ipv6_magic() specifically do
> not handle such overflows because that would be pointless and require
> extra code for no good reason. The current test code doesn't generate
> such overflows, but its 'len' parameter is almost always larger than
> 16 bit and thus not realistic. Maybe it would make sense to limit
> the range of 'len' to 16 bit when calling csum_ipv6_magic().

Thank you for the suggestion, I can limit len to 16-bit.

- Charlie

> 
> Thanks,
> Guenter
> 

