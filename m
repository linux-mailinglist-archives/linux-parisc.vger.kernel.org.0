Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D59869A3ED
	for <lists+linux-parisc@lfdr.de>; Fri, 17 Feb 2023 03:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjBQCdo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 16 Feb 2023 21:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBQCdn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 16 Feb 2023 21:33:43 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72454B52B
        for <linux-parisc@vger.kernel.org>; Thu, 16 Feb 2023 18:33:39 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id kk7-20020a17090b4a0700b00234463de251so7919365pjb.3
        for <linux-parisc@vger.kernel.org>; Thu, 16 Feb 2023 18:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2w8YMSYWS8hZi18cPk31vQWM9RKlPae3QIDiPU465KY=;
        b=3UIY1NuDEUXtdfbwlB1IpM5m0BNa/pUm26bub/F+igVtmLE61RJjVDlhVNCym3wZvA
         WcrHAgySxFVphrq8cPVV0C6ipX9GYJen5fnwJw2KBKYHpOZi3hBedOP0TZm9FYWJcEHl
         WzTcmH0jYYiMJDUGUVJ3FG554Fdk/+r93FmwihANqb+d8X/KcgqRUV78MZRNaZi6tY5x
         itfOUT0P1Kskz8C/2jnkvkUb30wMAoOu3XU81a861OkdDOtW9oEKF/heT1J4SPz2Uup/
         BLgXTXQqCJCCHQz6ZBtqzCkfId9bmvlVEwaum9ngrhic5pndKQN/dfIAcR6ouYLlkGh0
         tnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2w8YMSYWS8hZi18cPk31vQWM9RKlPae3QIDiPU465KY=;
        b=yaLI1AE8kkwFyHfiHz469qC77/BK444D0gVvMZfN4isrYevsZ26pdajRPgD4pM8KPx
         o4lDm/tJ4oqhTpOaNLh69PQgAPTjclU9zbebRfNf5sZBfj5j1b17tI/cQtksvraSLchE
         T+6dOWKmYDZEJi/0gpRMGrLVWz8k3RGr6aa2W1Se2qPo7rz51bYbyTGVssAHerXQ6gaw
         YtXiDtONEN5pMdmLSwBjgZGrguPA2RBjyaUR6S7n1gAXVUpybl9AHRzBLa+pcpxgaRqw
         CQFUl/c15AI3wILtY28xOtwxU1Dxls8OF8XMmkVRhbwi+zXdJMx4vU4JgYi+NNZ17Bbq
         OmSA==
X-Gm-Message-State: AO0yUKUeWA3ImvNl+Ahr0XPhEbTTJCk6roUZ7AlilNbUdonZH1sWXuhW
        hznnZA85afuzACEGLdm+8amtPg==
X-Google-Smtp-Source: AK7set/mTOm6WfGQbqbCG1/aSK6S+gGKO6r51cfA0acykNW5uOZBQlmdADx82nyqVs+G25vgU+C9LA==
X-Received: by 2002:a17:902:d4c3:b0:19c:13d2:44c5 with SMTP id o3-20020a170902d4c300b0019c13d244c5mr825231plg.3.1676601218789;
        Thu, 16 Feb 2023 18:33:38 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090282cc00b0019a7385079esm1950965plz.123.2023.02.16.18.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 18:33:38 -0800 (PST)
Message-ID: <ee1ef3d0-9854-87bc-0c45-f073710f9ef5@kernel.dk>
Date:   Thu, 16 Feb 2023 19:33:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: liburing test results on hppa
Content-Language: en-US
From:   Jens Axboe <axboe@kernel.dk>
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     io-uring@vger.kernel.org, Helge Deller <deller@gmx.de>
References: <64ff4872-cc6f-1e6a-46e5-573c7e64e4c9@bell.net>
 <c198a68c-c80e-e554-c33e-f4448e89764a@kernel.dk>
 <b0ad2098-979e-f256-a553-401bad9921e0@bell.net>
 <6eddaf2b-991f-f848-4832-7005eccdeffa@kernel.dk>
In-Reply-To: <6eddaf2b-991f-f848-4832-7005eccdeffa@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/16/23 4:32 PM, Jens Axboe wrote:
> On 2/16/23 4:26?PM, John David Anglin wrote:
>> On 2023-02-16 6:12 p.m., Jens Axboe wrote:
>>> On 2/16/23 4:00?PM, John David Anglin wrote:
>>>> Running test buf-ring.t bad run 0/0 = -233
>>>> test_running(1) failed
>>>> Test buf-ring.t failed with ret 1
>>> As mentioned previously, this one and the other -233 I suspect are due
>>> to the same coloring issue as was fixed by Helge's patch for the ring
>>> mmaps, as the provided buffer rings work kinda the same way. The
>>> application allocates some aligned memory, and registers it and the
>>> kernel then maps it.
>>>
>>> I wonder if these would work properly if the address was aligned to
>>> 0x400000? Should be easy to verify, just modify the alignment for the
>>> posix_memalign() calls in test/buf-ring.c.
>> Doesn't help.  Same error.  Can you point to where the kernel maps it?
> 
> Yep, it goes io_uring.c:io_uring_register() ->
> kbuf.c:io_register_pbuf_ring() -> rsrc.c:io_pin_pages() which ultimately
> calls pin_user_pages() to map the memory.

Followup - a few of the provided buffer ring cases failed to properly
initialize the ring, poll-mshot-race was one of them... I've pushed out
fixes for this. Not sure if it fixes your particular issue, but worth
giving it another run.

-- 
Jens Axboe


