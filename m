Return-Path: <linux-parisc+bounces-2222-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C196A7B3
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 21:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34BFD284F9B
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 19:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204FC1DC729;
	Tue,  3 Sep 2024 19:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHbsP6K+"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AA81DC72B
	for <linux-parisc@vger.kernel.org>; Tue,  3 Sep 2024 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725392792; cv=none; b=nSzDjm4eGtkdwB0wSkeWuvpX5cHDWPqHF1+z0oeQWHtSFTDXDbFLfp28NKFfP2hYztDpwWmfnwsjzCfQpj5Y6exWlVDGfMDq0VZqk8HaU9P3T2TUn3upY+jKm0uvbyrmvuNGAUadlR06u2iMhDBmfUiFeErVq2by/IwCe9QORUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725392792; c=relaxed/simple;
	bh=ysZPsnNd3kpF3n+8IozMgz2v1zNkNppqWJ1IaiWjDiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kwGkQ6Zsk4PfLxPwomV6Ii952MFTvHOZOSpVIyvb1CEz6s93Cx61VZSVcJDqmJ715OiNwn4F4XxQ1DTNSea7MmdGjsgk0xcRhKfAkV/VDL3MZIdF2AyicSxXN1MC83RVapLkSWOd7AnXttfPkAsalcJESXiE4NJjiuvwucHJkWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHbsP6K+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3770CC4CEC4;
	Tue,  3 Sep 2024 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725392791;
	bh=ysZPsnNd3kpF3n+8IozMgz2v1zNkNppqWJ1IaiWjDiM=;
	h=Date:From:To:Cc:Subject:From;
	b=lHbsP6K+Z+Yw07JvPU9U4ZHcRYoP+zNZqQ73tjeOl7IZNpJY5BW13Y7HHvb+e5ost
	 NIvBGIY/Tkn6rdQVrLMahHOxlojmZPltdPzvw1L5Sq5gFEfK9Yxj2zF22//IctGzhG
	 AItQsKsge0o1h/VqBKlwZxbyeq9ZZ+862siqPSNkF/VdVpn3+jtgEiCCIqUK8UlRIP
	 4Ax8YVbpYqcHlswj4OVLJBl+DVtb3FQMGb7iolrwyzniriKuzA7pSBjHQQlEuQxRuQ
	 qZ7uLktnrhXEU31gczK+OQWINpOA8U3C3hP6dZ/CaivRhoORNb/ZWSHR4UnXgNrVs8
	 SY6x4SraNBIYQ==
Date: Tue, 3 Sep 2024 21:46:27 +0200
From: Helge Deller <deller@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: linux-parisc@vger.kernel.org
Subject: [PATCH v2] target/hppa: Fix PSW V-bit packaging in cpu_hppa_get for
 hppa64
Message-ID: <ZtdnkxJP31cxxnf3@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

While adding hppa64 support, the psw_v variable got extended from 32 to 64
bits.  So, when packaging the PSW-V bit from the psw_v variable for interrupt
processing, check bit 31 instead the 63th (sign) bit.

This fixes a hard to find Linux kernel boot issue where the loss of the PSW-V
bit due to an ITLB interruption in the middle of a series of ds/addc
instructions (from the divU milicode library) generated the wrong division
result and thus triggered a Linux kernel crash.

Link: https://lore.kernel.org/lkml/718b8afe-222f-4b3a-96d3-93af0e4ceff1@roeck-us.net/
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 931adff31478 ("target/hppa: Update cpu_hppa_get/put_psw for hppa64")
Cc: qemu-stable@nongnu.org # v8.2+

---
v2:
- added change to cpu.h (as requested by Richard)
- added Richards R-b
- added stable CC tag

diff --git a/target/hppa/helper.c b/target/hppa/helper.c
index b79ddd8184..d4b1a3cd5a 100644
--- a/target/hppa/helper.c
+++ b/target/hppa/helper.c
@@ -53,7 +53,7 @@ target_ulong cpu_hppa_get_psw(CPUHPPAState *env)
     }
 
     psw |= env->psw_n * PSW_N;
-    psw |= (env->psw_v < 0) * PSW_V;
+    psw |= ((env->psw_v >> 31) & 1) * PSW_V;
     psw |= env->psw | env->psw_xb;
 
     return psw;
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 56d9568d6c..43074d80bf 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -211,7 +211,7 @@ typedef struct CPUArchState {
     uint32_t psw;            /* All psw bits except the following:  */
     uint32_t psw_xb;         /* X and B, in their normal positions */
     target_ulong psw_n;      /* boolean */
-    target_long psw_v;       /* in most significant bit */
+    target_long psw_v;       /* in bit 31 */
 
     /* Splitting the carry-borrow field into the MSB and "the rest", allows
      * for "the rest" to be deleted when it is unused, but the MSB is in use.

