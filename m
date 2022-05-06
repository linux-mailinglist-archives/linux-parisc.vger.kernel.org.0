Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A361451E1EB
	for <lists+linux-parisc@lfdr.de>; Sat,  7 May 2022 01:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444801AbiEFWih (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 6 May 2022 18:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390473AbiEFWig (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 6 May 2022 18:38:36 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 35EA561295
        for <linux-parisc@vger.kernel.org>; Fri,  6 May 2022 15:34:50 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 62716914004FF580
X-CM-Envelope: MS4xfGAJQcElB1BSoLp5BtAh1mYo3uR9O8z5M/szYpBuTB7TOMtShW4A8auueMMc70XRyWC/uYcfsXi9rrng3KeRl9KugIp48yqM6MlgE927+Hx0RK9uiHkG
 iZ7/2RKwT1y5f+YMPYDQbBZByIWguj7fDgGhSVloglu9FqYyBjjpkXqd7mAbI5exyVPGoRq97owhlkNo4+2OKULDsi2WcuZSMdZ4me2dlLT851kIUa4bnNrf
 fCIjof8+NZHoVVbxkDyoHuRcXwOPdaE+aUULOQuR2eUtvJbRIelOphkqvANfgWen
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=6275a276
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=HxRN8ZKwy-bFrGGKEz0A:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 62716914004FF580; Fri, 6 May 2022 18:34:30 -0400
Message-ID: <5a4f104c-80fb-a70f-23ce-e87bae25c46c@bell.net>
Date:   Fri, 6 May 2022 18:34:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Latest PA8800/PA8900 cache flush patch
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>
Cc:     Deller <deller@kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <YmhSJPy1MVBYWSrB@mx3210.localdomain>
 <791a2aee-1a9a-6680-c9d4-438c6b5519a6@gmx.de>
 <2ee9360d-7ddc-8cf1-46c5-b29663e10193@bell.net>
 <0cafa13b-336c-a425-7284-162467349bc9@bell.net>
 <2b28f20d-0183-96a7-463f-492cc972b3fa@gmx.de>
 <418213d7-a306-d3cd-2b78-50f0c96b1b8d@gmx.de>
 <0449745b-f3fd-eb86-31f9-1e26cc8bc0fd@gmx.de>
 <bbc8e524-de3f-f6ee-cc30-0e208ca56ba4@bell.net>
In-Reply-To: <bbc8e524-de3f-f6ee-cc30-0e208ca56ba4@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-05-06 5:30 p.m., John David Anglin wrote:
>> I've built 5.17.5 (32bit). Boots ok on c3000. No segfaults.
>> But I do see the stalls as well:
>> ...
>> Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon.
>> Starting periodic command scheduler: cron.
>> [   31.472708] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
>> [   31.543577]  (detected by 0, t=2102 jiffies, g=7361, q=10)
>> [   31.609191] rcu: All QSes seen, last rcu_sched kthread activity 2102 (-22271--24373), jiffies_till_next_fqs=1, root ->qsmask 0x0
>> [   31.747614] rcu: rcu_sched kthread starved for 2102 jiffies! g7361 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
>> [   31.867313] rcu:     Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
>> [   31.974535] rcu: RCU grace-period kthread stack dump:
>> [   32.034962] task:rcu_sched       state:R  running task     stack:    0 pid:   10 ppid:     2 flags:0x00000000
>> [   32.153733] Backtrace:
>> [   32.181916]  [<1094c21c>] __schedule+0x2dc/0x964
>> [   32.237240]  [<1094c90c>] schedule+0x68/0x138
>> [   32.289340]  [<10953068>] schedule_timeout+0x84/0x178
>> [   32.349762]  [<102472b4>] rcu_gp_fqs_loop+0x32c/0x428
>> [   32.410186]  [<10249660>] rcu_gp_kthread+0x10c/0x1e8
>> [   32.469569]  [<101ebc98>] kthread+0x100/0x108
>> [   32.521674]  [<1019b01c>] ret_from_kernel_thread+0x1c/0x24
>>
>> ARGH!!!
> This was introduced by the following commit:
>
> commit d97180ad68bdb7ee10f327205a649bc2f558741d
> Author: Helge Deller <deller@gmx.de>
> Date:   Wed Sep 8 23:27:00 2021 +0200
>
>     parisc: Mark sched_clock unstable only if clocks are not syncronized
>
>     We check at runtime if the cr16 clocks are stable across CPUs. Only mark
>     the sched_clock unstable by calling clear_sched_clock_stable() if we
>     know that we run on a system which isn't syncronized across CPUs.
>
>     Signed-off-by: Helge Deller <deller@gmx.de>
>
> In searching for the cause, I also noticed this commit:
>
> commit e4f2006f1287e7ea17660490569cff323772dac4
> Author: Helge Deller <deller@gmx.de>
> Date:   Tue Sep 7 05:03:29 2021 +0200
>
>     parisc: Reduce sigreturn trampoline to 3 instructions
>
>     We can move the INSN_LDI_R20 instruction into the branch delay slot.
>
>     Signed-off-by: Helge Deller <deller@gmx.de>
>
> Changing the sigreturn trampoline breaks gdb's detection of signal frames.
> I suspect the INSN_LDI_R20 instruction was intentionally put before the
> branch to make the sequence more unique.

It appears the latter commit has been reverted.  The former commit has been modified.

Dave

-- 
John David Anglin  dave.anglin@bell.net

