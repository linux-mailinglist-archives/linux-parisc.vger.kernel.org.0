Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0333842B840
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Oct 2021 09:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbhJMHDE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 Oct 2021 03:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhJMHDD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 Oct 2021 03:03:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A19C061746
        for <linux-parisc@vger.kernel.org>; Wed, 13 Oct 2021 00:01:00 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id pf6-20020a17090b1d8600b0019fa884ab85so3676680pjb.5
        for <linux-parisc@vger.kernel.org>; Wed, 13 Oct 2021 00:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=InasTA07olrN5RKyUCQ2QLJqu4RTKKj+4k1NAdmmjBE=;
        b=ZW1dzqTr/trhkOlzXVsWQL586M19ht5k71pAxPY8mwIv8HZ5vMO/WakCDu3Hq5RvP2
         S4kwqQ46jwWgJmegTf1B7gmFx7ZY3FN7syR3QnvQaQXNPAkDoJZz1tg9c19yZdRE/ygR
         QKkc9RMEzFZzxIH9XcekZAMGkMKRcOFulbggU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=InasTA07olrN5RKyUCQ2QLJqu4RTKKj+4k1NAdmmjBE=;
        b=7W4tbRN9FxI/PYdQA0LLangr/lhkHLvLd9u3k2ho5DPnELjT2G4wTp7KU+xSi0Rt7H
         Bde8tDkmKjSNcMJOLVsdigxullqGouy0tfBMu5sKALq/U+zRnFGD6W44uZDNCJ7I+/8L
         9QffnMkQ9vgwxh+Ru9Y0mYh2cncbuQQpOmpxccMuF86XfuTiPhwz2LmYPx/0sTmYg1x+
         ovyGrBKN8aRxnsl6uCaNOQWgg2/cBTjmiGvGBAG1/dykkGzKJukenqnw7dY0uPeHKjG7
         SM1EzdRPzZpx+Pz6dnGbDRH28gZwNZD+oB04MxcCa5Ytg8kPMkNDVUYRx/N1htbPvqCc
         DSEQ==
X-Gm-Message-State: AOAM532A1adOBncd/oi1GRHGmBfeokOMTwD470ChQLY6cxEt9lv3MbMM
        kKsZnL2ouQspehPxgfyNJgJeaw==
X-Google-Smtp-Source: ABdhPJy2g6jssV8McfoxTEnq7XQUmrF0dkkPaUlbhWhS4b/L/PDtLrRFbojWVXZaR7ZIvk9TuZJ6mw==
X-Received: by 2002:a17:90a:5d11:: with SMTP id s17mr11474193pji.230.1634108459798;
        Wed, 13 Oct 2021 00:00:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m22sm13288608pfo.176.2021.10.13.00.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 00:00:59 -0700 (PDT)
Date:   Wed, 13 Oct 2021 00:00:58 -0700
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
Subject: Re: [PATCH v1 04/10] asm-generic: Use
 HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR to define associated stubs
Message-ID: <202110122359.E59B90A@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <8db2a3ca2b26a8325c671baa3e0492914597f079.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8db2a3ca2b26a8325c671baa3e0492914597f079.1633964380.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Oct 11, 2021 at 05:25:31PM +0200, Christophe Leroy wrote:
> Use HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR instead of 'dereference_function_descriptor'
> to know whether arch has function descriptors.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I'd mention the intentionally-empty #if/#else in the commit log, as I,
like Helge, mentally tripped over it in the review. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
