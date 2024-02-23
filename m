Return-Path: <linux-parisc+bounces-642-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9C861A15
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Feb 2024 18:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299511F2743A
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Feb 2024 17:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5573513A270;
	Fri, 23 Feb 2024 17:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="G+ZUSZ8z"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0B12AAFA
	for <linux-parisc@vger.kernel.org>; Fri, 23 Feb 2024 17:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708709963; cv=none; b=RlWCVPr7wOqbq7qlIUM2QXutQetcH436BpBpJYFWccKh0xs99Rvxz26wqkmdizfOzU7qtAYUQuIR8yvpaw90mvlSN605RO4QnQyTSf/OvaMP23ycAJMsk6rhhohIdn3LPvmNgyL9uR/zBxHd+7HICxHUZaImlbXlhTOC5J8K95o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708709963; c=relaxed/simple;
	bh=fjMvw5PejpBRISHQzjnQdIlSvl8+8KPhek5ZeCQS+3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAoECdYwRnjjj4wcLHGInLP1qqY6F4lIoXrUTnR3cX43SPHwJvobWKsPi/ZnlpLl/qT3I+hnEmiGnuNhri+5brdh55TvpNhX6tKJzi6qAdqBFFJkvL9WL1uzRW3oS1EAeRjOmGg1CKEWQZviLg612HCWx1nvTcxknteqlLJqqjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=G+ZUSZ8z; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e48eef8be5so808003b3a.1
        for <linux-parisc@vger.kernel.org>; Fri, 23 Feb 2024 09:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708709960; x=1709314760; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aNrSU9nuVeOXLyI/gl27U9+uqESAnu3d8kpcXt7XnhE=;
        b=G+ZUSZ8zsxx3jKATTJpZQMe8kTzKdGS7m8eMnhdp5pbHlxhVx2b61vAkMOA21jOnS9
         loZPmMiH4QrYxL7vDKWg9aS5gFxXnybEQq6PrbsV8HEO0n1GkLlBQzpeMHn+Q+Eej/r3
         oycXjpF1HHEKvbYWSDBKNCLz5fHDAi80wP0Pm1xBz1n2knW4UQjFgN/kL/+8tPNonLzU
         bXgXpARarPsijU5h+fw636zqzM9mXf/Ep+md6VRyg/MXg61+1HU0d+JcVJKOWUFZ5IdH
         Qnuo270BDOSA8CYjC91guTxei9jYlBgGIOEXe5b/faDnaxBAGQSlc/apD/+0+cNDG8uD
         LUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708709960; x=1709314760;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aNrSU9nuVeOXLyI/gl27U9+uqESAnu3d8kpcXt7XnhE=;
        b=jQilIyXApsqiyHFFwDd5Gfbjbo4REscKHXFLycO63RAFq/kpx2dP6jOuqywm2XlWp8
         kUk8e7z2wpu7sq5qBnWQcIfFlJLTkFtJzrL7dwu8VijfZ8c3hxz9iEXKnrca6oQy+WaD
         +cmz2CvJAei0IeWmxhinFcgObJAtvQtUcCcFaQ5H93tqmUIvyumC0qkehpYiQEqohCoa
         t0tXNJOp4Zrj882a3xMZ+kJalijYxvIj0Eio3npeRb8acfkh5byX3mcgZMzTkEBjNljo
         AQLSZIZfuz8HAqgFbmzHzJCj5f+cZL8m2bb8f+7bp0wrlPGw69Ic18mBmWid8Yz4LFaS
         v38Q==
X-Forwarded-Encrypted: i=1; AJvYcCX04bnnkNz+iHCS7ArZECqdadSh8PqwNL03f/v9HgJht5/YLZzc8xATnwKrh/NuYrWxjdC3c7lmXr4mRTLI8cXs8CPmHnmcz581eFvv
X-Gm-Message-State: AOJu0YzGjtQobUfiW9b2IKKLSvCbBn8WoB9ASYjlcRrQjIvEJIe0fUHX
	EhQx5RwWwKwDC55Fox22e/SKHNPgqKJs2YzUA1kEPEQbWUZWJw3z/DgRuScmBDA=
X-Google-Smtp-Source: AGHT+IEq6ROiNJYvXbPwuNqDrvXFy0Uiab3IXxwvO+O9zQf1ZUOXghxxsnZLVlZuxk4Wzvm4LfvSlA==
X-Received: by 2002:a05:6a00:987:b0:6e0:5344:1e86 with SMTP id u7-20020a056a00098700b006e053441e86mr733662pfg.23.1708709960302;
        Fri, 23 Feb 2024 09:39:20 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:a351:1ab0:98d6:3d53])
        by smtp.gmail.com with ESMTPSA id h17-20020a056a00231100b006e4de94c112sm1795249pfh.66.2024.02.23.09.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:39:19 -0800 (PST)
Date: Fri, 23 Feb 2024 09:39:18 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"David.Laight@aculab.com" <David.Laight@aculab.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"deller@gmx.de" <deller@gmx.de>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lkp@intel.com" <lkp@intel.com>
Subject: Re: [PATCH v9 0/2] lib: checksum: Fix issues with checksum tests
Message-ID: <ZdjYRiUJqQSeQc7d@ghost>
References: <mhng-7bd71679-7e7b-459d-8d6f-068a0ee090ba@palmer-ri-x1c9a>
 <87plwnabm1.fsf@mail.lhotse>
 <2c0ed167-4566-4120-80fc-a2f40539c27b@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c0ed167-4566-4120-80fc-a2f40539c27b@csgroup.eu>

On Fri, Feb 23, 2024 at 09:22:58AM +0000, Christophe Leroy wrote:
> 
> 
> Le 23/02/2024 à 08:22, Michael Ellerman a écrit :
> > Palmer Dabbelt <palmer@dabbelt.com> writes:
> >> On Wed, 21 Feb 2024 18:55:48 PST (-0800), Charlie Jenkins wrote:
> >>> The ip_fast_csum and csum_ipv6_magic tests did not work on all
> >>> architectures due to differences in endianness and misaligned access
> >>> support. Fix those issues by changing endianness of data and aligning
> >>> the data.
> >>>
> >>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >>> ---
> >>> Changes in v9:
> >>> - Revert back to v7, the changes to v8 were not needed
> >>> - Link to v8: https://lore.kernel.org/r/20240214-fix_sparse_errors_checksum_tests-v8-0-36b60e673593@rivosinc.com
> > ...
> >>>
> >>> ---
> >>> Charlie Jenkins (2):
> >>>        lib: checksum: Fix type casting in checksum kunits
> >>>        lib: checksum: Use aligned accesses for ip_fast_csum and csum_ipv6_magic tests
> >>>
> >>>   lib/checksum_kunit.c | 396 ++++++++++++++++++---------------------------------
> >>>   1 file changed, 136 insertions(+), 260 deletions(-)
> >>> ---
> >>> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> >>> change-id: 20240119-fix_sparse_errors_checksum_tests-26b86b34d784
> >>
> >> I put a
> >>
> >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> >>
> >> on the v4, but looks like it got lost.  I'm happy to take this via the
> >> RISC-V tree, as that's how I merged the broken patches in the first
> >> place, but no big deal if someone else wants to pick it up.
> >>
> >> It looks like the issues are all resolved and such, but there's been a
> >> long tail of them so I'm not 100% sure here...
> > 
> > I tested v9 on ppc32/64 BE, and it fixes the test failures and the
> > sparse errors, so LGTM.
> > 
> > Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> It magically works, but patch 1 is wrong and patch 2 subject is 
> unrelated to the problem on powerpc.
> 
> This fix series needs rework.
> 
> Christophe

I will rearrange the patches so that patch 1 fixes the endianness and
patch 2 addresses alignment. The second patch is subject to endianness
and alignment and the title only including alignment (but the
body including both) is the source of confusion.

- Charlie


