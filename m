Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 619BC4E3183
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Mar 2022 21:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352944AbiCUUOS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 21 Mar 2022 16:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353636AbiCUUN2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Mar 2022 16:13:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D1153725
        for <linux-parisc@vger.kernel.org>; Mon, 21 Mar 2022 13:11:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id k21so9910975lfe.4
        for <linux-parisc@vger.kernel.org>; Mon, 21 Mar 2022 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HxSmzv7mQZ7JUvz7ojdvZAF+4FKtifambs8UajreWKQ=;
        b=YRsq7D0j0R9Z60aR3WWEyswK/kSVnQuXRpE+1RTRLz1AhAbhu7YFRRwTglXvtv/QU0
         ylS8SXopbd6FP7DtmIfh3yQ8twQb5m3x5qzHE+b9NjsBMHn+HSch8X6PD3z5tioZUVso
         zf5P2i6MlykbE6mxxm1EQ0quGo1jH305Yu9uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HxSmzv7mQZ7JUvz7ojdvZAF+4FKtifambs8UajreWKQ=;
        b=PO7oMPsFcHRhgGko1QW3pTyt13kqzYcr0JHAI7Wz0LKWt6mc1wpHLrUTDKQa6y5p1w
         alBJGF26Ofj39Mv1Vu0IvlnzGqAQ3AWMzj7tL0JUWMGl2xaqpnZNu3V1FLuwsWdSiYLq
         21V11q6X0zKwCDRPn+JjsKzqFNJ15/qAz22saPkYUPC0hh4RSx/WIqhTtSRYAMuq1BI8
         Xuxcg/dbVShpUzw/yqWooNi2Ou16iPLB8bBTfv+tG/EhjbwJMY5X9xM8IOh+S/xx7yy1
         HnyY0cgyOD+XymdmSeX9S6NFg3utcQ5vNZP+idXsPrZst3afBkoSpuP+OOQWVgl90gW7
         2QRQ==
X-Gm-Message-State: AOAM532wpNcoXNMmqN/qCywoWjDwidOwSDhU8/Tr+fd3/4Yyby3navPs
        heQQhqIveLYyIXtBflk20ezN1aBGaYOQOowTv6Y=
X-Google-Smtp-Source: ABdhPJwZCtPj7DrUOUcqs4hui3YwwoFXlD1N6RXwEvGR0ABA1OmZ+VcWpz78PIfniDtOJp7293MT0Q==
X-Received: by 2002:a05:6512:4014:b0:44a:2b77:bed6 with SMTP id br20-20020a056512401400b0044a2b77bed6mr4599367lfb.381.1647893471138;
        Mon, 21 Mar 2022 13:11:11 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id z13-20020a056512308d00b0044874828803sm1891310lfd.309.2022.03.21.13.11.10
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 13:11:10 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id m3so14450242lfj.11
        for <linux-parisc@vger.kernel.org>; Mon, 21 Mar 2022 13:11:10 -0700 (PDT)
X-Received: by 2002:a19:e048:0:b0:448:2caa:7ed2 with SMTP id
 g8-20020a19e048000000b004482caa7ed2mr16082525lfj.449.1647893469870; Mon, 21
 Mar 2022 13:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <YjiyOIc71r53GME+@p100>
In-Reply-To: <YjiyOIc71r53GME+@p100>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Mar 2022 13:10:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnG8uJqNz83Fh=6je2u71syaenWEpDQCeHoPoxZyM5Dw@mail.gmail.com>
Message-ID: <CAHk-=whnG8uJqNz83Fh=6je2u71syaenWEpDQCeHoPoxZyM5Dw@mail.gmail.com>
Subject: Re: [GIT PULL] parisc architecture updates for v5.18-rc1
To:     Helge Deller <deller@gmx.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
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

On Mon, Mar 21, 2022 at 10:13 AM Helge Deller <deller@gmx.de> wrote:
>
> parisc architecture updates for kernel v5.18-rc1
>
> - add vDSO support (allows us to use read-only stacks)
[...]

I was all "WTF?".

Then I checked the code.

You mean non-executable, not read-only.

Fixed up in the merge message.

                   Linus
