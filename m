Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FB8693783
	for <lists+linux-parisc@lfdr.de>; Sun, 12 Feb 2023 14:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjBLNQh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 Feb 2023 08:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjBLNQh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 Feb 2023 08:16:37 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FD8CC11
        for <linux-parisc@vger.kernel.org>; Sun, 12 Feb 2023 05:16:35 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id r17so6301421pff.9
        for <linux-parisc@vger.kernel.org>; Sun, 12 Feb 2023 05:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L77tl+HH7o1xr2PUiU5w6W+jdQ9g1lVA8pUPfjnRGjo=;
        b=nV5TpDYMCXUUgi7kpOlcYmN2bpAcTDuQLfJf2/dJh2p7GhXJAjCkOtWcB7h1/RouS4
         mI1BkWnp2ISM9CvsgwDn/Al2OUet+9fscVn75I8Mv+TTou2jn7gGLHsOykFsbKJFT1O3
         m5W7LmHyclMy1ZU2KUFjOpTwIgspbl+N00qLsKrHXxTXQPYSwGBR8UtL8VXPcyLTHWSb
         KYvLoAdk8ziFJgCpz7+FdNPPYY7arJLMA5RYpXE9Vk2FaLxxNy1aUlzfGT9lcTdrZ8Iq
         44+2vMTm9vh4uTusbZcFo8jCd3DNT4n6IwmNVRh46NsoyEpjt/VkjHZdPYJZKTTZUzqB
         T3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L77tl+HH7o1xr2PUiU5w6W+jdQ9g1lVA8pUPfjnRGjo=;
        b=yd9o4pkCrX1PNBynzjmGEk+25hYUff8jCh0RqmcIgvO7qUbvTpqNjjg5yU+DFfa0Hq
         MlFbL5IwYrdKwE6MLkh+mpB786oOa6wTjcDdTJQK7D8kg4jiCWYggUxLrLPU4yCDdPJC
         C+/OJzYZexRu7atLADRVj+IH5ksQm7iiM7MK9knmtAgR2KmeTVP01t/iRhhQtUM/3Y3h
         JQwOaeD6xFnl2dNnli5u33Vb/FvWdNrW6fTnevspAZjbSTDKxc9DUarFOHv6sU/vNDWS
         iWCBZC+EaV3+9wI0HjbUO/LU5+/ZMjy9S5+fnpQx1/pe/aUieCj+xw/gIzfQ8wN50Fg/
         PFig==
X-Gm-Message-State: AO0yUKWp893D+c2qs+qB+yL4HWPls9VgbsFYJGommszTSe0yIvazqzoW
        1zaj6TG/ge2SylhSArAd4pYRrQ==
X-Google-Smtp-Source: AK7set9ZIMssxVCY1liO7KOunwxx3h4fKTMmcJs/R/sq1qJOF3ducrinktGFuREYgsOBPx7DcQ5ORA==
X-Received: by 2002:a62:cdc3:0:b0:5a8:5f10:225b with SMTP id o186-20020a62cdc3000000b005a85f10225bmr8804990pfg.1.1676207795068;
        Sun, 12 Feb 2023 05:16:35 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id p6-20020aa78606000000b005828071bf7asm6207942pfn.22.2023.02.12.05.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 05:16:34 -0800 (PST)
Message-ID: <159bfaee-cba0-7fba-2116-2af1a529603c@kernel.dk>
Date:   Sun, 12 Feb 2023 06:16:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: io_uring failure on parisc (32-bit userspace and 64-bit kernel)
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, io-uring@vger.kernel.org
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <216beccc-8ce7-82a2-80ba-1befa7b3bc91@gmx.de>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <216beccc-8ce7-82a2-80ba-1befa7b3bc91@gmx.de>
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

On 2/12/23 2:47?AM, Helge Deller wrote:
> Hi all,
> 
> We see io-uring failures on the parisc architecture with this testcase:
> https://github.com/axboe/liburing/blob/master/examples/io_uring-test.c
> 
> parisc is always big-endian 32-bit userspace, with either 32- or 64-bit kernel.
> 
> On a 64-bit kernel (6.1.11):
> deller@parisc:~$ ./io_uring-test test.file
> ret=0, wanted 4096
> Submitted=4, completed=1, bytes=0
> -> failure
> 
> strace shows:
> io_uring_setup(4, {flags=0, sq_thread_cpu=0, sq_thread_idle=0, sq_entries=4, cq_entries=8, features=IORING_FEAT_SINGLE_MMAP|IORING_FEAT_NODROP|IORING_FEAT_SUBMIT_STABLE|IORING_FEAT_RW_CUR_POS|IORING_FEAT_CUR_PERSONALITY|IORING_FEAT_FAST_POLL|IORING_FEAT_POLL_32BITS|0x1f80, sq_off={head=0, tail=16, ring_mask=64, ring_entries=72, flags=84, dropped=80, array=224}, cq_off={head=32, tail=48, ring_mask=68, ring_entries=76, overflow=92, cqes=96, flags=0x58 /* IORING_CQ_??? */}}) = 3
> mmap2(NULL, 240, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_POPULATE, 3, 0) = 0xf7522000
> mmap2(NULL, 256, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_POPULATE, 3, 0x10000000) = 0xf6922000
> openat(AT_FDCWD, "libell0-dbgsym_0.56-2_hppa.deb", O_RDONLY|O_DIRECT) = 4
> statx(4, "", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT|AT_EMPTY_PATH, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=0, stx_mode=S_IFREG|0644, stx_size=689308, ...}) = 0
> getrandom("\x5c\xcf\x38\x2d", 4, GRND_NONBLOCK) = 4
> brk(NULL)                               = 0x4ae000
> brk(0x4cf000)                           = 0x4cf000
> io_uring_enter(3, 4, 0, 0, NULL, 8)     = 0
> 
> 
> Running the same testcase on a 32-bit kernel (6.1.11) works:
> root@debian:~# ./io_uring-test test.file
> Submitted=4, completed=4, bytes=16384
> -> ok.
> 
> strace:
> io_uring_setup(4, {flags=0, sq_thread_cpu=0, sq_thread_idle=0, sq_entries=4, cq_entries=8, features=IORING_FEAT_SINGLE_MMAP|IORING_FEAT_NODROP|IORING_FEAT_SUBMIT_STABLE|IORING_FEAT_RW_CUR_POS|IORING_FEAT_CUR_PERSONALITY|IORING_FEAT_FAST_POLL|IORING_FEAT_POLL_32BITS|0x1f80, sq_off={head=0, tail=16, ring_mask=64, ring_entries=72, flags=84, dropped=80, array=224}, cq_off={head=32, tail=48, ring_mask=68, ring_entries=76, overflow=92, cqes=96, flags=0x58 /* IORING_CQ_??? */}}) = 3
> mmap2(NULL, 240, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_POPULATE, 3, 0) = 0xf6d4c000
> mmap2(NULL, 256, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_POPULATE, 3, 0x10000000) = 0xf694c000
> openat(AT_FDCWD, "trace.dat", O_RDONLY|O_DIRECT) = 4
> statx(4, "", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT|AT_EMPTY_PATH, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=0, stx_mode=S_IFREG|0644, stx_size=1855488, ...}) = 0
> getrandom("\xb2\x3f\x0c\x65", 4, GRND_NONBLOCK) = 4
> brk(NULL)                               = 0x15000
> brk(0x36000)                            = 0x36000
> io_uring_enter(3, 4, 0, 0, NULL, 8)     = 4
> 
> I'm happy to test any patch if someone has an idea....

No idea what this could be, to be honest. I tried your qemu vm image,
and it does boot, but it's missing keys to be able to update apt and
install packages... After fiddling with this for 30 min I gave up, any
chance you can update the sid image? Given how slow this thing is
running, it'd take me all day to do a fresh install and I have to admit
I'm not THAT motivated about parisc to do that :)

-- 
Jens Axboe

