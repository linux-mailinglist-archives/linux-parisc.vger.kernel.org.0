Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAE773D078
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Jun 2023 13:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbjFYLmd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Jun 2023 07:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbjFYLmc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Jun 2023 07:42:32 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F781B9
        for <linux-parisc@vger.kernel.org>; Sun, 25 Jun 2023 04:42:30 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-98e39784a85so82598266b.1
        for <linux-parisc@vger.kernel.org>; Sun, 25 Jun 2023 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687693349; x=1690285349;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Qd00mqgwhkkW6amCqEXLEzCc/q28cqM0GW7xvshDA=;
        b=djQ9fmyFMiEvsd0ILm95BZ7YDJvlLHsnlYtcnPdhOPdgARDBN3gH5LApdLwoiMHyc/
         kJbU1oal1T7ohgjIBd9HB6YmaJM5KsV7f0ck53V7HTQT7FcuRJrLE5efyIAxp7AgknI8
         g64SIy4XieTojwYFb6vcd53j6Mo2Zt6EijCqYdTLMrSNLT7NazXVJYBoM1wpTu0qDEju
         8mWTnxgcl9Cc+8XFE2eyKSG8W6ZWQJx6tRSrtMXttDBQgrQwa0X12+Uec/fY21Y6to/7
         qD6V/fS4jUz8vGpYFHUTQLPqIugJNPqqq67JTJ1Cc6B/4CbJzAaDncmSNqxdm3HScXuY
         +pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687693349; x=1690285349;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46Qd00mqgwhkkW6amCqEXLEzCc/q28cqM0GW7xvshDA=;
        b=OOsrNO/7rTOpd/Rq6iePa6HFnHWs1u4rmHv9rumX3NmEnYSvhTsPWIetgTmbaz/Bff
         BR3QU9AxGimWTLf+mP1KTdV1m3efufQnAn7UpWeLYLr4RsIzJ2UhQffgkOlYpVKrkj5S
         5xcnAbYRR+SM/li3g7cu5XwDX4l+OhI3IleRNajLNrPOiEjpn1GKz0TFTtLqEZn0GvHC
         m3ipEBDuNEJA/+SRXcZy2V+CuF+RQi5an+jCFoRa8j0HwcdZp5WT8BmxMvj0ALZEgcqm
         c4JZ+Dd1gBwZw6IKu3WvxgWCY/LzcQIxx1fDhmnlzFUTA/58iMUSWuo9tzto9u4iK5ee
         pngw==
X-Gm-Message-State: AC+VfDz1E5puSTNmyLFRAaw8BKiaN5K0vTigOdKOljp8gjJYgWE1A+Kd
        8C5Ylz+aQIfir3WYOUznwbs8eFbbHyvH2om9ZaY=
X-Google-Smtp-Source: ACHHUZ6qMmnc8y+0uuQB2U8AaunO+4uXlo8C4iKgQLjwaDwvyvzMDod0qxBkS0xPiDasXzwuGHZ/h4Eps/LoDK3xjb4=
X-Received: by 2002:a17:907:9483:b0:989:4952:bfa5 with SMTP id
 dm3-20020a170907948300b009894952bfa5mr12251065ejc.30.1687693349041; Sun, 25
 Jun 2023 04:42:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:9702:b0:991:3793:fce3 with HTTP; Sun, 25 Jun 2023
 04:42:28 -0700 (PDT)
Reply-To: saguadshj564@gmail.com
From:   Ms Nadage Lassou <hjfhjgj566@gmail.com>
Date:   Sun, 25 Jun 2023 12:42:28 +0100
Message-ID: <CAHKTzWt65kFYTJtiVPNefq8MZn==2PstVBG0m-yQqnvdFQRmWw@mail.gmail.com>
Subject: REPLY QUICKLY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:643 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5023]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hjfhjgj566[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [hjfhjgj566[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [saguadshj564[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
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
