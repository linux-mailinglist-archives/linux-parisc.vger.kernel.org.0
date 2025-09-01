Return-Path: <linux-parisc+bounces-3877-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E1B3DDF7
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 11:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A5F3B1776
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Sep 2025 09:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B0530DEB1;
	Mon,  1 Sep 2025 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Dl7V1wER"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F2C30DD0D
	for <linux-parisc@vger.kernel.org>; Mon,  1 Sep 2025 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718375; cv=none; b=jcPUDm/eZy/0f/8pug05swMf+0s6aknoMKsrRn46JIbieFLMT+dXvn1FimwcmQtTgq0bnxE0fVbEAsdlBGsjTHY3ZIwrmNG+VdEamYxMHatNqdLw+jhDXjk07rtGn81jrBVGNQnE/npXu+EQdiok0dchhBVXlaaoz35aG8K3ZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718375; c=relaxed/simple;
	bh=fqMfYftVrFkOy3wbJRO7r0XLlbG/lU+7XLovauzZWxo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDbEOHwUn3tlvXFW6OjGTCKNi/NYsZJd7uJrrtoZErZGfNSWeEvjrBB2Qi3sUEogRKtSeX3WLkAqG1vUOwXzml+BEKr5+UsvvnjG/h78aSlTaFwozM/MwbojjY8WF+yARBl0cQRm7DY8tbYZo6NOCWD8eZbkw3dL20KxIUOmXH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Dl7V1wER; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afede1b3d05so694640466b.2
        for <linux-parisc@vger.kernel.org>; Mon, 01 Sep 2025 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756718371; x=1757323171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8H3eprdm8oiBq+0anIaTODIO0eIcUyIWc/5jJ7tDkes=;
        b=Dl7V1wERFzMleKB/mcdbkOLSfivKh/0qTbbLHtW40hL12fF/PHC6FBC8qSvS+8F/AH
         5823j13P3EjHQyBXddCElPlgiJAomY75h48tIKrF7Aiqehm9JKkfycrMNH8tpoI8wWhE
         1kV99t9hXTKOXn52zT9HzwBCAp5xD3jTg0cA4HwqoPkGOq+MUNBgc4RNYD67veOaFXv5
         yMZaKCwx/18ovZe7OG6CWpIBvjMi9DTLZhuoxCYTOkVPoG3Z2oVQNvrAnl7JC2RXUv/e
         CqNkBD/dICQCC+BKKzxrAq0FOGHnwGkJC+NZt0j7I/UEBoL31gvVNsHRUc9JZHTuF0S0
         ksig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718371; x=1757323171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8H3eprdm8oiBq+0anIaTODIO0eIcUyIWc/5jJ7tDkes=;
        b=piD7iP4isX40NHXwdmCsYzSx4a7XDAh3RiccDync7teb5vVsnSXmkfOCC4fW7TUkdK
         okr6/AD0DkFDxHtzF601+sdu4e2dCbjD3EjQGFT+M11yTWnVuWCftCmne+oh4AVEpNRF
         0dv8lmOddlnkw3UxAJxXMhoXWdIlCkjXLcmMS/9LKJNo7RotAD1p/JAdFad1gzu1Sq87
         xbnLQScUOfuJeIievaB9PFmuwNzWwF1OjS8u49zEoMgbKz4G+KylYljjDLMTSqi3zl/3
         JmpPH7sdh5fuqWfpFNoHnIMyCXHMTZ5megk2hqovw2R9XbTjWRDC7ivsS56+o0MPUggm
         /TiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJgLCQdut3hLVZCONf46qmXSG56AHz3FA4/DVLjbdSw0HEehPvCKmLenMTQZRetMpeG/4Bl7+lLvSiVKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG1+7IlAjzdSSMlv19auqcV1prdLZq5DVNOFIC9kIJSRxONtC9
	t136fy04b8EENy9gINNKa2ZUJDl5IxWy3oKS508uPtVNkBYYDUkWCtY76gGrb8BGHn4=
X-Gm-Gg: ASbGncs0UK4Dfb8WTiVoU3h+iWrPohQT5oSoU1vdcA5LtFkRjP0g47n4DkXRpsw10Km
	usoDXWLhtbEmeTDZLonSJqedDt9/oAYNWlTd57sjuOCjzX1qGrv1nYgjtwOzrA+SnWumnfgtsbq
	/TIwDrQvB2aztw6b2yEEuKLidqoAB9OBATWveBmqgH3nFKbBvp8z27d7rMgtpZ1yWyFlcd+QVcG
	CvOq450GT+VaGPt4X0/HyjCJRe/L7Wi1Ty91qIKIugv5N2fGUspFRTW4Iog6z32dn4pU84A8PBA
	LpnLqIvNu/+ncxBC1y4Qox+p+Pbx3MAltIpg3kpgEN3hrkE8ZTJD0atfZaajRKRaZbvetu0iyyA
	ruMJdi+0Rkhvndb9G7iF/3OjXgXmZPETb6l3f0HQIT91XUfvpHv0dLfET9h6a4OcvbIf2aUAB3Z
	MAlaZOpDbJCHR+pjtjiBMkuLL6ZhI9NEgp
X-Google-Smtp-Source: AGHT+IF3CGqBNxa77EXUE/Gi7n0PBGLpiMmjL4vqume2Hy8S1ALFuVUh9cDg4qepPIlJtHhtd6svhA==
X-Received: by 2002:a17:907:7ea7:b0:b00:5399:f5c0 with SMTP id a640c23a62f3a-b01f20bfff5mr728590366b.62.1756718371341;
        Mon, 01 Sep 2025 02:19:31 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f1d0f00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1d:f00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm541005766b.12.2025.09.01.02.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:19:31 -0700 (PDT)
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
Subject: [PATCH v4 04/12] fs: add const to pointer parameters for improved const-correctness
Date: Mon,  1 Sep 2025 11:19:07 +0200
Message-ID: <20250901091916.3002082-5-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901091916.3002082-1-max.kellermann@ionos.com>
References: <20250901091916.3002082-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory management (mm) subsystem is a fundamental low-level component
of the Linux kernel. Establishing const-correctness at this foundational
level enables higher-level subsystems, such as filesystems and drivers,
to also adopt const-correctness in their interfaces. This patch lays
the groundwork for broader const-correctness throughout the kernel
by starting with the core mm subsystem.

This patch adds const qualifiers to address_space pointer parameters
in filesystem-related functions that do not modify the referenced memory,
improving type safety and enabling compiler optimizations.

Functions improved:
- mapping_tagged()
- mapping_mapped()
- mapping_writably_mapped()

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


