Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9032D2089
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Dec 2020 03:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgLHCMp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 7 Dec 2020 21:12:45 -0500
Received: from ozlabs.org ([203.11.71.1]:51023 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726830AbgLHCMp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 7 Dec 2020 21:12:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqkFk1lbhz9sVl;
        Tue,  8 Dec 2020 13:11:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1607393522;
        bh=8iatVVr0doYmwZkFttS9+pNaCgbzkGB02uHrnQhLiF8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=A+bTf/m4exrBzJQZZvJo1q/5I9F0e/kw2E+pim46e67Fp3WWpClGMiQNgwlZTzfU5
         I91uiE2tnR89cD+WGpK6EIXolGlF2xpp74/37NX1a4hXEYFP7nir39xaYb5e/F3vCb
         A+SkpejOFGPjty5Wk0ZUtqnVutg9ep0o6GlRwQv0/PtQ9j8c5Nr0LI3vZ1NqBGdb0h
         J534woc8YaDSyTziDQyKc3WR7uExS/b30LlE1Lw5O+U2aAfz6JdpZ+f5IJ7hgsNKbn
         QhmyAHIUVIBK5JkTWtwrtTIzrOTiojdPvRTPLcDwX5fD+26iC1ivFoDwf0/4YZWmF+
         hnKEnJn1lo/hg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     "Enrico Weigelt\, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com, deller@gmx.de,
        benh@kernel.crashing.org, paulus@samba.org, jdike@addtoit.com,
        richard@nod.at, anton.ivanov@cambridgegreys.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-um@lists.infradead.org
Subject: Re: [PATCH] arch: fix 'unexpected IRQ trap at vector' warnings
In-Reply-To: <20201207143146.30021-1-info@metux.net>
References: <20201207143146.30021-1-info@metux.net>
Date:   Tue, 08 Dec 2020 13:11:52 +1100
Message-ID: <877dptt5av.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

"Enrico Weigelt, metux IT consult" <info@metux.net> writes:
> All archs, except Alpha, print out the irq number in hex, but the message
> looks like it was a decimal number, which is quite confusing. Fixing this
> by adding "0x" prefix.

Arguably decimal would be better, /proc/interrupts and /proc/irq/ both
use decimal.

The whole message is very dated IMO, these days the number it prints is
(possibly) virtualised via IRQ domains, ie. it's not necessarily a
"vector" if that even makes sense on all arches). Arguably "trap" is the
wrong term on some arches too.

So it would be better reworded entirely IMO, and also switched to
decimal to match other sources of information on interrupts.

Perhaps:
	"Unexpected Linux IRQ %d."


If anyone else is having deja vu like me, yes this has come up before:
  https://lore.kernel.org/lkml/20150712220211.7166.42035.stgit@bhelgaas-glaptop2.roam.corp.google.com/

cheers



> diff --git a/arch/arm/include/asm/hw_irq.h b/arch/arm/include/asm/hw_irq.h
> index cecc13214ef1..2749f19271d9 100644
> --- a/arch/arm/include/asm/hw_irq.h
> +++ b/arch/arm/include/asm/hw_irq.h
> @@ -9,7 +9,7 @@ static inline void ack_bad_irq(int irq)
>  {
>  	extern unsigned long irq_err_count;
>  	irq_err_count++;
> -	pr_crit("unexpected IRQ trap at vector %02x\n", irq);
> +	pr_crit("unexpected IRQ trap at vector 0x%02x\n", irq);
>  }
>  
>  #define ARCH_IRQ_INIT_FLAGS	(IRQ_NOREQUEST | IRQ_NOPROBE)
> diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
> index 7f7039516e53..c3348af88d3f 100644
> --- a/arch/parisc/include/asm/hardirq.h
> +++ b/arch/parisc/include/asm/hardirq.h
> @@ -35,6 +35,6 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
>  #define __IRQ_STAT(cpu, member) (irq_stat[cpu].member)
>  #define inc_irq_stat(member)	this_cpu_inc(irq_stat.member)
>  #define __inc_irq_stat(member)	__this_cpu_inc(irq_stat.member)
> -#define ack_bad_irq(irq) WARN(1, "unexpected IRQ trap at vector %02x\n", irq)
> +#define ack_bad_irq(irq) WARN(1, "unexpected IRQ trap at vector 0x%02x\n", irq)
>  
>  #endif /* _PARISC_HARDIRQ_H */
> diff --git a/arch/powerpc/include/asm/hardirq.h b/arch/powerpc/include/asm/hardirq.h
> index f133b5930ae1..ec8cf3cf6e49 100644
> --- a/arch/powerpc/include/asm/hardirq.h
> +++ b/arch/powerpc/include/asm/hardirq.h
> @@ -29,7 +29,7 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
>  
>  static inline void ack_bad_irq(unsigned int irq)
>  {
> -	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
> +	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
>  }
>  
>  extern u64 arch_irq_stat_cpu(unsigned int cpu);
> diff --git a/arch/s390/include/asm/hardirq.h b/arch/s390/include/asm/hardirq.h
> index dfbc3c6c0674..aaaec5cdd4fe 100644
> --- a/arch/s390/include/asm/hardirq.h
> +++ b/arch/s390/include/asm/hardirq.h
> @@ -23,7 +23,7 @@
>  
>  static inline void ack_bad_irq(unsigned int irq)
>  {
> -	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
> +	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
>  }
>  
>  #endif /* __ASM_HARDIRQ_H */
> diff --git a/arch/um/include/asm/hardirq.h b/arch/um/include/asm/hardirq.h
> index b426796d26fd..2a2e6eae034b 100644
> --- a/arch/um/include/asm/hardirq.h
> +++ b/arch/um/include/asm/hardirq.h
> @@ -15,7 +15,7 @@ typedef struct {
>  #ifndef ack_bad_irq
>  static inline void ack_bad_irq(unsigned int irq)
>  {
> -	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
> +	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
>  }
>  #endif
>  
> diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
> index c5dd50369e2f..957c716f2df7 100644
> --- a/arch/x86/kernel/irq.c
> +++ b/arch/x86/kernel/irq.c
> @@ -37,7 +37,7 @@ atomic_t irq_err_count;
>  void ack_bad_irq(unsigned int irq)
>  {
>  	if (printk_ratelimit())
> -		pr_err("unexpected IRQ trap at vector %02x\n", irq);
> +		pr_err("unexpected IRQ trap at vector 0x%02x\n", irq);
>  
>  	/*
>  	 * Currently unexpected vectors happen only on SMP and APIC.
> -- 
> 2.11.0
