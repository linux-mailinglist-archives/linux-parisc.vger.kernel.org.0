Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F331698409
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Feb 2023 20:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjBOTAr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Feb 2023 14:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBOTAq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Feb 2023 14:00:46 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DBD3BD89
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 11:00:45 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id i6so972926ilk.5
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 11:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1676487644;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mN0/eJQai3x3ybZl//S8iaCrYhScx+jzcd0GTy3BlRE=;
        b=5pk5MYgm5krR5xk3VvC6mhsg0YPqADpLtPISJL978Odtm3STHOOFV1JBC7ijzr3e0T
         jBAsHlFH//ScwMowP6CzTTe8jArAX+gu31uMikNI2yr+rUoK4i3bBEOtWEWLfGHcZEUZ
         WTTAKHTsX7S/VaTf7fVMqfLjo/RYsbOZTFA1jh8vyfM689HO/oNi99CO+svux2qcZbph
         FZ9+PoLKGcqU3enoH882gK6X9lWjU4/bivm2SmG7X/ni8In4eaGtumNgc0kJX7WDEayj
         /SgGy2bKHgl4Wd+x/Wx9IIrIzWwe5p710l8ksjlhI1obRQKqSxbw3CYiDhYnZO0hpFaT
         s8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676487644;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mN0/eJQai3x3ybZl//S8iaCrYhScx+jzcd0GTy3BlRE=;
        b=n7Vj19jRLkDOH4/cHT7r7Y4C8qjX7g4qyrge82IbYy8ydPzxbQYbXbKxjbTCDoGkUT
         T+tZavz1p52qqnUQWi8TuSpfrJOE3TeUudHGriEIXswCDiWO+s+sx5A76JClqWsn5N4A
         wKnnMErIn1gspB+LT73BNSQKl260VN0xEiGbNM/yrWw/C8SG8kpBuLyLbYu4owz3CKnG
         kEUtISSkaymtuN86TLnO5DPHMkJGKrvxjE9fJCASW7AjYhR540gvuo1LTcgxJ7yhqe9a
         cGH/lvVeuDpYKomGsrx2K+0GkcfWq4+6lv+vmhLKarPWbt5e80zv+VqruTFy+RDSFBIX
         Rojw==
X-Gm-Message-State: AO0yUKVWiI80V8RnCCLB6+7vQ52jvC3/kAo4qS6Coc2i1r2imQFWKZGe
        D5weJ47Ri2FX8JgXiqNSUA6Ezw==
X-Google-Smtp-Source: AK7set+7NTQpQepcOzISk2KY3wQRtm2ardVSyFT1L7Eu6+ElxGP7HdHOdFzKee9hwrGfnFpv4N5EJg==
X-Received: by 2002:a92:ac0c:0:b0:315:363e:b140 with SMTP id r12-20020a92ac0c000000b00315363eb140mr2141772ilh.1.1676487644571;
        Wed, 15 Feb 2023 11:00:44 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id q8-20020a02c8c8000000b003c4eb8f862fsm827480jao.66.2023.02.15.11.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 11:00:44 -0800 (PST)
Message-ID: <07810314-94f6-0e9a-984b-0a286cbb59d3@kernel.dk>
Date:   Wed, 15 Feb 2023 12:00:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: io_uring failure on parisc with VIPT caches
Content-Language: en-US
From:   Jens Axboe <axboe@kernel.dk>
To:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>, io-uring@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Y+wUwVxeN87gqN6o@p100>
 <006e8db4-336f-6717-ecb0-d01a0e9bc483@kernel.dk>
 <626cee6f-f542-b7eb-16ca-1cf4e3808ca6@bell.net>
 <5f02fa8b-7fd8-d98f-4876-f1a89024b888@kernel.dk>
 <2b89f252-c430-1c44-7b30-02d927d2c7cb@gmx.de>
 <f7c3ef57-f16c-7fe3-30b7-8ca6a9ef00ee@kernel.dk>
 <0bfe6cdb-2749-c08d-a1b2-ef46fed1ded3@bell.net>
 <a03d75b9-a9b8-b950-c53d-6df85fe8adc4@kernel.dk>
In-Reply-To: <a03d75b9-a9b8-b950-c53d-6df85fe8adc4@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/15/23 10:01?AM, Jens Axboe wrote:
> On 2/15/23 9:38?AM, John David Anglin wrote:
>> On 2023-02-15 10:56 a.m., Jens Axboe wrote:
>>>> Is there maybe somewhere a more detailled testcase which I could try too?
>>> Just git clone liburing:
>>>
>>> git clone git://git.kernel.dk/liburing
>>>
>>> and run make && make runtests in there, that'll go through the whole
>>> regression suite.
>> Here are test results for Debian liburing 2.3-3 (hppa) with Helge's original patch:
>> https://buildd.debian.org/status/fetch.php?pkg=liburing&arch=hppa&ver=2.3-3&stamp=1676478898&raw=0
> 
> Most of the test failures seem to be related to O_DIRECT opens, which
> I'm guessing is because it's run on an fs without O_DIRECT support?
> Outside of that, I think some of the syzbot cases are just generally
> broken on various archs.
> 
> Lastly, there's a few of these:
> 
> Running test buf-ring.t                                             bad run 0/0 = -233
> 
> and similar (like -223) which I really don't know what is, where do
> these values come from? Ah hang on, they are in the parisc errno,
> so that'd be -ENOBUFS and -EOPNOTSUPP. I wonder if there's some
> discrepancy between the kernel and user side errno values here?

I ran the tests in qemu, but didn't see the weird differences in errno
values here between the kernel and userspace. As an example of the above
one:

root@debian:~/liburing# test/buf-ring.t 
root@debian:~/liburing# echo $?
0

it runs fine here. The other failure cases:

917257daa0fe.t: this is due to syzbot using hard wired values, I changed
it to symbolic mmap flags, and ditto for all the other tests where that
was the issue.

accept.t: setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val));
fails here, no idea why.

xattr.t: works for me

The rest look like either errno value mismatches, or O_DIRECT not
working for you. This was tested with 6.2-rc7+ git, so a recent kernel.

-- 
Jens Axboe

