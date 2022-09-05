Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9C55AD34B
	for <lists+linux-parisc@lfdr.de>; Mon,  5 Sep 2022 14:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237179AbiIEMwj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 5 Sep 2022 08:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237012AbiIEMwi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 5 Sep 2022 08:52:38 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B531C10C
        for <linux-parisc@vger.kernel.org>; Mon,  5 Sep 2022 05:52:36 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id y82so4488962yby.6
        for <linux-parisc@vger.kernel.org>; Mon, 05 Sep 2022 05:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=6iyQDafiYBXnSsgnRlfbKAxcwMtuNVs3v7T0vJde0mE=;
        b=RiXpv2wcwYE/WTV/NafiP3Da0dYIlE/5Z3TzTX3rMmLgfFuVAp+YZXHMDmAWcAZuIH
         eV6yQtW24J+fck8k8fuZKifcCwtn/eWalYvQJaSeHDN2nV62pXcQVDIVK7UN9t4LAMuw
         HkcoYlr5MHm6ujyYem8x+RykPc/otF04bI9Yov5XY3XH1AMqM4TBuH7HLOAYsbt4uKGD
         2xO1Rxc2OqqtPGLhcsaJh9GRxdcqx4pq/5IZA/tnv3JYFWd4YooD4OZ246g9/17C6h1y
         7NLRSrRu8wKnEq7vaRZPIzvyHrXOOB9NO9+n63ppwwNSJebKziSUDObbs6ntMeCDBTwD
         eC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6iyQDafiYBXnSsgnRlfbKAxcwMtuNVs3v7T0vJde0mE=;
        b=khVLth/5EPgCCOhWOV5GLwN3WBOYUw3B6f/iNQnI58p0fHXlutFMUPRuu5u8pnElXl
         CEvwY6jyAjpWXF/PBJ6kXuwbwo9FJGS3OCzr1MjG0DrjhJQAoe/2XTXuwjVQv+KtpVKd
         KWdLyRPR5vRPJdLKFpFbE6vH42Nieoe9YlFN/QtoFjDzsdHIMHjad+cerAEzZ5+qO+h3
         eJE75y7Z/FS71BOxepZB2zesgdyzTpBYzSDcais5kRuoob575BOus4q3SmH0Oc6Ca4HO
         u0ixF2dumCJPd22GM7ZC/q46DY7mUubEvUGRvjqB53d51077SfU9SK/RT76tucRCk83H
         HIaA==
X-Gm-Message-State: ACgBeo3jkjgrKGXFWT+9hqjBmaT/oRVCRgairIhvq1mmv77Q6rYyN7vY
        nO+amVaJLGKo2kTO4b+jr/u6TB8NBgSjaua0xXw=
X-Google-Smtp-Source: AA6agR5MaC+kWRMw9AWsWJZGoNUOSd2Z/NFUmoS0Bhbtiomrsix56lXQyXkQSX2Ho5MvRc5QkDULDk7uHP1k9XFv+Ww=
X-Received: by 2002:a05:6902:24d:b0:6a8:fc7a:e24a with SMTP id
 k13-20020a056902024d00b006a8fc7ae24amr5180198ybs.481.1662382356120; Mon, 05
 Sep 2022 05:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:4a43:0:0:0:0 with HTTP; Mon, 5 Sep 2022 05:52:35
 -0700 (PDT)
Reply-To: lemrtino@outlook.fr
From:   Lene Martino <lemrtin03@gmail.com>
Date:   Mon, 5 Sep 2022 14:52:35 +0200
Message-ID: <CAGruaR3eiwDJP-1Daq=9hhmgwjP1JyWcdj1u8TUk5siMpP1vHw@mail.gmail.com>
Subject: =?UTF-8?Q?Ihre_Hilfe_wird_ben=C3=B6tigt?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b41 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6367]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lemrtin03[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [lemrtin03[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Mit geb=C3=BChrendem Respekt und Menschlichkeit war ich gezwungen, Ihnen
aus humanit=C3=A4ren Gr=C3=BCnden zu schreiben. Mein Name ist Lene Martino,=
 ich
komme von der Elfenbeink=C3=BCste und bin 57 Jahre alt. Ich bin mit dem
verstorbenen Dr. Joseph Samuel Martino verheiratet, der in einer
=C3=96lfirma in der Elfenbeink=C3=BCste gearbeitet hat und nach einer
Herzoperation gestorben ist. Wenn es Ihnen nichts ausmacht, w=C3=BCrde ich
gerne ein wichtiges Gespr=C3=A4ch mit Ihnen f=C3=BChren, in dem es um meine
Entscheidung geht, mein Erbe, das ich in einer der Banken hier
hinterlegt habe, f=C3=BCr den Dienst an der Menschheit durch Sie zu
verwenden, weil ich nicht wei=C3=9F, wann mein Sch=C3=B6pfer meine Seele ab=
holen
wird.Der Betrag betr=C3=A4gt nur 5,5 Millionen US-Dollar. Sehr, sehr
wichtig. Wenn Sie interessiert und =C3=BCberzeugt sind, mir bei der
Verwirklichung dieses wohlt=C3=A4tigen Projekts zu helfen, lassen Sie es
mich wissen, um weitere Einzelheiten zu erfahren. Ich werde auf Ihre
dringende Antwort warten.
Mit freundlichen Gr=C3=BC=C3=9Fen,
Frau Lene Martino,
