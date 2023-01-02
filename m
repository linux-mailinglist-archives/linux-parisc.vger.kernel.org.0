Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 408A565B360
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Jan 2023 15:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbjABOfs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 2 Jan 2023 09:35:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236217AbjABOfs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 2 Jan 2023 09:35:48 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D20565A6
        for <linux-parisc@vger.kernel.org>; Mon,  2 Jan 2023 06:35:45 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so18497972wms.0
        for <linux-parisc@vger.kernel.org>; Mon, 02 Jan 2023 06:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ixsystems.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJq3TeEMVEa4cxKJPhRTEvU3LME7/v1uYktVvktqpGE=;
        b=giKYD8zRfEz+aTz2PgAOBuReNmF+3ipE0aYhpWrnbzcVWA26vzIqDcD5FLnSINxL+M
         LFgGo5qElo0bKpiGfxDHPVQWCGxhFZKx+3Y/aZn1AWx0/kyJ9opa93mRMDHf0nnNlhvl
         PA3JyflJbfKHZwlrMzULsTWiA8AahjGq9TK5CQj+MwD0qIDt/S2DYL0NF/9yBKPJR6Hd
         LUZq3p6uP6VrHbVutXsxh5dGaQFGXmtNXvhh4pvj+FWdD3tpqULpz+WOHzCQbXHsJhUk
         FzhGm4wbNSJ9Yc+0fC/CyXB2H4rYo1IVLlPto8ymlfhlFf4cIa9LN/tUuQBlArcXvoLX
         RLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJq3TeEMVEa4cxKJPhRTEvU3LME7/v1uYktVvktqpGE=;
        b=YdjlZSGMLkYTa4zYrjm03cajZmJG23bSB3QM4p8ZwWAy14vMo2Z162zEc9RXYnX99F
         bYYm4AUWBwqGv0oG+eIVxjnpoFGG29Q8XDaHWx5eRHhjLy2b+q4l+bfEPfXx4qjKuZTq
         PJZWngMUgE5s1FKRb6MwPwuTsxR97+KI/b+v4VNYRxhqMPMG8ccNyW9IzIwN/VMpUJn5
         ddX0tz58ekSRz1xUStKta2wnTpZ65c3VmxtLoXAK0zZkk3FhOacv5ezz5yrVLD9Ey+b3
         s6h2/c9neKSshLAzNoqUeHxEWJ4TZfB6dXQYuxs0cI4HAOd5AfsCUtipoJrLy9ojzBxo
         2cNw==
X-Gm-Message-State: AFqh2kr6resyoOg8KYdRnFC4xxmVSt1o2KATrZD/PCpk1F8Y+JN80Msq
        2u5xPKd1tuEoeWoGluRzFpeZqA==
X-Google-Smtp-Source: AMrXdXtn/wbjdX4CuagPWVi+PJUie6Oio+Ubkoxzq0YYqAsyUDeIQFycUSYBPWddMHy9yd8ByXRO6Q==
X-Received: by 2002:a05:600c:22d9:b0:3d3:56e6:4f0d with SMTP id 25-20020a05600c22d900b003d356e64f0dmr29637713wmg.7.1672670144202;
        Mon, 02 Jan 2023 06:35:44 -0800 (PST)
Received: from hamza-HP-ZBook-15-G3 ([2400:adc1:158:c700:a835:5821:1f98:828f])
        by smtp.gmail.com with ESMTPSA id e16-20020adfdbd0000000b002362f6fcaf5sm28662666wrj.48.2023.01.02.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 06:35:43 -0800 (PST)
Date:   Mon, 2 Jan 2023 19:35:38 +0500
From:   Ameer Hamza <ahamza@ixsystems.com>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
        "jlayton@kernel.org" <jlayton@kernel.org>,
        "chuck.lever@oracle.com" <chuck.lever@oracle.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "guoren@kernel.org" <guoren@kernel.org>,
        "palmer@rivosinc.com" <palmer@rivosinc.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "slark_xiao@163.com" <slark_xiao@163.com>,
        "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
        "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
        "mattst88@gmail.com" <mattst88@gmail.com>,
        "James.Bottomley@HansenPartnership.com" 
        <James.Bottomley@HansenPartnership.com>,
        "deller@gmx.de" <deller@gmx.de>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "awalker@ixsystems.com" <awalker@ixsystems.com>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>
Subject: Re: [PATCH v2] Add new open(2) flag - O_EMPTY_PATH
Message-ID: <20230102143538.GA8886@hamza-HP-ZBook-15-G3>
References: <202212310842.ysbymPHY-lkp@intel.com>
 <20221231235618.117201-1-ahamza@ixsystems.com>
 <4b39cf528148470c934fb5823b35e9d5@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b39cf528148470c934fb5823b35e9d5@AcuMS.aculab.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jan 02, 2023 at 02:01:38PM +0000, David Laight wrote:
> From: Ameer Hamza
> > Sent: 31 December 2022 23:56
> > 
> > This patch adds a new flag O_EMPTY_PATH that allows openat and open
> > system calls to open a file referenced by fd if the path is empty,
> > and it is very similar to the FreeBSD O_EMPTY_PATH flag. This can be
> > beneficial in some cases since it would avoid having to grant /proc
> > access to things like samba containers for reopening files to change
> > flags in a race-free way.
> > 
> 
> But what does it do?
> (Apart from add code to a common kernel code path.)
> 
> 	David
It can convert an O_PATH descriptor to one suitable for r/w work.
If we already have a file descriptor: {opath_fd = open(&lt;path&gt;, O_PATH);}, we can call {openat(opath_fd, "", O_EMPTY_PATH | O_RDWR)} instead of going through procfs {open(/proc/self/fd/&lt;opath_fd&gt;, O_RDWR)}.
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
