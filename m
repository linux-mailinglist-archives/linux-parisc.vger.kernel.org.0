Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585CF7A31A8
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Sep 2023 19:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjIPRSL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Sep 2023 13:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238374AbjIPRRs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Sep 2023 13:17:48 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987FBCEC
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 10:17:43 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68fb98745c1so2553499b3a.1
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694884663; x=1695489463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFX+4MUrtMyFfoysHq0o8ja8syqSW5ztv9bkn8/4BjU=;
        b=VZsqkRYMX/eu7fRwHhLXVVheTJovl230anJ41m0pg91UYfTMnKk503G5LCKu7mxYkh
         2hv2o5r/d2ee4YVKBEMi3aLquL4k54X8F0zm1aqAmHtoujpvNQkNf36MeMU3mwCfNW3k
         jIiC3zXZIDx/uUhjN3gINa08ihI+P3k6pyHb+un88Eo5W1u+Xbyv+WKysnCscynn59SC
         FOJ+OmnLISYMAGjDn5/VoUFs/Orw1/Ho52Jdjcb9gzDFb7GJLtlTdK5vtNvRldnqjiS3
         S63ak/9w/2bjHQz81hx6wcUXTP97yX3zVoAki6Q+shELSXOB3ShvJzHZ3YWB/eJhXyYU
         9rFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694884663; x=1695489463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFX+4MUrtMyFfoysHq0o8ja8syqSW5ztv9bkn8/4BjU=;
        b=mPOwg+tUvy8nz/oJHJfUmwfe79467cWhz/7hguS7C65usR3uoHBYLTZIAO9Y4fVF6U
         MbyNwkTroKiRxDAaz/a7GTG5bxVs/d62cwaEHkr1ka1H+7F/9fmtu7hQXs9QqOixwII4
         wy2w+hx8UxC0Ipv23h7gz+ECRfAnMKJEuWBLz1eskvE/5WVbZU1N8ZHWnGYR8jRcVmUw
         SjYhKfWwumUXLvbXiEna9miZivVJpu2+nQ1Oj39u69Irn4tRWVM9h3lmP5qPkr3CQh0I
         klPtBgLEvluLQNiJWEqhfB70FPTxNx5InDAnmjYsOC7i5ycD/Y/vh+O0Tbx1IdX0dSdP
         eBUw==
X-Gm-Message-State: AOJu0Yyzj5CIpYtFpd6sHhCCn+h99NrvOJwEX48MuVrfyO0un+u8UaVn
        o+tja5WPLu0uyMsg2LuO4m2qzZc2ZirY4DWte/Y=
X-Google-Smtp-Source: AGHT+IE5bh6dPIhfLMiadredeuTH4Cv9TmaVrpdxEzN0iemn4jCjU+l5NG1UOXpCPlfySllZWFwOuw==
X-Received: by 2002:a05:6a21:8185:b0:14c:def0:db07 with SMTP id pd5-20020a056a21818500b0014cdef0db07mr4043990pzb.34.1694884663064;
        Sat, 16 Sep 2023 10:17:43 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090301c100b001bbbbda70ccsm5477334plh.158.2023.09.16.10.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 10:17:42 -0700 (PDT)
Message-ID: <1e41b01a-2f34-5ff5-c2b2-025d061731de@linaro.org>
Date:   Sat, 16 Sep 2023 10:17:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] target/hppa: lock both words of function descriptor
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        Mikulas Patocka <mpatocka@redhat.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     qemu-devel@nongnu.org, linux-parisc@vger.kernel.org
References: <87bd9251-5d6a-11f5-9a28-78224a776742@redhat.com>
 <953ee56d-173a-aaf2-c7fc-34386f285340@gmx.de>
From:   Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <953ee56d-173a-aaf2-c7fc-34386f285340@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/16/23 09:18, Helge Deller wrote:
> On 9/16/23 15:52, Mikulas Patocka wrote:
>> The code in setup_rt_frame reads two words at haddr, but locks only one.
>> This patch fixes it to lock both.
>>
>> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>>
>> ---
>>   linux-user/hppa/signal.c |    5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> Index: qemu/linux-user/hppa/signal.c
>> ===================================================================
>> --- qemu.orig/linux-user/hppa/signal.c
>> +++ qemu/linux-user/hppa/signal.c
>> @@ -149,12 +149,11 @@ void setup_rt_frame(int sig, struct targ
>>           target_ulong *fdesc, dest;
>>
>>           haddr &= -4;
>> -        if (!lock_user_struct(VERIFY_READ, fdesc, haddr, 1)) {
>> +        if (!(fdesc = lock_user(VERIFY_READ, haddr, 2 * sizeof(target_ulong), 1)))
>>               goto give_sigsegv;
>> -        }
> 
> Patch is Ok, but I think the qemu coding style is to keep the { } braces, even
> if they are unnecessary (as in this case).

Coding style also separates the assignment from the if condition.


r~

> 
> Acked-by: Helge Deller <deller@gmx.de>
> 
>>           __get_user(dest, fdesc);
>>           __get_user(env->gr[19], fdesc + 1);
>> -        unlock_user_struct(fdesc, haddr, 1);
>> +        unlock_user(fdesc, haddr, 0);
>>           haddr = dest;
>>       }
>>       env->iaoq_f = haddr;
>>
> 

