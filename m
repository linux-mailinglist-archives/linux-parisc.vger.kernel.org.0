Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C48169A221
	for <lists+linux-parisc@lfdr.de>; Fri, 17 Feb 2023 00:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjBPXMh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 16 Feb 2023 18:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBPXMg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 16 Feb 2023 18:12:36 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD144AFE2
        for <linux-parisc@vger.kernel.org>; Thu, 16 Feb 2023 15:12:34 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id k24so3472816pji.2
        for <linux-parisc@vger.kernel.org>; Thu, 16 Feb 2023 15:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQVsR5wfSfmPeu0aiFlFL5s3L4ugIg7Vo1U0GPGQX2M=;
        b=2zSrzVeMh47E8uM3umq3sVAnEOdiuO2hZhyGc8zNEVV65xEvQAvZzgl5A501uaSJNY
         FMWmH8zpVFZ3pwli8YL2qeBzwLDRpeDWxCItHCAAZp5S+tmtQkk0d4WhbHvkY4M212i3
         TUCHJuB/OWzlZoEyxFfeQ5Pz7MYQKG4tAjsqLu7/vbNAvi+j45rXMCHaTaF7e27H31DA
         bE0k3nvZjtFENDvPN+xXftC0Ez5XH/xM7rHplN6Q+JwHBH6TMdD/itz2xWkww6e7z/fN
         g+t1qBjMKUVdd+w9y7SJ1ilOUEzI58Vr5uRmhjYBPGNaeXZ9u/xTTEz+BF/9eN61OJvK
         nZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQVsR5wfSfmPeu0aiFlFL5s3L4ugIg7Vo1U0GPGQX2M=;
        b=uBr3fVwp1NYjj6zISduSJAKBDNs15x3bcmPWQhbvjK6qgCVMv5EG9Zg6dWABIPdTAr
         rFTb0NA/qGa4XWbqJYqRO2W9/Ux8TmwJvZWmnYrxcF0r6vhE6pgSURABoyZBYhQxxAbn
         +XrasczFELUI+3+mAa4Yx+MxoSA4XMxnzO7ZVuHaeluNER7Ms7gNVdY+9zrMnPVd9BRu
         AtbXa9QyGSifQH/NgjClvN6h12ssHUjB/XXyvlIzERRxXxtD9ybPVJ7pb9a/VnnLn1+h
         ukI4IJwXXn5lxParywlO9vKbHHcAJF+AlxZa1b90ycqbwo49ArzS75WnyqHRf6AqBbRN
         Lg5w==
X-Gm-Message-State: AO0yUKXJ3R96RlxetoCPRa+QFLFNAQK+K7kSjiXfVXTGA9U9UgLQtnzM
        EadwMjcJO5AK0iXkArnKDh2Ghg==
X-Google-Smtp-Source: AK7set8PC379KeihRNO+/iuFVVM6Wz0qaUdeqSEgGRJu3uVOWQWByH4nBO44F4DlBmpsbyk8QYH1Hg==
X-Received: by 2002:a17:903:41cc:b0:199:3f82:ef62 with SMTP id u12-20020a17090341cc00b001993f82ef62mr8509983ple.5.1676589154195;
        Thu, 16 Feb 2023 15:12:34 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902a3c700b0019324fbec59sm1821813plb.41.2023.02.16.15.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 15:12:33 -0800 (PST)
Message-ID: <c198a68c-c80e-e554-c33e-f4448e89764a@kernel.dk>
Date:   Thu, 16 Feb 2023 16:12:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: liburing test results on hppa
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     io-uring@vger.kernel.org, Helge Deller <deller@gmx.de>
References: <64ff4872-cc6f-1e6a-46e5-573c7e64e4c9@bell.net>
Content-Language: en-US
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <64ff4872-cc6f-1e6a-46e5-573c7e64e4c9@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/16/23 4:00?PM, John David Anglin wrote:
> Running test buf-ring.t bad run 0/0 = -233
> test_running(1) failed
> Test buf-ring.t failed with ret 1

As mentioned previously, this one and the other -233 I suspect are due
to the same coloring issue as was fixed by Helge's patch for the ring
mmaps, as the provided buffer rings work kinda the same way. The
application allocates some aligned memory, and registers it and the
kernel then maps it.

I wonder if these would work properly if the address was aligned to
0x400000? Should be easy to verify, just modify the alignment for the
posix_memalign() calls in test/buf-ring.c.

> Running test file-verify.t Found 98528, wanted 622816
> Buffered novec reg test failed
> Test file-verify.t failed with ret 1

Unsure what this is.

> Tests timed out (2): <a4c0b3decb33.t> <send-zerocopy.t>

I suspect the box is just too slow to run these before the script
decides they have timed out.

> I modified poll-race-mshot.t to skip on hppa.  Added handle_tw_list
> and io_uring_try_cancel_requests fixes. This appears to have fixed
> stalls.

poll-race-mshot is the most interesting one, but I'll need som actual
info on that one to make guesses as to what is going on. A raw hex trace
doesn't really help me very much...

But I don't think we'll make much progress here unless someone dives in
and takes a closer look. So while I appreciate the test report, we need
to dig a bit deeper to figure out poll-race-mshot and file-verify. qemu
may be useful for some things, but it's not of much help here.

-- 
Jens Axboe

