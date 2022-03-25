Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A00EA4E7D8F
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Mar 2022 01:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbiCYTpJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 15:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbiCYTo0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 15:44:26 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF8A22B6F7
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 12:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648235773;
        bh=ibjfbrwbsQm8cSdQkBTWXyj0OXRFj9d1RRcSHJfxV1I=;
        h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
        b=gTYbXkRUdSLMd+/+ujsSEzmMnJy3GHNiyLb36F/QdTtfne52FwXukoncR+gZWNx4T
         qNmtkmyiItG/ME20Vv8q+QCOph7ELtQfBMyfRt9loaX5Y2LZteMqxRECX576Jn57DT
         qbzasFaw6UiyEPGQBlL/jQyNjftGfOKbOUuQIlGo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0FxV-1oJ3Wu0uKV-00xIkw; Fri, 25
 Mar 2022 19:02:35 +0100
Message-ID: <54514391-69a4-1465-fe83-d78c20ad6599@gmx.de>
Date:   Fri, 25 Mar 2022 19:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20220325143833.402631-1-deller@gmx.de>
 <20220325143833.402631-12-deller@gmx.de>
 <1909223.usQuhbGJ8B@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 12/12] parisc: Implement __cpu_die() and __cpu_disable()
 for CPU hotplugging
In-Reply-To: <1909223.usQuhbGJ8B@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r545RFeHs1IT3Iuu0kp26myemcYdTcfehBKcHUmiNTYkydbsc3X
 3+hlAwIkSnkKoxk7+AwMfv2GwYJb7fPv+npBrlpWmyvn9qbJVzH3rPj1VhWWnLABf4YWhAh
 1CTaoizwoYILKHkutZ1gWwVAAg/Qbv2jkE4c7H2Wz0NHrqWnpebXi/qYFMTtyVlxJbFn65x
 5cZM1tS1Gd4TeuO3wqJDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lINSZ7pHUa8=:wRScK/YYapRzbb8uJck3Kk
 31fYshbXGIIXdma8hhhR6CQN+24dvawisSXNwcrmEdK9Dbyprc0DOV2hw6liK65mf6mQ04FI4
 CMwXalpJDK0i27GX5O50xTfuyHhst0wGDS8jCJrCLbGuGN6aL2SSWL5JHW39kHZus+boJR+EF
 sCHEIJ9ykdCVbqMkMMXegL2qDtDZHBhEX6425mjLgY63EDLioVDdYo43ax89KXCj/cQcPnXFm
 hmq9+r9waNMFpF7OUC1ZB12Qg1RbKUo9ze2OICXZpEvqOFhsgEuYJf/yYIEV9HGXtK0IW+/EZ
 jkGUc3AIvvYrE5L6yGgeO39YzG8ZnrreSpuM1wSfb1yKGKlAbaXeNzDLsVNdPmKrIDQn0BoMl
 IBF6188ur+LXfJkpNErvNbMbtR09kkUAS8dLWLv1nImR4VxpwTgZO3I2Wv1q2AscTaOvKO2wV
 jl4t2IMvqtINkrF13bTTqdqP+mgpKEb67VmHOSTxiMdaV1U3Z4rAy0l94QYeOBGftwBWUGk78
 Wy467AjVOzKcxf1DwvbASrjaps5nz9HEQzXNeSqn8eIOg1sHLZeJoVqs0xGUojvZ6rwR9zYwD
 8k78ZGXa87VGhZSQ4JColvTBFMBZEgnVSI0z0ksXoizHNgP+taEd93UkgVxOecv8bfzqwy08G
 r3VkhbsU/hazaMWT8/g3oUAuEAvTGaqmxF4v0+GNjyhAA96Eco3EUUvBvsMmP5+3CZ40L8asz
 cJhVLbVlXSPnrUGzd52pW/ifV5S6hP/euUfZvYqgQ5U4uxWSt+bnF2Hl8bYIMGgvin5KYAWMg
 98cIM2ZxI0UT+bJyvYbaozZaBMV6auYsoe3MSTphMIpyKcwyuMGdZCMMESMoLVvUU3wa1Yy8H
 g53SNzEL/KBKuj7Y+U29Z6gh5JnglYMCt1xCDYnDzzE4NZg7HYqBp477483tzdECTNB2RZoFF
 gAerzzDKYtN9GRsqX8kIt8hbykw7lMwzEP5rT5ETUGD4amKVEIgF2UIDRt4+S29Ndc77uDrVF
 wvtrhnc0n8gLa+Wsp8gkiP+t2uD1BHhX8HlSiDpGWIK4uGdkSMjmwU/+WbRVMuFN/hodXsSN8
 7ZyXhOEVatft68=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/25/22 18:10, Rolf Eike Beer wrote:
> Am Freitag, 25. M=C3=A4rz 2022, 15:38:33 CET schrieb Helge Deller:
>> Add relevant code to __cpu_die() and __cpu_disable() to finally enable
>> the CPU hotplugging features. Reset the irq count values in smp_callin(=
)
>> to zero before bringing up the CPU.
>>
>> Use "chcpu -d 1" to bring CPU1 down, and "chcpu -e 1" to bring it up.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>>  arch/parisc/Kconfig           |  1 +
>>  arch/parisc/include/asm/smp.h |  9 +---
>>  arch/parisc/kernel/smp.c      | 80 +++++++++++++++++++++++++++++++++--
>>  3 files changed, 79 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
>> index a32a882a2d58..60cc33fd345c 100644
>> --- a/arch/parisc/kernel/smp.c
>> +++ b/arch/parisc/kernel/smp.c
>> @@ -430,10 +444,68 @@ void smp_cpus_done(unsigned int cpu_max)
>>
>>  int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>>  {
>> -	if (cpu !=3D 0 && cpu < parisc_max_cpus && smp_boot_one_cpu(cpu,
> tidle))
>> -		return -ENOSYS;
>> +	if (cpu_online(cpu))
>> +		return 0;
>> +
>> +	if (num_online_cpus() < parisc_max_cpus && smp_boot_one_cpu(cpu,
> tidle))
>> +		return -EIO;
>
> I had to look up parisc_max_cpus, and found this:
>
>> static int parisc_max_cpus =3D 1;
>
> Hm, signed?
>
>> parisc_max_cpus =3D max_cpus;
>>        if (!max_cpus)
>>                printk(KERN_INFO "SMP mode deactivated.\n");
>
> So parisc_max_cpus is now 0, which seems wrong. Shouldn't the check be b=
efore
> the assignment? This would have avoided the "cpu !=3D 0" in the old code
> completely.

No, the old
	cpu !=3D 0 && ....smp_boot_one_cpu(cpu, tidle))
was to avoid that smp_boot_one_cpu() gets called for the monarch cpu.

Anyway, you are right, the code could need cleanups.
But in my patch series I wanted to keep the changes minimal in the first p=
lace.

>
>> +
>> +	return cpu_online(cpu) ? 0 : -EIO;
>> +}
>> +
>> +/*
>> + * __cpu_disable runs on the processor to be shutdown.
>> + */
>> +int __cpu_disable(void)
>> +{
>> +#ifdef CONFIG_HOTPLUG_CPU
>> +	unsigned int cpu =3D smp_processor_id();
>> +
>> +	remove_cpu_topology(cpu);
>> +
>> +	/*
>> +	 * Take this CPU offline.  Once we clear this, we can't return,
>> +	 * and we must not schedule until we're ready to give up the cpu.
>> +	 */
>> +	set_cpu_online(cpu, false);
>> +
>> +	/*
>> +	 * disable IPI interrupt
>> +	 */
>> +	disable_percpu_irq(IPI_IRQ);
>> +
>> +	/*
>> +	 * migrate IRQs away from this CPU
>> +	 */
>> +	irq_migrate_all_off_this_cpu();
>
> While I really enjoy good code comments the last 2 seem a t bit wasteful=
,
> given that the code is basically exactly the same as the text.

Yep.

Helge
