Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405BC3FFFF4
	for <lists+linux-parisc@lfdr.de>; Fri,  3 Sep 2021 14:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348925AbhICMsY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 3 Sep 2021 08:48:24 -0400
Received: from mta-tor-001.bell.net ([209.71.212.28]:48778 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbhICMsX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 Sep 2021 08:48:23 -0400
X-Greylist: delayed 371 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Sep 2021 08:48:23 EDT
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.52.221.220]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C886880441A7CA
X-CM-Envelope: MS4xfBc2ZyL3RdrC+RCUVbJm++j37NvU+JiIp/H6IHHkHGrs2fgXAjol7STu0LNfUiDNDzHUzBl0KHyJD2ADxWIVSAaceoC4wwj1Y9cWxb+WjnFUSJNox0FE
 0rbg/N0K58VCP/g7d4283zx32sixg61g5WBMGVcrACmxSkGpHBDLFcVOD5HUjiHXESlRfWioC9N/nXLrkGzrOMfUkmcRwFVFgAR22nF+5FRv131z56nOfdrL
 ewMoMBi6gh7piTsjWM9yQ/9SoFnCy3hsfV/JGnbqTdzAJUwWiqgOjySRClh7fYWNdL7YjnCvBY0/kHZ6NTCIdojOtZijzVLekRXmIF9h2QA=
X-CM-Analysis: v=2.4 cv=Udwy9IeN c=1 sm=1 tr=0 ts=613217e4
 a=YO5NLpPX/y/Fbmk87HoZTg==:117 a=YO5NLpPX/y/Fbmk87HoZTg==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=-tlrPe3qAA_0uA4TXdEA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.52.221.220) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C886880441A7CA; Fri, 3 Sep 2021 08:41:08 -0400
Subject: Re: [PATCH] parisc: Drop __arch_swab16(), arch_swab24(),
 _arch_swab32() and __arch_swab64() functions
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YTHWzLrVpZV/dk8n@ls3530>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <bbd93244-9071-3dd9-bdb3-d3f5b1809358@bell.net>
Date:   Fri, 3 Sep 2021 08:41:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTHWzLrVpZV/dk8n@ls3530>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

I don't believe the compiler can implement __arch_swab64() as efficiently as the inline assembly
code.  The compiler doesn't know about the permh or hsh instructions.

Dave

On 2021-09-03 4:03 a.m., Helge Deller wrote:
> No need to keep those as inline assembly functions, the compiler now
> generates the same or even better optimized code.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/include/uapi/asm/swab.h b/arch/parisc/include/uapi/asm/swab.h
> deleted file mode 100644
> index 35fb2d1bfbbd..000000000000
> --- a/arch/parisc/include/uapi/asm/swab.h
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -#ifndef _PARISC_SWAB_H
> -#define _PARISC_SWAB_H
> -
> -#include <asm/bitsperlong.h>
> -#include <linux/types.h>
> -#include <linux/compiler.h>
> -
> -#define __SWAB_64_THRU_32__
> -
> -static inline __attribute_const__ __u16 __arch_swab16(__u16 x)
> -{
> -	__asm__("dep %0, 15, 8, %0\n\t"		/* deposit 00ab -> 0bab */
> -		"shd %%r0, %0, 8, %0"		/* shift 000000ab -> 00ba */
> -		: "=r" (x)
> -		: "0" (x));
> -	return x;
> -}
> -#define __arch_swab16 __arch_swab16
> -
> -static inline __attribute_const__ __u32 __arch_swab24(__u32 x)
> -{
> -	__asm__("shd %0, %0, 8, %0\n\t"		/* shift xabcxabc -> cxab */
> -		"dep %0, 15, 8, %0\n\t"		/* deposit cxab -> cbab */
> -		"shd %%r0, %0, 8, %0"		/* shift 0000cbab -> 0cba */
> -		: "=r" (x)
> -		: "0" (x));
> -	return x;
> -}
> -
> -static inline __attribute_const__ __u32 __arch_swab32(__u32 x)
> -{
> -	unsigned int temp;
> -	__asm__("shd %0, %0, 16, %1\n\t"	/* shift abcdabcd -> cdab */
> -		"dep %1, 15, 8, %1\n\t"		/* deposit cdab -> cbab */
> -		"shd %0, %1, 8, %0"		/* shift abcdcbab -> dcba */
> -		: "=r" (x), "=&r" (temp)
> -		: "0" (x));
> -	return x;
> -}
> -#define __arch_swab32 __arch_swab32
> -
> -#if __BITS_PER_LONG > 32
> -/*
> -** From "PA-RISC 2.0 Architecture", HP Professional Books.
> -** See Appendix I page 8 , "Endian Byte Swapping".
> -**
> -** Pretty cool algorithm: (* == zero'd bits)
> -**      PERMH   01234567 -> 67452301 into %0
> -**      HSHL    67452301 -> 7*5*3*1* into %1
> -**      HSHR    67452301 -> *6*4*2*0 into %0
> -**      OR      %0 | %1  -> 76543210 into %0 (all done!)
> -*/
> -static inline __attribute_const__ __u64 __arch_swab64(__u64 x)
> -{
> -	__u64 temp;
> -	__asm__("permh,3210 %0, %0\n\t"
> -		"hshl %0, 8, %1\n\t"
> -		"hshr,u %0, 8, %0\n\t"
> -		"or %1, %0, %0"
> -		: "=r" (x), "=&r" (temp)
> -		: "0" (x));
> -	return x;
> -}
> -#define __arch_swab64 __arch_swab64
> -#endif /* __BITS_PER_LONG > 32 */
> -
> -#endif /* _PARISC_SWAB_H */


-- 
John David Anglin  dave.anglin@bell.net

