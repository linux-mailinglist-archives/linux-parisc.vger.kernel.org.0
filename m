Return-Path: <linux-parisc+bounces-2590-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799E9955AC
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 19:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EECD91F212F3
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 17:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7D020A5DD;
	Tue,  8 Oct 2024 17:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXkwlgJg"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1441813BC2F
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 17:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728408768; cv=none; b=hSBLEWF9IVjHsbfh/ezyrxJZHjE4io0qFjroUfH/4l5UPOa3GjICaoxVn6jBhf4tY/oWN6GCBNCrbMActuhxeyFcRbvHgiwIvO7OhRK3HQXlmmTIiQAb3b5uKyWgqEIp/FKlJVE27pLmNwXXbR/Y3Wk6zosxtM2HN0KW7KTgr40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728408768; c=relaxed/simple;
	bh=kR1BOIrdB4fngCosRBeRt4+l23jfKGmW4Z10JoisjRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZved3ikN+mNyLeM7a8mj2FkvcVamrkeYCYvqk/etr+QvJ1EqC1iIHp3ZHOKa9k+4e19iqfWTCN59LwoILcnDv1CiWpIcGqS9N2TqYDgMahcPwFqYboCLIQ4WI0mc/EWtyGLWft6Yhr1ZQ2h8dtUSdK7/ad2H423rabXGT5UgBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXkwlgJg; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71df0dbee46so2451098b3a.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728408765; x=1729013565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4Y923DNTB69Q7mP3ieLv48ZUpge+neE9bsJN+T0+x8=;
        b=AXkwlgJgbADHtYqH2vlG7fMRGrgDsxOL8CuyDKAsa/HRtLhf1FQisCwCuztd+X+TK1
         CrysFtlfBPVycXJhZ7FkkTAX0SnDmi2tSBNmfANmVt2MC2PebzZWEtmFLv38Xqzr6Cb1
         0nt9Kse6doKzRW1m7cT9xhY527c0j2tppIftkG0xuaV3TCKbZ+f8YLOlYv4I+Xkic0IB
         +z9tqiquNLxIXgO+Qin66dWOXNLt+1A/hLNC+/vYw7fi+IwdgX5ZiySfVm2QK4ER05By
         G6KsNO8IboMRkAP+1sT/oBfhcipj72kMb9ee6miBsyepiXkiMYlAev/X+t0M6O0BlVBc
         S6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728408765; x=1729013565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4Y923DNTB69Q7mP3ieLv48ZUpge+neE9bsJN+T0+x8=;
        b=A6uHS1X/8wAxL+74VFZj0+r1TMkOvNLwhgwQFhxsk2TdJ70LtBEZzBHhuesh/qvbL0
         jqkziKrlaBT9JBtnwXuR7Xc3izdHVFz1NXdJruki6/oIsaH/ivlqIpLQ7xEmmyDgRHjc
         rJOKp4rfo+6f9tifmO1uD5FDwKHw3oZ5X0fFsSXxyJNgOZ83DenC+FuQfjslWGlmjXaL
         4JiajsV1bAtSJhh3KvyBYoXnGgGRT6Mlg8Wc0vPWdpbVVyK7yX0RPRvD2QGnmKbZFU7i
         XekZ4WMbdcIGt4mRQ2/9nRCi9WmxhqsUSxofXGsn3dmhszHWDC61DIpkstbWKY1v3etG
         JA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMOanjvbkRIpozR60nMzpBQuD+LpSgZt0rmW4ovwL0GYc0vB9b+jiXXIA74tnUxARukNCOr+JNzXJ1GYw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0l+uGEwBeaFY0DKcYj/OSXeR2q2sFPREUWz+1Ti8MPtBymIw5
	YzVf9jUx6Erzk9ZnCqNGDUNVePg9SD/9/XALpFfrg2jKD6OEjXU1tM1siUtP7Sc=
X-Google-Smtp-Source: AGHT+IGNqyg5pdejspXKBggqd2RvQRJTE4x6tHjisJvKdNG8KH+pUiftg7ccR+Rf3hDmeAa8Wu2wqw==
X-Received: by 2002:a05:6a00:1904:b0:71e:1722:d019 with SMTP id d2e1a72fcca58-71e1722d508mr3560925b3a.22.1728408765209;
        Tue, 08 Oct 2024 10:32:45 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d67beasm6573709b3a.179.2024.10.08.10.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 10:32:44 -0700 (PDT)
Message-ID: <5c33b223-10cc-4ad6-a3e8-15082266b31d@linaro.org>
Date: Tue, 8 Oct 2024 10:32:42 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-14-richard.henderson@linaro.org>
 <CAFEAcA_jXTuB6c8oVcXmi66zcXn5-PYM7W9z1wf7-fzXg7_Oiw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_jXTuB6c8oVcXmi66zcXn5-PYM7W9z1wf7-fzXg7_Oiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/24 07:45, Peter Maydell wrote:
> On Sat, 5 Oct 2024 at 21:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Zero is the safe do-nothing value for callers to use.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/internals.h      | 3 ++-
>>   target/arm/ptw.c            | 2 +-
>>   target/arm/tcg/m_helper.c   | 8 ++++----
>>   target/arm/tcg/tlb_helper.c | 2 +-
>>   4 files changed, 8 insertions(+), 7 deletions(-)
> 
>> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
>> index 23d7f73035..f7354f3c6e 100644
>> --- a/target/arm/tcg/m_helper.c
>> +++ b/target/arm/tcg/m_helper.c
>> @@ -222,7 +222,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
>>       int exc;
>>       bool exc_secure;
>>
>> -    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
>> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, 0, mmu_idx, &res, &fi)) {
>>           /* MPU/SAU lookup failed */
>>           if (fi.type == ARMFault_QEMU_SFault) {
>>               if (mode == STACK_LAZYFP) {
>> @@ -311,7 +311,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
>>       bool exc_secure;
>>       uint32_t value;
>>
>> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
>> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
>>           /* MPU/SAU lookup failed */
>>           if (fi.type == ARMFault_QEMU_SFault) {
>>               qemu_log_mask(CPU_LOG_INT,
> 
> We do actually know what kind of memory operation we're doing here:
> it's a 4-byte access. (It should never be unaligned because an M-profile
> SP can't ever be un-4-aligned, though I forget whether our implementation
> really enforces that.)
> 
>> @@ -2009,7 +2009,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
>>                         "...really SecureFault with SFSR.INVEP\n");
>>           return false;
>>       }
>> -    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
>> +    if (get_phys_addr(env, addr, MMU_INST_FETCH, 0, mmu_idx, &res, &fi)) {
>>           /* the MPU lookup failed */
>>           env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
>>           armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
> 
> Similarly this is a 16-bit load that in theory should never
> be possible to be unaligned.
> 
>> @@ -2045,7 +2045,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
>>       ARMMMUFaultInfo fi = {};
>>       uint32_t value;
>>
>> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
>> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
>>           /* MPU/SAU lookup failed */
>>           if (fi.type == ARMFault_QEMU_SFault) {
>>               qemu_log_mask(CPU_LOG_INT,
> 
> and this is another 4-byte load via sp.
> 
>> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
>> index 885bf4ec14..1d8b7bcaa2 100644
>> --- a/target/arm/tcg/tlb_helper.c
>> +++ b/target/arm/tcg/tlb_helper.c
>> @@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>        * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
>>        * register format, and signal the fault.
>>        */
>> -    ret = get_phys_addr(&cpu->env, address, access_type,
>> +    ret = get_phys_addr(&cpu->env, address, access_type, 0,
>>                           core_to_arm_mmu_idx(&cpu->env, mmu_idx),
>>                           &res, fi);
>>       if (likely(!ret)) {

The question is: if it should be impossible for them to be misaligned, should we pass an 
argument that checks alignment and then (!) potentially raise a guest exception.

I suspect the answer is no.

If it should be impossible, no alignment fault is ever visible to the guest in this 
context, then we should at most assert(), otherwise do nothing.

We *can* pass, e.g. MO_32 or MO_16 for documentation purposes, if you like.  Without 
additional adornment, this does not imply alignment enforcement (i.e. MO_ALIGN).  But this 
would be functionally indistinguishable from 0 (which I imperfectly documented with "or 0" 
in the function block comments).


r~

