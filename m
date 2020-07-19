Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A32225388
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Jul 2020 20:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgGSSi3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 19 Jul 2020 14:38:29 -0400
Received: from simcoe209srvr.owm.bell.net ([184.150.200.209]:37734 "EHLO
        torfep04.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgGSSi2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 19 Jul 2020 14:38:28 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200719170618.EBCW6697.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 19 Jul 2020 13:06:18 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20200719170618.BEBN29322.torspm01.bell.net@[192.168.2.49]>;
          Sun, 19 Jul 2020 13:06:18 -0400
Subject: Re: [PATCH v3] parisc: Fix spinlock barriers
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <04485b95-01df-d100-cf3a-1944a69ded26@bell.net>
 <c100c26e-831e-6d65-ec2c-ba42b881f5c7@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <b055db44-681f-73a9-4b37-9fa3fdeb7ed3@bell.net>
Date:   Sun, 19 Jul 2020 13:06:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c100c26e-831e-6d65-ec2c-ba42b881f5c7@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=AHyOVjoGBUewS1l8Yf0A:9 a=wwkMWlsWRwNo3P6Z:21 a=aEWTsj4ZjxsZ95SY:21 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfKjH0wn+ohWhe64mtLK9UnXsdCBU+Vd/QHqtIuND84xhUbmsVnyXO/96ljFLpd9HHv8GTGOrOkqRc8gQfef8fbqNKc8UX6eYaix+237iDYKAvWU4Cjfl oTQGpg9YItptW9IoIia0A59jM3+0mqY9/o3rMxD+rZMupiONCqnkrFd2dZI2yuu/AjtNmmSDgzrP7A==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-07-19 12:35 p.m., Helge Deller wrote:
>> In reviewing the atomic operations in entry.S, I realized that there is also a bug in the
>> spin lock release code of the TLB handler.  Space id's are 64 bits on 64-bit targets.  So,
>> using the least significant 32 bits to reset the spin lock is not safe.  The lock will not
>> be freed if the bits are all zero.
> Hmm..
> The space ids on 64-bit Linux are limited to (see arch/parisc/mm/init.c):
> #define NR_SPACE_IDS 262144
> and SID == 0 can't happen for userspace (it's blocked in the space_id[] bitmap).
> So, I think this part was ok.
Okay, then the change to store 1 was unnecessary.
>
>> @@ -467,10 +466,9 @@
>>  	/* Release pa_tlb_lock lock without reloading lock address. */
>>  	.macro		tlb_unlock0	spc,tmp,tmp1
>>  #ifdef CONFIG_SMP
>> +	ldi		1,\tmp1
>>  98:	or,COND(=)	%r0,\spc,%r0
>> -	LDCW		0(\tmp),\tmp1
>> -	or,COND(=)	%r0,\spc,%r0
>> -	stw		\spc,0(\tmp)
>> +	stw		\tmp1,0(\tmp)
>>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
> In tlb_lock() we only lock for non-kernel SIDs (!=0),
> but now you unlock unconditionally.
No, there's still an "or" instruction to nullify the store used to release the lock.  I will go back to using the
\spc register as this is time critical code.  I will add a note regarding the number of space id's.

Dave

-- 
John David Anglin  dave.anglin@bell.net

