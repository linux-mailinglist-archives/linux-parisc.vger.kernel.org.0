Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09734D70AD
	for <lists+linux-parisc@lfdr.de>; Sat, 12 Mar 2022 21:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbiCLUGs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 12 Mar 2022 15:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbiCLUGs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 12 Mar 2022 15:06:48 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F13754180
        for <linux-parisc@vger.kernel.org>; Sat, 12 Mar 2022 12:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647115534;
        bh=vLJuKkkYEzN+BTby35LG7S9108YDPfgXJZuUIq93/Yg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=hmn+Okf+DH0PToqv0HSPHbaubIYZFPP34sKacs+wuGsTzyv/iSMayCZfXDLLEYuhZ
         mUHTTC7LktqsfiG/98wZsqNHRVB3qtiiivKQHtO+ThjellN2ypIxYITV0PvxyiyMQD
         cq7XXjx6/ZqLah+XwqAjuPOJXlFLoJT+RoXSDstg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.170.130]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiPv-1nYmmZ0l6z-00U5sU; Sat, 12
 Mar 2022 21:05:34 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Avoid calling SMP cache flush functions on cache-less machines
Date:   Sat, 12 Mar 2022 21:05:33 +0100
Message-Id: <20220312200533.74209-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ulTiPnqw8cY31tlYWG91vJk5o+c986xxQ3TIQ1EYm/13TTgWgvn
 NxQg4+ZhBt1VGr+8/pRDAQaTO5/FKIOvwu56xK0BHDKtzSDkF0AVxf+pxfwzpAc1rFFwSf4
 b4mSh7+xSMgqfxQH0a00+oTMEfaHhyVCH/BaeyOrBySTAqL4Y62GlYAB/4izhlJodi29QdG
 yj3K1s45ak+McQVi+jwsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9nj/xK8uRSw=:zSuF03IdEUJnIicBdqPoBj
 ixsTVC4f/T6AnOP6pMXZQOpdM08zsGNGLFZtW73WV4nCWlXQeTxmAOmWp1oBAJN9I6ZfKP1CP
 iS7CdPnvZPQ4FSsM+0ey7LVF3+rPPDbrvHOoV8Tpt7dHmyaXgvcXiDgF4SFJnqNKXsXwlzvys
 DgwWCuruPZibY7qDv9eiWiyQGAEP1US1Cr3e7NYHRgbXhux6EiPs0auz2u3r7PYU1igmBmJ4R
 ceK0DxUIzbMfhEMgf1rny6tkntKyz6WTsBgNlZAmtuNDm6vO1x3iGZvS9LXzLHRvePFS/nwNm
 FERFQmIewcPUS1coDPrfS271yHELDDptPw6O3TaFLWge12GooQOt6LlAuwzKwZ1vPujDn8xY/
 5Y/gN/2BFKtCFIZPKEelZWFz1yX8d7oraN+yHe+hZVTJZ8hsFcqG5LlRxltqAnXxW3UoIIEwC
 f4Qlli449MoMlgcdzaRamaZFWjjiGOFnsi8LZUNB5babvjjIofAc7wO6CYlnRht8OjABKDM4e
 6Z0Kdv3dsItzKbseHApEuGnbBLBUCGjtaw4YzgVyauxnqF4hMtxbavy/XV890zzxkMGS5jmGm
 PhgZQU15D4vbipmCrvDadhBjUt9eZwkAoKcCiawoXwrwk/aWtXyC14wL3EzxfmvxZ/kyLjbls
 8Rj5YPbUR4NYalLvNky8fZbBp+2CnqraJ+D3f2pYn12v/5V9sSLDXtJ8ekH/Qs+z/VPAWW5/K
 0DJEm7rUJejvOVdKOlHoLovhfPt5K4AYFwGwxDe51nV90Wkd/P4St/iUT9MOOf8apgsge6jgV
 KCrNazUscSRdm/LK7kET4sGy//j7QMNzFpZg0eV23looDpIyWIRRy2cP51YpTLmwuPyxCxzpJ
 bZrRyGFlz1UVjcOOuu0ARB5vHhy+wIr/TrsR5E/sbSriGtmdgmVWs8snw5NcQRSgmb9h4d34P
 7gH3cXQZRinCxGyk0G9DH8d8LwB0VTyMBOFROP354uFdmRk3ARMREZ4OZ9comNodozRKh3X1w
 gF9asN/tcjav8wAAkYgD9tgUunMe8/avGTwQfJQcMJn7dPb5PMi1DyAZIfMBi/R/Kn51BX6n7
 wKn0Y9tTioeLq4=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

At least the qemu virtual machine does not provide D- and I-caches,
so skip triggering SMP irqs to flush caches on such machines.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/cache.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 81f36d6407f0..29839550146b 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -62,12 +62,14 @@ static struct pdc_btlb_info btlb_info __ro_after_init;
 void
 flush_data_cache(void)
 {
-	on_each_cpu(flush_data_cache_local, NULL, 1);
+	if (cache_info.dc_size)
+		on_each_cpu(flush_data_cache_local, NULL, 1);
 }
 void
 flush_instruction_cache(void)
 {
-	on_each_cpu(flush_instruction_cache_local, NULL, 1);
+	if (cache_info.ic_size)
+		on_each_cpu(flush_instruction_cache_local, NULL, 1);
 }
 #endif

@@ -524,7 +526,8 @@ static void cacheflush_h_tmp_function(void *dummy)

 void flush_cache_all(void)
 {
-	on_each_cpu(cacheflush_h_tmp_function, NULL, 1);
+	if (cache_info.dc_size | cache_info.ic_size)
+		on_each_cpu(cacheflush_h_tmp_function, NULL, 1);
 }

 static inline unsigned long mm_total_size(struct mm_struct *mm)
=2D-
2.34.1

