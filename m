Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D74D4563B2
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Nov 2021 20:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhKRTun (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 18 Nov 2021 14:50:43 -0500
Received: from mta-tor-002.bell.net ([209.71.212.29]:28388 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229989AbhKRTun (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:50:43 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C8802C0B844715
X-CM-Envelope: MS4xfN9s4vlP32V9NcgXP2YXHM+u2JUnBN7D8nFZkOnNpEPIi7CySYkSn/O20+lSm+pDAXHWlgZHJ2cIj23jlQ93xYq0PaLrxNtB71/GKiaUyx3TT/r0zwZb
 rwNDbfJcImyWx/MleO7QHu7oglF/kOc+IvYSD4doYRQNcn0luKJuUkA0w9ABXpslWVKzwmtQ+BLAO9nAMpEZ2PIcTxiIOxuFM54sN++KMcMNerYAe5HKuXm7
 Wjhvrpr/LQGZXfrelZeWb3tPQDTxJfjimOCVLIX08U5oiPoLLyfs+pau4NXo4brQMsLdfhG0X3gVQz0lvmNgroRn7hUbH7Jz0dWBvQADpPQ=
X-CM-Analysis: v=2.4 cv=Zd5+iuZA c=1 sm=1 tr=0 ts=6196addd
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=jZfmRZcjQgnlLDx3f2sA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C8802C0B844715; Thu, 18 Nov 2021 14:47:41 -0500
Message-ID: <ce526095-e6b3-bb1e-aa8e-e97f85e57223@bell.net>
Date:   Thu, 18 Nov 2021 14:47:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] parisc: Fix extraction of hash lock bits in syscall.S
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <df51e873-4576-d4c2-7d86-b607cbb714b4@bell.net>
 <bce8449a-1bdb-ccc5-48cf-09a2a06751aa@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <bce8449a-1bdb-ccc5-48cf-09a2a06751aa@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-18 2:24 p.m., Helge Deller wrote:
> On 11/18/21 18:03, John David Anglin wrote:
>> The extru instruction leaves the most significant 32 bits of the target register in an undefined
>> state on PA 2.0 systems.  If any of these bits are nonzero, this will break the calculation of the
>> lock pointer.
>>
>> Fix by using extrd,u instruction on 64-bit kernels.
> Good catch!!
> Did you checked if it actually happened that the most
> significant 32 bits were non-zero?
No.  I tend to think the bits are always zero but the arch says they are undefined.
> If so, could this be one of the reasons we saw strange
> issues or even memory corruption?
Possibly but I wouldn't be too hopeful that it will make a big difference.
>
> Sadly I sent a pull request to Linus a few hours ago,
> otherwise I would have added this patch...
I just noticed the problem yesterday.  I was looking at the failure of glibc's tst-cleanupx4:

dave@mx3210:~/gnu/glibc/objdir$ env GCONV_PATH=/home/dave/gnu/glibc/objdir/iconvdata LOCPATH=/home/dave/gnu/glibc/objdir/localedata LC_ALL=C 
/home/dave/gnu/glibc/objdir/elf/ld.so.1 --library-path 
/home/dave/gnu/glibc/objdir:/home/dave/gnu/glibc/objdir/math:/home/dave/gnu/glibc/objdir/elf:/home/dave/gnu/glibc/objdir/dlfcn:/home/dave/gnu/glibc/objdir/nss:/home/dave/gnu/glibc/objdir/nis:/home/dave/gnu/glibc/objdir/rt:/home/dave/gnu/glibc/objdir/resolv:/home/dave/gnu/glibc/objdir/mathvec:/home/dave/gnu/glibc/objdir/support:/home/dave/gnu/glibc/objdir/crypt:/home/dave/gnu/glibc/objdir/nptl 
/home/dave/gnu/glibc/objdir/nptl/tst-cleanupx4
test 0
clh (2)
clh (1)
clh (3)
global = 12, expected 15
[...]

As far as I can tell, clh() is called in the wrong order - should be 1, 2, 3.  This gives the expected value of 15.  2, 1, 3 yields 12.

This suggests our atomic operations are broken.  I think the problem may be that atomic loads may need to be sequenced
with the LWS lock.  While sequencing stores is obvious, this is not obvious for loads.  Anyway, I starting hacking on syscall.S
to provide lws_atomic_load and lws_atomic_store operations. Currently, atomic stores are done using CAS operation.  This
is less efficient than it could be.

Another little issue is "because" is misspelled in a couple of places in syscall.S.

Dave

-- 
John David Anglin  dave.anglin@bell.net

