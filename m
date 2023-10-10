Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89427BF542
	for <lists+linux-parisc@lfdr.de>; Tue, 10 Oct 2023 10:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234634AbjJJIGj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 10 Oct 2023 04:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234631AbjJJIGi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 10 Oct 2023 04:06:38 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1848AF
        for <linux-parisc@vger.kernel.org>; Tue, 10 Oct 2023 01:06:36 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c189dabcc3so63391581fa.1
        for <linux-parisc@vger.kernel.org>; Tue, 10 Oct 2023 01:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696925195; x=1697529995; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Qd00mqgwhkkW6amCqEXLEzCc/q28cqM0GW7xvshDA=;
        b=Dla307GcsQ7mzgoyvpW6ZUi0JvGSyJVUbZjR7HyxfVCwV+pXBOcf2tL0AOCybiQgTX
         Tl6dFtqq6DWEizNiXBGshBm5l4wNFuYI1czrga52h+fxw8WejM/NpIDBJ6Tm9d/p3E36
         EYwG9lLk/1ecv+Rtv/iBni6tBByr0aWKYkPZ+ndkXZeGg18/NaiHFtzrp4EuDn+oVaXP
         zEO6IEk+NAGx4YquCzMr0DKMNGJD4zz8l+6bzbEgyEBgR7j3wMj6i/IPjF3Tp9dOh58R
         Uy/4b+0bt+PEuImp7GTH3Cbx+vDYrD/WIKjdiVGfyicoBH6PvXUb/RIDTJ4xESYzgFuj
         dZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696925195; x=1697529995;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46Qd00mqgwhkkW6amCqEXLEzCc/q28cqM0GW7xvshDA=;
        b=nmLuBuHGwPZRa3u0fcVyKrDqnk8QwhHAVrLEdHH7OH8hNcXp27NzjJwHhI+sTqAJ56
         5a4IeSfeWKK2FVpURD6XLrttv4GMxkrMl0c9KA892Qa7Dl3BZIvwSM9ZxHOZuDWjhaXD
         zZEYjoOHq48SMH0JXmBuVfGppv1Aejzu6ShXmLUonzmOZRW1ewqw6x7CvyjCuH/6MbIW
         KZefkdum+ogi4SOPbtkokBac1GT+dDvUbUZpOMBQzSzjLuUeto+m5ZA6TRvd5GBOENSq
         e/U4B2/Tok/7Zbsk0xX9UyMEejXByo/XPhWw1hauJGeJQ0eMexrvkSnuxAqru3OTyRNK
         4R9g==
X-Gm-Message-State: AOJu0YysWj8TJv5oezDsJdzBeEpWUPJU63CAPqO7vQ5CEqGT53PAkkxE
        EUBbz/K/bAeEX4Gb5YN2rGP39J+JbUUfN8gr670=
X-Google-Smtp-Source: AGHT+IE0DYM4+1ZEIl2J7FEFO6rwRBC3LBDWWTWM7roJIVYohCQa21ZEHtzGkM0/APOwFVyeM7ztT7PrB7iy50/pg5Y=
X-Received: by 2002:a2e:9090:0:b0:2c1:7473:f3e0 with SMTP id
 l16-20020a2e9090000000b002c17473f3e0mr16207973ljg.43.1696925194648; Tue, 10
 Oct 2023 01:06:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:4029:b0:272:238c:7260 with HTTP; Tue, 10 Oct 2023
 01:06:34 -0700 (PDT)
Reply-To: saguadshj564@gmail.com
From:   Ms Nadage Lassou <nadagelassou7@gmail.com>
Date:   Tue, 10 Oct 2023 09:06:34 +0100
Message-ID: <CAGkZahBBJMV4_LO6z3BpTRJ8_JEaEzHMrumbZHJF3EsXdMFp1A@mail.gmail.com>
Subject: ATTENTION FOR BENEFIT.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        SUBJ_ATTENTION,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2a00:1450:4864:20:0:0:0:232 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [nadagelassou7[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [nadagelassou7[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [saguadshj564[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Greetings.

I have something important to tell you.
i will send you the details once i hear from you.
Thanks,
Ms Nadage Lassou
