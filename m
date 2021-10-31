Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A1A4410F7
	for <lists+linux-parisc@lfdr.de>; Sun, 31 Oct 2021 22:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhJaVRZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 31 Oct 2021 17:17:25 -0400
Received: from mout.gmx.net ([212.227.15.15]:52671 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229982AbhJaVRZ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 31 Oct 2021 17:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635714885;
        bh=HfSY97Ok1t5Tnbb6uML+oUkmXtCZHHa+FraGyCsV5Oo=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=LOqcmNiWk5d/p6Z2pLDHxFVJh/cHHcIrTJrfCe/nfkMliWzaMTiWJ6WsZJfNe2V+l
         6TV+ovvWkbXLcGfr1Nx09djac42w2yomuWTATl5SMHusrhL/RAcn+A1vFf9E9iVF7q
         g8bm7CJHHfXs/Zvc6l8I64VSMgwY2cWN5yFPax8Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.174.201]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQv8n-1mJRkw31MN-00NvVH; Sun, 31
 Oct 2021 22:14:45 +0100
Date:   Sun, 31 Oct 2021 22:14:19 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Fix code/instruction patching on PA1.x machines
Message-ID: <YX8HK7ZZZhjRQzcr@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:UVxpwENy1KXY3az2ykTi9H4f5FcAhY9+Tnbjyv8zy91OUrUy5gT
 nByxExzDNrfEjvy8rTi9dtxXYUOMUVbod00H69ynq5yoWZMxQPPmHKhKphPlfv9ETVRyjhp
 9AHkeyjXbksF/cqAc9vCc64+EmWqgzL67rcyKRQNZV6eCSNRWjQfV8IqqW6YRUvWUTd425t
 uTXK1E+y4kI7wVLsShgoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/BhteET13Jk=:gqPLmCkH+PSn96Z4GceHnm
 zynbjdgB5R5sIndCqD4sgzeRXHry9nIQ6EqlFOP1tKb4hfA9Xx6nLRoNCjRhSVwCyFvKLG3FW
 EYrYec61i07glp3CK1yohEg4XOCmnBxHe5NpA+twrtweDdMbSdzIU7s43MYLArzA4NZRBnRJe
 qLQOsR+yQkG/N4jXb0Euj9sCBPGcoEKw/PLDx/M6OgPGjdiDPatsKUZr3tGGrieyBOqTE0jRi
 PN9jIJKAC79zRVIozvxr3XdI4BoESAaOke88Gwgjt2M1J7W+4RtfUoroHa5gMUNqnWZxqCV4M
 TEpa9KOjB5bTAxpk0a4HX6iNuGkpwCUHK5tP9vR8dyRGvAOFXOJe2I11LYZxaRZMWPfcIUBW7
 oE8/7f5xjbDn2Eq5NGbMNO6UxVS8rTtoJqiu3+uAWp8Sq9oxTkXHBr7SRj9O2LmqTbMpBuo7/
 6WqD2P9MdV2yr36XVZ4gvSL5Z9PziAL3J0NHPxiqK2TFs3Lxg0smWWWS8/Qbo4b7tOC8cQIgC
 WnWquocbtTWCTTyri6H0XqAXzbYoV8FZSEcX6pdr7KEskKWBece9hIjNQtv/uiZimci+C53Eo
 oS9G8CO4TpE83+J24CbCHsFvIQD+LQpWaMy9I6e+rvd2LflRYPlsCN5a71KSQDCiAD6UoA0Z2
 39F32UhwVim+/SXyO4lNS40YaIZS64Llkyw3J8bWFeIP7WItMCYnuaCnTA+ilYT7V9d8E4C69
 fRCkE/VXXswqOCJBvdZHdLoyE7ZSX6eFfv5zqDEHWN665lDx/gSBVpGn3MdWja1rVUGKCjktC
 tg82l1NU7At9/uKJcgRGlSggxblDIp/TPdfPhoiO0aPLghAEeAuVUc/MbnQwXAjTySrbwpZAo
 JfBJ7eypowCjRS+BmPn00dflO1OPLzzHqRe2Vhsy0zIEQU4R7MuDj4rUnEFN/MO9WcEXRMsd6
 JShohoYkTcmc8B7ZM/sxWMglIRH6tIWS/YTyRW74+L0gSnlAqvpRWxn8Gfbi6I2P9bqxfYZRr
 4FByxd3yv+iDpKi1/ApQGuCQZ98sJblkpKtKMjDFvBgeYIKMjoMhDsexx3PAxZrZLex6xNMbO
 nTX6/yOWtSrAVg=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On PA1.x machines it's not sufficient to just flush the data and
instruction caches when we have written new instruction codes into the
parallel mapped memory segment, but we really need to invalidate (purge)
the cache too. Otherwise the processor will still execute the old
instructions which are still in the data/instruction cache.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: 4e87ace902cf ("parisc: add support for patching multiple words")
Cc: stable@vger.kernel.org # v5.3+

diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
index 80a0ab372802..8cbb7e1d5a2b 100644
=2D-- a/arch/parisc/kernel/patch.c
+++ b/arch/parisc/kernel/patch.c
@@ -81,7 +81,7 @@ void __kprobes __patch_text_multiple(void *addr, u32 *in=
sn, unsigned int len)
 			 * We're crossing a page boundary, so
 			 * need to remap
 			 */
-			flush_kernel_vmap_range((void *)fixmap,
+			invalidate_kernel_vmap_range((void *)fixmap,
 						(p-fixmap) * sizeof(*p));
 			if (mapped)
 				patch_unmap(FIX_TEXT_POKE0, &flags);
@@ -90,9 +90,10 @@ void __kprobes __patch_text_multiple(void *addr, u32 *i=
nsn, unsigned int len)
 		}
 	}

-	flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
+	invalidate_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
 	if (mapped)
 		patch_unmap(FIX_TEXT_POKE0, &flags);
+	invalidate_kernel_vmap_range((void *)start, end - start);
 	flush_icache_range(start, end);
 }

