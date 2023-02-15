Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61EFB69888C
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Feb 2023 00:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjBOXD5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Feb 2023 18:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjBOXDy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Feb 2023 18:03:54 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D431B33E
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 15:03:28 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id h4so233642pll.9
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 15:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LN17kd7Q9pNcfHh7RML7V2xH03z9kn06iimOAXPvJdM=;
        b=RNhyVNIDm75QJZJrEwlK38I+ZwG32NeKs19kvmaWTRp9yO32azz72R4UiDKJRub4GO
         AVunIcoSBIozizkxt+Ev6tRrOWXc+7R7k1dImXR8mFYiBH3KZIrm99E7bb8M/P4zbzZc
         hjLK7zzv9PUsVA5AXPFH+kTVfQ+D4uVFLCfiJJPC6EpgoxhoR3w3PzKAvsHIkESmzMSP
         9cHIwSOKsKJ/9Y1WwG8thMJYgP0DwpDZg68cL8ibc/QRDhAFpdFPbpQCInIi/oVsq6oA
         Ws/DWBlkXWwrmeVHWYKPUmD/konUYFh+CExT5B3J2aup1k2UvARJVClA8HkWqZoGkOJ8
         5SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LN17kd7Q9pNcfHh7RML7V2xH03z9kn06iimOAXPvJdM=;
        b=OdA+6t+YYYcbYX4+VSm1ADWIpwb6CrjmVYIBF1QqhihpYon1j//cyIgEXXj9HKpnIO
         2kPvO21xm/l3NclNagBlsTlY8MtvLzc9H/XIMkPDS1O1Jf06BJpwhJxEDv+a050x+Vrc
         FpObzO68hqtLiqCy/qBNkne0Gv8Mi9ywsUWvCFj+zLfhwkwHrSskEx8R5k+Sk5NHo5qf
         /5UjSnaBS1XtQS48gN658VnuwPFTAxYdTxiqIhiSXeoqP/oyV44bRLUHqwc8dHAWlxnh
         qaf9P/Yn/hu0U5UyyhwluaID9WRwdUJzhbjPARBf+PBYTLjn9eLCl6OmLBsrwHdyxfUC
         ABEw==
X-Gm-Message-State: AO0yUKVrnwUjYWEoGcUyVd3UtQsr6/ftGR1oXcia1msHRdQUFtjLWSQa
        5HjcyuCslBlRikJ2ACbTFcUl0Q==
X-Google-Smtp-Source: AK7set/Qv3qUbJadHKXmM956tnL8K1TQYL5Fqaqa/7EvqT7vIkHu/uhgizLr3RVtNSZ7o6hypQOfnQ==
X-Received: by 2002:a17:903:1c9:b0:196:3f5a:b4f9 with SMTP id e9-20020a17090301c900b001963f5ab4f9mr4841507plh.1.1676502207767;
        Wed, 15 Feb 2023 15:03:27 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902c1cd00b0019ab58f47a6sm4148560plc.105.2023.02.15.15.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 15:03:27 -0800 (PST)
Message-ID: <7c25d3c0-f3d8-f474-1662-f92f03b95be6@kernel.dk>
Date:   Wed, 15 Feb 2023 16:03:26 -0700
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
 <a03d75b9-a9b8-b950-c53d-6df85fe8adc4@kernel.dk>
 <07810314-94f6-0e9a-984b-0a286cbb59d3@kernel.dk>
 <4f4f9048-b382-fa0e-8b51-5a0f0bb08402@kernel.dk>
 <99a41070-f334-f3cb-47cd-8855c938d71f@bell.net>
 <d8dc9156-c001-8181-a946-e9fdfe13f165@kernel.dk>
 <c7725c80-ba8c-1182-7adc-bc107f4f5b75@bell.net>
 <5e72c1fc-1a7b-a4ed-4097-96816b802e6d@bell.net>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <5e72c1fc-1a7b-a4ed-4097-96816b802e6d@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/15/23 2:39 PM, John David Anglin wrote:
> On 2023-02-15 4:06 p.m., John David Anglin wrote:
>> On 2023-02-15 3:37 p.m., Jens Axboe wrote:
>>>> System crashes running test buf-ring.t.
>>> Huh, what's the crash?
>> Not much info.  System log indicates an HPMC occurred. Unfortunately, recovery code doesn't work.
> The following occurred running buf-ring.t under gdb:
> 
> INFO: task kworker/u64:9:18319 blocked for more than 123 seconds.
>       Not tainted 6.1.12+ #4
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/u64:9   state:D stack:0     pid:18319 ppid:2 flags:0x00000000
> Workqueue: events_unbound io_ring_exit_work
> Backtrace:

I don't think this is buf-ring, it's off the exit path which is offloaded
and most likely related to your iopoll report.

-- 
Jens Axboe


