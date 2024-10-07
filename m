Return-Path: <linux-parisc+bounces-2540-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88454993907
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 087BFB228FB
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EC61DE4D8;
	Mon,  7 Oct 2024 21:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="YVN2IGgk"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E481DE3D4
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336151; cv=none; b=RrISmZFcG0LqJEkdp7PS6KDOH7p0fY1ON5eteQABtDc3W4ML6US4aF+bQLxEMLrYT4VxYSgIKpdQ0Hn6FRg7SITIa6HKtYc+GoI2VwN3ZkcgONFLJLs+L+krmo4P91c/QrjPBgZ/PKDDHDI3vqzJzj88/kLMt8bpkUHC+N1xJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336151; c=relaxed/simple;
	bh=0HwscXxxwVQn/ZRQnRjswiIn9ja2UOXdWpykM+nKVY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhPfuB9Q6tLnwd3I6KABAqROqBapw8b/HBSob2frjZxeqwOKh3Zhm1BVMlwh+4HjiHTkDdzQ2NWBrdTeA7y6O0hA4ELxSWuN9rgbVHADUk/vFTsoDQsvdOr+6WPZWN0yfaX1vlpQ+5g5JvvS76IDnU5lAo8ybWReTTCWf2RM12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=YVN2IGgk; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336139; x=1728940939; i=deller@gmx.de;
	bh=tIHVxmG19S2cuDGZ8+zG7vlOqIQyzHpg/5tuQKZv624=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YVN2IGgkR4oKLQN37AlbWtO6ZqQmh3JWciSWuIdiecewu1zpPj5sx4myASWIUqac
	 6vt5AOSz5sqUjieLTWRSh7mlesMKYSW7/0/ydgtby9ESzP60zuoS4X3FFdosQdN6r
	 KIJcsZ5lcFAsO+QAEt1Go7OXLSrZKGvU1Nt181IXLpxdzbP97cNwMW17NnH9cwBTb
	 jCMoBV2CyZrNfiRdrGpX38yWX/RJNt5NJ8I/+lyGPkb8TqfgQj7YrI/K2jGdwjno0
	 AfJQ24VbHYEjCE0RmHqpMIlJiSdX1EKsMQZd1IUggGqmxM+alsy+TIrvd2D+BGgd4
	 OAv91zvVWiDUv5+SSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1tTDir20dG-00Qu7A; Mon, 07
 Oct 2024 23:22:19 +0200
Message-ID: <5c141cbe-bc77-471b-8e88-643fef815815@gmx.de>
Date: Mon, 7 Oct 2024 23:22:18 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] target/arm: Pass MemOp to get_phys_addr_nogpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-17-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2nOXmh0BYw5T8sFO7JeJaGsEOH+P9GWsjIhNEA2CG01rl0E1sRb
 jk1Mu5JUGGAopRD4Avqwg5q4yH/aUjnGz2HJLJkVQviNd+rOfNmKRFxuUGRq2I5ohnx74aC
 CwMUVfGmGoImBHJQdot12Ghc7EKcdF5kvICrVwU4/GkCtRYI3Pxfbj0W2qqoEd/0KH4drc6
 h5vGW1KkX57+MxDFy6Wew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SJpKzYIjNRI=;J2kLbUONajuBb/T3k0Q62T1TzXT
 zgGpfmiRKytBJLqHTq5hRfApHqif0bqHXqWKGL72JXC6EF35H+Ixkedo8RGnZdM2LccQvhblw
 Qh3KxyOJaTFI8nBoLJT31PirN9kUzxfSOSWtnpbB3LOtQlZ8e37CbtFbWDb9ueMZZGJ4M1zDF
 ynEAD2j/AyGzSM4V4/t21II62TT5wOm0TE05E2+SGgnWu7mKrry+78TalAsGdYt7tX+cXPiM6
 Di9pYIJhHeuiDf+q3dV0wEh2sveyNQmFpFtyORi/k1WrBK4Tn6x2OPnHOKTj9pvxyr61Rw1Oo
 ioHdTGAzzcnUiey3VqjMXxVMStL8A0kYHcfDbwDGbRw+qg98gHCCkJvmXpe9EiLh0voC2nx4m
 ONya5vAXUELpR6i5xqzY/lJyzwhDc5fVXqaH6aVlNuJInodFa/sSRhhwXvk7cl1pI4uV2jNRD
 J8ZTEslMVX7R18wY1hopIIZvueN2GVNqlMKjrhsrX2g/bCzMsSf4Q8CG317EGVMKymKTZ85ao
 +KfT511F1WO1axuzIEbreW6/yEdJWOLgNghBK3HOrFUrelC6iuKxqFiO3qVTW3NbdlNGk/QBW
 kpCr3IUSzRrAq6D/IJYp46Rg3uZsiJdJx7bERLw9eHUJYbFXZGXbJFNB1gGfF3Q9MF83lA2ZL
 HfyZHD6MbAb9EC+6bDhdROmry5e3LM0YbtQzu5X73xROuUFKd44+BfkdCA/CsQY4DrRNvpg9k
 rAzYatxDUUlgQrqt4XkAnXcjFQuSIPbqs5SXvmGiyEQ6JAPmyjS7OfTuRQEF60qvmLTEd/3QT
 S1fL3NKHIA1BrKJBydvVthgg==

On 10/5/24 22:05, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr_gpc and
> get_phys_addr_with_space_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   target/arm/ptw.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)


