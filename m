Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E5D54F2D7
	for <lists+linux-parisc@lfdr.de>; Fri, 17 Jun 2022 10:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380972AbiFQI0a (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 17 Jun 2022 04:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380962AbiFQI03 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 17 Jun 2022 04:26:29 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A2168990
        for <linux-parisc@vger.kernel.org>; Fri, 17 Jun 2022 01:26:28 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 73-20020a17090a0fcf00b001eaee69f600so3561682pjz.1
        for <linux-parisc@vger.kernel.org>; Fri, 17 Jun 2022 01:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yr0ixUanPwolWpl8lCaQhXzB90rLEzIJZVwDXXKPA0U=;
        b=T0JCgWDTB1C2DISDgdZ4UDVFOWnRp2zy2MnmauLXScjZ1nAwZFhugPqk7LJHr/ZqYR
         gS7AQ2LY7MCi12zojIG7f8Ph+i4IbqU+gY2wftHcxhfe5I/JxipjHT9G+VpC1zh5K6vU
         duBUQkQeO+lYH2S0APPy5npNumr73wIpqlOnbbnKsqaOmmaPmmMnefSyRGqfn72oeVHY
         4XT/louGb1lBLYbfoesSgG/+I51syqllEu+lF2uvmS6543R3TVlllAbeuSojS2oaZNiz
         0vsqAzWz7egUsoU66blaHOD0ko2YmWG/bFdUR0JWK3PFEfpAyeZtKbMvGonQ25pbr7g8
         /rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yr0ixUanPwolWpl8lCaQhXzB90rLEzIJZVwDXXKPA0U=;
        b=WsnJBPRDPAaMVFOK6omsVC6LkQu//Pbk/LhZsA5c11GuOqxzM4CqLclfc4JqUCPs42
         PPp/pvR03JsDjfk+DqTgjwhjp4hIW3zJQdp2LQPbY5TJ9VyIZ+Ty8IFQNvsU2tRLoW4h
         5MNrEm096WgtTxYnmjyH/SqsncTwHvs+gfB4ZbhaTK11kJe+17Wea0WNvCa4bvtyG18B
         iY+nDhd1nWLJz9Mzn0cCzrhqfeeAPGWYsQ47+3MoYwAyK165+w85HiEguYJaIWl+He2h
         PtFy9biD06wFjJlUr3Vav9Bjj5q30wWAsMxs03y3e2gyeRgJV9jm2y1C3OsRaCDtTi9h
         IKjQ==
X-Gm-Message-State: AJIora8EI7aL/xvoHiRyiWQoM+KmFlzwg1kPwTf5PRwm3A2tp8+EOSrJ
        z9pQVS3qiEkpaasv7onCgU0wYw==
X-Google-Smtp-Source: AGRyM1t5yEL1BPz7y9ug30F37C0ubzhxM59TWM8YWNbgEGd6O1gO2tufJo02mvgvoeRwcOdvYuG/tA==
X-Received: by 2002:a17:903:22cb:b0:167:992f:60c3 with SMTP id y11-20020a17090322cb00b00167992f60c3mr8629830plg.59.1655454387624;
        Fri, 17 Jun 2022 01:26:27 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902cf0c00b001677fa34a07sm2974542plg.43.2022.06.17.01.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 01:26:27 -0700 (PDT)
Date:   Fri, 17 Jun 2022 16:26:23 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Michal Hocko <mhocko@suse.com>, Peter Xu <peterx@redhat.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        James Houghton <jthoughton@google.com>,
        Mina Almasry <almasrymina@google.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        catalin.marinas@arm.com, will@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/4] arm64/hugetlb: Implement arm64 specific
 hugetlb_mask_last_page
Message-ID: <Yqw6r0/r34sZdrsk@FVFYT0MHHV2J.usts.net>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
 <20220616210518.125287-3-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616210518.125287-3-mike.kravetz@oracle.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Jun 16, 2022 at 02:05:16PM -0700, Mike Kravetz wrote:
> From: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> The HugeTLB address ranges are linearly scanned during fork, unmap and
> remap operations, and the linear scan can skip to the end of range mapped
> by the page table page if hitting a non-present entry, which can help
> to speed linear scanning of the HugeTLB address ranges.
> 
> So hugetlb_mask_last_page() is introduced to help to update the address in
> the loop of HugeTLB linear scanning with getting the last huge page mapped
> by the associated page table page[1], when a non-present entry is encountered.
> 
> Considering ARM64 specific cont-pte/pmd size HugeTLB, this patch implemented
> an ARM64 specific hugetlb_mask_last_page() to help this case.
> 
> [1] https://lore.kernel.org/linux-mm/20220527225849.284839-1-mike.kravetz@oracle.com/
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Acked-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
