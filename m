Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8DD04B71C4
	for <lists+linux-parisc@lfdr.de>; Tue, 15 Feb 2022 17:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241292AbiBOQHM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 15 Feb 2022 11:07:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbiBOQHL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 15 Feb 2022 11:07:11 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19D61B6
        for <linux-parisc@vger.kernel.org>; Tue, 15 Feb 2022 08:07:00 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id y18so13414315plb.11
        for <linux-parisc@vger.kernel.org>; Tue, 15 Feb 2022 08:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vyO09UbxJeRvoJPXaZeuEPEmDAtin+d+KKe2VrtUaUo=;
        b=k6dGMBXjj16JgvtRS/W1l6Q4I2nZDtQcAdycCp9Yomvd6JZnH2zqPlxIg+g+ZPVwSz
         Yd2M1LVjLDjA37krskwjCpbidnONcAVHIcSbAjYLFVZbM5iGekAEKyRZZ7xCywxW3nBM
         4HP4E451gdn725+Vgz91Q6TCzCawlBmVlldfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vyO09UbxJeRvoJPXaZeuEPEmDAtin+d+KKe2VrtUaUo=;
        b=UFU/sfkOnHvjmvhBiXv4bzq2wJf+IhNIB1SNimLvES7zk+D3gAqh/AXLxB+e7tISdi
         Q2GcGs9yvL6ZfqyOeTboNsZS3/5gTVx1/k28BkogR4OqXsTYNeOJKlTEjpTZpfS+wfr9
         HOvLfked86zwsW0wZJE0pKevPYNiPZQKDemuqcJM55uw0Qqn6TBz1DWXF2LM55eo27ie
         cmmz05WAS6EQKze5VwzAoYN2N/TQOT5YWA5L7atx+N1O+wCLnKrxQ5sTaG6go+39yjjS
         jecw9sCDuR7hyPixuHASmJgxRT1bOnBHxn0W79LDyG77udjS0/G72KCDfM1UfOpPj0+l
         DNrQ==
X-Gm-Message-State: AOAM532ltvH3SyPzr5+fI8HUND2NtMHJdordI9z+5hpA7hOtCUc4WsL4
        OK3b5YrvFkj8BKlaL+MMfpwviQ==
X-Google-Smtp-Source: ABdhPJySTpQ67R+nuQyJJfrGZTBLhUE5/ijHpxyRKCqjoqAnDBf2qQYFgmJer9uiO3sFYsKqwhcw6g==
X-Received: by 2002:a17:902:cec5:: with SMTP id d5mr4782522plg.96.1644941220276;
        Tue, 15 Feb 2022 08:07:00 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i17sm3101014pgv.8.2022.02.15.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 08:06:59 -0800 (PST)
Date:   Tue, 15 Feb 2022 08:06:59 -0800
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
Subject: Re: [PATCH v4 01/13] powerpc: Fix 'sparse' checking on PPC64le
Message-ID: <202202150806.66CC906@keescook>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
 <ac1312f2451aa558bb2a8806b4d0aa2020f0c176.1644928018.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac1312f2451aa558bb2a8806b4d0aa2020f0c176.1644928018.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Feb 15, 2022 at 01:40:56PM +0100, Christophe Leroy wrote:
> 'sparse' is architecture agnostic and knows nothing about ELF ABI
> version.
> 
> Just like it gets arch and powerpc type and endian from Makefile,
> it also need to get _CALL_ELF from there, otherwise it won't set
> PPC64_ELF_ABI_v2 macro for PPC64le and won't check the correct code.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
