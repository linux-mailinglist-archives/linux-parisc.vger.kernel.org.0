Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112656BBDC8
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Mar 2023 21:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbjCOUL3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Mar 2023 16:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbjCOUL2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Mar 2023 16:11:28 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E694292246
        for <linux-parisc@vger.kernel.org>; Wed, 15 Mar 2023 13:11:26 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id q6so8351652iot.2
        for <linux-parisc@vger.kernel.org>; Wed, 15 Mar 2023 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1678911086;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5l0cyX/Gw7AtJo7OxPEpznBkhuByFrSvGNbuSt8X2fk=;
        b=V6SCptthzkM9GmpP575SL5NtVf5gGWBwZJtUMB+xix7JcwSarj7PZHG2JWB+h5L964
         tfECqIaRvzXCjRgkCCW5onOJn2wiWf6t4mE4+y3kFtEbd3IjpPwO1edJGwdKlFis4or9
         yrX+hr5/bzfygUFqWm3ELeSUGMwnwjH1pwVC0rx31bY8+kwK2H6xSEitzQjaHvfhrbPt
         10+bK6RtxBfZzN2cEiLJu5agfVZDGaISah+w5hpT2mkGTN+4Uzj0fct/mo8txdid8vVr
         02OowgvCPY/NU1GbQOsu0KGnHVsCc+ozg38KNHIZ2cVLoT5FhmYEbuysaPrAD8mggs9J
         EC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678911086;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5l0cyX/Gw7AtJo7OxPEpznBkhuByFrSvGNbuSt8X2fk=;
        b=E1Y6o891jOn01MV7+0mzqFnLDGKd/kHu80w/2RbiJSWCjRTXqXJ1RQ5ABGAUe8t+Ga
         4JIvaIcONpZll7Cs9mgyzuBC0gx1nYoa0+7DyDHdx9A08/Z2Eck8kGWeRMwusta7wSUE
         gQp8Lu7eadzc+QeXukRocGP5qLgiBTmUvIV0mnos4s+xJ5eARz47/tyU++O//KZAlSDi
         AaBERubVzVPEUO+pB8KGaRwfgxVQjmbygy3sUYgc8n/v/pVQjeVFTXseUbYGKwyDzoQ7
         CELlVRCio7VpbZo2a+pjsS0xxY9nONf0yIg3MqxCptTZ6Qd0cs6iDtvTn/lzDUUEQU5n
         1fxA==
X-Gm-Message-State: AO0yUKUQccIKOyGSFj1oKpj6GxwtKjFb2GvyCVDtSkVMTzj4eZnbuSOr
        J+EGw5f7EEXBigj1qegpr2Xtj3/wwDVFQy/mq/fcWg==
X-Google-Smtp-Source: AK7set/ooASY46ngQZIqdqDmsT4zeskwYnW6DOXwkkf4CjVsoUvMXiJoahLD8pki2f/tnuzHRRoCMw==
X-Received: by 2002:a05:6602:2c07:b0:74e:5fba:d5df with SMTP id w7-20020a0566022c0700b0074e5fbad5dfmr445454iov.0.1678911086172;
        Wed, 15 Mar 2023 13:11:26 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id l14-20020a02cd8e000000b0038a06a14b37sm1916958jap.103.2023.03.15.13.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 13:11:25 -0700 (PDT)
Message-ID: <2e561381-29ef-e7eb-97c6-06ef2d2c9c7f@kernel.dk>
Date:   Wed, 15 Mar 2023 14:11:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCHSET 0/5] User mapped provided buffer rings
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, io-uring@vger.kernel.org,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <20230314171641.10542-1-axboe@kernel.dk>
 <0eeed691-9ea1-9516-c403-5ba22554f8e7@gmx.de>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <0eeed691-9ea1-9516-c403-5ba22554f8e7@gmx.de>
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

On 3/15/23 2:03?PM, Helge Deller wrote:
> Hi Jens,
> 
> Thanks for doing those fixes!
> 
> On 3/14/23 18:16, Jens Axboe wrote:
>> One issue that became apparent when running io_uring code on parisc is
>> that for data shared between the application and the kernel, we must
>> ensure that it's placed correctly to avoid aliasing issues that render
>> it useless.
>>
>> The first patch in this series is from Helge, and ensures that the
>> SQ/CQ rings are mapped appropriately. This makes io_uring actually work
>> there.
>>
>> Patches 2..4 are prep patches for patch 5, which adds a variant of
>> ring mapped provided buffers that have the kernel allocate the memory
>> for them and the application mmap() it. This brings these mapped
>> buffers in line with how the SQ/CQ rings are managed too.
>>
>> I'm not fully sure if this ONLY impacts archs that set SHM_COLOUR,
>> of which there is only parisc, or if SHMLBA setting archs (of which
>> there are others) are impact to any degree as well...
> 
> It would be interesting to find out. I'd assume that other arches,
> e.g. sparc, might have similiar issues.
> Have you tested your patches on other arches as well?

I don't have any sparc boxes, unfortunately.. But yes, would be
interesting to test on sparc for sure.

I do all my testing on aarch64 and x86-64, and I know that powerpc/s390
has been tested too. But in terms of coverage and regular testing, it's
just the former two.

-- 
Jens Axboe

