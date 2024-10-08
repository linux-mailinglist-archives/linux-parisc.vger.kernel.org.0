Return-Path: <linux-parisc+bounces-2588-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CC6995231
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1641F287C7B
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8FD17578;
	Tue,  8 Oct 2024 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEkf83UA"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0885A1DE4C1
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398768; cv=none; b=oI7z30HIRKhc3TN/lK6XossozysRQWBNZwQ4C2hrcVR2V/oWl6WRYGfzj0yCbPfnrSjEa0Yzxddtqz3XWn1HHX14rffnRyPJ/rk6kUqsjYYJUSf67SQ3uOFbXA4s0hbK8Vj2BV9mLhSK73y6yHzSDOcAlG/4rbMpQhCbzrqmHDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398768; c=relaxed/simple;
	bh=eFUmElRvZwTTXuJIgR28oenZYXjJ+dnx3Ir94jUW/0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StE2ndczn16ufiW0qfXA0w71ySWhVGPG0eZaIditfWESwqq0w2FRohxT5//iNYTtRvn4Kj/f11wse9nG+5j22M7ROw+bqKmMnLdakF2373FB9WZCU5aGz/xULaHw89KBFpB5VKsIG+sSZkNUUU9KIlZnVcEsZ8kziGiTlaFCurw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEkf83UA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c5b954c359so6590200a12.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398765; x=1729003565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j5MphECLD4P0U/jqbmbESSvAYHMevQyba1bA/1qjbuA=;
        b=uEkf83UAKqaaOgWgwjeUdyGXQSE48IVpyEBrkg3rjcLUTvVhe4A9qMz3Xb9AR8Mi78
         M89pi0KYhKmFmqURhxKO6kHZ8N8qC91C+tthxxoal+cJb9dmLQ+GC2Mo98L757TbnjSm
         fQAZc5GcVnELsy/ll+eMZpC268GxYzYbexHQckw6hIW4KIeaSySSjhWAq/cjztt4cVm3
         3GnMRdVZi27afztymOZVRHtdgabTX7NNN2FR1udrGqZnCSABOcXavpQM1OThJ2i5kJz7
         SKTo+NPUctk4KIIH68W5bOtmx+Fpnp/Tyf6NvgvFR+c2sfKloybqQdSa2QFkmNY7UDSs
         f2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398765; x=1729003565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5MphECLD4P0U/jqbmbESSvAYHMevQyba1bA/1qjbuA=;
        b=FwYYrj/MnH0ASvWp4feyCOhD+77D+3grc6bPAXxALoeBnBYY7V9sQZffFSNBpdVIG0
         Vie7z9Gf4WVdtTiEaEQc9bPpLOtSmdDuCP4OT5OERUgX81ZakKHceh6o+Mjg+SiGBISQ
         TyfR7f0C/G4siCh3R0deo+A14MNJGJ9T3mwxB/GRG/pa2d1GrcXL01SmIn+m/H3nOkog
         JbmsTZzUG38qXnbyyHz1aSYRBhU6nO3xihu250BH5I2jhY0Jk6JbOh51UxSC1ChJ7ymV
         Rr03L+kMN8qmZ3GHPP6ikdRIa2WALnTzGcQash4l6QtiF93SFizQSPCIlFlkwIg0X5xR
         jmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/4C9W43YoJlDQA1mlRjIpsg5AxBC0zAmxU3nz5U/sWoQnoJlJT4O1+3BKcDkFP54Sh60ewY0rpwcw5cU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5wFT7TmFfG6H9BU5juIT9fcjMCzPNvq40RlybPLe+jyUrZjH
	amqdaWrQQgmPCrFao0Yx5hKHsFJbsFGgH7B+rpxIsHJb9fXVSuMWuP7k7jgJ8RuLgSQLVQk3u0Q
	XwRxNLEw1ItwpazlqT/XDQXNtgYRr6BNaUg4qjw==
X-Google-Smtp-Source: AGHT+IGbbRXahkkw9UahWbFZHSA6zRVWmmssrHeW2g12mO5Ut8YunOTSsC5XXWpGwl8aN5g3vofSKPBmJRKe9gpczlc=
X-Received: by 2002:a05:6402:50d0:b0:5c8:a92b:b0a with SMTP id
 4fb4d7f45d1cf-5c8d2e1efd5mr13576867a12.1.1728398765144; Tue, 08 Oct 2024
 07:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-14-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:45:53 +0100
Message-ID: <CAFEAcA_jXTuB6c8oVcXmi66zcXn5-PYM7W9z1wf7-fzXg7_Oiw@mail.gmail.com>
Subject: Re: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Zero is the safe do-nothing value for callers to use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h      | 3 ++-
>  target/arm/ptw.c            | 2 +-
>  target/arm/tcg/m_helper.c   | 8 ++++----
>  target/arm/tcg/tlb_helper.c | 2 +-
>  4 files changed, 8 insertions(+), 7 deletions(-)

> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index 23d7f73035..f7354f3c6e 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -222,7 +222,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
>      int exc;
>      bool exc_secure;
>
> -    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, 0, mmu_idx, &res, &fi)) {
>          /* MPU/SAU lookup failed */
>          if (fi.type == ARMFault_QEMU_SFault) {
>              if (mode == STACK_LAZYFP) {
> @@ -311,7 +311,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
>      bool exc_secure;
>      uint32_t value;
>
> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
>          /* MPU/SAU lookup failed */
>          if (fi.type == ARMFault_QEMU_SFault) {
>              qemu_log_mask(CPU_LOG_INT,

We do actually know what kind of memory operation we're doing here:
it's a 4-byte access. (It should never be unaligned because an M-profile
SP can't ever be un-4-aligned, though I forget whether our implementation
really enforces that.)

> @@ -2009,7 +2009,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
>                        "...really SecureFault with SFSR.INVEP\n");
>          return false;
>      }
> -    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
> +    if (get_phys_addr(env, addr, MMU_INST_FETCH, 0, mmu_idx, &res, &fi)) {
>          /* the MPU lookup failed */
>          env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);

Similarly this is a 16-bit load that in theory should never
be possible to be unaligned.

> @@ -2045,7 +2045,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
>      ARMMMUFaultInfo fi = {};
>      uint32_t value;
>
> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
>          /* MPU/SAU lookup failed */
>          if (fi.type == ARMFault_QEMU_SFault) {
>              qemu_log_mask(CPU_LOG_INT,

and this is another 4-byte load via sp.

> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
> index 885bf4ec14..1d8b7bcaa2 100644
> --- a/target/arm/tcg/tlb_helper.c
> +++ b/target/arm/tcg/tlb_helper.c
> @@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
>       * register format, and signal the fault.
>       */
> -    ret = get_phys_addr(&cpu->env, address, access_type,
> +    ret = get_phys_addr(&cpu->env, address, access_type, 0,
>                          core_to_arm_mmu_idx(&cpu->env, mmu_idx),
>                          &res, fi);
>      if (likely(!ret)) {

thanks
-- PMM

