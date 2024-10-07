Return-Path: <linux-parisc+bounces-2538-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37350993905
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6533B22D61
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7731D1DE8A6;
	Mon,  7 Oct 2024 21:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="rGBqX1gu"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4341DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336125; cv=none; b=eTpeHurLpWXy8aoDzEr1obvxEZJq7YWLBDLAsrknoXmIKvdyKE4g22XNYE7MlCdre0npEMOuv6IygPeBvzr50nAKMY0XG4Z1+i+vujhhg+L3plpd4MSlaosO06Qk+mkDsoP4K4O/0/iyh6nhnMF3sSzxyx5zdOQBqEJEiRS6VMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336125; c=relaxed/simple;
	bh=v3o3pCYFetu4GdAEv6KXhchtyt4j0Q0M4sT/Gj8Sw7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GejLa/kbw/Y0pSZ2FzLNgQcRM3LXlckF+bq3u3mm85eNlK3Mt1v163u0kKx+qAtUtO4V9nxJ7uuzT8u1jjIk4tFA13+2d1yWhRe3L241NTuoJYslDyNWjITj0RatiQ1Qm+5LABsRWVSR5l+kVMNX5b9sa/8AQICmF1D0Ef6kRSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=rGBqX1gu; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336113; x=1728940913; i=deller@gmx.de;
	bh=Zb51eK1HZpsRTx4SDwRI+Br4VZKKuygt6kB2EI7yznA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rGBqX1gunmSUTt2zRy6SG2j+HmTXZu/nxbqww2l9UprgnsYb17QOovAjtFzraeVZ
	 UNbpBzekHg2kVXxZ2vARBmmYvXJ02mhLznoTP2NbLxlAHz+8iEHG7WgwxSbN3CUBs
	 YkYeO357x97XjN2OHfxE+/cReiPRsaAV7pTInxvLdOo+tJTk0hr52wKzzKpfESDEQ
	 zuw/s47qzjTKds3e/x3qhYFCrMhIPgDAvdOw13fL2MlxoejmGqp8wQySudEJdo7Rc
	 4BCjRw7TeEe1yw4TCSwRHxVPMI/a3KcKCSM/u1copKRqcesa/1iy7qylzw6Nupljb
	 qPmdxX+0RsqkHDnLvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5G9t-1twneW2c9l-014igU; Mon, 07
 Oct 2024 23:21:53 +0200
Message-ID: <2a3c1e79-8d05-49c3-b40b-a6892767ff0f@gmx.de>
Date: Mon, 7 Oct 2024 23:21:52 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] target/arm: Pass MemOp to get_phys_addr_gpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-16-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c4i/lIZwh2DCMpbfcbsGImE/2StYf0sBzAWoSZ8UjROdOJOP5xV
 jcy9ISEWZJ3qeNwRCw3bD60U/oIHHPxwO5nuRqz2j1tOL9Pia+fxw1OZJ35N0wx06COB+36
 I2PDBzv/kZQAr2DOd+cjn8ZJ5fiepOSA7Jpcb9BzsA94t3/kHeNpBSZ6f1FKjTcFwkve3BG
 yKbB+3+F7h0UNf88AkzYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UA8CiERnig0=;0P9JJy9oXVUSxGHwjBCPMgMaRRN
 tko4a/ski+e3+iLu0F07YZNWAa83NWzhW6qOHQW+y0oOcNY8/5xya62ymuC9r0uBP/hMAlyUl
 MFcYpAEnDVAbIYsarX1eacPbvUuYdFZlwoSFX/2YY7ge9TnsnKxEUx1pTd8fodwUl4XrphHnY
 mjWBB0o7X/uufuW2iSDu0KgBvDFsSwmSfAJIZ7fG1qHrt6D/rTfpsppecuLX77hCmzsU4ZyFB
 loJytn9hh5+MtiT1bIF0eGt3IR7VkyG61QgWQSXReoRiaDmXQ/ienqgkHiXSvLjlZE/Njoeqh
 ozw78/0Ai1nEu/yPCGrrfa8Jembsx1rgNIA7cQmnFj7kld3NcNHMo8EVk+CZCkVyoPyp394Qd
 L7Wiowm+J5Bh+ckzFIGXRuIIUvtKA7H1kOyI9WiT74FEgEe3sEdJNyn41FI/EIZQMlzgZ99Wz
 4LPgURKcX0GF7H0/DGvcqTDjjQFiaLiQ5ccb0e0fo+2E5z4/7OIeBmKh/blL35WFY/TjoZpRs
 ZJ62WfDi5kn83Q2h7eEOxoM0Ctf6TUOqE4JcVaZPvP0W4g58B3d7iLzYnns5BKc2wEfj6nus8
 qB6iYuSfD1+WlHN7ztR937olIlisIhttcbQyeDesoMwBs9RKK/qCU+UUfaQdFr0OXUCKWBumP
 VzyajO1jAREDIqoLw36+LLE7zaknqY2+UrLHmLJXSSEPalCcnH1b3K8GRHnYRp/0/UbCrv5wO
 B+u6O7k/AMkeSQh8xqm729C50mvlJ/M/i7w9zcnonyCFhrjWwMCUzC/ORJkh2XG9z8eudwKFk
 hJezcTbdKuK5rC/2Sw7Nz7Rw==

On 10/5/24 22:05, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/arm/ptw.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)


