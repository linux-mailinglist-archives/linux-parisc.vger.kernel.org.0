Return-Path: <linux-parisc+bounces-2544-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8FE993913
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178611F24F75
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BD91DE4D8;
	Mon,  7 Oct 2024 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="kZ47RXGI"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231B01DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336220; cv=none; b=S1LPm8fjeFsysk3c6yiBZXSy7aAzDHpXxLdn1YwQWgY8f/HTN2Ed9Zob2X1Y7n98dmn1+tlwsK/F9YQTTeOBqCk2HLFUvB9gvlI/lZ/X//wPB7G/ImHW+m77g3Az+SH449NdI9uRjEFrpF5pw9uRJmt48ubJzFNWwpvaYRi57z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336220; c=relaxed/simple;
	bh=OhUZ5j4MkSGfutgdGYRNSBsUBlnWgM6wc5TRGIl0zJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QI5O4rXsNl1KU0sueM/j3SwF+WnhEhNAxqn1PMxaeN+ssI5btUEcssanoMY6wpPWM7iujjQg3Q+uGTf0C6ScDXI3WAeUu2n/ERFDJygUvjRpaiYxxZ0tWLDc8RjYKTGiLyMe8wD2iItYQfc/BOoohpBf1KNcZlbDT2YUExY94yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=kZ47RXGI; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336209; x=1728941009; i=deller@gmx.de;
	bh=ko354LG186fLpZu/ixwDw+qWTEWE2St6PCuSXBzYjV0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kZ47RXGIQneEGpy/oEvU2ZRneopPnENqT9Pk7q0H3iXa9r3gDom41hxvozYnQkDi
	 kgQ5+M67Rk1rEV5+ahXm1zref0ohUapaz+BRzQgIXu2nk3Rpp4RTpFEhfEjoGaDVN
	 hoDsQc3zTecF0gx/V6dQjprSX8p4qWFju9unfOfdoCsOdNtsc8ul68tli5t7jDXwm
	 8aDYc/cxYj069WCm9tzEQ4g5j4MM0LYXvSyI5F3CQNXvhDC45PwZ0U5E+BAHVYqqY
	 TbMNeNCaf/w3kHsOHOE8aNrORAvwko3bbL7lFw757kXT9k+WcTy5e6Mv86sJGyTal
	 4fkL/ULskxsi5K+Yxg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowGU-1tm8fH1ozu-00layJ; Mon, 07
 Oct 2024 23:23:29 +0200
Message-ID: <bb81e388-e3dd-4207-8095-d0c842922815@gmx.de>
Date: Mon, 7 Oct 2024 23:23:28 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/21] target/arm: Pass MemOp to get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-19-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:irmxq3lfuF50xumgFJNeKX6m05M37+Q8zYxNITSlMygxh0NU3g9
 NWHbrEy6IrqskqHPf4bty8Y7x8SKZzaejL+1kpS5Rzmxo8hYa6PTFrAnwYtGMRAScNp3m+l
 mV0Ur1XHiZd4GMScpcJWFQvoqnbYCUezUeyeryQuNzVd8JHKKYYX1/hx5gFKzfyJagvwQeJ
 oeevVbyQXpZXATV/dlUqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NGs2bZSIkEU=;QvCQ4LAmV8rnXloB7qzpqnlkBLA
 BRCV2/qVfcKblPxksWpX8svdhZJDs+Ka4FDzOpXTnQcFVlkjHLg9qJAwQHjFmkj7/9I0RgaJi
 DOcXw0HtYs44VTiQj7F7bxAvX5XqAMyhAbnWA0pWlpcTVqpwD8zyREGkH2ckn0NwZoqBPE1FA
 25/8CPEXTwrTlysJ0G0SG105O5HcU1MFUynafWtNbouRessY3vnDDfuwtkLLIEaw3NRbhhd5x
 Btny4uu6+PtMl6zAbx48198aKkXlh9B5dV5XPYT6DZ1njWE+dHh+wjUFqUPEkEIFBK09zv8wb
 fXAbuloWC82ptjDWiMwZu0+AExGpibouYwUhGlo+UL5XWr1YPFWil9JOIW28lT6dtaryJD0RT
 6BjFcsXaPotjpyYu2mq++wJ0DvZ7FmqZVggIPgyLDYUpulFXlQCIjp2YPIRuScEpsmjMeNtw5
 XkW5rW0LuFIuVz5wyIuzNA4jt2aN40P/aK04N9X2K4IRXvt7mima5YPpkWNvJ1hBMgEpI0EWq
 jz24B8smx1OjMv0NJfZjfBKG1y6L6rDlQDY9yCZI9xwjWDN0VJHFFosqmPxVOzyMfZD2PyjVc
 xUKNNJXQKhBJ5DQl4CL4AtQ0rMC8yeBiH9E40z1J2UD7c5x2R7kX8kxxPZnihEcVxPzM4xlkA
 ebP1c/cpjlX9PEL7bti12H+6cf50wUrHSJqLMdDW7wbrUFNj6U/t1fZBRvT4L8i5qHdH7N/FE
 A5GT+wrlLb+mEVGAsGrkRs23ZTRC3ZV+FGnB+3WO6TkXmc52mTl7Qo7HBh4IXfTmf6e4psgrf
 HhAUA8VzaJy2NTGr2wjkfW6w==

On 10/5/24 22:05, Richard Henderson wrote:
> Pass the value through from get_phys_addr_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/arm/ptw.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)


