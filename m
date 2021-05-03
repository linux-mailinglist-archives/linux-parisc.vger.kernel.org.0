Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42EE372208
	for <lists+linux-parisc@lfdr.de>; Mon,  3 May 2021 22:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbhECUwg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 May 2021 16:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbhECUwf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 May 2021 16:52:35 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B59C061573
        for <linux-parisc@vger.kernel.org>; Mon,  3 May 2021 13:51:41 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id p12so8533606ljg.1
        for <linux-parisc@vger.kernel.org>; Mon, 03 May 2021 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QchQiqdMcNQVx97JOdVceYXer6ralkj9boXVuf2A0Nk=;
        b=DK1cvrYbhmCC9VBuZOKNbrdhPICJFNpQqZImiSGX0uUltQVSk1Sqxy1EbIQCAOkGYb
         0gkx1cKXd3YGCcU+GByfe5ZxjsbXfBiymh+8FqFONeC8DzLh/3u5/DXWuSuCOupaIzfi
         y+8fIZE15AH8dZ4EbLbXkL7SctvDm0WwtOhqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QchQiqdMcNQVx97JOdVceYXer6ralkj9boXVuf2A0Nk=;
        b=mp+3ARi5TgwoW2dx2bj00Rtfz0qChygKxo9hxVkspp6MQ88V/GDClM7V5aG1d1M02H
         dO2iS483KyVkGW/Jx/vpfcw30dZLIk56ykHML6pyKRZgfc+Oqr1asrQ/awb96aA+VWV2
         hHZtCAwQcQYnG0b7oy7ZWWx6lv5AA0RTJscRw4+eukTwnVuYYSTrAwlLgfi8Uav7GmUA
         tyWtt3qc5f5iIPiOWpS9AxbwWRRKzGVafGc6yzTZ4iogobVA7peoWEUf6A8mmu0qUcdb
         HVyJ0E6LryRLNCU1biUcujbKAI2sS9xm4rViUQYuQHANsekzMPHwbGwp+8SfaVIh34TI
         TDmg==
X-Gm-Message-State: AOAM532Z0QAITum5T1OjEoJg5MjWgK3FvGv909bZf9xGopDO3GTW2UTv
        oC0kzlnUC5H0lfU7NtcvPPJuHhQHqGAt27HMso0=
X-Google-Smtp-Source: ABdhPJwat7IEYYEhR2N8S+YJGUYY6U1gUjCzPErydk1cMmHgKmMqhAXReI3bs8j5apyUg7SPNuUupQ==
X-Received: by 2002:a2e:2a42:: with SMTP id q63mr3743608ljq.225.1620075099300;
        Mon, 03 May 2021 13:51:39 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id k8sm63204lfo.123.2021.05.03.13.51.38
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 13:51:38 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2so10058785lft.4
        for <linux-parisc@vger.kernel.org>; Mon, 03 May 2021 13:51:38 -0700 (PDT)
X-Received: by 2002:a05:6512:a90:: with SMTP id m16mr13913971lfu.201.1620075098436;
 Mon, 03 May 2021 13:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <YJBg7V02gxIRPrDx@ls3530>
In-Reply-To: <YJBg7V02gxIRPrDx@ls3530>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 May 2021 13:51:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgx8Y8zNCfYNxnYNwaTg5mHcqkJhHjk=eKLCGfgXKp=EQ@mail.gmail.com>
Message-ID: <CAHk-=wgx8Y8zNCfYNxnYNwaTg5mHcqkJhHjk=eKLCGfgXKp=EQ@mail.gmail.com>
Subject: Re: [GIT PULL] parisc architecture updates for kernel v5.13-rc1
To:     Helge Deller <deller@gmx.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, May 3, 2021 at 1:46 PM Helge Deller <deller@gmx.de> wrote:
>
> please pull the parisc architecture updates for kernel 5.13-rc1 from:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/for-5.13/parisc

Ooh, and with a fancy signed tag. Thanks, looking good,

          Linus
