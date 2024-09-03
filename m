Return-Path: <linux-parisc+bounces-2207-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6C969A21
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 12:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FBF51C23010
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 10:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C271B9829;
	Tue,  3 Sep 2024 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fq5pGlQZ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D2F1B9826
	for <linux-parisc@vger.kernel.org>; Tue,  3 Sep 2024 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359317; cv=none; b=RjPdtzny7Bp5tbq4W7IVZ5B2H5ONKuSujQvaGucEveCExiPtRXvBcFM21INJfCDxcETI95lTHlVcxoefnMQH9lwDw0IUYdXsaGczHLkVrxDpETCvZOAE7R5DbvUQ6Y5LKPIrjWz6A1ufvllW2easnnJWeHAGevzjQGf6LJuaVzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359317; c=relaxed/simple;
	bh=RYb6s9O54ICo2BwWX7TxXxyUNqLwOuWQoGQsY7xAbag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svRhHDXdWl1jqZ8Lpn8gQagD15M83TRE4p3xbwZ6WLm3oOiq/pHlOUlxMbMTfDM3n9DNv9OOV8hIBQGfsRyamX/NLelr6+SXR/wpn2THxRBn3A6NHPoqxpubu4r98YIpbEasOjqXzn0keWmw4GrEFdYow0/n6fA5mGwAxef7aEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fq5pGlQZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD318C4CEC8;
	Tue,  3 Sep 2024 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725359317;
	bh=RYb6s9O54ICo2BwWX7TxXxyUNqLwOuWQoGQsY7xAbag=;
	h=Date:From:To:Cc:Subject:From;
	b=fq5pGlQZXeskeTS60x9DkSiSkMkNhjKg6R9lxfYY0SMiSDo+gbLX6SsKFKgzaZiE/
	 gd4usIft49PWuOSYYHp8z8qWCwasjFmk578YDgWdD/GO9AXLVjlUI7ayn7HbGgHZYu
	 851F/n7gv9X9SBkOu3VpJ1o4qUPdiwSSmyLXhtDpBC7UmRa+PFOAnSSxy8+4R8m216
	 0OUcfuoDG7vqJj313htAI65oI1zzV8dI4XNjYLw4XgqcHpVLPTTGE3MBvCcoHQ3L7c
	 CKBXahHst5IoN95f1VRh14L5H9oFpofEbkwqOykAMl+8V8hQO+MvVKacUAzR6x9hMC
	 d1+nypREYKmSA==
Date: Tue, 3 Sep 2024 12:28:33 +0200
From: Helge Deller <deller@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: linux-parisc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] target/hppa: Fix PSW V-bit packaging in cpu_hppa_get for
 hppa64
Message-ID: <Ztbk0Vk35dDGLoCd@p100>
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
Fixes: 931adff31478 ("target/hppa: Update cpu_hppa_get/put_psw for hppa64")

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

