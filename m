Return-Path: <linux-parisc+bounces-2546-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F099391A
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A638B1C22F9A
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4F91DE4D8;
	Mon,  7 Oct 2024 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="AF6AdqJP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8CF1DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336358; cv=none; b=aXg1cA+9CX8+i8AZ1+U6Td8DnMfOriQeDdUIratddsadrXn2oatRdOe9g5Dm6drWE8TZ13Cj9c2RIXnqbvLJE5nOpd8JNJZeZAB0J5hHnfd3TaMDLeAu2vhgVhulN4LYkvOVa01ANCSWdAxu61Jf/xBw2sFC0CDI80mCbzYYftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336358; c=relaxed/simple;
	bh=12GFJu5Gr43AL8UvHC2JIJTwjsQIJxQwIV5amswNhbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSYZkaAooa4rpVjZnh2W7TNvfwjwd/4ygkFPdCtt+GkreHiT6oAKRt/F/g2L0FLqZbMpMZW0G7Irio/15YCM4Bk/XH8wNotmr/fdoFgGZp8l4oD6GcS1jPPNkkLPjJoaIE5JUCwuFj9Mv47TYPxH18MTWmdBnHfqeEClcuMYLXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=AF6AdqJP; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336344; x=1728941144; i=deller@gmx.de;
	bh=/6kYe65SKMcicOCKh5ADZUEKSAFjWpZ0mMFYAo+g85U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AF6AdqJPHDRNpcYfqwBI5SzJ86fwhChT4iBJ+UvAugg9/8Y2VVy7cb3Pqyz2em8g
	 fS1lRWBwWsEuqz0FJ2CJd5QC4lTzaDzw6u5ztRI4vOEVnjad160jZkhq+a7CEpHA2
	 J7ZC0+Uw0tkDdVRn35Tm7FbtFzpGyMRxE53MfoDbweR862vB0G2CDFcInNWMhJ3q7
	 7Cqa85ujtnOx1TIPCwGZeBjVXtZjwE/TGC3lrb1fGbB7klwAACGFutuv/o/NSOvpH
	 dW1yg6Lpd696YfDhNJLVx0zdVfQiwck/spJeraBzwfMtvLWiYRTwo6qsOtL7nkrys
	 CjTitFWR+Hf2Kkbt3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72sJ-1t4F9j0mYZ-003VDb; Mon, 07
 Oct 2024 23:25:44 +0200
Message-ID: <4d7e4ea3-be70-44ea-9958-5f1b3aaff5fd@gmx.de>
Date: Mon, 7 Oct 2024 23:25:43 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/21] target/arm: Move device detection earlier in
 get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-20-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+yEiB+QnkLPPdYILVQkbkz/xPBXtJb9qoSPoJ/HNyxQHvgriRUf
 l0UVPtkFXjaX+L30ZIcU2ogak6EKyAdICNkL2lDqEZ9P9bvfJ475rd/e9xd77EJC1Nhce2c
 3XKLoUUpOSgSQk9ZK3+MbqQgq05Bar10EJLLUjpo2NxsQnFZdmKTwjjxJkvZMHpP7gjBj3K
 S9X5mPuGpQZyDliqkUz+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ABOw0Kn3tKI=;C2jzHi0+cIFqu6CeJIsKYh6bOcm
 f7AcvA0pVOmiwpoBY4cLmY06ox5M1cbpovXU/KcaLOy0NHEZQof8/Qy+T0laZCTAUFQo4hxjp
 xKpxtvGkOe2B57vnRNRARPoAUtsEMlGUbiRMUcJnh/x24w6xCMg0cZ1Jzf9vu4S+Uxk6JZ7yi
 NJfkTn2PRsjGl8VsgRzCgu9D3b3i6zFaYmc8QTdZfJInJf4WpuZSrbHLKKf1a7+OcGKXS56AR
 Bl8Y++ZS3v7y+QBMhVFVV3mmKiWjmPSs+X6zc6N0e9Z5LFPGKV6awt3K+l8w2x07IwJV0i0Uz
 K0yyYI0fLcdOHbVce/WOfmc4RomOgNiu8GH+jGtpr6PLpQmLRmG3q6T7rDtnwsFbyCPfwP9p8
 QnqNH8rHRisAR67Ka73E4T3zyw2Av2lx5FVfXkLhabce/zL7XgVSOkALiG1awyIGKNwNIi2xE
 KiVtA/edLVFJ+P9G5SKGZ+dJ/dzVd7MjwMPc7jOd7RY+nyQ8alXDNGQVRc/nAhCuF3qbmLpdf
 +084cC253OIV7or+qNPojBmGvHTVQWwOLTlZH+C7raC3qKfH+tESp7CVQDd1XxrtjbGGNl8U9
 5BDFRbqXQcByO2+zdJVE/lFVkQX0OEl6dmAJgY+qDf4+r7AaiHFYTAM5hJr68qQBBUTsvprqn
 bKuHD1vlB9pHuMKl8yaVkZWTNaum6E75C53QxVOA4osT/FuJ67vfqilEsdGeVCQQ/iWuHkZFr
 HUG3IBxy+RXDkFxSqVjX4eGJgkRfKnj80OMwOqOj1TXCIwIv2EHHAszTMrSIvqDdxhbDupF64
 iEre8+dcE08Kdb/zqhEE9z6g==

On 10/5/24 22:05, Richard Henderson wrote:
> Determine cache attributes, and thence Device vs Normal memory,

"thence" ?

Other than that I have no arm knowledge to review the patch below....

Helge

> earlier in the function.  We have an existing regime_is_stage2
> if block into which this can be slotted.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 49 ++++++++++++++++++++++++------------------------
>   1 file changed, 25 insertions(+), 24 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 238b2c92a9..0a1a820362 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2029,8 +2029,20 @@ static bool get_phys_addr_lpae(CPUARMState *env, =
S1Translate *ptw,
>               xn =3D extract64(attrs, 53, 2);
>               result->f.prot =3D get_S2prot(env, ap, xn, ptw->in_s1_is_e=
l0);
>           }
> +
> +        result->cacheattrs.is_s2_format =3D true;
> +        result->cacheattrs.attrs =3D extract32(attrs, 2, 4);
> +        /*
> +         * Security state does not really affect HCR_EL2.FWB;
> +         * we only need to filter FWB for aa32 or other FEAT.
> +         */
> +        device =3D S2_attrs_are_device(arm_hcr_el2_eff(env),
> +                                     result->cacheattrs.attrs);
>       } else {
>           int nse, ns =3D extract32(attrs, 5, 1);
> +        uint8_t attrindx;
> +        uint64_t mair;
> +
>           switch (out_space) {
>           case ARMSS_Root:
>               /*
> @@ -2102,6 +2114,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, =
S1Translate *ptw,
>            */
>           result->f.prot =3D get_S1prot(env, mmu_idx, aarch64, ap, xn, p=
xn,
>                                       result->f.attrs.space, out_space);
> +
> +        /* Index into MAIR registers for cache attributes */
> +        attrindx =3D extract32(attrs, 2, 3);
> +        mair =3D env->cp15.mair_el[regime_el(env, mmu_idx)];
> +        assert(attrindx <=3D 7);
> +        result->cacheattrs.is_s2_format =3D false;
> +        result->cacheattrs.attrs =3D extract64(mair, attrindx * 8, 8);
> +
> +        /* When in aarch64 mode, and BTI is enabled, remember GP in the=
 TLB. */
> +        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
> +            result->f.extra.arm.guarded =3D extract64(attrs, 50, 1); /*=
 GP */
> +        }
> +        device =3D S1_attrs_are_device(result->cacheattrs.attrs);
>       }
>
>       if (!(result->f.prot & (1 << access_type))) {
> @@ -2131,30 +2156,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, =
S1Translate *ptw,
>       result->f.attrs.space =3D out_space;
>       result->f.attrs.secure =3D arm_space_is_secure(out_space);
>
> -    if (regime_is_stage2(mmu_idx)) {
> -        result->cacheattrs.is_s2_format =3D true;
> -        result->cacheattrs.attrs =3D extract32(attrs, 2, 4);
> -        /*
> -         * Security state does not really affect HCR_EL2.FWB;
> -         * we only need to filter FWB for aa32 or other FEAT.
> -         */
> -        device =3D S2_attrs_are_device(arm_hcr_el2_eff(env),
> -                                     result->cacheattrs.attrs);
> -    } else {
> -        /* Index into MAIR registers for cache attributes */
> -        uint8_t attrindx =3D extract32(attrs, 2, 3);
> -        uint64_t mair =3D env->cp15.mair_el[regime_el(env, mmu_idx)];
> -        assert(attrindx <=3D 7);
> -        result->cacheattrs.is_s2_format =3D false;
> -        result->cacheattrs.attrs =3D extract64(mair, attrindx * 8, 8);
> -
> -        /* When in aarch64 mode, and BTI is enabled, remember GP in the=
 TLB. */
> -        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
> -            result->f.extra.arm.guarded =3D extract64(attrs, 50, 1); /*=
 GP */
> -        }
> -        device =3D S1_attrs_are_device(result->cacheattrs.attrs);
> -    }
> -
>       /*
>        * Enable alignment checks on Device memory.
>        *


