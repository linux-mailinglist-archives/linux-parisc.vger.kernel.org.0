Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF9D69846F
	for <lists+linux-parisc@lfdr.de>; Wed, 15 Feb 2023 20:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjBOTY3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Feb 2023 14:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBOTY2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Feb 2023 14:24:28 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45E63B65C
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 11:24:27 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id g14so1243383ild.8
        for <linux-parisc@vger.kernel.org>; Wed, 15 Feb 2023 11:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1676489067;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V737+82UztDqRXOsZgjCAejGa80LjL4mvCIlvHGcjzU=;
        b=UMTwGsKFHs34tW1mqclfsE3xAjQJ0TRw/+iKLyN20+T6xoFhTmpiMANJud7Z1J+b8f
         zw9TgyJtX5hHPuv529mQ+WHmauijSL5JCPj6oeDWYH6MJtMEr5h0sXzPA2X5GzQ+u4Wn
         cCr4Wpvuv8Hob+mC3qCKAGaqTc5jfEsohyMvX1BTC94RDn0rYIeaqfc02zVpHMEqTBp4
         sQh5ZZoxbHlmLkcpFELmkU+mQLI+cqiET/23FSkaeH2CNDpT0L9T8YoNUvkyG5Pv6r70
         VjaOWazfsPDn6N6t4Xu/eVngFmQvs3juoWILHHbPN9hTLTsZ+fA2jlZFA3QKNSdJKXIA
         FxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676489067;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V737+82UztDqRXOsZgjCAejGa80LjL4mvCIlvHGcjzU=;
        b=wbqXp6gm2ylRDFOOzn7o6fibOTpFT/8BxcmtTNc3TsvBsOALpjfUdCk/gSvy9a1lWs
         +qZvvUzNxgine7Z09wIvocddPv/bEpHTPkavv6OG8vRoUAukiBzoVwXNjQ9xTkqbEKKB
         xHAlYiyZy1Z9w/yWRmNRMqxcX04V94AUS/uXL49aqknnUesQK0i6M9Ln42jcEAmxO6Cs
         Y+YpRk4kPVZhq50gW6k2lBDiVl0XepaKiY82Vz/zfkw+vzNuxrKDbhAnQ61le1jlyyeI
         e4cvBUGzO/aQxJAox03vlHUYp4X4s3gatuGsg1aNYuJNqD/OAbUZcwZzYWRvLmi+73rF
         8ANQ==
X-Gm-Message-State: AO0yUKV6rhIV4xLQJMLp4h7JQJqMXAQaYU04/ty56NtYzjPbhEihxJ1Z
        /MDZ3Q7KdLclQ8572T9Hhm8lBA==
X-Google-Smtp-Source: AK7set/CEiA+tFuczFeVKVatV5b4tcu51VfHTUTgxNRqR30VX4GIhvWqQ4OimcqF2aZm49BF4lI5TQ==
X-Received: by 2002:a05:6e02:1a64:b0:314:9f2b:f63b with SMTP id w4-20020a056e021a6400b003149f2bf63bmr3070529ilv.2.1676489067067;
        Wed, 15 Feb 2023 11:24:27 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id f10-20020a056e0212aa00b003156ff79e2dsm751623ilr.64.2023.02.15.11.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 11:24:26 -0800 (PST)
Message-ID: <5a4975df-32ea-910a-3018-ecb13d5d1b45@kernel.dk>
Date:   Wed, 15 Feb 2023 12:24:25 -0700
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
 <f6bbfb33-67f6-6059-6111-b9e02fa30e0a@bell.net>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <f6bbfb33-67f6-6059-6111-b9e02fa30e0a@bell.net>
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

On 2/15/23 12:20 PM, John David Anglin wrote:
> On 2023-02-15 2:00 p.m., Jens Axboe wrote:
>> accept.t: setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val));
>> fails here, no idea why.
> The socket call fails, so fd is -1.

Yeah, see followup. I dug further into it, and it looks like a bug in
the test in that it uses O_NONBLOCK rather than SOCK_NONBLOCK. Most
other platforms have those the same, but not parisc. I fixed up the
test and now accept works fine:

root@debian:~/liburing# test/accept.t
root@debian:~/liburing# echo $?
0

-- 
Jens Axboe


