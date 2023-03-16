Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 516DB6BD979
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Mar 2023 20:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjCPTqk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 16 Mar 2023 15:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCPTqj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 16 Mar 2023 15:46:39 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1892968FF
        for <linux-parisc@vger.kernel.org>; Thu, 16 Mar 2023 12:46:36 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id f14so1310334iow.5
        for <linux-parisc@vger.kernel.org>; Thu, 16 Mar 2023 12:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1678995996;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1D9uano8Q4OA28f5Av8ERnx+9jpDp8JbJer6Lrxsw0M=;
        b=cAe2lmMHPGjBNtpiBjRV1HXk4vraHA4e3NBrlPhO38zR6RDigQkMj3mQX4bR/SEW8W
         uJRCDVoJko7Q6tUx5FIC72nFaMmgd1KjgiXNPvBOMKmHgPH1PFWB5lprz3R/TclQfx0M
         cCneD6YxzUC9rVx7MTTL/9ze1uWLlJZh/oREF4XYHmUPHsxtJdAzq5lj+u4ooA9PT2iR
         W940b5rP+Gf/T+vkXVzt8J+08NlJoC4e8a++NNIvvaf1Pk28v5XO9Fp3pFSkd9laXA/F
         6AzGvoAQ2fmF/NGKF5fqbJP7MgZR4ib2gj4kBncYHu9RXc2nFga8kfZc+Dm8PYKsIMDx
         5GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678995996;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1D9uano8Q4OA28f5Av8ERnx+9jpDp8JbJer6Lrxsw0M=;
        b=AMPg/MsuXUAtJaTXkrSjUBrRmpZ3xPDBAT8r9X7oNf8sMZ0hUjjoURohw6sND6Ts5T
         UaMKRkYKqoOHRLZL9jkyFKcG3A0PNAxzrNtD9Q8R6S1aR4bRTxL3gjsFcCydLd6f1lgz
         Hc2KyOjxrCxNJemrrKJ+67j3cPra4gsMjja9M34HZYmjJdHkPWc2fUXP3FpYgnXVuVDO
         3UV27XqFOqddlD7Asrggr49EXeBxptwH+m1v2wo+N4KvWBEaGvSJ6IiVqwp0nysoasub
         T8AIR7bR54vxZgf20s8qXsQS2UM1MpTvVldLOt/IZA3azVoqHgHzHmb7rJycoqmdOja2
         Aoyw==
X-Gm-Message-State: AO0yUKU+6VMYgCxmtddmXI/aaJr7sB95HPXs9r5/yAUSrTE09XDXA86T
        2igsBzlYQMc9SBq4EsBlh/SUBDrShZvROE31nELkkw==
X-Google-Smtp-Source: AK7set/jAFlRZq6KU0Tw+KrG5qb4K7iVb826r2/PpvOdzoW2o5HTMSJdznd4IwtK9VOxCMmxpLbU7w==
X-Received: by 2002:a5e:c204:0:b0:740:7d21:d96f with SMTP id v4-20020a5ec204000000b007407d21d96fmr2048970iop.1.1678995996019;
        Thu, 16 Mar 2023 12:46:36 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id b15-20020a026f4f000000b0040613520534sm40658jae.118.2023.03.16.12.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 12:46:35 -0700 (PDT)
Message-ID: <29ef8d4d-6867-5987-1d2e-dd786d6c9cb7@kernel.dk>
Date:   Thu, 16 Mar 2023 13:46:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCHSET 0/5] User mapped provided buffer rings
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>, io-uring@vger.kernel.org,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <20230314171641.10542-1-axboe@kernel.dk>
 <0eeed691-9ea1-9516-c403-5ba22554f8e7@gmx.de>
 <3dcf3e0c-d393-cb95-86ab-00b4d8cf3c75@gmx.de>
 <88b273f6-a747-7d2e-7981-3d224fdac7be@kernel.dk>
 <41a23244-a77a-01c4-46de-76b85a6f4d63@kernel.dk>
 <babf3f8e-7945-a455-5835-0343a0012161@bell.net>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <babf3f8e-7945-a455-5835-0343a0012161@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/16/23 1:08?PM, John David Anglin wrote:
> On 2023-03-15 5:18 p.m., Jens Axboe wrote:
>> On 3/15/23 2:38?PM, Jens Axboe wrote:
>>> On 3/15/23 2:07?PM, Helge Deller wrote:
>>>> On 3/15/23 21:03, Helge Deller wrote:
>>>>> Hi Jens,
>>>>>
>>>>> Thanks for doing those fixes!
>>>>>
>>>>> On 3/14/23 18:16, Jens Axboe wrote:
>>>>>> One issue that became apparent when running io_uring code on parisc is
>>>>>> that for data shared between the application and the kernel, we must
>>>>>> ensure that it's placed correctly to avoid aliasing issues that render
>>>>>> it useless.
>>>>>>
>>>>>> The first patch in this series is from Helge, and ensures that the
>>>>>> SQ/CQ rings are mapped appropriately. This makes io_uring actually work
>>>>>> there.
>>>>>>
>>>>>> Patches 2..4 are prep patches for patch 5, which adds a variant of
>>>>>> ring mapped provided buffers that have the kernel allocate the memory
>>>>>> for them and the application mmap() it. This brings these mapped
>>>>>> buffers in line with how the SQ/CQ rings are managed too.
>>>>>>
>>>>>> I'm not fully sure if this ONLY impacts archs that set SHM_COLOUR,
>>>>>> of which there is only parisc, or if SHMLBA setting archs (of which
>>>>>> there are others) are impact to any degree as well...
>>>>> It would be interesting to find out. I'd assume that other arches,
>>>>> e.g. sparc, might have similiar issues.
>>>>> Have you tested your patches on other arches as well?
>>>> By the way, I've now tested this series on current git head on an
>>>> older parisc box (with PA8700 / PCX-W2 CPU).
>>>>
>>>> Results of liburing testsuite:
>>>> Tests timed out (1): <send-zerocopy.t> - (may not be a failure)
>>>> Tests failed (5): <buf-ring.t> <file-verify.t> <poll-race-mshot.t> <ringbuf-read.t> <send_recvmsg.t>
>> If you update your liburing git copy, switch to the ring-buf-alloc branch,
>> then all of the above should work:
> With master liburing branch, test/poll-race-mshot.t still crashes my rp3440:
> Running test poll-race-mshot.t Bad cqe res -233
> Bad cqe res -233
> Bad cqe res -233
> 
> There is a total lockup with no messages of any kind.
> 
> I think the io_uring code needs to reject user supplied ring buffers that are not equivalently mapped
> to the corresponding kernel pages.  Don't know if it would be possible to reallocate kernel pages so they
> are equivalently mapped.

We can do that, you'd just want to add that check in io_pin_pbuf_ring()
when the pages have been mapped AND we're on an arch that has those
kinds of requirements. Maybe something like the below, totally
untested...

I am puzzled where the crash is coming from, though. It should just hit
the -ENOBUFS case as it can't find a buffer, and that'd terminate that
request. Which does seem to be what is happening above, that is really
no different than an attempt to read/receive from a buffer group that
has no buffers available. So a bit puzzling on what makes your kernel
crash after that has happened, as we do have generic test cases that
exercise that explicitly.


diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index cd1d9dddf58e..73f290aca7f1 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -491,6 +491,15 @@ static int io_pin_pbuf_ring(struct io_uring_buf_reg *reg,
 		return PTR_ERR(pages);
 
 	br = page_address(pages[0]);
+#ifdef SHM_COLOUR
+	if ((reg->ring_addr & (unsigned long) br) & SHM_COLOUR) {
+		int i;
+
+		for (i = 0; i < nr_pages; i++)
+			unpin_user_page(pages[i]);
+		return -EINVAL;
+	}
+#endif
 	bl->buf_pages = pages;
 	bl->buf_nr_pages = nr_pages;
 	bl->buf_ring = br;

-- 
Jens Axboe

