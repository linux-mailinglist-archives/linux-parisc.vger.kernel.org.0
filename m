Return-Path: <linux-parisc+bounces-2533-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054729938FA
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292EC1C21358
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F521DE88C;
	Mon,  7 Oct 2024 21:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="ABBJK6dx"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269081DDA15
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336064; cv=none; b=ZTFCVwAVlFYkFn9xRBbUxPu+UNGlQ1K1gXlcuwQC6uRiyTzZpZqFevMmnMUWiDItGBBwhvsPrGygN9YsfpwMgZ7nRSrbnHA9CTgRf+4xZJU+zZnlYHgvowcNf4EvbkdqPtiElPGvFDHhVq5hdupkopX+tdYmK3dIER4Au0IiR9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336064; c=relaxed/simple;
	bh=4eKZj2H14YER18Jag1K2jdoIcSLz7b7l72RsgvJm2Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPXo+QutJF2ByhMpVjm8Rl89kOQHfnP0BkrqlZQqm9ay3KRnwolvAkTyNzV6hIW75oKGacM8VnriPbJiAo3jqN0UUMCBIjLI75whXerDXYPAdmboWULyS5G4D80q3kgvF00FffGmeL/8iTZuahJdTgITYIkUhslhDpMwM/W3+ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=ABBJK6dx; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336052; x=1728940852; i=deller@gmx.de;
	bh=mpYWNGgYZJ7ZaAXbQ1ANOYIQG1fDEEXDTpaLybT4prA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ABBJK6dxowzgL6sumx0BNCLrPljC+4HkfYlkIBvlrELvGQjJxitz6CV4U0TaQFHg
	 yXMRKLNN1zbCUBVlkqLf1rAUMzVtEGOUEFW8b8QSQAURK2Z9IW7T57vLzG2PG62RB
	 TociYUs15cARBVZIHALISzr+kOD8cTWcivhYMmHPl9/nRJYOSwcPWIEu5TxU+h4na
	 IajDy74sptPst/0YuFBIVUDkxCol6eFVXucWwp/3rBcUAlFFSB+JRShok3ZxDfCYh
	 SOGYvkmpYzeTRJ+BBJ5i7eErxCWlBh1xMSHbDgeHR7VijEclUinUtakNu8da849vw
	 RI18rvceyI9m77kTZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsj7-1tGq9m40E9-00Ol86; Mon, 07
 Oct 2024 23:20:52 +0200
Message-ID: <eafe88ea-585b-4770-a538-93d192fa64c8@gmx.de>
Date: Mon, 7 Oct 2024 23:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-14-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kZFzDC6V/IjQj7aFwqPEdkpM1xoLLpNdMqLnkFQs2dA4APpnBBd
 89QIcMGDpLYCpjWFtNx5JjoS485CWjY9WA3jtitzx3/dfRokDoL9kl0Gw8RV4rq+bwlMHO3
 gcHrax58edAskOIAZ8w1htU2ob4dxn/JsJk8KEILOgCR76R/qRcbx+KWYeBi//NxrxAcLdr
 DE6z0BAbX2Rpr952G7bIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5eTQe7G+nUY=;wmYtcm8/52tzcG/9dJGzWfgsDvK
 YCXb1/SPBMVLy/Kk9x4OOJ0RmJc+Ba/qgjUgalwF3EcpW3ORxXXGz+sPRqmKYomXzS/EqZNTs
 7fdi/p8wA7ckj+7dXQdlsMjFr6Pp/Gw+iKOe/PVaJZKwIH5FpdM3eV5ePxQnrBEz7IL+s3dsC
 34waHB2gXgQz797RwFyKisC6dtBbeKlDYOSReDRSRP30Z1mug01rDxyRniMlYAJq+9G69hr1v
 LBpXdNd9mHwN56iduLjrr3YR31Y/vxZ1oXP5NIPXLfbksfhkNNUneQ5bAotKoK0uR2rxB3vdS
 TCzmMZwKh3DqnxbYXBxj3CPY1d8I3rjSZRwH6AJCYJQXihMQNsnobAXIYGNjyyhgXBboA12uu
 80GNxaufLGLNCIdvQMMT4RcUySsMC1fTi2wIp5QRdYC52Lh1XTlA5pPkfwlSX1tuYbpB0YJvB
 BcJw1cWj3A+YwALnoJ+7ta4zRP3OAtupfCU64pK9nrm7NF7FTebKszmcsQ7ywO7QZotpLnc+z
 4/KN+I3FJSilvhyetN3PuBhVNLyL4yvZb6viUQGlxsdqzBt22wy0mIYkVs8sS2hVw5YOtnc2W
 4aTIAbIvqY+IuNX05LI2BMbbTW00tsJA+NUxMCStWB6WoFDN7gANGWbkzBy36bFlaWYILB2bn
 QYmAFWK1GIVdHrQ8xR1ELq++BDeSdhY6SDWxSP6eNMJSiKHzauJ2gtbsl9GFuPZZu4uWjgp7g
 32uLnrSj+T1ryjCPH4NJ4YG1U0Ayhya3p9zMCL9/u7qQJpqSonwIozlQgcYP1P3L/0pueQ41H
 3hZFkTcZ+5gVJDo4VxZleb8A==

On 10/5/24 22:05, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/arm/internals.h      | 3 ++-
>   target/arm/ptw.c            | 2 +-
>   target/arm/tcg/m_helper.c   | 8 ++++----
>   target/arm/tcg/tlb_helper.c | 2 +-
>   4 files changed, 8 insertions(+), 7 deletions(-)


