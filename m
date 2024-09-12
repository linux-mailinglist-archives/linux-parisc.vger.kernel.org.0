Return-Path: <linux-parisc+bounces-2356-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1D497737B
	for <lists+linux-parisc@lfdr.de>; Thu, 12 Sep 2024 23:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9302B2160B
	for <lists+linux-parisc@lfdr.de>; Thu, 12 Sep 2024 21:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEA21C2450;
	Thu, 12 Sep 2024 21:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PYfzeJNk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A11C244C
	for <linux-parisc@vger.kernel.org>; Thu, 12 Sep 2024 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175767; cv=none; b=G123NkNSXlIorUA8zvR+bRdm0OFht5QFB7S2LQXi8W4JKGvpTGWdomm+ECId8odX6KOGzbii3PdmrI65P8xFvix3cUolSRvgQUf+ElBPHHjIK8yWnpif1Zp2Ye4MQ7b8zEzeq6Lzo718KO94pselkoe+yPLN0e0MeeoLLOo8JMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175767; c=relaxed/simple;
	bh=uwUB51q/k9MKoVysVsXfFJYRoIhfFeIxpLFv0mHnq0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVFls/00SKtm4MDG5X+oG76SCktduEKO3zpkG3eVUrYvp6b+Lp1SQUdR4L28IMhGXsZYjZJKr6jspJj85iSlMjEnrbQwAZ9wTOsCj66hRip6/lb521Jz495d9MRyGnBo2maz870xXOrBVTX17B1swxoi26ichM/zAbBwEMVFtFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PYfzeJNk; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-206b9455460so12026145ad.0
        for <linux-parisc@vger.kernel.org>; Thu, 12 Sep 2024 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726175765; x=1726780565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GAySjmj1C8RnCc99v/BjFAJ8TYbwKWl+6IomlsR+BoI=;
        b=PYfzeJNkeYlagfTcD9k+8Dg1WLO+flkY3zQSaW+8PGOlzq/wp2a9it2QCIq2aqKzVs
         w3vqRJ0ajqaVp2ZNbJp9l5rPY1pq8906LOkUWIGMqk5t+R/VSUAw5UdtxRCPmKmSR+qL
         loW/2SYBtC040oB0A+FZAlR8KlagCM9FMTogwVcqi5kwWMOAY56LWKMgZdK0jvy07aIJ
         BU4pzvCv+gp4Mj45Av2KxiJX5V6gvDGPrJqNMV2L7xqgRwfnDhDkDtEU7BbSLmjS5Kir
         hHS89hng8L0DZmLgw1EITQUXJFGFrhk8eHWuuCNgiy9yeBDUUGtgg6tHc77RSVgkjMxk
         A/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726175765; x=1726780565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAySjmj1C8RnCc99v/BjFAJ8TYbwKWl+6IomlsR+BoI=;
        b=vVSxkGQPWqHXHsMmHHjGPI9ITQCSMLljqkbtwlAGGYASxRRqlRzTho+b6XweD4aK+u
         mSEek+3KMqzSsE4UvsMqH0mNR8y45BemK5GCxxW+e2FZG6ZqxN0ZHau143xMAlrras4A
         glk6Qk60crzA0zcE/mZQvrpO20gHfoxiwb0O54gE9rpRy4+FVe7D3UfPpfLrvif4qgyM
         5Sc/L+04U6t484GFqs2vX1m607LrHkvBmaSg8Xh71sTjxzIf9K/RZurMSb2W/LOJuZ/p
         jvh9dJdu/GcQEUDWULzU2eFk2nC2s1L6a5gusTfKF+boQ6hm1EMsHjoDwt+u02/lJb27
         mjSA==
X-Forwarded-Encrypted: i=1; AJvYcCW+n/8OedUIGhxllvrjSL/WVK6fAeQsU9qlsvAY8mSVe9tjKVFxieLnAC6uh+zPu6gNP2ODvlSu50HSdiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsglFz40pVA0yXE9BlWeGdhZtpiPwjgQ9iMREBv8BV6/78is/M
	Eakzt+vxP0H2lN7TSXo3L75aUa9ijlJenzwMww1s5SgivMXiGNIMH/XOC5KVvdw=
X-Google-Smtp-Source: AGHT+IHUzjdPrj87uHlM3yWrW/J5uo4qx0FxZorL/y/ZhI47SL1dDJtb3OuvF/ucYmZPS3S517PhSQ==
X-Received: by 2002:a17:903:41c9:b0:1fd:6033:f94e with SMTP id d9443c01a7336-2076e61ddabmr75358475ad.27.1726175764569;
        Thu, 12 Sep 2024 14:16:04 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af47662sm18233275ad.93.2024.09.12.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 14:16:03 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:15:59 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuNaD+zAXiAulc0n@ghost>
References: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
 <ZuLIPZId9aHcAY2j@arm.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuLIPZId9aHcAY2j@arm.com>

On Thu, Sep 12, 2024 at 11:53:49AM +0100, Catalin Marinas wrote:
> On Wed, Sep 11, 2024 at 11:18:12PM -0700, Charlie Jenkins wrote:
> > Opting-in to the higher address space is reasonable. However, it is not
> > my preference, because the purpose of this flag is to ensure that
> > allocations do not exceed 47-bits, so it is a clearer ABI to have the
> > applications that want this guarantee to be the ones setting the flag,
> > rather than the applications that want the higher bits setting the flag.
> 
> Yes, this would be ideal. Unfortunately those applications don't know
> they need to set a flag in order to work.

It's not a regression, the applications never worked (on platforms that
do not have this default). The 47-bit default would allow applications
that didn't work to start working at the cost of a non-ideal ABI. That
doesn't seem like a reasonable tradeoff to me.  If applications want to
run on new hardware that has different requirements, shouldn't they be
required to update rather than expect the kernel will solve their
problems for them?

> 
> A slightly better option is to leave the default 47-bit at the kernel
> ABI level and have the libc/dynamic loader issue the prctl(). You can
> control the default with environment variables if needed.

Having glibc set the 47-bit requirement could make it slightly easier
for applications since they would only have to set the environment
variable. After the kernel interface is approved I can look into
supporting that.

- Charlie

> 
> We do something similar in glibc for arm64 MTE. When MTE is enabled, the
> top byte of an allocated pointer contains the tag that must not be
> corrupted. We left the decision to the C library via the
> glibc.mem.tagging tunable (Android has something similar via the app
> manifest). An app can change the default if it wants but if you run with
> old glibc or no environment variable to say otherwise, the default would
> be safe. Distros can set the environment to be the maximum range by
> default if they know the apps included have been upgraded and tested.
> 
> -- 
> Catalin

