Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7074D427D
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Mar 2022 09:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238225AbiCJI3v (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Mar 2022 03:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbiCJI3u (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Mar 2022 03:29:50 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C92CD135701
        for <linux-parisc@vger.kernel.org>; Thu, 10 Mar 2022 00:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1646900914;
        bh=JHVAdY6Be3OOhmQl2tpk8UkaI7zcNlBUi+FLEUAZxHQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=J1wqrSdcB+PiyaYr+Ypcb6dVTfQI8ldoYw5RdzFfA+ujo/B9zK1QnFynuCWuxqXhY
         PcSk3F1dPRcgzyim7tj/5SKDpvI0oKaZZz7qRJC2PS9OnL9xrKWJ1WoXSSH0i1E0Yb
         oHfOFUqtnfSqzNKeg7d5D752kx7pUZTwoFf00cRA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.196]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvvT-1o4IfP0JHp-00hQPU; Thu, 10
 Mar 2022 09:28:34 +0100
Message-ID: <e684b62c-ae9a-eb58-9c90-e8523bf318de@gmx.de>
Date:   Thu, 10 Mar 2022 09:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH, V2] parisc: Fix handling off probe non-access faults
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YikYvO5Qj+56wMtY@mx3210.localdomain>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <YikYvO5Qj+56wMtY@mx3210.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8/ohxj7vfF9cyAa8Dwm3siKZdOTTNryK31zdx/Wd2qKggf6VgUX
 Mc/aVMFf5wZ5qF0g01av4vb6Cl7m5cmgRoPajqkm3eyb3t2ekb7ASgRD60p1pM4FhzGBC6M
 srpqRHI4tDP4u5RHei4J8izFaP75aS3CgaP/sGcFZPlR+vnQwlekI8pPI+G5wEOLIgy+hWp
 Z1yBBhFnICx4FtvU6drCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cLY2WRsNEfU=:w1PcuOIb8F/F+Ua9hy6iGn
 qeLhaHvnpxzn09C8+EDJijUhqniHpef/1AgGqyaN14pbyasKwLE7bNPERYS6kIZIyZu5NXCsV
 WEh1+Apap8hmvkOs4cOuivSlT+p6faF2ixWSzkDVlJlAu5I/WIpqx9zHRcT0DxETGc3V3U2/X
 zZhMMhni8MkCP34yH4SC+ESsq4DzrAueAY7RdOqxXeFqxnjXuS5eeZNYPyh9NLhPJ6CGKBCbC
 A/ws7Q+t3lodkIrfurVWt5aA8KCtA0fz21OUvHpkPPKt7neCmPAmluRLO+ObuVnrhsjowQ3zP
 zb3zOAzITWpIDeUiPk1rMZrw1vdpDkrczvj2Lad+u+mvtOYc8ZSRbnExNuP7/ot3s7ZtL5ts4
 1DEPb0m/Vi+EKcHxS+DeCOc5uSHOzKlsSVocpXkZ30i0MDF4we4h+1kicGlmG58gd85V4w6HX
 XHzVRxqrrcA/bPYFb0jJ1Uc9esYClaEHpwje3vjRXQylM/E3YObxI5MmLBE2242rsMmmOMgs5
 hVPyzNdMz8unLV5BRWMzxzlTUAL/4YhB3AVmzLjFjwmHEsN+mFz0SwSJ/a+Ys5Cp4fcsD8Wl4
 OygWac8oQR8AJtyNZfklXHSsQqxyqK6fLRBgK9WXtwSqROS5YxXhSj8l1z+vtvIdZXq6NHrXa
 hE7sAhXpGYkpXsrZebAB8QB+LyPuxMjmbhG3TzRgXAcGG4DAgUGrPi7WTivCSPGJKGe0kxF33
 eZab+9qxlrrvNdpDuCiu++LoehtAhwoQ0CagIic6ve23IK4NalA/A5yXDHEiVWiNQ/6S8RPJi
 ncVJCLPNLQJ/S5i3wCE2OzEbbfDMKPYmqge7EqteBD5I/mZ+j9AXZ77Rj1T5m/KR91luRowGJ
 FO8TqIXuT2FitJDGBYr9jaAbzQgHToW97qP/E5K4oEzdZewUUi9EVDCm+/ZoYfRkCf5Ob0VXf
 t5MZO/KMmJhti/5aG5XqPMbhQYBAj3D4DhKhX9YGimIy1qRrnFsW2shamr8ErFtLEQ0C9/jNm
 B7eVRtUBlv1pwN5zqhiVqIkzqwVJrnxFpyd3F3AVcqHGEomZK9n+no2SahHSFncZKQ==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/9/22 22:14, John David Anglin wrote:
> Currently, the parisc kernel does not fully support non-access TLB
> fault handling for probe instructions. In the fast path, we set the
> target register to zero if it is not a shadowed register. The slow
> path is not implemented, so we call do_page_fault. The architecture
> indicates that non-access faults should not cause a page fault from
> disk.
>
> This change adds to code to provide non-access fault support for
> probe instructions. It also modifies the handling of faults on
> userspace so that if the address lies in a valid VMA and the access
> type matches that for the VMA, the probe target register is set to
> one. Otherwise, the target register is set to zero.
>
> This was done to make probe instructions more useful for userspace.
> Probe instructions are not very useful if they set the target register
> to zero whenever a page is not present in memory. Nominally, the
> purpose of the probe instruction is determine whether read or write
> access to a given address is allowed.
>
> This fixes a problem in function pointer comparison noticed in the
> glibc testsuite (stdio-common/tst-vfprintf-user-type). The same
> problem is likely in glibc (_dl_lookup_address).
>
> V2 adds flush and lpa instruction support to handle_nadtlb_fault.
>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>

Thanks Dave!

I've applied all of your 3 patches to the for-next branch.

Helge


> ---
>
> diff --git a/arch/parisc/include/asm/traps.h b/arch/parisc/include/asm/t=
raps.h
> index 34619f010c63..0ccdb738a9a3 100644
> --- a/arch/parisc/include/asm/traps.h
> +++ b/arch/parisc/include/asm/traps.h
> @@ -18,6 +18,7 @@ unsigned long parisc_acctyp(unsigned long code, unsign=
ed int inst);
>  const char *trap_name(unsigned long code);
>  void do_page_fault(struct pt_regs *regs, unsigned long code,
>  		unsigned long address);
> +int handle_nadtlb_fault(struct pt_regs *regs);
>  #endif
>
>  #endif
> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
> index b6fdebddc8e9..39576a9245c7 100644
> --- a/arch/parisc/kernel/traps.c
> +++ b/arch/parisc/kernel/traps.c
> @@ -662,6 +662,8 @@ void notrace handle_interruption(int code, struct pt=
_regs *regs)
>  			 by hand. Technically we need to emulate:
>  			 fdc,fdce,pdc,"fic,4f",prober,probeir,probew, probeiw
>  		*/
> +		if (code =3D=3D 17 && handle_nadtlb_fault(regs))
> +			return;
>  		fault_address =3D regs->ior;
>  		fault_space =3D regs->isr;
>  		break;
> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index e9eabf8f14d7..39f813dcb008 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -425,3 +425,92 @@ void do_page_fault(struct pt_regs *regs, unsigned l=
ong code,
>  	}
>  	pagefault_out_of_memory();
>  }
> +
> +/* Handle non-access data TLB miss faults.
> + *
> + * For probe instructions, accesses to userspace are considered allowed
> + * if they lie in a valid VMA and the access type matches. We are not
> + * allowed to handle MM faults here so there may be situations where an
> + * actual access would fail even though a probe was successful.
> + */
> +int
> +handle_nadtlb_fault(struct pt_regs *regs)
> +{
> +	unsigned long insn =3D regs->iir;
> +	int breg, treg, xreg, val =3D 0;
> +	struct vm_area_struct *vma, *prev_vma;
> +	struct task_struct *tsk;
> +	struct mm_struct *mm;
> +	unsigned long address;
> +	unsigned long acc_type;
> +
> +	switch (insn & 0x380) {
> +	case 0x280:
> +		/* FDC instruction */
> +		fallthrough;
> +	case 0x380:
> +		/* PDC and FIC instructions */
> +		if(printk_ratelimit()) {
> +			pr_warn("BUG: nullifying cache flush/purge instruction\n");
> +			show_regs(regs);
> +		 }
> +		if (insn & 0x20) {
> +			/* Base modification */
> +			breg =3D (insn >> 21) & 0x1f;
> +			xreg =3D (insn >> 16) & 0x1f;
> +			if (breg && xreg)
> +				regs->gr[breg] +=3D regs->gr[xreg];
> +		}
> +		regs->gr[0] |=3D PSW_N;
> +		return 1;
> +
> +	case 0x180:
> +		/* PROBE instruction */
> +		treg =3D insn & 0x1f;
> +		if (regs->isr) {
> +			tsk =3D current;
> +			mm =3D tsk->mm;
> +			if (mm) {
> +				/* Search for VMA */
> +				address =3D regs->ior;
> +				mmap_read_lock(mm);
> +				vma =3D find_vma_prev(mm, address, &prev_vma);
> +				mmap_read_unlock(mm);
> +
> +				/*
> +				 * Check if access to the VMA is okay.
> +				 * We don't allow for stack expansion.
> +				 */
> +				acc_type =3D (insn & 0x40) ? VM_WRITE : VM_READ;
> +				if (vma
> +				    && address >=3D vma->vm_start
> +				    && (vma->vm_flags & acc_type) =3D=3D acc_type)
> +					val =3D 1;
> +			}
> +		}
> +		if (treg)
> +			regs->gr[treg] =3D val;
> +		regs->gr[0] |=3D PSW_N;
> +		return 1;
> +
> +	case 0x300:
> +		/* LPA instruction */
> +		if (insn & 0x20) {
> +			/* Base modification */
> +			breg =3D (insn >> 21) & 0x1f;
> +			xreg =3D (insn >> 16) & 0x1f;
> +			if (breg && xreg)
> +				regs->gr[breg] +=3D regs->gr[xreg];
> +		}
> +		treg =3D insn & 0x1f;
> +		if (treg)
> +			regs->gr[treg] =3D 0;
> +		regs->gr[0] |=3D PSW_N;
> +		return 1;
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}

