Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED0F4EC6C6
	for <lists+linux-parisc@lfdr.de>; Wed, 30 Mar 2022 16:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347014AbiC3Ol1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 30 Mar 2022 10:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347031AbiC3OlZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:41:25 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 25FF355BE3
        for <linux-parisc@vger.kernel.org>; Wed, 30 Mar 2022 07:39:35 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6243249C0021ED0D
X-CM-Envelope: MS4xfGu5x2ml15Xjysg9hEErPNeEAtfmUxD6bshx4+r/NNgR0LryN8Fspq/MJnP2EEMuqEkQu1btp05gKVrxfjEbwfvdnFsyVCnqfTy93GyyZmE17Jmm+hpt
 J8pI4lpNReq67rVkll9B9icq2tP03tmOAHdWhQfmf5iSUeN6eKLAIY+DQ6fwzpELN6hf39URE3P81HxqDnWMnK43a0GbZKoJlqmcQ3kjN4Annx9JvosBDpUh
 qlOwkeSTSirx0xSqkb/sSxts/SSrwALrbTL+ys8NWeA42omdnmE5jR2KGw2q5+j1CxVR+cLdBT0laP+U8+y8f1fjuf4Nrgx9KUkI8I9jyiBFWHJMAwce4QeJ
 E3Lm0ReElCUjrie8xfkf1g9la4vHBScl7F8sGZQJ0dkcnvKanh6PSIHdtc3ak7qMzSMgFNQAsYaESjb6uSbl8KSZ0RwHj2m772zH72bAoIhA4DxAMtWyP6g8
 OJmWBfNgnN8zFGI88eEFZlyq1JaTrRrihF/Vv4ca82uSCeTeZqBR8BhTSTBf6Z/+YCV6yJfMDrPo6jok0lBIGMq7KLwYSK+iStXZgSQ1/bC78tqM+LNxqOhD
 v5BpSsXerdOYSfsKzl6eibFCwFZWeXnnmHHP5vdkOZKKxw==
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=62446b99
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=3kVGm1IiYS7Sbd7lve8A:9 a=CjuIK1q_8ugA:10
 a=oFCfDGa8Ei_L46Sp8Z4A:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6243249C0021ED0D; Wed, 30 Mar 2022 10:39:21 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 2F999220116; Wed, 30 Mar 2022 14:39:21 +0000 (UTC)
Date:   Wed, 30 Mar 2022 14:39:20 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Implement flush_cache_vmap_vunmap
Message-ID: <YkRrmLpNDmtP587I@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lRhotXVGamPnWCrr"
Content-Disposition: inline
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--lRhotXVGamPnWCrr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Revise flush_cache_vmap and flush_cache_vunmap calls to use
flush_cache_vmap_vunmap. It flushes tlb to inhibit move-in
and checks that interrupts are disabled on SMP builds.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm=
/cacheflush.h
index e8b4a03343d3..fa40709698de 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -37,8 +37,9 @@ void flush_kernel_dcache_page_addr(void *addr);
 	flush_kernel_dcache_range_asm((start), (start)+(size));
=20
 #define ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE 1
-void flush_kernel_vmap_range(void *vaddr, int size);
-void invalidate_kernel_vmap_range(void *vaddr, int size);
+void flush_cache_vmap_vunmap(unsigned long start, unsigned long end);
+#define flush_cache_vmap(start,end)	flush_cache_vmap_vunmap(start,end)
+#define flush_cache_vunmap(start,end)	flush_cache_vmap_vunmap(start,end)
=20
 #define flush_cache_vmap(start, end)		flush_cache_all()
 #define flush_cache_vunmap(start, end)		flush_cache_all()
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 91d218953b5c..533c5643c3fe 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -653,3 +653,15 @@ void invalidate_kernel_vmap_range(void *vaddr, int siz=
e)
 	flush_tlb_kernel_range(start, end);
 }
 EXPORT_SYMBOL(invalidate_kernel_vmap_range);
+
+void flush_cache_vmap_vunmap(unsigned long start, unsigned long end)
+{
+	BUG_ON(IS_ENABLED(CONFIG_SMP) && arch_irqs_disabled());
+
+	/* Inhibit cache move-in */
+	flush_tlb_all();
+
+	/* Flush the entire cache to remove all aliases */
+	flush_cache_all();
+}
+EXPORT_SYMBOL(flush_cache_vmap_vunmap);


--lRhotXVGamPnWCrr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmJEa5gACgkQXb/Nrl8Z
TfGDvA//QkOWK+tuEzM5jURpvlyo3hSiNPeaY2oUjv8wMmRlnUuNpoSN5XFo1dMk
1bPmtykL4PKhkrO3ZsmFSRulxgszRc3C6aj+y9aAyEmfJpyX+L7AkdTdQypw76dl
ay+9ZsHdIPAVu1Djlbe9zRb6NxnYSmHfy6jUHScjAgl/CbE6Pczrp5EoqXqE2jRM
LwRCRU7QdO9N1KfMdydKL6hNM9G3UucqoogKzB7ioQO6xZbI3ndZcApyPnzw4/x6
EbORH61IChqn+c7Bn8eeE5FRnJSc8cLOmF4fOJcTnIzjybGLMSHA9TRO0oV4rduf
7FlMkv2HT0HK8eLOGqfouVAUQmzSiz7LEoXnb5Wgt5TbScgBf7P+mrICwHKszWJu
bNIFMdbBOzNuHCBgC/n6xvr3sSgUHIY9vxbiVEVSe895qTFrdMkbiqduEMSXmAMT
jKwXovcnyG1WmuJ3ytzSOR1Fkhv5aYvd54/yzB+NK+aAJ/ijLmYJzUC4DutEaKWj
mXVNfMgSHdgeuYaR+AMUQftBCmHcJeT3tMHPswXVnma9HNPRyi20WYEcK1rYTQNd
xz0eOQgOEQgnYnXRwXU5DrVGBZ5TAmftUz2JPzWvO6/1WNbAco4ubn7GIxFWHGy7
nLrku3djHY33R7R51EGKzXoFFb5gcqSIfekrVwtTkO+VFoQnOS8=
=jwzC
-----END PGP SIGNATURE-----

--lRhotXVGamPnWCrr--
