Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 347EC608363
	for <lists+linux-parisc@lfdr.de>; Sat, 22 Oct 2022 03:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiJVBpY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 21 Oct 2022 21:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiJVBpS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 21 Oct 2022 21:45:18 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3343C142;
        Fri, 21 Oct 2022 18:44:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A8937CE1D33;
        Sat, 22 Oct 2022 01:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C31C4314C;
        Sat, 22 Oct 2022 01:44:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="iu6efxn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1666403066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5GssbPvpQUSqn9ok4YPcNbmucZTqqgRMyGKq8nqBg50=;
        b=iu6efxn75UqToPogi1G/KtTQCFpDFpxwWHM2r6CNKZN5CPpurn25AGSWSCvFtqB7R7IWsd
        9wKk+SlFrUyto643RuVTCKL0QR7KhPvNc/KApAUO0dqdXoDmP6jZD7Yv0gu+94VLA54W9D
        X17EXbEEIixCgIvt3BUuj+k57St8+T4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e041f7b8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Sat, 22 Oct 2022 01:44:26 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kernel@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= 
        <christoph.boehmwalder@linbit.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Theodore Ts'o <tytso@mit.edu>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        "Darrick J . Wong" <djwong@kernel.org>,
        SeongJae Park <sj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Helge Deller <deller@gmx.de>, netdev@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-block@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mmc@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [PATCH v1 5/5] treewide: use get_random_u32_between() when possible
Date:   Fri, 21 Oct 2022 21:44:03 -0400
Message-Id: <20221022014403.3881893-6-Jason@zx2c4.com>
In-Reply-To: <20221022014403.3881893-1-Jason@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

These cases were done with this Coccinelle:

@@
expression H;
expression L;
@@
- (get_random_u32_below(H) + L)
+ get_random_u32_between(L, H + L)

And then subsequently cleaned up by hand, with several automatic cases
rejected if it didn't make sense contextually.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/x86/kernel/module.c                      |  2 +-
 crypto/rsa-pkcs1pad.c                         |  2 +-
 crypto/testmgr.c                              | 10 ++++----
 drivers/bus/mhi/host/internal.h               |  2 +-
 drivers/dma-buf/st-dma-fence-chain.c          |  2 +-
 drivers/infiniband/core/cma.c                 |  2 +-
 drivers/infiniband/hw/hns/hns_roce_ah.c       |  5 ++--
 drivers/mtd/nand/raw/nandsim.c                |  2 +-
 drivers/net/wireguard/selftest/allowedips.c   |  8 +++---
 .../broadcom/brcm80211/brcmfmac/p2p.c         |  2 +-
 .../net/wireless/intel/iwlwifi/mvm/mac-ctxt.c |  2 +-
 fs/f2fs/segment.c                             |  6 ++---
 kernel/kcsan/selftest.c                       |  2 +-
 lib/test_hexdump.c                            | 10 ++++----
 lib/test_printf.c                             |  2 +-
 lib/test_vmalloc.c                            |  6 ++---
 mm/kasan/kasan_test.c                         |  6 ++---
 mm/kfence/kfence_test.c                       |  2 +-
 mm/swapfile.c                                 |  5 ++--
 net/bluetooth/mgmt.c                          |  5 ++--
 net/core/pktgen.c                             | 25 ++++++++-----------
 net/ipv4/tcp_input.c                          |  2 +-
 net/ipv6/addrconf.c                           |  6 ++---
 net/netfilter/nf_nat_helper.c                 |  2 +-
 net/xfrm/xfrm_state.c                         |  2 +-
 25 files changed, 56 insertions(+), 64 deletions(-)

diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index c09ae279ef32..9f74b7d71a50 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -53,7 +53,7 @@ static unsigned long int get_module_load_offset(void)
 		 */
 		if (module_load_offset == 0)
 			module_load_offset =
-				(get_random_u32_below(1024) + 1) * PAGE_SIZE;
+				get_random_u32_between(1, 1024 + 1) * PAGE_SIZE;
 		mutex_unlock(&module_kaslr_mutex);
 	}
 	return module_load_offset;
diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index 0f722f8f779b..f31c94855a09 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -253,7 +253,7 @@ static int pkcs1pad_encrypt(struct akcipher_request *req)
 	ps_end = ctx->key_size - req->src_len - 2;
 	req_ctx->in_buf[0] = 0x02;
 	for (i = 1; i < ps_end; i++)
-		req_ctx->in_buf[i] = 1 + get_random_u32_below(255);
+		req_ctx->in_buf[i] = get_random_u32_between(1, 256);
 	req_ctx->in_buf[ps_end] = 0x00;
 
 	pkcs1pad_sg_set_buf(req_ctx->in_sg, req_ctx->in_buf,
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 079923d43ce2..b09b9408ec44 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -962,11 +962,11 @@ static char *generate_random_sgl_divisions(struct test_sg_division *divs,
 		if (div == &divs[max_divs - 1] || get_random_u32_below(2) == 0)
 			this_len = remaining;
 		else
-			this_len = 1 + get_random_u32_below(remaining);
+			this_len = get_random_u32_between(1, remaining + 1);
 		div->proportion_of_total = this_len;
 
 		if (get_random_u32_below(4) == 0)
-			div->offset = (PAGE_SIZE - 128) + get_random_u32_below(128);
+			div->offset = get_random_u32_between(PAGE_SIZE - 128, PAGE_SIZE);
 		else if (get_random_u32_below(2) == 0)
 			div->offset = get_random_u32_below(32);
 		else
@@ -1094,12 +1094,12 @@ static void generate_random_testvec_config(struct testvec_config *cfg,
 	}
 
 	if (get_random_u32_below(2) == 0) {
-		cfg->iv_offset = 1 + get_random_u32_below(MAX_ALGAPI_ALIGNMASK);
+		cfg->iv_offset = get_random_u32_between(1, MAX_ALGAPI_ALIGNMASK + 1);
 		p += scnprintf(p, end - p, " iv_offset=%u", cfg->iv_offset);
 	}
 
 	if (get_random_u32_below(2) == 0) {
-		cfg->key_offset = 1 + get_random_u32_below(MAX_ALGAPI_ALIGNMASK);
+		cfg->key_offset = get_random_u32_between(1, MAX_ALGAPI_ALIGNMASK + 1);
 		p += scnprintf(p, end - p, " key_offset=%u", cfg->key_offset);
 	}
 
@@ -1653,7 +1653,7 @@ static void generate_random_hash_testvec(struct shash_desc *desc,
 	if (maxkeysize) {
 		vec->ksize = maxkeysize;
 		if (get_random_u32_below(4) == 0)
-			vec->ksize = 1 + get_random_u32_below(maxkeysize);
+			vec->ksize = get_random_u32_between(1, maxkeysize + 1);
 		generate_random_bytes((u8 *)vec->key, vec->ksize);
 
 		vec->setkey_error = crypto_shash_setkey(desc->tfm, vec->key,
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index c73621aabbd1..cfb85d00ab6e 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -129,7 +129,7 @@ enum mhi_pm_state {
 #define PRIMARY_CMD_RING				0
 #define MHI_DEV_WAKE_DB					127
 #define MHI_MAX_MTU					0xffff
-#define MHI_RANDOM_U32_NONZERO(bmsk)			(get_random_u32_below(bmsk) + 1)
+#define MHI_RANDOM_U32_NONZERO(bmsk)			(get_random_u32_between(1, bmsk + 1))
 
 enum mhi_er_type {
 	MHI_ER_TYPE_INVALID = 0x0,
diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 9fbad7317d9b..bb46b57cc230 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -400,7 +400,7 @@ static int __find_race(void *arg)
 		struct dma_fence *fence = dma_fence_get(data->fc.tail);
 		int seqno;
 
-		seqno = get_random_u32_below(data->fc.chain_length) + 1;
+		seqno = get_random_u32_between(1, data->fc.chain_length + 1);
 
 		err = dma_fence_chain_find_seqno(&fence, seqno);
 		if (err) {
diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 631e31718bd0..b8af158c9e37 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -3807,7 +3807,7 @@ static int cma_alloc_any_port(enum rdma_ucm_port_space ps,
 
 	inet_get_local_port_range(net, &low, &high);
 	remaining = (high - low) + 1;
-	rover = get_random_u32_below(remaining) + low;
+	rover = get_random_u32_between(low, remaining + low);
 retry:
 	if (last_used_port != rover) {
 		struct rdma_bind_list *bind_list;
diff --git a/drivers/infiniband/hw/hns/hns_roce_ah.c b/drivers/infiniband/hw/hns/hns_roce_ah.c
index b37d2a81584d..02481487b203 100644
--- a/drivers/infiniband/hw/hns/hns_roce_ah.c
+++ b/drivers/infiniband/hw/hns/hns_roce_ah.c
@@ -41,9 +41,8 @@ static inline u16 get_ah_udp_sport(const struct rdma_ah_attr *ah_attr)
 	u16 sport;
 
 	if (!fl)
-		sport = get_random_u32_below(IB_ROCE_UDP_ENCAP_VALID_PORT_MAX +
-					     1 - IB_ROCE_UDP_ENCAP_VALID_PORT_MIN) +
-			IB_ROCE_UDP_ENCAP_VALID_PORT_MIN;
+		sport = get_random_u32_between(IB_ROCE_UDP_ENCAP_VALID_PORT_MIN,
+					       IB_ROCE_UDP_ENCAP_VALID_PORT_MAX + 1);
 	else
 		sport = rdma_flow_label_to_udp_sport(fl);
 
diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 274a31b93100..d4d7c6dac001 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -1405,7 +1405,7 @@ static void ns_do_bit_flips(struct nandsim *ns, int num)
 	if (bitflips && get_random_u16() < (1 << 6)) {
 		int flips = 1;
 		if (bitflips > 1)
-			flips = get_random_u32_below(bitflips) + 1;
+			flips = get_random_u32_between(1, bitflips + 1);
 		while (flips--) {
 			int pos = get_random_u32_below(num * 8);
 			ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
diff --git a/drivers/net/wireguard/selftest/allowedips.c b/drivers/net/wireguard/selftest/allowedips.c
index 78a916f30c82..34d5981f4513 100644
--- a/drivers/net/wireguard/selftest/allowedips.c
+++ b/drivers/net/wireguard/selftest/allowedips.c
@@ -285,7 +285,7 @@ static __init bool randomized_test(void)
 
 	for (i = 0; i < NUM_RAND_ROUTES; ++i) {
 		get_random_bytes(ip, 4);
-		cidr = get_random_u32_below(32) + 1;
+		cidr = get_random_u32_between(1, 32 + 1);
 		peer = peers[get_random_u32_below(NUM_PEERS)];
 		if (wg_allowedips_insert_v4(&t, (struct in_addr *)ip, cidr,
 					    peer, &mutex) < 0) {
@@ -311,7 +311,7 @@ static __init bool randomized_test(void)
 				mutated[k] = (mutated[k] & mutate_mask[k]) |
 					     (~mutate_mask[k] &
 					      get_random_u8());
-			cidr = get_random_u32_below(32) + 1;
+			cidr = get_random_u32_between(1, 32 + 1);
 			peer = peers[get_random_u32_below(NUM_PEERS)];
 			if (wg_allowedips_insert_v4(&t,
 						    (struct in_addr *)mutated,
@@ -329,7 +329,7 @@ static __init bool randomized_test(void)
 
 	for (i = 0; i < NUM_RAND_ROUTES; ++i) {
 		get_random_bytes(ip, 16);
-		cidr = get_random_u32_below(128) + 1;
+		cidr = get_random_u32_between(1, 128 + 1);
 		peer = peers[get_random_u32_below(NUM_PEERS)];
 		if (wg_allowedips_insert_v6(&t, (struct in6_addr *)ip, cidr,
 					    peer, &mutex) < 0) {
@@ -355,7 +355,7 @@ static __init bool randomized_test(void)
 				mutated[k] = (mutated[k] & mutate_mask[k]) |
 					     (~mutate_mask[k] &
 					      get_random_u8());
-			cidr = get_random_u32_below(128) + 1;
+			cidr = get_random_u32_between(1, 128 + 1);
 			peer = peers[get_random_u32_below(NUM_PEERS)];
 			if (wg_allowedips_insert_v6(&t,
 						    (struct in6_addr *)mutated,
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
index 23c971b77965..0e6bf5e5c8a9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
@@ -1128,7 +1128,7 @@ static void brcmf_p2p_afx_handler(struct work_struct *work)
 	if (afx_hdl->is_listen && afx_hdl->my_listen_chan)
 		/* 100ms ~ 300ms */
 		err = brcmf_p2p_discover_listen(p2p, afx_hdl->my_listen_chan,
-						100 * (1 + get_random_u32_below(3)));
+						100 * get_random_u32_between(1, 4));
 	else
 		err = brcmf_p2p_act_frm_search(p2p, afx_hdl->peer_listen_chan);
 
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c b/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
index 1696fbf1009a..f0b94633834e 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
@@ -1099,7 +1099,7 @@ static void iwl_mvm_mac_ctxt_cmd_fill_ap(struct iwl_mvm *mvm,
 			iwl_mvm_mac_ap_iterator, &data);
 
 		if (data.beacon_device_ts) {
-			u32 rand = get_random_u32_below(64 - 36) + 36;
+			u32 rand = get_random_u32_between(36, 64);
 			mvmvif->ap_beacon_time = data.beacon_device_ts +
 				ieee80211_tu_to_usec(data.beacon_int * rand /
 						     100);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 334415d946f8..8319fdc59fb4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2588,7 +2588,7 @@ static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 	curseg->alloc_type = LFS;
 	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
 		curseg->fragment_remained_chunk =
-				get_random_u32_below(sbi->max_fragment_chunk) + 1;
+				get_random_u32_between(1, sbi->max_fragment_chunk + 1);
 }
 
 static int __next_free_blkoff(struct f2fs_sb_info *sbi,
@@ -2625,9 +2625,9 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
 			/* To allocate block chunks in different sizes, use random number */
 			if (--seg->fragment_remained_chunk <= 0) {
 				seg->fragment_remained_chunk =
-				   get_random_u32_below(sbi->max_fragment_chunk) + 1;
+				   get_random_u32_between(1, sbi->max_fragment_chunk + 1);
 				seg->next_blkoff +=
-				   get_random_u32_below(sbi->max_fragment_hole) + 1;
+				   get_random_u32_between(1, sbi->max_fragment_hole + 1);
 			}
 		}
 	}
diff --git a/kernel/kcsan/selftest.c b/kernel/kcsan/selftest.c
index 7b619f16a492..eed30ad29796 100644
--- a/kernel/kcsan/selftest.c
+++ b/kernel/kcsan/selftest.c
@@ -31,7 +31,7 @@ static bool __init test_encode_decode(void)
 	int i;
 
 	for (i = 0; i < ITERS_PER_TEST; ++i) {
-		size_t size = get_random_u32_below(MAX_ENCODABLE_SIZE) + 1;
+		size_t size = get_random_u32_between(1, MAX_ENCODABLE_SIZE + 1);
 		bool is_write = !!get_random_u32_below(2);
 		unsigned long verif_masked_addr;
 		long encoded_watchpoint;
diff --git a/lib/test_hexdump.c b/lib/test_hexdump.c
index efc50fd30a44..f4ff3041ec10 100644
--- a/lib/test_hexdump.c
+++ b/lib/test_hexdump.c
@@ -149,7 +149,7 @@ static void __init test_hexdump(size_t len, int rowsize, int groupsize,
 static void __init test_hexdump_set(int rowsize, bool ascii)
 {
 	size_t d = min_t(size_t, sizeof(data_b), rowsize);
-	size_t len = get_random_u32_below(d) + 1;
+	size_t len = get_random_u32_between(1, d + 1);
 
 	test_hexdump(len, rowsize, 4, ascii);
 	test_hexdump(len, rowsize, 2, ascii);
@@ -208,11 +208,11 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
 static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
 {
 	unsigned int i = 0;
-	int rs = (get_random_u32_below(2) + 1) * 16;
+	int rs = get_random_u32_between(1, 3) * 16;
 
 	do {
 		int gs = 1 << i;
-		size_t len = get_random_u32_below(rs) + gs;
+		size_t len = get_random_u32_between(gs, rs + gs);
 
 		test_hexdump_overflow(buflen, rounddown(len, gs), rs, gs, ascii);
 	} while (i++ < 3);
@@ -223,11 +223,11 @@ static int __init test_hexdump_init(void)
 	unsigned int i;
 	int rowsize;
 
-	rowsize = (get_random_u32_below(2) + 1) * 16;
+	rowsize = get_random_u32_between(1, 3) * 16;
 	for (i = 0; i < 16; i++)
 		test_hexdump_set(rowsize, false);
 
-	rowsize = (get_random_u32_below(2) + 1) * 16;
+	rowsize = get_random_u32_between(1, 3) * 16;
 	for (i = 0; i < 16; i++)
 		test_hexdump_set(rowsize, true);
 
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 6d10187eddac..da5efc8b8543 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -126,7 +126,7 @@ __test(const char *expect, int elen, const char *fmt, ...)
 	 * be able to print it as expected.
 	 */
 	failed_tests += do_test(BUF_SIZE, expect, elen, fmt, ap);
-	rand = 1 + get_random_u32_below(elen + 1);
+	rand = get_random_u32_between(1, elen + 2);
 	/* Since elen < BUF_SIZE, we have 1 <= rand <= BUF_SIZE. */
 	failed_tests += do_test(rand, expect, elen, fmt, ap);
 	failed_tests += do_test(0, expect, elen, fmt, ap);
diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 104f09ea5fcc..7a2caf4596c5 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -151,7 +151,7 @@ static int random_size_alloc_test(void)
 	int i;
 
 	for (i = 0; i < test_loop_count; i++) {
-		n = get_random_u32_below(100) + 1;
+		n = get_random_u32_between(1, 101);
 		p = vmalloc(n * PAGE_SIZE);
 
 		if (!p)
@@ -291,12 +291,12 @@ pcpu_alloc_test(void)
 		return -1;
 
 	for (i = 0; i < 35000; i++) {
-		size = get_random_u32_below(PAGE_SIZE / 4) + 1;
+		size = get_random_u32_between(1, PAGE_SIZE / 4 + 1);
 
 		/*
 		 * Maximum PAGE_SIZE
 		 */
-		align = 1 << (get_random_u32_below(11) + 1);
+		align = 1 << get_random_u32_between(1, 12);
 
 		pcpu[i] = __alloc_percpu(size, align);
 		if (!pcpu[i])
diff --git a/mm/kasan/kasan_test.c b/mm/kasan/kasan_test.c
index 640f9c7f8e44..6167e19056f0 100644
--- a/mm/kasan/kasan_test.c
+++ b/mm/kasan/kasan_test.c
@@ -1299,7 +1299,7 @@ static void match_all_not_assigned(struct kunit *test)
 	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_KASAN_GENERIC);
 
 	for (i = 0; i < 256; i++) {
-		size = get_random_u32_below(1024) + 1;
+		size = get_random_u32_between(1, 1024 + 1);
 		ptr = kmalloc(size, GFP_KERNEL);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
 		KUNIT_EXPECT_GE(test, (u8)get_tag(ptr), (u8)KASAN_TAG_MIN);
@@ -1308,7 +1308,7 @@ static void match_all_not_assigned(struct kunit *test)
 	}
 
 	for (i = 0; i < 256; i++) {
-		order = get_random_u32_below(4) + 1;
+		order = get_random_u32_between(1, 5);
 		pages = alloc_pages(GFP_KERNEL, order);
 		ptr = page_address(pages);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
@@ -1321,7 +1321,7 @@ static void match_all_not_assigned(struct kunit *test)
 		return;
 
 	for (i = 0; i < 256; i++) {
-		size = get_random_u32_below(1024) + 1;
+		size = get_random_u32_between(1, 1024 + 1);
 		ptr = vmalloc(size);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
 		KUNIT_EXPECT_GE(test, (u8)get_tag(ptr), (u8)KASAN_TAG_MIN);
diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
index 20028c179796..99abe86fc9b1 100644
--- a/mm/kfence/kfence_test.c
+++ b/mm/kfence/kfence_test.c
@@ -532,7 +532,7 @@ static void test_free_bulk(struct kunit *test)
 	int iter;
 
 	for (iter = 0; iter < 5; iter++) {
-		const size_t size = setup_test_cache(test, 8 + get_random_u32_below(300),
+		const size_t size = setup_test_cache(test, get_random_u32_between(8, 308),
 						     0, (iter & 1) ? ctor_set_x : NULL);
 		void *objects[] = {
 			test_alloc(test, size, GFP_KERNEL, ALLOCATE_RIGHT),
diff --git a/mm/swapfile.c b/mm/swapfile.c
index e9318305a24a..08f0152c32da 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -772,8 +772,7 @@ static void set_cluster_next(struct swap_info_struct *si, unsigned long next)
 		/* No free swap slots available */
 		if (si->highest_bit <= si->lowest_bit)
 			return;
-		next = si->lowest_bit +
-			get_random_u32_below(si->highest_bit - si->lowest_bit + 1);
+		next = get_random_u32_between(si->lowest_bit, si->highest_bit + 1);
 		next = ALIGN_DOWN(next, SWAP_ADDRESS_SPACE_PAGES);
 		next = max_t(unsigned int, next, si->lowest_bit);
 	}
@@ -3089,7 +3088,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		 */
 		for_each_possible_cpu(cpu) {
 			per_cpu(*p->cluster_next_cpu, cpu) =
-				1 + get_random_u32_below(p->highest_bit);
+				get_random_u32_between(1, p->highest_bit + 1);
 		}
 		nr_cluster = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index b2f9679066c4..bab37a529db5 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -7373,9 +7373,8 @@ static int get_conn_info(struct sock *sk, struct hci_dev *hdev, void *data,
 	/* To avoid client trying to guess when to poll again for information we
 	 * calculate conn info age as random value between min/max set in hdev.
 	 */
-	conn_info_age = hdev->conn_info_min_age +
-			get_random_u32_below(hdev->conn_info_max_age -
-					     hdev->conn_info_min_age);
+	conn_info_age = get_random_u32_between(hdev->conn_info_min_age,
+					       hdev->conn_info_max_age);
 
 	/* Query controller to refresh cached values if they are too old or were
 	 * never read.
diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index 95da2ddc1c20..5eb401003368 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -2380,9 +2380,8 @@ static void set_cur_queue_map(struct pktgen_dev *pkt_dev)
 	else if (pkt_dev->queue_map_min <= pkt_dev->queue_map_max) {
 		__u16 t;
 		if (pkt_dev->flags & F_QUEUE_MAP_RND) {
-			t = get_random_u32_below(pkt_dev->queue_map_max -
-						 pkt_dev->queue_map_min + 1) +
-			    pkt_dev->queue_map_min;
+			t = get_random_u32_between(pkt_dev->queue_map_min,
+						   pkt_dev->queue_map_max + 1);
 		} else {
 			t = pkt_dev->cur_queue_map + 1;
 			if (t > pkt_dev->queue_map_max)
@@ -2478,9 +2477,8 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 
 	if (pkt_dev->udp_src_min < pkt_dev->udp_src_max) {
 		if (pkt_dev->flags & F_UDPSRC_RND)
-			pkt_dev->cur_udp_src = get_random_u32_below(
-				pkt_dev->udp_src_max - pkt_dev->udp_src_min) +
-				pkt_dev->udp_src_min;
+			pkt_dev->cur_udp_src = get_random_u32_between(pkt_dev->udp_src_min,
+								      pkt_dev->udp_src_max);
 
 		else {
 			pkt_dev->cur_udp_src++;
@@ -2491,9 +2489,8 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 
 	if (pkt_dev->udp_dst_min < pkt_dev->udp_dst_max) {
 		if (pkt_dev->flags & F_UDPDST_RND) {
-			pkt_dev->cur_udp_dst = get_random_u32_below(
-				pkt_dev->udp_dst_max - pkt_dev->udp_dst_min) +
-				pkt_dev->udp_dst_min;
+			pkt_dev->cur_udp_dst = get_random_u32_between(pkt_dev->udp_dst_min,
+								      pkt_dev->udp_dst_max);
 		} else {
 			pkt_dev->cur_udp_dst++;
 			if (pkt_dev->cur_udp_dst >= pkt_dev->udp_dst_max)
@@ -2508,7 +2505,7 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 		if (imn < imx) {
 			__u32 t;
 			if (pkt_dev->flags & F_IPSRC_RND)
-				t = get_random_u32_below(imx - imn) + imn;
+				t = get_random_u32_between(imn, imx);
 			else {
 				t = ntohl(pkt_dev->cur_saddr);
 				t++;
@@ -2530,8 +2527,7 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 				if (pkt_dev->flags & F_IPDST_RND) {
 
 					do {
-						t = get_random_u32_below(imx - imn) +
-						    imn;
+						t = get_random_u32_between(imn, imx);
 						s = htonl(t);
 					} while (ipv4_is_loopback(s) ||
 						ipv4_is_multicast(s) ||
@@ -2578,9 +2574,8 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 	if (pkt_dev->min_pkt_size < pkt_dev->max_pkt_size) {
 		__u32 t;
 		if (pkt_dev->flags & F_TXSIZE_RND) {
-			t = get_random_u32_below(pkt_dev->max_pkt_size -
-						 pkt_dev->min_pkt_size) +
-			    pkt_dev->min_pkt_size;
+			t = get_random_u32_between(pkt_dev->min_pkt_size,
+						   pkt_dev->max_pkt_size);
 		} else {
 			t = pkt_dev->cur_pkt_size + 1;
 			if (t > pkt_dev->max_pkt_size)
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index f90cadd9ba5c..27fcc33d16f5 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -3646,7 +3646,7 @@ static void tcp_send_challenge_ack(struct sock *sk)
 
 		WRITE_ONCE(net->ipv4.tcp_challenge_timestamp, now);
 		WRITE_ONCE(net->ipv4.tcp_challenge_count,
-			   half + get_random_u32_below(ack_limit));
+			   get_random_u32_between(half, ack_limit + half));
 	}
 	count = READ_ONCE(net->ipv4.tcp_challenge_count);
 	if (count > 0) {
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index d5551d9e382d..3238a9246548 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -104,7 +104,7 @@ static inline u32 cstamp_delta(unsigned long cstamp)
 static inline s32 rfc3315_s14_backoff_init(s32 irt)
 {
 	/* multiply 'initial retransmission time' by 0.9 .. 1.1 */
-	u64 tmp = (900000 + get_random_u32_below(200001)) * (u64)irt;
+	u64 tmp = get_random_u32_between(900000, 1100001) * (u64)irt;
 	do_div(tmp, 1000000);
 	return (s32)tmp;
 }
@@ -112,11 +112,11 @@ static inline s32 rfc3315_s14_backoff_init(s32 irt)
 static inline s32 rfc3315_s14_backoff_update(s32 rt, s32 mrt)
 {
 	/* multiply 'retransmission timeout' by 1.9 .. 2.1 */
-	u64 tmp = (1900000 + get_random_u32_below(200001)) * (u64)rt;
+	u64 tmp = get_random_u32_between(1900000, 2100001) * (u64)rt;
 	do_div(tmp, 1000000);
 	if ((s32)tmp > mrt) {
 		/* multiply 'maximum retransmission time' by 0.9 .. 1.1 */
-		tmp = (900000 + get_random_u32_below(200001)) * (u64)mrt;
+		tmp = get_random_u32_between(900000, 1100001) * (u64)mrt;
 		do_div(tmp, 1000000);
 	}
 	return (s32)tmp;
diff --git a/net/netfilter/nf_nat_helper.c b/net/netfilter/nf_nat_helper.c
index bf591e6af005..a12c3470f7fd 100644
--- a/net/netfilter/nf_nat_helper.c
+++ b/net/netfilter/nf_nat_helper.c
@@ -223,7 +223,7 @@ u16 nf_nat_exp_find_port(struct nf_conntrack_expect *exp, u16 port)
 		if (res != -EBUSY || (--attempts_left < 0))
 			break;
 
-		port = min + get_random_u32_below(range);
+		port = get_random_u32_between(min, range + min);
 	}
 
 	return 0;
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 40f831854774..c118476f73ae 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2072,7 +2072,7 @@ int xfrm_alloc_spi(struct xfrm_state *x, u32 low, u32 high)
 	} else {
 		u32 spi = 0;
 		for (h = 0; h < high-low+1; h++) {
-			spi = low + get_random_u32_below(high - low + 1);
+			spi = get_random_u32_between(low, high + 1);
 			x0 = xfrm_state_lookup(net, mark, &x->id.daddr, htonl(spi), x->id.proto, x->props.family);
 			if (x0 == NULL) {
 				newspi = htonl(spi);
-- 
2.38.1

