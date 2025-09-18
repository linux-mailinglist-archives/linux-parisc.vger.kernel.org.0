Return-Path: <linux-parisc+bounces-3905-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE8B3E323
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 14:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A82A13A77F3
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 12:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B2934575A;
	Mon,  1 Sep 2025 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="IGWxn0AM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C434574E
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729850; cv=none; b=VSDusA7UdYmzs46J7k2of8I2RjH4mmvxVt9H/QDD6WSgrobJ0Kpm4Oa/Mnnf8E8Xl8nLLcKLyWcaadasK3KE223zkRGpKL7zyPvEqGNun9c9ycZ0G0cba1ormpfl6t7ni+MpU4u7Oyi9WXBwvVXlZnZmyg7vX8iQ+vq6v9xdi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729850; c=relaxed/simple;
	bh=oY+kVrJSUNMT6cURQZxHlXP0Zp0Aq1m5o0k1qFqpfkg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBXqltbhUJ4Mn0FZafw31LnJma3u6XsEZGY9UTGBp7F+w7JwSPJBd/omGl8mg8xUv3PncEjt9FqvwMUg5/Ztb7MIIXyzsHVtXO7nHFdXNrAwQgObz1BUDjjcwUMlvJMervV2vSUnNHIW5McDq5B+pKCBYqXRMtEQLxosoe8g628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=IGWxn0AM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aff0775410eso395360566b.0
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756729846; x=1757334646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TakQ8h85rIAa1grDUxPMVyoALGVgUpKOsAVdRA9oxes=;
        b=IGWxn0AMjS7kGyrlVUR+4CL7D3H6J/2wHRGBk0IEFRRq50Z/9BMQkC3kD7SFCdanyf
         LWoObgGoAcB4Ll0Mrg99BgD1jqghxx1/+4TeO1cUqPvlh2ZJZTDK3jPspzsN4vXPzIAd
         +G5FCUQErcl37gyIi3W5p+vvIW4chQ1C7AmPLfwLXIEwlgO+FHsVjUek75c2caWvPTaz
         dIVY6jvCc/5S5gpJh2LgqoolixwNxw5xosp6bEIOyGHEyEOu59XAE93ObyWJlQ5s9UNv
         827S8WtDxpF8JF1lgnec72E4HJaKH32O7PAmo7EcuI5LSq6jP2YvLlegnbFESRjv/FuQ
         GonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729846; x=1757334646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TakQ8h85rIAa1grDUxPMVyoALGVgUpKOsAVdRA9oxes=;
        b=SoXG8EEAMmZ7bA9UqEXHMkn8nJYqzhC9O9Dv4LlsTwuZ52UFfK01yM01FR0exFIpma
         GdfKzMD86d2PQesOZMWmF34QqC84ei3feWveFi1rSGLf8Rzqh6F1+XY7/xEZjuWdHJHQ
         ydetGUp0eTc1QzIUVv8IVQo4V2Y6IZVK+5OnkkOr4gv2niwvZHfjDJITYBvYyWkHroM/
         k42YpMKA6UWiChMpGt+uZ4b01rKPoZAQ+0vMMCU1chOf2OQWaw6fCJyaRwyJJpgmxtLG
         2/SgwqiHoecLHHxDGsnfsb1vd0goYMl9K+Tg/LniJ6AVue2KMvKbd8AsbLwRn0VV5Ef2
         NPog==
X-Forwarded-Encrypted: i=1; AJvYcCVi9+T0YtrvSt65xHtIF54oEUeMIhvMUACTwTh5yyZDn+t/w71esyx53wJ12ZddYq9yAGA0TDWFWzeUeTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsluhZO1ONmkMaHSVQBkn9g9QP4N/zdR2IytiNFsaGcWeRY1Fx
	LeuaeQVNFGTBiYzqmF2oIrY7BKebmC6g8M3Dow3IFjguHF3JK+BIuLwI1pFbMeTRDIM=
X-Gm-Gg: ASbGncu999y9a/7LOq7FWg503c66Byg+t6+mU2k6L3XEXjHKYtbOj85jtjxvD010B7q
	jfTdS+XXiK+AD9pVAfvhwS6smTOU8lskRsSuLZdePEY9jabl/0Hn00BuTHLMGYC0tVZQ4he88mD
	3McLN/xn3pHGwDAHHQpp0D4bBS0ZGTogg/Uhhylho5dAQdUvhb8+ZMvGMFEwHbey5LtxtUgC2x3
	7JBtiXSDNkwff96VyXB9vx+qy8ZO8tu45xSWTSKOCWuFtEJy7HCoUojXJIbNf/WGQnVW0KWtxSR
	IbiQbSigKocLvglGdRHji41BNc208QjIEdlhV5C/D4NPcXkbIQe/bQ5SmtZ7tekJ40ZInnHgmE2
	bwYje4tAxLg70tWu8XSxiy3J//GubKiTtZm6rPFtZy8+f7H4ITbJixY1f3ATOfZC3TFpMuy8LZw
	M/Ejes5iaHqggnIRtsJt8XxgknBdaA2bc6
X-Google-Smtp-Source: AGHT+IEFyUt84N4Cv2kdLXAVUn+1e4FWCkv0k7DfQxCZiqDejVRSf4epoqkxZrOG2Uh7zwz0dBY6jw==
X-Received: by 2002:a17:907:7f1f:b0:afe:94d7:7283 with SMTP id a640c23a62f3a-b01083377eamr695696366b.32.1756729846177;
        Mon, 01 Sep 2025 05:30:46 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f1d0f00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1d:f00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61eaf5883b6sm255566a12.20.2025.09.01.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:30:45 -0700 (PDT)
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
Subject: [PATCH v5 07/12] parisc: constify mmap_upper_limit() parameter for improved const-correctness
Date: Mon,  1 Sep 2025 14:30:23 +0200
Message-ID: <20250901123028.3383461-8-max.kellermann@ionos.com>
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

This piece is necessary to make the `rlim_stack` parameter to
mmap_base() const.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/parisc/include/asm/processor.h | 2 +-
 arch/parisc/kernel/sys_parisc.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 4c14bde39aac..dd0b5e199559 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -48,7 +48,7 @@
 #ifndef __ASSEMBLER__
 
 struct rlimit;
-unsigned long mmap_upper_limit(struct rlimit *rlim_stack);
+unsigned long mmap_upper_limit(const struct rlimit *rlim_stack);
 unsigned long calc_max_stack_size(unsigned long stack_max);
 
 /*
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f852fe274abe..c2bbaef7e6b7 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -77,7 +77,7 @@ unsigned long calc_max_stack_size(unsigned long stack_max)
  * indicating that "current" should be used instead of a passed-in
  * value from the exec bprm as done with arch_pick_mmap_layout().
  */
-unsigned long mmap_upper_limit(struct rlimit *rlim_stack)
+unsigned long mmap_upper_limit(const struct rlimit *const rlim_stack)
 {
 	unsigned long stack_base;
 
-- 
2.47.2


