Return-Path: <linux-parisc+bounces-2268-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF2F970944
	for <lists+linux-parisc@lfdr.de>; Sun,  8 Sep 2024 20:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AED5B20EA5
	for <lists+linux-parisc@lfdr.de>; Sun,  8 Sep 2024 18:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2028844C77;
	Sun,  8 Sep 2024 18:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Piu3VgaV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3E2B9CD
	for <linux-parisc@vger.kernel.org>; Sun,  8 Sep 2024 18:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725821482; cv=none; b=N+qi+UJH+nL+NiA7ldt1USJRHnDsoim2hGjIS48WQbsz5BbntWYIQrD3EzrkjRqPosfdcyQEe5OyzLjVsqLWlKZLkN6sqHSxWQ8q/ivO/bTKOF/9PLvT6WBmSJ9TBF8k4Qzm2ZbVOpc7sMwjp9AUqOUFdcjczasBJd6ERq4dSY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725821482; c=relaxed/simple;
	bh=CMvCMaXFooTc/vw7oOum0Vslb/uxmtOTugHpBJ3j37Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJQTtFChPcc/NaM8gGLGkOzlhO8wku3S8/TAkCoQmZCoylQ063NE4W5xY1bOVQktbK1yQG0v4u34Nx4c2WWKYTHFi9py2nhs6JaQTTQxnRd8QwykFWHG3YxIU7UhNZEht1yxGorLDIlO2jjHcoqUIeNXaBfYgZmo5uZGoU8+TOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Piu3VgaV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727D4C4CEC3;
	Sun,  8 Sep 2024 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725821481;
	bh=CMvCMaXFooTc/vw7oOum0Vslb/uxmtOTugHpBJ3j37Q=;
	h=Date:From:To:Cc:Subject:From;
	b=Piu3VgaVomwQsHzW3s2jjJ1ipdRWtNc9wi3/ldTrSCnK0B6CNRe8I5xJinVYYITSc
	 MPpyiWxutiVi43toZgPKDQo5EGFIdZpMxNvrI1oFf6m0TFbtvVezmgQaWRIdtNLThP
	 /oKAyGUMjGMDXr5FYQeun+1mwIUtlkoyj62mnkOooIxgxYiXp+Z40M8CZTHdDRUQa5
	 xQIwpXOEPDkIadow+v58dAmvsawSbXOFXclS9hqSMaB74pw8fhsTpzIU9a4t8tw2gm
	 8F4d+9yX19h2/ba6ieKr03W7Q8ofeWpYUHIMT51j+pO6MbP5266ajeyMiQpThuNyOP
	 4t7YRzXgQdAqg==
Date: Sun, 8 Sep 2024 20:51:17 +0200
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Cc: Camm Maguire <camm@maguirefamily.org>
Subject: [PATCH] parisc: Allow mmap(MAP_STACK) memory to automatically expand
 upwards
Message-ID: <Zt3yJUiczUBmEC3a@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When userspace allocates memory with mmap() in order to be used for
stack, allow this memory region to automatically expand upwards up until
the current maximum process stack size.
The fault handler checks if the VM_GROWSUP bit is set in the vm_flags
field of a memory area before it allows it to expand.

Reported-by: Camm Maguire <camm@maguirefamily.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org	# v5.10+

diff --git a/arch/parisc/include/asm/mman.h b/arch/parisc/include/asm/mman.h
index 47c5a1991d10..89b6beeda0b8 100644
--- a/arch/parisc/include/asm/mman.h
+++ b/arch/parisc/include/asm/mman.h
@@ -11,4 +11,18 @@ static inline bool arch_memory_deny_write_exec_supported(void)
 }
 #define arch_memory_deny_write_exec_supported arch_memory_deny_write_exec_supported
 
+static inline unsigned long arch_calc_vm_flag_bits(unsigned long flags)
+{
+	/*
+	 * The stack on parisc grows upwards, so if userspace requests memory
+	 * for a stack, mark it with VM_GROWSUP so that the stack expansion in
+	 * the fault handler will work.
+	 */
+	if (flags & MAP_STACK)
+		return VM_GROWSUP;
+
+	return 0;
+}
+#define arch_calc_vm_flag_bits(flags) arch_calc_vm_flag_bits(flags)
+
 #endif /* __ASM_MMAN_H__ */

