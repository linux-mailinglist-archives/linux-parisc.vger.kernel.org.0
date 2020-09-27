Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEBB27A441
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Sep 2020 23:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgI0VYU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Sep 2020 17:24:20 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:37912 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726267AbgI0VYU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Sep 2020 17:24:20 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20200927212419.KUIN120733.mtlfep01.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 27 Sep 2020 17:24:19 -0400
Received: from [192.168.2.49] (really [70.53.61.197]) by mtlspm01.bell.net
          with ESMTP
          id <20200927212418.MUKT130487.mtlspm01.bell.net@[192.168.2.49]>;
          Sun, 27 Sep 2020 17:24:18 -0400
Subject: Re: v5.8.x stability on parisc
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <bd1c6298-db1a-79ab-279b-60daad6bed22@bell.net>
 <387e5574-a270-f3cc-d0f2-a26d0383b7e6@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <60f8a51e-ac6e-d49c-e63e-d2b83cf4de22@bell.net>
Date:   Sun, 27 Sep 2020 17:24:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <387e5574-a270-f3cc-d0f2-a26d0383b7e6@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=6x1y2OhCX1CAR/Lk3lU3cg==:117 a=6x1y2OhCX1CAR/Lk3lU3cg==:17 a=IkcTkHD0fZMA:10 a=reM5J-MqmosA:10 a=FBHGMhGWAAAA:8 a=jF78cOym1ND37BLKaacA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfDS5J/wBLxOpo/wt3ysTypr1RMxWjaaLGgW5FKfVC9sg25t2ivadVIJ9leormybm/FZWPxuTjkMNQ6rJ1ttPTFmb/KYSvhTIMoIoEqwOlE+mAuZ+5zWq bsEES+FOGXYqggKaJZMJ8ZPw/WaYIqY8E/v+PJoQ5WKblKLXYOfyif0BXVUX7jaWbh4O17l99yvoSw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-09-27 3:45 p.m., Helge Deller wrote:
> On 9/27/20 4:17 PM, John David Anglin wrote:
>> With this patch collection, I haven't seen any stalls on my rp3440 and c8000 running v5.8.x.  Further,
>> I haven't had any signing failures on the buildd machine.  The rp3440 (mx3210) has also been successful in
>> building several packages that failed multiple time on the c8000 buildd.
>>
>> I think this is due to the three changes at the bottom from Linus.
> Weren't thos added already upstream (or variants of them) ?
Thought so but nothing has been committed to v5.8.x that conflicts with the changes.  I also searched the git log
for similar commits but I didn't find anything.  So, I'm puzzled as to what happened to these changes.  This is the
main reason I threw out my patch list for discussion.

The following packages built successfully on mx3210 after falling on c8000: tigervnc, postgresql-13, verse, bali-phy
and libbpf.  I also tried mariadb-10.5 but it had the same testsuite fail as before.

>
>> diff --git a/arch/parisc/include/asm/barrier.h b/arch/parisc/include/asm/barrier.h
>> index 640d46edf32e..c705decf2bed 100644
>> --- a/arch/parisc/include/asm/barrier.h
>> +++ b/arch/parisc/include/asm/barrier.h
>> @@ -2,11 +2,15 @@
>>  /* The synchronize caches instruction executes as a nop on systems in
>>     which all memory references are performed in order. */
>> -#define synchronize_caches() __asm__ __volatile__ ("sync" : : : "memory")
>> +#define synchronize_caches() asm volatile("sync" \
>> +	ALTERNATIVE(ALT_COND_NO_SMP, INSN_NOP) \
>> +	: : : "memory")
> I wonder if this has any impact.
> If it's an UP system, won't this "sync" just be a "nop" anyway?
I believe we want this when SMP kernel is run on a UP machine or a SMP machine running with one CPU.
> Did you ran some performance tests, just to check?
No.
>
> Would you mind to send separate patches for each logical change?
>
I'll try to get there but I'm currently focusing on toolchain issues.

Regards,
Dave

-- 
John David Anglin  dave.anglin@bell.net

