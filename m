Return-Path: <linux-parisc+bounces-2526-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28C9938D7
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 320A61F246CB
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBF0175D44;
	Mon,  7 Oct 2024 21:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="C6B73FGo"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF04184551
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335757; cv=none; b=OcdzXT/p1CSzO2EjvwVndcci29+aPaa4GLhadiXFIT77d82RglTGN+HPlrExvhY+q6Y8hKXe460trK3KN86MHdMrzj9F3AyypBrMwTNebNXPQ4ysbRjLPNXQa9a259b+5fSSmmruy1UMsNB/mZcW26EznQWu8j77aHHushGDvI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335757; c=relaxed/simple;
	bh=FpBBQipXsRarM0ekUpVT4cLqy4vl8SwdE5Jb3JwLNZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bfxolijx46PyayON7P67d6DC7K31qWW7uTxhSuJX0AZ0tF4wgXe9wlfjk/EfVLfhHZLm+F6l/f/ROnS5nvx8tC1fyrK1dEFgIneiIY/D8sZ3xh3pfzLfc88vvNS5jZRMRNs7Zc/jqVIox1d4a6MP2/Ux/xfBilfITqXf/ZjhfM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=C6B73FGo; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335740; x=1728940540; i=deller@gmx.de;
	bh=N/IuYQ6OdLCzl3pWE8NPI5PGV7fJcLaN3Ul1Rcd6Qqw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=C6B73FGoO8T6QLKBW53WlEwp5q0uSIrwHOWkFYFen/K3lcFu6Rfk/sQcACsnW5Mn
	 3R16wgUJWctQLvqpBQbbLpHKDVwsQUwSGk2jENK4NijxMSI5MxVrP5npVezi4xB+c
	 DGaTwVJZS2t11jKqon4xiR11rZY/TM/w6EftVIyyH4ammbugftx8BtdA/wxXEgreH
	 pxhXVFguHISH/l7m4i81D1iOsLVRE4fC4AZZk+z3fwpoZocFPD/AInexSWT5v+gwr
	 onzFP3luqMy8NsVId4YTPGEYELJmpqOkHnC3PXJwq5kjV6ct/07Wl1PHzy5zZQJjJ
	 bMuVBgJwvBc625Ke+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sn1-1u3wcV1V6N-012zOc; Mon, 07
 Oct 2024 23:15:40 +0200
Message-ID: <c4ab226b-b8f3-4a28-b4cf-d630acada5e3@gmx.de>
Date: Mon, 7 Oct 2024 23:15:39 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] target/hppa: Perform access rights before
 protection id check
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-10-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CSycCyFWk0lfJ/gjDV44mLQjyvDU/lgQ7u8UlMqt/5MIBW0yc11
 v60YvtOHCtMofCGpZweGh8BQElw1IseAA24q+mgbNIMJoBxnNnDgteInwM/tJcq8CAsOxrl
 e9I9s1sbosXSR5eN5M95N7rjQQcMmQ/zvsSXyU5La+h8fX8oCLqyb3xPOQa1eL9XU6/4O54
 8HjEBFu60Rlp/RHBKpZsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FABvcphQqcE=;LV/6mo2FmHezyMpq1NjZmlKK2jj
 Q9QKV7UGl6jKDJt/vDteqwF3KUKpxrquBBB3SD0etztNiG069KtvGXCyDo9/LXtzfgKDGkCu4
 OuC5VXB3qxW1dU+1t3nB4THRqIf7RTCNoAUApaNbVhgaoMS7pmuxcv4+5aNOn6da6sESZi7h0
 seOu+mlLetrLouHe5Zs7q30EdGy0y4CkvbgzgsVzCBUSgHXgl9QnKC10duMYqOE1vYMapXhlH
 6bNc7w5lLgCdqNo8OyAWgY5fZpd39psqxH3wYm+RGeAqy5sCKxlgoHTu34I3OKOz5c8nXT+17
 NmkQnq/m3bu3RcVbTnFFyIulXNgHi2l6OnnLyGj0277rOd/Rp5IrWyqD55BXcoMEA5WB2l/UO
 /UbNPo5L+mE88eCgM8fCWM7ZufFfhzcEkRzOeLcX1woLGpJXKc7ChWiiSFVFCApZYiW+bnLqF
 j1FhS0FkX2BvHoeFnrZw/e9Jh2sVHBGRamckyJFK8FooTCxbaQ6SYu04XfGx4PUBq6kq+v6tP
 ccgj+eELL5+yAn2Z/jAXQvHlcZqiu9+j4sIOTXOL5ijoYYp7Y65bc7GhnMvZQvHTPVyZY834n
 r4VZfubbG6++6ZfWt8TJlnvGaWWfAMTGNm3fuIdmc09VCE+61w+nrfSN9euPD+ZXgbonMCfle
 5ck6mpiGYYEUGbxZwGaFg0Gw+abJIlCYNi/dVkuRKRxyjFpPNlyozMWj9GAGeuC2RmlL2lxyb
 dFsBIvKL4LKgHroO8ws+CckGFcY4kLAYvhgWXhdQJTI8qFbppuJSgMIHrLsW7QYvGwPIO6pOC
 t8WLlSGSJ3ABj/pLue7sv57g==

On 10/5/24 22:05, Richard Henderson wrote:
> In Chapter 5, Interruptions, the group 3 exceptions lists
> "Data memory access rights trap" in priority order ahead of
> "Data memory protection ID trap".
>
> Swap these checks in hppa_get_physical_address.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/hppa/mem_helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)


