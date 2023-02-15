Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA8469876E
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Feb 2023 22:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjBOViN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Feb 2023 16:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjBOViL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Feb 2023 16:38:11 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05122B603
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 13:38:09 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id w24so7678999iow.13
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 13:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FjYikXxTsiCqHjFRWAjZux1kBU863fSvE+aPekbauo=;
        b=GPWhsJvb/WW7pzjrCf75f0Xg2BFGoWV9C2TyCSpjyhFPLqZmLxT82s41O09n/4vDgs
         X+/1CWpVzO6idwxlMcpdTuH0ft/fEyvNYWuSUK4xz7WJqJDZD+Y172SsHkFUjpWxiWsp
         zRXE4boMyc9JR9EmhT324QmQEjXiLlOtPWDoAyS73EljI9aLSXDI0AwD0pDqXXftuopK
         M2Klud7Puba02SuvkOSUyxW+/dxFwLuEI/Yg3rXKMZtaU05cRt0pYEbicDL/hTlba7n6
         OIEMFTOF06LMBdDgg8E3cXDy2aaoIDhKumwavfsx52UZ0mebEjPH+v9QPbIRDzBG4Kaz
         kJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2FjYikXxTsiCqHjFRWAjZux1kBU863fSvE+aPekbauo=;
        b=IpsdzrBt03SzJAuVcPPZxFqpbApJMwz4FIwNu37Opgc0WRoDpeDH0+eiPiW2SyZPGO
         xkoSDW3ThAav4qaTDjZI3JeVucoFoZWq9SuIlHBQSkvFZ62E7CD3N/rEQLm16U2SezU/
         xESaV5phoeArQy+n7zWs1amzXhrxl2i0HJNUXVrmVkkrFvUpMHSdCYPkqbOL9fU9WulW
         0JDexsC68CrLicp8V2dsm6XEIVlrOODatBFVKpsbacvttNUNPR+ti5a6lmAGWVSiLR3q
         cXSJomkya1g/NKICUb9HBvq6c1cQ4vKVYXmAuTcNgAAupf8ma98tSV1KOIQF1byenksN
         QsCQ==
X-Gm-Message-State: AO0yUKUqKA0RYnbPqfsLmHjXFVT6QKqeOL9ro65JHm8aW5UGSUiR/CPs
        2TR27CHHj66QNoXP0MylqTgLmQ==
X-Google-Smtp-Source: AK7set+1bkB/PhttX6TYUt72HaI3+Bx+fvgB52rMdCzu7v7BPKka7b7Mo4j/PszByHO6//OFTTNiQw==
X-Received: by 2002:a05:6602:4149:b0:707:d0c0:1bd6 with SMTP id bv9-20020a056602414900b00707d0c01bd6mr2359168iob.1.1676497088926;
        Wed, 15 Feb 2023 13:38:08 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id r23-20020a028817000000b003a7c47efde0sm6121552jai.11.2023.02.15.13.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 13:38:08 -0800 (PST)
Message-ID: <aeebb300-f595-e788-80a4-053af4adc0f3@kernel.dk>
Date:   Wed, 15 Feb 2023 14:38:07 -0700
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
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <c7725c80-ba8c-1182-7adc-bc107f4f5b75@bell.net>
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

On 2/15/23 2:06 PM, John David Anglin wrote:
> On 2023-02-15 3:37 p.m., Jens Axboe wrote:
>>> System crashes running test buf-ring.t.
>> Huh, what's the crash?
> Not much info.  System log indicates an HPMC occurred. Unfortunately, recovery code doesn't work.
>>
>>> Running test buf-ring.t bad run 0/0 = -233
>> THis one, and the similar -223 ones, you need to try and dig into that.
>> It doesn't reproduce for me, and it very much seems like the test case
>> having a different view of what -ENOBUFS looks like and hence it fails
>> when the kernel passes down something that is -ENOBUFS internally, but
>> doesn't match the app -ENOBUFS value. Are you running a 64-bit kernel?
>> Would that cause any differences?
> I'm running a 64-bit kernel (6.1.12).
> 
> I believe 32 and 64-bit kernels have same error codes.
> 
> I see three places in io_uring where -ENOBUFS is returned.  They have similar code:
> 
> retry_multishot:
>         if (io_do_buffer_select(req)) {
>                 void __user *buf;
>                 size_t len = sr->len;
> 
>                 buf = io_buffer_select(req, &len, issue_flags);
>                 if (!buf)
>                         return -ENOBUFS;

buf-ring is using a kernel mapped user ring, so may indeed be the same
kind of coloring issue that we saw with the main rings.

-- 
Jens Axboe


