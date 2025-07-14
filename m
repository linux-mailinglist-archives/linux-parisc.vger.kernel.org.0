Return-Path: <linux-parisc+bounces-3779-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF1CB0340F
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Jul 2025 03:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309283B2D53
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Jul 2025 01:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C92189F43;
	Mon, 14 Jul 2025 01:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="GS7lfgbV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster2-host7-snip4-2.eps.apple.com [57.103.64.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6418B5464E
	for <linux-parisc@vger.kernel.org>; Mon, 14 Jul 2025 01:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454940; cv=none; b=YCY7G+HytER2bBPB7GomuQKPmbKKIDoI+QwWQREb/ZLb66SOs46D7crulJaFldNVf2kAkF53jzJf7wRTj0XeBbGx8yebqu4oqjoQtBVybkEfzeCaHn/6EZaBLR09xRsRkXbtUyjd3iGU9cDfmaQRgwyeamvTVvopUScKeEuFDmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454940; c=relaxed/simple;
	bh=LAqW6Xz/aenhHrNc03i1d+2r/dZeUUxScJCa+rxwOw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KljSV/PLZ33xlR09UGo1mq4gU0AAI2DLNID6dimNbW/Kr51Rzz1Zc3tuclR3Wa8FBj/gpa/Si1RNXE1U5pr30dYUVlB/yeJjInYH6TjWpiy9/lhul8q6lGPO8n20g0+x0Eh4MpxMwgv4PPpUyn6wGjviB3VD0liIMcAQBCtEwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=GS7lfgbV; arc=none smtp.client-ip=57.103.64.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 18C6418002BB;
	Mon, 14 Jul 2025 01:02:14 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; bh=JSa9SdVcVOj5jZYORBeS6/ykjag1Gc6PWlM78AoxMg8=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=GS7lfgbVyLlhz5jnb6RbTEfKlI+AYXx9gflz9nyyji/5jkad0DkUm4ZHoXRLe6J/w85uGFFG5L6W3ehSMkJoNfXu1Jl8+X45SqHyPlDmvtMjwXTarqe9kCSVN1JePOsmfOFECjs22dd1op0WU2/105ITVX6aGIEd0AdF75tw9xlCVF+V7Sb25DwWYacLvEx16vZ83JXOTYjsIyd39HYUs73p7/FdTvQVdsGux2SoWw1/v0HyO89tjqSbywwvdztOyE2i6L7f7++LbhfCtRjbLEUaug3Gn5DjFTmObPJvz+McHfItSqIQTK0O0/qh8GpA+iDo3feE/x5xu+xYV+mqQg==
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 3E8EF18002AF;
	Mon, 14 Jul 2025 01:02:12 +0000 (UTC)
Message-ID: <8a0bfdc6-5edb-4ca0-b142-067eb94ef57f@icloud.com>
Date: Mon, 14 Jul 2025 09:02:09 +0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] char: misc: Fix kunit test case
 miscdev_test_dynamic_reentry() failure
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 Zijun Hu <zijun.hu@oss.qualcomm.com>
References: <20250710-rfc_miscdev-v5-0-b3940297db16@oss.qualcomm.com>
 <20250710-rfc_miscdev-v5-5-b3940297db16@oss.qualcomm.com>
 <aHADQWaYsjK5EYsN@quatroqueijos.cascardo.eti.br>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <aHADQWaYsjK5EYsN@quatroqueijos.cascardo.eti.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uPq-G_qOM5bY1m-tzO4y1Uosnb98Rir3
X-Proofpoint-GUID: uPq-G_qOM5bY1m-tzO4y1Uosnb98Rir3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX2mhJykUiyQTV
 cxWuzr948aPPgODkxLoXsQqPzIx0pb3ZuN+dyUcfF5NLKBPdREWl0la49y8+0TBfDaNc1MTPZEy
 uB04hvHFdIhh0UkFUKYgoZ9ENlLXnAbgQ+loP4/7QKcOlg6cAbI5iFLyFflSChcMMpi5rrlaSiL
 JqinaOmdEnIgpcmbHYlmeNRU6/H21NaGM5cw36MGASzgK80VUMt5ttriKSTIsx/m70Rfi37MSCm
 zeL5J8DAGPd3OR2bbxi6sCPt7A1AjqWyjxFmGSl+2q8cjCo1FhVxZLp26MqamPRajLBl92PVo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507140002

On 2025/7/11 02:15, Thadeu Lima de Souza Cascardo wrote:
> Adding a failing test and then fixing the code does not seem the best way
> to justify this change. I would rather add the fix with a proper
> justification and then add the test.
>
may need to only correct commit message. the order about unit test and
fix may be right as last reply.

> On the other hand, I have found real cases where this might happen, some by
> code inspection only, but I also managed to reproduce the issue here,
> where:
> 
> 1) wmi/dell-smbios registered minor 122, acpi_thermal_rel registered minor
> 123.
> 2) unbind "int3400 thermal" driver from its device, this will unregister
> acpi_thermal_rel
> 3) remove dell_smbios module
> 4) reinstall dell_smbios module, now wmi/dell-smbios is using misc 123
> 5) bind the device to "int3400 thermal" driver again, acpi_thermal_rel
> fails to register
> 

above issue should not happen with current char-misc tree since fixed
minor have no such reentry issue:

for any fixed minor fixed_A in range [0, 255): ".minor = fixed_A" ->
registered -> ".minor = fixed_A" -> de-registered -> ".minor = fixed_A"
, namely, for fixed minor, it is always un-changed about registering
and de-registering.


> I think we have a few options to fix these bugs:
> 
> 1) Apply your suggested fix.
> 2) Fix all the buggy drivers.
> 3) Change API and have the minor be a misc_register parameter.
> 
> The advantage of your option is that it is simple and contained and easy to
> backport.
> 
> Changing API would require changing a lot of code and hard to backport, but
> I find it less error-prone than requiring the minor member to be reset, if
> we end up deciding about fixing the drivers.
> 
> As for fixing individual drivers, one helpful feature is applying your
> previous patch [1], but perhaps with stronger message, maybe a WARN_ON.
> 
> [1] char: misc: Disallow registering miscdevice whose minor > MISC_DYNAMIC_MINOR
> 
> I am leaning towards your suggested fix, but with different wording, and
> before adding the test case.
> 
> Something like:
> 
> Some drivers may reuse the miscdevice structure after they are
> deregistered. If the intention is to allocate a dynamic minor, if the minor
> number is not reset to MISC_DYNAMIC_MINOR before calling misc_register, it
> will try to register a previously dynamically allocated minor number, which
> may have been registered by a different driver.
> 

let me correct commit message based on this suggestions.
thank you.

> One such case is the acpi_thermal_rel misc device, registered by the
> int3400 thermal driver. If the device is unbound from the driver and later
> bound, if there was another dynamic misc device registered in between, it
> would fail to register the acpi_thermal_rel misc device. Other drivers
> behave similarly.
> 
> Instead of fixing all the drivers, just reset the minor member to
> MISC_DYNAMIC_MINOR when calling misc_deregister in case it was a
> dynamically allocated minor number.


