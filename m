Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F08F75CC2E
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Jul 2023 17:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbjGUPmN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 21 Jul 2023 11:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbjGUPmI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 21 Jul 2023 11:42:08 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE87830E4
        for <linux-parisc@vger.kernel.org>; Fri, 21 Jul 2023 08:42:05 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7748ca56133so20635239f.0
        for <linux-parisc@vger.kernel.org>; Fri, 21 Jul 2023 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1689954125; x=1690558925;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dObwGqoxfn0zimr0wdO/4SBh1zMRtbhNsBHhz0MLDzw=;
        b=2FWZE2aB6Z/FJ6s5jSl/vuG+28YUbsgZ+LEyC0uhfPi6fAKFovFHvSDiD1usgK8H/X
         ZCsvc/YxsFtJxX3fKyscqRmLJYh8j0K0QO+cikg2KkVGePk6IN1dYdTPU4aIOg0z/H6w
         F4ESfCL3Cp2bQ8KgeeAYJiTwulzoTatZ6KbRCeED1TB1jOAkdfOLa+lyYd+bqo0ETjEk
         zYJtxEM5VFMy+xJS03J0Y8sJmW2Lz6qN2m6TJkn+ZwjxGySElH3sY2NmrUTaKVm41T3R
         PnyqJtCG3dAefcjn9mo7k+OBsndBqD8oz7YDSiKZSk7Gp6/MdDsZBZAvX7dJQH4T8v3K
         VMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689954125; x=1690558925;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dObwGqoxfn0zimr0wdO/4SBh1zMRtbhNsBHhz0MLDzw=;
        b=hrDLYibas4b89yfTjvrp3ffFwXE+cM2ied1D7HDS/EbIuh4LvocqDa4w6MOLT3dOQs
         dJ/MGNId5jpe7GI/SljrSGKr2YEu3WRtaw9EGbsiJrbflYysR7e//RoOk8uLiZaUvKQz
         CoJ3GP4b08+BoKZ6YtKVADkWNPw6zJIbbtkC7XZtzDR/GE7x+fVhzaWqa5bAQ3aUAQ5a
         ZaiFe2zp4decNmICptaEMfN+j/EPcLGlYmVIdH/CHsVSUWrec6SShX/sSF9UyHHneh7M
         0CWcNwspLf2j9agLozAAIk/ul975UcGHFI8ysbOna2RYfjmtHatQRBOVeePfUbxF42aj
         qwzw==
X-Gm-Message-State: ABy/qLb4bUWyIahb7nj973sLTo9TdbGfUHx/HR9UNSrLTE14Xkuox/Yj
        DsxGmeHxx4yqT2TyvENZa+D26Q==
X-Google-Smtp-Source: APBJJlFE6xGFomolvZxfUuSweJgejGgiLIvJNnNRPuwqwAQYkSVBAXacPMELocxsefhIkVhobjLZPg==
X-Received: by 2002:a05:6602:8c9:b0:787:16ec:2699 with SMTP id h9-20020a05660208c900b0078716ec2699mr1940972ioz.2.1689954125126;
        Fri, 21 Jul 2023 08:42:05 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id g20-20020a0566380bd400b0042b0a6d899fsm1107825jad.60.2023.07.21.08.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:42:04 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
        linux-ia64@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
In-Reply-To: <20230721152432.196382-1-deller@gmx.de>
References: <20230721152432.196382-1-deller@gmx.de>
Subject: Re: [PATCH 0/2] io_uring: Fix io_uring mmap() by using
 architecture-provided get_unmapped_area()
Message-Id: <168995412429.284551.12005520905700806146.b4-ty@kernel.dk>
Date:   Fri, 21 Jul 2023 09:42:04 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


On Fri, 21 Jul 2023 17:24:30 +0200, Helge Deller wrote:
> Fix io_uring on IA64 (and x86-32?) which was broken since commit
> d808459b2e31 ("io_uring: Adjust mapping wrt architecture aliasing
> requirements").
> The fix is to switch back to the get_unmapped_area() which is provided by
> each architecture.
> 
> Patch 1 switches io_uring back to use per-arch get_unmapped_area().
> Patch 2 (for IA64) is an independend cleanup.
> 
> [...]

Applied, thanks!

[1/2] io_uring: Fix io_uring mmap() by using architecture-provided get_unmapped_area()
      commit: 32832a407a7178eec3215fad9b1a3298c14b0d69
[2/2] ia64: mmap: Consider pgoff when searching for free mapping
      commit: 07e981137f17e5275b6fa5fd0c28b0ddb4519702

Best regards,
-- 
Jens Axboe



