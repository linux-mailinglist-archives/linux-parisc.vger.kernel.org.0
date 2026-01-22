Return-Path: <linux-parisc+bounces-4502-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KACFEe48cmnpfAAAu9opvQ
	(envelope-from <linux-parisc+bounces-4502-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Jan 2026 16:06:22 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E436859A
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Jan 2026 16:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2823692AF4E
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Jan 2026 14:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFF8346ADC;
	Thu, 22 Jan 2026 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE3JzZyS"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B9C346AC8
	for <linux-parisc@vger.kernel.org>; Thu, 22 Jan 2026 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090441; cv=none; b=VT2SZGPpl6+1amZCyCXIzmkvugZFX6XEvMvpOXQPg6+XdyOb4WtamR1mLeECf9wYSf0ZxcKCBHZoJQaX0khg1XdturwW4HHFImVkS07PfCqO+fuWq49Lv5R3RdN0QE/VlpjESIjeYibTGIKJt1NkjpHLVtESOQ187xocyvmkMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090441; c=relaxed/simple;
	bh=AHSBEaRYfStLiqJd2Yrr0EQ+tzb5DiwinzVPHKX4hIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bv3mi5nAv9SY78re2RV/1vBk3MzcZouX0mhKEssNSGTKiJIRRq3fg4WChGfQrOG4DwuHjC7YaoKv8BQmGGvq1PSJlrRD1snF4RydYBr02xkdf/2G4djM0q1k9Ax341lxO/vwfnCAh8t6S4enQoN2x2NY8qGPzAfbJ4+enfrAqB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE3JzZyS; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so1717486a12.1
        for <linux-parisc@vger.kernel.org>; Thu, 22 Jan 2026 06:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769090436; x=1769695236; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXXllTpn+4j3DQ+o0FpmjiZEdWUg34VA5GPm+3TDwac=;
        b=mE3JzZySbsZNFXrazHRmfkLgXK1G6CICo/45BaSEMmri8qoPvELmkqlJUJuLq8r/cR
         BZuBE98d600tezPM1Ev3Lv6/wgj1maHQPUX5UMH0X7Bb1TL3sUzOm4dc6Ly1PPaTjaqs
         hDxR1qZKtGXBH67ziEpREgFLFgUdSeobUOgLHgZlfBxr0178fS+J4nD8OTVboWYl3pQt
         VfUZvZP7nVL41fRWgaHUJ4aLvHkvxOcT8JiNj8YivRx/Teoe0yOHaPjpxbMoqspGXGs4
         vz+mawD5KrfuWoRGegQ0STZROYkcYTyB9Mb6z3UbWWha+b7zhPD0i037Q32eJSQYTC72
         KJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769090436; x=1769695236;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXXllTpn+4j3DQ+o0FpmjiZEdWUg34VA5GPm+3TDwac=;
        b=bOV7lK/rG39cnnCHueajPASOteeh1E7dFPC58iDpCLr4plI2qKz847uHWG04vHn8/x
         RAdvpKJwexNYef6PcQE6r7sk/cl5dNXD22iRiyO64ACo5yqlvahfP27YdBiDEEN+BZ/j
         VpzO8bgdcHe3yh+DPmDBbzUAotHqIFX6UUbM5FEHxFgd3XpipgVW24y7BNZ/1L+g3eeo
         4TlThnwF13FliNaFU6UqGQ0AiyyQtdR0FUmNmQmMTGIW+igIkD8HpUNqDn8iOo7caCj4
         HYLCEA2Fd6q1p3eXhMXQRDXCQd2wJ65PAF8uvrSmoD2oEDguhvsleL8nEiovNcOLYa6h
         1pgw==
X-Forwarded-Encrypted: i=1; AJvYcCUnVthZXjDrJQBhdz4bcAmUW7b0gCtZNwYOKNxL+QZ9tsLYM5v7giMwpy1Tl6cAXzTn2j/po1dp0oss/18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjzE+rT/LuKAY30j2OUvHaMes+VXm0cjiyuSjLOfeLSEdAQA8z
	ITzgYqlpjhfEgRe8vRrEsjUt6vE1YLKk76O5LGnvBz7gGzTZrFQF0J3v
X-Gm-Gg: AZuq6aJyMoIszuLY3npWCi5/31YQwuUdoO2ukuGE7KfqDYuXN+t2NrAkdiHo4KqeDpD
	UJTVmK/Em7xibHdaDqiK803QJmCX9GHJFX7rjNSD+PN71UN8HBPN9YGrESFpq6oS0I9ZeUIuw/d
	c8BZi8KOl2IXloPwXeoPVeOJbvWar76XIjcWEv0DZ08saOpusvv4GOZ2PTemKDPU/kjMQyPcS53
	FTe2VCXGtgCaQYjk9rgS6lbG79Xqg4LEvkE5b7SLVn3P0J4KyUpFTspbv1BmhL0NUslbZ0rTtnH
	YInPOZiQe9RHfWOMczKN1iBJeTnUd1Q7BxbgSbbWvc1FP/J4JaHaMpIWgkXHbtmYMd6E04tgvh8
	mD2BoexkGRtDMPob+VRFEU+zN5LRMCowypK/nwbp3kP9v4umx9XUeO5Q78HSu7aelLuRch7FY+8
	W8+67BfkQukQ==
X-Received: by 2002:a17:907:84e:b0:b87:33f3:6042 with SMTP id a640c23a62f3a-b8792d3be6dmr1826205366b.9.1769090435585;
        Thu, 22 Jan 2026 06:00:35 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b884006d3bbsm68748466b.32.2026.01.22.06.00.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jan 2026 06:00:35 -0800 (PST)
Date: Thu, 22 Jan 2026 14:00:34 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, Qi Zheng <qi.zheng@linux.dev>,
	will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
	ioworker0@gmail.com, linmag7@gmail.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
Message-ID: <20260122140034.ymigrfppzwvmcjkr@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
 <20251231094243.zmjs7kgflm7q6k73@master>
 <a3a60bbb-70b7-49ed-abc6-937e6c13d681@linux.dev>
 <20260101020715.45wqnjgcklvjcth3@master>
 <d38fcbe5-8b4a-40bc-b8c8-1c49ccaa9964@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d38fcbe5-8b4a-40bc-b8c8-1c49ccaa9964@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-4502-lists,linux-parisc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[richardweiyang@gmail.com,linux-parisc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,kernel.org,infradead.org,arm.com,linux-foundation.org,vger.kernel.org,kvack.org,lists.linux.dev,lists.infradead.org,bytedance.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[richard.weiyang@gmail.com];
	TAGGED_RCPT(0.00)[linux-parisc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: C5E436859A
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 11:18:52AM +0100, David Hildenbrand (Red Hat) wrote:
>On 1/1/26 03:07, Wei Yang wrote:
>> On Wed, Dec 31, 2025 at 05:52:57PM +0800, Qi Zheng wrote:
>> > 
>> > 
>> > On 12/31/25 5:42 PM, Wei Yang wrote:
>> > > On Wed, Dec 17, 2025 at 05:45:48PM +0800, Qi Zheng wrote:
>> > > > From: Qi Zheng <zhengqi.arch@bytedance.com>
>> > > > 
>> > > > The PT_RECLAIM can work on all architectures that support
>> > > > MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>> > > > MMU_GATHER_RCU_TABLE_FREE.
>> > > > 
>> > > > BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>> > > > to turn it off.
>> > > > 
>> > > > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> > > > ---
>> > > > arch/x86/Kconfig | 1 -
>> > > > mm/Kconfig       | 9 ++-------
>> > > > 2 files changed, 2 insertions(+), 8 deletions(-)
>> > > > 
>> > > > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> > > > index 80527299f859a..0d22da56a71b0 100644
>> > > > --- a/arch/x86/Kconfig
>> > > > +++ b/arch/x86/Kconfig
>> > > > @@ -331,7 +331,6 @@ config X86
>> > > > 	select FUNCTION_ALIGNMENT_4B
>> > > > 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>> > > > 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>> > > > -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>> > > > 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>> > > > 	select SCHED_SMT			if SMP
>> > > > 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>> > > > diff --git a/mm/Kconfig b/mm/Kconfig
>> > > > index bd0ea5454af82..fc00b429b7129 100644
>> > > > --- a/mm/Kconfig
>> > > > +++ b/mm/Kconfig
>> > > > @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>> > > > 	  The architecture has hardware support for userspace shadow call
>> > > >             stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>> > > > 
>> > > > -config ARCH_SUPPORTS_PT_RECLAIM
>> > > > -	def_bool n
>> > > > -
>> > > > config PT_RECLAIM
>> > > > -	bool "reclaim empty user page table pages"
>> > > > -	default y
>> > > > -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>> > > > -	select MMU_GATHER_RCU_TABLE_FREE
>> > > > +	def_bool y
>> > > > +	depends on MMU_GATHER_RCU_TABLE_FREE
>> > > > 	help
>> > > > 	  Try to reclaim empty user page table pages in paths other than munmap
>> > > > 	  and exit_mmap path.
>> > > 
>> > > Hi, Qi
>> > > 
>> > > I am new to PT_RECLAIM, when reading related code I got one question.
>> > > 
>> > > Before this patch,  we could have this config combination:
>> > > 
>> > >       CONFIG_MMU_GATHER_RCU_TABLE_FREE & !CONFIG_PT_RECLAIM
>> > > 
>> > > This means tlb_remove_table_free() is rcu version while tlb_remove_table_one()
>> > > is semi rcu version.
>> > > 
>> > > I am curious could we use rcu version tlb_remove_table_one() for this case?
>> > > Use rcu version tlb_remove_table_one() if CONFIG_MMU_GATHER_RCU_TABLE_FREE. Is
>> > > there some limitation here?
>> > 
>> > I think there's no problem. The rcu version can also ensure that the
>> > fast GUP works well.
>> > 
>> 
>> Thanks for your quick response :-)
>> 
>> And Happy New Year
>> 
>> So my little suggestion is move the definition of __tlb_remove_table_one()
>> under CONFIG_MMU_GATHER_RCU_TABLE_FREE. Do you thinks this would be more
>> clear?
>
>
>Do you mean
>
>diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
>index 2faa23d7f8d42..6aeba4bae68d2 100644
>--- a/mm/mmu_gather.c
>+++ b/mm/mmu_gather.c
>@@ -319,7 +319,7 @@ static inline void tlb_table_invalidate(struct mmu_gather
>*tlb)
>        }
> }
>
>-#ifdef CONFIG_PT_RECLAIM
>+#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
> static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
> {
>        struct ptdesc *ptdesc;
>
>?

Sorry for the late reply.

Yes, and maybe we can move the definition to the 
#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE code block above, then to be next to
tlb_remove_table_free().

So that we always have rcu version when CONFIG_MMU_GATHER_RCU_TABLE_FREE.

>
>-- 
>Cheers
>
>David

-- 
Wei Yang
Help you, Help me

