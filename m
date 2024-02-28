Return-Path: <linux-parisc+bounces-743-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF5C86B5CA
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 18:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E9441C22CD9
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 17:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E363FBAA;
	Wed, 28 Feb 2024 17:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dv0OfJNd"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE64E3FBB8
	for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709140896; cv=none; b=ImrUYkSnu2eGMLEFJApgyqwlubzz5PsJtwtORjBfFIsm784L+VN8gZ5HaBzff5RTdjOlV2c6t6tbSy/QabKUjPffsKU43G2chtUTjcIV6iNva01xXi6m+F/Rldyp3BJRP0SL0Yic2CJtuXeceRmrDTJV66A1hmaKVJArCBrb29Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709140896; c=relaxed/simple;
	bh=XM399Q8VLvXuDw5uzrGwivCMbFeJ4FieetH05IdWTBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cso2JgkpGqeKx4FqpllS0jbN4kNU9rJyF8tr8TSHqMZ7LK6Df8DPKF3/Pg/oaMRa92lKcf9bRt9Zbd0JbAHGT3o7PbkSHpC2ofFTISt/KLsaTtvOtKEc+jLp/qPkJH5wF9E/u2fx5cPLv9zLe56pUw5M7A73OFNbu0mOGHbMn+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dv0OfJNd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e4d869b019so3046443b3a.0
        for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 09:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709140894; x=1709745694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1bHapS5+5iN8in9GHCNPDr+SpYos985v6N2aaB8ggk=;
        b=Dv0OfJNd0vjGvtw41wUvZJPEkqakxszi4xsSYKDq8yiapJgAOCmPm4J8os/LY5Z1ga
         29m8v4MdT/04TpsqzLc2k/pFWm1SreFcjydJcdYat3/P2N/j5WnV3oW3YBnA0shtdbnU
         Acz84GK3WQceLojwLQUrIDSze1WWHLLhNRtPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709140894; x=1709745694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1bHapS5+5iN8in9GHCNPDr+SpYos985v6N2aaB8ggk=;
        b=qUCltB+i1ezgTIWGfeRSEI0VrKXLR2PDxIqh3ykl0zuK4uG8P03GccXEzZa0Dk/ytg
         Ii3Ok90hgHxd6LUfHBDJefRJrPNZbq+OahLYcGw7t8y2ChE/nwIwkmNzDWdS/kWV7N3Y
         oTgHtPCgSZOPalIKR4ZN4EqC2OO2cEZDz6UqhODGrnOXM+aD0DIyvhe5JVDct+Tnqzt9
         LGfWQlPmEm8fPgl454p9tSBOkOaBApg6Odg+odzqEuJyXFhKdgoQRWJxKxLsqtHpYQXO
         DymGv1+Zxi8ypic4ypyefKBIZtnTIa+ncAahgcE6lHJTDMNGAD47amBzAyltAUcu4l+2
         GHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt7CLio88NvEjePSNfe2FHUwoXhyr+daEXl0fyQwBzAGNnxX4+8qYjUVTwyKf5L2i8ROlHG0OkXmLgE/k9pf95kdkAuwwFRar5WoHM
X-Gm-Message-State: AOJu0YyfFPwSABFJWtHSDXtEc+LRZdMhkVPcnPPcxck/vfDnbk5UpNuV
	hvYKEMigr7vyZDZhmZ+bBlLoVtshrWhTcxs3YQCy3ll7mtcSUumE6azvBBpjcw==
X-Google-Smtp-Source: AGHT+IFxqvM5hQDYAzOob05oGJvol0U6qboX77jQeHs6sC34fTUoZvoLbeslLh+rshINZpV8envxoA==
X-Received: by 2002:aa7:8650:0:b0:6e5:84f6:2a9e with SMTP id a16-20020aa78650000000b006e584f62a9emr91910pfo.31.1709140894116;
        Wed, 28 Feb 2024 09:21:34 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id it1-20020a056a00458100b006e583a649b4sm90257pfb.210.2024.02.28.09.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:21:33 -0800 (PST)
Date: Wed, 28 Feb 2024 09:21:33 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"luto@kernel.org" <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"bp@alien8.de" <bp@alien8.de>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <202402280912.33AEE7A9CF@keescook>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
 <202402271004.7145FDB53F@keescook>
 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
 <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
 <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>

On Wed, Feb 28, 2024 at 01:22:09PM +0000, Christophe Leroy wrote:
> [...]
> My worry with initialisation at declaration is it often hides missing 
> assignments. Let's take following simple exemple:
> 
> char *colour(int num)
> {
> 	char *name;
> 
> 	if (num == 0) {
> 		name = "black";
> 	} else if (num == 1) {
> 		name = "white";
> 	} else if (num == 2) {
> 	} else {
> 		name = "no colour";
> 	}
> 
> 	return name;
> }
> 
> Here, GCC warns about a missing initialisation of variable 'name'.

Sometimes. :( We build with -Wno-maybe-uninitialized because GCC gets
this wrong too often. Also, like with large structs like this, all
uninit warnings get suppressed if anything takes it by reference. So, if
before your "return name" statement above, you had something like:

	do_something(&name);

it won't warn with any option enabled.

> But if I declare it as
> 
> 	char *name = "no colour";
> 
> Then GCC won't warn anymore that we are missing a value for when num is 2.
> 
> During my life I have so many times spent huge amount of time 
> investigating issues and bugs due to missing assignments that were going 
> undetected due to default initialisation at declaration.

I totally understand. If the "uninitialized" warnings were actually
reliable, I would agree. I look at it this way:

- initializations can be missed either in static initializers or via
  run time initializers. (So the risk of mistake here is matched --
  though I'd argue it's easier to *find* static initializers when adding
  new struct members.)
- uninitialized warnings are inconsistent (this becomes an unknown risk)
- when a run time initializer is missed, the contents are whatever was
  on the stack (high risk)
- what a static initializer is missed, the content is 0 (low risk)

I think unambiguous state (always 0) is significantly more important for
the safety of the system as a whole. Yes, individual cases maybe bad
("what uid should this be? root?!") but from a general memory safety
perspective the value doesn't become potentially influenced by order of
operations, leftover stack memory, etc.

I'd agree, lifting everything into a static initializer does seem
cleanest of all the choices.

-Kees

-- 
Kees Cook

