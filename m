Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F90428354
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Oct 2021 21:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhJJTdR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 10 Oct 2021 15:33:17 -0400
Received: from mout.gmx.net ([212.227.17.20]:48133 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230271AbhJJTdO (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 10 Oct 2021 15:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633894273;
        bh=vQM+TJfG6Lkp89jL7dWRYbT3eOhMsAFubfKjusn37Gw=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=PPf7j75Xm4vI2/k3VEOIV3r+OgJb6/C7jDXknDHca2t+rmU803ZkFVs9Sdb0yw4dj
         3ydu/tKekkNTMZimtM0Xdjgs3qGL/WP7wO4qpmxEEHWCU/GxfufEUsG1AR4D14Xb2D
         mfFIV5S+gSOCnmGitNvNQLcsLqmyr4ezluZ1jB3k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.159.58]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fmq-1mkobw3HRo-011w7L; Sun, 10
 Oct 2021 21:31:12 +0200
Message-ID: <57e64e6d-88a6-7789-efa5-7e3bdbeae8df@gmx.de>
Date:   Sun, 10 Oct 2021 21:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] parisc: add support for TOC (transfer of control)
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20211010183815.5780-1-svens@stackframe.org>
 <20211010183815.5780-3-svens@stackframe.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20211010183815.5780-3-svens@stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:obNdcYz48A5b7Aar5Yoiv4dB3qWXzJW5ZDzHAq5aV0sb1BcoHd8
 2z1uX6EvfmJ26KkybVR898Yy1GCRn1vAjOLJ88DeTSmdTMecw7+F30szSmmONsbD+wURVcx
 ITRC6zWJWH55yhisu4PogDIwLBYQ99YPr3xstv0Ij50gP2w/TsYDDdfLQECioXgQ2eWqZSa
 Oa3fwQEVa/dT6ps8hEALA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:igcpjcqIYKQ=:FvI1UXvEqCnk+Uduq/EZOg
 Fj0NQC/4HuRhtKHMdEuuZxldFrY6+n3ZGy0WpNRSb/eP4bwAew+ZbmxHA3qY+uFUZg919ZMsH
 o27v2jRpejOsWcZuDvxFaCKPEmw6NtG+5qigRRDX5MjnDBAxiXYRm3D6rIq9hMKYKmjluHBmJ
 mpVwntgnrV1a15LBPoN7Mr9RpGIIsn6wEmDP2gYK9J10ahxLpjPqMlFO4eCxgvFb2hweNR+Mb
 z/1GLVrN0Z13dQ/hIlf+Ly4BCvvJXaZnPG/sfZNWdDVXd1zhD4QNPcio2HyT/ulQLd+mCPw/6
 LXkoMg6/BWTtIy9J4wYmwwB4+LYNt66cCevY3BXXRPKbl9OF05topbSNHeSXRLPIlvdTniUKa
 BZbm5ZAtzgAWYkEu4tPWwJTcd3px35uZwAdSdEk2yl9rYKfgMWGhqlRhU0+HSYCA10+jlEAp+
 IuyEzR5hM97t1mXxi35tMtFC/g0nr263dXjY3ITrqng5V3EMfSeWOvWdnjR9xSGUT0bBFVgSC
 70w7K3KrRMc26ie6vDj/aHBl1LHIT7si0FzRCavLoUAuWO0axJzs0ORCB04eC36gNCSsctCMD
 CnXydYfDZ7eiGU2I48f01E9glG+AIT7FzAncSRzH3isuG1jndOiwrPz++B50XMKbnLYMJ3xaN
 8mmIiLS7lhjrdl70490/J5n+DR3gHr2Bm5wW2xY8l4wUTARumB1y5XYCy7PsfQ2/SrlEMtMe+
 y86sPDjsO4YAhAs8W2cqbabNHlBHHnXfZQGkDv5ITm0eqCl2bhQRmY8ku+QkijK7pf6zwZvwT
 XumJ0A3CtOanVBVUmTL9bmEllGOMR9xvdReG4uT+xovI43sotJ66EH9m8U6EymiC1t/bAEjZV
 fEghltCEll9zh7OHc4bBRz/pY86acwVKA6ngA7ZKudMW9K8xEAJMlygw6f7UCHAg+HP+2o62H
 pJm95hWQY2Za1Exx3qOiGv8CprXWOfG/pvulmjqrPSjjglBZ1uQXfjXFkYgTZfu8NOYju3vkF
 07+zhpNHxxixj2sLJH55G4ueRWYAQy469Ab1AfC3dM9Zp49SXVZ7hAraH7cTuBIRQJk0aZo3c
 gctM+NqE0YXlFQ=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/10/21 20:38, Sven Schnelle wrote:
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
>  arch/parisc/kernel/entry.S          | 74 +++++++++++++++++++++++++++
>  arch/parisc/kernel/processor.c      | 22 ++++++++
>  arch/parisc/kernel/traps.c          | 79 +++++++++++++++++++++++++++++
>  5 files changed, 183 insertions(+), 2 deletions(-)
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
> index 9f939afe6b88..25ec47e9ae24 100644
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
> @@ -2414,3 +2415,76 @@ ENTRY_CFI(set_register)
>  	copy    %r1,%r31
>  ENDPROC_CFI(set_register)
>
> +	.import toc_intr,code
> +	.import toc_lock,data
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
> +	load32	PA(toc_stack),%sp
> +	/*
> +	 * deposit CPU number into stack address,
> +	 * so every CPU will have its own stack.
> +	 */
> +	SHLREG	%r4,14,%r4
> +	add	%r4,%sp,%sp
> +
> +	/* setup pt_regs on stack and save the
> +	 * floating point registers. PIM_TOC doesn't
> +	 * save fp registers, so we're doing it here.
> +	 */
> +	copy	%sp,%arg0
> +	ldo	PT_SZ_ALGN(%sp), %sp
> +
> +	/* clear pt_regs */
> +	copy	%arg0,%r1
> +0:	cmpb,<<,n %r1,%sp,0b
> +	stw,ma	%r0,4(%r1)
> +
> +	ldo	PT_FR0(%arg0),%r25
> +	save_fp	%r25
> +
> +	/* go virtual */
> +	load32	PA(swapper_pg_dir),%r4
> +	mtctl	%r4,%cr24
> +	mtctl	%r4,%cr25
> +
> +	/* Clear sr4-sr7 */
> +	mtsp	%r0, %sr4
> +	mtsp	%r0, %sr5
> +	mtsp	%r0, %sr6
> +	mtsp	%r0, %sr7
> +
> +	tovirt_r1 %sp
> +	tovirt_r1 %arg0
> +	virt_map
> +
> +	loadgp
> +#ifdef CONFIG_64BIT
> +	ldo	-16(%sp),%r29
> +#endif
> +	b,l	toc_intr,%r2
> +	nop
> +0:	b	0b
> +ENDPROC_CFI(toc_handler)
> +
> +	/*
> +	 * keep this checksum here, as it is part of the toc_handler
> +	 * spanned by toc_handler_size (all words in toc_handler are
> +	 * added in PDC and the sum must equal to zero.
> +	 */
> +SYM_DATA(toc_handler_csum, .long 0)
> +SYM_DATA(toc_handler_size, .long . - toc_handler)
> +
> +	__PAGE_ALIGNED_BSS
> +	.align 64
> +SYM_DATA(toc_stack, .block 16384*NR_CPUS)
> diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/process=
or.c
> index 1b6129e7d776..c6e4fee79f30 100644
> --- a/arch/parisc/kernel/processor.c
> +++ b/arch/parisc/kernel/processor.c
> @@ -28,6 +28,7 @@
>  #include <asm/pdcpat.h>
>  #include <asm/irq.h>		/* for struct irq_region */
>  #include <asm/parisc-device.h>
> +#include <asm/sections.h>
>
>  struct system_cpuinfo_parisc boot_cpu_data __ro_after_init;
>  EXPORT_SYMBOL(boot_cpu_data);
> @@ -37,6 +38,7 @@ EXPORT_SYMBOL(_parisc_requires_coherency);
>  #endif
>
>  DEFINE_PER_CPU(struct cpuinfo_parisc, cpu_data);
> +unsigned int __aligned(16) toc_lock =3D 1;
>
>  /*
>  **  	PARISC CPU driver - claim "device" and initialize CPU data structu=
res.
> @@ -453,6 +455,25 @@ static struct parisc_driver cpu_driver __refdata =
=3D {
>  	.probe		=3D processor_probe
>  };
>
> +static __init void setup_toc(void)
> +{
> +	unsigned int csum =3D 0;
> +	unsigned long toc_code =3D (unsigned long)dereference_function_descrip=
tor(toc_handler);
> +	int i;
> +
> +	PAGE0->vec_toc =3D __pa(toc_code) & 0xffffffff;
> +#ifdef CONFIG_64BIT
> +	PAGE0->vec_toc_hi =3D __pa(toc_code) >> 32;
> +#else
> +	PAGE0->vec_toc_hi =3D 0;
> +#endif
> +	PAGE0->vec_toclen =3D toc_handler_size;
> +
> +	for (i =3D 0; i < toc_handler_size/4; i++)
> +		csum +=3D ((u32 *)toc_code)[i];
> +	toc_handler_csum =3D -csum;
> +}
> +
>  /**
>   * processor_init - Processor initialization procedure.
>   *
> @@ -460,5 +481,6 @@ static struct parisc_driver cpu_driver __refdata =3D=
 {
>   */
>  void __init processor_init(void)
>  {
> +	setup_toc();
>  	register_parisc_driver(&cpu_driver);
>  }
> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
> index 747c328fb886..e847d37eda3a 100644
> --- a/arch/parisc/kernel/traps.c
> +++ b/arch/parisc/kernel/traps.c
> @@ -30,6 +30,8 @@
>  #include <linux/ratelimit.h>
>  #include <linux/uaccess.h>
>  #include <linux/kdebug.h>
> +#include <linux/kdb.h>
> +#include <linux/reboot.h>
>
>  #include <asm/assembly.h>
>  #include <asm/io.h>
> @@ -472,6 +474,83 @@ void parisc_terminate(char *msg, struct pt_regs *re=
gs, int code, unsigned long o
>  	panic(msg);
>  }
>
> +static void toc20_to_pt_regs(struct pt_regs *regs, struct pdc_toc_pim_2=
0 *toc)
> +{
> +	int i;
> +
> +	regs->gr[0] =3D (unsigned long)toc->cr[22];
> +
> +	for (i =3D 1; i < 32; i++)
> +		regs->gr[i] =3D (unsigned long)toc->gr[i];
> +
> +	for (i =3D 0; i < 8; i++)
> +		regs->sr[i] =3D (unsigned long)toc->sr[i];
> +
> +	regs->iasq[0] =3D (unsigned long)toc->cr[17];
> +	regs->iasq[1] =3D (unsigned long)toc->iasq_back;
> +	regs->iaoq[0] =3D (unsigned long)toc->cr[18];
> +	regs->iaoq[1] =3D (unsigned long)toc->iaoq_back;
> +
> +	regs->sar =3D (unsigned long)toc->cr[11];
> +	regs->iir =3D (unsigned long)toc->cr[19];
> +	regs->isr =3D (unsigned long)toc->cr[20];
> +	regs->ior =3D (unsigned long)toc->cr[21];
> +}
> +
> +static void toc11_to_pt_regs(struct pt_regs *regs, struct pdc_toc_pim_1=
1 *toc)
> +{
> +	int i;
> +
> +	regs->gr[0] =3D toc->cr[22];
> +
> +	for (i =3D 1; i < 32; i++)
> +		regs->gr[i] =3D toc->gr[i];
> +
> +	for (i =3D 0; i < 8; i++)
> +		regs->sr[i] =3D toc->sr[i];
> +
> +	regs->iasq[0] =3D toc->cr[17];
> +	regs->iasq[1] =3D toc->iasq_back;
> +	regs->iaoq[0] =3D toc->cr[18];
> +	regs->iaoq[1] =3D toc->iaoq_back;
> +
> +	regs->sar  =3D toc->cr[11];
> +	regs->iir  =3D toc->cr[19];
> +	regs->isr  =3D toc->cr[20];
> +	regs->ior  =3D toc->cr[21];
> +}
> +
> +void notrace toc_intr(struct pt_regs *regs)
> +{
> +	struct pdc_toc_pim_20 pim_data20;
> +	struct pdc_toc_pim_11 pim_data11;
> +
> +	nmi_enter();
> +
> +	if (boot_cpu_data.cpu_type >=3D pcxu) {

I wonder if this is correct.
If we boot a 32bit-kernel on a 64-bit (pcxu) machine, then
I think the code below for pdc_pim_toc11() should be executed.
So, maybe we need a #ifdef CONFIG_64BIT above...


> +		if (pdc_pim_toc20(&pim_data20))
> +			panic("Failed to get PIM data");
> +		toc20_to_pt_regs(regs, &pim_data20);
> +	} else {

... with an #else here

> +		if (pdc_pim_toc11(&pim_data11))
> +			panic("Failed to get PIM data");
> +		toc11_to_pt_regs(regs, &pim_data11);
> +	}

and #endif here. ??

Helge
