Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 042332C9EB8
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Dec 2020 11:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729654AbgLAKFw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 1 Dec 2020 05:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgLAKFv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 1 Dec 2020 05:05:51 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207DCC0613D3
        for <linux-parisc@vger.kernel.org>; Tue,  1 Dec 2020 02:05:11 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id k10so1922770wmi.3
        for <linux-parisc@vger.kernel.org>; Tue, 01 Dec 2020 02:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=14bf6bn+oj8PMyR0sJXDa7vt6hfR/TzFTELJbHUC7s0=;
        b=FjLGvvbX1fS+Lzs7Jouwk4Xu5zby+fhb4SU9TD2AE3FCHm8BPNZ/4cQd8SjrL4teyO
         pIrlUihpdldsh6VzuqjFbQapRtHM/oN3isKB/EtTzfLNwGUKynKjH85fbuEntqzz9l/M
         zF/SRCOBE4zD/aC/w5Xthj9RhPGPgnmrL1Rz6FLJ5TDvxvdmNo6KDHxdQhrfzeBvtEDD
         7j2t4XSgW0acxS83X/ur3/Z7Yiq1aV+ISZfBRWfznhvkhv84rEvGPp6dBSgEpeJDwi6p
         32U1wPJILW50xkF1pYoC8QGnRQPruXD1wlIYhAik+Nvz7XfPhgPfeX4tn2phCkRisXbC
         h/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=14bf6bn+oj8PMyR0sJXDa7vt6hfR/TzFTELJbHUC7s0=;
        b=mQbUnlVBr0F4V6PsY1H/XjI3+kQP99CX8Di8CQaFVCk+al1IHfSK3ZGPPt4deQooTn
         uroC15PXyAC9op1+5N4r5uCu7VFhoP55jf6JJbjkbkFPOPA4PeyTA++sJWhNMeULtq07
         QhR3zV0SBIgi/rBieJnrXwOUXZPiW0g5TAiKvUeBOWK68LNtwnDmcWug0ks612/TDcO0
         cmbVKUcveJhcUis1FMTW2aXuNebnsdUytHy82vd2zPkKAVErro4cAfXL8/SyVFE0qw17
         1uCvHX1kruE2p7w4gyGL1XluEn4lTjfTDt/JAEZ7DRJBSpvDuxL7c+URgEpgZMbKYZfa
         y51Q==
X-Gm-Message-State: AOAM533H954P7ixe4+P38cpN3HRbZ0GXkwWJpLkB/Nltv9BfKaT+Ryez
        9ZPqERQlo2D5FjAb0hJyLK1RWg==
X-Google-Smtp-Source: ABdhPJxZXrE0bS930s4kHxmTujcKxrLUp8mkRl/hRPu1hEArkUtvSLrw9l0edI4pIsEcorzqGoW98g==
X-Received: by 2002:a05:600c:255:: with SMTP id 21mr1914111wmj.69.1606817109823;
        Tue, 01 Dec 2020 02:05:09 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id p11sm2348078wrj.14.2020.12.01.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 02:05:07 -0800 (PST)
Date:   Tue, 1 Dec 2020 10:05:05 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Cc:     linux@armlinux.org.uk, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        tony@atomide.com, mripard@kernel.org, wens@csie.org,
        jernej.skrabec@siol.net, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, lee.jones@linaro.org, sam@ravnborg.org,
        emil.l.velikov@gmail.com, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201201100505.xsocmjf6tmxu4uon@holly.lan>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Nov 30, 2020 at 03:21:32PM +0000, Andrey Zhizhikin wrote:
> Since the removal of generic_bl driver from the source tree in commit
> 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") BACKLIGHT_GENERIC config option became obsolete as well and
> therefore subject to clean-up from all configuration files.
> 
> This series introduces patches to address this removal, separated by
> architectures in the kernel tree.
> 
> Andrey Zhizhikin (5):
>   ARM: configs: drop unused BACKLIGHT_GENERIC option
>   arm64: defconfig: drop unused BACKLIGHT_GENERIC option
>   MIPS: configs: drop unused BACKLIGHT_GENERIC option
>   parisc: configs: drop unused BACKLIGHT_GENERIC option
>   powerpc/configs: drop unused BACKLIGHT_GENERIC option

Whole series:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
