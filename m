Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F88A5BFD03
	for <lists+linux-parisc@lfdr.de>; Wed, 21 Sep 2022 13:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiIULfj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 21 Sep 2022 07:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiIULfj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Sep 2022 07:35:39 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27748C023
        for <linux-parisc@vger.kernel.org>; Wed, 21 Sep 2022 04:35:37 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id hy2so9254573ejc.8
        for <linux-parisc@vger.kernel.org>; Wed, 21 Sep 2022 04:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=aMioWMQ5lVJKEiDBUkqZkMsP+xqmAfQusNjWWrMJHWU=;
        b=NJRCKM3ElxcZ3njCsyw6d9DY8HZC875ZH42X+pbopfe41v7bL04DvzDZ4hPPGouYal
         KdkqKXDvKo/SS0y+pgy+mM7433QVa2UjMz1A1hSnGYC/Aubwr5IekQwFz5mCj4vyWeLM
         N5yG510Mkr9mi6IY+bc8lEU+wmrJoiVuQL0ulfuuIJDxj0sepb4zZH7fcU2/MgHxjJp4
         7dgKHFeSIAlOPplkooQBJQls8Yj6KjkiNwHEFAu4FSIQSZntHz2Feu/1WcLP/TYOJyOZ
         /s3Xg6EJR4CXlUJiyQkCSBaOeFJ5C86lAiqIHpW1qivslElxKqKsNAVUN9nL+QG9Ig0b
         5qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aMioWMQ5lVJKEiDBUkqZkMsP+xqmAfQusNjWWrMJHWU=;
        b=O3p3hFaRe6EOtFhZ7WzE+YPeIVuai68pM67XnAf/TwaYssSN49GEteUIS4FSt2aOlR
         Lvk65UWXWxFxneidNs/gS3s8TDcibyxtdxNGAWrBEF9cSvKwsHvSvSw5zwKdJq0ByKf6
         ZnpjrISr2Wq1qeXEPbvnWWFUhIsY68JoNWSRr74DKbVxjmYWUGKmVLOo2TSoGkJbdVGm
         +baqiNupNmN8qmMLrN11/2E6PwAPI3mJwpW37GR79idzvSDyJBNTyTWXaZxQh72ZIYO3
         NZJif5ZKy9XI/GU5ziXJszszsE4Qni7yy0U4OJilI2yeoE9GhPutC8aOZsPPyOijTvZf
         9M6w==
X-Gm-Message-State: ACrzQf1YD7AcvD4Ybizvix0EmonKkDlCpMdZBQDSmwEn1ULwkl/BbIBQ
        lWotV4DBc4Isb99gNZl/ABKzleEvuDxP/QvYLVA=
X-Google-Smtp-Source: AMsMyM4cOYCs5+7qgd72VGiuEKp037Z+m4CdIRI28WrYux8rs6zY7KAMayj6uzpXn3s10lSJdn54POC2FELyL1sBBmg=
X-Received: by 2002:a17:907:8a03:b0:77f:f5ac:8b46 with SMTP id
 sc3-20020a1709078a0300b0077ff5ac8b46mr21166266ejc.65.1663760136236; Wed, 21
 Sep 2022 04:35:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:b099:b0:781:9b2e:3103 with HTTP; Wed, 21 Sep 2022
 04:35:35 -0700 (PDT)
Reply-To: albertabossi2020@gmail.com
From:   Barrister Albert Abossi <albertabossi04@gmail.com>
Date:   Wed, 21 Sep 2022 11:35:35 +0000
Message-ID: <CABNWvX1knmAo6=G=Ef60eTPeVGBd3cuepwSMPusYFF2ShRZUyw@mail.gmail.com>
Subject: Lieber Freund
To:     albertabossi2020@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62a listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9994]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 0.9994]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [albertabossi04[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [albertabossi2020[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [albertabossi04[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Lieber Freund
Ich bin von Beruf Rechtsanwalt hier in meinem Heimatland Togo in
Westafrika. Einer meiner Mandanten aus Ihrem Land hat hier in der
Republik Togo mit einer Briefkastenentwicklungsfirma
zusammengearbeitet. Mein Mandant, seine Frau und ihre einzige Tochter
waren hier in meinem Land in einen Autounfall verwickelt. Ich habe
beschlossen, Sie zu kontaktieren, damit die 10,5 Millionen Dollar, die
er hier in einer Bank hinterlassen hat, sofort auf Ihr Bankkonto
=C3=BCberwiesen werden.
Mit freundlichen Gr=C3=BC=C3=9Fen.
Rechtsanwalt Albert ABOSSI
