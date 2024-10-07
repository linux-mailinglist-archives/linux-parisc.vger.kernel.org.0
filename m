Return-Path: <linux-parisc+bounces-2531-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246AA9938F3
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 568461C2037F
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46E11DE4EE;
	Mon,  7 Oct 2024 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="bCyaAGyT"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D6F1DE895
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335941; cv=none; b=c31v1z46u05TYnZ/11H12f4/PdadeUPKvT6235wXIQugV1eGFwWyXkq5FiPOF6guY8YyTRpWNUk4odKal1ND9wB5HB7zfr5M9rY7K528kX4uzhj1MWdCoxbfXf2n4UFk/2Hogz68FsDoSD27cxnpFEqtZ5WPF8S0HeCcjKjNzqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335941; c=relaxed/simple;
	bh=nbm93NifP07LblAnEVTbpkHEOLTs/uXuhDnLks3GKr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEVqlXuF+yLQajkovT76LrE5Ll4vO0fQIruwFjvsyOMprpzht0NdV4FvHJBVJV9gz44l6/H22vEC7bjD0fyCtpiY/3uexWL36iPhc7oSN5mxpdoJW1EW67gWS3kcFE1i43D5McXCfTKbc32Y80+NHjhKsR2yvt4wyPrEN3TE7Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=bCyaAGyT; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335928; x=1728940728; i=deller@gmx.de;
	bh=ybp8DxqGhiOCC3gBIGdXUk7U12n0Cs0I6KjeHangAac=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bCyaAGyTP3ycJcLqxotFpgTqB+tdsZT7iKmjl/IFarA6a/115B6Bi32m+x8hBOsc
	 Py8k0rqg0hXXC0bBPQKwmoCB8/lL8oRPsJw4/F4WrG07oXsIglxt2LzaEcoz+BLaZ
	 SMsvuSE1Hpqlhm+XWYPpnMtJ6O3VDAjcJL0Gqkyz0is0BfwrcZGEuNJYdd5dnbsjB
	 MUxO3PbNehIu/ozBs4av1kVRC9h4h+V7F6t0IjGRZcyZjAmNhOga82/n98dplatNH
	 RWSQ7T4Rnbajn2H8uitJINuWLzn2IJimJvTaUnGHq73KVhNrtXKlWlYF3eSMopq60
	 MncZFDfUVvCsBAdm/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKYx-1tHOLv0jRH-00PY3J; Mon, 07
 Oct 2024 23:18:48 +0200
Message-ID: <36c576de-a968-4f29-98d2-59c04d026051@gmx.de>
Date: Mon, 7 Oct 2024 23:18:47 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] target/hppa: Handle alignment faults in
 hppa_get_physical_address
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-12-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fq9gHxoay73UdIR3Hlz9VADnBL5kmz+0WOuaIZdPFIhmMVf8e6O
 Lw0OpnZoKGc7LNbjXpIPCG4WB54ljF56389IVUtxEP1f41R+SVwrgB0Pag/6Urt4gUEn2zH
 Uk008TmqfEnsE5Z/nB6X0mDFA5yWQB7F8qAskgagjETfUhZs7K9HtF2rfa+6ieFj9bnvuKt
 yEFHtNyasf2ZQFv63g+mg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ydmFGL/If6k=;a73ZldmkvBU/xA2L1iik+dZ0sfS
 dVSpBtRoZ8IRgNhZc9L6tbIWDDi6G7TFXfrCkSuY4UePgv6HUB2u/ukUeqKgVE+zULWQgM/6M
 Bde0NyiuJXzMk6tCTI8n97OlASYKa6bR/YmXhh8aKP/s4m0Bv6lXZFBJ/P8/Q7AtcyUKLFaeX
 8P648Rw2VYHAwO1MeBRcvXHfzVqif4UI07tY5jzkP9Go/udukjlT7RNM9nI7AcnAIL0sO6WF4
 UIP+ih2xEiQeUybvttwVD6fkK17Ny6IQPY+de+Pd4rp5HLQpMcllHaQ5uX9v6s8Rmh0ux8UWO
 BC0TX/jFiwFpdSV4OVLObhaTPaUIOkxKDF9921aKocRtvQ2hOxRxNUHgrIHSFHNoMklNH8QGw
 ad5qcZl7E8DJM63lE7OLWfYQd7F5Sr/1OuV9aWcPA9gHGjGxbwCrqtuY0GAYew1pWBH8D4jJO
 CL82qz+JO87uQFRuvDtIwMriz9t1NOm4X13HD8IHv8te2hr0cVtJsXkty9a9gdxT/3D3UrPWx
 5Qnuf7bzcUvrjpMWGD3DTzJR1tW12zVWKtMu/A1xWjJmwxumihRfeBn8hWRVoghbNO4vVwL8a
 mlinOATkhSn9Lttg7/A08I8PVjDnH57V2MKpWP8xdQY78YHXZ0/8F7Mx3CHE4yPVAMGsFzxBF
 NdXImLY6M6GbsQp7v8s1iuNE5CUzfQPByG8EY7ZmH6uBhXfOti8u2kjnchQq12Dy3wASGI++F
 i6ue0wktCCVrh+qMkm9/+uHgFLF9seQTR36Jos0NZaecVyzID7pLxY9dD0h08QgtBSp6JOEvs
 RaXGUcBiUhN+ZCuxbGd9SdXw==

On 10/5/24 22:05, Richard Henderson wrote:
> In Chapter 5, Interruptions, the group 3 exceptions lists
> "Unaligned data reference trap" has higher priority than
> "Data memory break trap".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/hppa/mem_helper.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)


