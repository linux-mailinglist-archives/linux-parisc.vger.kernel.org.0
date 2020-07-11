Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E2121C1A5
	for <lists+linux-parisc@lfdr.de>; Sat, 11 Jul 2020 03:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgGKBqH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Jul 2020 21:46:07 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:36093 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726588AbgGKBqH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Jul 2020 21:46:07 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20200711014606.ZMDX5779.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Fri, 10 Jul 2020 21:46:06 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20200711014606.MACY16482.mtlspm02.bell.net@[192.168.2.49]>;
          Fri, 10 Jul 2020 21:46:06 -0400
Subject: Re: [PATCH] parisc: Fix spinlock barriers
To:     Jeroen Roovers <jer@xs4all.nl>
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
 <35432085.F4uqhuS8rR@daneel.sf-tec.de>
 <595e592a-36a5-e90f-e661-c5e52ec7753d@bell.net>
 <20200711005018.05540239@wim.jer>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <31b55b8c-2db7-c26e-f0a5-7e1ac1e520af@bell.net>
Date:   Fri, 10 Jul 2020 21:46:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200711005018.05540239@wim.jer>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=N659UExz7-8A:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=yD2R6GckoA63wIrxa5YA:9 a=pILNOxqGKmIA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfGIdKAoX5X1ucP0D47XizK+7z2qLZMENVAibYcgX8oFsBHNZsiG1Y6PGwQKpDZ2G6V3KEQli9v/yJctUB+5dHWSU2NC90qhnWEg8uHkvPFY6Ed1q/spi YdYVKyqUQiHV4O7u8euT4E/43X5EnT0o05Y5j+282a4Q+Ek/gCQ0VP9B9K6B0f3s9sljFiD5e9/5FA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Jeroen,

On 2020-07-10 6:50 p.m., Jeroen Roovers wrote:
> On Thu, 9 Jul 2020 09:39:33 -0400
> John David Anglin <dave.anglin@bell.net> wrote:
>
>> On 2020-07-09 9:26 a.m., Rolf Eike Beer wrote:
>>> Am Freitag, 3. Juli 2020, 22:32:35 CEST schrieb John David Anglin:  
>>>> Stalls are quite frequent with recent kernels.  When the stall is
>>>> detected by rcu_sched, we get a backtrace similar to the
>>>> following:  
>>> With this patch on top of 5.7.7 I still get:  
>> Suggest enabling CONFIG_LOCKUP_DETECTOR=y and
>> CONFIG_SOFTLOCKUP_DETECTOR=y so we can see where the stall occurs.
>>
>> Dave
>>
> Attached is kernel output while running the futex_requeue_pi test from
> the kernel selftests. It failed this way on the second try while it
> passed on the first try. The output it gave is with the kernel
> configuration options as set out above.
Unfortunately, the soft lockup detector didn't trigger in the output you attached.  So, it's not
clear where futex_requeue_p is stuck.  There are no spinlocks  in check_preempt_curr() that
I can see.

void check_preempt_curr(struct rq *rq, struct task_struct *p, int flags)
{
        const struct sched_class *class;

        if (p->sched_class == rq->curr->sched_class) {
                rq->curr->sched_class->check_preempt_curr(rq, p, flags);
        } else {
                for_each_class(class) {
                        if (class == rq->curr->sched_class)
                                break;
                        if (class == p->sched_class) {
                                resched_curr(rq);
                                break;
                        }
                }
        }

        /*
         * A queue event has occurred, and we're going to schedule.  In
         * this case, we can save a useless back to back clock update.
         */
        if (task_on_rq_queued(rq->curr) && test_tsk_need_resched(rq->curr))
                rq_clock_skip_update(rq, true);
}

There's one loop in the above code.

I have CONFIG_PREEMPT_NONE=y in my kernel builds.

Regards,
Dave

-- 
John David Anglin  dave.anglin@bell.net

