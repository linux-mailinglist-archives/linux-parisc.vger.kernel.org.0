Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D29698022
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Feb 2023 17:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjBOQEk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Feb 2023 11:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjBOQEj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Feb 2023 11:04:39 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB033802F
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 08:04:38 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id j17so7244507ioa.9
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 08:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwQEQY9hlhN5RuHSM783cpcBXKwGGfLTmdZL7VpxQmw=;
        b=phf8QIP9KPXUrV9IUTgVvV3qq3RnYOX3kHEwXtivZ3vtHE+glggkr33akEZ2Iq25zx
         KbUpqP17SHAIDM2jOqObmAeFZEGtHX6xvvaDKeX4g6nzjiRMtvytRl4Nnxz+s4odsUYx
         BRdSUnS3++XThwHgB9FyiAOGSAzlEeO2gAjq/a4z5rRgAyMoNGI5SQX6iBGOnaM7Uh9I
         oJFFn3F97+jofolgPuR1STuML3GiCZR0un5fQ5F+lTTNfdnexrUePVFOhOqCr1uBEZuD
         hg3rStoL/YqHVOLT5Y05E+gZFciE5/o7WCN/WGysmYhFrqVjYsXb434alGYSOxe3ypzC
         67Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwQEQY9hlhN5RuHSM783cpcBXKwGGfLTmdZL7VpxQmw=;
        b=i1lU9bhsTLbT6lNZaxCLm4yseemzTGoC00042U7uDFi6nKZT9Pneu/Nz5J/i+l0Gxf
         cZe4if8lcB0W12aCKgtIOq20Puov4wKz3hJ3tDMCdkaFGO8VHtyXAtUiotqf8sIiJlhk
         5b/VP4l0qN/DZ1Mj5Gm7GKVveYH6wV4ec7Rz5yWzRC1hpnGv13X5031kkck7f6W/tQCF
         EZjxy2KDRPATFf65Jya2zL9ONdpjiZrHgAWeimy2/CP57OQQ4jmuNPZaSYN2aqSefN/U
         7WAbQeRO2dyq2Q9wgBXY+UJbZv4PwrTaGwL4/cCpBivU8ix/KKU/Hc3GIvzpeLx52Hg+
         ICYA==
X-Gm-Message-State: AO0yUKUk10rr3q+s6Ocd5D/zX2wIRzQqQb0jWVoC/CbRpp4F6FfFPJ3N
        s9w87eaIwZDTHuz/8+wRfjSD1w==
X-Google-Smtp-Source: AK7set/VcfHB7fcTePDTTPjUs5a/kVwh+gne7LnLsA148xWVKllJP6LcPAk51KetzVx2RzKroMgsGA==
X-Received: by 2002:a6b:b4ca:0:b0:71d:63e5:7b5f with SMTP id d193-20020a6bb4ca000000b0071d63e57b5fmr1763700iof.2.1676477077901;
        Wed, 15 Feb 2023 08:04:37 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id b67-20020a6bb246000000b0072901623a3asm6219524iof.38.2023.02.15.08.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 08:04:37 -0800 (PST)
Message-ID: <759bc2f7-5f9e-2a62-aa37-361dea902af5@kernel.dk>
Date:   Wed, 15 Feb 2023 09:04:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: io_uring failure on parisc with VIPT caches
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        io-uring@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Y+wUwVxeN87gqN6o@p100>
 <006e8db4-336f-6717-ecb0-d01a0e9bc483@kernel.dk>
 <626cee6f-f542-b7eb-16ca-1cf4e3808ca6@bell.net>
 <5f02fa8b-7fd8-d98f-4876-f1a89024b888@kernel.dk>
 <2b89f252-c430-1c44-7b30-02d927d2c7cb@gmx.de>
 <f7c3ef57-f16c-7fe3-30b7-8ca6a9ef00ee@kernel.dk>
 <1e77c848-5f8d-9300-8496-6c13a625a15c@gmx.de>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1e77c848-5f8d-9300-8496-6c13a625a15c@gmx.de>
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

On 2/15/23 9:02?AM, Helge Deller wrote:
>>>> +static unsigned long io_uring_mmu_get_unmapped_area(struct file *filp,
>>>> +            unsigned long addr, unsigned long len,
>>>> +            unsigned long pgoff, unsigned long flags)
>>>> +{
>>>> +    const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
>>>> +    struct vm_unmapped_area_info info;
>>>> +    void *ptr;
>>>> +
>>>> +    ptr = io_uring_validate_mmap_request(filp, pgoff, len);
>>>> +    if (IS_ERR(ptr))
>>>> +        return -ENOMEM;
>>>> +
>>>> +    /* we do not support requesting a specific address */
>>>> +    if (addr)
>>>> +        return -EINVAL;
>>>
>>> With this ^ we disallow users to provide a proposed address.
>>> I think this is ok and I suggest to keep it that way.
>>>
>>> Alternatively one could check the given address against the
>>> alignment which is calculated below, but this will make the
>>> code IMHO unnecessary bigger.
>>
>> liburing won't provide an address, so I'd say let's just keep it as-is.
> 
> Good.

Maybe it'd be saner to add that alignment check? Just in case someone is
passing in an address already, we could just make it fail for SHMLBA !=
0 (or SHM_COLOUR, I'll leave that to you).

-- 
Jens Axboe

