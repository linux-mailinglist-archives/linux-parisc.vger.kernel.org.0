Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1E94580321
	for <lists+linux-parisc@lfdr.de>; Mon, 25 Jul 2022 18:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233698AbiGYQv4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 25 Jul 2022 12:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbiGYQvz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 25 Jul 2022 12:51:55 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF971D0CD
        for <linux-parisc@vger.kernel.org>; Mon, 25 Jul 2022 09:51:55 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id fy29so21585825ejc.12
        for <linux-parisc@vger.kernel.org>; Mon, 25 Jul 2022 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=0/zAavAbqc8YK236cqRPqz2/WjKnAFOAqNTri3Ty/ZY=;
        b=etGZs3xcaNVDq3HYtabFjRC8ZZASYEXqQUVjjiOmUdb/CHzTwj8skrIaGUDIGevMWA
         bY10LULiqo/LjInyuoj2ixgAVlw9+EKxLdOZvW+KcjbvXs3ngcR/JxSQS6yzAIH5bKRk
         Bhn4VEQNtz4wWnJBddRKeeUWr5HQGDrUtMYk1jv4jly5C10mNl2MfoWip0SEoMS8mprG
         2WSx0V5alZ8WsZOcOzb0dVliRKylVPQ92wM8kPuQor1/rXMEKVGLf8YF0UTwt0wSWNgx
         iG2n0/uRDtWkgm+N6gztAnwy2bIL88u4BztNuLH2N1aQj4wy+N38bCICd9T/5IOqr34s
         WrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=0/zAavAbqc8YK236cqRPqz2/WjKnAFOAqNTri3Ty/ZY=;
        b=3I/q4mWlJmdzkZhEneWWl7P/HgYmaBXGPbMOXJ69kuOlEkKTKzFrC0f5fAtqPbzYED
         q1F+eIAitAjeJqWfMXzADy0mMDXmwpqPxQjiFjT39PcarXHBsUJm8XJobfvVIXqv9jx6
         uDQ68DuJvYAfu7zR0hModQy+HiVbbCd+HnbOpBcDEK7RjQOQt9rzeA2uYh3+nB4M0CmX
         ITqUy8fr9hIFucAc1ooXUYppwVoBaehSDED6fb8xlTqIR/iuAdCCCuKfQM7wr5rcfYAR
         /kdcN5ElWJgT6/xvR0TcBhTUYtxRRtlxqBrFdiKlH100tfUSWkhpT7R5SPdQ59m+NrQn
         iPVw==
X-Gm-Message-State: AJIora8Y1kf9a7OheXmSvgbVVmmeqda+Q9oMwj3NWOrHHpYjFy/ncTXY
        +Enjx1ZT0a9z4QZnXaYXrQ4eOAMvq9VQYSXOTp0=
X-Google-Smtp-Source: AGRyM1ulVzedD6IjHY9rAnEVAiQY3wee7iWwI9EE8h8Nq5sVETz376sc8PgbB4YPqvvuEPexLsBgnIJLuIMwlSsPICg=
X-Received: by 2002:a17:907:2e0d:b0:72b:8cd4:ca52 with SMTP id
 ig13-20020a1709072e0d00b0072b8cd4ca52mr10458655ejc.541.1658767913673; Mon, 25
 Jul 2022 09:51:53 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkaylamanthey612@gmail.com
Sender: kondorlouise@gmail.com
Received: by 2002:a05:6400:5b9b:0:0:0:0 with HTTP; Mon, 25 Jul 2022 09:51:52
 -0700 (PDT)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Mon, 25 Jul 2022 16:51:52 +0000
X-Google-Sender-Auth: 2NDv8rMB_iDUuaQ0QBxIFXJQXTk
Message-ID: <CABvhzWSv=myDEv5vFHw_pfO+cib3hAO2ymqp1_ooyTmXufE5sw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hallo, ik hoop dat het goed met je gaat. Ik heb geen feedback van u
ontvangen met betrekking tot mijn eerdere e-mails, controleer en
beantwoord mij.
