Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1C735F076
	for <lists+linux-parisc@lfdr.de>; Wed, 14 Apr 2021 11:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbhDNJLL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 14 Apr 2021 05:11:11 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:16031 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230491AbhDNJLK (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 14 Apr 2021 05:11:10 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FKxXQ05PXz9txRC;
        Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 0zeBA9ZPccDQ; Wed, 14 Apr 2021 11:10:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FKxXP4rdvz9ttBY;
        Wed, 14 Apr 2021 11:10:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id BE0B88B7BC;
        Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id QZ2BMSlNARn7; Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 098558B7BA;
        Wed, 14 Apr 2021 11:10:44 +0200 (CEST)
Subject: Re: [PATCH] init: consolidate trap_init()
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Brian Cain <bcain@codeaurora.org>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc:     uclinux-h8-devel@lists.sourceforge.jp,
        linux-parisc@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
        openrisc@lists.librecores.org, Anup Patel <anup@brainfault.org>,
        linux-riscv@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org
References: <20210414165808.458a3d11@xhacker.debian>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
Date:   Wed, 14 Apr 2021 11:10:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414165808.458a3d11@xhacker.debian>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



Le 14/04/2021 à 10:58, Jisheng Zhang a écrit :
> Many architectures implement the trap_init() as NOP, since there is
> no such default for trap_init(), this empty stub is duplicated among
> these architectures. Provide a generic but weak NOP implementation
> to drop the empty stubs of trap_init() in these architectures.

You define the weak function in the __init section.

Most but not all architectures had it in __init section.

And the remaining ones may not be defined in __init section. For instance look at the one in alpha 
architecture.

Have you checked that it is not a problem ? It would be good to say something about it in the commit 
description.


> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
>   arch/arc/kernel/traps.c      |  5 -----
>   arch/arm/kernel/traps.c      |  5 -----
>   arch/h8300/kernel/traps.c    | 13 -------------
>   arch/hexagon/kernel/traps.c  |  4 ----
>   arch/nds32/kernel/traps.c    |  5 -----
>   arch/nios2/kernel/traps.c    |  5 -----
>   arch/openrisc/kernel/traps.c |  5 -----
>   arch/parisc/kernel/traps.c   |  4 ----
>   arch/powerpc/kernel/traps.c  |  5 -----
>   arch/riscv/kernel/traps.c    |  5 -----
>   arch/um/kernel/trap.c        |  4 ----
>   init/main.c                  |  2 ++
>   12 files changed, 2 insertions(+), 60 deletions(-)
> 
> diff --git a/init/main.c b/init/main.c
> index 53b278845b88..4bdbe2928530 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -790,6 +790,8 @@ static inline void initcall_debug_enable(void)
>   }
>   #endif
>   
> +void __init __weak trap_init(void) { }
> +

I think in a C file we don't try to save space as much as in a header file.

I would prefer something like:


void __init __weak trap_init(void)
{
}


>   /* Report memory auto-initialization states for this boot. */
>   static void __init report_meminit(void)
>   {
> 
