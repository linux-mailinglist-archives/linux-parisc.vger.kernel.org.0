Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C854BAAB9
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Feb 2022 21:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243937AbiBQUUV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Feb 2022 15:20:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbiBQUUU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Feb 2022 15:20:20 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2260B1451DC
        for <linux-parisc@vger.kernel.org>; Thu, 17 Feb 2022 12:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645129200;
        bh=slLux7enVKWYUMnvnAoZKEeISAUoGHHwaLpZc56UOgw=;
        h=X-UI-Sender-Class:Date:Subject:References:To:From:In-Reply-To;
        b=jwn7sH8Prn63SRyhATdGP90QI0Fp/Tz+67IZU4+HIUNLHvn9+ipXCuUlhAb11bX0c
         iynpsXKTU+DP6SXBdWkkuKxCWeKEkqbiFz/ybFTXk0yphMp5kkl51NRXcL5DYMQxjC
         SM/iybnBR7Ncq6JLAM82xpQcIKT82cy9h255smc8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.175.13]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4b1y-1nJ8pa14X0-001fcb; Thu, 17
 Feb 2022 21:20:00 +0100
Message-ID: <d8aeab0d-979b-d35d-0f4c-eac5b7ad31d4@gmx.de>
Date:   Thu, 17 Feb 2022 21:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Fwd: [PATCH v6 33/71] parisc: Remove mmap linked list from cache
 handling
Content-Language: en-US
References: <20220215144241.3812052-33-Liam.Howlett@oracle.com>
To:     linux-parisc <linux-parisc@vger.kernel.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220215144241.3812052-33-Liam.Howlett@oracle.com>
X-Forwarded-Message-Id: <20220215144241.3812052-33-Liam.Howlett@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/ofp4kHkreLC4px1tx4gNIeBI+rMuWzl3E9AwVspRhbPwr6Dqt0
 3yWIrYuaPa2B0bzZTFsID6llxXeqBBBqMpzzJrgUlNCV9/wMIz0un/pLV62B6P7t6pMLm9m
 8NqC28G1JViQJKSeLm4x0fYPd/m11+KSk9pq45CwwS2T9qug0Q0rmWgisSgJizniGF1mlaL
 tfsxnleChPtxOf9TF8X3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qvzssCbDai0=:cmxDp42kK+VEIIy5wsKXj8
 5G3nmKdfq2BZ8u3cbv1EsEqlkT2Fe/+TIK3WKWoo5EQoo+Gh68UNUUqjPpil0pKoTLYcroNZZ
 G0MHv1hUzWW021Z9lSk5xs5nAsNSGCMOorjLi8s/YpDoXRWThHssf0ATqdKPn7g7+wbeXLea/
 RFn9MBxj9+dw3g2dAgS4D2letkN6Mut2KiiU64y9z6tLlAgVx4UCxRbydl8Sht0nPVwVUYQTz
 ewzaDP5ExWt70EpSYjO2hdOHqAqnW6A32iMt4b+z0FWW8hpRJOoK2OcNaB22miyDoEgkFr/Au
 dAjMVW/Al0+yhNnC8012PGe3Vd7XvRIHZDa4iTKzlIP0PVwWg9S0aopYqlaiV74cV56UDgRDn
 LFURSGFFatsYav/wosIhV24ockZbylDNWNOqq+D6TlMvwPr//4biHf3yB6P83T1j/71ZbARHc
 9YAxtBm1KS/6eNIpSO8U6zXMulPsQquRTtF1lQlrzlvJabhL7OQxwhfdsxgPj/V8fy05L8oQ+
 nGPcDJT8KWzEf+MpB2Dh+/Q6FBB/h1paywZX/WBpMt4apfZrGKOiJfom0hA8P2SW1mKn+uM8F
 8RAtCtpG3dnhG2UENLKUiWRIEu23PnV4MwRia6clShc4FZX6prmeMuqVvTQv+RVBXyfwexiv6
 2p8T8SeykdcEMGxcnKaTcjFvV+lmzMglRyTgMqhJTGvAukkSGGcAUUw3t/WGscFXxZ9WreTET
 KXI123qfwLWNs+v2pruSJ9toaZdmWwUGFM7yAH3vkWJYj4PRDanM34qqeUoLFOCvM/Ci+/4M2
 hnLb7qc+UsQjTdUh/IkXA+90jaZqRr9RCvXLzrdiElnbb8llmecoDObPJtFwT/1+KE/AuV++7
 34e5joKUiIAR+ywx54q8ydpa2R8lpCXdv2pl35kKZR5hWJUtZmChV5ljzFnSFdjMb/RBVx01v
 ujqTmLOymUpebjO497VJVfDLIqeZDgxDG6x6DokUB6KzLhHtbmV0vbL+3AqMi5VEmzanCl4M1
 tI+9+eiraTHMYBUBADOwYWTmsqqh862kIxBxzvKoISq/MOVpXeW4NG1dD30h773fXSWDGIkCl
 6JDQO+O1xOa5lQ=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

To be queued up after next merge window:

From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>

Use the VMA iterator instead.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
=2D--
 arch/parisc/kernel/cache.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 94150b91c96f..c3a8d29b6f9f 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -519,9 +519,11 @@ static inline unsigned long mm_total_size(struct mm_s=
truct *mm)
 {
 	struct vm_area_struct *vma;
 	unsigned long usize =3D 0;
+	VMA_ITERATOR(vmi, mm, 0);

-	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
+	for_each_vma(vmi, vma)
 		usize +=3D vma->vm_end - vma->vm_start;
+
 	return usize;
 }

@@ -570,6 +572,7 @@ static void flush_user_cache_tlb(struct vm_area_struct=
 *vma,
 void flush_cache_mm(struct mm_struct *mm)
 {
 	struct vm_area_struct *vma;
+	VMA_ITERATOR(vmi, mm, 0);

 	/* Flushing the whole cache on each cpu takes forever on
 	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
@@ -583,13 +586,13 @@ void flush_cache_mm(struct mm_struct *mm)

 	preempt_disable();
 	if (mm->context =3D=3D mfsp(3)) {
-		for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
+		for_each_vma(vmi, vma)
 			flush_user_cache_tlb(vma, vma->vm_start, vma->vm_end);
 		preempt_enable();
 		return;
 	}

-	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
+	for_each_vma(vmi, vma)
 		flush_cache_pages(vma, mm, vma->vm_start, vma->vm_end);
 	preempt_enable();
 }
=2D-
2.34.1
