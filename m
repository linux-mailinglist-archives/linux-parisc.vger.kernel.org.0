Return-Path: <linux-parisc+bounces-4275-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00829C5F049
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Nov 2025 20:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A8B33351C77
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Nov 2025 19:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42F02E091D;
	Fri, 14 Nov 2025 19:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDv/yGil"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362C72DC34E
	for <linux-parisc@vger.kernel.org>; Fri, 14 Nov 2025 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147651; cv=none; b=A3iuR6BwgsZFx4uUikmitu0OYAv7ePl8smvYWphhHmGvsmuWolC0hl6R12M3wU59aSCRydkPU7hUolGseWCxDIxXLMxv1R4J8j/9rJQRhM0K/r6iX17nu9FvE0oV51uTJAp+bcVR4cU/k0ilxWK+E/9cJXmsXvMHbUax4pBd9mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147651; c=relaxed/simple;
	bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmstczBKN23NpvyteXAcqN6okq1ioxIRVOCE7dm/SzNpRhEAgDqfUqoblhPYSvx84wwdwObSDz3XE5iAEpyn4Ai5MeyOTXU5YCghTUO59lmKndP6gxQ/4JUfpX8bKaVTbDmREt94/lA5Sz8TMFV6vlEgoKqXwgeQqvgFxo3kSmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDv/yGil; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso3681776a12.1
        for <linux-parisc@vger.kernel.org>; Fri, 14 Nov 2025 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763147647; x=1763752447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=mDv/yGilxm1t28vSlrre/2ltqEgfZcjvcB4hu8QNA/8xV80FIFn/c0aNSUre4ryXEq
         CvvXFpucKzKj215etP67wAyZfJIiaYsh35yDVgi1XAeciX6KncBmSiBNzODol0dTCixP
         +vzj6Nc7sfceoJqLdFjj+Tevf5kVtCW0G9cphFgQ8D5XIW+PW2HAEOXf7ZamiFGxWQlf
         jop4KKWm3xTg5IQWmFjy7wZqiLcEXpmSjJi1szpCLzVkmN0bm/TyXmpDQb+bkCMYbggB
         R6ZfxFXONOZC7zLWDJzwAmGpi7URO5Lv/Ld7FF9ZmMyFQQfLBzPpQhORyMrW/dsAqojt
         pBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763147647; x=1763752447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=pbNWFzj51a04gxzcub2HFE/LDWXEJKt0ymlAuB2RdieA5wyASx7466FvZC8TSRO8xw
         raXh7Lub2EVA+CbYzwfqmuEvcqwzq3SZGeV0pRnSNrT4cthKG5Gd6KAuoU49jgjVo9bA
         7wZnUG3lzCtaRUVehAiS0lUHq+HH3g+dnxgYTjpXWDrkVxnYC7gKE997zPqTb8guvD9M
         Lv5KSTSynbB4Lz2swO7QDPcgRsF4b7LDV++soodgq62JHzaIOkdRcl+/+IMD47xtBFZR
         ki60gTmTcjbUtO08jLwlTr3EGzEYAHfWEC+YBS9QNl1PAqR84iLCXPrzn4vwGFBz7efU
         Hmhg==
X-Forwarded-Encrypted: i=1; AJvYcCVYFnhkZSSSj7r37SMMmeRKcO0MBUUhWcqrlYp3zmq1CtQECAZ/VcVNAa9qTXCUxqvnKJH6y5E++ne7kE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTembKsVFijFtohN83H8MdatNId5QAzjbjl15fQFSkHgnEE7la
	1pkCd+hZfDQJSB3y+IZj7LFd870YC8DIfdgOYrVLCU/ipG1esHOM78wW5kVzeEAwTyZUKZdV/qn
	5aSWSkoNwC8WG8QU9mYviX4xLvoAFCbg=
X-Gm-Gg: ASbGncvvu78KsoxaIW3TLPJ/kvOSRrNN+oSvhGyJpFUjigo4bgo4pp4vTKkBwbDGZl4
	z2do3T9Q+Y0i3asmxOiH/3qTEELYAOaSMbrcCZ9usRkH8vOJo7SKN+j9IDcZMpM/uafClPehZVv
	92gHZ5W8P/Jf/q0GBnSwUQ+y8XrHSx9ErwiTTl1HTq3mvHbHxQGpHGJyanYq/caTkBNNwjvVjhl
	tln0UWGJZJpAW5KeorAWrx6Z+DcIVb2cFhj3O8EgXu1hIi+ILpGYa8ABqBFsg==
X-Google-Smtp-Source: AGHT+IEvBu7ESLrGNRMv2QiwL16IZgt6aUNJ72TYzx+vz9COzg0vAhK2L9oI/n3nL6QJ1JU+lRhqexZnJfrgTYt3DEI=
X-Received: by 2002:a05:6402:4603:b0:640:f974:7629 with SMTP id
 4fb4d7f45d1cf-64350e225e0mr3893696a12.15.1763147647239; Fri, 14 Nov 2025
 11:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763117269.git.zhengqi.arch@bytedance.com> <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 14 Nov 2025 20:13:55 +0100
X-Gm-Features: AWmQ_blqeEJIFeEqLe5Vq5SGpFC4UPadwiIAm270RAB9lR4JL9-RyEZ3PVaRM7w
Message-ID: <CA+=Fv5SGu_Y-zwryrQiTQDy32SipMk_dfjZezth1=aZmnDKNeA@mail.gmail.com>
Subject: Re: [PATCH 1/7] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, 
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org, 
	david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I applied your patches to a fresh pull of torvalds/linux.git repo but was unable
to build the kernel (on Alpha) with this patch applied.

I made the following changes in order to get it to build on Alpha:

diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
index 7e9455a18aae..6761b0c282bf 100644
--- a/mm/pt_reclaim.c
+++ b/mm/pt_reclaim.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/hugetlb.h>
-#include <asm-generic/tlb.h>
 #include <asm/pgalloc.h>
+#include <asm/tlb.h>

 #include "internal.h"


/Magnus

