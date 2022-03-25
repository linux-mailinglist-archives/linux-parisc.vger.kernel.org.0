Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9257B4E79BE
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 18:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376936AbiCYRSJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 13:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377340AbiCYRSI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 13:18:08 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D602DEB98
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648228560;
        bh=AoccPTWQQi2p5x0mbjQBqi2PBgpYMenvDlA0TLvwVFM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=NavZbqWDb6jYCfJs9WsX3Us/W2iKyffbfi5Z+QqOL7L+9HmyS6fzF4v/cTGm340Nk
         ks0ncWMYlOHzLmixoDQkPf0GFYU+z4tZmIX5xJ1oIiO+LOpoHRXJNv40Wi1gmzy/oE
         /BfA45vrOrugl5sdBXiNuJMHFiQZzatQY5zgWPxk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLQxN-1npbdr0WeJ-00IUa4; Fri, 25
 Mar 2022 18:16:00 +0100
Message-ID: <0e5ebf3f-856d-533a-4db6-edd9c4614f7a@gmx.de>
Date:   Fri, 25 Mar 2022 18:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 11/12] parisc: Rewrite arch_cpu_idle_dead() for CPU
 hotplugging
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20220325143833.402631-1-deller@gmx.de>
 <20220325143833.402631-11-deller@gmx.de>
 <21409307.EfDdHjke4D@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <21409307.EfDdHjke4D@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:REkWJPZRbnMlFkyrkyO8NAke6kGAarOW9OpefLm0bubprJaIHG3
 4lbllnS5cWQrYfBeW3BukRwUAMgOSmItwU6g+wblDVJGloffwHS7y0ZDEXZYMfaPbsG3HiY
 ivQddhYERYBcaqUs82H11w6bB/h+cW5CO4g3cYiFHdd6yDb9pudE6wBxUZWl/8VWG9JJ+tM
 n8Mf1BEPAO+3QDC4xZ4ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/HSXU8X0C7s=:eZ5PiGJ/UPzfOUHDurs8Ik
 zlyzGQVtnsVa1e2XeHPm9RWhsUg6uRQSYfHFYZre4za9dhWVNBwbPZG4GBj+yDD1T1zNxyDGa
 5JYIw8i+p+kZRnjgBMdOQBfgOkzB4uBEQYn10trNLkVrA7JoJj1gYkmqhW1NP7lAQ536h7x7O
 EfNNaD+QvrYDBa0yFEt3usIV9xXLR5QTHoLc2Y3GFy0xYAhrBcIHB0v9J9VXjMDytRqVOcG1+
 KK869HZeECs0WJB3VWI64CQrsQ8FBuE5fAzIKpn05aN3CR34kiY5Jnv+vu/z1quxbTEjvQDLS
 atlEYM9tGzqsNyMOMg7J9kVvDchgWM+O5SfshKh9bXJ1Ts0kjwMnELlj6ITjN5YkFyHDX/LH/
 V/YAR9SC7o44CbaZa7C5WYL4bM6roDdSywbfPknZmwBQylcOihKSlaGKDw6e7j5IFeBgIhZih
 nuD6cRCpjOvFZpSFpwpC3Yi9WLVF3APGfNkQDAofl8OrTd54YtaYX2IjK0saDurRTDaDj3Idd
 n2QYBCC/2Or2HeX/jikQmWyD92Q6HHYx96mPZQr3Fv5XBkws2Q7Jdf6HMvXpdTQFWjijPqBgW
 gXNNvg9uPthMhLwpDebMTTe5sF3nWiLQdBoBuSAeY1Vfb3RryCnc/Hl2LE/jYREzwBo/Qtn5n
 as6rCJWAs1EvtAh6JGPfdtci5xyiNVJYv+jpmA/UTZvtubq8EosJfoy2yaWybZdX9A/ynjIK9
 DvbHtaShsF4jLG2WyqIHqoCUsXcrNkYPZk8qHnl53u1zdcfa7RqTymZYI7UlhakB0CntRpN4W
 ld7XeZcgzFdnNB3fIXV9y1lqBiX++HyoW4c0GgRBfA5j+I250NE8lgGxatf7lNuc8DBCLF8h3
 kmwyjAthq6LOMbd770xeyzcQnkOTxaGqz+NF1Ze7hkZQTZ6Cigcj90F9fVP5uc3om74jonTDA
 RnV67WUhEBibJhK5P0zdQM7vDnQ1Jy9Ypsi2cHMkNE1jPnAZLdZDAoqPRyBwJkzQT0zHPWzrN
 OoqKcE+1oRkalkGu2BB49gqKcDIKjDR0WrPZ7AEhhPddVBTSf/V9D0a2DraAnMXZAKPYNMpGT
 415LJ91VsIF35A=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/25/22 17:56, Rolf Eike Beer wrote:
> Am Freitag, 25. M=C3=A4rz 2022, 15:38:32 CET schrieb Helge Deller:
>> Let the PDC firmware put the CPU into firmware idle loop with
>> pdc_cpu_rendezvous() function.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>>  arch/parisc/kernel/process.c | 33 ++++++++++++++++++++++++++++++---
>>  1 file changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.=
c
>> index ea3d83b6fb62..44fa89fbb280 100644
>> --- a/arch/parisc/kernel/process.c
>> +++ b/arch/parisc/kernel/process.c
>> @@ -38,6 +38,7 @@
>>  #include <linux/rcupdate.h>
>>  #include <linux/random.h>
>>  #include <linux/nmi.h>
>> +#include <linux/sched/hotplug.h>
>>
>>  #include <asm/io.h>
>>  #include <asm/asm-offsets.h>
>> @@ -46,6 +47,7 @@
>>  #include <asm/pdc_chassis.h>
>>  #include <asm/unwind.h>
>>  #include <asm/sections.h>
>> +#include <asm/cacheflush.h>
>>
>>  #define COMMAND_GLOBAL  F_EXTEND(0xfffe0030)
>>  #define CMD_RESET       5       /* reset any module */
>> @@ -158,10 +160,35 @@ void release_thread(struct task_struct *dead_task=
)
>>  int running_on_qemu __ro_after_init;
>>  EXPORT_SYMBOL(running_on_qemu);
>>
>> -void __cpuidle arch_cpu_idle_dead(void)
>> +/*
>> + * Called from the idle thread for the CPU which has been shutdown.
>> + */
>> +void arch_cpu_idle_dead(void)
>>  {
>> -	/* nop on real hardware, qemu will offline CPU. */
>> -	asm volatile("or %%r31,%%r31,%%r31\n":::);
>> +#ifdef CONFIG_HOTPLUG_CPU
>> +	idle_task_exit();
>> +
>> +	local_irq_disable();
>> +
>> +	/*
>> +	 * Tell __cpu_die() that this CPU is now safe to dispose of.
>> +	 */
>> +	(void)cpu_report_death();
>> +
>> +	/*
>> +	 * Ensure that the cache lines are written out.
>> +	 */
>> +	flush_cache_all_local();
>> +	flush_tlb_all_local(NULL);
>> +
>> +	/*
>> +	 * Let PDC firmware put CPU into firmware idle loop.
>> +	 */
>> +	__pdc_cpu_rendezvous();
>
> That could all be one-line comments for a higher code/line ratio ;)

Yes. The syntax is mostly copied from other arches, where it's like this.

Helge
