Return-Path: <linux-parisc+bounces-1705-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A162D91A2EE
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Jun 2024 11:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B80E2824E7
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Jun 2024 09:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2135313AD04;
	Thu, 27 Jun 2024 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xu/Ix/c6"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14DD132492
	for <linux-parisc@vger.kernel.org>; Thu, 27 Jun 2024 09:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719481585; cv=none; b=n5ISXA868RZMN59z+gHnJDdA5rGxvyakC4CRbqrXj3b1nGRXsi6QkHSrLnx2T5HfWYrC+5avM0IR31jlx7JcRX0yOd4IcvS7VhPqoVQp3UkVo4lI7us1qpPhBkwW7mTiUNSXTkJVVVSDhfBsV7++9nfqBQY/YXLGRWeznE0za1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719481585; c=relaxed/simple;
	bh=Pc3RsDqwa2YNWbz2wKwZvmJ5tvIbsWipQ1V22JUuMb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRWo/tXZY3sMW4tRiYPT3xGIlFCENjnDLeOBbAmrLpe/1K0WxvdKdCjgByRWy5UuYQNHIOkNZ9bW50+mglrMNR/kyrX8VBnEVnqYfX8F9rj/54CWXsx9SzldzLmSkDr2sTGuIMCfXy2VUotkrxuWGgT6q246AzxjLnukxiG5MwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xu/Ix/c6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6BDC2BBFC;
	Thu, 27 Jun 2024 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719481584;
	bh=Pc3RsDqwa2YNWbz2wKwZvmJ5tvIbsWipQ1V22JUuMb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xu/Ix/c6xNz+CBoFjmI0BtHW/Nlf6WhyrMnS5Bin7pa/OuwTlI4n5AaxMDloXG0KZ
	 kgbXUPno+1BZD/4XoMnynacAM5D89fV4+g7/DXYOQZf5RWmiuClyCs4brjck6jFQgx
	 TCqf6P59gO84hQ7X/yUalroi2vdkFbZ9JQK+XaJ8uylLx2ybb9x3YMJ1JtO18r7buW
	 UFjCqdFwLzdCMBAGcs3+W6ydAkTc7rQb9AOgV8DCGzAEe2dP/DS5s3fv4bqLGp6SPj
	 HIE/Hu/Tb2wVDW0+tJIlT/xh8f94zPmU/ON9IO9Bospsdx8NPNRP9YhvfXJtW0zDNn
	 CJYFr2gC8ry0A==
Date: Thu, 27 Jun 2024 11:46:19 +0200
From: Helge Deller <deller@kernel.org>
To: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Cc: libc-alpha@sourceware.org, John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2] hppa/vdso: Add wrappers for vDSO functions
Message-ID: <Zn006zh2vSqfgii6@carbonx1>
References: <ZnXT9hNtYWLg9MID@carbonx1>
 <fd19f26c-0ebf-42ef-bfc3-686a82104d07@linaro.org>
 <47136a43-058f-4258-bd1b-3475fd7ea14a@gmx.de>
 <433fdb50-85e6-4b2d-8bd5-371b8cac4921@linaro.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433fdb50-85e6-4b2d-8bd5-371b8cac4921@linaro.org>

* Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>:
> 
> On 25/06/24 16:48, Helge Deller wrote:
> > On 6/24/24 22:31, Adhemerval Zanella Netto wrote:
> >>
> >>
> >> On 21/06/24 16:26, Helge Deller wrote:
> >>> The upcoming parisc (hppa) v6.11 Linux kernel will include vDSO
> >>> support for gettimeofday(), clock_gettime() and clock_gettime64()
> >>> syscalls for 32- and 64-bit userspace.
> >>> The patch below adds the necessary glue code for glibc.
> >>>
> >>> Signed-off-by: Helge Deller <deller@gmx.de>
> >>>
> >>> Changes in v2:
> >>> - add vsyscalls for 64-bit too
> >>>
> >>> diff -up ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org ./sysdeps/unix/sysv/linux/hppa/sysdep.h
> >>> --- ./sysdeps/unix/sysv/linux/hppa/sysdep.h.org    2024-06-15 20:20:58.992000000 +0000
> >>> +++ ./sysdeps/unix/sysv/linux/hppa/sysdep.h    2024-06-21 19:19:02.132000000 +0000
> >>> @@ -468,6 +468,18 @@ L(pre_end):                    ASM_LINE_SEP    \
> >>>   #define CLOB_ARGS_1 CLOB_ARGS_2, "%r25"
> >>>   #define CLOB_ARGS_0 CLOB_ARGS_1, "%r26"
> >>>
> >>> +#define VDSO_NAME    "LINUX_6.11"
> >>> +#define VDSO_HASH    182951793
> >>> +
> >>> +#ifdef __LP64__
> >>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
> >>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
> >>> +#else
> >>> +# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
> >>> +# define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
> >>> +# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
> >>> +#endif /* __LP64__ */
> >>> +
> >>>   #endif    /* __ASSEMBLER__ */
> >>
> >> Not sure why you have added the gettimeofday support, currently 32 bits
> >> it is already routed to to clock_gettime (which will use
> >> __vdso_clock_gettime64 anyway).
> > 
> > Yep, you are right.
> > I actually didn't checked if it's being used but just saw it's defined
> > for other arches too, so I assumed it to be used.
> > 
> >> For hppa to actually use, it would require to add a way to call it
> >> for !USE_IFUNC_GETTIMEOFDAY gettimeofday, which I am not it really be
> >> an improvement here.
> > 
> > Yes, that doesn't make sense.
> > 
> > Looking at the code it seems riscv, sparc, arm, mips and s390 define it
> > too, without being used. Do you suggest we should remove gettimeofday
> > vsyscall from hppa again (or just keep like the others even if not being used)?
> 
> The riscv only added it for CONFIG_64BIT, while old ABIs like arm, sparc,
> mips, and s390 added before 64 bit time_t landed on 5.1.  With current 
> 32 bits ABIs moving to 64 bit time_t userland, there is no much sense in 
> providing a 32 bit gettimeofday, nor I think I adding a  gettimeoday64 would 
> make much sense (maybe on really high sensitive workloads that require 
> low-latency timestamping, but clock_gettime would work better anyway).
> 
> It is highly unlikely that the symbol will ever be used by userland,
> and I think it only make sense to provide clock_gettime64.  The glibc 
> 32 bit time_t clock_gettime routes to clock_gettime64 and it will only 
> fallback to 32 bit vDSO symbol if the 64 bit time_t one is not present.

Like patch below?
Helge


[PATCH] hppa/vdso: Provide 64-bit clock_gettime() vDSO only

Adhemerval noticed that the gettimeofday() and 32-bit clock_gettime()
vDSO calls won't be used by glibc on hppa, so there is no need to
declare them.  Both syscalls will be emulated by utilizing return values
of the 64-bit clock_gettime() vDSO instead..

Signed-off-by: Helge Deller <deller@gmx.de>
Suggested-by: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>

diff --git a/sysdeps/unix/sysv/linux/hppa/sysdep.h b/sysdeps/unix/sysv/linux/hppa/sysdep.h
index af62f7501e..e47975e5cf 100644
--- a/sysdeps/unix/sysv/linux/hppa/sysdep.h
+++ b/sysdeps/unix/sysv/linux/hppa/sysdep.h
@@ -473,11 +473,8 @@ L(pre_end):					ASM_LINE_SEP	\
 
 #ifdef __LP64__
 # define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
-# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
 #else
-# define HAVE_CLOCK_GETTIME_VSYSCALL    "__vdso_clock_gettime"
 # define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
-# define HAVE_GETTIMEOFDAY_VSYSCALL     "__vdso_gettimeofday"
 #endif /* __LP64__ */
 
 #endif	/* __ASSEMBLER__ */

