Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C3A5F2818
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Oct 2022 07:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiJCFJY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Oct 2022 01:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbiJCFJX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Oct 2022 01:09:23 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1656B3AB2B
        for <linux-parisc@vger.kernel.org>; Sun,  2 Oct 2022 22:09:22 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id nb11so19752168ejc.5
        for <linux-parisc@vger.kernel.org>; Sun, 02 Oct 2022 22:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=w2Sd98ijqw1C9viuXZ/gaVr0VQbklp6rZezVmfhttdk=;
        b=Bhiuy0M8I0aSOuyoZNpDXfT6LJdq6Q6RjL/np9v5KvCHtD1/YRiVw/3pa9Dq14iny0
         AfXYLvrUe59sStOskeAWzfgvNZvLM6gqbF4MXHuYbZkj0nBBcWqASBVpINM5Y39piEpQ
         OYVQ58RSNldKFCGPKdzKNolhZRxnd8pFkPEZoV3fIRrMM5tT86uj6KF0BRSEydvq+FcG
         108XttwbFoxKKsasVhX8xoR8EyMliH+9Jriy2K/rtEJWRIFJsoWaKKK8ZBiWrUKEzPgL
         Bmvriw1fYYhxWST+QwF73w/CqyrPpgx3JOErWJsdaXPYSbKvouGYuIRBBAdb/U70CVmo
         +LYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=w2Sd98ijqw1C9viuXZ/gaVr0VQbklp6rZezVmfhttdk=;
        b=gQmgoCySjdZJAkzWFXtgSCKDBh9ogcTCHJuYLGlZWXqNekMyNRgmQbqFew/s/yf9N7
         JbPRwl/7E17qCVmIcB/WEnAEJ5CwxXW1D1805n+2cBCeyLJbs5cRa3dZuiKCi0+EwBMM
         MRRmivH/UAWFJ40hRyQHCqjrns7zrLn3vFQug4LU+8DfvbqYxQ9Te5zB6TSyw6hHmy0R
         2k2O03X/U0ORTpv4rNGCCI1V/WY5SGZD0aZrNCj1iAQ2bkgD6gT1xnO2VTwGY7ecHE5M
         Tv5cl6ULeIXfGjcS1JS7aWQoFbZ2btOfwP40A/JglIkaQzY26wGsd2B359Oqi6VsSi9b
         r6YQ==
X-Gm-Message-State: ACrzQf1mA77uiHWOIUGTtAfTAHuR5iTDKcT8okg2WxqhPATetfLU8Vdv
        Eb5UAFqCVWggq50ys0xJMtbRfz4dS63Z3nF+6G8=
X-Google-Smtp-Source: AMsMyM7/EzSY8tEr3Ir5nmC5gKGEc1jQHlsU3b89GJwuWYSuXnaUxMuItjR5XtAINIh2Ljwd5IsJJjnumvXS73T6Wkk=
X-Received: by 2002:a17:907:728d:b0:787:9a1f:1b04 with SMTP id
 dt13-20020a170907728d00b007879a1f1b04mr13885745ejc.2.1664773760729; Sun, 02
 Oct 2022 22:09:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6400:249b:0:0:0:0 with HTTP; Sun, 2 Oct 2022 22:09:20
 -0700 (PDT)
Reply-To: kaylajones612@consultant.com
From:   Kayla Jones <edohagbahey612@gmail.com>
Date:   Mon, 3 Oct 2022 05:09:20 +0000
Message-ID: <CAGY7tFbuA63XTVJv1vXPnJMc71pOW6WG0eZdDTgdMWLRXcSH9w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [kaylajones612[at]consultant.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [edohagbahey612[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [edohagbahey612[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

-- 
Greetings, please check and reply my previous emails that i sent to you.
