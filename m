Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0DF75CC27
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Jul 2023 17:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbjGUPmE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 21 Jul 2023 11:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjGUPmD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 21 Jul 2023 11:42:03 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4D72D47
        for <linux-parisc@vger.kernel.org>; Fri, 21 Jul 2023 08:42:02 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-785ccd731a7so25545039f.0
        for <linux-parisc@vger.kernel.org>; Fri, 21 Jul 2023 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1689954121; x=1690558921;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmE20XygINkFooGZCRYhmyeP1CJB0Q7rBQUncn12dzc=;
        b=fntMBIkkna4sH2FFnDW4WcmTJp0xd4jcYTxYtA+hatoUhkv0/crYIowIEji/QPa+Oj
         uAR0cBvS2EuK4QGQfPfsl7kQ0WokezMaJ3QCrdgXv1bzKwLR2K0GmX5ZSOi+Kjm6iolI
         mCfBoAp4FnldGun4T0ANsv3Xyk25+T0+o6RbW8Pin9MRLGL7fpNybD14RaDooOfHoRrN
         r+uPv9X6JxZhFxfg+l7lecWStktExVTX0fQsm92+qKfyxNY05POR5E/hJkctRixB/4Ix
         dTfetZ3g7Mh1K4jlqLozckMPskQBv+ZNKQdRFfjuW/uAsircCIJT9r0TsXCA9Nl+3gUd
         sPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689954121; x=1690558921;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmE20XygINkFooGZCRYhmyeP1CJB0Q7rBQUncn12dzc=;
        b=apOfPqyghxdM+5QHMkU1gn0aO6+RGzrj1IzQQZlft85rc53aMvJKe/6BEfod1EpAiU
         1Va+xKHP2Jkc4L/uivPtqncc6X7hMnXWtxQal63/3J9hxnWmkANUVp6um2zw0xG9Peem
         Gul6263XIvvTukyYe9LlLP6Aj2Qcmg8xMn/bChpBwf5BTCCQ8xm2J0jxmgKPL+k3JXZc
         tz8re38SKZ8QcUjyNMD4hOXaGDFxLWB6M51tnzDoROhgNG3qAboIzC8Q05XgaMff3WXO
         ShekZ8e/MsLzpbQsLWb4KUwWUrMwbSlIjfDS97DCGE+RQ0Z0C42QGHp3W0ZSgalaMBbP
         652w==
X-Gm-Message-State: ABy/qLZyMKcLSg3lcan6sCmlVs7iJQNQgzq2xsBLvZSqUskly3GmEmyN
        Ve0miK4gMjtTvN+HiwEwZxVADA==
X-Google-Smtp-Source: APBJJlE0rgR3hwgj21uTskJVG1R/lx3ngz4QGmAVE9MTa3kec+I1yAq7k9dYV/hZTYol+qztlb0sYw==
X-Received: by 2002:a92:d44c:0:b0:345:a3d0:f0d4 with SMTP id r12-20020a92d44c000000b00345a3d0f0d4mr2183115ilm.3.1689954121634;
        Fri, 21 Jul 2023 08:42:01 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id q11-20020a056e02078b00b0032afe23820bsm1029860ils.17.2023.07.21.08.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 08:42:01 -0700 (PDT)
Message-ID: <1ad6ebe8-2f6b-6765-ccbf-4e931bc34351@kernel.dk>
Date:   Fri, 21 Jul 2023 09:42:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] io_uring: Fix io_uring mmap() by using
 architecture-provided get_unmapped_area()
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        io-uring@vger.kernel.org, linux-ia64@vger.kernel.org,
        Jiri Slaby <jirislaby@kernel.org>, linux-parisc@vger.kernel.org
References: <20230721152432.196382-1-deller@gmx.de>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230721152432.196382-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 7/21/23 9:24?AM, Helge Deller wrote:
> Fix io_uring on IA64 (and x86-32?) which was broken since commit
> d808459b2e31 ("io_uring: Adjust mapping wrt architecture aliasing
> requirements").
> The fix is to switch back to the get_unmapped_area() which is provided by
> each architecture.
> 
> Patch 1 switches io_uring back to use per-arch get_unmapped_area().
> Patch 2 (for IA64) is an independend cleanup.

Let's get this queued up - I marked it for stable as well, for 6.4.
Thanks for taking care of this!

-- 
Jens Axboe

