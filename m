Return-Path: <linux-parisc+bounces-2520-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC759938B6
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60CD628538C
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A1B18B49F;
	Mon,  7 Oct 2024 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="FTxtQt6T"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CEE189BBD
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334937; cv=none; b=Q1bbYlyx9pHQCHpAqEiMMGdMQ61VA7zqoGdq0lHwkQMTe+iylzUeA+nCZrepcOr7X6MnOinmXitDk4ShBcLlPuOunns00QEkH7BQk1/p9dGL2fDZ9GEMKdSA5kZ5mLaOUKTG361lyiuWTVRS0IsghCBVqXdZgJ2qNYa2mP9N9bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334937; c=relaxed/simple;
	bh=/NLQDu6rMICk3j3X1BegayoiqYEeLPYpP8Sn3yoUuLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMB18AyGmjwlvQeY50A8Rp2pDKfMwzAtIkj5Mzf58GyyYCuX1zNDFG7jE3i8BAOAGjvtFfhYbHjgqM+izLlA4+XAymi0mSbUE0BwrbB19NZiQGTMxPO89hwzrraTtZNCAVSskyBskcYdsSi85xBqvGUM2tG9HDWZ15xmUzqbAKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=FTxtQt6T; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728334925; x=1728939725; i=deller@gmx.de;
	bh=Xh5m0gVCYGwVn938X3xjGyOvV0Ab5N3D1UUZ3mAE+CA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FTxtQt6TiRigCUb9eIQ+2GtGX7fZYg4dOUIZdh69vdmQVb5n2irqKSp+qJEtRRFd
	 3/nbKahz5zpDZPlFDnC34VEnwrBcUqY0yYbl0s7OKhTwGx3Hq0RkYvUYYCzmExic0
	 tiNSYO893zO12c/UJrIX5FeRoQUH/3A3pjWhznpH37IzjFtOFJwaJ0jyNUio4mqit
	 c3uE6dC41q7WGpGqiHj1J1FfJO/PN5lKb6vNNX7h/NDjpwVV0/SUgJY7pz51Pvye9
	 bV26gqr+CamGgE/owUCN5otdtzwALHYcv4eFa+n738zu5zfln+iNf+J42k3OEq6UY
	 QqtGyxA/BbXb9dXv8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeR1-1tTWcZ3Agt-00Qd0J; Mon, 07
 Oct 2024 23:02:04 +0200
Message-ID: <0e45843c-01a7-4e89-a809-c8f03d0ca304@gmx.de>
Date: Mon, 7 Oct 2024 23:02:02 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/21] include/exec/memop: Move get_alignment_bits from
 tcg.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-4-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KPfvXCahsFFrqCAao6fdpdWwRAT2fhIG/UicyG3avH9T7NOHCZB
 rnp5xqcrte33AH3C6bOKBhydIHvQPC0lMhd4AEitwln5Npje0hsGzIbOAOIlCgtmFyetcxE
 0u4Pi4GNLPrCJWKpNLH2feCpO7i3hE53ZT42/jM3Jy+VZW7nIszXu3uk1U8zG06RA/w1eF+
 JmgOyyJASLKHrWdvTWZ2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ql2WnfdEydM=;HGk6ueqeBTR/8IenwnS4ZvirnFQ
 +uxsLLXpTJXbt4WtFFmcxDdJ+VkhubiIeHpzO7cAGZjHTl+9LhfriQ+njvoU+ecLEeoICS6Hz
 59ncO/dyA3hFlUgEULvMrJoOZ0pm5z4O9YujV3hlFZpEJv5ru4/7So5tpBiZwbjtVJgbyUZ49
 y2W8ALmiHtdtzT11IqyCBx9l2j3BlsHFyUxYupgrSIfFE8QuJM2vRneLDrR3NsT5NCfx7kkCF
 0mDXfD6FYAIDMA13KkogaCWdPoLytLZLUFtawS6oWIXWaGSpzhQ2nlcUx28WixqflrnhuU1XE
 MqmUVbhRsfRRHxqXm3/TDaQunakk/A8QWAx+Ir7oar43/xprPIlxxWWkUsiK9OB9sTgJRvDaE
 epBhHUK2eotPHXQT2hezBa6jU6JwKpUtu4SpI8xQBAUCuyJ6QEr4ReKzGRGELHmDW83dHSzn1
 ow5evmxsuaCK7dnzvNDHUes5rsy/Qmd6iV6yB2jbTRTZAfnDMvH8yLbOaW8+t/G/nLBKjgEIi
 OTt6Q+CTwnycGnCjpNNAGire80FQ8dlbv8ysmqHQHr3Y0o830iA3BlMp7L9U/t5Er+9hg8BYx
 YpDHqx0FP7hwIg3Wv3oVKkomiOQNk1sEh6dw5u6bKVsHlvGKYPANF9KvCXGVgJ84R5i673i/I
 gPRKCm7rsS9lZ9EdkDzaXVtE3cxlDR818n7iNIvIX0Y8PMmcGpkyjKQrOWsrglG6tSK7b0TIl
 PhNkUOJs5t1VIetJwiaS4kywUTBxrioKOvVo+zbDD4mTGapAbbmuoaAhXPaytRaAsKtBhOjCM
 5/Kw++di6KhLqBM0M/bFVF1g==

On 10/5/24 22:05, Richard Henderson wrote:
> This function is specific to MemOp, not TCG in general.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   include/exec/memop.h | 23 +++++++++++++++++++++++
>   include/tcg/tcg.h    | 23 -----------------------
>   2 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index f881fe7af4..97720a8ee7 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -170,4 +170,27 @@ static inline bool memop_big_endian(MemOp op)
>       return (op & MO_BSWAP) =3D=3D MO_BE;
>   }
>
> +/**
> + * get_alignment_bits
> + * @memop: MemOp value
> + *
> + * Extract the alignment size from the memop.
> + */
> +static inline unsigned get_alignment_bits(MemOp memop)
> +{
> +    unsigned a =3D memop & MO_AMASK;
> +
> +    if (a =3D=3D MO_UNALN) {
> +        /* No alignment required.  */
> +        a =3D 0;
> +    } else if (a =3D=3D MO_ALIGN) {
> +        /* A natural alignment requirement.  */
> +        a =3D memop & MO_SIZE;
> +    } else {
> +        /* A specific alignment requirement.  */
> +        a =3D a >> MO_ASHIFT;
> +    }
> +    return a;
> +}
> +
>   #endif
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 21d5884741..824fb3560d 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -281,29 +281,6 @@ static inline int tcg_type_size(TCGType t)
>       return 4 << i;
>   }
>
> -/**
> - * get_alignment_bits
> - * @memop: MemOp value
> - *
> - * Extract the alignment size from the memop.
> - */
> -static inline unsigned get_alignment_bits(MemOp memop)
> -{
> -    unsigned a =3D memop & MO_AMASK;
> -
> -    if (a =3D=3D MO_UNALN) {
> -        /* No alignment required.  */
> -        a =3D 0;
> -    } else if (a =3D=3D MO_ALIGN) {
> -        /* A natural alignment requirement.  */
> -        a =3D memop & MO_SIZE;
> -    } else {
> -        /* A specific alignment requirement.  */
> -        a =3D a >> MO_ASHIFT;
> -    }
> -    return a;
> -}
> -
>   typedef tcg_target_ulong TCGArg;
>
>   /* Define type and accessor macros for TCG variables.


