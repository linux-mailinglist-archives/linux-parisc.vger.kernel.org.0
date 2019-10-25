Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87094E45A4
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Oct 2019 10:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436685AbfJYIYt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Oct 2019 04:24:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38619 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437925AbfJYIYt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Oct 2019 04:24:49 -0400
Received: by mail-wr1-f68.google.com with SMTP id v9so1261415wrq.5
        for <linux-parisc@vger.kernel.org>; Fri, 25 Oct 2019 01:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QJej2zrE0QBqg+iZe6C/nm9jF4Wofv1H//Qo71L/Lag=;
        b=Kf2QBuVDRfq6+w0N7DCDZImKcWFxzkw3pvVhiEdnzg1XkUgGeTTSWLT/AXDil240QQ
         hoyIRS/bK4lqFnlz87IYHANGs4Xws7dB93EvJssGohry3bsXOshEno6Dqk4BPaPnfpRY
         MW1z665u1spkHgC4bGahdMT464TLw+1YH8Z8lmyJ1nskaMZZ46OQsKn2jmmBRxe0Ncvr
         RfQX4whxGZGnyVjXC+tZgkm3LVXnhyuhXcBmsUKSK8o7DckMmoVIGMkNC1lf4WASjicO
         /1VKnZn2qgrQn2r3sA6XsMoV6YvwKEEDchmOtm6V2itNyqrXRr+3KxQQLEV90vCR7S6U
         0kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QJej2zrE0QBqg+iZe6C/nm9jF4Wofv1H//Qo71L/Lag=;
        b=R90w0kh6t6vsIAHIKw7uvl7vbd290G/Ks9nDMT7u3l8K/c2Ff5RcpYwnvNOi/Kc0qG
         Rhan/2GLlBAOF2iBcKN9IT5y5MMNr4mGHdCWaz1cNoyfe8ZJRC2/XG58udgpa2tm+4bp
         WZ5rB0w0XMp8JL5mY5hg7Dj9UM3wODkiLRswlXzb5CfgrL1s16nmFW0N0aysBBLeSpMu
         AmrZraU8d4zVe2Ro3nJBfq99aZmyQBXTq2yuDA+QOxV+bqKRDOO5yoB4ev8kFU63Hizc
         xNi0CBH6U5kkvKxjj2geJqXaOmX/uUQ5swrliNV+YC9+u44erTcqUdKJKkclIJknKYp4
         KpKA==
X-Gm-Message-State: APjAAAUpWXRpR0L5GCoEXETl8WZ6gUIcOODuIsj8ki/TxmuEsIxwEG1t
        x0mpN9/S+6WJvlqb9RyGArC8nA==
X-Google-Smtp-Source: APXvYqyVbVYhcUVjlWsHAWMsNSTmIYOz09PiXSzKL+kucF3259sySENSkNokb9u6ffLnyHFkS8YN/A==
X-Received: by 2002:a5d:4aca:: with SMTP id y10mr1692223wrs.292.1571991887824;
        Fri, 25 Oct 2019 01:24:47 -0700 (PDT)
Received: from [66.102.1.109] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id b5sm1290058wmj.18.2019.10.25.01.24.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 01:24:47 -0700 (PDT)
Subject: Re: [PATCH 06/12] microblaze: use pgtable-nopmd instead of
 4level-fixup
To:     Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greentime Hu <green.hu@gmail.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Jeff Dike <jdike@addtoit.com>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Salter <msalter@redhat.com>,
        Matt Turner <mattst88@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Sam Creasey <sammy@sammy.net>,
        Vincent Chen <deanbo422@gmail.com>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
        sparclinux@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <1571822941-29776-1-git-send-email-rppt@kernel.org>
 <1571822941-29776-7-git-send-email-rppt@kernel.org>
From:   Michal Simek <monstr@monstr.eu>
Message-ID: <aa7df5a1-5022-bc82-8816-74c956e2fd90@monstr.eu>
Date:   Fri, 25 Oct 2019 10:24:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571822941-29776-7-git-send-email-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Mike,

On 23. 10. 19 11:28, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> microblaze has only two-level page tables and can use pgtable-nopmd and
> folding of the upper layers.
> 
> Replace usage of include/asm-generic/4level-fixup.h and explicit definition
> of __PAGETABLE_PMD_FOLDED in microblaze with
> include/asm-generic/pgtable-nopmd.h and adjust page table manipulation
> macros and functions accordingly.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/microblaze/include/asm/page.h    |  3 ---
>  arch/microblaze/include/asm/pgalloc.h | 16 ----------------
>  arch/microblaze/include/asm/pgtable.h | 32 ++------------------------------
>  arch/microblaze/kernel/signal.c       | 10 +++++++---
>  arch/microblaze/mm/init.c             |  7 +++++--
>  arch/microblaze/mm/pgtable.c          | 13 +++++++++++--
>  6 files changed, 25 insertions(+), 56 deletions(-)

I have take a look at this and when this is applied on the top of
5.4-rc2 there is not a problem.
But as was reported by 0-day there is compilation issue on the top of
mmotm/master tree and I am able to replicate it.
It means there are other changes in Andrew's tree which are causing it.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

