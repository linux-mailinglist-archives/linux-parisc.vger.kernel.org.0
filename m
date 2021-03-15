Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01AA233B275
	for <lists+linux-parisc@lfdr.de>; Mon, 15 Mar 2021 13:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhCOMWi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 15 Mar 2021 08:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhCOMWM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Mar 2021 08:22:12 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8FBC061765
        for <linux-parisc@vger.kernel.org>; Mon, 15 Mar 2021 05:22:11 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a1so15928847ljp.2
        for <linux-parisc@vger.kernel.org>; Mon, 15 Mar 2021 05:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NTc0pSC6ULv7Oqo3W3BMnNj1V6ogGKFoV43UcdG1gw0=;
        b=pj9oJ7H41ug5yJ5S6H0nmrDTorRFP5qpfgv8i0hsLgLSj6j5PjG4r6CtBYKYzFwGQ7
         qUwbmG/8/o72CrhYOuy1punTJ8eK8uXtrdScLOXhZqHigyzjZUkihsGUq4xZefGGdJyJ
         275Qs7hRExo2D1+cRyIGrQJ6i4ctnY1t01+0PJ6CKUa2AlaACxmAEx0k8rYtovkkg4lP
         l1xe1r6L8Z9HbZcmF3rYR+SPpPKz6i2+3Ny1STnPMThtmy5e0onayZVYWo+QbcgfkMHc
         xxoSTqoI9G0vymB+Dbv7E8Hbo2tjTUaTbVKY7ml8UnFXGPXy5tYMAX1HVhaerXR5DKSJ
         d5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NTc0pSC6ULv7Oqo3W3BMnNj1V6ogGKFoV43UcdG1gw0=;
        b=PdM7uRK4742r4Cgz8Upm1BD/DPehxpVBCvqMPfufzAMCVpe2ffln0n+iKtXi6HISb9
         tyviyxFcnXwL1TbNJHbkeky+hP3ImieP47gV7wv9upUEiqwFwwSf//NyMQMP2Te5MkDN
         d8XQc/U7bvUS5k131Ja81nKEmAXdzGMDNiQXKEZNHksRb4NDncYQy9hdQV1DMPkCpT+p
         +RQzOgsOQpI93zYPXRk91S2lGqAo1fB7B2Ii+TfaK2Y/SI8sUhGcwPERf5XXuKeNFfhY
         jBOB17va807RN8VlJAXadSQLNCe0Jphfyizm/GGLvpZwRy/gV6DWqPmIK9Mu0mShukcO
         ggyw==
X-Gm-Message-State: AOAM530TBYMMVAmHLSvrFtzqmwU1vylA2VaH1zSbCTggQ/gueRR2phwN
        RETWwawl/wk65lK8T6tyqu2HpA==
X-Google-Smtp-Source: ABdhPJzu4p8O5vMCnNYyq9XJrAyKlX9q99oPAsslS1Z6FvBBad1lCG5p6v0yCrHOhq3WAkMZ4COeEA==
X-Received: by 2002:a2e:998d:: with SMTP id w13mr10078959lji.424.1615810929909;
        Mon, 15 Mar 2021 05:22:09 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id f8sm2688995lfs.143.2021.03.15.05.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:22:09 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 9FE7010246E; Mon, 15 Mar 2021 15:22:13 +0300 (+03)
Date:   Mon, 15 Mar 2021 15:22:13 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dave Hansen <dave.hansen@intel.com>,
        Hugh Dickins <hughd@google.com>,
        Rik van Riel <riel@surriel.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Peter Xu <peterx@redhat.com>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org, Linux API <linux-api@vger.kernel.org>
Subject: Re: [PATCH RFCv2] mm/madvise: introduce MADV_POPULATE_(READ|WRITE)
 to prefault/prealloc memory
Message-ID: <20210315122213.k52wtlbbhsw42pks@box>
References: <20210308164520.18323-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308164520.18323-1-david@redhat.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Mar 08, 2021 at 05:45:20PM +0100, David Hildenbrand wrote:
> +			case -EHWPOISON: /* Skip over any poisoned pages. */
> +				start += PAGE_SIZE;
> +				continue;

Why is it good approach? It's not abvious to me.

-- 
 Kirill A. Shutemov
