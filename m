Return-Path: <linux-parisc+bounces-2225-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0017A96A7FF
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 22:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56262B20408
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 20:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7E11DC75D;
	Tue,  3 Sep 2024 20:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yhlI1MrV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8D61DC725
	for <linux-parisc@vger.kernel.org>; Tue,  3 Sep 2024 20:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725393929; cv=none; b=TRSTrV6cH/TVL/2NTDcRCYxioyB8wD64yze5i9sJ3cDcZEydyztn8/Y5Gca7nDLn5kdSIYmbNLhngtVwtxmTOnYdE46RPAwJO75qKC1u+eLrQ785Nb00WthVVspel9Q3TbBvDusF+0wGRVFdoulhkyO/3yKsXNh7yQyYnhjaHdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725393929; c=relaxed/simple;
	bh=ftI1HwawpBxJOItXWNp2xMKm4cje97xe6GG/2WW9SnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aV1bmYH/YAfzjPC4VN3dwiHB1phFoZ+3GuNl9DrQ9PZE92iLm/m+8yeWzufTDvdjBK5IELUhHROofs33JWo2YBsEjp3/EfQqhl8F+U1BYK/FlmoPsygIry3X6JF88eCGB/rNmNXS5j4KRui6gAVbhm985pPuH5bChnjxNRMlVpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yhlI1MrV; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71774dcd09aso701513b3a.0
        for <linux-parisc@vger.kernel.org>; Tue, 03 Sep 2024 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725393927; x=1725998727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSFin3VvSpcpGfWbuna+RqNrU4McKXuSxxwVuuLt5sw=;
        b=yhlI1MrVcfNW6UuTFe94lVdG7s4CUXZr6bB4fJIm9enMhWR7zHMtMiE5k+oZW5Lp2L
         CMbFcnR9gQFPaxiWWvaHfGHrscPK3ls1K2MReUL3UmRG5gexJ00AHMraPOC22AlOLN9N
         O3sqPYgG6ha7pNJfq6oXitIwDQDBYVLXs0M6xzm4PvmgSFeHWulfBJAfFwpfrmXDW20n
         xEqh2Xp599Ue/J9BXF6rKu/MMBGLnPAwo15VplY08Q3UQLgsFmyUDK8qPK7iXYcjTzbN
         wt5Pm52KzsdOJyvZ1l4f+D2+2KABqxnBI9tzUGVHae70P0zmUTv3kZI+ov8mbhTI78Qo
         fbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725393927; x=1725998727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSFin3VvSpcpGfWbuna+RqNrU4McKXuSxxwVuuLt5sw=;
        b=nOZgb5QZh/wMMyTGKunKnKfPvCduzlkRmi2O1T5gNYOseVBOEtNeaLOmoSgsDs+U6L
         rH9hP/IgXA/a4Unik1RgtM74PFWqHXhbSn+p2+aIYQ9zKE5PeFlYCymL9RrKFrDLK0zA
         5Xdm1cBbaisdu7VlpJdRvCjHWJy/+9hYTePKh+iwmTPiS772jFoT/QX2x7K+jbbVdnkp
         z/go+YEsdRLQkelwMHpaCi0QQXezXrkauPA1zAa0dMgsCBuW8KITDSZF5NrWACtcDnRt
         A73sEXanBbcDRLOGWohCs9RpjUsQ7H04DJKWN3lMl2TrYPaQuAO/oorqZAvdyrTTjxfr
         XcOQ==
X-Gm-Message-State: AOJu0YwXwaYu/00i3A2F8NBnkmXZC2Hu3JBkrV4S5v3/fcRVp3LkZ8io
	/h82N5lmrjKA7EdVAQMFoAcvB70rueVAttNGsowaX9gbXu1r3LWXX7icmaEvs5HOxaHQFy5JGhS
	WUqs=
X-Google-Smtp-Source: AGHT+IEq8eOpn/KydhNRSx2XUo/216/AHTeyjAYD9nrCeGPuRkmUO0lU4KZ1gEGfwzo2R+B3rVZw6A==
X-Received: by 2002:a05:6a21:390:b0:1cc:9f2d:85fa with SMTP id adf61e73a8af0-1cece5d155emr11688264637.39.1725393927032;
        Tue, 03 Sep 2024 13:05:27 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177859894csm254131b3a.153.2024.09.03.13.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 13:05:26 -0700 (PDT)
Message-ID: <4959cce9-415e-4ba1-8ad4-779b6a1e0262@linaro.org>
Date: Tue, 3 Sep 2024 13:05:24 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/hppa: Fix random 32-bit linux-user crashes
To: Helge Deller <deller@kernel.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: linux-parisc@vger.kernel.org
References: <Ztc8MaxI8SfD71mx@p100>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Ztc8MaxI8SfD71mx@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/24 09:41, Helge Deller wrote:
> The linux-user hppa target crashes randomly for me since commit
> 081a0ed188d8 ("target/hppa: Do not mask in copy_iaoq_entry").
> 
> That commit dropped the masking of the IAOQ addresses while copying them
> from other registers and instead keeps them with all 64 bits up until
> the full gva is formed with the help of hppa_form_gva_psw().
> 
> So, when running in linux-user mode on an emulated 64-bit CPU, we need
> to mask to a 32-bit address space at the very end in hppa_form_gva_psw()
> if the PSW-W flag isn't set (which is the case for linux-user on hppa).
> 
> Fixes: 081a0ed188d8 ("target/hppa: Do not mask in copy_iaoq_entry")
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 2bcb3b602b..56d9568d6c 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -319,7 +319,7 @@ static inline target_ulong hppa_form_gva_psw(target_ulong psw, uint64_t spc,
>                                                target_ulong off)
>   {
>   #ifdef CONFIG_USER_ONLY
> -    return off;
> +    return off & gva_offset_mask(psw);
>   #else
>       return spc | (off & gva_offset_mask(psw));
>   #endif

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

