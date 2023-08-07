Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F9C772DE4
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Aug 2023 20:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjHGSd3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 7 Aug 2023 14:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjHGSd3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 7 Aug 2023 14:33:29 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C978171A
        for <linux-parisc@vger.kernel.org>; Mon,  7 Aug 2023 11:33:24 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686f74a8992so702882b3a.1
        for <linux-parisc@vger.kernel.org>; Mon, 07 Aug 2023 11:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1691433204; x=1692038004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGkjcKA/jaOcFZWETwKFlKnFXvZArBUGjrq9i4l1N0U=;
        b=eu8gj7NgXpGmJYbMHd4oAgnUNWhLwpqyDhMEOKfP6kFOADsCaMWmFeUheVyGtImGJ+
         NCCNw/flrvEPD9wFID707b/GoqsAF5efKCyujuYoOX+PxjzMPMw0LDxjH4pZ1lzZMLs/
         cSt+jhiyEDEVQJ9ESI5R3tYJbeJqxatMIkpKIGTddF6r7RxV7teTi4IElBJf/D1K15JD
         uYZeTZSZlMrXTolgEc9mz/7h6UBgcPclLt+MzbzooSxxxLh2UtkJDdIe1ulUhMhRlBtk
         I39WnyvPpM4bio0wub/tNgFnyaJ2CALeAsJ8RZrbjm+6+kKXPFGiZbcjqOZ45dG/ofOZ
         cF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691433204; x=1692038004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGkjcKA/jaOcFZWETwKFlKnFXvZArBUGjrq9i4l1N0U=;
        b=QMZFlsCjmAv3siQTlBvUyBWLXjpWp26+5dvZXfXGjfwL9BsBSj3bElKFC02ZlVf1eg
         jKyOCFFbqBJ9q7zeyUN0XczRim3d0KimXycZXh5lwuHhyXIbphkhskg5Qlx7L6alyujl
         murqgZl/u/3d8FnJVE+LQ89MBpta1UA9ubkErIjObDv1SPmJskqjDOaK8xRfHL0f7amX
         LoIcTU4oR+kBa6zoSg9Zs1Yw7mRI6YwLPqdETpEvSppF/wNGXRbpeiboDry74qtOZcYb
         YCzPgp7djE+1ZRLMMOpK11P9slOYAg18H7L/3lSAJ6K/A01GmpJART1Kr2sf0PxomG1b
         mG2A==
X-Gm-Message-State: ABy/qLZMLPEtZsIBluyu77cN3Cb98LwqnxfgTwAjVkNE6n55/bHMDPx+
        R/Eu/VoVL6rP4k2Ill+Ha48aJKeiE7VgxphY7qM=
X-Google-Smtp-Source: APBJJlEYL/whpgikEPmMByY0tY4WLjaQW4hyn4ryLc/203BHvvkIZswyd2W8wlo6OafMT5WA2lZiJQ==
X-Received: by 2002:a05:6a20:3d1e:b0:137:514a:982d with SMTP id y30-20020a056a203d1e00b00137514a982dmr35248515pzi.6.1691433204023;
        Mon, 07 Aug 2023 11:33:24 -0700 (PDT)
Received: from [172.16.7.55] ([4.14.191.206])
        by smtp.gmail.com with ESMTPSA id q2-20020a638c42000000b0055c02b8688asm5178767pgn.20.2023.08.07.11.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 11:33:23 -0700 (PDT)
Message-ID: <f5cc80b6-566d-816f-7fd9-099c58cca3d0@kernel.dk>
Date:   Mon, 7 Aug 2023 12:33:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] io_uring/parisc: Adjust pgoff in io_uring mmap() for
 parisc
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-parisc@vger.kernel.org, io-uring@vger.kernel.org
Cc:     Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
References: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
 <ZMooZAKcm8OtKIfx@kernel.org> <1691003952@msgid.manchmal.in-ulm.de>
 <1691349294@msgid.manchmal.in-ulm.de>
 <f361955c-bcea-a424-b3d5-927910ab5f1d@gmx.de>
 <b9a15934-ea29-ef54-a272-671859d2bc02@gmx.de> <ZNEyGV0jyI8kOOfz@p100>
 <c4c3ae81-33aa-26ba-3a24-33918e0446e4@kernel.dk>
 <ac18c4d4-7ca2-4648-77d2-3053c1de93f7@gmx.de>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ac18c4d4-7ca2-4648-77d2-3053c1de93f7@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/7/23 12:27?PM, Helge Deller wrote:
> On 8/7/23 20:24, Jens Axboe wrote:
>> On 8/7/23 12:04?PM, Helge Deller wrote:
>>> The changes from commit 32832a407a71 ("io_uring: Fix io_uring mmap() by
>>> using architecture-provided get_unmapped_area()") to the parisc
>>> implementation of get_unmapped_area() broke glibc's locale-gen
>>> executable when running on parisc.
>>>
>>> This patch reverts those architecture-specific changes, and instead
>>> adjusts in io_uring_mmu_get_unmapped_area() the pgoff offset which is
>>> then given to parisc's get_unmapped_area() function.  This is much
>>> cleaner than the previous approach, and we still will get a coherent
>>> addresss.
>>>
>>> This patch has no effect on other architectures (SHM_COLOUR is only
>>> defined on parisc), and the liburing testcase stil passes on parisc.
>>
>> What branch is this against? It doesn't apply to my 6.5 io_uring branch,
>> which is odd as that's where the previous commits went through.
> 
> applies for me on git head / Linux 6.5-rc5

Hmm, maybe something unrelated then. I'll take a look. The patch is
garbled fwiw, but that's nothing new. If you download the raw one from
lore you can see how.

-- 
Jens Axboe

