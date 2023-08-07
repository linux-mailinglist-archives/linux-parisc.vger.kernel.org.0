Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5AB772DEA
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Aug 2023 20:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjHGSer (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 7 Aug 2023 14:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjHGSer (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 7 Aug 2023 14:34:47 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D39B1722
        for <linux-parisc@vger.kernel.org>; Mon,  7 Aug 2023 11:34:46 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6874a386ec7so902038b3a.1
        for <linux-parisc@vger.kernel.org>; Mon, 07 Aug 2023 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1691433285; x=1692038085;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OECn+am/LewRayTS88fBEgRVYxDCKffgScy8WxICR0w=;
        b=ue3v5PBcMa/B4CFh+dHduMx1Gi9OD0vHTz7eoUnuPvrlS2rP4yDBU6H3we/+sUUpWY
         QAR2o22f/eWLwQt5RNM+HvJIITn/UmLMBP9PxGbrP3IvSI7AIsJPLlXZmSo7YybF/ZsF
         Vpw2rTplXRL4kVL90ikN0SZpCuDLUCwkPsT7tArf+KujAWQg4RgRlb7aVg2Lz9YihN4E
         P2UUOHkyjjNqVPXHoAXcGcMkUfNhbY9wnGdCmcfbnvkcU/UrJFh36xpQiLoXf7j4vJvC
         6WIaSi5apzltQeRji6/+qfKE5B2NX90EOclrb0mpc+Ykb0aVdqjCi/QxbT+LC+Ibk8EM
         XBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691433285; x=1692038085;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OECn+am/LewRayTS88fBEgRVYxDCKffgScy8WxICR0w=;
        b=NNrHQ54Z4TkgY67xwiM5lUSt4p2wRYVq2AlC+axXY0ZXcNxFkLVc6P7cfd1gw0X5Et
         grJS1NCxxWURA7Ed0VZItKSb+cdXCpjtK+TVYaX7a1PpTXzV3GnHEH927pqmp4Ulgcqh
         E6cQzdtYts4DpGICdzKt3gV2aQQpUVOSzPjVsYN4GNMXJ0VkZczD7jxCEcqd6p8vV64/
         xH46ML4LpVkeYHMXkPovDMPEWuckLeaJ4Nr2M5kNIH3tWzACjK7F3TOfiW4zXjgW23En
         Lv6OTKORUdx20yVmKJ6f1dVfZjttXNqxo149QKwO2TgOwjtidaGPT3kByXzYUMrUJ+P0
         htWw==
X-Gm-Message-State: ABy/qLbw32ryaG310nyYUqVcI8CwE3baHYATK3OpvvAKwxA+Q4/rnilC
        Nm4EtIuEQSbtuKmahSK7CINpaxhpHqumZ9SBD5A=
X-Google-Smtp-Source: APBJJlEzsMvpuL1eJZRumUutR3OzsveAPgXXGognoiy+piCkKK/IK94O6EXlkrPgK20kw6yRt7LEXg==
X-Received: by 2002:a05:6a20:3c8c:b0:13f:65ca:52a2 with SMTP id b12-20020a056a203c8c00b0013f65ca52a2mr18262758pzj.5.1691433285339;
        Mon, 07 Aug 2023 11:34:45 -0700 (PDT)
Received: from [127.0.0.1] ([12.221.160.50])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm6501756pfe.185.2023.08.07.11.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 11:34:44 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-parisc@vger.kernel.org, io-uring@vger.kernel.org,
        Helge Deller <deller@gmx.de>
Cc:     Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <ZNEyGV0jyI8kOOfz@p100>
References: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
 <ZMooZAKcm8OtKIfx@kernel.org> <1691003952@msgid.manchmal.in-ulm.de>
 <1691349294@msgid.manchmal.in-ulm.de>
 <f361955c-bcea-a424-b3d5-927910ab5f1d@gmx.de>
 <b9a15934-ea29-ef54-a272-671859d2bc02@gmx.de> <ZNEyGV0jyI8kOOfz@p100>
Subject: Re: [PATCH] io_uring/parisc: Adjust pgoff in io_uring mmap() for
 parisc
Message-Id: <169143328422.48417.10714588491936026372.b4-ty@kernel.dk>
Date:   Mon, 07 Aug 2023 12:34:44 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


On Mon, 07 Aug 2023 20:04:09 +0200, Helge Deller wrote:
> The changes from commit 32832a407a71 ("io_uring: Fix io_uring mmap() by
> using architecture-provided get_unmapped_area()") to the parisc
> implementation of get_unmapped_area() broke glibc's locale-gen
> executable when running on parisc.
> 
> This patch reverts those architecture-specific changes, and instead
> adjusts in io_uring_mmu_get_unmapped_area() the pgoff offset which is
> then given to parisc's get_unmapped_area() function.  This is much
> cleaner than the previous approach, and we still will get a coherent
> addresss.
> 
> [...]

Applied, thanks!

[1/1] io_uring/parisc: Adjust pgoff in io_uring mmap() for parisc
      commit: ce11a0688e67aae1e9ba6c8843d7e8b7dd791ead

Best regards,
-- 
Jens Axboe



