Return-Path: <linux-parisc+bounces-2543-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFAB99390D
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35673281272
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540831DE4D8;
	Mon,  7 Oct 2024 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="kQKcWWVk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0D41DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336187; cv=none; b=ctey4CU6CvF/YOJfzaabT4U/35zIXDSIYM0hPBhWjBPG3FR7bu9ryyEt8sJez91pca9bAsoUogi/GZ539LlRRIOSQCry2cH1zVmosA+B7VdNCPcOXUBJOJ1ft/FbyRy4KkAu0qn+HCiT9czLGIsmuMP0AZNcwRNn+xT3nEEv9kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336187; c=relaxed/simple;
	bh=8zKbxl6H4cB0NOyx481pXaaKDrG1aOysuAO9fCUgyfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOxIos/eclBHSy0XIuRFqP5w45eMCaOU96sIs8SbQHe6DYBnpCL8ur1538CW+EDpDY2KWAI9dB6RE9M/aijywmIcPNwgrst7onp0alm9g0VgaJDx1slEfYjMyT+FqigmRe/uJVE7jr7RB4ekXq2je5Nvqci5ld9qFsY4M4aztiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=kQKcWWVk; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336176; x=1728940976; i=deller@gmx.de;
	bh=/fK4wLQLQ82E6z6QrtVviBF3/QWhReaRFa6jXt/qI0c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kQKcWWVk8Nui2+rt2obPZTn3kPOuAtMni32VCx0uvH/qahd2iBshvcAUeXfChp0L
	 O6iR8kpnh0rfA5SpnDexMNndW6YwOeAc6PYXTvD7+R8P22Zq9fzFFyTlYM98B530/
	 VdvzCpq3LxmBHSPORvVkTDcAwT5SkbN8BSbByp9k3ERHultN+VuTx+ZOsgsxQaYPX
	 Zompvp+LXTH+GyAsPyz+4Dg/TZESpEPXyFn/ReVXghYNlxoV17DghaTz/nHLp+Brc
	 nTNhSU4AOzCZieRDbL9YruwpGbloEerPOFQGV90Eg254sVK9aWlvhWXzKvH0aE6Pv
	 8vgf4Qev62AAV/2QUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFzx-1t5vvx1kIP-00F03n; Mon, 07
 Oct 2024 23:22:56 +0200
Message-ID: <30c45891-e213-40b8-9426-8043609f8f8b@gmx.de>
Date: Mon, 7 Oct 2024 23:22:55 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] target/arm: Pass MemOp through
 get_phys_addr_twostage
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-18-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IH/3al47xVSBvucgerrxqKvlAAft/aMmsmS7jJnTLwzyMJdk9Ij
 Udvq6s623HYOPmNWuK7wWP9bnmIF7sdVAXERYEa5YDHgkleTFFob8Td0ShxwWnMAslC5rbZ
 HenK6A5bJoWIqRsn5CwoYPZFNMOhjCzI2EckAb8MWiP7NSoZjnLVWYv5r/Sz5rjhR108abm
 kEiCdB2GrziS79XfFlwyw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J5sIsE9dXY8=;4Uub9dJsqbYM9GCzaxZQ0Vfcc2l
 n4euVU6eKsoUf1fe/IBrRKSavq2/ecGRjK7xiLSYC9uW08NDeyqomyAqXBCFBLl2TSnEiNhVQ
 hQ/WZHfAz987HK1UPCN6Ft6WYtjVMQcCD6cOhXk/HuUgIn3Ssn1Fz5LgEGnCCSMwsnMUaBMh2
 dh9f+hKnrmyhojPiZjexM77PWBSG5nejt1Jq6l97tTIGIReh30xKCxuou2Z+0nV1I3CcW46fh
 ybX+iIVzNqpKYvs1Sb0ptgf2DWKo/SyRxs5xT+LRHEkBpYPc059sSxROCvQXJEMIF35L6EvJU
 CfqgxugxMkMLcBrSE9lL75E7NwfH76g9zcrf0AMeTli3qD7HxUsqtoYAwBJdlos/qsu5+jRCp
 kkam92SWLK4iAZwEIAMKV1BXG9MTafAeHsjzMtXyKvTHb5/BviuoJhmeNd4lCdgG75mQrJPA6
 nHTwY3GyYq+VMeCSr0j8ZtYrsLqztbTdLC6q6ezB8k1fEWfUKw965E6YEFXt7t89dP48BbBC1
 OqU3WhFUCFMK/T5+vgOOXlDArB6WmoeiqmKmQaY4GDk7tJJ0q9my6HksLzoS+4Ipb6w8szsYb
 xdyXNDqox5rXaPi6rkWkQM0r51YxsPbNa2icDpsic1xEA/3Dpx/Bd/0S+sApKKC7BAMCVEGl0
 9aYq0XAe36Ss58XiuHVVTe3N/T7d/G6wVLyyGXx/a1X8uUvIjDy8YgAsKDQaF9PoClr0ZQwfk
 Iv8fyAkHP9xUn2Sc8c8iDt3BMPbeqRCBdTLKCRcbi+51W52yIefjItmHYsTN8tm/T68/zmDaU
 FToVyybMKePHPCSIKypNk7CA==

On 10/5/24 22:05, Richard Henderson wrote:
> Pass memop through get_phys_addr_twostage with its
> recursion with get_phys_addr_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/arm/ptw.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)


