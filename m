Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A96306DFF7F
	for <lists+linux-parisc@lfdr.de>; Wed, 12 Apr 2023 22:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjDLURU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 12 Apr 2023 16:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDLURT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 12 Apr 2023 16:17:19 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998344217
        for <linux-parisc@vger.kernel.org>; Wed, 12 Apr 2023 13:17:18 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-94a34a0fc1dso302719566b.1
        for <linux-parisc@vger.kernel.org>; Wed, 12 Apr 2023 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681330637; x=1683922637;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xi9uq08Lc7qgSHIkc+cRozRgpnVzBfheYQcmgwPVIi4=;
        b=Sl+/7KnMx2MJLCzLl2cHKlp9boxVpQxY8EdL5FCFbC+3pJhsW3o56Zkg1G3R5wj5sE
         Y0SkvF9JR7G7oUNHxaAJLYcN+sdt5/23VUXgb+RyxSK/+Tj6kAZvvkmHzjtVigcQ8l/d
         ArsuDxnlnqnm5Me+mEjf4jdiwewXOTnO9M3y5oA/SyKwPVNr4kGSQS8G6TufTguRfqD3
         gAnuacshl8H3f+Y6qMjpW7uoEovkJy50lBfS49zOz3OKszhUpbmrMH00lT2iN0ltlvka
         5B2So7Uj/08nu4qVRMrSUWH14Cwb4bq1rtquw2/04Sw4EWjMewtxs7z0Z3bceOwoewAm
         CrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681330637; x=1683922637;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xi9uq08Lc7qgSHIkc+cRozRgpnVzBfheYQcmgwPVIi4=;
        b=KTRbAct2eyvH97UM57ssGpsYzrFjcL9Zmf14SVdJ61UdJaJ884Q/C5DgAv+07s4c54
         TMWzrTnEm+MxhJljt3Wo+VYUXlJkiK8i6aS4htglfhxdOCxDmUGecR/avO4YdmhH5nmk
         E8GL1X671ay8TLNvf1DCg/KDpYjV7SxUMYV/QVNjDndvyoVJG6Edh4VazfpMidNPaOxn
         gvUwaNI3lm1zm/G9PF3N+WMTPFh6n8WbGwIqOXTkx+Dai0XKR0O2a89XN43QokezQQBP
         MOmUhIPaiBsyWUULSNoEG5kufGWPg/VY5KzycP1x7lnjrNYNG3D9kMfM82uskdavPHdB
         PmOg==
X-Gm-Message-State: AAQBX9fjYxObiRBlKRFBmmiY6q3kc2E2Fxkdj26ykXLDAizv9ykGnj5r
        tUkJXve3VUFvOpKk+FIkW/LRrE/WoyH6sOegAw==
X-Google-Smtp-Source: AKy350a68q1PTw4hMlm0tYdw+/XVddVgXJMoE1EWAMDcPhsq0ooEQwFyE+whGDgidh3QSkgSwzoe9fyWNtRhs+3p414=
X-Received: by 2002:a50:9ec1:0:b0:505:50a:a4d0 with SMTP id
 a59-20020a509ec1000000b00505050aa4d0mr1553393edf.2.1681330636992; Wed, 12 Apr
 2023 13:17:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:a64b:b0:94e:4efe:3da6 with HTTP; Wed, 12 Apr 2023
 13:17:16 -0700 (PDT)
Reply-To: nepk08544@gmail.com
From:   Leihservice <bhin5459@gmail.com>
Date:   Wed, 12 Apr 2023 13:17:16 -0700
Message-ID: <CAOczzx_Y+2Z4SSJjTtxQ2g5e5u-9NqhaRxRy6BAkwWk1jngq9Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

-- 
Holen Sie sich ein einfaches Darlehen mit einem Zinssatz von 2 %.
