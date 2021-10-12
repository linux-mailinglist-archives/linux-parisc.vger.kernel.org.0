Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7476D42A3A0
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Oct 2021 13:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbhJLLv4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Oct 2021 07:51:56 -0400
Received: from mta-tor-004.bell.net ([209.71.212.31]:34628 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232665AbhJLLvz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Oct 2021 07:51:55 -0400
X-Greylist: delayed 374 seconds by postgrey-1.27 at vger.kernel.org; Tue, 12 Oct 2021 07:51:55 EDT
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C8868807D00E27
X-CM-Envelope: MS4xfPkC2qHNO3mek76GuJo8+YHq165PIm0Wcv+fG3a5KtMMPU0KbElsSTUmZzYMBR+ubrd3jbPeT9tOt6cdZf3fVKignXCU9boHndR6rhAEQQZPUXxWWSpw
 NODPuDcy9FaYmawcQ2guDIZ/1ULBkC72rBa0bpnLY0N9tskUjJwX73WMkFaQTWPGJHzAJp2HrIhyHA7eMS0UGpfZzIICuDDXtUVeVC5Bph/OrVKEyu6Qh2ha
 MwNy081N4zKaUhNrpJEsliTCCr3zN0jK9xk5wLK25sQZ7YCLtFHMoZRLO4Uxy2MgWSepKpOYSeibe2MmwmKSIRc9yYmvPICHdIOd9h016o0=
X-CM-Analysis: v=2.4 cv=Udwy9IeN c=1 sm=1 tr=0 ts=616574ea
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=3-nhi2gywegSMPCVU4IA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C8868807D00E27; Tue, 12 Oct 2021 07:43:38 -0400
Message-ID: <d4c868f8-5001-495a-524f-752545146b20@bell.net>
Date:   Tue, 12 Oct 2021 07:43:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: Fix xmpyu usage in 32-bit kernel
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YWSSVwQ9tc9YaC+f@ls3530>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <YWSSVwQ9tc9YaC+f@ls3530>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-10-11 3:36 p.m., Helge Deller wrote:
> Dave noticed that the libgcc.a which is linked into the kernel binary
> uses the xmpyu assembler statement. This asm statement uses floating
> point registers which are forbidden in the kernel, because we don't save
> the FP regs at kernel entry.
>
> Switch the parisc kernel to use the already existing shared copies of
> some GCC library routines instead of linking in those from libgcc.
>
> This patch avoids all uses of xmpyu in the 32-bit kernel, but the 64-bit
> kernel still needs fixing.
>
> Reported-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index fc17285f4da1..e412d5c6c64f 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -36,6 +36,12 @@ config PARISC
>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_CPU_DEVICES
>   	select GENERIC_LIB_DEVMEM_IS_ALLOWED
> +	select GENERIC_LIB_ASHLDI3
> +	select GENERIC_LIB_ASHRDI3
> +	select GENERIC_LIB_LSHRDI3
> +	select GENERIC_LIB_MULDI3
> +	select GENERIC_LIB_CMPDI2
> +	select GENERIC_LIB_UCMPDI2
I would avoid using the generic routines in the kernel.  The routines from libgcc are better maintained
and produce better code.

This is really a gcc bug.  libgcc needs to be built with -msoft-float.  This will prevent the use of
the xmpyu instruction in __muldi3, __divdi3, __udivdi3, __moddi3 and __umoddi3, and fix both
32 and 64-bit kernels.

The libgcc build also needs to be fixed to provide the full compliment of software floating-point
routines.

The -msoft-float and -mdisable-fpregs options are equivalent but currently only -msoft-float disables
generation of all floating-point instructions.
>   	select SYSCTL_ARCH_UNALIGN_ALLOW
>   	select SYSCTL_EXCEPTION_TRACE
>   	select HAVE_MOD_ARCH_SPECIFIC
> diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
> index 00297e8e1c88..da8c99c5a8c6 100644
> --- a/arch/parisc/kernel/parisc_ksyms.c
> +++ b/arch/parisc/kernel/parisc_ksyms.c
> @@ -92,18 +92,6 @@ EXPORT_SYMBOL($$divI_12);
>   EXPORT_SYMBOL($$divI_14);
>   EXPORT_SYMBOL($$divI_15);
>
> -extern void __ashrdi3(void);
> -extern void __ashldi3(void);
> -extern void __lshrdi3(void);
If these are actually being used, pa.md needs to be enhanced to avoid these calls from being generated.
It should be possible to handle these using hardware shifts.
> -extern void __muldi3(void);
> -extern void __ucmpdi2(void);
> -
> -EXPORT_SYMBOL(__ashrdi3);
> -EXPORT_SYMBOL(__ashldi3);
> -EXPORT_SYMBOL(__lshrdi3);
> -EXPORT_SYMBOL(__muldi3);
> -EXPORT_SYMBOL(__ucmpdi2);
> -
>   asmlinkage void * __canonicalize_funcptr_for_compare(void *);
>   EXPORT_SYMBOL(__canonicalize_funcptr_for_compare);
>
> diff --git a/arch/parisc/lib/Makefile b/arch/parisc/lib/Makefile
> index 7b197667faf6..2bfafb3c9ae0 100644
> --- a/arch/parisc/lib/Makefile
> +++ b/arch/parisc/lib/Makefile
> @@ -4,6 +4,6 @@
>   #
>
>   lib-y	:= lusercopy.o bitops.o checksum.o io.o memset.o memcpy.o \
> -	   ucmpdi2.o delay.o
> +	   delay.o
>
>   obj-y	:= iomap.o
> diff --git a/arch/parisc/lib/ucmpdi2.c b/arch/parisc/lib/ucmpdi2.c
> deleted file mode 100644
> index 8e6014a142ef..000000000000
> --- a/arch/parisc/lib/ucmpdi2.c
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/module.h>
> -
> -union ull_union {
> -	unsigned long long ull;
> -	struct {
> -		unsigned int high;
> -		unsigned int low;
> -	} ui;
> -};
> -
> -int __ucmpdi2(unsigned long long a, unsigned long long b)
> -{
> -	union ull_union au = {.ull = a};
> -	union ull_union bu = {.ull = b};
> -
> -	if (au.ui.high < bu.ui.high)
> -		return 0;
> -	else if (au.ui.high > bu.ui.high)
> -		return 2;
> -	if (au.ui.low < bu.ui.low)
> -		return 0;
> -	else if (au.ui.low > bu.ui.low)
> -		return 2;
> -	return 1;
> -}
This should be removed and libgcc routine used.

Dave

-- 
John David Anglin  dave.anglin@bell.net

