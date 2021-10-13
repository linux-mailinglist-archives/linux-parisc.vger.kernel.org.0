Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A7C42B837
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Oct 2021 08:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238095AbhJMHBk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 Oct 2021 03:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbhJMHBi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 Oct 2021 03:01:38 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E110C061570
        for <linux-parisc@vger.kernel.org>; Tue, 12 Oct 2021 23:59:36 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id x8so1152003plv.8
        for <linux-parisc@vger.kernel.org>; Tue, 12 Oct 2021 23:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EtO4v1hmknoQ9CC5pTvq/sjyHsZmxJYafaGuFh9dADA=;
        b=Aj4KOWPH1k1PgbvL+pTY/xACU9Pwn9MUiqpjhM6IVuirnFFqehXtyynR0cRL2JC99T
         X2BS5sniIcL0i7UDJuPo3mr7cogBrx2R6mTJAooH9lgbXGgOBqhKd622U9AX9BlAOHRw
         9KG1Rg/hzG7yZQgql7BR3km2UfZPusbGWwkVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EtO4v1hmknoQ9CC5pTvq/sjyHsZmxJYafaGuFh9dADA=;
        b=S7uH5vElX9d0yHBIA/ChOA+oGe8w4UST79A1CiZMQSVH/gSctMylLGJZOuP8/YhMjf
         W6WhSGvA7CLdqIOExXX5HVsUkRZ59LVi9mBECG9vXEmWPTblaKuaJX1Tbtzwcn4IRJD9
         IrWs8Gryz0LzjcLp+eWzokRFfO105yrDc0CTxNb1K8aT9ugSyth8wmMFlry+ZlZZqvE7
         77xPFzVahyHfYsNzCxFsa1MboRsryb9g74O9pu4Y55EfD7p2hNAL41NF7VP66BN9oxay
         2OWn9CN+CP5wTNwX5AsCYW6dPZjewyoseR9i0MSJin4CQKn5g8WDbfgMP6YACzEcxa1J
         SRww==
X-Gm-Message-State: AOAM532LuOJ/i32kmxhMa0e+hrYMmwbNCUX1b3b4azpRmjLeib5DMb9u
        e4dGFfBlu9PkFzoesAMhWHvQUg==
X-Google-Smtp-Source: ABdhPJyxiDFdmaS1K7BtHQLBKPUYqjjdyZfqGoeYI4TMfzgjIuLL/822k5Q++d2NaSjkZUCum4PHbw==
X-Received: by 2002:a17:90b:2248:: with SMTP id hk8mr11473279pjb.102.1634108375787;
        Tue, 12 Oct 2021 23:59:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m22sm13283364pfo.176.2021.10.12.23.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:59:35 -0700 (PDT)
Date:   Tue, 12 Oct 2021 23:59:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 03/10] ia64: Rename 'ip' to 'addr' in 'struct fdesc'
Message-ID: <202110122359.4FF2BA38@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <a2443adcd006cb8004fe0602e2f8c43c30a7c504.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2443adcd006cb8004fe0602e2f8c43c30a7c504.1633964380.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Oct 11, 2021 at 05:25:30PM +0200, Christophe Leroy wrote:
> There are three architectures with function descriptors, try to
> have common names for the address they contain in order to
> refactor some functions into generic functions later.
> 
> powerpc has 'funcaddr'
> ia64 has 'ip'
> parisc has 'addr'
> 
> Vote for 'addr' and update 'struct fdesc' accordingly.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
