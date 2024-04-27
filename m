Return-Path: <linux-parisc+bounces-1245-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7A8B474C
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Apr 2024 19:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22E58281FF0
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Apr 2024 17:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E381411D5;
	Sat, 27 Apr 2024 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRkIYij1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23D612B75
	for <linux-parisc@vger.kernel.org>; Sat, 27 Apr 2024 17:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714239836; cv=none; b=jLLP9gA5vwMrGuJT7IaCMWP5dvLLUbKEfR+7/nQJGi7OdPXA3a5AHvdSnmy7NCP3hunYhKVrJEuK8YhlH3pukYsdSfNedudG+wfk5zV+jNInd3DRhGj/WR6/iZhLJ+63lnKqpd3YI+L8guhkVZyxSKswkk0TgOU9G7CKKYynKMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714239836; c=relaxed/simple;
	bh=8FNQpk5WSEanTyFb5HMVAWpCkggEhZ0EMHJjTXAmtdE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJtg2crbJFa/SAHqD7/F2rslLjjXqtyQvTMan8x4o3aN70MKpeCgeIRbuIATfHb593O+eDTIYlgWcMn+ghdbSsvosYFAh2PFHygif3VLjmHTpbimc/Xru//tggKlyH3pnGkXQUCGh6qPwgnp7Op1Xms3v232d+QyCva01Cyf6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRkIYij1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8576EC113CE;
	Sat, 27 Apr 2024 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714239835;
	bh=8FNQpk5WSEanTyFb5HMVAWpCkggEhZ0EMHJjTXAmtdE=;
	h=Date:From:To:Subject:From;
	b=gRkIYij1X42mwJWJ0yWQZqY79sCWml1W3Jcf/VYQUcG2Fnv9yI1tCtRJFSskYnroI
	 sJnjMF/ODaPxXAk5uiWam/UYVAF/1B8HNyOrzvkjduiSg4xlFVyWlC3/3RRknRKhAw
	 GsJmWtZe6Rk9facgtwioY3FJ/XsEO36QFN5urfCIzNA2pYedinV0MhfMl9Rvuk9rrw
	 wUT0EjZsMrtQ9f5J/Ax12Qk20r0MQs3I6m/CKAiYPMVoqWwR1NBXvvGAV6XTadKgai
	 jN+Zpd4Eyz7pZqKwHg6IUAYq8XzxgNi8nvd92UOzdO9GqZT+tJp+j1Hy5SaII5JqAP
	 fdTg8xO3kmM3Q==
Date: Sat, 27 Apr 2024 19:43:51 +0200
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Move sigset_t typedef to parisc uapi header file
Message-ID: <Zi05V6zEVXgXV5IL@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The util-linux debian package fails to build on parisc, because
sigset_t isn't defined in asm/signal.h when included from userspace.
Move the sigset_t type into the uapi header to fix the build.

Link: https://buildd.debian.org/status/fetch.php?pkg=util-linux&arch=hppa&ver=2.40-7&stamp=1714163443&raw=0
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v6.0+

diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
index 715c96ba2ec8..e84883c6b4c7 100644
--- a/arch/parisc/include/asm/signal.h
+++ b/arch/parisc/include/asm/signal.h
@@ -4,23 +4,11 @@
 
 #include <uapi/asm/signal.h>
 
-#define _NSIG		64
-/* bits-per-word, where word apparently means 'long' not 'int' */
-#define _NSIG_BPW	BITS_PER_LONG
-#define _NSIG_WORDS	(_NSIG / _NSIG_BPW)
-
 # ifndef __ASSEMBLY__
 
 /* Most things should be clean enough to redefine this at will, if care
    is taken to make libc match.  */
 
-typedef unsigned long old_sigset_t;		/* at least 32 bits */
-
-typedef struct {
-	/* next_signal() assumes this is a long - no choice */
-	unsigned long sig[_NSIG_WORDS];
-} sigset_t;
-
 #include <asm/sigcontext.h>
 
 #endif /* !__ASSEMBLY */
diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/uapi/asm/signal.h
index 8e4895c5ea5d..40d7a574c5dd 100644
--- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -57,10 +57,20 @@
 
 #include <asm-generic/signal-defs.h>
 
+#define _NSIG		64
+#define _NSIG_BPW	(sizeof(unsigned long) * 8)
+#define _NSIG_WORDS	(_NSIG / _NSIG_BPW)
+
 # ifndef __ASSEMBLY__
 
 #  include <linux/types.h>
 
+typedef unsigned long old_sigset_t;	/* at least 32 bits */
+
+typedef struct {
+	unsigned long sig[_NSIG_WORDS];
+} sigset_t;
+
 /* Avoid too many header ordering problems.  */
 struct siginfo;
 

