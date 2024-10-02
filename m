Return-Path: <linux-parisc+bounces-2439-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8286698E195
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 19:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0979D1F20F7C
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 17:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065511D150E;
	Wed,  2 Oct 2024 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtlIFvAi"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8B91D12E5
	for <linux-parisc@vger.kernel.org>; Wed,  2 Oct 2024 17:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727889922; cv=none; b=CKO8FkGWh/d3wNStJDIjEUwaBJ7iqdBK8fpvRHEe0vk6hBHbk1AtIC9rKVLxn/gugOYxwmvZOzpHNXUGOx0MrZXbOsS/QFw4IvgQ3YvDdrW0AyBIMEUnk+/3oxsdxKUtkFv1kDk/NOdTm72GhARlnwnEyhBSP8jX+CzrHQnX07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727889922; c=relaxed/simple;
	bh=6F13pMtC/S48hAgzWRc0jfP8sJP65q1/oYJ1L/h2orQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MpNmPPzK8AaBK0LLWA9fgSbu/JwChUzNZIOJJ1ty6Nc/LSuDmZ3r2TnTTIk9d1j/P46f9Baos5n04W4tmAGCf6Ii3wh/Lct9KtlyL3X3uNUQvXQjds56T5aBR6vJzaBDAqmg8Vk17qt5KXZ3VU7Q47I8XAH9YpOQNNDQvvu1Csk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtlIFvAi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cba8340beso7011055e9.1
        for <linux-parisc@vger.kernel.org>; Wed, 02 Oct 2024 10:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727889919; x=1728494719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sD44ncMEuMvqAzpxO9P/T/TLuuECMjOtP4kjBWrocoM=;
        b=mtlIFvAiAmUSVeUVR4t6X2TP+8ik1B42Na6BWBHSnLDSVsVvhEWEKgc1QsCGqql0OW
         Z71JGmg4aU5jsRpzHcN1U8cXsQyGVVAminzl4/3+Vuw5LpeQCoKBm6YGu46gRnSzOewS
         zKSIAO/oXBiz8bHFW6XT/7XXpvJ2l4JIJ1HnQs2/ZKpslveOmlJATpHeKFtuWSbvn7uN
         t9U7uZQ3foKC8jDo+BOBhQbeiR6l6XbgEa8RXx94H8pDAH8dZlr9zyozo77fvs3XchFQ
         uPAj/z9KWIZL2YWCRCVqnNs7dl5BoGxsDkvPxOzlFuzUW1pNHqbPiLoq3iuMHE2sr/mL
         VlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727889919; x=1728494719;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sD44ncMEuMvqAzpxO9P/T/TLuuECMjOtP4kjBWrocoM=;
        b=I4Sipk0eLo5UM0TRCATBhiH8uTcSCeccut9bba2afxKJ95MPgEhId18YQt1r0OHQTU
         kjQSd7lXcH93n1Tk/mFnpXp914Rt7Ksp/5X2+wK7qvFLShxM+nFv61jwMX5mKqq+/BL1
         bcC2oOoZirDzitDu8dbwLLfWW+Vx6zAugQc4lCyNoD7iA9KElyZC1shncDOnaAtqnzlb
         kl+Rm8O93WdS+paqaOo70fuy8ZVFKvdtlZGr+3G5i+IJldUDtRX7IpWYQIywuPaS2KBt
         034PGl3xMt5WCq2tXpgdewh+bXG7hr3IaEbvBZBIchkFUAIrJi8iYB85F2fy6bY97BJ7
         qjVA==
X-Forwarded-Encrypted: i=1; AJvYcCVHFpRxvoGju9pmI0//67smaZdq9H9AAejF3XdG+cBtE7apv6qStNloEhf+L19/nmH3gzcO4AHz513rZQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBNgOZWNsAPudinaG6ZwlaN0a8c7YiqmN72l8VAx3Sb1u70PyQ
	q+spDQk3aYzymV4vWXg6cNlTff8XklLUKjftoK7daEv5XrvW1HUQXbjfQTR4of0=
X-Google-Smtp-Source: AGHT+IGW9+UNdJoSoMQWQLLa+nKhbXkPBRIXb/hDHxwYLWkd9V/9I/tnlcBc7b+3OJdi0V+PDC3PLA==
X-Received: by 2002:adf:f3cb:0:b0:374:c2bb:8387 with SMTP id ffacd0b85a97d-37d04a57f53mr225935f8f.30.1727889919147;
        Wed, 02 Oct 2024 10:25:19 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730e9dsm14363501f8f.71.2024.10.02.10.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 10:25:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 71A295F780;
	Wed,  2 Oct 2024 18:25:17 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Helge Deller <deller@kernel.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-devel@nongnu.org,
  linux-parisc@vger.kernel.org
Subject: Re: {PATCH] accel/tcg: Fix CPU specific unaligned behaviour
In-Reply-To: <CAFEAcA81YtAGO0iFZRWXGjJb91DhWEDTGr+cjWbNWEW4yJDksQ@mail.gmail.com>
	(Peter Maydell's message of "Wed, 2 Oct 2024 16:47:14 +0100")
References: <Zvyx1kM4JljbzxQW@p100> <87cykimsb9.fsf@draig.linaro.org>
	<CAFEAcA81YtAGO0iFZRWXGjJb91DhWEDTGr+cjWbNWEW4yJDksQ@mail.gmail.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Wed, 02 Oct 2024 18:25:17 +0100
Message-ID: <877caqmn7m.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 2 Oct 2024 at 16:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Helge Deller <deller@kernel.org> writes:
>>
>> > When the emulated CPU reads or writes to a memory location
>> > a) for which no read/write permissions exists, *and*
>> > b) the access happens unaligned (non-natural alignment),
>> > then the CPU should either
>> > - trigger a permission fault, or
>> > - trigger an unalign access fault.
>> >
>> > In the current code the alignment check happens before the memory
>> > permission checks, so only unalignment faults will be triggered.
>> >
>> > This behaviour breaks the emulation of the PARISC architecture, where =
the CPU
>> > does a memory verification first. The behaviour can be tested with the=
 testcase
>> > from the bugzilla report.
>> >
>> > Add the necessary code to allow PARISC and possibly other architecture=
s to
>> > trigger a memory fault instead.
>> >
>> > Signed-off-by: Helge Deller <deller@gmx.de>
>> > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219339
>> >
>> >
>> > diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> > index 117b516739..dd1da358fb 100644
>> > --- a/accel/tcg/cputlb.c
>> > +++ b/accel/tcg/cputlb.c
>> > @@ -1684,6 +1684,26 @@ static void mmu_watch_or_dirty(CPUState *cpu, M=
MULookupPageData *data,
>> >      data->flags =3D flags;
>> >  }
>> >
>> > +/* when accessing unreadable memory unaligned, will the CPU issue
>> > + * a alignment trap or a memory access trap ? */
>> > +#ifdef TARGET_HPPA
>> > +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  1
>> > +#else
>> > +# define CPU_ALIGNMENT_CHECK_AFTER_MEMCHECK  0
>> > +#endif
>>
>> I'm pretty certain we don't want to be introducing per-guest hacks into
>> the core cputlb.c code when we are aiming to make it a compile once
>> object.
>
> There's also something curious going on here -- this patch
> says "we check alignment before permissions, and that's wrong
> on PARISC". But there's a comment in target/arm/ptw.c that
> says "we check permissions before alignment, and that's
> wrong on Arm":
>
>      * Enable alignment checks on Device memory.
>      *
>      * Per R_XCHFJ, this check is mis-ordered. The correct ordering
>      * for alignment, permission, and stage 2 faults should be:
>      *    - Alignment fault caused by the memory type
>      *    - Permission fault
>      *    - A stage 2 fault on the memory access
>      * but due to the way the TCG softmmu TLB operates, we will have
>      * implicitly done the permission check and the stage2 lookup in
>      * finding the TLB entry, so the alignment check cannot be done soone=
r.
>
> So do we check alignment first, or permissions first, or does
> the order vary depending on what we're doing?

If it varies by architecture and operation that is even more reason to
encode the wanted behaviour in the MemOp.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

