Return-Path: <linux-parisc+bounces-3586-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03EAA81D3
	for <lists+linux-parisc@lfdr.de>; Sat,  3 May 2025 19:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ED03189D117
	for <lists+linux-parisc@lfdr.de>; Sat,  3 May 2025 17:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556D7199938;
	Sat,  3 May 2025 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="C1D/SVpV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo002.bell.net (mta-tor-005.bell.net [209.71.212.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDA181741
	for <linux-parisc@vger.kernel.org>; Sat,  3 May 2025 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746292924; cv=none; b=TXa3fyCuGenWaaOyZS76+oaZSXJU0ZgjjmvjxF/es53REGsrPzTAzFb56dejIrp8sxfLSJZCZJmNKZTvHvlbPRugnDXI2LTcmshtSM0ylBnaPiC9FjOzed1nhqSGcyuz/HyDhNJ1DrqACdPomcihZvVI8daWtG/bOfWyGrUl/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746292924; c=relaxed/simple;
	bh=ydJwlaI6BBAmxxNTyQ5JfD44MV64LUrBBFHh/Lj+NWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kobZpe6lHGN7Mo9v4zmdf1hvue5+OOBWLjKMbcBg8uJ41UixH3fP2/UxOBelhGaH/vtVMeRA/PeX0fK5vllZSlNrJ4yLXcGi5f+3TuKRpAdKBPUjrsMe0tXWKXyyIztjRqwYLqa/4PuMxN1V7UOHv7gyJW36/OK4XoxHzjOnjK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=C1D/SVpV; arc=none smtp.client-ip=209.71.212.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1746292921; 
        bh=rsFEuAS7tGnwhRiWsZl7hSPkijaPy7lYeZWZ9mHQWQA=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=C1D/SVpVgCZWb9tKU9ql073nabgdsJzC3NHJ68ppeR2/qvxlvv7K8bQC/TZb2SPYIY8aAj+rr9MPrFBgJcVrkH91vBGUptVZnNnbZ644gj0zEO4WwdpU4Dgk+iTcQurKVMpBQIFgYae6/W5NmTZXtWrJWxqJbUvNza5+nmsAmpovH5t7vF8PBEfUK3vSMi+X4vrAqF+AE/JyeuNnPaJ9xi2tWdkhkD1icqDuYi+dn7hhUS0+3XsUjl0s3YPk31QB8ghgMPf6dpR3n1fPXq3f6eNE1VYv6nmVk34moqlC1vE1vd4iYR6GOajrZ8sFYYuuywg7H/8F4jP9AG5MWJ3PwA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6808227101598182
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeehleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepgeehieevjeeghfdtteeileejleeggeetieeuheeuffejgfegheekheejffejveevnecukfhppedugedvrdduvdeirdduledtrdduheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddvrdeglegnpdhinhgvthepudegvddruddviedrudeltddrudehledpmhgrihhlfhhrohhmpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdprhgvvhfkrfepsghrrghsqdgsrghsvgdqohhtfigrohhntdeltdeifidqghhrtgdqudejqddugedvqdduvdeiqdduledtqdduheelrdgushhlrdgsvghllhdrtggrpdgruhhthhgpuhhsvghrpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpghgvohfkrfepveetpdfovfetjfhoshhtpegtmhigqdhtohhrrhhgohdttddvpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheptggrmhhmsehmrghguhhirhgvfhgrmhhilhihrdhorhhgpdhr
	tghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopeguvghllhgvrheskhgvrhhnvghlrdhorhhg
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.190.159) by cmx-torrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 6808227101598182; Sat, 3 May 2025 13:18:24 -0400
Message-ID: <4f2f25ee-71df-4ab8-b3b1-9f860e4c7db2@bell.net>
Date: Sat, 3 May 2025 13:18:24 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Fix double SIGFPE crash
To: deller@kernel.org, linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Camm Maguire <camm@maguirefamily.org>
References: <20250503163853.4770-1-deller@kernel.org>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <20250503163853.4770-1-deller@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Helge,

Maybe the comment can be improved.

The signal handler crashes with a second SIGFPE because glibc uses a double-word
floating-point store to atomically update function descriptors. As a result of lazy
binding, we hit a floating-point store in fpe_func almost immediately.

When the T bit is set, an assist exception trap occurs when when the co-processor
encounters *any* floating-point instruction except for a double store of register %fr0.
The latter cancels all pending traps.

Dave

On 2025-05-03 12:38 p.m., deller@kernel.org wrote:
> From: Helge Deller <deller@gmx.de>
> 
> Camm noticed that on parisc a SIGFPE exception may triggger a second
> SIGFPE in the glibc part of the signal handler which then finally leads
> to a crash of the program.
> This can easily be reproduced with this test program which will abort in the
> second SIGFPE.
> 
> root@parisc:~# cat fpe.c
> 
> static void fpe_func(int sig, siginfo_t *i, void *v) {
>         sigset_t set;
>         sigemptyset(&set);
>         sigaddset(&set, SIGFPE);
>         sigprocmask(SIG_UNBLOCK, &set, NULL);
>         printf("GOT signal %d with si_code %ld\n", sig, i->si_code);
> }
> 
> int main() {
>         struct sigaction action = {
>                 .sa_sigaction = fpe_func,
>                 .sa_flags = SA_RESTART|SA_SIGINFO };
>         sigaction(SIGFPE, &action, 0);
>         feenableexcept(FE_OVERFLOW);
>         return printf("%lf\n",1.7976931348623158E308*1.7976931348623158E308);
> }
> 
> root@parisc:~# gcc fpe.c -lm
> root@parisc:~# ./a.out
> Floating point exception
> 
> root@parisc:~# strace -f ./a.out
> execve("./a.out", ["./a.out"], 0xf9ac7034 /* 20 vars */) = 0
> getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
> ...
> rt_sigaction(SIGFPE, {sa_handler=0x1110a, sa_mask=[], sa_flags=SA_RESTART|SA_SIGINFO}, NULL, 8) = 0
> --- SIGFPE {si_signo=SIGFPE, si_code=FPE_FLTOVF, si_addr=0x1078f} ---
> --- SIGFPE {si_signo=SIGFPE, si_code=FPE_FLTOVF, si_addr=0xf8f21237} ---
> +++ killed by SIGFPE +++
> Floating point exception
> 
> Fix this by clearing the Trap (T) bit in the FP status register before
> returning to the signal handler in userspace.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Suggested-by: John David Anglin <dave.anglin@bell.net>
> Reported-by: Camm Maguire <camm@maguirefamily.org>
> ---
>  arch/parisc/math-emu/driver.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/parisc/math-emu/driver.c b/arch/parisc/math-emu/driver.c
> index 34495446e051..15f183cbe915 100644
> --- a/arch/parisc/math-emu/driver.c
> +++ b/arch/parisc/math-emu/driver.c
> @@ -97,9 +97,19 @@ handle_fpe(struct pt_regs *regs)
>  
>  	memcpy(regs->fr, frcopy, sizeof regs->fr);
>  	if (signalcode != 0) {
> -	    force_sig_fault(signalcode >> 24, signalcode & 0xffffff,
> -			    (void __user *) regs->iaoq[0]);
> -	    return -1;
> +		int sig = signalcode >> 24;
> +
> +		if (sig == SIGFPE) {
> +			/*
> +			 * Clear floating point trap bit to avoid trapping
> +			 * again on the first fstd/fld access in the userspace
> +			 * signal handler.
> +			 */
> +			regs->fr[0] &= ~(1ULL << 38);
> +		}
> +		force_sig_fault(sig, signalcode & 0xffffff,
> +				(void __user *) regs->iaoq[0]);
> +		return -1;
>  	}
>  
>  	return signalcode ? -1 : 0;


-- 
John David Anglin  dave.anglin@bell.net

