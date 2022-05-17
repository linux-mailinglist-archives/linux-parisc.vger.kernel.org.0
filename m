Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E7F52A313
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 15:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347456AbiEQNT3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 09:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347447AbiEQNT1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 09:19:27 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3000141F94
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 06:19:26 -0700 (PDT)
Received: (qmail 6513 invoked from network); 17 May 2022 13:19:24 -0000
Received: from p200300cf071fc00050fc79fffe65e6bc.dip0.t-ipconnect.de ([2003:cf:71f:c000:50fc:79ff:fe65:e6bc]:33934 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <dave.anglin@bell.net>; Tue, 17 May 2022 15:19:24 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Date:   Tue, 17 May 2022 15:19:18 +0200
Message-ID: <2239732.ElGaqSPkdT@eto.sf-tec.de>
In-Reply-To: <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain> <5568470.DvuYhMxLoT@daneel.sf-tec.de> <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4712018.GXAFRqVoOG"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4712018.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Montag, 16. Mai 2022, 23:49:10 CEST schrieb Helge Deller:
> On 5/16/22 23:28, Rolf Eike Beer wrote:
> > Am Montag, 16. Mai 2022, 17:14:47 CEST schrieb John David Anglin:
> >> Originally, I was convinced that we needed to use tmpalias flushes
> >> everwhere, for both user and kernel flushes. However, when I modified
> >> flush_kernel_dcache_page_addr, to use a tmpalias flush, my c8000
> >> would crash quite early when booting.
> >>=20
> >> The PDC returns alias values of 0 for the icache and dcache. This
> >> indicates that either the alias boundary is greater than 16MB or
> >> equivalent aliasing doesn't work. I modified the tmpalias code to
> >> make it easy to try alternate boundaries. I tried boundaries up to
> >> 128MB but still kernel tmpalias flushes didn't work on c8000.
> >>=20
> >> This led me to conclude that tmpalias flushes don't work on PA8800
> >> and PA8900 machines, and that we needed to flush directly using the
> >> virtual address of user and kernel pages. This is likely the major
> >> cause of instability on the c8000 and rp34xx machines.
> >>=20
> >> Flushing user pages requires doing a temporary context switch as we
> >> have to flush pages that don't belong to the current context. Further,
> >> we have to deal with pages that aren't present. If a page isn't
> >> present, the flush instructions fault on every line.
> >>=20
> >> Other code has been rearranged and simplified based on testing. For
> >> example, I introduced a flush_cache_dup_mm routine. flush_cache_mm
> >> and flush_cache_dup_mm differ in that flush_cache_mm calls
> >> purge_cache_pages and flush_cache_dup_mm calls flush_cache_pages.
> >> In some implementations, pdc is more efficient than fdc. Based on
> >> my testing, I don't believe there's any performance benefit on the
> >> c8000.
> >>=20
> >> V2:
> >> 1) Add flush_cache_page_check_pte routine.
> >> 2) Use it in copy_to_user_page and copy_from_user_page.
> >> 3) flush_anon_page moved to cache.c and updated.
> >> 4) Changed alias boundary to 64 MB for 64-bit kernels. Revised comment
> >>=20
> >>    regarding alias boundary for PA8800/PA8900 processors.
> >>=20
> >> 5) Removed struct mm_struct * argument from flush_cache_pages.
> >> 6) Fixed thinko in flush_cache_range. It increased the number of pages
> >>=20
> >>    flushed and slowed performance.
> >>=20
> >> 7) Removed sync changes from pacache.S.
> >>=20
> >> V3:
> >> 1) copy_to_user_page and copy_from_user_page moved to cache.c to
> >>=20
> >>    improve inlining.
> >>=20
> >> 2) Replaced copy_user_page with copy_user_highpage.
> >> 3) Fixed cache threshold calculation on 32-bit kernels.
> >> 4) Don't warn on inequivalent private mappings in flush_dcache_page.
> >> 5) Return early from mm_total_size if size exceeds
> >>=20
> >>    parisc_cache_flush_threshold.
> >>=20
> >> 6) Disable non-access TLB warning in handle_nadtlb_fault. Warning
> >>=20
> >>    happens occassionally handling flushes for COW faults.
> >>=20
> >> 7) Remove flush_cache_dup_mm.
> >> 8) Flush entire cache in flush_cache_mm and flush_cache_range on
> >>=20
> >>    processors with aliasing caches. Only flush small cache ranges
> >>    on machines with PA8800/PA8900 processors.
> >>=20
> >> 9) Tested on rp3440, c8000 and c3750.
> >=20
> > Given how long these changelogs are, and how fragile the whole caching =
is
> > I
> > think it is a good idea to split this patch into smaller ones, to impro=
ve
> > readability and being able to bisect it.
>=20
> FWIW, I've done some cleanups to this patch and committed it to my for-ne=
xt
> tree. In case it's split up, please use the revised version.

Why did you modify get_ptep()? Until now it was just moved around in the fi=
le,=20
and IMHO it becomes less readable because all these needless variables are=
=20
batched up at the start of the function now. The only point I would see in=
=20
moving them all to the front is if there would be no nesting anymore, and=20
every condition was inverted:

if (pgd_none(*pgd))
	return NULL;

[=E2=80=A6]

return pte_offset_map(pmd, addr);

Bit this would as well be a different commit.
--nextPart4712018.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYoOg1gAKCRBcpIk+abn8
TuZ0AJ9jJPlvb4RzHnKMS+TxSy5/f2xragCghN/28zsA+Nv8gcuv8jicCnOy014=
=9+hm
-----END PGP SIGNATURE-----

--nextPart4712018.GXAFRqVoOG--



