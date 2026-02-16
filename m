Return-Path: <linux-parisc+bounces-4580-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJq3HrbvkmkQ0QEAu9opvQ
	(envelope-from <linux-parisc+bounces-4580-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Feb 2026 11:21:42 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700C1424BA
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Feb 2026 11:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 444BD300461E
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Feb 2026 10:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F8E2FF67E;
	Mon, 16 Feb 2026 10:21:39 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B132FF66A
	for <linux-parisc@vger.kernel.org>; Mon, 16 Feb 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771237299; cv=none; b=QotnGAmCDAcuSCpDY48milzX/85Vx5P8iInKJDKVD+CsavF+zDVr6eiIyX3gGwbCJqdC45uf8m8LrEJXKzQUOoEVEsfQ2y7HcGLUPsHJtz+CKDEveUrpITiEN6fwdq7IKtUupHXjGHIebDN+1Zoitl33zV88fx7UdbPEj+BeyAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771237299; c=relaxed/simple;
	bh=hPe8h0DtfhJgwDhL/MTo/0nn7WzS24db3TtnQR4WYgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyix51MovK890FuWJ5T3auJG2gW3my2lyLKFWD96HCkJxNPYtj0rwKtxJ472ylh7oXasFfY79NRolyF9JWP5OIrFx8vAZQ0jnG9l/kN4hrTioZe8KO7mbE/6bsbLr/CfpnLIcu5hb0iPgd47xh4JzJRHrSCuB9WnbMUdRNxaw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94ac7f22d23so675981241.3
        for <linux-parisc@vger.kernel.org>; Mon, 16 Feb 2026 02:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237297; x=1771842097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9k16NacyBqRsPOeIOlYkH0Gj7wgknc1ckVejj7V1hU=;
        b=u26GvCyaaxn5W4noAkt6uo2VMk0QvwdbzQxza45pTG/tVOlgCMNuIpy/TW28wMmhOM
         m1Q7vWUDNmTAUCHueUDLwlekmj3M0jHw4IjJMLCR9y7W1vV0FVCWoqQy2waxoAtmahEv
         hNvjXt+9+WfesB9TVTP2G/g9y0BiC/ncDdU1qwoIxYe2nh+3kxgQPC0l+soYrly/FjRe
         hsaHlwb9NtDp2eymX202hDYtrZl6ZagM0bRWk45daPTgWVEpqkTvNiYU/XD9aVmieADL
         IIMSQs+T5fiAnWmwYpib0qRA79s5i9lHD0m2iJEqlQUz1orjm2Eu2lQhlY7g29UraPDB
         7V4g==
X-Forwarded-Encrypted: i=1; AJvYcCUvf/R35wBJf2FXKAvffWFj+d4SVpSW1NObIPzttxLds7NzpjmapqZ75iYkx3N14RuImV7/8E/T665uUZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzACmByYxPecu7aKVh2TAyZDWS5NPxSw0lC12IF8dTnH0C6C0Lh
	8rnvRIXVXu/Dc1mQAbQyrN4+CP+EmGaBG7mljkWDWooY1+cUL71FZqkiVEvHUM35
X-Gm-Gg: AZuq6aIlyGiByTCz6XsgWYkr8nvfNMsnSWz0ovXhXeGf5vGzFAWUPSYaSgUIH5DV1Td
	x9PCWOp2oL4TJA+VefECO0XFPkh6Vunh2mDs6l0zb49sjgTOxGE+l31VYl7nBVtBQwdgNFqge1J
	KmA+DbDEqrvNkjKPi1d1+YKx1rLbadezvZZIPEcce2EV8MVOYGNFBmY3dVdgARLIAfkPEi+fBJj
	jmYYQeelI4/apSoVo0Z9WEWR12cRaTosugGNFbhYNCWcKpwlud+GpR5luDWjqj6a9+cxFHCHgU/
	uczfyG+s0zPDFZtHofVU8GTGisAAJFW5oNF99PpDhiZybniC5x1b1akzoLhhcQsfMo43lRiU5l/
	i4omvFmEyGLojxND9an39S+b5Q6TuheqLCBVOAbZLNzEx83h4yOtftL4jyn1/mHzLsPZpOREOhT
	tGolgwIsOVG43dyQis1/eBF22zcVMqBuKjJiSbdPb0aMrcXSmWgrkbXnKCGANF
X-Received: by 2002:a05:6102:c90:b0:5fd:f509:c97 with SMTP id ada2fe7eead31-5fe2ad91575mr2372133137.18.1771237296586;
        Mon, 16 Feb 2026 02:21:36 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fde87fb7f5sm7094908137.2.2026.02.16.02.21.36
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:21:36 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94ac7f22d23so675973241.3
        for <linux-parisc@vger.kernel.org>; Mon, 16 Feb 2026 02:21:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRVB4tKcntgAnslNppAbISL9MuSWo8+09KBsN9gun2k2VEIPsZhhdy/rxH5iqDnK0ajzf8jt6mpeGReAY=@vger.kernel.org
X-Received: by 2002:a05:6102:4192:b0:5f5:35bd:6fb3 with SMTP id
 ada2fe7eead31-5fe2aceef00mr2011773137.5.1771237296107; Mon, 16 Feb 2026
 02:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214005825.3665084-1-sashal@kernel.org>
In-Reply-To: <20260214005825.3665084-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 11:21:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeGv=f-Oo1=GQLghn_hwpe2YN5OS79fQsy2uccwyVUZg@mail.gmail.com>
X-Gm-Features: AaiRm50N-jUB71MK4eHWfadpGLVlD7JkxipNiaF9cDCx3KnVx3LWPVTtpfkjLnY
Message-ID: <CAMuHMdVeGv=f-Oo1=GQLghn_hwpe2YN5OS79fQsy2uccwyVUZg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.19-5.10] parisc: Prevent interrupts during reboot
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, guoren@kernel.org, neil.armstrong@linaro.org, 
	brauner@kernel.org, yelangyan@huaqin.corp-partner.google.com, 
	schuster.simon@siemens-energy.com, linux-csky@vger.kernel.org, 
	Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmx.de,kernel.org,linaro.org,huaqin.corp-partner.google.com,siemens-energy.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4580-lists,linux-parisc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-parisc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-parisc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,gmx.de:email]
X-Rspamd-Queue-Id: 0700C1424BA
X-Rspamd-Action: no action

Hi Sasha

Cc linux-parisc

How did you (or the LLM?) came up with that CC list?!?

On Sat, 14 Feb 2026 at 01:58, Sasha Levin <sashal@kernel.org> wrote:
>
> From: Helge Deller <deller@gmx.de>
>
> [ Upstream commit 35ac5a728c878594f2ea6c43b57652a16be3c968 ]
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>
> LLM Generated explanations, may be completely bogus:
>
> Now I have all the information I need for a thorough analysis. Here is
> my complete assessment:
>
> ---
>
> ## Detailed Analysis: "parisc: Prevent interrupts during reboot"
>
> ### 1. COMMIT MESSAGE ANALYSIS
>
> The commit message is minimal: "parisc: Prevent interrupts during
> reboot". It clearly states the problem it's fixing -- interrupts are not
> properly disabled during the reboot path on PA-RISC systems. The author
> is **Helge Deller**, the long-time parisc maintainer and the most
> authoritative developer for this architecture. The commit has no
> `Fixes:` tag or `Cc: stable` (as expected for autosel candidates).
>
> ### 2. CODE CHANGE ANALYSIS
>
> The change is **one single effective line of code** plus a comment:
>
> ```c
> /* prevent interrupts during reboot */
> set_eiem(0);
> ```
>
> This is inserted into `machine_restart()` in
> `arch/parisc/kernel/process.c` immediately after
> `pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN)` and before
> `pdc_do_reset()`.
>
> **What `set_eiem(0)` does:** On PA-RISC, the EIEM (External Interrupt
> Enable Mask, Control Register 15) controls which external interrupts can
> fire. Setting it to 0 **masks all external interrupts at the hardware
> level**, preventing any interrupt from being delivered to the CPU. This
> is defined as:
>
> ```82:82:arch/parisc/include/asm/special_insns.h
> #define set_eiem(val)   mtctl(val, CR_EIEM)
> ```
>
> **The bug:** Without this line, external interrupts remain enabled
> during the entire reboot sequence. This means:
>
> a) **Deadlock risk in `pdc_do_reset()`**: The `pdc_do_reset()` function
> acquires `pdc_lock` via `spin_lock_irqsave()`:
>
> ```1236:1246:arch/parisc/kernel/firmware.c
> int pdc_do_reset(void)
> {
>         int retval;
>         unsigned long flags;
>
>         spin_lock_irqsave(&pdc_lock, flags);
>         retval = mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_RESET);
>         spin_unlock_irqrestore(&pdc_lock, flags);
>
>         return retval;
> }
> ```
>
> While `spin_lock_irqsave` disables local interrupts, the PA-RISC EIEM
> hardware mask is a separate mechanism. On PA-RISC, the external
> interrupt delivery path goes through the EIEM -- an interrupt fires only
> if the corresponding EIEM bit is set AND the EIRR (External Interrupt
> Request Register) bit is set. If a hardware interrupt fires between
> `pdc_chassis_send_status()` (which also uses `pdc_lock`) and
> `pdc_do_reset()`, or during the firmware calls themselves, it could
> interfere with the reset process.
>
> b) **Interference with firmware reset**: `pdc_do_reset()` calls into PDC
> firmware (`mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_RESET)`). Firmware
> calls on PA-RISC are sensitive to the processor state. An interrupt
> arriving during or between firmware calls can corrupt the reset
> sequence, potentially causing the machine to **hang instead of
> rebooting**.
>
> c) **The `gsc_writel(CMD_RESET, COMMAND_GLOBAL)` fallback**: If
> `pdc_do_reset()` returns (on machines that don't implement
> `PDC_BROADCAST_RESET`), the code tries a hardware reset via
> `gsc_writel`. Interrupts during this path are equally problematic.
>
> ### 3. ESTABLISHED PATTERN IN PARISC AND OTHER ARCHITECTURES
>
> **PA-RISC internal precedent:**
> - `parisc_terminate()` in `traps.c` uses the exact same pattern:
>   `set_eiem(0)` followed by `local_irq_disable()` before critical
>   shutdown operations (line 428-429)
> - The SMP CPU hotplug code (`smp.c:481`) uses `set_eiem(0)` to disable
>   all external interrupts when taking a CPU offline
>
> **Other architectures ALL disable interrupts before reset:**
> - ARM: `local_irq_disable()` at line 136 of `arch/arm/kernel/reboot.c`
> - ARM64: `local_irq_disable()` at line 141 of
>   `arch/arm64/kernel/process.c`
> - x86: `local_irq_disable()` at line 100 of `arch/x86/kernel/reboot.c`
> - xtensa: `local_irq_disable()` at line 524 of
>   `arch/xtensa/kernel/setup.c`
> - nios2: `local_irq_disable()` at line 49 of
>   `arch/nios2/kernel/process.c`
> - csky: `local_irq_disable()` at line 25 of `arch/csky/kernel/power.c`
> - MIPS falcon: `local_irq_disable()` at line 37 of
>   `arch/mips/lantiq/falcon/reset.c`
>
> PA-RISC was the **outlier** in not disabling interrupts before reboot.
> This commit fixes that deficiency.
>
> ### 4. CLASSIFICATION
>
> This is a **bug fix** -- specifically fixing a potential hang/crash
> during reboot caused by unmasked interrupts during firmware calls. It is
> NOT a new feature, optimization, or cleanup.
>
> ### 5. SCOPE AND RISK ASSESSMENT
>
> - **Lines changed**: 3 (1 blank line, 1 comment, 1 functional line)
> - **Files touched**: 1 (`arch/parisc/kernel/process.c`)
> - **Subsystem**: parisc architecture, reboot path
> - **Risk**: **Extremely low**. Disabling interrupts before a system
>   reset is universally accepted as correct and necessary. The
>   `set_eiem(0)` pattern is already used in the same codebase for similar
>   critical paths.
>
> ### 6. USER IMPACT
>
> - **Who is affected**: All PA-RISC Linux users who reboot their machines
> - **What happens without the fix**: Potential hang during reboot,
>   requiring a hard power cycle. This could be intermittent and timing-
>   dependent, making it hard to reproduce but very real.
> - **Severity if triggered**: System hang requiring manual intervention
>   (power cycle)
>
> ### 7. STABILITY INDICATORS
>
> - Author is the subsystem maintainer (highest trust level)
> - Pattern is well-established across all other architectures
> - The exact same `set_eiem(0)` call is used in the parisc
>   `parisc_terminate()` function already
> - The change is trivially small and obviously correct
>
> ### 8. DEPENDENCY CHECK
>
> - No dependencies on other commits
> - The `set_eiem()` macro has existed since the earliest parisc code
> - The `machine_restart()` function is largely unchanged across all
>   stable trees
> - This will apply cleanly to any kernel version that has parisc support
>
> ### Summary
>
> This is a trivially small, obviously correct fix that prevents
> interrupts during the reboot sequence on PA-RISC systems. Without it, an
> untimely interrupt can interfere with PDC firmware calls during reset,
> potentially causing the machine to hang instead of rebooting. Every
> other Linux architecture disables interrupts before reboot; parisc was
> the outlier. The fix uses the same `set_eiem(0)` pattern already used in
> `parisc_terminate()` and SMP CPU offline code. The risk is essentially
> zero -- there is no conceivable way that disabling interrupts right
> before a hardware reset could cause a regression.
>
> **YES**
>
>  arch/parisc/kernel/process.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> index e64ab5d2a40d6..703644e5bfc4a 100644
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -85,6 +85,9 @@ void machine_restart(char *cmd)
>  #endif
>         /* set up a new led state on systems shipped with a LED State panel */
>         pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
> +
> +       /* prevent interrupts during reboot */
> +       set_eiem(0);
>
>         /* "Normal" system reset */
>         pdc_do_reset();
> --
> 2.51.0
>

