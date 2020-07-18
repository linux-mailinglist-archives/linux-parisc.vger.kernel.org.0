Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409AF224B62
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jul 2020 15:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgGRNIB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Jul 2020 09:08:01 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:40812 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726569AbgGRNIB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Jul 2020 09:08:01 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20200718130800.ITLG5779.mtlfep01.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 18 Jul 2020 09:08:00 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm01.bell.net
          with ESMTP
          id <20200718130800.YTQW130487.mtlspm01.bell.net@[192.168.2.49]>;
          Sat, 18 Jul 2020 09:08:00 -0400
Subject: Re: [PATCH v2] parisc: Fix spinlock barriers
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
 <7e4fa270-7fb7-d726-da01-7da04f109747@bell.net>
 <d5d093f1-8e7b-24bc-2f72-215381821043@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <6257f3f4-d5a6-5a70-0152-80156470bb10@bell.net>
Date:   Sat, 18 Jul 2020 09:08:00 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d5d093f1-8e7b-24bc-2f72-215381821043@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=JYUUbWX3gzUvzWJ1sQ0A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfPVlQj47wIhBIo3U9jyZ0z5cvutegE8ED/pR1CORFhZ7lKjVKDi8r/qPboXMYjRTRIUo/awlLNMd5Xe4KD6M1/Xq8ZuvgJFrUtt5nl8uznkCiyxDtzCo gRYtPypo+Wt9jcqy7k2Mik9iF0aYLcigLsPhc7hlywgWMdGCXHmY4iDTL1BEfBz3vn3ZrSorzgk4Ig==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-07-18 8:04 a.m., Helge Deller wrote:
> Hi Dave,
>
> just a few questions and suggestions below....
>
> On 17.07.20 23:15, John David Anglin wrote:
[...]
>> -static inline void arch_spin_lock(arch_spinlock_t *x)
>> +static inline int __pa_ldcw (volatile unsigned int *a)
>> +{
>> +#if __PA_LDCW_ALIGNMENT==16
>> +	*(volatile char *)a = 0;
>> +#endif
>>
>> I assume this is planned as a kind of prefetching into cache here?
>> But doesn't it maybe introduce a bug when the first byte
>> (in which you write zero) wasn't zero at the beginning?
>> In that case the following ldcw():
The intention is to dirty the cache line.  Note the above generates a stb instruction that operates
on the most significant byte of the lock word.  The release uses a stw and sets bit 31 in the least
significant byte of the spin lock word.  So, the stb doesn't affect the state of the lock.

When the cache line is dirty, the ldcw instruction may be optimized to operate in cache.  This speeds
up the operation.

Another alternative is to use the stby instruction.  See the programming note on page 7-135 of the
architecture manual.  It doesn't write anything when the address is the left most byte of a word but
it still can be used to dirty the cache line.

Note this is only added when using ldcw and not when using ldcw,co.
>> +	return __ldcw(a);
> returns zero, althought it wasn't zero initially?
>
>
>> +}
>> +
>
>> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
>> index f05c9d5b6b9e..4ba43a3c7c67 100644
>> --- a/arch/parisc/kernel/syscall.S
>> +++ b/arch/parisc/kernel/syscall.S
>> @@ -659,8 +678,15 @@ cas_action:
>>  	/* Error occurred on load or store */
>>  	/* Free lock */
>>  #ifdef CONFIG_SMP
>> -98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
>> +98:	sync			/* Barrier */
>>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
>> +	nop
>> +	nop
>> +	nop
>> +	nop
>> +	nop
>> +	nop
>> +	nop
> I think you should put those nop's before the 99:ALTERNATIVE() instruction above.
> That way they all get replaced by one jump instead of multiple nops (when
> there is only one CPU in the SMP system).
Okay.  I'll test.  Thought the replacement was just nops.

Dave

-- 
John David Anglin  dave.anglin@bell.net

