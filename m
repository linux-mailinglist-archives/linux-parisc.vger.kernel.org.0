Return-Path: <linux-parisc+bounces-2618-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F49B996CF3
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 15:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0AD52818F8
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Oct 2024 13:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A95F1946AA;
	Wed,  9 Oct 2024 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzGOuwjy"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9194D19925F
	for <linux-parisc@vger.kernel.org>; Wed,  9 Oct 2024 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482365; cv=none; b=dlE/seU/0ivzivhA0VdrqcIhEJyuLhx/9/hyLmvWvOCSBh2X+pK1YljEoZCcR+mI6GuuKqsi5pyTwHRSLcLDBHDGiZYiHafbQCdm8NUN2ku4SA6weYCJaCkjN9O5BcNnrDCvo7i+Ustu5k2lMPloJH0ElLgWZh3mrWtloqy/uzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482365; c=relaxed/simple;
	bh=3uAfIEJN6LUU+BeIR+L2KmbN0neQXtVgNwvKUep2gMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIzR8jpCZ1iSsKtvw8gcrDqBzmugMwubSp64mz3i0C7yQJd+0xsTlptba/U3XXTN0vOanSv/WV/bX++XtDqoVzaLQZ4v83YnL6QF8twkwCYcPh/1p0kydUXqT/Zbk8HvVGDHdleNxfE3ff6ZTqYlAaeLO3Qe4JL8ELpsFCFcrpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzGOuwjy; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b4e0so9921873a12.3
        for <linux-parisc@vger.kernel.org>; Wed, 09 Oct 2024 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728482362; x=1729087162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0I3hgXYskFaM1WPaQBMv7Pv3MdsYJHuri7ua6DX/GE=;
        b=LzGOuwjyl2pJau3sNRgk+5GLASDSuJnimsQXBa3Oouh1r5ZwMUy6czLrM6mC+o7DKL
         cj+i5oupJKT85Xwno+gX7CDGVbUComQ+M9zRtcys/bgF/Eklb90j0UoAfLyVdmgSqr+R
         h6aMDo1NDQpMyk+9FNE5H3cUpmSj3n1DDJzSte9Jk3fBMaykOuKvY5cRqSec9YrvD4Aw
         xIIkFB5MbVp1mMk0N65HAGviw8Da7XoOGrz2u7gN93ASaMCHkzf31W/wgQb102aYgKi4
         44G4FmmaDVE3lKufsGyzy4tVwjebPl4NSUg5hAd/r1AIvaiJIqYk879URoE0/I039LMw
         qT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728482362; x=1729087162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0I3hgXYskFaM1WPaQBMv7Pv3MdsYJHuri7ua6DX/GE=;
        b=p53sCZlo9FeQYSPsQ5zLjFwgNNvvH92DuAgFkQveVSZUsLvG53Gie3QwoLU5AHevWC
         NNLKnk6D5pHboJlJHU0F3YjvuTs74J0I/BnE78B8bz4+80icOIg+uiWuKJsPO6soVsdt
         JxalPdAZASHL4vQxSizvfC6F1jv8QI4pEQvCnLnJNcJySfrK8S0CWRy3ieKbUAMOdhjN
         g5xxD2GPoABKB16Oc2J0TDI/uaa3yGszvonmNERkoVx7JKjPXrpgIi6/AS0EA2VvREXI
         SmbKcz+MXuWrUaze9tSZONIsXIEq+5qA7BTWBY54KkvGoeYx/83D5WgchFonDSXziEi2
         5ZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUftqpfUQBaY185SUOSmW/JjYMqDZK2fKG6GR+nm+nFVCTMNaKdwtXn5nqLITZdwJ+mdV4Ugy/l0L/WS+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyPwO5vgI77rW9hy1mCSrlS22oWnkZGc6tDBkxLNwbPZV3cgj9
	KwfidIQLkdE6Ro4+ZZTggdn0x4AYHX4279Pwd2hKdjw/x0FMmq5hpGvMr7kTPNmQE2aPjqtI435
	0CgyTVMCoBNSMBIUAec224PMh2U57u4VQOiuuYA==
X-Google-Smtp-Source: AGHT+IFcaDAmv5R+/Xh7CHX50o4jgaS6RwlGJuW4592TQfJL+6zctEsY3T1VEpWaMxyXf+D46/DImjU/Acw+HiHxBUI=
X-Received: by 2002:a05:6402:2813:b0:5c2:6d16:ad5e with SMTP id
 4fb4d7f45d1cf-5c91d63e0e4mr2429095a12.19.1728482361560; Wed, 09 Oct 2024
 06:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-14-richard.henderson@linaro.org> <CAFEAcA_jXTuB6c8oVcXmi66zcXn5-PYM7W9z1wf7-fzXg7_Oiw@mail.gmail.com>
 <5c33b223-10cc-4ad6-a3e8-15082266b31d@linaro.org>
In-Reply-To: <5c33b223-10cc-4ad6-a3e8-15082266b31d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Oct 2024 14:59:10 +0100
Message-ID: <CAFEAcA9jwsD3p3Voj=q1Tcv0CZ7u2mADdfo6oQrGXr5FfFQQBg@mail.gmail.com>
Subject: Re: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Oct 2024 at 18:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/8/24 07:45, Peter Maydell wrote:
> > On Sat, 5 Oct 2024 at 21:06, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Zero is the safe do-nothing value for callers to use.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/internals.h      | 3 ++-
> >>   target/arm/ptw.c            | 2 +-
> >>   target/arm/tcg/m_helper.c   | 8 ++++----
> >>   target/arm/tcg/tlb_helper.c | 2 +-
> >>   4 files changed, 8 insertions(+), 7 deletions(-)
> >
> >> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> >> index 23d7f73035..f7354f3c6e 100644
> >> --- a/target/arm/tcg/m_helper.c
> >> +++ b/target/arm/tcg/m_helper.c
> >> @@ -222,7 +222,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
> >>       int exc;
> >>       bool exc_secure;
> >>
> >> -    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
> >> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, 0, mmu_idx, &res, &fi)) {
> >>           /* MPU/SAU lookup failed */
> >>           if (fi.type == ARMFault_QEMU_SFault) {
> >>               if (mode == STACK_LAZYFP) {
> >> @@ -311,7 +311,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
> >>       bool exc_secure;
> >>       uint32_t value;
> >>
> >> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
> >> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
> >>           /* MPU/SAU lookup failed */
> >>           if (fi.type == ARMFault_QEMU_SFault) {
> >>               qemu_log_mask(CPU_LOG_INT,
> >
> > We do actually know what kind of memory operation we're doing here:
> > it's a 4-byte access. (It should never be unaligned because an M-profile
> > SP can't ever be un-4-aligned, though I forget whether our implementation
> > really enforces that.)
> >
> >> @@ -2009,7 +2009,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
> >>                         "...really SecureFault with SFSR.INVEP\n");
> >>           return false;
> >>       }
> >> -    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
> >> +    if (get_phys_addr(env, addr, MMU_INST_FETCH, 0, mmu_idx, &res, &fi)) {
> >>           /* the MPU lookup failed */
> >>           env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
> >>           armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
> >
> > Similarly this is a 16-bit load that in theory should never
> > be possible to be unaligned.
> >
> >> @@ -2045,7 +2045,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
> >>       ARMMMUFaultInfo fi = {};
> >>       uint32_t value;
> >>
> >> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
> >> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
> >>           /* MPU/SAU lookup failed */
> >>           if (fi.type == ARMFault_QEMU_SFault) {
> >>               qemu_log_mask(CPU_LOG_INT,
> >
> > and this is another 4-byte load via sp.
> >
> >> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
> >> index 885bf4ec14..1d8b7bcaa2 100644
> >> --- a/target/arm/tcg/tlb_helper.c
> >> +++ b/target/arm/tcg/tlb_helper.c
> >> @@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >>        * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
> >>        * register format, and signal the fault.
> >>        */
> >> -    ret = get_phys_addr(&cpu->env, address, access_type,
> >> +    ret = get_phys_addr(&cpu->env, address, access_type, 0,
> >>                           core_to_arm_mmu_idx(&cpu->env, mmu_idx),
> >>                           &res, fi);
> >>       if (likely(!ret)) {
>
> The question is: if it should be impossible for them to be misaligned, should we pass an
> argument that checks alignment and then (!) potentially raise a guest exception.
>
> I suspect the answer is no.
>
> If it should be impossible, no alignment fault is ever visible to the guest in this
> context, then we should at most assert(), otherwise do nothing.
>
> We *can* pass, e.g. MO_32 or MO_16 for documentation purposes, if you like.  Without
> additional adornment, this does not imply alignment enforcement (i.e. MO_ALIGN).  But this
> would be functionally indistinguishable from 0 (which I imperfectly documented with "or 0"
> in the function block comments).

Mmm. I think I thought when I started reviewing this series that we might
have a bigger set of "we put in 0 here but is that the right thing?"
callsites. But I think in working through it it turns out there aren't
very many and for all of those "don't check alignment" is the right thing.

thanks
-- PMM

