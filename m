Return-Path: <linux-parisc+bounces-420-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19228839402
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 16:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5C6F28C0B5
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jan 2024 15:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AA261686;
	Tue, 23 Jan 2024 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dk5AOyso"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A561685
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706025567; cv=none; b=f4NOCSjXjnOTaonC0m/G5HriF9+5gsMDE0aYjvb6JMqABYF2fhJjJRLiBH1gN0eZnHdmXN85Es90nZ2uT+lv99LGORyp0CiY5HlVKsC+KztEjcvECAx1izrkRkdQ+QIFr44ODA+jykI9S+fa9DUu6TIUAKfiNW2L3MHFBYQKx18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706025567; c=relaxed/simple;
	bh=WcpaIEMpSjU3C3PqiJDZ9DOWvjHubsEjtMySkQqBnYo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHkNY3NGdESdgVvnXsieJcSDtDwGuqYf4KLucYfRKes/+glRlf3v/WyuUQT+HstWCTiCKwMtYiWFEng/+3OWnw4R/Fh+QXxYP25Y0ZopG+g1ZwPLwNeGWuz7EJOsVUFnLKIt7acMvcntpaZpi/3XR3CWgs9+72msmegWWDtcUhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dk5AOyso; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D82C433F1
	for <linux-parisc@vger.kernel.org>; Tue, 23 Jan 2024 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706025567;
	bh=WcpaIEMpSjU3C3PqiJDZ9DOWvjHubsEjtMySkQqBnYo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dk5AOysoD++pR3XRp5n6dhsbyYqq6DI/Qw5Vk7UKl3Mh4osRFE84+CSnPxcnNszt9
	 QOc+rIkfUGjne0H8uEoQWzfpnEg2sxf1aAb62ryD8EWKiVvhMgP7zeIX1NMMIqCUyK
	 DUgfJmVAsVppF05SFIuaLCXEH2vVtD9ND/ObkbAZTOcFvsWgc+/4cOdkvDtqD/irOm
	 CYO5uxvEtOkUG5PAgkAmBE+GhD6kwKy960GYUUBb4wGuktcz3AxXl3Np7xX4Ki6skf
	 PBLB0EB7A2VFKFpX0EXxWilepbqMEgQLRTvd0oer7sAzfrW6/qr8F1bGxAl+aIiN+N
	 CzJh1gl3zZx5g==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 7/7] parisc: Show kernel unaligned memory accesses
Date: Tue, 23 Jan 2024 16:59:04 +0100
Message-ID: <20240123155904.6220-7-deller@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123155904.6220-1-deller@kernel.org>
References: <20240123155904.6220-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Warn if some kernel function triggers unaligned memory accesses.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/unaligned.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
index c520e551a165..95a2741f26f3 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -399,6 +399,13 @@ void handle_unaligned(struct pt_regs *regs)
 
 		if (!unaligned_enabled)
 			goto force_sigbus;
+	} else {
+		static DEFINE_RATELIMIT_STATE(kernel_ratelimit, 5 * HZ, 5);
+		if (!(current->thread.flags & PARISC_UAC_NOPRINT) &&
+			__ratelimit(&kernel_ratelimit))
+			pr_warn("Kernel: unaligned access to " RFMT " in %pS "
+					"(iir " RFMT ")\n",
+				regs->ior, (void *)regs->iaoq[0], regs->iir);
 	}
 
 	/* handle modification - OK, it's ugly, see the instruction manual */
-- 
2.43.0


