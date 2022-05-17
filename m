Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE60D52A2B0
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 15:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239863AbiEQNHJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 09:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347028AbiEQNHH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 09:07:07 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051E82B26D
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 06:07:05 -0700 (PDT)
Received: (qmail 6072 invoked from network); 17 May 2022 13:07:04 -0000
Received: from p200300cf071fc00050fc79fffe65e6bc.dip0.t-ipconnect.de ([2003:cf:71f:c000:50fc:79ff:fe65:e6bc]:33932 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 15:07:04 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Date:   Tue, 17 May 2022 15:06:58 +0200
Message-ID: <4739001.31r3eYUQgx@eto.sf-tec.de>
In-Reply-To: <YoJqZ2rUA25360Ld@mx3210.localdomain>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4398930.LvFx2qVVIh"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4398930.LvFx2qVVIh
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

> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index f114e102aaf2..ca49765784fc 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -22,6 +22,8 @@
> 
>  #include <asm/traps.h>
> 
> +/* #define DEBUG_NATLB 1 */
> +
>  /* Various important other fields */
>  #define bit22set(x)		(x & 0x00000200)
>  #define bits23_25set(x)		(x & 0x000001c0)
> @@ -450,10 +452,12 @@ handle_nadtlb_fault(struct pt_regs *regs)
>  		fallthrough;
>  	case 0x380:
>  		/* PDC and FIC instructions */
> +#ifdef DEBUG_NATLB
>  		if (printk_ratelimit()) {
> -			pr_warn("BUG: nullifying cache flush/purge 
instruction\n");
> +			pr_warn("WARNING: nullifying cache flush/
purge instruction\n");
>  			show_regs(regs);
>  		}
> +#endif
>  		if (insn & 0x20) {
>  			/* Base modification */
>  			breg = (insn >> 21) & 0x1f;

This surely deserves it's own commit as it has nothing to do with the actual 
change. I wonder if it is actually intended to go upstream or if this was just 
a local debug hack?

Eike
--nextPart4398930.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYoOd8gAKCRBcpIk+abn8
TlG7AJ0TyNnCFo/gd9KxaunDgft5OVavuwCgngLE8MwNNqk1p7YKuweScG2rb24=
=iGOW
-----END PGP SIGNATURE-----

--nextPart4398930.LvFx2qVVIh--



