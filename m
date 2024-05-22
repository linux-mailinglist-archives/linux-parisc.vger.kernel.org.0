Return-Path: <linux-parisc+bounces-1432-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B568CC8B7
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2024 00:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51DE11C21A07
	for <lists+linux-parisc@lfdr.de>; Wed, 22 May 2024 22:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966407FBD1;
	Wed, 22 May 2024 22:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f98ofxC5"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6523CB
	for <linux-parisc@vger.kernel.org>; Wed, 22 May 2024 22:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716415421; cv=none; b=P/JHjNOGpXcLoXOewovEZlxiu2b/k6W/JlOSEQYyjHw1l05v1SEa4iNU7Wd6wfejtO15QHiLalu5PReSDzw4zTQKAaDYezWzRH9azvTs/9+SjDjN95zb9QpRfCEJ3jQQE/KtgY2u0hIuOLdJpxS8+/vPm5G5XWApX4tNa/aewig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716415421; c=relaxed/simple;
	bh=V/OjKPxD4m8dljSxcrsuVphlD92neLpCIPnWiQftobo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lL6Z/i+SxuvoWkH75oEab1CdCG7DvvA/5996ITnh26Nk1Hzx9Y1c8CSOaHMFpLppLlNXaVR58v3b6mKi0rk4zon/AhoYySWqimboeyU3SuIze447tyCYM+XDbIAY6Az9V2WgKoxS2c1/yo3Px7hi9YjgBrTReZeBsibJl4M7Ku8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f98ofxC5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716415418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B4hXJ6JIsSVK9s0rSIg6c+3f6ReWIevwF2URwvf4CAk=;
	b=f98ofxC5ZKyBMIzg+UVWA2R4Y4ha6TZMNYXePKksOaB2plYcL3un3BhoZbxu7jcbRjtXef
	/A1IHD6dFVXVXUYGPtm5FqZ2s+GPYlyKNcLZ3BQv0tiebcU7pwaBCadEG/3FYW5hRTE2av
	olN06MOme20RGIhDLD7BEpM8ZCY2apk=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-17B0A0-BN6akaNSnho9g8w-1; Wed, 22 May 2024 18:03:36 -0400
X-MC-Unique: 17B0A0-BN6akaNSnho9g8w-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5b23e93f5d0so210804eaf.2
        for <linux-parisc@vger.kernel.org>; Wed, 22 May 2024 15:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716415416; x=1717020216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4hXJ6JIsSVK9s0rSIg6c+3f6ReWIevwF2URwvf4CAk=;
        b=EWfRbuhWkbfU0YXJ93JjmJFtgOv9EJ1pT3axIXL479TCihrulS/Oapnahdd0V9ZU8R
         kyp6r0LvRVMDVkYV3iqhfv/onZfiMSVq8unVERXiKiGjFfszklfsrJIuhq5hhdaao1Pi
         Ah6c1ICSJOqVgRWFDbDTwtXoPyECq4r1TOJItD6BMDGrzHZ3Ti+7GuMCMIrmMrKbTJ9A
         16deFF1BBJiGxze9fNlznD0ecSFoFI62A6CkcqpQbZ6n/6fykfQUzvjpESnEUZwN7Lmf
         r51toJlZtcVlkGplrqqTZA3fUK9/htOUVT6gujnQX2vJIQHBIxGmowCGgTR/ABjNv3m0
         nx6g==
X-Forwarded-Encrypted: i=1; AJvYcCXBitZWkFY6ipM6pXH5wCzQegJC8j1GI0dNaa1h4dMFgOD89hbqbVrWVgNT6gDK4XKSueBvO6nKOGct7nA2Kp0CTIRjqdCUhvONSskt
X-Gm-Message-State: AOJu0YzO+fmn6XrQ0RSWhzNCVbK4Jfp20l++RWqO012JI+kixIa02rrf
	bRuJPFNivMVz0Vrt2MvfcvkZIv4PkO8X9i8PQQH1H0dYM057PzQgcf99HorxZVWW5Ap6kQG+XdO
	kuonhU5ILhxWJKfSujrhJE9XP8utTxE5ROMGFbYxWbIJ4HdGZe6h6VexFKhbbKg==
X-Received: by 2002:a05:6358:998a:b0:190:f30c:3856 with SMTP id e5c5f4694b2df-1979215b528mr285580055d.2.1716415415131;
        Wed, 22 May 2024 15:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlZSZyKnZdnEG0+pNanazMyIfCqIlp5QZYYe1QG8gY0ave2/OHUyQlsME1+uHDBoxePLQG5g==
X-Received: by 2002:a05:6358:998a:b0:190:f30c:3856 with SMTP id e5c5f4694b2df-1979215b528mr285573755d.2.1716415414181;
        Wed, 22 May 2024 15:03:34 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1cd266sm136937796d6.80.2024.05.22.15.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:03:33 -0700 (PDT)
Date: Wed, 22 May 2024 18:03:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Axel Rasmussen <axelrasmussen@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Liu Shixin <liushixin2@huawei.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <Zk5rsvMs6qVPAw52@x1n>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
 <ZkSUaVx3uCIPkpkJ@localhost.localdomain>
 <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
 <20240515183222.GCZkT_tvEffgYtah4T@fat_crate.local>
 <CAJHvVcj+YBpLbjLy+M+b8K7fj0XvFSZLpsuY-RbCCn9ouV1WjQ@mail.gmail.com>
 <20240515201831.GDZkUYlybfejSh79ix@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240515201831.GDZkUYlybfejSh79ix@fat_crate.local>

On Wed, May 15, 2024 at 10:18:31PM +0200, Borislav Petkov wrote:
> So if I were to design this, I'd do it this way:
> 
> 0. guest gets hw poison injected
> 
> 1. it runs memory_failure() and it kills the processes using the page.
> 
> 2. page is marked poisoned on the host so no other guest gets it.
> 
> That's it. No second accesses whatsoever. At least this is how it works
> on baremetal.
> 
> This hw poisoning emulation is just silly and unnecessary.

We (QEMU) haven't yet consumed this.. but I think it makes sense to have
such emulation, as it's slightly different from a real hwpoison.

I think the important bit that's missing in this picture is migration, that
the VM can migrate from one host to another, carrying that poisoned PFN.

Let's assume we have two hosts: src and dst.  Currently VM runs on src
host.

Before migration, there is a real PFN that is bad, MCE injected. When
accesssed by either guest vcpu or host cpu / hypervisor, VM gets killed.
This is so far the same to any process that has a bad page.

However it's possible a VM got migrated _before_ that bad PFN accessed, in
this case the VM is still legal to run, the hypervisor will not migrate
that bad PFN data knowing that its data is invalid.  What it does is it'll
tell dst that "this guest PFN is bad, if guest access it let's crash it".
Then what dst host needs is a way to describe "this guest PFN is bad": the
easiest way is to describe "this VA of the process is bad", meanwhile
there'll be no real page backing that VA anyway, and also no real poisoned
pages.  We want to poison a VA only. That's why an emulation is needed.
Besides that we want to get exactly whatever we'll get for a real hwpoison,
e.g. SIGBUS with the address encoded, then KVM work naturally with that
just like a real MCE.

One other thing we can do is to inject-poison to the VA together with the
page backing it, but that'll pollute a PFN on dst host to be a real bad PFN
and won't be able to be used by the dst OS anymore, so it's less optimal.

Thanks,

-- 
Peter Xu


