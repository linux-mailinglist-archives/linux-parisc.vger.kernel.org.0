Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5248744E4F
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jul 2023 17:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjGBPYP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jul 2023 11:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjGBPYO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jul 2023 11:24:14 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-003.bell.net [209.71.212.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766E0E6E
        for <linux-parisc@vger.kernel.org>; Sun,  2 Jul 2023 08:24:12 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.181.186.176]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64A12924000AFE95
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedviedruddtgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceugffnnfdpqfgfvfenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuhffvfhgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpedutdekveejveefueekueffvefguddvlefhhfefgeeiteektdfgleffuedttdeiteenucfkphepudegvddrudekuddrudekiedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrddukedurddukeeirddujeeipdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdgruhhthhgpuhhsvghrpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpghgvohfkrfepveetpdfovfetjfhoshhtpegtmhigqdhtohhrrhhgohdttddu
X-CM-Envelope: MS4xfIM/nlL9ftwcGRG0Hh5SyTU4ZhHybekArV0Z6pTRaUMS1TZnOnW18R6SkcZWa8I/Rqr0+3LK7jhFDekA05MpUG6XlR2x15JMm18wfuBheurGYhQ8KR9u
 +Zje+/l7g7QpugCGn4Beum8w9FmsiH9z4Wnct6G4e5sIEcHHrGbsEqRKCkeIkQGb2CEdt5NgsAAi4U3GRVbFiMXkxgpLY0fUD33owJy1LHfmsD0DX1axfK+T
 WPSWP8LYbxhJmBGt3P5kzqy+mpAdA0feMW9eHDxO+vw=
X-RazorGate-Vade-Verdict: clean 0
X-CM-Analysis: v=2.4 cv=UM++oATy c=1 sm=1 tr=0 ts=64a1969b
 a=4B+q39mD0Bm0IdZjDiNhQQ==:117 a=4B+q39mD0Bm0IdZjDiNhQQ==:17
 a=IkcTkHD0fZMA:10 a=Z4Rwk6OoAAAA:8 a=ag1SF4gXAAAA:8 a=FBHGMhGWAAAA:8
 a=RzOe2KLiYINiSzh6IxUA:9 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.181.186.176) by cmx-torrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64A12924000AFE95; Sun, 2 Jul 2023 11:24:11 -0400
Message-ID: <52379fd0-1c3a-1cf6-1e00-dab8bcf8dab6@bell.net>
Date:   Sun, 2 Jul 2023 11:24:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: execv: Argument list too long
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
References: <612eaa53-6904-6e16-67fc-394f4faa0e16@bell.net>
In-Reply-To: <612eaa53-6904-6e16-67fc-394f4faa0e16@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-07-02 11:08 a.m., John David Anglin wrote:
> With Linux  6.1.37+, there is a problem with argument lists:
>
> | gcc -E -undef     -I../include -I/home/dave/gnu/glibc/objdir/csu -I/home/dave/gnu/glibc/objdir  -I../sysdeps/unix/sysv/linux/hppa 
> -I../sysdeps/hppa/nptl  -I../sysdeps/unix/sysv/linux/include -I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl -I../sysdeps/pthread  
> -I../sysdeps/gnu  -I../sysdeps/unix/inet -I../sysdeps/unix/sysv  -I../sysdeps/unix  -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1  
> -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32  -I../sysdeps/ieee754/dbl-64 -I../sysdeps/hppa/fpu  -I../sysdeps/hppa  
> -I../sysdeps/ieee754 -I../sysdeps/generic  -I.. -I../libio -I. -nostdinc -isystem /usr/lib/gcc/hppa-linux-gnu/12/include -isystem /usr/include 
> -D_LIBC_REENTRANT  -include ../include/libc-symbols.h -DTOP_NAMESPACE=glibc -x assembler-with-cpp - \
>            > /home/dave/gnu/glibc/objdir/Versions.v.iT
> make[2]: /bin/sh: Argument list too long
> gcc: fatal error: cannot execute '/usr/lib/gcc/hppa-linux-gnu/12/cc1': execv: Argument list too long
> compilation terminated.
>
> Linux 6.1.36+ is okay.
>
> It doesn't help to increase stack limit.
I suppose this was caused by:

commit 4a1db15878aacb89e8f24c98a2f96fad6db3f967
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jun 29 23:04:57 2023 -0700

     parisc: fix expand_stack() conversion

     commit ea3f8272876f2958463992f6736ab690fde7fa9c upstream.

     In commit 8d7071af8907 ("mm: always expand the stack with the mmap write
     lock held") I tried to deal with the remaining odd page fault handling
     cases.  The oddest one is ia64, which has stacks that grow both up and
     down.  And because ia64 was _so_ odd, I asked people to verify the end
     result.

     But a close second oddity is parisc, which is the only one that has a
     main stack growing up (our "CONFIG_STACK_GROWSUP" config option).  But
     it looked obvious enough that I didn't worry about it.

     I should have worried a bit more.  Not because it was particularly
     complex, but because I just used the wrong variable name.

     The previous vma isn't called "prev", it's called "prev_vma". Blush.

     Fixes: 8d7071af8907 ("mm: always expand the stack with the mmap write lock held")
     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Dave

-- 
John David Anglin  dave.anglin@bell.net

