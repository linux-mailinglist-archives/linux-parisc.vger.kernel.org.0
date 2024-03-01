Return-Path: <linux-parisc+bounces-772-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF9B86E8F6
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Mar 2024 20:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C31D28A3A6
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Mar 2024 19:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28FA39FFE;
	Fri,  1 Mar 2024 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="HLic5YMs"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8745A2575F
	for <linux-parisc@vger.kernel.org>; Fri,  1 Mar 2024 18:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709319498; cv=none; b=I6Gu7BKG8wOUzhPJSa7RRjPgXfOeQwDVil7WakUOTUlNMznzE3NYtUXAP3DLDzTzXI1jCbsSxrPZS/k6Sy4B8VjHJxmG8JxcXPxHRKbYi+xeifFn/jtJpWvAecnidD0aOaHNCap8kAYHjwWUJQwnBTYb/qkIr72j+y8XapN8jYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709319498; c=relaxed/simple;
	bh=BETEy5GagPZPsVb9dqFAKrpg6Yiv8E4MAzfJK5IULwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVxYO1OZG7nOzyWIP0+q30FA/41OmIUdmIIFBVycyVhQ6lf3S8Z14zxUNWBRkEoHB2w13bo6K58UD+xLfNeRx8XvAIEMkjZXxEDhsppNgqjO/lKbScwTGgMIMzFBBiVuRzBU7UENuRqGsTB0k0k9aoa+jzcbfNd0NHQv52iMR7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=HLic5YMs; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so8438755ad.3
        for <linux-parisc@vger.kernel.org>; Fri, 01 Mar 2024 10:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709319495; x=1709924295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHGqpT+UmbapMHh/jYj1gOpOkd8pPX1SYZ2Vz/dbBPM=;
        b=HLic5YMsBo0s0OCtEsxHN9b6eQFCqckBTp80164WvTFytcA622oGUbVXN0nN3qjRTp
         JOqwSpwa7alrZGljT2pKgQnjYjWpOPqWCVruFPpTkHX0VJDyoNK9BeXK5eT5E91Jas29
         rXUUQ/t4Wqd1V7yWaUhc1BRZiUUlKGE1eExLhVIcg/yT5altoFPaARnPg56oRY9UhQMK
         P+l2BzvvCqPC9uukZ3SxtY7dDsof3zaw3v+QQh+QyETu9ECQju1yTEOAwjB2oZMLS9hd
         B+n3gHMGUOI0Kmk4CGsgtP+5nvR3ce2YcrNKJWFicD7W21uxx98RGppOTEUFfY0gE0Pt
         fiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709319495; x=1709924295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHGqpT+UmbapMHh/jYj1gOpOkd8pPX1SYZ2Vz/dbBPM=;
        b=gV7yhPrCKb5JKJlQTbp0BCXNarPrndtnSHLjrx961QNIjnTJTM8iwrIK6tA12RYfW6
         LD91rgSikFXa2vw1HmEL2HlRj9bkUgNnXXkimaE6W3iOCv3JCLSJ/XIj+ZnYgltpFztB
         ugh1hfVm+jbM34dfe/juFap5IcJL+lNDXQNT/JHP5EHCF3q8hzgPXkvbKNeV9czSz43J
         0QaKVYhQjrhsy0ZI2GJT4aqzxJuIGgHEZOrlj9ba6PZ3VzLN4CuCcNpm/AllCyAgpnZM
         zhHCenFxUbeCsClEWJMz95kJdVC1ET2oNm80t6pfwkIHD1WZ7nG7ab91CX063FkyZ0Mg
         zBhA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5MB0qQZUXGrtHuFCdd4Vmw8ViUSRTpc6m/RRDAhOz2+BSfIzurE+f7ay09JuerhiLoLGEyPIHWWbDd+mGlVweaTdhGxnjyvGwDIf
X-Gm-Message-State: AOJu0Yz9GA2kvGU1xR1900C5+Uc8WNH8X9OWUPfDA67OGvV3xOaOqVZw
	1Eo4Y+prKhPOzTaSbTccgjRiAqXKU/FO7sF5LhQWJhARW4EqyHgNUkiGHzBm+XU=
X-Google-Smtp-Source: AGHT+IFbV/5oV3dkc2lBWbTrIagdvEyGLVS+6a0H9DRDKlONbBDTZ3mV0AnXSRmhKx3IXg4A8cxk8Q==
X-Received: by 2002:a17:902:e741:b0:1dc:c45c:5d1d with SMTP id p1-20020a170902e74100b001dcc45c5d1dmr3244947plf.24.1709319494745;
        Fri, 01 Mar 2024 10:58:14 -0800 (PST)
Received: from ghost ([2600:1010:b024:d166:9854:fdd2:434b:df69])
        by smtp.gmail.com with ESMTPSA id g24-20020a170902869800b001dbae7b85b1sm3798895plo.237.2024.03.01.10.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 10:58:14 -0800 (PST)
Date: Fri, 1 Mar 2024 10:58:11 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v11] lib: checksum: Use aligned accesses for ip_fast_csum
 and csum_ipv6_magic tests
Message-ID: <ZeIlQ+suWjH3f3UZ@ghost>
References: <20240229-fix_sparse_errors_checksum_tests-v11-1-f608d9ec7574@rivosinc.com>
 <62b69aaf-7633-4bd8-aefe-5ba47147dba7@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62b69aaf-7633-4bd8-aefe-5ba47147dba7@roeck-us.net>

On Fri, Mar 01, 2024 at 10:32:36AM -0800, Guenter Roeck wrote:
> On 2/29/24 14:46, Charlie Jenkins wrote:
> > The test cases for ip_fast_csum and csum_ipv6_magic were not properly
> > aligning the IP header, which were causing failures on architectures
> > that do not support misaligned accesses like some ARM platforms. To
> > solve this, align the data along (14 + NET_IP_ALIGN) bytes which is the
> > standard alignment of an IP header and must be supported by the
> > architecture.
> > 
> > Furthermore, all architectures except the m68k pad "struct
> > csum_ipv6_magic_data" to 44 bytes. To make compatible with the m68k,
> > manually pad this structure to 44 bytes.
> > 
> > Fixes: 6f4c45cbcb00 ("kunit: Add tests for csum_ipv6_magic and ip_fast_csum")
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> > The ip_fast_csum and csum_ipv6_magic tests did not work on all
> > architectures due to differences in misaligned access support.
> > Fix those issues by changing endianness of data and aligning the data.
> > 
> > This patch relies upon a patch from Christophe:
> > 
> > [PATCH net] kunit: Fix again checksum tests on big endian CPUs
> > 
> 
> Various test results:
> 
> On v6.8-rc6-120-g87adedeba51a (current mainline), without this patch
> 
> - mps2-an385:mps2_defconfig crashes in IPv6 checksum tests
> - ipv6 checksum tests fail on parisc, parisc64, sh, and sheb.
> 
> The previously seen problems on big endian systems are still seen with
> v6.8-rc6, but are gone after commit 3d6423ef8d51 ("kunit: Fix again
> checksum tests on big endian CPUs") has been applied upstream. This includes
> the test failures seen with m68k.
> 
> The parisc/parisc64 test failures are independent of this patch. Fixes are
> available in linux-next and pending in qemu. The sh/sheb failures are due
> to upstream commit cadc4e1a2b4 and are no longer seen after reverting that
> patch.
> 
> This leaves the mps2-an385:mps2_defconfig crash, which is avoided by this patch.
> My understanding, which may be wrong, is that arm images with thumb instructions
> do not support unaligned accesses (maybe I should say do not support unaligned
> accesses with the mps2-an385 qemu emulation; I did not test with real hardware,
> after all).
> 
> Given all that, the continued discussion around the subject, and the lack
> of agreement if unaligned accesses should be tested or not, I don't really
> see a path forward for this patch. The remaining known problem is arm with
> thumb instructions. I don't think that is going to be fixed. I suspect that
> no one but me even tries to run that code (or any arm:nommu images, for that
> matter). I'd suggest to drop this patch, and I'll stop testing IP checksum
> generation for mps2-an385:mps2_defconfig.
> 
> Sorry for all the noise this has generated.
> 
> Thanks,
> Guenter

If that's what people want. I still don't understand why there is any
problem with relying on NET_IP_ALIGN as that seems like that macro was
defined to create an expected alignment.

It would be nice to use the struct csum_ipv6_magic_data instead of doing
manual alignment and restricting len to 16 bits. I can send a patch that
only covers that if people are interested.

This was my first foray into writing generic test cases and it drew a
significant amount of criticism. I appreciate Guenter's efforts to make
the tests have more expected behavior across all supported platforms,
but the community obviously doesn't agree that is a reasonable goal.
Makes my life easier though, because then I can just not upstream test
cases and focus on feature work...

- Charlie

> 

