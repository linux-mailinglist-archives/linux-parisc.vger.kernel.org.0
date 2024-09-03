Return-Path: <linux-parisc+bounces-2210-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8F896A4A8
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 18:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EA971F21DEE
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 16:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAED18BBA5;
	Tue,  3 Sep 2024 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJ+nWiG2"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C811E492
	for <linux-parisc@vger.kernel.org>; Tue,  3 Sep 2024 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381686; cv=none; b=s3RM7IKOZ6+cXqqka6tiNY3c9Ju9sQcJ1UrfdVlF+CaVzCPzDNUQ17jMos8DjxNU8xWzDAoF5iR5d9UToYU3p9ozuSmnFuLnCGuMy9siJC7Jt/sE7uIoXbibgxgP4OXlrogmbTuaU23+d6OrS4NNu9WawHw3UB1qie34FYKRwtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381686; c=relaxed/simple;
	bh=N5itbBNwcKzNlXtLrNFjkDqkY6ASrGrYF8VbZ4aaX+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DYopSkdw3QcbR2HfvabL1xGfJvXoWIbSnMR8UXPafeBg1vToqTEwQq7VkNPAIGJPt8+BsGAVWHDxrEEUlgG6tTXPpJPl/uIR+ICBHe0VBy11kpjFcdqv5Hq2NWn2jJgGBuFfzFchi6vKo60G99Ns8hxGGN1tPHDWgepiNvyUmGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJ+nWiG2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7815EC4CEC4;
	Tue,  3 Sep 2024 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725381685;
	bh=N5itbBNwcKzNlXtLrNFjkDqkY6ASrGrYF8VbZ4aaX+4=;
	h=Date:From:To:Cc:Subject:From;
	b=dJ+nWiG2H4IzhJD3NfVHSEzPs9Vy0X/uOsB6OGBTo2NiIvw17ULialHLDWir17fpk
	 vtD7xAbABIhX3QX4MAjtDRuAXSh1hUxQS07q7SYPGvohCzTAiZVITq2/k3RaljmMty
	 04nsgl5qsvqCq5JoX0gwr8vtA8zcEBtI3jsCqifTHQk+T4+Uqza38TqtlyNA9fsvDZ
	 GHfikp4zZcw6tynBRCN9YjawiRHmWpaURRPWGlAQzBxvtisZdLALfvyrm2YChmSrPQ
	 icD8vZqNJeISRdilIuADlwngp8RdZpT514daRK4hi4s9l89eg6+ohB7f6bj+ThPkJd
	 /79HPUjmGg8EA==
Date: Tue, 3 Sep 2024 18:41:21 +0200
From: Helge Deller <deller@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: linux-parisc@vger.kernel.org
Subject: [PATCH] target/hppa: Fix random 32-bit linux-user crashes
Message-ID: <Ztc8MaxI8SfD71mx@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The linux-user hppa target crashes randomly for me since commit
081a0ed188d8 ("target/hppa: Do not mask in copy_iaoq_entry").

That commit dropped the masking of the IAOQ addresses while copying them
from other registers and instead keeps them with all 64 bits up until
the full gva is formed with the help of hppa_form_gva_psw().

So, when running in linux-user mode on an emulated 64-bit CPU, we need
to mask to a 32-bit address space at the very end in hppa_form_gva_psw()
if the PSW-W flag isn't set (which is the case for linux-user on hppa).

Fixes: 081a0ed188d8 ("target/hppa: Do not mask in copy_iaoq_entry")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 2bcb3b602b..56d9568d6c 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -319,7 +319,7 @@ static inline target_ulong hppa_form_gva_psw(target_ulong psw, uint64_t spc,
                                              target_ulong off)
 {
 #ifdef CONFIG_USER_ONLY
-    return off;
+    return off & gva_offset_mask(psw);
 #else
     return spc | (off & gva_offset_mask(psw));
 #endif

