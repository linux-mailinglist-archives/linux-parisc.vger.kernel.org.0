Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC3B078DE0B
	for <lists+linux-parisc@lfdr.de>; Wed, 30 Aug 2023 20:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344103AbjH3S5K (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 30 Aug 2023 14:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343621AbjH3QRr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 30 Aug 2023 12:17:47 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5086AAC
        for <linux-parisc@vger.kernel.org>; Wed, 30 Aug 2023 09:17:41 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-34df35f90d3so1064955ab.0
        for <linux-parisc@vger.kernel.org>; Wed, 30 Aug 2023 09:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1693412260; x=1694017060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chMaTS4jP9nNlj910DoMpK1CDXVuXlhk5uRf/dpXR8s=;
        b=GYg7LKo7vmgbMYnuZlxqYh7+thfI5VMsgSNs72dLuHRDDd8KS+fXqfwQryR2UkbqPQ
         y80FnwXsLtHhRpK6rb7HXrhXQ57oX6QK+jzxjeS2cQGtHCMmg5N3HRt3nlX48o3bhuG9
         FMm4CJl5qV/GkApQ49U3PGEBUVDrnrIr0kU863DSyPQy8FRVF02x+pLYib+06IV1n25C
         qYEVotuTjLRz/2QrLhp9ZxH7ThrI8uT4XtJ0C/kL+PNx+INioJOyuEbYci5LmiITpujH
         gVkjpyKz+gq+tWgfZJE6x5rSM3X08wliOPSEyH1CqeZZZlCRztXm1CFJmFXQhx02tNs7
         mGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693412260; x=1694017060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chMaTS4jP9nNlj910DoMpK1CDXVuXlhk5uRf/dpXR8s=;
        b=FMxXDxNb8vwV9xm3sIx9Fku3QY+veFTJKqGRLOcEusfcgZ19KIfvXv62saEVxwR6y0
         dZX5Cv+kUXeZ4z5fEKTyIXXS092SWxIvL0NktkBdr1D8lw6jLLib7wsjwdDUS1YNQFbG
         YDieW+k5Ikn7lOlRhyn1aW0bJun5LYv9bqNJGKTg0K1hox+wjugBopKAXBCrxFItE3Dv
         P0xWby8vtCS6pCq1E3PyWMsxODKn1812JaQLUVaDBXNxDfAIa5f07lBn2SFkp978BKvn
         Rw9fMzEbnyKEYMtxwLzblU9z7cm8g47ZLwDkiKWt9WoRRIgpuH2Q1Y5Jgf9g4jti5hpK
         /7Dg==
X-Gm-Message-State: AOJu0YxHoqgmUxUm8aLod3iwKKFsfm3kRHO/ftq6hH5ffEk91VVMuwFk
        u6/H/Aqh6jodFsqdh99zCJfAtg==
X-Google-Smtp-Source: AGHT+IGY7ZRzLtk4zw2exrveScz0f6yVxgadHl1s1dhK/3rSEVrQnfbl/TFFgLBwHxkbO28R6J2uTA==
X-Received: by 2002:a6b:5002:0:b0:794:cbb8:725e with SMTP id e2-20020a6b5002000000b00794cbb8725emr3076020iob.2.1693412260733;
        Wed, 30 Aug 2023 09:17:40 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id s7-20020a02cc87000000b0042b1d495aecsm3957074jap.123.2023.08.30.09.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 09:17:40 -0700 (PDT)
Message-ID: <5aa6799a-d577-4485-88e0-545f6459c74e@kernel.dk>
Date:   Wed, 30 Aug 2023 10:17:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [STABLE] stable backport request for 6.1 for io_uring
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, stable@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-parisc@vger.kernel.org
Cc:     Vidra.Jonas@seznam.cz, Sam James <sam@gentoo.org>,
        John David Anglin <dave.anglin@bell.net>
References: <ZO0X64s72JpFJnRM@p100>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZO0X64s72JpFJnRM@p100>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/28/23 3:55 PM, Helge Deller wrote:
> Hello Greg, Hello Jens, Hello stable team,
> 
> would you please accept some backports to v6.1-stable for io_uring()?
> io_uring() fails on parisc because of some missing upstream patches.
> Since 6.1 is currently used in debian and gentoo as main kernel we
> face some build errors due to the missing patches.

Fine with me.

-- 
Jens Axboe

