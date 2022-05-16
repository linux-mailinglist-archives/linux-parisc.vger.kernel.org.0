Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0965292DC
	for <lists+linux-parisc@lfdr.de>; Mon, 16 May 2022 23:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346692AbiEPV2U (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 May 2022 17:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbiEPV2U (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 May 2022 17:28:20 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556D03ED2A
        for <linux-parisc@vger.kernel.org>; Mon, 16 May 2022 14:28:18 -0700 (PDT)
Received: (qmail 6569 invoked from network); 16 May 2022 21:28:07 -0000
Received: from p200300cf071010006c0e7f8c8a4e3647.dip0.t-ipconnect.de ([2003:cf:710:1000:6c0e:7f8c:8a4e:3647]:48662 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <dave.anglin@bell.net>; Mon, 16 May 2022 23:28:07 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
        Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Date:   Mon, 16 May 2022 23:28:07 +0200
Message-ID: <5568470.DvuYhMxLoT@daneel.sf-tec.de>
In-Reply-To: <YoJqZ2rUA25360Ld@mx3210.localdomain>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5823195.lOV4Wx5bFT"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart5823195.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 16. Mai 2022, 17:14:47 CEST schrieb John David Anglin:
> Originally, I was convinced that we needed to use tmpalias flushes
> everwhere, for both user and kernel flushes. However, when I modified
> flush_kernel_dcache_page_addr, to use a tmpalias flush, my c8000
> would crash quite early when booting.
> 
> The PDC returns alias values of 0 for the icache and dcache. This
> indicates that either the alias boundary is greater than 16MB or
> equivalent aliasing doesn't work. I modified the tmpalias code to
> make it easy to try alternate boundaries. I tried boundaries up to
> 128MB but still kernel tmpalias flushes didn't work on c8000.
> 
> This led me to conclude that tmpalias flushes don't work on PA8800
> and PA8900 machines, and that we needed to flush directly using the
> virtual address of user and kernel pages. This is likely the major
> cause of instability on the c8000 and rp34xx machines.
> 
> Flushing user pages requires doing a temporary context switch as we
> have to flush pages that don't belong to the current context. Further,
> we have to deal with pages that aren't present. If a page isn't
> present, the flush instructions fault on every line.
> 
> Other code has been rearranged and simplified based on testing. For
> example, I introduced a flush_cache_dup_mm routine. flush_cache_mm
> and flush_cache_dup_mm differ in that flush_cache_mm calls
> purge_cache_pages and flush_cache_dup_mm calls flush_cache_pages.
> In some implementations, pdc is more efficient than fdc. Based on
> my testing, I don't believe there's any performance benefit on the
> c8000.
> 
> V2:
> 1) Add flush_cache_page_check_pte routine.
> 2) Use it in copy_to_user_page and copy_from_user_page.
> 3) flush_anon_page moved to cache.c and updated.
> 4) Changed alias boundary to 64 MB for 64-bit kernels. Revised comment
>    regarding alias boundary for PA8800/PA8900 processors.
> 5) Removed struct mm_struct * argument from flush_cache_pages.
> 6) Fixed thinko in flush_cache_range. It increased the number of pages
>    flushed and slowed performance.
> 7) Removed sync changes from pacache.S.
> 
> V3:
> 1) copy_to_user_page and copy_from_user_page moved to cache.c to
>    improve inlining.
> 2) Replaced copy_user_page with copy_user_highpage.
> 3) Fixed cache threshold calculation on 32-bit kernels.
> 4) Don't warn on inequivalent private mappings in flush_dcache_page.
> 5) Return early from mm_total_size if size exceeds
>    parisc_cache_flush_threshold.
> 6) Disable non-access TLB warning in handle_nadtlb_fault. Warning
>    happens occassionally handling flushes for COW faults.
> 7) Remove flush_cache_dup_mm.
> 8) Flush entire cache in flush_cache_mm and flush_cache_range on
>    processors with aliasing caches. Only flush small cache ranges
>    on machines with PA8800/PA8900 processors.
> 9) Tested on rp3440, c8000 and c3750.

Given how long these changelogs are, and how fragile the whole caching is I 
think it is a good idea to split this patch into smaller ones, to improve 
readability and being able to bisect it.
--nextPart5823195.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYoLB5wAKCRBcpIk+abn8
TtKtAJ9NlzzXXzzr4A/3DqWmlq6+csgDdwCgp0Gp51YXA+jAdkVJDC3OejxGY/8=
=6AZf
-----END PGP SIGNATURE-----

--nextPart5823195.lOV4Wx5bFT--



