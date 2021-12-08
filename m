Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACCD46D3FA
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Dec 2021 14:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233923AbhLHNJL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Dec 2021 08:09:11 -0500
Received: from mout.gmx.net ([212.227.17.20]:53319 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234015AbhLHNJJ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Dec 2021 08:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638968730;
        bh=Q0RQOo8ywS5q8XHkn3N66PfHP+X7mpqUep9S0xGHRTI=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=iRVWK9cm0yeGhxAVEgeHQRnZWApJZaAspmhnk6Dy5cPaNmdWgxjus+fQ/uIEOQY4G
         DtDSN4E3rfcbSiCPD3xZQPR0txl5Ec0exMTcH3piF/Qym4atdsx4OwxSj2x2AL55iu
         BelDRZS4lyil7f0Ijupr61ONqkya0TYRnBkBbg6o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.170]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIwz4-1nFM8G2x1m-00KMmC; Wed, 08
 Dec 2021 14:05:30 +0100
Message-ID: <24997ae3-a6e2-9207-8935-9b52369f4fbb@gmx.de>
Date:   Wed, 8 Dec 2021 14:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: glibc tst-minsigstksz-5 failure
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     deller@kernel.org
References: <c58ea7e4-f0df-3840-478e-0c3459aa4318@bell.net>
 <3b28b1a5-2a49-af75-bcf2-52eb114be348@gmx.de>
In-Reply-To: <3b28b1a5-2a49-af75-bcf2-52eb114be348@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TVqrYxflHk54G5A4vAbgiqRcaQ5W24Ifip6v+HGkZD0171q33TF
 8HvV1tVM/SetWrzC3xjhYkdDZEynVNHyzwLvcY2tqPhZZODyyiIATYmAyg1cIsknewSwITX
 qD3FQxC3nTyx7GsTMCW3ZeuFyMGz/mCKcbrH4D1Ks/+keKXqzPgJgzFKRajrBoDIZ/FjKm6
 BJPaPttK3FfRGoxrJXo4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rWn+cqXnD74=:5g00cTSfmi4SYFwYEJms8y
 ZVdAxQ1znWAfILPgem3rB5ve2+6DyGksFA9KBER7r/STnkUJ+YEN7zMPDkWq4PsgwiHqL5POT
 K/W8liZcOlpVthgOnjUCchRkUUUTEqmrAsrPktprlhX0BE/eOD1vwtzlQeXF3M2PQubcmOkbt
 7Uj0ciRzFE6Y1gSYMaBo4NuCqMkxMcVJmKpOb3CFDqxBV6g0tfte1leiB1P+ZZvp5EVK3d4GY
 D8+m8e5C7A6LBnXvbbcAyMt1Rw7G6xyWK0R+z4Ie0nAG+z2tSOMn9gvC/WrSZyg8vPECaW0F8
 15b57Ic+7M317QQfJcZVLxiPZImn1tO6AjEOUrZu7ATIIdGiOuaNIwmNeq5tg/4NKCsxu/5zM
 xP1C04rUKKvKguI6RWh5xGTN1jXhJ6Sv+wKd+SQmLdVX99WzIkAEopuYwVV1g18RaM1NW5z6p
 fEuNERQK1FFB6aybRFlhw9BIFClnOEbS1Fn4Wo1g+cNNuA7xjqrPmjUEUG6r92IxDu536t9a4
 DRkldPYsq1PnBir2HDtoZ6ndZbWBy96z6WBjE7lra12OouvacZ5XcjNtac3YAWSUMJfD8zL0T
 h7ypCAPwf6Gcso7zr9zTJeY5qog4nTJ/p2z8Anofie11Qob8tOPBJWumPEWk64FuNMkCqzXDv
 XxFpfwoSI99bAIKL0/AOe6AWBl5jE20CtWBncLmRI/0BOF4Q8Pyfw+RpXbmZORSCTKTrZ/jgp
 c5y69b+tjcgJu8lBeN8g8AsGHYYrhrCFSc9iM7YZf65lyaO3AAuKtXX9CXziUlA57FtJsuOVv
 8c3wiISU6Vk+zOHqxADQUTU03u8xcNcYDZwoJQyA00yQUSUYSji3KLsU/fbsLqd6gpFebavtR
 0fNE41A8iKeeCuK4lt1dNdKB7kRK/8G04bp8icgne3DA/SbaAoJGnEQN9qTlAOLMtDs39ADWZ
 XcvuT34I3PgNXMKq8ScfMWg5NApyGDEXwt5t5z+jpE8V+EYaEOuZFa0wjyRanHIcwm1GDm6pl
 n8tMGC82/8B8dEivuezfbKqvIu8vffJrJfJ12D4xKn+y3mC2Un5M6nEUh2a3yZJcdawNrJktG
 yeQoVBRmj8M3oM=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/8/21 13:51, Helge Deller wrote:
> On 12/7/21 22:47, John David Anglin wrote:
>> The glibc tst-minsigstksz-5 test fails with a protection id trap.
>> tst-minsigstksz (pid 19958): Protection id trap (code 7) at 00000000f5b=
00497
>>
>> The problem seems to be that the signal return trampoline is placed
>> on the alternate stack but the alternate is not executable.  It is
>> allocated by malloc.> ...
>> Stacks are normally executable on hppa so the trampoline works.  But
>> user code wouldn't normally make an alternate stack executable.
> True, I think most people just forget that such architectures exist.
>
> Anyway, the glibc testcase is interesting.
> The pretty similar sigaltstack testcase from LTP does work:
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/s=
yscalls/sigaltstack/sigaltstack01.c
>
> Both use malloc() to allocate the memory, the only difference is the siz=
e allocated.
> If you change the glibc testcase to:
> -- size_t stack_buffer_size =3D 64 * 1024 * 1024;
> ++ size_t stack_buffer_size =3D SIGSTKSZ;
> it allocates only 8kB instead of 64MB.
>
> It seems glibc uses brk() in both cases, but when allocating 64MB it add=
itionally adds a mmap() with READ/WRITE permissions only:
> brk(0x606000)                           =3D 0x606000
> mmap2(NULL, 67112960, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -=
1, 0) =3D 0xf303f000
>
> This will then break - as you mentioned - the signal handling on parisc.
>
> I see those options to fix it:
> a) Fix the application to map the memory +x
> b) Add some code to glibc to map the memory +x when sigaltstack is calle=
d.
> c) Add some (parisc-only) code to kernel to set the permission.

Option d):
Enhance the kernel to create a per-process new page and map it +rx into th=
e userspace
at process start time. Kernel sets up the page to contain the signal tramp=
oline code.

Option e):
Finally implement vDSO, which then includes option d)

With options d) and e) we could get completely rid of executable stacks.

Helge
