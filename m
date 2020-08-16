Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1332458DD
	for <lists+linux-parisc@lfdr.de>; Sun, 16 Aug 2020 19:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729523AbgHPRwo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 16 Aug 2020 13:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgHPRwl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 16 Aug 2020 13:52:41 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7B4C061786
        for <linux-parisc@vger.kernel.org>; Sun, 16 Aug 2020 10:52:40 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h8so7225265lfp.9
        for <linux-parisc@vger.kernel.org>; Sun, 16 Aug 2020 10:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PS6YoGVPLniRRR+c8md/gMFUFC1gIYcQxqCkJrdFzyg=;
        b=atHbRpzX6ojST77P61yeW9XWzXo2nLP5AMbcUAvcz94HZSRc7IvqmssoNwyKSnrFTE
         DEQ2JrNhqTbFjWeACmgu2ERhWblD1TEhgmWMUsveOg+GQJ/iTeakIhN3FfG/sEmTox/6
         m6TfjQMw5kejjvlwOkgyOjxOWvqrG3Lh/w3H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PS6YoGVPLniRRR+c8md/gMFUFC1gIYcQxqCkJrdFzyg=;
        b=Fp/afmBzdMY9Vkg6QjohaiKH4PXpkOwmAoBv85D3z3gb0/2m10rEu8CCceM7aqxlUN
         rJbL/u92hPhZvw9doz2kMYqjMRgd6XTHgUeRwfC0ge8AegH+LgHB6Hn0ruNeFc7uJ76n
         yPyThQgjLmQcFRx6roCYO85vyFclc96qCdJi0d1V/Ue90WHfBoQLj0auoXccSC9zye7S
         zWVyp1VhrsNtowqHlualQDd5KLb8jkq+/YG2GtD2qCqFSeuU/4eDZTemGc9YOfR4Ad53
         KiWww868/anu5co0mozpsgHUuTTaqrmh2Tq8TeakWABRVvz82crfAezi/9q8yIk5bW5A
         h7CQ==
X-Gm-Message-State: AOAM532JSEl54rLEFT3/vGvGy5tyFKS/rormPxSvjFlfK3pb7/567jHY
        DiZqlvxIZHE3eSyptKFV+uJiVwzSh/aIVQ==
X-Google-Smtp-Source: ABdhPJzGyn1dZP/kolWpJ5qPqy4FAXncGjqzviQ8QLhC2wo7+AJve1OrXITPaRUOx/kkjqE5+fdIaQ==
X-Received: by 2002:a19:c752:: with SMTP id x79mr5485483lff.197.1597600358553;
        Sun, 16 Aug 2020 10:52:38 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id r19sm3947421ljc.59.2020.08.16.10.52.37
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2020 10:52:37 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id y2so6002798ljc.1
        for <linux-parisc@vger.kernel.org>; Sun, 16 Aug 2020 10:52:37 -0700 (PDT)
X-Received: by 2002:a2e:92d0:: with SMTP id k16mr5330870ljh.70.1597600356971;
 Sun, 16 Aug 2020 10:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200816142403.15449-1-rppt@kernel.org> <20200816144209.GH17456@casper.infradead.org>
 <20200816174343.GK752365@kernel.org>
In-Reply-To: <20200816174343.GK752365@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 16 Aug 2020 10:52:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiPUKCC490nd6Y5A1Sq=VpTpO=Li5cYb0iztp-x19nqiA@mail.gmail.com>
Message-ID: <CAHk-=wiPUKCC490nd6Y5A1Sq=VpTpO=Li5cYb0iztp-x19nqiA@mail.gmail.com>
Subject: Re: [PATCH] parisc: fix PMD pages allocation by restoring pmd_alloc_one()
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Matthew Wilcox <willy@infradead.org>, Helge Deller <deller@gmx.de>,
        linux-parisc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Pekka Enberg <penberg@kernel.org>,
        Meelis Roos <mroos@linux.ee>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Aug 16, 2020 at 10:43 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> I presume this is going via parisc tree, do you mind fixing up
> while applying?

I'll take it directly to not miss rc1, and I'll fix up the typo too.

              Linus
