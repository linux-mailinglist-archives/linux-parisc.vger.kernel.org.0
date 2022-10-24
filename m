Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4067460B3AE
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Oct 2022 19:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiJXROZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Oct 2022 13:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbiJXRNt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Oct 2022 13:13:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F42EE8C73
        for <linux-parisc@vger.kernel.org>; Mon, 24 Oct 2022 08:48:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ECD7B61376
        for <linux-parisc@vger.kernel.org>; Mon, 24 Oct 2022 15:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A15C433C1
        for <linux-parisc@vger.kernel.org>; Mon, 24 Oct 2022 15:22:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GlFxcd8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1666624938;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gXx+9YYemeAh5LdME95QZUM1MrqPaAMLTQt9/XldCZo=;
        b=GlFxcd8ZDd/tEOjWix+4id8BruCambg5LH2pJycYWKk43WvFQJJKMBF42bgOdHvBDVj8Rj
        wm/j95KkwWsanjt+7UaPRwCYKL0IJqW0KopfgVplfTkzht+zkcgrJJy/temSvxtsNxyIT3
        1AnED9aMTOfuKHHWh5XsdwozMgsFM6o=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db704cf0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-parisc@vger.kernel.org>;
        Mon, 24 Oct 2022 15:22:18 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id m18so1720972vka.10
        for <linux-parisc@vger.kernel.org>; Mon, 24 Oct 2022 08:22:18 -0700 (PDT)
X-Gm-Message-State: ACrzQf3oaAK2mhQ+mpZZFUnaw3qqAY4zDvw/DHb2b9a/037vGjBkfkPN
        YURSF1IZyAuEnmXqqSpXHrmYw1bbRSTV5fWyDzg=
X-Google-Smtp-Source: AMsMyM47oDQmTchV4mOTl5rz6QPVkhZZd/sRXXiNwlpLyPO1v1v1Hvmn4oPuQWi3JnFrdNdlySADyc6HIxN3ZaXJmV4=
X-Received: by 2002:a05:6122:317:b0:3b7:6590:daa1 with SMTP id
 c23-20020a056122031700b003b76590daa1mr2228709vko.37.1666624937266; Mon, 24
 Oct 2022 08:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221021072038.83248-1-deller@gmx.de>
In-Reply-To: <20221021072038.83248-1-deller@gmx.de>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 24 Oct 2022 17:22:03 +0200
X-Gmail-Original-Message-ID: <CAHmME9o_Xw7zS5WQF0FVV2W4rfX6ir7MHsab2RTE3bJ7Lp1WUQ@mail.gmail.com>
Message-ID: <CAHmME9o_Xw7zS5WQF0FVV2W4rfX6ir7MHsab2RTE3bJ7Lp1WUQ@mail.gmail.com>
Subject: Re: [PATCH] parisc: Use signed char for hardware path in pdc.h
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

I assume this takes care of the cases that Dan found in:

https://lore.kernel.org/lkml/Y1ZZyP4ZRBIbv+Kg@kili/ ?

By the way, I would queue this up in my unsigned-char tree -- Linus
asked me to keep the fixes for the fallout together -- but your patch
clearly applies over in-development parisc code, so it makes sense to
keep it with the parisc code, and I'll make note of this one.

Applied here, right?
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=50f19697dd768d8b072cf7f12c0c99c7d31b67d8

Jason
