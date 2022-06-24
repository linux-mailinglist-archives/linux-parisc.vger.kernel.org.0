Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC26F55A05D
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jun 2022 20:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbiFXRkS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 Jun 2022 13:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiFXRjn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 Jun 2022 13:39:43 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB20A340F8
        for <linux-parisc@vger.kernel.org>; Fri, 24 Jun 2022 10:39:35 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id c4so2684572plc.8
        for <linux-parisc@vger.kernel.org>; Fri, 24 Jun 2022 10:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rkX1oaIqIjSQ+fhxhMvndP4sOtvnnrDnDjuV5umF/NU=;
        b=h39vafez0xPfjeqmyVCqsVEnND5p4DQC/7P/f19Qd/5AACaxcSGjhb59Tcy21u00+6
         CqmXwsFB1M3UAmRj/DHtfuG0dy1UevWDMa/M2O+0Qxx1yvJM1JCrt+ctAWkrsxjPifl6
         bASfdDlzi3t/bFHSiFhsgWpN2ifrQ4LbRne90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rkX1oaIqIjSQ+fhxhMvndP4sOtvnnrDnDjuV5umF/NU=;
        b=vT/u6wuCygivcMmk8j3pGXcdJpjgQAA+ap0ImP0zhlN38iJIfO3TfdZX9sRc/OvO6s
         e7/pT3CKq+zS5E5xBJXnUoD2dUYwRuuMgKMf3+sL7222srhZl4XMf+x8IJCRvCKw3NTL
         3QfpM/z/zCILODa2MQhEUlU8hgfF36M5ZywCO9pbZembWuc5hBTRJFbCcqFQqf0DkANB
         R8cO2TBRqkJX1+9b1J0Bt7VuSiqT3TJ039ywvPKrX/E7KnEU+M4NPJZbWAhPHXZlTqng
         uANGtOgnwSElNALRlnt3mUe2WxTKtJ2MlpGcTN2aNyiDYgG/FmWBkF1Bvd+5zULF0HU+
         0V2Q==
X-Gm-Message-State: AJIora/2mIrYk4BFnykFwZKp3p36annLcAmEbRkkg9RJhm9iOEYZLJRz
        cvkVIkPMxh6DJOw8EgO5rfdTcg==
X-Google-Smtp-Source: AGRyM1smB8K/UWVQFuL8bSpt3tgOdRk5hNU98NCVefIgSohiO2UNLio86AJpaKdlgR8zuSL5E3mtWQ==
X-Received: by 2002:a17:902:ef47:b0:169:a2a7:94cf with SMTP id e7-20020a170902ef4700b00169a2a794cfmr163884plx.143.1656092375445;
        Fri, 24 Jun 2022 10:39:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 71-20020a63034a000000b0040d2d9f15e0sm1916327pgd.20.2022.06.24.10.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:39:35 -0700 (PDT)
Date:   Fri, 24 Jun 2022 10:39:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jiang Jian <jiangjian@cdjrlc.com>
Cc:     deller@gmx.de, James.Bottomley@hansenpartnership.com,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] parisc: aligned '*' in comments
Message-ID: <202206241039.B98CEE0735@keescook>
References: <20220621063823.22064-1-jiangjian@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621063823.22064-1-jiangjian@cdjrlc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jun 21, 2022 at 02:38:23PM +0800, Jiang Jian wrote:
> Consider * alignment in comments
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
