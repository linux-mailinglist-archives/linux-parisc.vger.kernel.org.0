Return-Path: <linux-parisc+bounces-3148-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C69A08CD5
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Jan 2025 10:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5250B3ABE3F
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Jan 2025 09:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C56120C02F;
	Fri, 10 Jan 2025 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OpFonKHK"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA9209F59
	for <linux-parisc@vger.kernel.org>; Fri, 10 Jan 2025 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502299; cv=none; b=iPyVhY63a4CNbtE8fnORNXprTJ3p5QEp41iF6hu8VOVC/lQPKGA6AX9gA/82N10/G3whv/60pnBER2u5581u8wfmenJQpa/Wt4wxJOccIskn/W5+SMmpNAhbkZM1uLvWgi5JXP31qTLtly4izervQiUGqFKYrUJp+b5KJugsuiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502299; c=relaxed/simple;
	bh=ENLLV/0PrVWHZJnSd10hwquS1U8BMVZB3K1bFjotxyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yoo6BShGSmTHfxcKWnojgilay5TBsHB0/OnjQ6H1FqIza9oXJIf/7aerpHB4NG02hgqW3pqCbpPZDyH6qIp/7nJRCgWjv1EyT9QNGGKNqN8pUkXcAVNBiVIQhBrrCA9mDoGER7tl9tFxbWnDuVpYaJ7iJKtZDm0Abbcw38KUlGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OpFonKHK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736502296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4Kw1qoNYerqhNjh25Dgp7jdmE++mW9Fl3ZiJ8T3co8=;
	b=OpFonKHK4rsGIFf7HSuUlaFhBRRdsLlK1R0arRX8Qgj5U/1r5D9F44B4TYsKgwx49xHb+n
	5vBk4tEV8CbMFGi4NRmAKUmHTkpEW8Vd0dtx1wt9VRXgkCiiKSc63/ZnsFhVqgMtiikhQ6
	B6aTnOhYbqo/Q402brHq8KN6vSuJqMs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-H1Vbp-6DNMSisqtHsJcujA-1; Fri, 10 Jan 2025 04:44:54 -0500
X-MC-Unique: H1Vbp-6DNMSisqtHsJcujA-1
X-Mimecast-MFC-AGG-ID: H1Vbp-6DNMSisqtHsJcujA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385dcae001fso783578f8f.1
        for <linux-parisc@vger.kernel.org>; Fri, 10 Jan 2025 01:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502293; x=1737107093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4Kw1qoNYerqhNjh25Dgp7jdmE++mW9Fl3ZiJ8T3co8=;
        b=iSRyfGCLRTq3M+X4II9/9Ni6Nna6+RDE6ZH7Ejpx90eOVQpxn63IhkD7lz7TmYRjbg
         zGea1Wlk+2ZVez6Rd0rw1YCkFq5YL+1rx7pi1atPZhcpQOKpMRRWed3tyOvTEazjopLP
         hZfSImiu3jKanIMv98P6fI4ciZwKHXQf2LDoQXlq35ir2vLoKe5eqxa7G3651Iyn1uwc
         HwIdrHy0H7l1DEUNYMmYKiFdV693B+PFrVayu0KV5IEnMo7pwGheIP7kG+ozZ2YWHrn8
         oqZ84hWEO6EBE4oDt8Jkq9yIz2YqeLmdtUUR2lq9i4QLVHZq4lj7x9OMppRC2+DumL/l
         1Y/A==
X-Forwarded-Encrypted: i=1; AJvYcCXgbL11Ja7OanOT4ScQLa+H/LVg3rrtP/dRRna11VUWoJPwKF3sJyB4MrQKzLcrQ8Hrm2q71aB4DTARdY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+mWlusH98wEHOtjJ6GOujfdrJFt0yu24nIu0LO6wAJec4r9N
	2bmIvUHAoSN0X7tYA1t5DL1VjtU5iuaKBRTtIuOeWUn+D2L8uXMhQsREN50tsIUEZ0QnhZNREM1
	c9X/XQL0lY6oa1i6OVqf6MejHrXq0c2/6gtQl0iId74T5hwa1GVXYXswjdn0s
X-Gm-Gg: ASbGncvAZfy9dVhuwk9iJLD8UyQPEq/6dlAkP3DiwlPDSEJ7j4HTVELtBx6br1tGyiS
	qFwdBwS/ROw9w+85KBHfemisST2RM1MPJx0vRFDyxb5iHaKTEPM/dS9E7Qh5naJCJrSEhQGNZHD
	3ybBTv+xM2MZ6SYYXO13g2iAhfyjdjFc3hILMqmrSuXjGUSqoTqiQ7/D5motgCdijEOWtv6qIr5
	bSyqK3TlXEmX+bi6UMSsBR/hZh3aSNKTlO7Nm+SCo31UQstqOW7pTIN+uNjnkpfD83UEz7bjfvS
X-Received: by 2002:a05:6000:709:b0:386:3803:bbd5 with SMTP id ffacd0b85a97d-38a8733a1f9mr9910090f8f.45.1736502293458;
        Fri, 10 Jan 2025 01:44:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWMxVaNXeUTe+wjdV2pCbQXCctILb5vVg9f3+psJOjGS23Sr767uuQBsbyCemBlGukLyZjgw==
X-Received: by 2002:a05:6000:709:b0:386:3803:bbd5 with SMTP id ffacd0b85a97d-38a8733a1f9mr9910059f8f.45.1736502293124;
        Fri, 10 Jan 2025 01:44:53 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e383965sm4140444f8f.31.2025.01.10.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:44:52 -0800 (PST)
Date: Fri, 10 Jan 2025 10:44:51 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	Michal Simek <monstr@monstr.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	chris@zankel.net, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <4ad35w4mrxb4likkqijkivrkom5rpfdja6klb5uoufdjdyjioq@ksxubq4xb7ei>
References: <20250109174540.893098-1-aalbersh@kernel.org>
 <e7deabf6-8bba-45d7-a0f4-395bc8e5aabe@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7deabf6-8bba-45d7-a0f4-395bc8e5aabe@app.fastmail.com>

On 2025-01-09 20:59:45, Arnd Bergmann wrote:
> On Thu, Jan 9, 2025, at 18:45, Andrey Albershteyn wrote:
> >
> >  arch/alpha/kernel/syscalls/syscall.tbl      |   2 +
> >  arch/m68k/kernel/syscalls/syscall.tbl       |   2 +
> >  arch/microblaze/kernel/syscalls/syscall.tbl |   2 +
> >  arch/parisc/kernel/syscalls/syscall.tbl     |   2 +
> >  arch/powerpc/kernel/syscalls/syscall.tbl    |   2 +
> >  arch/s390/kernel/syscalls/syscall.tbl       |   2 +
> >  arch/sh/kernel/syscalls/syscall.tbl         |   2 +
> >  arch/sparc/kernel/syscalls/syscall.tbl      |   2 +
> >  arch/x86/entry/syscalls/syscall_32.tbl      |   2 +
> >  arch/x86/entry/syscalls/syscall_64.tbl      |   2 +
> >  arch/xtensa/kernel/syscalls/syscall.tbl     |   2 +
> 
> You seem to be missing a couple of files here: 
> 
> arch/arm/tools/syscall.tbl
> arch/arm64/tools/syscall_32.tbl
> arch/mips/kernel/syscalls/syscall_n32.tbl
> arch/mips/kernel/syscalls/syscall_n64.tbl
> arch/mips/kernel/syscalls/syscall_o32.tbl
> 
>        Arnd
> 

Thanks! Added

-- 
- Andrey


