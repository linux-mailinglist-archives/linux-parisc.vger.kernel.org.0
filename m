Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7DE691325
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Aug 2019 23:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfHQVWR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Aug 2019 17:22:17 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:47023 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfHQVWQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Aug 2019 17:22:16 -0400
Received: by mail-io1-f66.google.com with SMTP id x4so13206922iog.13
        for <linux-parisc@vger.kernel.org>; Sat, 17 Aug 2019 14:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=TIwIXh9oi1rBMxLrZ6m/eqcO3acs/QprBotrm1MYtgU=;
        b=CJVuNDGu30vfZIQhNtyqH+dgEouyhowB/pqTopdU55GkSITlHL0uKSvYQI8xfwB4KF
         b/uCqqA3AXKBIdWSBL/bm8atFw/BTbw6zCCCzTTokg/rSqwXa1cCfQMW6iusHpscU8Il
         0ZqX+tec6msmO1pwyfGqBVymy0nWOHfws7CGDoh79Fg0fctZqQK8Mql9QboplE1l26jI
         c7lYq5mvTGfbdlGkY9/A+2cUa+UcDH5vprCBHPJps3g09zIR/90rJ1p5sEuvA/RhvAOH
         Ua8oYgLyyo0AHKEUE5W/NGenZReiOCrCvLJt/QdP2CD/U0d1u2yrDe5h1Bhkwwdzihi3
         +qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=TIwIXh9oi1rBMxLrZ6m/eqcO3acs/QprBotrm1MYtgU=;
        b=Uu6MKIZTk/jjvpZjxR8Hxl8v2iOh/rscNB9ClxoGWWPuC5rFb6pxGSpUazKiCOl2vg
         ozwtIFjX/PG6aP0yJUl/xolNqY002FGzlTSQoFjxrADI6SyZcTADR54Q5Zc557zfYz/g
         S1mLf1I4gb6oy1uxVjZYm1gmFJDq5el2FCLt5ZoqHN1XpgP4rPI5aSKoCALn3k2rAKGy
         G1NqntD4C3hBDmM5LiHfmEPmbnardUxmCQzhTfpIo2lBa7KncdWuwjJyDlS+R+/Fr0Jn
         Rm/gvDlPxgvxdP5BH7kV61PM2sh3GmAMREnzNuGDpFbGK/jtWUD7qytrAYtqHtieFJ3n
         WeBg==
X-Gm-Message-State: APjAAAWyP32HSXn/zgMze4eL7j633LlO+ju0Xh8OEbmQv19r/vtwTbPj
        fgheLTRXKCCfhX2h0ewaIyqnSQ==
X-Google-Smtp-Source: APXvYqyWkWAJ5sPsUpqbWAy71qmGXtDWPCrfasxRd8m0NdlFhlF6iU5nZ24EPromxMFk1aH65Eky+w==
X-Received: by 2002:a5d:8e16:: with SMTP id e22mr18276290iod.171.1566076936091;
        Sat, 17 Aug 2019 14:22:16 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id j25sm13091311ioj.67.2019.08.17.14.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 14:22:15 -0700 (PDT)
Date:   Sat, 17 Aug 2019 14:22:15 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Christoph Hellwig <hch@lst.de>
cc:     Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
        linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 24/26] riscv: use the generic ioremap code
In-Reply-To: <20190817073253.27819-25-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171421560.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de> <20190817073253.27819-25-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> Use the generic ioremap code instead of providing a local version.
> Note that this relies on the asm-generic no-op definition of
> pgprot_noncached.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/io.h      |  3 --
>  arch/riscv/include/asm/pgtable.h |  6 +++
>  arch/riscv/mm/Makefile           |  1 -
>  arch/riscv/mm/ioremap.c          | 84 --------------------------------
>  5 files changed, 7 insertions(+), 88 deletions(-)
>  delete mode 100644 arch/riscv/mm/ioremap.c

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # rv32, rv64 boot
Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv


- Paul
