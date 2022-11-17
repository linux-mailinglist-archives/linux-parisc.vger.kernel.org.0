Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5AC62CF9E
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Nov 2022 01:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbiKQAbV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 16 Nov 2022 19:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233859AbiKQAbU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 16 Nov 2022 19:31:20 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986B34D5DD
        for <linux-parisc@vger.kernel.org>; Wed, 16 Nov 2022 16:31:19 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so422438pjd.4
        for <linux-parisc@vger.kernel.org>; Wed, 16 Nov 2022 16:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bfYTHCNCtdWeHJf9pplhisQ2FfqYgZ1s/D8ukZJ0aF0=;
        b=noLKefdE/A5/nbmTvR6mJw3cGxk/a7fIL83IBp5Ph1Sax30+McHCvDQ9202nLf5uce
         hPc2gZOe0LsvudzlGDyBmEAgwDGtCwPT27+S6nCdQzTHR81ueFyHGEG25Bj0t5HJUYw6
         csu11i/pEoPga4S6lvqc8FbzvURZMsHN35+PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfYTHCNCtdWeHJf9pplhisQ2FfqYgZ1s/D8ukZJ0aF0=;
        b=mIo1XWO/p2K8CXG62b1gMS2jl1O2HKiaNhahaOVrplmA09UnwGJIkqlIYrlvB3kPkb
         W5WXilJbOzNTNNqzgqLiRIDLBwuMy/s9Lc/4jdjT4q1D+TjYxeBR0EZ8M+05yePQxey5
         yKUr/5y4Kn94/+Yy+cFhhcFO/k5Xf10ycN+5Ho9uu3mJTExNb5iFDdARMcCqEu1JZvSk
         SKlf+KylkoqYnykGo7yP/p7p3DLWq9Eb+bj3t+fB30lZ6UpRx4igl/tA8kRoqCjvMUrH
         qGY8up/hKVSShL8IPdzXUTUWvhNl7/2q24O+/L6aJsAX3hhxuSp56a9Vrs8zf5oQIIjO
         iG1g==
X-Gm-Message-State: ANoB5pmeW9h1L/6n3xp7dD++PMH+8Zp9/6vMsZaYG3bHGbaCLsvyY+bi
        c8Gb87+2mZDuwv/T2hv5PGaieg==
X-Google-Smtp-Source: AA0mqf5LCeBMlQYf9iRokqtAPq5JSpm9R+EnXlxq59oA8dqbtgC+he2PCZJy9QgLdGN/YL6SFM4OFA==
X-Received: by 2002:a17:90a:6949:b0:213:188c:158d with SMTP id j9-20020a17090a694900b00213188c158dmr343097pjm.11.1668645079035;
        Wed, 16 Nov 2022 16:31:19 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902ea0100b00174f61a7d09sm12946657plg.247.2022.11.16.16.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:31:18 -0800 (PST)
Date:   Wed, 16 Nov 2022 16:31:18 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Christoph =?iso-8859-1?Q?B=F6hmwalder?= 
        <christoph.boehmwalder@linbit.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Theodore Ts'o <tytso@mit.edu>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        "Darrick J . Wong" <djwong@kernel.org>,
        SeongJae Park <sj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Helge Deller <deller@gmx.de>, netdev@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-block@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mmc@vger.kernel.org, linux-parisc@vger.kernel.org,
        ydroneaud@opteya.com
Subject: Re: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Message-ID: <202211161628.164F47F@keescook>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com>
 <202211161436.A45AD719A@keescook>
 <Y3V4g8eorwiU++Y3@zx2c4.com>
 <Y3V6QtYMayODVDOk@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3V6QtYMayODVDOk@zx2c4.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Nov 17, 2022 at 01:03:14AM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 17, 2022 at 12:55:47AM +0100, Jason A. Donenfeld wrote:
> > 2) What to call it:
> >    - between I still like, because it mirrors "I'm thinking of a number
> >      between 1 and 10 and..." that everybody knows,
> >    - inclusive I guess works, but it's not a preposition,
> >    - bikeshed color #3?
> 
> - between
> - ranged
> - spanning
> 
> https://www.thefreedictionary.com/List-of-prepositions.htm
> - amid
> 
> Sigh, names.

I think "inclusive" is best. The other words still don't provide
unambiguous language. It's the language used in formal math, e.g.
sigma-notation, etc. It's an adjective for "get random" (verb, noun).

-- 
Kees Cook
