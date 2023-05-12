Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0199E701201
	for <lists+linux-parisc@lfdr.de>; Sat, 13 May 2023 00:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjELWDr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 12 May 2023 18:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbjELWDr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 12 May 2023 18:03:47 -0400
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6624610CB
        for <linux-parisc@vger.kernel.org>; Fri, 12 May 2023 15:02:46 -0700 (PDT)
Date:   Fri, 12 May 2023 23:56:13 +0200
From:   Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
Message-ID: <1683928214@msgid.manchmal.in-ulm.de>
References: <1683740497@msgid.manchmal.in-ulm.de>
 <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
 <1683825030@msgid.manchmal.in-ulm.de>
 <85aef102-8407-68c7-2dc2-87e5a866906b@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mrCnO7LJ8L6pI9ZB"
Content-Disposition: inline
In-Reply-To: <85aef102-8407-68c7-2dc2-87e5a866906b@gmx.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--mrCnO7LJ8L6pI9ZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Helge Deller wrote...

> Since you run the 32-bit kernel, huge-pages are not involved as they
> aren't available in the 32-bit kernels.
> So I think swapping is triggering it.
> You could try to find a test program which triggers swapping, e.g. LTS testcases?
> Another test could be to enable CONFIG_MIGRATION again and disable
> all swap spaces and see if it survives.

Well, turns out I'm not using swap at all. But the "memory under
pressure" seemed right, and I could easily trigger the crash by
allowcating almost the entire available memory[1].

Then bisecting led to

commit 6d239fc78c0b0c687e5408573350714e6e789d71
Author: David Hildenbrand <david@redhat.com>
Date:   Fri Jan 13 18:10:16 2023 +0100

    parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE

    Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by using the yet-unused
    _PAGE_ACCESSED location in the swap PTE.  Looking at pte_present() and
    pte_none() checks, there seems to be no actual reason why we cannot use
    it: we only have to make sure we're not using _PAGE_PRESENT.

    Reusing this bit avoids having to steal one bit from the swap offset.

    Link: https://lkml.kernel.org/r/20230113171026.582290-17-david@redhat.com
    Signed-off-by: David Hildenbrand <david@redhat.com>
    Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
    Cc: Helge Deller <deller@gmx.de>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Does this make sense?

    Christoph

[1] Total is 1 Gbyte, and running
    | dd if=/dev/zero bs=896M count=1 | pv --rate-limit=1k >/dev/null
    might not be the best style but does the trick: Wait for pv to
    count up to a minute, then ^C it. If the host is still okay after
    that, it's considered "good".

--mrCnO7LJ8L6pI9ZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmRetfoACgkQxCxY61kU
kv0B2xAAwOtIR36EA2JC/WWDKZSqmQyCJD6xQe6xbdeV0rnkwSfnsUClXNtaRDi/
32nDdMr/ctZEmfKTBI8J5g83BQIM1nsu9qKG5EndYqSvPEJDmMzY4Hhp+iDl8AIL
VePSSr+uLc66l+LMmd78tAz6huKRrvwR4TdgqwHbpqhd5tR7XlVis6CQVnglVF30
hGiBQD2RmsLP15ZcsPNC3jbIWbLxLYGKzcHc9+DiqdZSUCwTAuQBIUxS+Arv8th3
5rs9L9lIo7WDTJXj0qTV6b3BTYbJoKrgVg06kJgjiVIpMtaU+hqPWiV4QzNoOtUD
D0+7fFlQufCo2WNos1akh87N93lhs3pVExSLO0MZFximwgpT0XDUGCrkrjR3+abq
YzSYzAXn9nc1a6Jldh3060iKUBwKSyuJr4wzk8HMK1hp1rJfXxYPoiPb2axEeGHH
v5SuNFMkTzrno85K8C1z1lhw3k+r2GOMu6FVX0YsJU1ilmiWiecOz+3dv6K33+Ll
Y1parcKqrF9YEaZ/5qBCfQ/6/YJVJc9hjkDTlJJg2+fLMUldgQ8TLevqcWLvtj8g
NeKLQdawwxjp3ZIvof5PbuK46QsdkDH1k9fQW7wIb7STzjCxuO5fJS9XxuFFjP+Q
kWmEJClElihsN4LsdafXO6iPyA75tzgLlVYfELx1uEIp+7tAz1U=
=cTPw
-----END PGP SIGNATURE-----

--mrCnO7LJ8L6pI9ZB--
