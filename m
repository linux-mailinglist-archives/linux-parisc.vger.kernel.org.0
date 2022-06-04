Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE94F53D893
	for <lists+linux-parisc@lfdr.de>; Sat,  4 Jun 2022 22:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241584AbiFDU7J (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 4 Jun 2022 16:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241725AbiFDU7H (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 4 Jun 2022 16:59:07 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808232DD5A
        for <linux-parisc@vger.kernel.org>; Sat,  4 Jun 2022 13:59:05 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h19so14172753edj.0
        for <linux-parisc@vger.kernel.org>; Sat, 04 Jun 2022 13:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cbrEQUB+Zyw7O+8amBfM3+EQ1xFJmvp6idV/N1yDO5Q=;
        b=DR6JLQBUlW6TeFrHbPNTHjl/bNSSCqd/TvAHeTrBSGSTdjt2PGWP1jVWpZeyjx8cfd
         AkBcoT49q87tGoi2VkRcbKs4iL+cRMb0cleRuWrgkIJ+RWSaC3CouP74nuwQa9OsPW4P
         OoLeajQHAxqfI4yromeBb40f78dyRk+QlG4Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cbrEQUB+Zyw7O+8amBfM3+EQ1xFJmvp6idV/N1yDO5Q=;
        b=0oRcM3Cu2bgoeRnm5m0urprlV7DhhcBx/1Y3tNxbbU0/aOcwElAbLzWKhmqBnFLd+m
         tX3i5EtYDMUPjlRdhHpTIs+FzrAVXt+eLXUIgm/DlR4/M1Brmm2mopKS/2BKt9B26xmR
         hD2mPrqu98b1YmMFZK4vzBJxkpLx3mEzNpZUTP7NFCMTrTGI1vkg/GTTdsncAsZRbX0K
         VndqQ2JlVm9nuzGA8goD+B92a+Ldc8WRxfP7w2n4zRKnr9/09y/yngaBkfDimOPP5EsJ
         MWk+CdUuf3QZI4esdImzM4Ggd8YBCgfYr+YEprAI0Vy9KussbBJnPQhTxWsEhymtt92k
         kuow==
X-Gm-Message-State: AOAM532LM+ymmaTp9nGsfbM5A0taAjbi4M/gmbKMJpWpS9uzNfxx5lnT
        IIy9419mNjfmqUUuiTq8uTy3gfJjhPhirAo2
X-Google-Smtp-Source: ABdhPJx1Smm8DCZrTEgS5LdFXg/6njzkW9zOeIXn2KGVA8kXEvJDfkQNaO1gOkJva90UPofRJQ0lIg==
X-Received: by 2002:a05:6402:2682:b0:42e:1c85:7ddc with SMTP id w2-20020a056402268200b0042e1c857ddcmr14300093edd.143.1654376343792;
        Sat, 04 Jun 2022 13:59:03 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id x9-20020a1709064a8900b006f3ef214e2csm4475246eju.146.2022.06.04.13.59.03
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jun 2022 13:59:03 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id d14so5706015wra.10
        for <linux-parisc@vger.kernel.org>; Sat, 04 Jun 2022 13:59:03 -0700 (PDT)
X-Received: by 2002:a5d:6da6:0:b0:20f:bc8a:9400 with SMTP id
 u6-20020a5d6da6000000b0020fbc8a9400mr13992817wrs.274.1654376342801; Sat, 04
 Jun 2022 13:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <Ypt1N+GyXEMfAxR6@p100>
In-Reply-To: <Ypt1N+GyXEMfAxR6@p100>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 4 Jun 2022 13:58:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihXTsW_gkx=OdZf38MynCrmpe1P1EBnACH9PK7ggrdBg@mail.gmail.com>
Message-ID: <CAHk-=wihXTsW_gkx=OdZf38MynCrmpe1P1EBnACH9PK7ggrdBg@mail.gmail.com>
Subject: Re: [GIT PULL] more parisc architecture fixes/updates for v5.19-rc1
To:     Helge Deller <deller@gmx.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Mikulas Patocka <mpatocka@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Jun 4, 2022 at 8:07 AM Helge Deller <deller@gmx.de> wrote:
>
> Mikulas noticed that his C8000 workstation hangs at bootup with v5.18 if
> CONFIG_SCHED_MC is enabled.  His fix rearranges the topology setup and thus
> prevents the problem.
>
> The other two patches enhance the info from the STI (text) console driver and
> add the missing fb_is_primary_device() function which helps the framebuffer
> driver to detect the primary STIfb framebuffer.

Sorry I messed up - I ended up taking only your abbreviated
explanation from the tag for the merge commit message, not this
extended explanation in the pull request email.

Normally I notice and fix this up, but this time I only noticed after
I had already pushed out the end result.

So now my merge has a correct message, but not as complete as it
should have been.

            Linus
