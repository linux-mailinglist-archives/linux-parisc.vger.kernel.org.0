Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F738427A22
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 14:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhJIMcd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 08:32:33 -0400
Received: from mout.gmx.net ([212.227.17.22]:60879 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232408AbhJIMcc (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 08:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633782633;
        bh=6VFufxtd9L01l3CLRw0XQKOJK3f6+D2TltAzaC+zmFI=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Sn1kfMRuvt4DtyQEVnyu5u1XsWHvzvmMh2kk6N8eOrZt1Brwr2NKJjPGtkiXlIJa/
         FqemwOg41xvElnBRfL2gafzCac+oaI0Q+8WYtaF+rtxF1gIcNxhVGS/2kp/kKqSiQG
         tGZwSPqpzo1466r8HmW1UcGxSmGYPXB63cQC4Ch8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.158.18]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1mLUtb1eNa-00LSeA; Sat, 09
 Oct 2021 14:30:33 +0200
Message-ID: <5c0536ef-87fa-a153-7e36-20010512cbaf@gmx.de>
Date:   Sat, 9 Oct 2021 14:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/4] parisc: disable preemption during local tlb flush
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20211008204825.6229-1-svens@stackframe.org>
 <20211008204825.6229-2-svens@stackframe.org>
 <87tuhrjj2z.fsf@x1.stackframe.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <87tuhrjj2z.fsf@x1.stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:77QidteoklJcw4x1q1q78Dn1L/T0BLzCV0GEeqPejts7wfJlv6f
 DdJbqJrOKwYb9N/n3QRhM9n5v3DbqI3/4cVLfFxA9GWHpNNjzHK+DE97EewiwXmTExddbEB
 j0QLXjLCogxtnEj78bA+WgJE6zVDVrBUcTDFOBovZ1ZVSXvoZFTOuTGfzsTyM/qAo3ilhuh
 WSB8vpG54VE2dncvDtKRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uam8CZT6RxY=:fF6fJBOrFmwgMykzGf/eam
 081+Hc60E8au7mv/Cr3SpsX/QW5QvNx1xG4MTLcZnV2rI/RblD1BzdI7wHPZIYeDfImFYhclp
 avAbLzKwqMHB5kiX3VIJathG1aVDFxYm2dL9chJzYQybbTEyoe8CFlT/6zuwIjZ/vO59WjLDG
 lqLMAWsW86a78LOTfixuywJD/KlR3dPkwoIGZ9ME32pCsQsC99Xpq4AEy/rAiDN0WbdQJM8Zr
 BSZhGG4WGnkCn7lXA4c+2eIIICq8bL9U+IwQmO0E9RQZJKv/cuC2XxojVdq7fMhJ4QGP+1esA
 sx0mC7mkAimD+129O/60J4Lb+MIdiOn2Ff+TXovZIkfUt9UtFQHVYUphIz1ORaClpIN3gEBWa
 N7iE3MgAIqQGXZvGmgcRIZfnhqTjPpzHIeWSWg7bV0VwsL+Oiz8Ex9MdoPaU7ec0lR1F3Sstl
 yXpD8SUU5kZYOx5WN+sjL7YRJu7g622InuKqnQk52tr/KDJUSPQu+2uQCpjB/828qnsCPI2lX
 H/sVTIpsyEIoa357mZ0/akvl8S48tTt8nlKhoT/isesNFuBNrrU2NpsLIcThZ2Vnn4tdalQR4
 86VU5U7OYGWmCOh1p8L6eeJxC48FTrOF/tqocbwrKL9C3fy9NJWL3V5X5UqwoMTRahvhI53zw
 K2Bx+j1RKHq+sUK+DwVGWZwykzUtnq6DtRVZefK+hGh8F3WJqMhQY2m1T/L8n8lx1YJcdUbtX
 HdzPl5qS3ol9b8BLrYTJTHf0f/MJ/WyAJuvvYAjZKk5rSWtDrIp+K/cdWPMNfBVO0b5cZ67Lt
 HaF9s59+lBMMNfmrlaaou7UDPuoI3tvPoIGd4A74FmcYE0HjbVrLIoFdcQ/ab3N6uvzfoucnV
 9Y68ANUNkMr6NPKR5eVMjbhKN5/GhnR07FiFfxTEwP4DGmlbsLS75uHaaeixY7/QFxdxqhmU3
 sjfHlNd3uEUKw3DqDgAQjfT6eGJTFlxbbHOgi9Q7gRwxnuLH5OTsiwrWEBa4KFqaug+1gmphL
 sAvcBWYTRibAwO2NaS9gBZjLmHBtxgoxKQBU56LnlkZOdRA1T9XxA0xhVqIpVGWw4CPWssu9M
 JcodFPT0kPLJN8=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/8/21 23:35, Sven Schnelle wrote:
> Sven Schnelle <svens@stackframe.org> writes:
>
>> flush_cache_mm() fetches %sr3 via mtsp(3). If it matches mm->context,
>> it flushes caches and the TLB. However, the TLB is cpu-local, so if the
>> code gets preempted shortly after the mtsp(), and later resumed on anot=
her
>> CPU, the wrong TLB is flushed.
>>
>> Signed-off-by: Sven Schnelle <svens@stackframe.org>
>> ---
>>  arch/parisc/kernel/cache.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
>> index 39e02227e231..90656c49bc07 100644
>> --- a/arch/parisc/kernel/cache.c
>> +++ b/arch/parisc/kernel/cache.c
>> @@ -558,6 +558,7 @@ void flush_cache_mm(struct mm_struct *mm)
>>  		return;
>>  	}
>>
>> +	preempt_disable();
>>  	if (mm->context =3D=3D mfsp(3)) {
>>  		for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
>>  			flush_user_dcache_range_asm(vma->vm_start, vma->vm_end);
>> @@ -565,8 +566,10 @@ void flush_cache_mm(struct mm_struct *mm)
>>  				flush_user_icache_range_asm(vma->vm_start, vma->vm_end);
>>  			flush_tlb_range(vma, vma->vm_start, vma->vm_end);
>>  		}
>> +		preempt_enable();
>>  		return;
>>  	}
>> +	preempt_enable();
>>
>>  	pgd =3D mm->pgd;
>>  	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
>
> I noticed that flush_cache_range() has the same problem. Helge, let me
> know whether i should send a v2 with an additional patch, or a single
> follow up patch. Both functions also look very similar, so i think
> best would be to combine the code of these two functions.

I'm fine with either option.

Thanks for your patches!
Helge
