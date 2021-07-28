Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E843D9644
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Jul 2021 21:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhG1T7q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 28 Jul 2021 15:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbhG1T7q (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Jul 2021 15:59:46 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65AEC061796
        for <linux-parisc@vger.kernel.org>; Wed, 28 Jul 2021 12:59:43 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id t14so5313559oiw.0
        for <linux-parisc@vger.kernel.org>; Wed, 28 Jul 2021 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V7tascY0zmK6SjDjUbPmzAhZw2O0kxWfALnB7KaYVDw=;
        b=x1PbINT2LA8ujUSzo+vCRr5s+0JZmw7NFBFrQYgGx/C4kpgs2YeX7IsEYz/FcY1rL0
         ImEFKIDk3JagkWbG/Vtzb7zzV8rwCHYzTdib44faAi3enJ8EuACO3en9Jpo1syIZlYyl
         rSSCPvZY2nlPK5qKzi/y6Zyo6hXSV4ZV2sWg1DQ36svbQIxkuFpzurMDXfbC8GaZ1TcM
         /tSxF9uRX14bbRGgf5reR1EuaMDATMzCD2xk9P1gWInjEkYvc+YCaoJJaCu985EjBsKR
         sT/IIQYJUvLO0EDSOwx5hFe6qJWseidOzWDoTOmAWs06xO4+fMqJUl+5SiV9Pt5YxmMC
         tS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V7tascY0zmK6SjDjUbPmzAhZw2O0kxWfALnB7KaYVDw=;
        b=SOq1TxfY1lA8n4ze8ZKHm4rS8+hpeomSBHPU7zgAgBz3i8Cy2h4v1e63F53jhXPhya
         PRDY741x3yuXY/ph7JXjjRA1yvutkRRR+QdWalJy64m83aGaZGDqCmPWzkkUhikn98Qq
         Ce9br8kZMmyek1gvyNGylfVu5ecr4jQU+tcfKSlu0+ciZi5rdoGIS1Tvtr73TrjK0EQg
         6HmsEmixJN7jfdiq68lzI0dFJjhLdcr4JssGTWX8EnJSGtlJFZTjO8jz8UHd5GhS2q8A
         ZukIASf+cHQXQRbrTUeHxKINY3NSf47lOiFeLfIa1A68tbfCF8b3DoJpupXMb8FYS6FR
         TFFA==
X-Gm-Message-State: AOAM531vKpe1sUN6J+XVBGVzEFqh1e7953wOJXyliAhRj/h592OZNXrc
        Z0NyIZQa06xGyYKw2pP91Rk38w==
X-Google-Smtp-Source: ABdhPJyplh3DLaKY33JdHi5ZA/1Zz4gKIUC/ZHaC/vCpjWr2Bk0IU/obgcKjx2u5SMeB4jcc5cywyw==
X-Received: by 2002:aca:5802:: with SMTP id m2mr7738994oib.23.1627502383125;
        Wed, 28 Jul 2021 12:59:43 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id d20sm174553otq.67.2021.07.28.12.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 12:59:42 -0700 (PDT)
Subject: Re: [PATCH] arch: Kconfig: clean up obsolete use of HAVE_IDE
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        uclinux-h8-devel@lists.sourceforge.jp, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <3c09d6d8-7f83-4f6f-d496-20f5b1b4a7d8@kernel.dk>
Date:   Wed, 28 Jul 2021 13:59:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 7/28/21 12:21 PM, Lukas Bulwahn wrote:
> The arch-specific Kconfig files use HAVE_IDE to indicate if IDE is
> supported.
> 
> As IDE support and the HAVE_IDE config vanishes with commit b7fb14d3ac63
> ("ide: remove the legacy ide driver"), there is no need to mention
> HAVE_IDE in all those arch-specific Kconfig files.
> 
> The issue was identified with ./scripts/checkkconfigsymbols.py.

Thanks, let's queue this for 5.14 to avoid any future conflicts with
it.

-- 
Jens Axboe

