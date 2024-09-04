Return-Path: <linux-parisc+bounces-2239-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673696C482
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Sep 2024 18:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C210C285D95
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Sep 2024 16:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3EF1E0B83;
	Wed,  4 Sep 2024 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="Qs0/jwNM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76BE4778C
	for <linux-parisc@vger.kernel.org>; Wed,  4 Sep 2024 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725469082; cv=none; b=QEYfIAW7HrojEYndmtvgpaJA/pwuNkgX2DCHi91GXXXHlf49KLDubshmlnj/1QTCidLgAFnWjcjtx4LlZPLQphNGihc0nT9wSQwz+3fPYAhejZ+4Jtq0HQCleuMVdQ0ks/HwCKfoGYiMzl4qxCDjP6R6YQfc+5/iLPto0Ai701k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725469082; c=relaxed/simple;
	bh=NQCTMrOQod/JEVQIlh84Y7v3le+/zBwq4V+lth8NpMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Px5sCDQTVmaEn1SCJBBNob1E6E4++Y0/J6RCSKM0YDwPkmogUYtWN6HvCeMAYdgtzUONQg3q4djXqlWNKNoRgD0J0UXkb+v/dx3wAmO7jKIjLJ7h6mWpm47lNxCKCyMAHlcltcxTk3WXF5m45/U2axZF7g/cF/8u3450CIKacvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=Qs0/jwNM; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1725469058; x=1726073858; i=deller@gmx.de;
	bh=NQCTMrOQod/JEVQIlh84Y7v3le+/zBwq4V+lth8NpMM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Qs0/jwNMr3XMJtQNF4aFlfsTV43LtNfu7lfK4dygOMQx7gbUVHlmMZx8NBX4AChi
	 Yu5Oa8eMDRmAI00moAxWTSmNyioX6+s73dI6tVhXtfJHTFYX6Okm2SutM46j+SrNH
	 yr++MhJRTvTIp5v9IzbJDkTPaD/nJo5x3TaiA0XkqdI23e1xkjSpqM9FNvHH39Tvb
	 Spz3ld4iq1E6c8jCOCZd5B9CMy3cjBsVWobCpr8BAaPbys2mFHLtuwU+nQcNt4qlw
	 dQS8lNomHPmu4REFocyElk4jBfzwXWiJ7MOoq3xftdbuXs9PW3BoAmTlq3SywvD3c
	 76cwYEGDropESSmJRQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0G1d-1rsXUD0Jpn-012s3F; Wed, 04
 Sep 2024 18:57:38 +0200
Message-ID: <8e9b0c2d-3e06-4c35-83c1-f6e4473baee5@gmx.de>
Date: Wed, 4 Sep 2024 18:57:37 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] parisc: pdc_stable: Constify struct kobj_type
To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-parisc@vger.kernel.org
References: <20240904011642.2010258-1-lihongbo22@huawei.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240904011642.2010258-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+E8DszZdktU5AbaCIP+mLMUVL5Pz84OdDwpbh7Ay8XTqe35OwIQ
 ObK9l+c9PxYvxzIU7auLKV1LMKbHH5B9jQJvZkGJn6aDoowaWTWdWhF3dg+rNI/Dum9Nr4A
 dg1evszQRiJdl1bjdqvUJQNoeuIdVQgRJ7NscQmZM3HrDVT892Zf4GKRwqG4OYBpSnxt33b
 1xHrvxNOBatlnXLa1weTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KOxxy8cmAYE=;amsgasjts93jDGg14MPgH2Hzc8I
 mxkSnP3ZR/7IBqNZH4mgJdrCJj6S3RMD/FKdANNGOQ43rHnquZhg8cgCEoCfIDEhMwGM13gRQ
 vNCaHN9p2A6DQ2vbRDVg/bHT024d6nhbLQ9h7PYY01Y1Y5Z/ul19UYyXUhywlaEoCXrMX2Jrf
 S5EWLSot+5+joVkZCIiIR22c5jTXdW3z9/kqjqSGn5YRZumEp2ji/F2/tF6Hs/e0+7XL5H7MO
 QAuUNbHI8PiZxgax9uaRV3dUxptnOnDo3c2Ag8GsDfSwT3hQRE3drhNhFU4hULc8bCRRyoVWB
 Ju3yY7QnGv5P1bcMbFkEZNrMz+YfIi4KP8/Kn+SBY+kmrWj1Iu/iBvE6SX28jRHJSh2uPuyAN
 rFcU9qzAq6cg3uZmvaixslJyfgrOORfTAmeah+gNVQ3uDXMhSTAaXJ9KA0EdNL4QfXY09VDKT
 cOH3FN4QfQeBcfbCWW7NqZXeqQVCfeKVwuqzicfNlDn8vxkdIbf6UiV7c2IjIKvgL589X2le7
 pI0Ic7M2ciLAtVovDKXsMBj+iGcT3tn0qFLSBnNHlvtRgk51lrpwJa43XDnmj17vNP9kSNIoi
 yolIwXVENopAA7+BKEs15anmA5gkXYhk71BP9g3Gl2e4aGdrRD/gdahhUFpXppQnGm5CijftU
 La0Tn0Ytywx7L0nGCj35rfQtyZVNvB7zOT4rOuqg0Vftlxk47hDTv5VmB5C/z9gp9oS6HCBQ8
 jnxOl0IsIftHBsy0AiHBbJtudjD6sHQ6pCxMUZxRHAoqW1qXwJ7J3LH/0AbU2I4OCKaB0p/6Z
 z5W7p8A4OzvP51azV/L6TznQ==

On 9/4/24 03:16, Hongbo Li wrote:
> This 'struct kobj_type' is not modified. It is only used in
> kobject_init_and_add() which takes a 'const struct kobj_type *ktype'
> parameter.
>
> Constifying this structure and moving it to a read-only section,
> and can increase over all security.
>
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

applied.

Thanks!
Helge


