Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8740282914
	for <lists+linux-parisc@lfdr.de>; Sun,  4 Oct 2020 07:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgJDF3q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 4 Oct 2020 01:29:46 -0400
Received: from mout.gmx.net ([212.227.15.18]:55553 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgJDF3p (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 4 Oct 2020 01:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601789374;
        bh=aBFWh6BnZSGpnvPFKk7fL4mOtsl+hXD9eDo/xpL3VWw=;
        h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
        b=OLRFv8JVoUnEp0w6MbMrDoHqpCZG3vMk6Dg0Kogy5pcrKTUWAMMXIDawZLZSWNXpE
         AJpVXmN7TaJSwEqxDzSjY9hZViuiYQJ6Jgb9ti7daCvKzHIX+da8gYCkS6kSwi5u+/
         kPXSLz8aKG3GnhH1HCBmlMI1n5wXcRJXh0bSKjdY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.203]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzf6-1jz4041Tve-00R13v; Sun, 04
 Oct 2020 07:29:34 +0200
Subject: Re: Page tables on machines with >2GB RAM
To:     Matthew Wilcox <willy@infradead.org>
References: <20200929153316.GG20115@casper.infradead.org>
 <20200929170130.GA21889@casper.infradead.org>
 <ec43d0b5-a40b-28d4-4a31-3c841cd89820@bell.net>
 <20200929181427.GI20115@casper.infradead.org>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <954ff0a3-bdc6-9b1e-9603-f7e58456cd95@gmx.de>
Date:   Sun, 4 Oct 2020 07:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200929181427.GI20115@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tsp+0Y0HxE+JgkQHwE4Ttd3fHwOazdn7+24UlXsKCYiPZqtgYlt
 dBT4VFFkcyyG5q0Xyjjqz9d58w4bJY+wKARPajXWsWLjhY4JlhpG6o1byObKMcH+Q7NR1YU
 CCWPwEGotU5hCcIHKSdtG/WZsSf5NLXHI1avsQ4WrbZwLdmCgg8JAB5F228WgrEmqW+0JeV
 863/wRHHXzgyu150sVwFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:18+wDnW/pz8=:anUZmNzzlCoO3o3UF/f//+
 MwA1xDICn6CEJ0zf0kHtqdWGXbESaJ4L7d3/WpQITdcj9LOo4Bz83xjlskj+2stXUNyz+nKlJ
 erfcCcEdxi60QQ10iMg/ZhkwwJ04WOtId+zo5hyHkVL5v47nbQYZGybSR4YKl4wrawZAeau9S
 GZ0Lyd4lOXTC0lWBhNe7HmhbHG1AR5ANTMfh/Fxt6jEYfUipqXYYhyWbheZ6ihTFpeIGR9SzO
 nHjhVZ+jdboWv93PEPer6lVI4hjDsuqLWZ9J3AQwsZkM7FnF5yyFbdEV7/2VPEHYz+Bhr+Nso
 aeMUUYoHYqyUhFxFlGMUivpU/VaehBvoMEf5zhYgRA1H98uDJkTx2e2b6MQ+6nsLdzIiGSBOb
 lurPydEO4WnuBlYPzgaQzmXC2892LxmjWwlxJ3BV0wkHvKL2ix5ebC7YU+1GpIQb+KWunasJZ
 +21eTp16EgSufTK1necPPrtVGwKkv38ebl1IiDXs8Gs566Hz7LYAc5Q1KZm3twimYzgAql25H
 5IrI0nu2bejPQNjSJMy5d0wC8wwJc7EEw6VyaXnf97KRnO9eawz8cg+DnvS3DXOeVUxynmmOQ
 thZR7oRdpsQ7wsOBqNmEjg4fyozR3AD4yBcdkdTZuMUepN7EkdjfVuAk9e0PeyRSHE3alGF4V
 Em5Aj3uz/MDSZbtzh+APQdBfwwGMWQIRdWB7d4a6WGtPAf1CvS4H72ZgEUsPJvObWG8T6v0Gc
 Sdyn9SGkORdnlsMTRYPtgBdl4/xW1ypXh+5VQTBRg8qA3V06XXYvU4SoxZrVTadbwYao3JhJK
 AUOpWG6/yqYNxMARVRyzlxFlxqi+TiRkgmvIOhfLRoqnYr3FCfXSzouCjocTe8yMDAuN2Dj7w
 4BZCDyzFEfEUkAFVyOn5hIpH4slX8fdyZ92d8QUQy0IJEj0QR837E6c32kuEIIumSgArCo2ne
 D58vVQhcJ2fOV8O0i+F6BJxav61XgX32xDLMUpIg2pTs8OFGZZX9/RpZ/8I1eZpEhraQgtIXx
 H45jPmHrRzP38rSb0ekInHV9jQrXypHE5QPicK/fZJsvcWdVNC8XNzqdaAZ4/05rcLqf3Uja5
 Jwxyg2q5q8xOoVAG8+jqgz07DVP7GzfgD3ZjVzSOg2Fi/Cmq6F1wEEpHeWSnomcDdjhv5LM90
 IjT8o/csNppPuVPmv1/5Jd1CgyWdH4UAs8ktVHPA48g7dV1I5tBBIvtdFWrSYdOvOxcarZze2
 BWVz1nDkiOOnph4Av
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/29/20 8:14 PM, Matthew Wilcox wrote:
> On Tue, Sep 29, 2020 at 01:26:29PM -0400, John David Anglin wrote:
>> On 2020-09-29 1:01 p.m., Matthew Wilcox wrote:
>>> On Tue, Sep 29, 2020 at 04:33:16PM +0100, Matthew Wilcox wrote:
>>>> I think we can end up truncating a PMD or PGD entry (I get confused
>>>> easily about levels of the page tables; bear with me)
>>>>
>>>> /* NOTE: even on 64 bits, these entries are __u32 because we allocate
>>>>  * the pmd and pgd in ZONE_DMA (i.e. under 4GB) */
>>>> typedef struct { __u32 pgd; } pgd_t;
>>>> ...
>>>> typedef struct { __u32 pmd; } pmd_t;
>>>>
>>>> ...
>>>>
>>>>         pgd_t *pgd =3D (pgd_t *)__get_free_pages(GFP_KERNEL,
>>>>                                                PGD_ALLOC_ORDER);
>>>> ...
>>>>         return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDE=
R);
>>>>
>>>> so if we have more than 2GB of RAM, we can allocate a page with the t=
op
>>>> bit set, which we interpret to mean PAGE_PRESENT in the TLB miss hand=
ler
>>>> and mask it off, causing us to load the wrong page for the next level
>>>> of the page table walk.
>>>>
>>>> Have I missed something?
>>> Yes, yes I have.
>>>
>>> We store the PFN, not the physical address.  So we have 28 bits for
>>> storing the PFN and 4 bits for the PxD bits, supporting 28 + 12 =3D 40=
 bits
>>> (1TB) of physical address space.
>> The comment in pgalloc.h says 8TB?=C2=A0 I think improving the descript=
ion as to how this works
>> would be welcome.
>
> It's talking about 8TB of virtual address space.  But I think it's wrong=
.
> On 64-bit,
>
> Each PTE defines a 4kB region of address space (ie one page).
> Each PMD is a 4kB allocation with 8-byte entries, so covers 512 * 4kB =
=3D 2MB

No, PMD is 4kb allocation with 4-byte entries, so covers 1024 * 4kb =3D 4M=
B
We always us 4-byte entries, for 32- and 64-bit kernels.

> Each PGD is an 8kB allocation with 4-byte entries, so covers 2048 * 2M =
=3D 4GB

No. each PGD is a 4kb allocation with 4-byte entries. so covers 1024 * 4MB=
 =3D 4GB
Still, my calculation ends up with 4GB, like yours.

> The top-level allocation is a 32kB allocation, but the first 8kB is used
> for the first PGD, so it covers 24kB / 4 bytes * 4GB =3D 24TB.

size of PGD (swapper_pg_dir) is 8k, so we have 8k / 4 bytes * 4GB =3D 8 TB
virtual address space.

At boot we want to map (1 << KERNEL_INITIAL_ORDER) pages (=3D64MB on 64bit=
 kernel)
and for this pmd0 gets pre-allocated with 8k size, and pg0 with 132k to
simplify the filling the initial page tables - but that's not relevant for
the calculations above.

> I think the top level allocation was supposed to be an order-2 allocatio=
n,
> which would be an 8TB address space, but it's order-3.
>
> There's a lot of commentary which disagrees with the code.  For example,
>
> #define PMD_ORDER       1 /* Number of pages per pmd */
> That's just not true; an order-1 allocation is 2 pages, not 1.

Yes, that should be fixed up.

Helge
