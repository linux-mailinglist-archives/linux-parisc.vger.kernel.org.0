Return-Path: <linux-parisc+bounces-2591-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31412995606
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 19:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F5B41C25755
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 17:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BF41E0E0D;
	Tue,  8 Oct 2024 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNI0dh0/"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E7D1F9AB7
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 17:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728409866; cv=none; b=XA/S24Qd+2is8EPi6X+3T6OFNSN4/lySalPjEIMbs1Wqt4fLZEJi8k6sm/BAGHYpHA/bPLOnPss5fajM1fTojyDs5qc3s+xECxV4DzyK1VCAheaE1vib3wbiYnmNgNPKFL6fAiOXNBXy181C14W1vvP0IvYFlvjn2g03dD/rd9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728409866; c=relaxed/simple;
	bh=MWKi3TzMFXfTBv3pd1ZvyKygqtH89RxY6j8Ap63DHv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IU82Y9vmAhmIZAnF0AUXY2I+/nzj01IAT7ss2i1JTTY0LFQiyPHsWp86oUColu1G82h+lnu/L7mFWrcUU6hux2p8sQtFJUjiBR5qb466Vs1bkDzhO84vpPOgOVMQUekqebMuaS8SK5lWBfFbX0YScCuSd+vY6jULMk+M8sBDj08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNI0dh0/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b86298710so50708705ad.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 10:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728409861; x=1729014661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u61rbn9oStn0Woo0fYr3gUc00N9GLwZAKPF4sc2tom4=;
        b=RNI0dh0/uj/d/+0BkOOa1YAlpX4Z605UkVk4wmD5BwgEnJp2h2VDUZ6S57PEQ/cgUv
         7HQqKqlKrMIPmnZSyyH8AEb3tDfRW6ce6GWe//ybdnBTVeBlL4M7/yJXtrYiYa2nEMM4
         EGzW0MJizmE4M37PMTs4tVRFY4x+u/2r8wvNdRvG+QRcCMLRWio6riCYbBb3oZnVoTa6
         ZOA6e+SuQA1GkMNWM7U9AL7AQ4Xx7qkZ3mPY0x/X6/H58F3n4Fwn97tRt14QIAvHtYAH
         AVc9p1nLmdg19Erj9QO3gia+qsyalfC+Bv0shUi36Of6MX7dcV72NNWVbXSD27239jR7
         /fLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728409861; x=1729014661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u61rbn9oStn0Woo0fYr3gUc00N9GLwZAKPF4sc2tom4=;
        b=JXpvpZNBN4m7lbXD9DPScmP9gvAKGoTsMwAyGqpi7c66A9DuCezYneDTdHTbcAxwWF
         JMs9VlCAbR0qM0n77kPLfLL6mZGOVFmdibRTf7NB1ZPtVOlKTN09W/htLWP1QX5/Hj+U
         zS/fiGstTdERaJk4t90JCQM2mY6SHxa01n/oI0fvEr7eO+D4CcBMtZQcEV7a2Q9JsZT2
         +YLGT/pyRLYO089vbO/dd3Siq0tAErqumbSY3lN1iMwtYKoO5ajAFfZOgo1rvFS/DkA7
         CSixVHf6J+x/k6VmyMP0Hzyfqaq1z10pFowMAwzy9BRTvbyWgktpTtFXFAar3c8bDnX1
         Fu+w==
X-Forwarded-Encrypted: i=1; AJvYcCXmG53fXekUEdRWj2P0gbe8pMjpEeVwZ3E/VO5JGJSNf+7fq0y7wgwjWE2J7fHje8ug5SWS4eAmEib1oAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mrhdIM2yiOnDjPsBbgLhkK2RozY93hLthoMzdoTmdrsA7s29
	pVEuxVUZ79zzJg0E3PDVpRfNFmTM3B0k4+Rn0G/MmrPl+l3r7qJbWSI7S3mA15g=
X-Google-Smtp-Source: AGHT+IH/gmp29kQkCW1MHpP2Fw7IWUdIixZZ3svn3bgb1FIgQf5uLSMcvXEpVcoiw4XJJPN6VTBMxQ==
X-Received: by 2002:a17:903:1c2:b0:20b:51c2:d789 with SMTP id d9443c01a7336-20bfdfef83emr245455255ad.16.1728409861117;
        Tue, 08 Oct 2024 10:51:01 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbf62sm58642245ad.89.2024.10.08.10.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 10:51:00 -0700 (PDT)
Message-ID: <fc414fcd-3e83-4cbb-ab81-77922b4d3c64@linaro.org>
Date: Tue, 8 Oct 2024 10:50:58 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] target/arm: Pass MemOp to
 get_phys_addr_with_space_nogpc
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-15-richard.henderson@linaro.org>
 <CAFEAcA9B1OsYgChehuz7uRgP-=Mbh=4zSK+owJz+BoBvA4Cnvg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9B1OsYgChehuz7uRgP-=Mbh=4zSK+owJz+BoBvA4Cnvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/24 07:35, Peter Maydell wrote:
>> -    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
>> -                                         &res, &fi);
>> +    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
>> +                                         mmu_idx, ss, &res, &fi);
> 
> 0 is the correct thing here, because AT operations are effectively
> assuming an aligned address (cf AArch64.AT() setting "aligned = true"
> in the Arm ARM pseudocode).
> 
> Is there a way to write this as something other than "0" as
> an indication of "we've definitely thought about this callsite
> and it's not just 0 for back-compat behaviour" ? Otherwise we
> could add a brief comment.

Nothing other than 0 is leaping to mind.
The documentation for @memop includes "... or 0 for none".

Perhaps

   /* This is a translation not a memory reference, so "memop = none = 0". */


r~

