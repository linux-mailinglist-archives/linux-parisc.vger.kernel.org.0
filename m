Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4213670168D
	for <lists+linux-parisc@lfdr.de>; Sat, 13 May 2023 14:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237425AbjEMMKm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 May 2023 08:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjEMMKl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 May 2023 08:10:41 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB767210D
        for <linux-parisc@vger.kernel.org>; Sat, 13 May 2023 05:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1683979835; i=deller@gmx.de;
        bh=1xCrfQEPOCKLeSNdathjxLNk7aNJpGWos/T8oMJKyec=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=lvpwmt/SUHumJl1Rqd5XLE6wSnTF+CgjMsBLmTMqUrdYljFDeE+bXKShewvUl9JlK
         oSHqNqoP3GxZhxMnFg4ZyBm8qofeRYhTCRioN6AYVWNBHcnzoCRM7kK8Phrnu3fFKF
         16geZ4mFhQruwG8XlnAMw6DpO3gpLqsYLuq6ZYyBbtHlsNqZH01Y4y9CYas2oEOBzA
         NrXmJvQs/gpsADptLxtleAMGhrvCWXNH3nFkMjfoSZCjL1uZv3j9CvrUIUwIihU34+
         8tvVi4pbPpmAHkH04HxplabphXlunBANhd4bW/roJu9Hfuq/clfYfM/HvKPsmqp3Pt
         DIy3ppSTrawfg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.158.250]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHnm-1qCiMj1lfe-00tlDZ; Sat, 13
 May 2023 14:10:35 +0200
Date:   Sat, 13 May 2023 14:10:33 +0200
From:   Helge Deller <deller@gmx.de>
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Cc:     linux-parisc@vger.kernel.org, David Hildenbrand <david@redhat.com>
Subject: Re: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
Message-ID: <ZF9+OYqQS/vy7Oq5@p100>
References: <1683740497@msgid.manchmal.in-ulm.de>
 <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
 <1683825030@msgid.manchmal.in-ulm.de>
 <85aef102-8407-68c7-2dc2-87e5a866906b@gmx.de>
 <1683928214@msgid.manchmal.in-ulm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683928214@msgid.manchmal.in-ulm.de>
X-Provags-ID: V03:K1:ZliE8u+zdDTj8sGpcp2Z/Iwu6OqVzDYLgiTHGhT0w4CzCsNVrCG
 tKTZcrXrOsrt8ovkDD7xTFjEZFyG8WZVWiC0/xaDAM1HvDQltlDYEpFMmIrYJ3t9lKx26q1
 u3ZKWgsvYRHNblIpjgkfbHdsHl1qyV3XaSBDBuFWy3VJkXhhLj4dPq8iM1oTlwS6a8Y2QY/
 4AXiTYUftwpI0ytLQX+6g==
UI-OutboundReport: notjunk:1;M01:P0:Me3vp6byNkk=;JiTUpkDd/vcSTST5IkOHcITSqpy
 h2Kwy2oQq7ggGfDP8SCOM/0lkzhEBsRwApm0fYNiAewUPPdb7haqPU8nIzI97XFpZBEc90w3j
 vo4hwY4++hsTDghw3It2nnO3VKUaiSjgYO0nzGItXPvdlkBoGqpY3Qm8ghzs3ob9xhVzYykSx
 ariW0y+SMvn0lEgEBf757TXyRqpBfPp7vPwSKgQVjjw9PH8AHQRNdSRtWKJ/f3lrKfeRIqbDL
 6zXcWA24vIHGj5waIk1mCuA862cpat6ggIKU5C3bmgzqLHP35AbQ95o2RXceXwe1ozQ1MObCB
 uXD7Sr+JtQSNSmelDlAy/1epI41zSzjS7UexumO9YCgoz5CFyCmmKXpyXgj97W/WSZ6OpwLW0
 JNYmWGSaYY2FrVkkqVuS9OJwj+S8WVNzRM7WsJNhiggeJ9vpRmEwpzWY9l95eiE+ND+k5Hl69
 evmb42HJw1W6IKHBNMbovRJTtwZjWqfQ3Rvm5HoyR+JNM2CF+t/Knbhql+aYwyH7VyDDwLcYZ
 y8GY5oqxH1zjKQC8zaoun0FeIh1VWD7BKlFIPlZtf2ZG4ms2+jG87umMIC/E8fSOuWuBuqHev
 99QOIZfvdI9BK7XmZ3W9q2APKfOKpOjnXhzzGruB+KYiIbAYRNv0go0WQ17Lvixu4FxdORc+K
 j7OuRxGNxhcniognUdT86bFVLTruIkCcSMhJ7cBee7BAz3skHwZlGCnEJeW82tlUKHFgq8W7k
 WSOW2iK+kodyqZW1Dv2SS1YVWpx1JNVIfMVLqb6p9jT44wnpSa9O2xDFhuM6aYamJbPsEKeUV
 cnBJ+09IvyOv4hR8utp+D8GKDkBD5YGGFiIyEPQgXWIdaqm5LbeC0h641zASR3ABdQ4m0sehs
 HEP1J2oHmVDIPzmUkbqTsDUucMNzjXLQbA188qplbGbP1PgER9iPJZvzRTWagxMrImvuz6txJ
 2UCnk+gTb2Rirq14nOSYSCx91rs=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>:
> Helge Deller wrote...
>
> > Since you run the 32-bit kernel, huge-pages are not involved as they
> > aren't available in the 32-bit kernels.
> > So I think swapping is triggering it.
> > You could try to find a test program which triggers swapping, e.g. LTS=
 testcases?
> > Another test could be to enable CONFIG_MIGRATION again and disable
> > all swap spaces and see if it survives.
>
> Well, turns out I'm not using swap at all. But the "memory under
> pressure" seemed right, and I could easily trigger the crash by
> allowcating almost the entire available memory[1].
>
> Then bisecting led to
>
> commit 6d239fc78c0b0c687e5408573350714e6e789d71
> Author: David Hildenbrand <david@redhat.com>
> Date:   Fri Jan 13 18:10:16 2023 +0100
>
>     parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>
>     Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by using the yet-unused
>     _PAGE_ACCESSED location in the swap PTE.  Looking at pte_present() a=
nd
>     pte_none() checks, there seems to be no actual reason why we cannot =
use
>     it: we only have to make sure we're not using _PAGE_PRESENT.
>
>     Reusing this bit avoids having to steal one bit from the swap offset=
.
>
>     Link: https://lkml.kernel.org/r/20230113171026.582290-17-david@redha=
t.com
>     Signed-off-by: David Hildenbrand <david@redhat.com>
>     Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
>     Cc: Helge Deller <deller@gmx.de>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>
> Does this make sense?

Yes, makes sense.

> [1] Total is 1 Gbyte, and running
>     | dd if=3D/dev/zero bs=3D896M count=3D1 | pv --rate-limit=3D1k >/dev=
/null
>     might not be the best style but does the trick: Wait for pv to
>     count up to a minute, then ^C it. If the host is still okay after
>     that, it's considered "good".

Thanks for bisecting and coming up with a testcase!
The attached patch survives for me on my C3000 with 2GB RAM with this test=
:
	dd if=3D/dev/zero bs=3D1896M count=3D1 | pv
(well, the OOM-killer might jump in, but even that is survived).

Could you try the patch below?

Helge

-

[PATCH] parisc: Fix encoding of swp_entry due to added SWP_EXCLUSIVE flag

Fix the __swp_offset() and __swp_entry() macros due to commit 6d239fc78c0b
("parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE") which introduced the
SWP_EXCLUSIVE flag by reusing the _PAGE_ACCESSED flag.

Reported-by: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Fixes: 6d239fc78c0b ("parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE")

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/p=
gtable.h
index e2950f5db7c9..522846be54b7 100644
=2D-- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -413,12 +413,12 @@ extern void paging_init (void);
  *   For the 64bit version, the offset is extended by 32bit.
  */
 #define __swp_type(x)                     ((x).val & 0x1f)
-#define __swp_offset(x)                   ( (((x).val >> 6) &  0x7) | \
-					  (((x).val >> 8) & ~0x7) )
+#define __swp_offset(x)                   ( (((x).val >> 5) &  0x7) | \
+					  (((x).val >> 10) << 3) )
 #define __swp_entry(type, offset)         ((swp_entry_t) { \
 					    ((type) & 0x1f) | \
-					    ((offset &  0x7) << 6) | \
-					    ((offset & ~0x7) << 8) })
+					    ((offset &  0x7) << 5) | \
+					    ((offset & ~0x7) << 7) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })



