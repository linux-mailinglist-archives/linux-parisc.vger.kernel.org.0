Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA329554E6C
	for <lists+linux-parisc@lfdr.de>; Wed, 22 Jun 2022 17:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357734AbiFVPEM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 22 Jun 2022 11:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358981AbiFVPED (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 22 Jun 2022 11:04:03 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAC53EB93
        for <linux-parisc@vger.kernel.org>; Wed, 22 Jun 2022 08:03:54 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id l4so16317840pgh.13
        for <linux-parisc@vger.kernel.org>; Wed, 22 Jun 2022 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=Jt/qXO7TwQJF3EWuk5p4azKGOCxq/Rzk3KoLqC6Pwff+0tHhs8als9639cidnzFde4
         ry7ero38QELHA22RBkZWtE0xNRPiiPEWIvKtPd0fZpNhUDrKHRyETW5WgRrbPPmi6/vT
         vJpxoQNLrGfsMgIfV+PXszjD1nMaBRUe0Gxx0eYZw7YGtSc5pfRkGeshne5cjr5BaKxu
         3INPcNuWqxw7/0puGY6UuhzUSAv6SoxD7Bz3CVHuDQWru55+lIHO02gOv78FJXnTYNjB
         rbtWgbiyhkE21LXWR11Bk6fRJOPFFcU92J8XbdNavb7vvb9W0t8MjYRzeI2ufnWOCsiS
         AGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=ATyA7inRyD3DryK2/42Z4IZOq3HQij08l2Xe8fgQt82alibYEOHaf6oe8Jc/TnOhmU
         P0C15Pw2mPVKPP80ZdCQFtfFBEzaX/GqclmBJTcUwyVP0MKFzRyuTASnPjKfjD4p5syt
         0iQ+qwzFmCT0sBUGZFjOG9w3sKhJT2iDj3HaZTO1IvV34tAJxC9hcWhRgiLHyyWz7SKB
         6q93L3i9CcaB0SCMuqi01y+mODx2/vVm+Gs5ZdLc0ev81TWhjFNyHGUEqq61/T71Wwui
         0YUB69DUOmXhe0Fb8pvggu2CdYS5ebfFh1M6zCGsvF+74wAMygIBAuEbMAtj0ETpexS5
         i+Vw==
X-Gm-Message-State: AJIora+eMAi6Rqrmge/Ndg94o5BMaRqyd7yR9avmuMpklV1DyZ+WditQ
        RFPHY4gPusu8t2o6aI+tfDXWdnn1KjzspT+nm6BHGGmRnbaG2P7l
X-Google-Smtp-Source: AGRyM1uVFGSnpr+dTCH2B3yi91+xpZWxlNuq532hGAWMLDkFZu1Qrq3wwA6KogrJ63y1ppaQwcWp21NviyeWeo5Xswg=
X-Received: by 2002:a63:af1c:0:b0:40c:f9fb:deca with SMTP id
 w28-20020a63af1c000000b0040cf9fbdecamr3305128pge.479.1655910232628; Wed, 22
 Jun 2022 08:03:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2308:b0:16a:1b3f:f74b with HTTP; Wed, 22 Jun 2022
 08:03:51 -0700 (PDT)
Reply-To: sales0212@asonmedsystemsinc.com
From:   Prasad Ronni <lerwickfinance7@gmail.com>
Date:   Wed, 22 Jun 2022 16:03:51 +0100
Message-ID: <CAFkto5szY9scoLwccBhUx92cgUVnT2cx2c=WmxiOTkm7N_y9gg@mail.gmail.com>
Subject: Service Needed.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

-- 
Hi,

Are you currently open to work as our executive company representative
on contractual basis working remotely? If yes, we will be happy to
share more details. Looking forward to your response.

Regards,
