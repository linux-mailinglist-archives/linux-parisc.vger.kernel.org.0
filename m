Return-Path: <linux-parisc+bounces-2521-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D39938BA
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD54F1F2219F
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E29D18B49F;
	Mon,  7 Oct 2024 21:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="rWKS/SlA"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99AB189BBD
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335034; cv=none; b=eLD5xOZRJQ+CxjBG9lFLyZl0WzzYHC35Dg5GSCWOjpYUakDK12D8jt1iaFqW/44ZmaU3wassb0X4LITpHMruZLuAdWxE2Y0mwgHBcLpDp26oB2eqkv6NeqADxQSHM6JP4fc1ZW8sRtNzfAGuuqeKW2LFEnxl68TfbDYW8H7LZ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335034; c=relaxed/simple;
	bh=6ZqKvKVgcgb4yCnSw5MJDXE+xn1F/VJI6RE+ZDbXkKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PW5wp1Q9eguZ/Q1HlvI4E1/bT/9aJDJniIJvu+r4+wEpa9ZCMdhiY0IfP+p5vnxHfIXVZIIwSfmhgRyCSfpRIoqXJVMJ/cXHXX9KkRWBDMqW/rXeJgKmUWkdP+nFTFWbVDGb+OlrcAbNoERoOfNG3I+iRC47EFnpH/ZLm3/vIkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=rWKS/SlA; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335018; x=1728939818; i=deller@gmx.de;
	bh=zeag8zsSiy0vNgNC1UzYWjr/V8m5BRLCuGswN8A9LdI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rWKS/SlAiTjA2EnMwa4d8DvrrW+wT0JNNklto6rHzylxPe35LS2VM4ScJsQ2tEbn
	 pMjIS0DtWfJBodZeO5WDJVncl/ME38tShVb2pjWaC6wt9B/MCntlmAWLxMkCF/QZJ
	 S1IJIKA+XestxhrKqv5lVt3ig0Zcz636h4+ockMW80OpV/uy+Yk5L5d3b14lJ6UZn
	 XIQSpdrT+CBQlC3NteWxBTAU+syeVzwuRc2BABZalD65+ZiTkBPZvkdcQoZW1cvnq
	 0n4dod5YyNVKW8d0d0q1Ezh9/ChXcfs7sWMdh73/24TtSrlWJgq4OgeXyYRyCwGKL
	 RvyHpHhyiZQHbdRZlg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEUz4-1tDuW82ZmU-00BRD4; Mon, 07
 Oct 2024 23:03:38 +0200
Message-ID: <c71c8234-da23-4dee-b356-f91098c4797d@gmx.de>
Date: Mon, 7 Oct 2024 23:03:37 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/21] include/exec/memop: Rename get_alignment_bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-5-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uGA6s4/DJkguxWiolsLv3MJyY+yba700uvgBHakOdjkug+/u5jE
 ZAsGU4WQheATM5KIhJQCMq3Vrq1Hl1zRF5zv+kLzop5ZQULILLF0v3/KSRsJMNJPmxf30O8
 qTlFXTqYtgVbCEw7sHN+OLn/mX3P2GqRCk68ytf0EtKoCBLsDYB/rygyLsfQ23iliIr33na
 e3Pjlo44NerYFTJsEhOEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0MFCzOQkQrI=;bUCl29W2Q1TG9ei+52rcDrFsvZU
 3UAjtBaJZULaCWnDwtK1t5Ww9YeyVvQOLdM0kTzGzwIygMQS6YB/cCv14qM/6O8U5J9HAvlwt
 ffhoQvxgQTXlLGwa4buKNEwZ1zDzv2obD18RxGKqpnEi+ncjoXF3MS7z0I96DCPWfEGyoi2ld
 4Ha23xzbRvoHL5I3xt8jmFv5ZmMqUM5EaWsF1Yg7uKYOu86XBHDiy4XbSNNOBUtAcdB7nSBCa
 1J38VP+o2rVisU26kW2akG0DkTHvz1JV+Jsst5qbbH7tzurvgt7OL5rjkdyezydV3b/Xlm1O8
 NpXWeAAeewoXaxzLeLdYXb10e0gtBgYt3AXvs6DILMkEWNqSzP7InnOp2XSICqWp8X03Y2IZD
 9lJfDGuxYYaABDE59sGQLyP75LqSHBvklvLCGvl9QfnMKXbQ49Rrtm4SFMkO9VFrmuhzWCVrK
 7+gLqXwktuBhPzXrc3SNys6VhikG2kUP+P0OkHAfQ8LIbr9w5Uohf9K7nuSdn20KsVaNPnbBc
 ngkhO9FmPX/4uuE8W1bg+70Eycb3zGGBoECVxZQQEnlGiFy3mtMTYfk1q2vuVM5GeWMUhOAFH
 KTvemjH05UdHVyg5Dho/GV/MBiMXVCj+X7xDgGuzi1UwQwbMDg7MnAwm9dwYm1BhN15aqz/qk
 2ZmwHBf40aCOdJDhhtBKPDPf3VPQzHSliZGeju/gRiwjpphUAboGEE0ay+DA5r4+epz1sqWux
 wsXDPFBSp82oUrDxbh0M+zYtClxNVaTSGVfS+uDH9S5X5OA4nU4jAYQSB2eqdEdPnaMvisEoY
 T9Y/0rAbzp1TUjid87Be3Azw==

On 10/5/24 22:05, Richard Henderson wrote:
> Rename to use "memop_" prefix, like other functions
> that operate on MemOp.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   include/exec/memop.h           | 4 ++--
>   accel/tcg/cputlb.c             | 4 ++--
>   accel/tcg/user-exec.c          | 4 ++--
>   target/arm/tcg/translate-a64.c | 4 ++--
>   target/xtensa/translate.c      | 2 +-
>   tcg/tcg-op-ldst.c              | 6 +++---
>   tcg/tcg.c                      | 2 +-
>   tcg/arm/tcg-target.c.inc       | 4 ++--
>   tcg/sparc64/tcg-target.c.inc   | 2 +-
>   9 files changed, 16 insertions(+), 16 deletions(-)
>


