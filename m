Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1574E2100
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Mar 2022 08:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344756AbiCUHON (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 21 Mar 2022 03:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344741AbiCUHOM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Mar 2022 03:14:12 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96AE154703
        for <linux-parisc@vger.kernel.org>; Mon, 21 Mar 2022 00:12:46 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id a1so17982369wrh.10
        for <linux-parisc@vger.kernel.org>; Mon, 21 Mar 2022 00:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=hJ6vnRkGqf7o3va/KYBtaxPfYuk6B8FxppLseSIcVuI=;
        b=T0NvvSlJ2KxqSeQh9uDO8eaqVGnPtENan8NL86zlhqZmMGPrUFRve059glXvBVlPrQ
         Vj3lMAEisg6Asx+mnbFRPl4W4maLEVyFdw+pE65Uw5TDTuLbFIeZpTPi/24t/BbzFkhQ
         3tnEKxAl/mi3oCbF2nnDaSqb0VabBPrjnDS9SNA1aphFq4CA7tP0UW//zpWVnCzWxwZp
         E4umlnaKSitGbNo4cDKxPRonaZ6xu3KlWrU3kFQY+hKKsfeaZ5kvnmBOxmTAJojpOaY2
         kFNiC40C9kHhQsVOLYuNi5ozjwBHde7xvD/C1kcx8n5Y6HF5UvpgW+ADqcIDPU9XDSsz
         sEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=hJ6vnRkGqf7o3va/KYBtaxPfYuk6B8FxppLseSIcVuI=;
        b=f3H+rMyr+U9wGgRRzEGuAFIxIEDR5dmnl36Cfka7rvqxV9/c58yri/YVLlpdT7g30g
         GTln6fR+HdhgYd0oFNPUvwxNAz3pZcRSmMUZB7upmhoqblXw4g0Acr4UuVXzZbZvlOZw
         vHFljPKalxIl+V0/GQXEB8DoI9j71zfwvVEy9WvDb2RCVYNPklxOX4+17GLwNgZALVwE
         QIWvXckG6z3rMmC899eaBslwNTXm/WcYpfBtMEUGHWx3H3MRpMi7yMTrMGw0J7cWDfp+
         +L6b7FohkHtwop6GxXu8MoCGotQGyxVEty2yI8e3ozjAH8x4svdA8DDz05nrB8grP6uQ
         i7TQ==
X-Gm-Message-State: AOAM533zoozmmaw8z0qQlL6AgXpA5sEl3s0KhKcoADb3hdreAqNL8GRR
        eFydywEcUfWGv9py155DX20CE1rNGT3zXR5xUF4=
X-Google-Smtp-Source: ABdhPJx9jYKgd/1C7X/pCOtiaUC8WxFRPVEhER76PAGJCw3oJmV0LYmvcf/QDNCNxnH0yzksDDwtPw==
X-Received: by 2002:a05:6000:1541:b0:204:18c9:7179 with SMTP id 1-20020a056000154100b0020418c97179mr1175968wry.581.1647846765583;
        Mon, 21 Mar 2022 00:12:45 -0700 (PDT)
Received: from [192.168.43.30] ([197.211.61.62])
        by smtp.gmail.com with ESMTPSA id v2-20020adf8b42000000b001edc38024c9sm13707471wra.65.2022.03.21.00.12.40
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Mar 2022 00:12:45 -0700 (PDT)
Message-ID: <6238256d.1c69fb81.4a2ea.2f9f@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: meine Spende
To:     laromakhardware0@gmail.com
From:   laromakhardware0@gmail.com
Date:   Mon, 21 Mar 2022 00:12:33 -0700
Reply-To: mariaelisabethschaeffler702@gmail.com
X-Spam-Status: No, score=3.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, die restlichen 25% dieses Ja=
hr 2022 an Einzelpersonen zu verschenken. Ich habe mich entschieden, 1.500.=
000,00 Euro an Sie zu spenden. Wenn Sie an meiner Spende interessiert sind,=
 kontaktieren Sie mich f=FCr weitere Informationen.

Unter folgendem Link k=F6nnen Sie auch mehr =FCber mich erfahren

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria Elisabeth Schaeffler
E-Mail: mariaelisabethschaeffler702@gmail.com
