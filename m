Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE726698185
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Feb 2023 18:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjBORBR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Feb 2023 12:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjBORBO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Feb 2023 12:01:14 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEAB3B3F1
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 09:01:12 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id u8so7704369ilq.13
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 09:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yiqWM6HH7+wfgiaknMVF3VR6f19OKxKeSu0RZUiYVGk=;
        b=45gjb4i/0MTIDwkfJ6dZE5Jz0dcdhUOFOUM8bTz1+6A0nxO0O7brl+nnhETurQdpMQ
         7R1gNMFrOxY7Di9zWBpYCwqLF7fIfpcmoE/qWv9uFZrj+zZnt3dhmqxOLf5Kjv7Z88Yp
         MFKYbcz7kqMA6myTQyzM6gP1c2tc4HoaUrJY6kRZzx7vLjofwIrJCz1VWW5VY1k6xBtR
         AxaMfsAAfp1n/b34MW8CFk++YDGbjZgrJ2t9VxSwmlejIMjwL+jNptz0AFfnDPmyTG6Z
         tf9UCofiICm2R4u9OnQPg4ap+yip5dtXsgvttv+lhSKN+P/BqLM4BITsbH99gyxrZ0D8
         m7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yiqWM6HH7+wfgiaknMVF3VR6f19OKxKeSu0RZUiYVGk=;
        b=WIEEXb9qUSQp3NTUqIwWR/f+NTZOGjjm04vmzP8sOp2EMTIKjZGoJDqWXGTc90kmUx
         E4ORlLiozjP9rjwrusQT2TIiVTI+OQS0aLk13WVDHmRlVZJduqczUijkvQnR5PQlB/p9
         TVeVJUsa4A9KnJTB2k2v4CI5z0D3mvkmGPq0bHsznyzrUgV5Ww126A03vqBpAPd3YwDD
         8RLS4p8q1ekld238uD/YAPDDHpJUYcx8Cvp0ZP62hkanK5tPPbZkJIS8P7qii3eUo0GN
         qRSYe79NyhavTocG0ar1qALjh3y2qaIFyUfIXP5zeoDSAMypXl9EZOadpPJsnbRfzfRE
         FOFQ==
X-Gm-Message-State: AO0yUKUAHn4cVpDrrlkbgwQkQXOJbXfslJmWWHKc+gISkLoMUmGOyMIt
        Jal0ZB38iOSwlKvDToWcQYKzBs3TGjYVxlwm
X-Google-Smtp-Source: AK7set+0PdSdOe8ctFCIoMj4TlvlgMGDvtl7A9O50LRmfdUTJpDe4Bq3X8eQwS7Ih3eJ1ELd9JbAOg==
X-Received: by 2002:a05:6e02:ece:b0:315:2b2a:f458 with SMTP id i14-20020a056e020ece00b003152b2af458mr1857881ilk.3.1676480471640;
        Wed, 15 Feb 2023 09:01:11 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id c11-20020a02a40b000000b003bf39936d1esm5547415jal.131.2023.02.15.09.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 09:01:11 -0800 (PST)
Message-ID: <a03d75b9-a9b8-b950-c53d-6df85fe8adc4@kernel.dk>
Date:   Wed, 15 Feb 2023 10:01:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: io_uring failure on parisc with VIPT caches
Content-Language: en-US
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
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <0bfe6cdb-2749-c08d-a1b2-ef46fed1ded3@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/15/23 9:38 AM, John David Anglin wrote:
> On 2023-02-15 10:56 a.m., Jens Axboe wrote:
>>> Is there maybe somewhere a more detailled testcase which I could try too?
>> Just git clone liburing:
>>
>> git clone git://git.kernel.dk/liburing
>>
>> and run make && make runtests in there, that'll go through the whole
>> regression suite.
> Here are test results for Debian liburing 2.3-3 (hppa) with Helge's original patch:
> https://buildd.debian.org/status/fetch.php?pkg=liburing&arch=hppa&ver=2.3-3&stamp=1676478898&raw=0

Most of the test failures seem to be related to O_DIRECT opens, which
I'm guessing is because it's run on an fs without O_DIRECT support?
Outside of that, I think some of the syzbot cases are just generally
broken on various archs.

Lastly, there's a few of these:

Running test buf-ring.t                                             bad run 0/0 = -233

and similar (like -223) which I really don't know what is, where do
these values come from? Ah hang on, they are in the parisc errno,
so that'd be -ENOBUFS and -EOPNOTSUPP. I wonder if there's some
discrepancy between the kernel and user side errno values here?

-- 
Jens Axboe


