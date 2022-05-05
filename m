Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A206D51C940
	for <lists+linux-parisc@lfdr.de>; Thu,  5 May 2022 21:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344161AbiEEThj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 5 May 2022 15:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385139AbiEEThi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 5 May 2022 15:37:38 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1004C5C748
        for <linux-parisc@vger.kernel.org>; Thu,  5 May 2022 12:33:58 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id i1so5321898plg.7
        for <linux-parisc@vger.kernel.org>; Thu, 05 May 2022 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=v4eUmjER6vs/0f74ZVggxoVJzQQg/EVQNcv9HBAooSE=;
        b=l2AxKrl/ljzzkVvN9L0afY45k0QaKP+aQC1ABai1XFLA8Lh65mNiTmNYuJTSr6mB1W
         JWZyBlGbd/vDWshdG7f3sLRjIWkdVaRwMIO6t/r5xTgPNI9tzEagPaqPe6Kz08TfznJm
         JakxwoZaBZyEG2bbOrINXDVRR4elXz2ZaRBJBPx0as7DQBJUn215qKgwlRQEf1aKQUWK
         TA+C9iNrX7UOI4ZvGTRyzi3l8EmR9WVW4q8Ncneo6zYKUhv224LKPimelZTPS4lW2/Ii
         +yH5i92icBvb4v6wusOFZQV7MNMSLjq7nWJdVa1mpMtzQECHQQcmQPFDFQ0LNbAY7RP8
         65Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=v4eUmjER6vs/0f74ZVggxoVJzQQg/EVQNcv9HBAooSE=;
        b=la+ii+sR1AwxmTW6IQELYGtlYF3yIX+Rr+kl8A0UPYC4fjqAg4AMeiTddPAQx49Xke
         Xz0gkmLhN2INHVm5BaSrGhbhnvfux6IsqLUqSpim3P2dksa+li8AjsK9V9QNySmUuS1m
         myP5BDo6tPiy6Ld0ZBgoJ0wHSEGx3cPHFk+Fd/6dfgvTCxk5+aATCr09qeZqZnxmjWeQ
         Ks0QIwn+2MaHVfs2z9ZCchqkEftkNQ9PvBy4er7C4cGdtmv3jFoRmFzL/MV3ZpVRJnuL
         673oEsiJmVbqp4+Gc16cf9SPmVN4572uWIg94FFA+aZvncCZ91wOQRHV5cmtJ2dasFs4
         o9RQ==
X-Gm-Message-State: AOAM530MafmgMJwhhnVVj4GKeN7QcMbiHNxEuYL4+F4l+CtAsoEaOzXC
        Gao0vh4QokXjRsGbj+dMkvQy38/fvvCNVdeT+0aRR2S8NZk=
X-Google-Smtp-Source: ABdhPJzuUI+6N3A7SuicVS6UJI1ac2f2VlyovXOReWCFgYKSo/8W4u1IJZUlopUkx0M/zAO1owQcYKZL5yvjUflWVeA=
X-Received: by 2002:a17:90a:c595:b0:1d9:532e:52fd with SMTP id
 l21-20020a17090ac59500b001d9532e52fdmr8079856pjt.79.1651779237505; Thu, 05
 May 2022 12:33:57 -0700 (PDT)
MIME-Version: 1.0
From:   cp <carlojpisani@gmail.com>
Date:   Thu, 5 May 2022 21:33:21 +0200
Message-ID: <CA+QBN9BLL2XaO7yjJem6qZOP=-wHoZTNhxVmCtMM+6Frfs=WCQ@mail.gmail.com>
Subject: 
To:     linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

subscribe linux-parisc
