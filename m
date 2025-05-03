Return-Path: <linux-parisc+bounces-3585-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BEAA81BE
	for <lists+linux-parisc@lfdr.de>; Sat,  3 May 2025 18:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041F11B6222F
	for <lists+linux-parisc@lfdr.de>; Sat,  3 May 2025 16:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2AE264F88;
	Sat,  3 May 2025 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtV8mmo4"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F77266EF9
	for <linux-parisc@vger.kernel.org>; Sat,  3 May 2025 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746290349; cv=none; b=KgOO2nR8+1ao8PT8wqlNu9jMUOGaW1icuIFC3yG70D1LhrRleWA6RtK+TYEsn1SkGvVZrW49uovCo8CCAG/mUOdcHJCd19hVwNNbVUKS31WIacd2NeQT6oz19tfqiKezU9VtIzIw0frn0q6v73w7wwZ6kOZ/skuzf13/5f/28cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746290349; c=relaxed/simple;
	bh=/XycjQCFG+Skwe8Er7o+fFgr2QfmbE2ofunL451Oelg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+UsUdeAr/IFICNVc67nGLjVnh5o1sBn1LArJCLTt/KJUaSzaloXS7U2ZayiTr2Wkqu+iVYNGNY2HKOA7xiI/iHpQuK15qiyAqhHIK3SI4ICPDom583IIb8kdiYnhUQkZTfGyiix4k0sM2Nf0VEImz+JPRx6Rslqhuuv3rOEvtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtV8mmo4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9FFC4CEE3;
	Sat,  3 May 2025 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746290348;
	bh=/XycjQCFG+Skwe8Er7o+fFgr2QfmbE2ofunL451Oelg=;
	h=From:To:Cc:Subject:Date:From;
	b=AtV8mmo4r2+QTYeg1p1iu9YE2jylQwsHm/w2sS4jZVwANDIOAzy/I8A8Iw3PWur1l
	 66mBg2tC8A8OXPrFSewrEI0TZ6RRLQNBqqws/RkkSyY1zLNetFT9YETNEYMFmsSAxD
	 eH+UGGlzqANKzgNfgecRpANvM4bi4stgw9k6ph2dgCltffPrjD1t2MuPVwtVoTpYrp
	 tSNOMHxai1lDjrC3zohxWa7SOib9ikSfRBFI90gx9OHjG/dQXUKPWNTh/85fizJAso
	 RiiEZ/vlabivFoZ+AVbH5q5FtriPcYLJEaRJkrPT/dTV1uKtJUKTcuyyz1DsYmhKGL
	 Qe0roOqNRbJHg==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Camm Maguire <camm@maguirefamily.org>
Subject: [PATCH] parisc: Fix double SIGFPE crash
Date: Sat,  3 May 2025 18:38:53 +0200
Message-ID: <20250503163853.4770-1-deller@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Camm noticed that on parisc a SIGFPE exception may triggger a second
SIGFPE in the glibc part of the signal handler which then finally leads
to a crash of the program.
This can easily be reproduced with this test program which will abort in the
second SIGFPE.

root@parisc:~# cat fpe.c

static void fpe_func(int sig, siginfo_t *i, void *v) {
        sigset_t set;
        sigemptyset(&set);
        sigaddset(&set, SIGFPE);
        sigprocmask(SIG_UNBLOCK, &set, NULL);
        printf("GOT signal %d with si_code %ld\n", sig, i->si_code);
}

int main() {
        struct sigaction action = {
                .sa_sigaction = fpe_func,
                .sa_flags = SA_RESTART|SA_SIGINFO };
        sigaction(SIGFPE, &action, 0);
        feenableexcept(FE_OVERFLOW);
        return printf("%lf\n",1.7976931348623158E308*1.7976931348623158E308);
}

root@parisc:~# gcc fpe.c -lm
root@parisc:~# ./a.out
Floating point exception

root@parisc:~# strace -f ./a.out
execve("./a.out", ["./a.out"], 0xf9ac7034 /* 20 vars */) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
...
rt_sigaction(SIGFPE, {sa_handler=0x1110a, sa_mask=[], sa_flags=SA_RESTART|SA_SIGINFO}, NULL, 8) = 0
--- SIGFPE {si_signo=SIGFPE, si_code=FPE_FLTOVF, si_addr=0x1078f} ---
--- SIGFPE {si_signo=SIGFPE, si_code=FPE_FLTOVF, si_addr=0xf8f21237} ---
+++ killed by SIGFPE +++
Floating point exception

Fix this by clearing the Trap (T) bit in the FP status register before
returning to the signal handler in userspace.

Signed-off-by: Helge Deller <deller@gmx.de>
Suggested-by: John David Anglin <dave.anglin@bell.net>
Reported-by: Camm Maguire <camm@maguirefamily.org>
---
 arch/parisc/math-emu/driver.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/math-emu/driver.c b/arch/parisc/math-emu/driver.c
index 34495446e051..15f183cbe915 100644
--- a/arch/parisc/math-emu/driver.c
+++ b/arch/parisc/math-emu/driver.c
@@ -97,9 +97,19 @@ handle_fpe(struct pt_regs *regs)
 
 	memcpy(regs->fr, frcopy, sizeof regs->fr);
 	if (signalcode != 0) {
-	    force_sig_fault(signalcode >> 24, signalcode & 0xffffff,
-			    (void __user *) regs->iaoq[0]);
-	    return -1;
+		int sig = signalcode >> 24;
+
+		if (sig == SIGFPE) {
+			/*
+			 * Clear floating point trap bit to avoid trapping
+			 * again on the first fstd/fld access in the userspace
+			 * signal handler.
+			 */
+			regs->fr[0] &= ~(1ULL << 38);
+		}
+		force_sig_fault(sig, signalcode & 0xffffff,
+				(void __user *) regs->iaoq[0]);
+		return -1;
 	}
 
 	return signalcode ? -1 : 0;
-- 
2.47.0


