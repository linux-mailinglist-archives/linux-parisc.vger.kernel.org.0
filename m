Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2C947678BD
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Jul 2023 00:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbjG1W5t (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 28 Jul 2023 18:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjG1W5t (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 28 Jul 2023 18:57:49 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED97E100
        for <linux-parisc@vger.kernel.org>; Fri, 28 Jul 2023 15:57:47 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bbd03cb7c1so16960525ad.3
        for <linux-parisc@vger.kernel.org>; Fri, 28 Jul 2023 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690585067; x=1691189867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OqGEzOR5r6kH79o9SwA25U8njOcawYVrofop3YQ6YUY=;
        b=fiGthZSlKO+TzVRMFQ/lllIkD1Hxo0n//085ngVGHX+MFVacNMT3jIfwGlotRfqjgi
         7/P2vA/h8L+veUta3UBM+pWIrJvHr/5k6/Rjn4abuIqxwd7smLlUVI8+sxAVHHkqY9Dm
         ClG4EhRzY0307ShUnA4g6h5b+AA+GZOvaUXcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690585067; x=1691189867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqGEzOR5r6kH79o9SwA25U8njOcawYVrofop3YQ6YUY=;
        b=hp8qa1EMP7ZnDp0n7r5KWqMYZmO52Yi6HdOOvnPtW3Q6m7kc1tPeeBekowLO6quH4m
         /PDiNwIStM+6j2/JNoV8z0FKGS+/ZVB9WuKGYcQ/3S5OEguqg9Iz80mOt/buKhyN1wLv
         w2K9vfH2kYAbiaxDuZlJY9oEdv8QJS9Y9UP+qwu+K1vIal3nmoleSKuiT7fW/dgSI7uF
         j0GUV483JMj/ufF+3ygEF/HeM3MiYHkTJreVNfKggoC1lWas6Nwwi2iwOMaNFUoIsKXx
         ttdTFCiMW2alVh6aV2vGMqibJE1T4VhyqNFYvJL2DwmHQBP+LuYg/rPKp9r+fIp6AZhs
         d7DQ==
X-Gm-Message-State: ABy/qLZEwrjHYuko7Uts7ApAS9uwW5UJpZesV2gQLJurCcrE2tQFJbeY
        rnrihthDdXK2+IhPVVZKlTOtZQ==
X-Google-Smtp-Source: APBJJlFOw6OVfT4p2CaNm9atJ1j4OmKSy9hELnlIdDyAntpjKQSdNnE2D3nHAe//JnmbkZEc3Ervlw==
X-Received: by 2002:a17:902:c405:b0:1bb:a85f:4645 with SMTP id k5-20020a170902c40500b001bba85f4645mr3324239plk.15.1690585067446;
        Fri, 28 Jul 2023 15:57:47 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902eac400b001bb9b87ac95sm4082927pld.103.2023.07.28.15.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 15:57:46 -0700 (PDT)
Date:   Fri, 28 Jul 2023 15:57:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.5-rc3
Message-ID: <202307281551.D894AA39@keescook>
References: <CAHk-=wi4Yau-3Bsv2rXYmtXMTLaj3=Wyf4cdM6d89czFvkVsRQ@mail.gmail.com>
 <20230724122626.1701631-1-geert@linux-m68k.org>
 <88f83d73-781d-bdc-126-aa629cb368c@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88f83d73-781d-bdc-126-aa629cb368c@linux-m68k.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jul 24, 2023 at 02:43:02PM +0200, Geert Uytterhoeven wrote:
> On Mon, 24 Jul 2023, Geert Uytterhoeven wrote:
> > JFYI, when comparing v6.5-rc3[1] to v6.5-rc2[3], the summaries are:
> >  - build errors: +5/-0
> 
>   + /kisskb/src/include/linux/fortify-string.h: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]:  => 583:25, 493:25
> 
> mips-gcc13/mips-allmodconfig
> 
> Full context:
> 
>     In function 'fortify_memset_chk',
> 	inlined from 'memset_io' at /kisskb/src/arch/mips/include/asm/io.h:486:2,
> 	inlined from 'build_auth_frame' at /kisskb/src/drivers/net/wireless/legacy/ray_cs.c:2697:2:
>     /kisskb/src/include/linux/fortify-string.h:493:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>       493 |                         __write_overflow_field(p_size_field, size);
> 	  |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     In function 'fortify_memcpy_chk',
> 	inlined from 'memcpy_toio' at /kisskb/src/arch/mips/include/asm/io.h:494:2,
> 	inlined from 'translate_frame' at /kisskb/src/drivers/net/wireless/legacy/ray_cs.c:955:3,
> 	inlined from 'ray_hw_xmit.constprop' at /kisskb/src/drivers/net/wireless/legacy/ray_cs.c:912:12:
>     /kisskb/src/include/linux/fortify-string.h:583:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>       583 |                         __write_overflow_field(p_size_field, size);
> 	  |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Single-element flexible array abuse in drivers/net/wireless/legacy/rayctl.h:tx_msg.var

^^^^
is this line from you or is there a tool outputting this? Because, yes,
very true:

struct tx_msg {
    struct tib_structure tib;
    struct phy_header phy;
    struct mac_header mac;
    UCHAR  var[1];
};

I'll send a patch.

-- 
Kees Cook
