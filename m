Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F4D428023
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Oct 2021 11:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhJJJPo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 10 Oct 2021 05:15:44 -0400
Received: from mout.gmx.net ([212.227.15.15]:55701 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230370AbhJJJPn (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 10 Oct 2021 05:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633857223;
        bh=V4kNcg8QuRQhrB3HCob9fKraDAeSafpaiV+l0zwDbdI=;
        h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
        b=IqPCx6BwehLOI3sNLz+yhYISVPibAqCO72Z+Vjt138JR8VbMBLm0eeYXpUybkf4oa
         zbe9p2izlXbzbfIAIA94XzarZRqKsMooUSsnYtIU41Uyuub/tWD5xXM7q+Juuam0nR
         jrotoGuzDxNZVkwWWr1px7nGq847LXchyvxPAyK0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.159.58]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5UD-1mVtsP3RWZ-00FA5d; Sun, 10
 Oct 2021 11:13:42 +0200
Message-ID: <d2fd6be4-c76e-6be4-924f-484549883aa0@gmx.de>
Date:   Sun, 10 Oct 2021 11:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20211009213856.3326-1-svens@stackframe.org>
 <20211009213856.3326-3-svens@stackframe.org>
From:   Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 2/2] parisc: add support for TOC (transfer of control)
In-Reply-To: <20211009213856.3326-3-svens@stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/BRxtircdulg4KdylBCk35eEYJ3TwsH4221zv05Ft3Ox7yhHKA2
 6J2+it3sggUSdVctQ8vy3T2N1hjF8w+JV4667QHELHLcPoXr4R7bLLbIsdDWKcVINAFE8uF
 uDfoAvFOaC3oFgx8pQVnJfONo1gZSjlZMOanIImALwle/bkjZtrehh4uxPd6DIpYn9ylK3u
 ptBI8ZC8YpNYSxQZA5GSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+/Rjleqk0ek=:JKzzJGQ+rAMci2tAGY/tdu
 Ex5gohSuycNjB8CaNSam6A/1Ku9TT+rGlQDDlyRpwufvZJZrZ1hTWXDQ1k4CYGGNyCdBnoDH/
 5nyNF5rQlIMD7VZ43QzKa4i5vS9igNSUm6h8RdxQZ9ZKf5ZbBgQHkAFw5bxoTVjWlfQ0P/yjL
 fGnV2lrjJwNjsvD/fhLabvFZ/c4hV3IZs1AeHxSaELsGvogR0UeGFKe5nvXAARryOY7NLwa8U
 RjQMQRJvQwg7dtR77cjCX1kYKsnw9/0MbikhQ96pxLi+TQu2WZrGW5Hgw1FUiaTUd2JFqM307
 IX1eYSsseAwgH/meyiIPdtFJ0q5g0DbJUgmeefwxlQGEbtRNrmki8ym8gKhARtJDMb2uBuddk
 FKsyASEQoI3ZGCFvY8psh2F+D16S+FQe02IghiN77Q6obkDTtKlwELepKJOE24wzDXwWz/Fc/
 UzN3LTWia/ScN/tvLlzVxhOLei/Jo6hDEQtiW0V3vaeMpMoi5DLasBLwvXOzQNQD5TvSDXUeX
 yhzePwjsn54MtaD0BnyX0NWh7XSgZZ5H6algzMkWyIPmdcyIhAN1krJm8HNWqU91MAZwmCN9I
 nResbfFlPteoFBIPgNicGEc2qX0R3eLzigOPxENwT/VKPLEzvCpl0muukeF3WL58sxG7CrA2P
 6CenoRj1uwGOQ1LGaRliZAmSUH+nWC6ShzgRkHtyVl+493xNnpSdpIvAAuMReIoo3KwrzLvMA
 QppugVFWFgmO+eLOMH0ayqUDqz7uDliCwpainZGmBSaveQrtijo9vqnC9+8QGQbmWgvZFBXco
 sKIekBrvEBYuadzor62NCoRhb7rZtxAMsSkckagc429BkPko2lM8+UKxyEopWAiwFiNykXQgo
 neVPtAV6ZV/w4sT8tnBiWz8GJry08rcooUGAEPEecD2cQHY57q5vUG6pmcszGo97NtAZ+bUGx
 0M3ZMIcmulLfmyNnb8w8aG4G7NFJOR29s6HLim4tf18hjf8N7aMz9vs5iqcoeOJ/TXRJldmpL
 CHeSQcXWeDpjNK9nJCZgM9rIjF79RTdNL6FyT/DNxPGzs/Tcebhf5iYUdRsWQQvYBw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/9/21 23:38, Sven Schnelle wrote:
> Almost all PA-RISC machines have either a button that
> is labeled with 'TOC' or a BMC function to trigger a TOC.
> TOC is a non-maskable interrupt that is sent to the processor.
> This can be used for diagnostic purposes like obtaining a
> stack trace/register dump or to enter KDB/KGDB.
>
> As an example, on my c8000, TOC can be used with:
>
> CONFIG_KGDB=3Dy
> CONFIG_KGDB_KDB=3Dy
>
> and the 'kgdboc=3DttyS0,115200' appended to the command line.
>
> Press ^( on serial console, which will enter the BMC command line,
> and enter 'TOC s':
>
> root@(none):/# (
> cli>TOC s
> Sending TOC/INIT.
> <Cpu3> 2800035d03e00000  0000000040c21ac8  CC_ERR_CHECK_TOC
> <Cpu0> 2800035d00e00000  0000000040c21ad0  CC_ERR_CHECK_TOC
> <Cpu2> 2800035d02e00000  0000000040c21ac8  CC_ERR_CHECK_TOC
> <Cpu1> 2800035d01e00000  0000000040c21ad0  CC_ERR_CHECK_TOC
> <Cpu3> 37000f7303e00000  2000000000000000  CC_ERR_CPU_CHECK_SUMMARY
> <Cpu0> 37000f7300e00000  2000000000000000  CC_ERR_CPU_CHECK_SUMMARY
> <Cpu2> 37000f7302e00000  2000000000000000  CC_ERR_CPU_CHECK_SUMMARY
> <Cpu1> 37000f7301e00000  2000000000000000  CC_ERR_CPU_CHECK_SUMMARY
> <Cpu3> 4300100803e00000  c0000000001d26cc  CC_MC_BR_TO_OS_TOC
> <Cpu0> 4300100800e00000  c0000000001d26cc  CC_MC_BR_TO_OS_TOC
> <Cpu2> 4300100802e00000  c0000000001d26cc  CC_MC_BR_TO_OS_TOC
> <Cpu1> 4300100801e00000  c0000000001d26cc  CC_MC_BR_TO_OS_TOC
>
> Entering kdb (current=3D0x00000000411cef80, pid 0) on processor 0 due to=
 NonMaskable Interrupt @ 0x40c21ad0
> [0]kdb>
>
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>  arch/parisc/include/asm/processor.h |  4 ++
>  arch/parisc/include/uapi/asm/pdc.h  |  6 ++-
>  arch/parisc/kernel/entry.S          | 69 +++++++++++++++++++++++++
>  arch/parisc/kernel/processor.c      | 21 ++++++++
>  arch/parisc/kernel/traps.c          | 79 +++++++++++++++++++++++++++++
>  5 files changed, 177 insertions(+), 2 deletions(-)
>
> diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/a=
sm/processor.h
> index eeb7da064289..1e9a4c986921 100644
> --- a/arch/parisc/include/asm/processor.h
> +++ b/arch/parisc/include/asm/processor.h
> @@ -294,6 +294,10 @@ extern int _parisc_requires_coherency;
>
>  extern int running_on_qemu;
>
> +extern void toc_handler(void);
> +extern unsigned int toc_handler_size;
> +extern unsigned int toc_handler_csum;
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* __ASM_PARISC_PROCESSOR_H */
> diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/ua=
pi/asm/pdc.h
> index ad51df8ba952..acc633c15722 100644
> --- a/arch/parisc/include/uapi/asm/pdc.h
> +++ b/arch/parisc/include/uapi/asm/pdc.h
> @@ -398,8 +398,10 @@ struct zeropage {
>  	/* int	(*vec_rendz)(void); */
>  	unsigned int vec_rendz;
>  	int	vec_pow_fail_flen;
> -	int	vec_pad[10];
> -
> +	int	vec_pad0[3];
> +	unsigned int vec_toc_hi;
> +	int	vec_pad1[6];
> +
>  	/* [0x040] reserved processor dependent */
>  	int	pad0[112];
>
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index 9f939afe6b88..f486f3b51075 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -28,6 +28,7 @@
>
>  #include <linux/linkage.h>
>  #include <linux/pgtable.h>
> +#include <linux/threads.h>
>
>  #ifdef CONFIG_64BIT
>  	.level 2.0w
> @@ -2414,3 +2415,71 @@ ENTRY_CFI(set_register)
>  	copy    %r1,%r31
>  ENDPROC_CFI(set_register)
>
> +	.import toc_intr,code
> +	ENTRY_CFI(toc_handler)
> +	/*
> +	 * synchronize CPUs and obtain offset
> +	 * for stack setup.
> +	 */
> +	load32		PA(toc_lock),%r1
> +0:	ldcw,co		0(%r1),%r2
> +	cmpib,=3D		0,%r2,0b
> +	nop
> +	addi		1,%r2,%r4
> +	stw		%r4,0(%r1)
> +	addi		-1,%r2,%r4
> +
> +	load32	PA(toc_stack),sp
> +	/*
> +	 * deposit CPU number into stack address,
> +	 * so every CPU will have its own stack.
> +	 */
> +	depw	%r4,18,2,%sp

Shouldn't this be 5 instead of 2, otherwise it limits it to 4 CPUs,
while we currently can have up to 32 (see arch/parisc/Kconfig).
e.g.:	depw	%r4,18,5,%sp

> +
> ...
> +SYM_DATA(toc_handler_size, .long . - toc_handler)
> +SYM_DATA(toc_lock, .long 1)
> +
> +	__PAGE_ALIGNED_BSS
> +	.align 16384*NR_CPUS

^ This align is too big, esp. since NR_CPUS can be 32.
At minimum a stack needs to be 64-byte aligned.
I think a simple .align 64 here, and changing the multiplication
above with adding the offset is better.

> +toc_stack:
> +	.block 16384*NR_CPUS

all other seems ok.

Thanks!
Helge
