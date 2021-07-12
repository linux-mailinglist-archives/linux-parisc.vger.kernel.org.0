Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52283C63AD
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Jul 2021 21:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbhGLT1c (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Jul 2021 15:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236190AbhGLT13 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Jul 2021 15:27:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA50EC0613E8
        for <linux-parisc@vger.kernel.org>; Mon, 12 Jul 2021 12:24:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 8so33748206lfp.9
        for <linux-parisc@vger.kernel.org>; Mon, 12 Jul 2021 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r3C0MNcdPuaQMoy2DZLesW5CVXpDYfQzTqrwGXdHaRg=;
        b=MJrdQt/xj/X89L2akDuRIxLQO4djMTLLgU8eBvU6YVC8dUlC07Y6kHh4rBlkT1q7MV
         Ea7nnfbhd2stzRZFtdTC0KqSjngvfVy93JncJKAiLwNmjmfcozdphfyI2xTiy3uOptFv
         Vhn12vpbGZd8c3Bo7seoaaiJzsRoQUlb47+hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r3C0MNcdPuaQMoy2DZLesW5CVXpDYfQzTqrwGXdHaRg=;
        b=md4IToXN+aLkMk0kENHrMwqmS6Y3UuvwJU0rtSYTphGiXJm5sluKG49OjSzGoPeO8T
         NEtwcrxQ8F0DBEO4XQumez51r+FbonqCDYQpB+7sqM7xOBFntu9PVuC/1Zq7g5iGJu51
         ijKXSSLInGHmqvj52y2YDk/P6fX3Ukqj2ny+r714+JzwFDsGBnqgOlj8yjrIybONZiWJ
         w1oHnuCv7SM3UuRUDAXjsMxNlXp7m2DJdqpKETmQmyCY5nzPq4FrpRM3Fxb3+gAg+G7r
         4aHrVkXbKtmVHqyIrFpu7kfKJr7EcEnNQtaiL/C4PILqOHAzXFz/6HZxDKabmob/NyGI
         sBSQ==
X-Gm-Message-State: AOAM532PQ9CQgogfrPuK2PzDeuwbIzAox54jpTlXxDz3IpDm/Fi1FEDE
        yus2wRxPML0mTpHSwgPWJa1PBPfRXSmg0Mmujng=
X-Google-Smtp-Source: ABdhPJxPCs/cZACXP3k3wAD8gnfI/7JI+EeaT1RGT9mA2GZmmn5A4VizfB1qlFnjHR8xctsXD6e4Lg==
X-Received: by 2002:a05:6512:3a8d:: with SMTP id q13mr233188lfu.401.1626117878886;
        Mon, 12 Jul 2021 12:24:38 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id y6sm1141511ljm.79.2021.07.12.12.24.38
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 12:24:38 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 22so15213120lfy.12
        for <linux-parisc@vger.kernel.org>; Mon, 12 Jul 2021 12:24:38 -0700 (PDT)
X-Received: by 2002:a2e:9241:: with SMTP id v1mr639513ljg.48.1626117867421;
 Mon, 12 Jul 2021 12:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210712060928.4161649-1-hch@lst.de>
In-Reply-To: <20210712060928.4161649-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 12 Jul 2021 12:24:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whd0GaAH7gHuEiuKjOeD6JGKY1q5ydG1TCKjVBFNBUEJA@mail.gmail.com>
Message-ID: <CAHk-=whd0GaAH7gHuEiuKjOeD6JGKY1q5ydG1TCKjVBFNBUEJA@mail.gmail.com>
Subject: Re: flush_kernel_dcache_page fixes and removal
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-mmc@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Jul 11, 2021 at 11:09 PM Christoph Hellwig <hch@lst.de> wrote:
>
> I think we should just remove it and eat the very minor overhead in
> exec rather than confusing poor driver writers.

Ack.

I think architectures that have virtual caches might want to think
about this patch a bit more, but on the whole I can't argue against
the "it's badly documented and misused".

No sane architecture will care, since dcache will be coherent (there
are more issues on the I$ side, but that's a different issue)

              Linus
