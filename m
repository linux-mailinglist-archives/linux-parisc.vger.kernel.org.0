Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A62D67B5C0E
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Oct 2023 22:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjJBU3v (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 2 Oct 2023 16:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235909AbjJBU3u (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 2 Oct 2023 16:29:50 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798F5CC
        for <linux-parisc@vger.kernel.org>; Mon,  2 Oct 2023 13:29:46 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-690bd8f89baso142472b3a.2
        for <linux-parisc@vger.kernel.org>; Mon, 02 Oct 2023 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696278586; x=1696883386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l0WqvxjZPFgnTMVefi0EvUmMzg28kKmDEueowRCLoP8=;
        b=XCHIsYi7q+fZ5DlAHRHbxyo8kSkOiKJTNaBiIGSwNLJhJ/NYEmUd3G1+UtA7ZkqSYk
         IYzgzhWvp4F9gO+1Ea7AoAdXKOPFDllkiGDor2x6bWStVbLeJ2WJTMr1AgaJLXLbG8eC
         7+Fq3VNzYfXltukxbu/PgVt10hhBGsoaBdRbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696278586; x=1696883386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0WqvxjZPFgnTMVefi0EvUmMzg28kKmDEueowRCLoP8=;
        b=TUhmy+tSBWbjg1w9fqfThopXqW6TFC7sEmUznkJ35OQzDZDDryF3wp79OYI8QSL8gJ
         tWXOO04SqN0E8s22hio2ufMELi7xStBYg5j+GUnNTzuLt+N2nun27hzLvm2pyefZNMfH
         8AHyqCopKmccuD9wtXUxCK7h9MgFuBCwqupKWgf3y9SfD5TkZY6pqypzMcWrdQr0Jyki
         jExs+vGXeynHl/3hS3rm3nPWyRsTf5mfhqCYR9PVBcLbh4kf4i4Y/XF9HWEUsBvuENLk
         /p+MTnANyJl1DYe8TDmEM7+QPAPJzfH7Ay2/rLYwSFybjinWYHz0jNxFJR3pU4cETZtt
         q6Zw==
X-Gm-Message-State: AOJu0YxG78vb48eO0NpEKDT4yGryylq0W2/wVJnZkGeLCfpKCKzqifmv
        nOpYya3ip9cA2YWQ56nVX/P0vr+K0AQC0GvW22E=
X-Google-Smtp-Source: AGHT+IH7EJAFcR/dE+fR2pl8ERxWFWJidFnQyrbZorlL1KyxD/iU349CYKdzcSGq8EAl/ms6FiBQWQ==
X-Received: by 2002:a05:6a21:35c4:b0:165:a34a:ce20 with SMTP id ba4-20020a056a2135c400b00165a34ace20mr1436405pzc.29.1696278585958;
        Mon, 02 Oct 2023 13:29:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p23-20020a170902a41700b001c32fd9e412sm10598281plq.58.2023.10.02.13.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 13:29:45 -0700 (PDT)
Date:   Mon, 2 Oct 2023 13:29:40 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Jamal Hadi Salim <jhs@mojatatu.com>,
        "David S. Miller" <davem@davemloft.net>,
        David Ahern <dsahern@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Martin KaFai Lau <martin.lau@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Yisen Zhuang <yisen.zhuang@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Long Li <longli@microsoft.com>,
        Ajay Sharma <sharmaajay@microsoft.com>,
        Alex Elder <elder@kernel.org>,
        Pravin B Shelar <pshelar@ovn.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, Simon Horman <horms@kernel.org>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
        dev@openvswitch.org, linux-parisc@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 00/14] Batch 1: Annotate structs with __counted_by
Message-ID: <202310021329.56BE32B19@keescook>
References: <20230922172449.work.906-kees@kernel.org>
 <202309270854.67756EAC2@keescook>
 <20231002112635.7daf13ef@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002112635.7daf13ef@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Oct 02, 2023 at 11:26:35AM -0700, Jakub Kicinski wrote:
> On Wed, 27 Sep 2023 08:57:36 -0700 Kees Cook wrote:
> > > Since the element count member must be set before accessing the annotated
> > > flexible array member, some patches also move the member's initialization
> > > earlier. (These are noted in the individual patches.)  
> > 
> > Hi, just checking on this batch of changes. Is it possible to take the
> > 1-13 subset:
> 
> On it, sorry for the delay.

No worries; thanks for grabbing them!

-- 
Kees Cook
