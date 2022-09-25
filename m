Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7045E9563
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 20:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiIYST4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 14:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiIYSTy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 14:19:54 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-002.bell.net [209.71.212.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF28915707
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 11:19:51 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.58.43]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6317863908067DE2
X-CM-Envelope: MS4xfG2J7f+qBqJI+cWLcFxs1Zr2pPP8+Qtpd71a6FuOK2zz9MurP1iT5S6FWEYwTsZfn9v5gdrzyqnjwfQJY9VIJyibkjBy06wyaRoLD5/HzGDmmt7JkST4
 Vg9dkbAySusG2kymNhBQYnORd6boFwAbtbOtrnziaTil4vi6OsxMgOMOb9Ytungfkl8ZcfherFgpg91NfaF8QKHqDIlDaE9qQZD4R4eDAnAoIzkPFBaJQfx+
 0PVyuDxrwNruRmflmYj2pD22JvSWF97XAiVBw08YmSs8w1XYmlb5IPeILFYB60Uh0pioHZTl9vUcslp9eXyFLdTVLy6f3sZ0f7Wt4+G8Bqc=
X-CM-Analysis: v=2.4 cv=BKfQEHcG c=1 sm=1 tr=0 ts=63309bc1
 a=oiJDitmlNOPgVxj52MZyFw==:117 a=oiJDitmlNOPgVxj52MZyFw==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=VlEFfHoH0hPwsJE6b3kA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.58.43) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6317863908067DE2; Sun, 25 Sep 2022 14:19:45 -0400
Message-ID: <bffa9fac-a6f6-fc7e-0e66-5df215aef2ba@bell.net>
Date:   Sun, 25 Sep 2022 14:19:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on UP machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yy/7g0NzOi/igNi7@p100>
 <d195aae3-b76b-1365-6e53-28c6791c77e3@bell.net>
 <92a8b235-7d04-9931-a153-440adbc8802a@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <92a8b235-7d04-9931-a153-440adbc8802a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-09-25 1:51 p.m., Helge Deller wrote:
> On 9/25/22 16:33, John David Anglin wrote:
>> I believe this change is wrong and will reduce performance.
>
> Yes, could be. That's why intentionally marked it RFC.
>
>> The TLB setup for a TMPALIAS flush is local to any given CPU.  So, we
>> should only need a local TLB purge.
>
> Can those function theoretially be preempted?
> If so, could it be scheduled on another CPU where the TMPALIAS isn't flushed?
I think preempt_disable/preempt_enable are used before/after all calls to these routines.

It would be better if these calls were in the flush routines.
>
>> A local TLB purge doesn't require locking to serialize PxTLB broadcasts.  It is also  faster than
>> a global TLB purges
>
> True.
>
>> Indeed, the case that might be wrong is the one that uses pdtlb.
>
> Which do you have in mind here?
The pdtlb instructions in these routines are not serialized. Theoretically, this could result in bus
contention and system malfunction.  Maybe only D and R class machines are PA 1.1 and SMP.
>
>> It potentially needs serialization
>> on SMP machines.  See comment in pgtable.h.
>
> One goal of that patch was to drop the CONFIG_PA20 ifdef case,
> because a 32-bit kernel could be compiled for PA8000 in which case
> the "pdtlb,l" will burn the machine.
Don't think so.  "pdtlb,l" is available on all PA 2.0 machines. It's not 64-bit specific.
> I'll send another patch which takes care of this without changing
> the local purges of pdtlb on 64bit CPUs.

Dave

-- 
John David Anglin  dave.anglin@bell.net

