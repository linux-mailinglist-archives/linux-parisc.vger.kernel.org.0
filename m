Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E4E4B1476
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Feb 2022 18:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244068AbiBJRmo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Feb 2022 12:42:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238232AbiBJRmn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Feb 2022 12:42:43 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDA7F6F
        for <linux-parisc@vger.kernel.org>; Thu, 10 Feb 2022 09:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644514958;
        bh=qZdDCfkt1reihgWAEmBYs3bX0M2VRzn1BVbOn54l2g4=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=XpfE1qcp1xm5gbdA5WcPOqqBezhhPFRyiB30cZqWKG8K2eN3TdJQXgd4Wt13jpA9K
         YB5PxWe6EzwA3u25RGS3kOQS7Zw0PMg/hWZ0NxuNVtQEBYk5ZLzHIDTJ93nzC80uN8
         NKBSFqJm/vpp9XpSJBBRPw5r/YFax1DMaXQnmJK0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.179.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VHG-1oP4Tf3Sdm-01705s; Thu, 10
 Feb 2022 18:42:37 +0100
Message-ID: <f8824531-5049-de72-29a3-7a72fdcee5d7@gmx.de>
Date:   Thu, 10 Feb 2022 18:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] parisc: Fix some apparent put_user() failures
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20220210173747.217574-1-deller@gmx.de>
In-Reply-To: <20220210173747.217574-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GlCVOtZ+cDbccWCLtuxL295Yqqu3hg908cNLIHhzCVOvmJhzLGe
 004VhwFXJh2Y44avlJArFO5qSOvzjjGH7gdGxMxg9V/XW0LKpEG126ikL2PSfghfpC5QMVt
 2AnUfs5dSNHvbEYGO+WVH5SL5G4QY9+nIbBzl20NJxkarC6/+G33vs3TBk7mX2Jw7nkMk5N
 pZM9ddwughME0gwPB+UNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VbAZtxRAZFM=:ci0MIOeUMP0Hptos2knXIU
 RBmZVLVhH1/QLNBVdN66Yu5RUfsD18HXC8g5eXrHpoqzlKhvdFYiaI+9utUy3B4tHIBB+czls
 g5AHFjnYclnKnoRqF9Zb7a7X5grWk6MDaTuIOnmCkNVWccP8S+il2uy5dCcKgDzNDm9Vkna8q
 ClVkcHz3OuCx5c7zFlcdRNEtGpwHX1bb6xysQdOiEFvyVXmB3vc2d2KPtWQuplSKM76ESeCKO
 oU0PawCB58FntEsfvovKqsUc3nhY7MnF1Ukqoes8Htx1Ci8i091IyQRsLJwFs0BER/VH++3aa
 wOdmBx5066ti/fm3XFweNU2NYufEfPTjaUtXk9v/CxJY9nzNjPmEk43o/XTM09HxiRZmHEtPz
 tzwPyHk+qX10x2qhQPu6hkMy7Bzthqs5msIGiSg1ftDDVOWMjZGQ17PJ3FG95Hq2A5uyb5vim
 LD2tq6hJEQFGuDtFA8NiXi/6LmUSpPETbC/MSTTgT0BYqdumZnIrGnjeV3hyvxgr9iSFN/zkf
 +F2YRPrni1CdUoB+5UgqhPjbh3QZGTx5aPnC1Ybsp4thmf6b2O+K6CXIB3Ia2EP4ozUP3ihnH
 bsEzjjdq5x/n7qbHwUaMJlcWLTkk3ZJG+Fib3+gMOQJPmcJKZiekoOc4GVoofKh6liWNtIa4X
 czM484oH6yVVBPW9JcmoW1tyido5AS3eUxAsW13XkEIUUBDw7CpJdi+WRFqDS9dBK/IJCbygj
 FPNjjzhqXsHrd1pj4oON348ixK0a/7NANDrzaWNz843WAAWym42197mB/T3AlLzjtr8H/5dZX
 GOsL64ql4EP63qsca40V0D+CEbzSRY3tEMJRSxEViPz6US9nF6AQ1Y5lYuu7cruwq7FlHKnEJ
 eOZyM0RyXToePPcJwJddwZbgwTKU0snswhxfAL00u9CHzPipsBG0U4WRIeByzHLEUl36/3I2d
 4UmPQFKCElC5TD9rhNjNaI84rODU5jzwxrZLehIpXFEtct7S1zxGFMV0/kueu8rug2uRaBnNZ
 Kp9kCjkqAw2Ba9kDBmIxPXmUFRCkYf8FPcdHgrudj9bOpC5iUZt70ZstY5bOBBje36CCgll2j
 GjIp4r7vGzOAts=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/10/22 18:37, Helge Deller wrote:
> After commit 4b9d2a731c3d ("parisc: Switch user access functions
> to signal errors in r29 instead of r8") bash suddenly started
> to report those warnings after login:
>
> -bash: cannot set terminal process group (-1): Bad file descriptor
> -bash: no job control in this shell
>
> It turned out, that a function call inside a put_user(), e.g.:
> put_user(vt_do_kdgkbmode(console), (int __user *)arg);
> clobbered the error register (r29) and thus the put_user() call itself
> seem to have failed. Rearranging the C instructions didn't helped,
> because then sometimes the compiler choosed another register which would
> break the fault handler.
>
> This patch now takes another and much smarter approach.
>
> Instead of hardcoding a specific register as fault register, leave the
> decision up to the compiler. In the load/store assembly we initialize
> this register with zero by using "copy %%r0,reg".
>
> In case a fault happens, the fault handler will now read this copy
> instruction, extract the used fault register and store the -EFAULT
> failure code in it.
>
> Reported-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Fixes: 4b9d2a731c3d ("parisc: Switch user access functions to signal err=
ors in r29 instead of r8")
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/include/asm/uaccess.h | 35 ++++++++++++++++---------------
>  arch/parisc/mm/fault.c            | 26 ++++++++++++++++++-----
>  2 files changed, 39 insertions(+), 22 deletions(-)
>
> diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm=
/uaccess.h
> index ebf8a845b017..8254f0f09e2e 100644
> --- a/arch/parisc/include/asm/uaccess.h
> +++ b/arch/parisc/include/asm/uaccess.h
> @@ -53,18 +53,15 @@ struct exception_table_entry {
>  /*
>   * ASM_EXCEPTIONTABLE_ENTRY_EFAULT() creates a special exception table =
entry
>   * (with lowest bit set) for which the fault handler in fixup_exception=
() will
> - * load -EFAULT into %r29 for a read or write fault, and zeroes the tar=
get
> - * register in case of a read fault in get_user().
> + * load -EFAULT into the error register for a read or write fault, and =
zeroes
> + * the target register in case of a read fault in get_user().
>   */
> -#define ASM_EXCEPTIONTABLE_REG	29
> -#define ASM_EXCEPTIONTABLE_VAR(__variable)		\
> -	register long __variable __asm__ ("r29") =3D 0
>  #define ASM_EXCEPTIONTABLE_ENTRY_EFAULT( fault_addr, except_addr )\
>  	ASM_EXCEPTIONTABLE_ENTRY( fault_addr, except_addr + 1)
>
>  #define __get_user_internal(sr, val, ptr)		\
>  ({							\
> -	ASM_EXCEPTIONTABLE_VAR(__gu_err);		\
> +	register long __gu_err;				\
>  							\
>  	switch (sizeof(*(ptr))) {			\
>  	case 1: __get_user_asm(sr, val, "ldb", ptr); break; \
> @@ -86,11 +83,12 @@ struct exception_table_entry {
>  {							\
>  	register long __gu_val;				\
>  							\
> -	__asm__("1: " ldx " 0(" sr "%2),%0\n"		\
> +	__asm__("\tcopy %%r0,%1\n"			\
> +		"1: " ldx " 0(" sr "%2),%0\n"		\
>  		"9:\n"					\
>  		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
> -		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)        \
> -		: "r"(ptr), "1"(__gu_err));		\
> +		: "=3D&r"(__gu_val), "=3D&r"(__gu_err)	\
> +		: "r"(ptr));				\
>  							\
>  	(val) =3D (__force __typeof__(*(ptr))) __gu_val;	\
>  }
> @@ -117,14 +115,15 @@ struct exception_table_entry {
>  		__typeof__(*(ptr))	t;		\
>  	} __gu_tmp;					\
>  							\
> -	__asm__("   copy %%r0,%R0\n"			\
> +	__asm__("\tcopy %%r0,%R0\n"			\
> +		"\tcopy %%r0,%1\n"			\
>  		"1: ldw 0(" sr "%2),%0\n"		\
>  		"2: ldw 4(" sr "%2),%R0\n"		\

I just notice that this approach fails on such loads/stores
where multiple ldw/stw statements are used.
In this case we need to check the last two instructions for
the copy assembly statement.
Will fix and send updated patch.

Helge



>  		"9:\n"					\
>  		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
>  		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	\
> -		: "=3D&r"(__gu_tmp.l), "=3Dr"(__gu_err)	\
> -		: "r"(ptr), "1"(__gu_err));		\
> +		: "=3D&r"(__gu_tmp.l), "=3D&r"(__gu_err)	\
> +		: "r"(ptr));				\
>  							\
>  	(val) =3D __gu_tmp.t;				\
>  }
> @@ -134,8 +133,8 @@ struct exception_table_entry {
>
>  #define __put_user_internal(sr, x, ptr)				\
>  ({								\
> -	ASM_EXCEPTIONTABLE_VAR(__pu_err);		      	\
>          __typeof__(*(ptr)) __x =3D (__typeof__(*(ptr)))(x);	\
> +	register long __pu_err;					\
>  								\
>  	switch (sizeof(*(ptr))) {				\
>  	case 1: __put_user_asm(sr, "stb", __x, ptr); break;	\
> @@ -177,24 +176,26 @@ struct exception_table_entry {
>
>  #define __put_user_asm(sr, stx, x, ptr)				\
>  	__asm__ __volatile__ (					\
> +		"\tcopy %%r0,%0\n"				\
>  		"1: " stx " %2,0(" sr "%1)\n"			\
>  		"9:\n"						\
>  		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
> -		: "=3Dr"(__pu_err)				\
> -		: "r"(ptr), "r"(x), "0"(__pu_err))
> +		: "=3D&r"(__pu_err)				\
> +		: "r"(ptr), "r"(x))
>
>
>  #if !defined(CONFIG_64BIT)
>
>  #define __put_user_asm64(sr, __val, ptr) do {			\
>  	__asm__ __volatile__ (					\
> +		"\tcopy %%r0,%0\n"				\
>  		"1: stw %2,0(" sr "%1)\n"			\
>  		"2: stw %R2,4(" sr "%1)\n"			\
>  		"9:\n"						\
>  		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
>  		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)		\
> -		: "=3Dr"(__pu_err)				\
> -		: "r"(ptr), "r"(__val), "0"(__pu_err));		\
> +		: "=3D&r"(__pu_err)				\
> +		: "r"(ptr), "r"(__val));			\
>  } while (0)
>
>  #endif /* !defined(CONFIG_64BIT) */
> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index e9eabf8f14d7..d8f07d7430b0 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -148,18 +148,33 @@ int fixup_exception(struct pt_regs *regs)
>  		 * Fix up get_user() and put_user().
>  		 * ASM_EXCEPTIONTABLE_ENTRY_EFAULT() sets the least-significant
>  		 * bit in the relative address of the fixup routine to indicate
> -		 * that gr[ASM_EXCEPTIONTABLE_REG] should be loaded with
> -		 * -EFAULT to report a userspace access error.
> +		 * that the error register should be loaded with -EFAULT to
> +		 * report a userspace access error. The error register is zeroed
> +		 * before doing the load or store, so the exception handler can
> +		 * read the "copy %%r0,reg" instruction to extract the register.
>  		 */
>  		if (fix->fixup & 1) {
> -			regs->gr[ASM_EXCEPTIONTABLE_REG] =3D -EFAULT;
> +			u32 treg;
>
>  			/* zero target register for get_user() */
>  			if (parisc_acctyp(0, regs->iir) =3D=3D VM_READ) {
> -				int treg =3D regs->iir & 0x1f;
> -				BUG_ON(treg =3D=3D 0);
> +				treg =3D regs->iir & 0x1f;
> +				if (WARN_ON(treg =3D=3D 0))
> +					goto wrong_get_put_user;
>  				regs->gr[treg] =3D 0;
>  			}
> +
> +			/* get previous assembly statement */
> +			__get_kernel_nofault(&treg, (regs->iaoq[0]-4) & ~3,
> +				u32, wrong_get_put_user);
> +			/* check assembly statement for: copy %r0,%rX */
> +			if (WARN_ON((treg & 0xffffff00) !=3D 0x08000200))
> +				goto wrong_get_put_user;
> +			/* extract error register used for get_user/put_user */
> +			treg &=3D 0x1f;
> +			if (WARN_ON(treg =3D=3D 0))
> +				goto wrong_get_put_user;
> +			regs->gr[treg] =3D -EFAULT;
>  		}
>
>  		regs->iaoq[0] =3D (unsigned long)&fix->fixup + fix->fixup;
> @@ -177,6 +192,7 @@ int fixup_exception(struct pt_regs *regs)
>  		return 1;
>  	}
>
> +wrong_get_put_user:
>  	return 0;
>  }
>
> --
> 2.34.1
>

