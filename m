Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D05454BCF75
	for <lists+linux-parisc@lfdr.de>; Sun, 20 Feb 2022 16:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244122AbiBTPis (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 20 Feb 2022 10:38:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbiBTPin (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 20 Feb 2022 10:38:43 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DA141331
        for <linux-parisc@vger.kernel.org>; Sun, 20 Feb 2022 07:38:17 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s24so18063888edr.5
        for <linux-parisc@vger.kernel.org>; Sun, 20 Feb 2022 07:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=ymEpgIXl54yuSlZg88NLeYK1RJf0YDtYgXWD/9J1GQ0=;
        b=degv64KeFtdi2zbjsMqCg99XUBwRsWWRsat8pVSE1dsJMyLEQebzW+u8gL6CBfEQQn
         TR573CG7WA+9vnEdvbzyisLdqVfd2L7tW255YjXAv70Nz6z7oKmPah1XlxlqBd5nDgXH
         ePUhHpcz6Nz3MIgpiiVSbZwwadbd4mnHSGmsNzIMifS2uWsr5SlJ5m2rsNUPByoI5zhb
         SR83azGcCTW//SbmgQ0y+vLGSla0uKvjbMIVO2C3U/MToeM9d3wUPHwP8BDBVACmWkyb
         mbrrj1iz1ehyoQ1IJSYmVaPjfehHwDHBxgq0J/uzM167cyMcPy58BK3LuVjr98uUFJPh
         U0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=ymEpgIXl54yuSlZg88NLeYK1RJf0YDtYgXWD/9J1GQ0=;
        b=uEydU+ef+SqcYTd3gbpXpmzI1uU2h3/Lb+X+OFNVpAA+Ei984Uxk2XYYVfobfPcPbo
         qvWHBiG4sI+McsQgapRbp1LaiRJwfsL5w4h+xDmv3169M6g5CJb5Pf4oSEaOLq4BbkSZ
         /wjHX0TIQTe/UO1ZwTPNCG8xdbllPCqiYdmY6y2c8jxVvebZVnwybqIHQHtzZuhKM+P7
         LTK1d1Mi4e6yOtW6m7s+gx6PQYUkPodMu7WLs0SBFSaNtvBINQPWbUTiSQm/1OFXnlXW
         4S5sE++O+7SoQok3lbSiWItWw9rKHt/1QVIKJXGtFwnKt7DXOmsQIcbE0X65aQn9r5tF
         DJlQ==
X-Gm-Message-State: AOAM530cEC69rYE/qn+4AIMbRNTFIM1ywGj1cjSAejJxm+f5G8o+ylhd
        XGsc8gRG32odYqxrd2oZrfDrNKkIF7ZslCJccMs=
X-Google-Smtp-Source: ABdhPJz0AN7o9No0fhs6xZEm8hzyX6WOZhNi8B3U8PCYdBi3itNU8MBgMEdAbbMqhnsTf7H9NACa5LH5MJlqKIgsin0=
X-Received: by 2002:aa7:ce92:0:b0:40f:b89c:18fe with SMTP id
 y18-20020aa7ce92000000b0040fb89c18femr17517323edv.67.1645371495858; Sun, 20
 Feb 2022 07:38:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a54:38c1:0:0:0:0:0 with HTTP; Sun, 20 Feb 2022 07:38:15
 -0800 (PST)
Reply-To: fatibaro01@yahoo.com
From:   Fatimah Baro <imanosose@gmail.com>
Date:   Sun, 20 Feb 2022 16:38:15 +0100
Message-ID: <CAFEyOE7M=ZUrSROmPGAE3yrv-g10xHU=UARo1h+trJF7vepfMA@mail.gmail.com>
Subject: Business invitation
To:     imanosose <imanosose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.8 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Greetings from Burkina Faso,
Please pardon me if my request offend your person; I need you to stand
as my foreign partner for investment in your country. Please reply
immediately if you are interested, so that I can give you more
information.
Fatimah Baro
