Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D64AC512411
	for <lists+linux-parisc@lfdr.de>; Wed, 27 Apr 2022 22:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236729AbiD0UvP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 27 Apr 2022 16:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236607AbiD0UvK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 27 Apr 2022 16:51:10 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C400D617C
        for <linux-parisc@vger.kernel.org>; Wed, 27 Apr 2022 13:47:57 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id y76so5590638ybe.1
        for <linux-parisc@vger.kernel.org>; Wed, 27 Apr 2022 13:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wjBGniCkrPPn2XJZCJS3viIi0a1wQPIJsNzJkxVm3f8=;
        b=YXmUuFGWRsnYvsuY8WxZpw1NN/uZTGV6gHRqPICsiQRgxqgwXOkO/+BP3u7R4nLgDR
         J8RDj5ofdIF/V7CiQyuSIh+I2b9gslArzgmXoctHFZ2Pb5ps54nc1OGV9QJYvdnjEmnk
         Jw5sUbmAmOp2wuhVs9orQottDeetDhjjGBsT9ePMvqZbpacVgXVeoEFSJwGNOaAnNHmk
         /GDAcTiTIawFjZ2Nuf5OSztqR1DCor1lA++7hJnYa3lx31QP+T6V0ewLkbYbqtLy8lDS
         XYUEJ/r6FA1QXwi/uBFdEBuWntwcKM4SsOMVR8N5FUzviZ5vjiZ7F+nt2Cq5CBkTtIKG
         hUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wjBGniCkrPPn2XJZCJS3viIi0a1wQPIJsNzJkxVm3f8=;
        b=j4cWDlSBL94EitlxNZgpI4QQvCO5dIebsJqh6E6o2i2hD7nbSe/UdjKwhUEiUrOnFj
         9DVvFeCEERG1ILU3ob7eJzmb5MOweWfcaofLpwjV+0Lm3/1jwYEFdEpTYgoHY4VaI2Wg
         5CA/+uaXyGCubr8RM7gT5S4PKir6GYHWUVPGdSC2+HVJDBfUdausUPsfespLK2QxBMWo
         7q8oOWPseIUUnzn9cBBtdUThQCBJn9py0Req4WY2NwNd7nudovQlglzZdgrLeJKQWO6d
         xtJgjlCRrsQzc9J+UOIPzSXi8BIfBwcbDqMBfp0exl4SXswVPFO++wDLQ09fajb2OWmM
         Ka5A==
X-Gm-Message-State: AOAM532SEq2NRVXfI7XMYu68PzvNzeWivuYknGkvMJT8z/x+SFTD8E6D
        1tyV8m3iDgvkcynGn8glq+9/rukjDfTdtT0J7po64g==
X-Google-Smtp-Source: ABdhPJwN8etrWMh6Os0GxHfjXTwaVKnhY711RgcSmkqMqHskXsAPhaJWu2gLTWYYQDHYI8eCDcXjQUlF8pDMBdyhq4w=
X-Received: by 2002:a25:ea48:0:b0:644:e2e5:309 with SMTP id
 o8-20020a25ea48000000b00644e2e50309mr27820653ybe.407.1651092476629; Wed, 27
 Apr 2022 13:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <202204270907.nUUrw3dS-lkp@intel.com> <20220427200259.2564-1-lnx.erin@gmail.com>
In-Reply-To: <20220427200259.2564-1-lnx.erin@gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Wed, 27 Apr 2022 13:47:45 -0700
Message-ID: <CANn89iLDK=_MBo20S09Pq2PtKKPfWMM2R9FcDUWVjX-dk6cYDA@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: SO_RCVMARK socket option for SO_MARK
 with recvmsg()
To:     Erin MacNeil <lnx.erin@gmail.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Oliver Hartkopp <socketcan@hartkopp.net>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Robin van der Gracht <robin@protonic.nl>,
        Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
        Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Vlad Yasevich <vyasevich@gmail.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
        Martynas Pumputis <m@lambda.lt>,
        Akhmat Karakotov <hmukos@yandex-team.ru>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Wei Wang <weiwan@google.com>, Yangbo Lu <yangbo.lu@nxp.com>,
        Florian Westphal <fw@strlen.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Palethorpe <rpalethorpe@suse.com>,
        Willem de Bruijn <willemb@google.com>,
        Hangbin Liu <liuhangbin@gmail.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Richard Sanger <rsanger@wand.net.nz>,
        Yajun Deng <yajun.deng@linux.dev>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, netdev <netdev@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org,
        linux-wpan@vger.kernel.org, linux-sctp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Apr 27, 2022 at 1:03 PM Erin MacNeil <lnx.erin@gmail.com> wrote:
>
> Adding a new socket option, SO_RCVMARK, to indicate that SO_MARK
> should be included in the ancillary data returned by recvmsg().
>
> Renamed the sock_recv_ts_and_drops() function to sock_recv_cmsgs().
>
> Signed-off-by: Erin MacNeil <lnx.erin@gmail.com>
>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks.
