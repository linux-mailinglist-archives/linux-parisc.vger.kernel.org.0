Return-Path: <linux-parisc+bounces-2587-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA99951F5
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7310B22DA9
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F4B1CC14B;
	Tue,  8 Oct 2024 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YD5y5kA4"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809B238DC0
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398123; cv=none; b=dx52YTBuP9DpMIAWpI+ZDdAOOpa5BxZJq9LCLB2pubEY1ofzXrrtQ4TSgreOkhz3frE4RV2l/3VAS3AwbY/Tv1dcdWDo7rBrvQDmxVQe1202kcsi6mZPDn4YHg87mRZJ39f5+oczNT+qKUMHV56g0CEYlumteFpSs6W0t9HOZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398123; c=relaxed/simple;
	bh=qIwspDCChbYJGL5YLKWF84aMhczCgqQKQ3v08Or39tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmf8wAlGqyiDBKMjZP54bNgS+BCrGRWi9sHCj/wT//9AnTaSpKYefJGJuSOuuSODcgDWN6d6015OoyjnyUwoP+cdrbFzXE3UgedlQnWXb/GWdYSB7HiRD/NjCdAFRf2Sx1BznYcrWpuwtNprtdfFjTZgWxq6Ra7tzXtLbA0Fh+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YD5y5kA4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c87c7d6ad4so7743220a12.3
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398119; x=1729002919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ejEHR1wMlkNLtiJ1Hqtaqwe+D7rXesFiFwGrxD/Swxc=;
        b=YD5y5kA4YylPFSMWFyn8tE1dPcDC0xEJXPVrrKjDq33pwcS/2NkqEXlvEwVB0elirp
         ljrMNbJ3zBWm8ORxvNVXDwgpsVzvXQnjQLmj8Nt+DTicUJzIRzDdo0jtpjQQsXPmYteD
         DU0Fdis15wz6qyxr62AIG3IjscqZGBbJ8CH6SVpIeGonCJfJ0tHWWlqeecmCZYjYShsw
         w+i1F1MTD7sl8zPUA2zBj6qrYftE0fsAe2cSFTbPHeSqezQCiwkQwIxePlHu1PmwQFal
         Ylr5Y63M+9HPYBZ5n1Ok6XomXFNhYXXvwlkNmNqGIBtslfadOt6a18INhJ1VLGuOKKrz
         2brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398119; x=1729002919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejEHR1wMlkNLtiJ1Hqtaqwe+D7rXesFiFwGrxD/Swxc=;
        b=HKIVhZjywJq6Z7IUY6rfHyhqtA+SQOqqJJIVunLTpXPOzxiD4rst+WgTgqJZaWPEea
         1Z4U7otTty33zcYvBsIph3ykatacTLUWW6YJ4cAu+5u20zAgZwhf6brL76acx2+1l2oO
         bwxJeiU5GcDvP8cIrVrBoKjswDwwCNCYddCjllgLGdM07AJ/Hjn7l8ZXtaKaAAh94ZIX
         AXh7pEi0pqYxKKVjLQZn6SPTnWJedDeEhjuse6O4D0DZ9zlepEe4IC+rAN9fsqNvF1sd
         UrCLVPMVoNPuqM+Ft2+WpIfz0DlzZcSriaWzgXWuinZKtdnaFzqWN1qXMtzG3JDgQcqY
         Zy1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3/h9mMhRJYqWhWoW5DmUtCLwgtlOm6Fcwmccm8V6wVE9ztLmKBGZe8kRK9bDORxNPB8+LIzFIiftHG6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUJ7uC07M2VNlNK4aJen6dYgGNSb3R7NhUVp4cifNTMsL4iifA
	xUCNj8CQbYnQ3215NB8msIiemTmBXRnKCZ4s9hW3uMsIYSjl64VUb0D4V11TCyQgRaZMDXIiTsw
	ka3PoYv0olVHCZaA4uhtNAl89/bZCmzWxz9VQqg==
X-Google-Smtp-Source: AGHT+IEJhPFIg7Qd18l/zzU6VuxNjyfZlpL9dJ5GySWcXx1gRxvqO8ZcTix41f8blmGjq8Y98ULXs/w/4SLM1BwGu+4=
X-Received: by 2002:a05:6402:c42:b0:5c8:ad38:165c with SMTP id
 4fb4d7f45d1cf-5c8d2ebdaf7mr14866174a12.23.1728398118716; Tue, 08 Oct 2024
 07:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-15-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:35:07 +0100
Message-ID: <CAFEAcA9B1OsYgChehuz7uRgP-=Mbh=4zSK+owJz+BoBvA4Cnvg@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
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
>  target/arm/internals.h | 3 ++-
>  target/arm/helper.c    | 4 ++--
>  target/arm/ptw.c       | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 2b16579fa5..a6088d551c 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1461,6 +1461,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
>   * @env: CPUARMState
>   * @address: virtual address to get physical address for
>   * @access_type: 0 for read, 1 for write, 2 for execute
> + * @memop: memory operation feeding this access, or 0 for none
>   * @mmu_idx: MMU index indicating required translation regime
>   * @space: security space for the access
>   * @result: set on translation success.
> @@ -1470,7 +1471,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
>   * a Granule Protection Check on the resulting address.
>   */
>  bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
> -                                    MMUAccessType access_type,
> +                                    MMUAccessType access_type, MemOp memop,
>                                      ARMMMUIdx mmu_idx, ARMSecuritySpace space,
>                                      GetPhysAddrResult *result,
>                                      ARMMMUFaultInfo *fi)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3f77b40734..f2f329e00a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3602,8 +3602,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>       * I_MXTJT: Granule protection checks are not performed on the final address
>       * of a successful translation.
>       */
> -    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
> -                                         &res, &fi);
> +    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
> +                                         mmu_idx, ss, &res, &fi);

0 is the correct thing here, because AT operations are effectively
assuming an aligned address (cf AArch64.AT() setting "aligned = true"
in the Arm ARM pseudocode).

Is there a way to write this as something other than "0" as
an indication of "we've definitely thought about this callsite
and it's not just 0 for back-compat behaviour" ? Otherwise we
could add a brief comment.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

