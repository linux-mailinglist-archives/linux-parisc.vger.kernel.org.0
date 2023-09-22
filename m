Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD037AAE4B
	for <lists+linux-parisc@lfdr.de>; Fri, 22 Sep 2023 11:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbjIVJiF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 22 Sep 2023 05:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbjIVJiE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 22 Sep 2023 05:38:04 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 71EA318F;
        Fri, 22 Sep 2023 02:37:58 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8769DA7;
        Fri, 22 Sep 2023 02:38:34 -0700 (PDT)
Received: from [10.57.65.11] (unknown [10.57.65.11])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A97B3F5A1;
        Fri, 22 Sep 2023 02:37:53 -0700 (PDT)
Message-ID: <806eceac-8f97-403d-bee7-4fbc9e75e872@arm.com>
Date:   Fri, 22 Sep 2023 10:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] powerpc: hugetlb: Convert set_huge_pte_at() to
 take vma
Content-Language: en-GB
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <muchun.song@linux.dev>,
        SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Peter Xu <peterx@redhat.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-3-ryan.roberts@arm.com>
 <0f2dd31a-a361-24ba-154d-4e614c0eff73@csgroup.eu>
 <597e7496-ef99-4505-88ee-91701af02835@arm.com>
 <5ee382da-0ed0-9fb1-7640-35ef77c195fc@csgroup.eu>
 <871d277e-6c4e-418a-9574-2e9117646ca2@arm.com>
 <1cc4d995-efeb-9d15-446f-475e63154a2d@csgroup.eu>
From:   Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <1cc4d995-efeb-9d15-446f-475e63154a2d@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 22/09/2023 10:14, Christophe Leroy wrote:
> 
> 
> Le 22/09/2023 à 10:41, Ryan Roberts a écrit :
>> On 22/09/2023 09:10, Christophe Leroy wrote:
>>>
>>>
>>>> I'm happy to take your proposed approach if that's your preference. Another
>>>> option is to use a dummy VMA, as I have done in the core code, for the one call
>>>> site that calls set_huge_pte_at() with init_mm:
>>>>
>>>> struct vm_area_struct vma = TLB_FLUSH_VMA(&init_mm, 0);
>>>>
>>>> This is an existing macro that creates a dummy vma with vma->vm_mm filled in.
>>>> Then I pass &vma to the function.
>>>
>>> I don't like that, I prefer the solution I proposed. We already have a
>>> couple places where powerpc do things based on whether vma is NULL or not.
>>>
>>>>
>>>> Or yet another option would be to keep the mm param as is in set_huge_pte_at(),
>>>> and add a size param to the function. But then all call sites have the burden of
>>>> figuring out the size of the huge pte (although I think most know already).
>>>
>>> Indeed.
>>>
>>> arch_make_huge_pte() used to take a vma until commit 79c1c594f49a
>>> ("mm/hugetlb: change parameters of arch_make_huge_pte()").
>>>
>>> Should we try and have the same approach ? Or is it irrelevant ?
>>
>> See [1]; I'm going to rework to pass mm + size parameter since the current
>> approach will break riscv.
> 
> Can you pass a shift parameter instead of a size, like 
> arch_make_huge_pte() ? As far as I remember it is easier to handle a 
> shift than a size.

Most of the call sites already have the size, not the shift. And arm64 needs the
size, so it would have do (1UL << shift). So on that basis, I prefer to pass
size. huge_pte_clear() already passes long unsigned sz, so I'd rather follow
that pattern.

> 
> Christophe

