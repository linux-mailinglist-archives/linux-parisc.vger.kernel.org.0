Return-Path: <linux-parisc+bounces-3902-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF5B3E32A
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 14:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739CD203771
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 12:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C493326D71;
	Mon,  1 Sep 2025 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="XP7+ZoAj"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC91D341ACC
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729844; cv=none; b=DWJPnrR5FdRJ7h6NZmv2XP8iVBI+EGX07n/2dEoQyPQXDkYLciZ1dtq/zkK4FYFRLAlXdf3nsohxfTVChs0O8hjtx1g4NdiVawO0kuePpjn9ssuA8/pFUaSkncGgWMyGiM42mnZJ5o8EBGYUOny1xNhN3o/ReKImTGPYExBjWDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729844; c=relaxed/simple;
	bh=JLsm20nRUfCdVD6uJy+GUl3NfrLb9BR0ocnDc7c6Sws=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkyepZG6c4Eq/SQ15OsLv9FeRB1ge6/vtana9/I+jZ8a8NIoDVH+dA8Ll2i+KPfO4ZNUEQZ/jxgFFbmt84kVHsiNaJvJtE8lID6CzIHWp5/t5+fYXniIPYRpmdbBvA7y49CmRp6s7sew4t28p0fVms5dozWR2nCjPAH+BsalF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=XP7+ZoAj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so7857318a12.3
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756729841; x=1757334641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbWUBNes5mrbySu+U4Jj7Tp5fvMH1UIkvlFNU4FTVkY=;
        b=XP7+ZoAj2t+s/GqoFImqvaRcFKXis5a6i5gTR8BK58n5jcvvJvZHMf6vUAHpplIU51
         +SbrYotB8qxVo1h8sLJ84e8ImOgY98uja9OZndbkvHgLgHteEOLQ8edqMl6Eb4uivxya
         /9x2ggMJocoeC/7pAFQi6yrww/lmHDMRDlytUnW84ZYu9FuRZff8dkS5bL1Mc5k7iJ7+
         eChSaNk0sssJNnCct0MtOPjNu3J554hm5e77ImZd9KhHTI6Zn+8DWLjh/cTWTLUamb2K
         B3JEl57OmmcqJ/CZNam1VstrIWRULwuzdFIApVWAKSIKeChVcrm3dkw9iffdQEDGUfmx
         5ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729841; x=1757334641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbWUBNes5mrbySu+U4Jj7Tp5fvMH1UIkvlFNU4FTVkY=;
        b=Z7LmKGo5Up2X1wknkKhWRV1h8Am6KcSS31Ts+bEuviw0BNT+LKeXMRrWzzJ408Zzy3
         ytno7LX6i9nPVGAIQxbfcUQifr0RTpMnN2msMu6jRxCbhoH2j/bsRdfOGwmKd2w+Iyy1
         Mk3+r79mbzSgYekheJDp1dK74VVqwyFcaUB/BsHUFryQ67kQREveCzBZpTdaOQywpdRi
         QISKp58vTb7uUbm0zrFh59Dbmudk6KTvjZ7L99mD259Rg/6g/THCJU6fm/8Y2kkFeX++
         PmR8CHrqdsgpKjvRR5dDbL0ZhtbJWsmclp5+qlbBhuMhE4EmODGOP62N06xXkt6nnmM2
         7vtg==
X-Forwarded-Encrypted: i=1; AJvYcCWf6sMMn16VZRPfW0OwtKNHnzVE97gNr09G+jL+4jEYNnwI8RmwmyarSWfI6a8JofDT4HYhgLrgrfM24MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8NlXL7Rolue4M3XbKpdeplqgt/qZ3OSB7z8RMKF984b/aYjMe
	4uHphKW9I8O30jMrs8waF3I8Pq2G/k1bWDS4PRpVieOyDrqSNb8EBPuOyiMUQMv+z5k=
X-Gm-Gg: ASbGncvv/BJT3hK3vmRCmKUmiXznVn64opbCYOM29KZG4Gk4WSZBwBCmBC2Of/5EPfG
	U1Kdy5USrdOhVpUJ+MqueSHr1bp/jXHzZH/IfJE7Ehd9PTSjrF989Ge+A76cEurARsmF9BYQ3eO
	bJuuKVvxkOjeu1S6g1I9p2COLQLwkJJV52XPl3Qr78ZsJwimKDBDiglN47gGv7Ad/ovy/un/BT3
	bRuxhK+PN+785bvxUIOtzhoGyxstj3GcG88rw980cviwXg1w7mgYqc1SKoyAA33qxeZv+zd4nBV
	GjWbn7JynNYABRDcrupsZWxpptMM+oKlhaen5u9HWbH+stvqBQwr3aH/jY2XmdaAaWDKzGl2gJk
	7aGgYPwf+h8Te2IF7d/qFNB+BovsEOGpbkoNFehUAEhFcd/whxmxfcug1XGp7LZIPg0VOcO5VOu
	2uGVURZX+AUJeA9WslTmrX7kh+sDJoLoxM
X-Google-Smtp-Source: AGHT+IGRe72s+UHTnGokGr7x1pyG7G81cHBjYzB5waC3bIIZTDAVVMuEn5lgB7KxjuKhIwvrTnRPsQ==
X-Received: by 2002:a05:6402:2554:b0:61e:ae59:5f04 with SMTP id 4fb4d7f45d1cf-61eae597256mr563365a12.27.1756729840654;
        Mon, 01 Sep 2025 05:30:40 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f1d0f00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1d:f00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61eaf5883b6sm255566a12.20.2025.09.01.05.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:30:40 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	willy@infradead.org,
	hughd@google.com,
	mhocko@suse.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	vishal.moola@gmail.com,
	linux@armlinux.org.uk,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	weixugc@google.com,
	baolin.wang@linux.alibaba.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	max.kellermann@ionos.com,
	thuth@redhat.com,
	broonie@kernel.org,
	osalvador@suse.de,
	jfalempe@redhat.com,
	mpe@ellerman.id.au,
	nysal@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v5 04/12] fs: constify mapping related test functions for improved const-correctness
Date: Mon,  1 Sep 2025 14:30:20 +0200
Message-ID: <20250901123028.3383461-5-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901123028.3383461-1-max.kellermann@ionos.com>
References: <20250901123028.3383461-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We select certain test functions which either invoke each other,
functions that are already const-ified, or no further functions.

It is therefore relatively trivial to const-ify them, which
provides a basis for further const-ification further up the call
stack.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/fs.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3b9f54446db0..8dc46337467d 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -537,7 +537,8 @@ struct address_space {
 /*
  * Returns true if any of the pages in the mapping are marked with the tag.
  */
-static inline bool mapping_tagged(struct address_space *mapping, xa_mark_t tag)
+static inline bool mapping_tagged(const struct address_space *const mapping,
+				  const xa_mark_t tag)
 {
 	return xa_marked(&mapping->i_pages, tag);
 }
@@ -585,7 +586,7 @@ static inline void i_mmap_assert_write_locked(struct address_space *mapping)
 /*
  * Might pages of this file be mapped into userspace?
  */
-static inline int mapping_mapped(struct address_space *mapping)
+static inline int mapping_mapped(const struct address_space *const mapping)
 {
 	return	!RB_EMPTY_ROOT(&mapping->i_mmap.rb_root);
 }
@@ -599,7 +600,7 @@ static inline int mapping_mapped(struct address_space *mapping)
  * If i_mmap_writable is negative, no new writable mappings are allowed. You
  * can only deny writable mappings, if none exists right now.
  */
-static inline int mapping_writably_mapped(struct address_space *mapping)
+static inline int mapping_writably_mapped(const struct address_space *const mapping)
 {
 	return atomic_read(&mapping->i_mmap_writable) > 0;
 }
-- 
2.47.2


