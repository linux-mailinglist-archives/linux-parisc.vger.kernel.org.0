Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6AD4B0A89
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Feb 2022 11:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239612AbiBJK2c (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Feb 2022 05:28:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238573AbiBJK2c (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Feb 2022 05:28:32 -0500
X-Greylist: delayed 94 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Feb 2022 02:28:31 PST
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3044FB19
        for <linux-parisc@vger.kernel.org>; Thu, 10 Feb 2022 02:28:30 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6203EF9900127C35
X-CM-Envelope: MS4xfDJIsY+6hbYQj5Ftk+QYkP+7GABtKD5U8+PCBOIetCnk+1lir85HliflUuqvo6ot8kNfZ9ZWJeq2Z8TOabDZp2vzvlTdBPCaDo6rX8A57UnqiOiDzNTy
 kQ7yXuHNoAI887HqfoAw7+eYok6p0JnKShpZ5KU1tZfp2eTJvyMVvUL9oakbOQdQY5+DDQoepSKg4iK51D115PMtwhsuuiPk20DbdcBHX3COp8upLZ7uLp0o
 I5SGLp/3vccOY0wsK7sq0b5E1RfQxSY/Gqqt5UDteG4SN0E/Ga3rvtQbqyhF2jFsTQlAZYR217D4cCJhudufJ50d0xxUXOD5mDrikpDJCdQz8RXD8+zYpBar
 6gOOKaF7
X-CM-Analysis: v=2.4 cv=WtFIjfTv c=1 sm=1 tr=0 ts=6204e86c
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=cdt4hjqr0NvdLZR53CsA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6203EF9900127C35; Thu, 10 Feb 2022 05:26:52 -0500
Message-ID: <f82d3a96-c70a-5eee-5e2d-905175597978@bell.net>
Date:   Thu, 10 Feb 2022 05:26:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] parisc: Fix user access miscompilation
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Sven Schnelle <svens@stackframe.org>
References: <YgQGzle/mBRK9lBc@p100>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <YgQGzle/mBRK9lBc@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-02-09 1:24 p.m., Helge Deller wrote:
> After commit 4b9d2a731c3d ("parisc: Switch user access functions
> to signal errors in r29 instead of r8") bash suddenly started
> to report those warnings after login:
>
> -bash: cannot set terminal process group (-1): Bad file descriptor
> -bash: no job control in this shell
>
> It turned out, that another function call inside a put_user(), e.g.:
>    put_user(vt_do_kdgkbmode(console), (int __user *)arg);
> clobbered the error register (r29) and thus failed.
> Avoid this miscompilation by first calculate the value in
> __put_user() before calling __put_user_internal() to actually
> write the value to user space.
Couldn't the same issue occur with ptr argument in these macros?
>
> Additionally, prefer the "+" constraint on pu_err and gu_err registers to tell
> the compiler that those operands are both read and written by the assembly
> instruction.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Fixes: 4b9d2a731c3d ("parisc: Switch user access functions to signal errors in r29 instead of r8")
>
> diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
> index ebf8a845b017..68f5c1eaaa6f 100644
> --- a/arch/parisc/include/asm/uaccess.h
> +++ b/arch/parisc/include/asm/uaccess.h
> @@ -89,7 +89,7 @@ struct exception_table_entry {
>   	__asm__("1: " ldx " 0(" sr "%2),%0\n"		\
>   		"9:\n"					\
>   		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
> -		: "=r"(__gu_val), "=r"(__gu_err)        \
> +		: "=&r"(__gu_val), "+r"(__gu_err)        \
I don't believe the early clobber is needed on __gnu_val.
>   		: "r"(ptr), "1"(__gu_err));		\
>   							\
>   	(val) = (__force __typeof__(*(ptr))) __gu_val;	\
> @@ -123,7 +123,7 @@ struct exception_table_entry {
>   		"9:\n"					\
>   		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
>   		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	\
> -		: "=&r"(__gu_tmp.l), "=r"(__gu_err)	\
> +		: "=&r"(__gu_tmp.l), "+r"(__gu_err)	\
>   		: "r"(ptr), "1"(__gu_err));		\
>   							\
>   	(val) = __gu_tmp.t;				\
> @@ -132,10 +132,9 @@ struct exception_table_entry {
>   #endif /* !defined(CONFIG_64BIT) */
>
>
> -#define __put_user_internal(sr, x, ptr)				\
> +#define __put_user_internal(sr, __x, ptr)			\
>   ({								\
>   	ASM_EXCEPTIONTABLE_VAR(__pu_err);		      	\
> -        __typeof__(*(ptr)) __x = (__typeof__(*(ptr)))(x);	\
>   								\
>   	switch (sizeof(*(ptr))) {				\
>   	case 1: __put_user_asm(sr, "stb", __x, ptr); break;	\
> @@ -150,7 +149,9 @@ struct exception_table_entry {
>
>   #define __put_user(x, ptr)					\
>   ({								\
> -	__put_user_internal("%%sr3,", x, ptr);			\
> +	 __typeof__(*(ptr)) __x = (__typeof__(*(ptr)))(x);	\
Whitespace?
> +								\
> +	__put_user_internal("%%sr3,", __x, ptr);		\
>   })
>
>   #define __put_kernel_nofault(dst, src, type, err_label)		\
> @@ -180,7 +181,7 @@ struct exception_table_entry {
>   		"1: " stx " %2,0(" sr "%1)\n"			\
>   		"9:\n"						\
>   		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
> -		: "=r"(__pu_err)				\
> +		: "+r"(__pu_err)				\
>   		: "r"(ptr), "r"(x), "0"(__pu_err))
>
>
> @@ -193,7 +194,7 @@ struct exception_table_entry {
>   		"9:\n"						\
>   		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)		\
>   		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)		\
> -		: "=r"(__pu_err)				\
> +		: "+r"(__pu_err)				\
>   		: "r"(ptr), "r"(__val), "0"(__pu_err));		\
>   } while (0)
>

Dave

-- 
John David Anglin  dave.anglin@bell.net

