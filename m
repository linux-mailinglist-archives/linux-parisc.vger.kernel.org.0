Return-Path: <linux-parisc+bounces-2522-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B060E9938BD
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A963285685
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CE018B49F;
	Mon,  7 Oct 2024 21:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="aFr7chLJ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17D189BBD
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335109; cv=none; b=Q/IrlNz31fYQ+2p/2N4WkwAM82ia/X17SZtJ4E/xaZDWfqKY9ozfMKLVRSw5kywCV0EMFhYGYXB7cDvWB8DSBbgtQOK67JnDzFp/MrGQPColar1HrAhATS8Rpr4r7yfC5xfr64VV0LAUeLQCP4dyEc2jIKdlb+3L1K8IlNLn3xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335109; c=relaxed/simple;
	bh=WY3cGBNFChUvOY5Av15fWW18h5NI/fr9uUZNjantDFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izhI2VsSMT2buN0e+Byz43/rnWdIXQRhtv4fbdqkOKkKGUdv5OfJQKQ7pWrY8RCdgVbkkg78jrOlvDzuOJfuS8r6LuXaQ+RZz54iR3ECQglemtaDz/eFZ4LHHkVBqtERcdcK2o3X9lVJJsMibz+n0E1/DSVuxshIN+ODeKvEqp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=aFr7chLJ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335096; x=1728939896; i=deller@gmx.de;
	bh=Asn+5QYgZ80t/ESs8Mt65BDvhZZZgP6XVThreBfw+1o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aFr7chLJpgUI6a22iRkhLOZjlRs/VbFA0WRT+LOQfWCkuiSSqKuoeL01yAxoJKkU
	 L8BqV7U9D+oJWL+tu93FoMKXZgCBEba9Qk+kZx6+nY/HTh7/mdCSY6BAOHRrM8YQq
	 fATUguytU1FwCXgVAOKkduZ7Sat098PANYdmq3Yr5SqytvY4T6bcsA+xFJnkJI5Q9
	 RwqK8PGtT7bOhFdSysbAtyIUSi9LAmG1OIm88TVfimJz8cceK7lcD+qcVM0xpSBj1
	 TDzT2AdnBe1uLJ+UzrtaqaPSiHshGJPKh6S9S5/UO0Krr+GHzZJ6JsOLDq6lV0g2z
	 1NfbtLs717Y7nWkGrA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAOJP-1t9lnw3IGR-00GcEi; Mon, 07
 Oct 2024 23:04:55 +0200
Message-ID: <b927a1c5-d232-40f1-83cb-279595cf8d93@gmx.de>
Date: Mon, 7 Oct 2024 23:04:54 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] include/exec/memop: Introduce
 memop_atomicity_bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-6-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xAZ5XjPMPucqJ8WuHVVEKM1e96QQn8HOyXcnrGa498KFFmhQ3I2
 lyguGU2vW/F8Id9wM21U/hECIp6GsBzHJW4ZmDyYORXv143PAaa8IPWJGLsh9TfYxDRw9w1
 PBafWW9kZa9XULq7Jiur1zEFRKT5M6uIwG+5lfRgXy7SDCDQTC42reCuhRlBZ7C3TOKoPrr
 O0wB8fSghF5yZVHd2jX1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sCAgjSgLqos=;gItkBghhNOKlcgyT6h8kIMvTmiR
 9CrU9e2VYlTxifgpiWK8GVGX/9K5c4wx90P6xjEeOJta9AyQw9V363UdEo6IXbE5DaETwoClA
 MeoMKcfD542Wb+0KyeMJeIBGVLb9aHA+NhFKN2gp05h5EmtVHH7Wywk/mUJwgMN0FDgG0j/Sq
 0ttda9ilVj6Ul8giJmMXunkopj0b0/uokTYZWxNL+l+oZGvtaw/2InGxCn9ZppFJT4iO2wRi9
 1XsKqpDYRTa9oBoKtvpQLicc7GAOklHq+pcr+YSnvzoToXbsK8TJVuh1sgxdZYqJLMjMEh5SJ
 y2wDPceU4RxWjWb6xfPd9CJ7PweEEl3tJEL4Q1pFTuxi36AKwIaA00403bz8JD87PlC7uhk+M
 OC526abnVuf5kRsqdPyiOqgAAq6VERx/YnLTOER1OWk6fYA2cc7nGlumBVBg8sg80SdzPKeRJ
 ZPcvlRfQBhPQMP6m5nfqO//tnQs4cBIbQBN6qAhYPfVBgnlhlueasiIlV4U/jtVT32Ja/zeZ4
 bJ1Do0ThtGYFhOnLy2Phspmj1n1MHZ0p+hsFMDIEgZkz1wEmZBDK92fw3Q81GuYjEJdU0Mpo7
 TUsmxzoGrRgKwTsjtjSgwLjEm5QwZKbC65YzdcXZxESoN3aHSvUc9+PjVeQBhajoVuKwhSocU
 Y+DbugYJd++kpLSi2xyxo0ggCwFVqcmdfjYQLlAl2y6sZfI1fABaJ+yUYq5DvEUioEzSIMXGU
 jkupwYfCNrQJnKiTgnlnI8iXFV+k+7HPHIv8IpD0GIUMZ2L46l+VDQFzD2Ao26M9aer1o66fC
 yC8YUfL1Xbta7hHfusn2QEbQ==

On 10/5/24 22:05, Richard Henderson wrote:
> Split out of mmu_lookup.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   include/exec/memop.h | 24 ++++++++++++++++++++++++
>   accel/tcg/cputlb.c   | 16 ++--------------
>   2 files changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index f53bf618c6..b699bf7688 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -193,4 +193,28 @@ static inline unsigned memop_alignment_bits(MemOp m=
emop)
>       return a;
>   }
>
> +/*
> + * memop_atomicity_bits:
> + * @memop: MemOp value
> + *
> + * Extract the atomicity size from the memop.
> + */
> +static inline unsigned memop_atomicity_bits(MemOp memop)
> +{
> +    unsigned size =3D memop & MO_SIZE;
> +
> +    switch (memop & MO_ATOM_MASK) {
> +    case MO_ATOM_NONE:
> +        size =3D MO_8;
> +        break;
> +    case MO_ATOM_IFALIGN_PAIR:
> +    case MO_ATOM_WITHIN16_PAIR:
> +        size =3D size ? size - 1 : 0;
> +        break;
> +    default:
> +        break;
> +    }
> +    return size;
> +}
> +
>   #endif
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index b5bff220a3..f5fca5a118 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1751,20 +1751,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr,=
 MemOpIdx oi,
>        * Device memory type require alignment.
>        */
>       if (unlikely(flags & TLB_CHECK_ALIGNED)) {
> -        MemOp size =3D l->memop & MO_SIZE;
> -
> -        switch (l->memop & MO_ATOM_MASK) {
> -        case MO_ATOM_NONE:
> -            size =3D MO_8;
> -            break;
> -        case MO_ATOM_IFALIGN_PAIR:
> -        case MO_ATOM_WITHIN16_PAIR:
> -            size =3D size ? size - 1 : 0;
> -            break;
> -        default:
> -            break;
> -        }
> -        if (addr & ((1 << size) - 1)) {
> +        a_bits =3D memop_atomicity_bits(l->memop);
> +        if (addr & ((1 << a_bits) - 1)) {
>               cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
>           }
>       }


