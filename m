Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F26AF790C1C
	for <lists+linux-parisc@lfdr.de>; Sun,  3 Sep 2023 15:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237906AbjICNZT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 3 Sep 2023 09:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbjICNZS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 3 Sep 2023 09:25:18 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FE1F5
        for <linux-parisc@vger.kernel.org>; Sun,  3 Sep 2023 06:25:15 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-51f64817809so140706a12.1
        for <linux-parisc@vger.kernel.org>; Sun, 03 Sep 2023 06:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1693747514; x=1694352314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4dQVQKk6sr2vKRoTeLwl8gx35XibpRXcXntJWK37W7E=;
        b=NLn+sLkTNG2nE2Y5MNtgQCDU+BaBPwQYcDhS6ZH8IJ10DGMmgkSLE1Q+raIyuZ2NjX
         txv9XgY/LE2kROFnYVSmuTTRI9IOdsZHgHb1aO4Mhy36l3FALSt7Dsp2J+vn1Oi0VNZZ
         AMM6HtfQ2g/kYUbonXBKH8hWjKcT3elkkUkrGx+rUleliIuArlkXzdR9+0C4ZXwXAGvi
         Bh0kz7JSynNDL00I6nNX9SHnKS4ywaNd4jPotG9Jjr+a899h7wQqxkbScjNWViNjzLAU
         XCQE9LViwxx916ObT+oZAoXsqfzVIGfDfELSAiRxs5xQlZE1R59GgMC8WVeAHuX8cXcE
         BotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693747514; x=1694352314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dQVQKk6sr2vKRoTeLwl8gx35XibpRXcXntJWK37W7E=;
        b=kAVsiFOyOVkCQ4sg/HXcQxkmv/qKfJF5X9nO2Ysl44RIvsCZhlipmUOpM2cuWuQHkl
         85JQDfyFvGELsZDjfmK5NLPjTJDc3vVjakyH464lkr5fh+2kH/9q5Dldruz/m8wzoaGX
         nwxXUjVk2WMXc9c7sjXXGLQefKxm2TR2NLttNXk+h+Amof/2sh4hPGLwvYTGWdybNpTZ
         P3FAmu0JxHrwNf+UfuIPxXnFPYqVoAUwR4Pkgfrar8RYjFF9nPMc4DkmAmJUwx42Rg/R
         LWeIlWXm79hkU7S/VDZo/M69DBATlEmqiXrOyILZ2/FGlbEHIrvCSIwgTR1Bceg+hwAu
         MNGw==
X-Gm-Message-State: AOJu0YyXNUfP7VwRm51biwRJStjoll9lPrYqRHMUWVrduv7t1VrKoPV+
        KqVuQZXUcj1KR4rIHw5VJG1ndkzMWznrmKEhR4k8Ag==
X-Google-Smtp-Source: AGHT+IEp6O7FyNgAmhZof9XvlxPwXKfYRic5cFaFo4+EESA7hDAVBzlnGkIf8OHbLx86KuboDJzQog==
X-Received: by 2002:a05:6a00:2a08:b0:68c:7089:cb8 with SMTP id ce8-20020a056a002a0800b0068c70890cb8mr8540101pfb.2.1693747514355;
        Sun, 03 Sep 2023 06:25:14 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b0068a538cc7adsm5765230pfd.52.2023.09.03.06.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 06:25:13 -0700 (PDT)
Message-ID: <64efa654-300d-421b-9fd7-817a381f4ba7@kernel.dk>
Date:   Sun, 3 Sep 2023 07:25:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [STABLE] stable backport request for 6.1 for io_uring
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>, stable@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>, linux-parisc@vger.kernel.org,
        Vidra.Jonas@seznam.cz, Sam James <sam@gentoo.org>
References: <ZO0X64s72JpFJnRM@p100>
 <5aa6799a-d577-4485-88e0-545f6459c74e@kernel.dk>
 <8f6006a7-1819-a2fb-e928-7f26ba7df6ec@bell.net>
 <d9ed50b2-dfef-4825-be42-beac7277c447@kernel.dk>
 <2023090358-anemia-trusting-fa33@gregkh>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2023090358-anemia-trusting-fa33@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/2/23 11:32 PM, Greg Kroah-Hartman wrote:
> On Sat, Sep 02, 2023 at 06:45:56PM -0600, Jens Axboe wrote:
>> On 9/2/23 5:04 PM, John David Anglin wrote:
>>> On 2023-08-30 12:17 p.m., Jens Axboe wrote:
>>>> On 8/28/23 3:55 PM, Helge Deller wrote:
>>>>> Hello Greg, Hello Jens, Hello stable team,
>>>>>
>>>>> would you please accept some backports to v6.1-stable for io_uring()?
>>>>> io_uring() fails on parisc because of some missing upstream patches.
>>>>> Since 6.1 is currently used in debian and gentoo as main kernel we
>>>>> face some build errors due to the missing patches.
>>>> Fine with me.
>>> This is probably not a problem with the backport but I see this fail in liburing tests:
>>>
>>> Running test wq-aff.t open: No such file or directory
>>> test sqpoll failed
>>> Test wq-aff.t failed with ret 1
>>> Running test xattr.t 0 sec [0]
>>> Running test statx.t 0 sec [0]
>>> Running test sq-full-cpp.t 0 sec [0]
>>> Tests failed (1): <wq-aff.t>
>>
>> That's because 6.1-stable is missing:
>>
>> commit ebdfefc09c6de7897962769bd3e63a2ff443ebf5
>> Author: Jens Axboe <axboe@kernel.dk>
>> Date:   Sun Aug 13 11:05:36 2023 -0600
>>
>>     io_uring/sqpoll: fix io-wq affinity when IORING_SETUP_SQPOLL is used
>>
>> which went in recently and hasn't been backported to stable yet.
> 
> We can add that now to the stable queues if you want, otherwise we are
> supposed to wait until -rc1.

It's fine to wait for -rc1, it's not an urgent fix by any stretch. I
just always queue up test cases when a fix is headed upstream. Hence not
unusual that a test or two will fail until the kernel side (and stable
too) catches up.

-- 
Jens Axboe

