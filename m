Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63779613AC9
	for <lists+linux-parisc@lfdr.de>; Mon, 31 Oct 2022 16:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbiJaP4G (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 31 Oct 2022 11:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbiJaP4D (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 31 Oct 2022 11:56:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4637D120B8
        for <linux-parisc@vger.kernel.org>; Mon, 31 Oct 2022 08:56:01 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z97so18050636ede.8
        for <linux-parisc@vger.kernel.org>; Mon, 31 Oct 2022 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54IXG2FPqhGXRhjbMJeBZJCoE2PKYVWz3wVMDeZTLCU=;
        b=Zskj8hY47y9/vRBVhsXI/zOvfwa2iyJBv9QUq1+i13j5qsNOJnVU3wL/JUdlYLqz4v
         Mk75ESkgustxHq75/QaQ5OEO1eZt7heVL+VSe9tWHj5UP5z0WxpoZwggf/S4CeijV4z5
         HpPLq4by6bha61t+359KMwWeXzdOid4NQVZsaks1CdeCumgLsRV5VNAtoBtOUtua3AOs
         B5a4nrT+akXiUSdAx3LfyeaIm/nUCwSaWn4ght0Rx/QkIRjjlRNszAEfCaGP1d1g0WE4
         nBI6wREzdJQ6Rx+IOYKCW7XmWBLDVtspMgcS3+GdeG5+YYpDHOEQlReggADgkn+UXgD5
         SxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54IXG2FPqhGXRhjbMJeBZJCoE2PKYVWz3wVMDeZTLCU=;
        b=ATIiuzR218CVXGe951juWS2Lno+qamXYwDft3sxb/58RH/BWOJItO7rXjBsOqcmqL8
         91Q2asfcIx7AlVcr2Yha45ST1/E//0P5hOZvfkY726lXFLDzu3dEJ4FrUyBgnzwjhiZm
         N2XKDMLUE2MjEertTaGkDeLaIN4IYxcBX+JhIZVOnMlPyzNJBEQVMZ75nqSnucJ2ifF3
         GssxKqnXYKUZ7fH0UrLlBk1Uqpkvfj3n/6tuhBKvbW+exRj0bZu0w0twQ+97RyD/0G+Q
         QBTy4K5UDfnnatKXWt79BbxVw7A2hZA+hllCUzZv+DHpzOFbxyRdA1DsGY5+lZC+JEEI
         gPkg==
X-Gm-Message-State: ACrzQf1R1YeEt/umRsN+K8z3OqwSSZL8JDvwwRMsulMFSDMTQ9zHq3Gz
        5hDWGYV6pglXnnpM2lMNUoFjsITBoCpdaDxryF8=
X-Google-Smtp-Source: AMsMyM4G/j8m1/zSeccQf2AkVugX8309cUfDI+UYDvZQuRuoGB23q/LHl7RH2mbAs7rIvYUS8mc5Ee0Zt9e7fN034Ws=
X-Received: by 2002:a05:6402:f0e:b0:461:aaa3:a11c with SMTP id
 i14-20020a0564020f0e00b00461aaa3a11cmr14510961eda.53.1667231759743; Mon, 31
 Oct 2022 08:55:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:608b:b0:5d:5fd:eaac with HTTP; Mon, 31 Oct 2022
 08:55:59 -0700 (PDT)
Reply-To: victorinaquezon01@yahoo.com
From:   Victorina <victorinaquezon@gmail.com>
Date:   Mon, 31 Oct 2022 15:55:59 +0000
Message-ID: <CAAOoKdtKiOsY9NHKOKnMFde+5RJ9erb66BYraxj99G3YEi+ybg@mail.gmail.com>
Subject: Bonjour
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

-- 
I am Madam Victorina Quezon a citizen of philippine,A widow
I am  woman going through so much pain and suffer and might not walk
again if nothing is been done fast
Please  I want you to help me retrieve the only Thing I have now in a
box  which contains my jewelries and 585,000 thounsand dollars   which
 my late husband left for me which is currently in a Security company,
I have no strength to do this due to my health condition and safety
Please Keep this Confidential
I await your response
Please reply me at     victorinaquezon01@yahoo.com
So i can explain more
With love
Victorina Quezon
