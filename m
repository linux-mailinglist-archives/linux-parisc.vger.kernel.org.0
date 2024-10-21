Return-Path: <linux-parisc+bounces-2810-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EA99A90D5
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Oct 2024 22:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95C6B1F215AE
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Oct 2024 20:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C66A1F4715;
	Mon, 21 Oct 2024 20:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="Wi3SL7Zf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C743D198A17
	for <linux-parisc@vger.kernel.org>; Mon, 21 Oct 2024 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541861; cv=none; b=uWnfjJa7lEJ+6Z3QJJCX34NxcWh+sb/i1fEZISdci3CCP7HYDVLA5qERoTqsMTxsuTNUJJQ5uSe8XOkytiUxvtn+l4DghWOH3HH57b0fzTCqY+ouOXva4SED78rztv47v6ixNRBNm9uT+DI5JObuJ+BfStFr4zwBvWWahp0YsTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541861; c=relaxed/simple;
	bh=IdjCWUntQDFlUPfUqLrWPXMAVy5SxKa3uRug//WUIlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=P8ZjL51PyXHfg1A65odYBcvJ314q71Vh8EoCza1BYCO1+4JT7XnHUYU6dK82w4wirkPM7ZKHyCe+0fbqliSxrl9XCjsw4wf96oS4WeXGGCk9s+ivXFFgUNLZ/uCymZS4k2fEDFvahhJTr8Yr64DJgh5U3RwqRtMO607UE/ISFxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=Wi3SL7Zf; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729541838; x=1730146638; i=deller@gmx.de;
	bh=lAHe/Irt526mbR/mmP72vIuBpI20Qe1TATbHh18rT4U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Wi3SL7ZfLi369fmDQQQQMKfDFTJ4pfNJ+tSCKKy0ZzrLK2WpSXARxl8OXTfEOZgG
	 Uw9gChYe7Lo1rBYxeAOF4r44Pna3GJqVQL4S3KN+wkvr/QRSdHWYZoFEEvKiN5AgY
	 avyYTNvMknJyyD4Hn75Yz//+rGtU7+AAyEG5Ay9Z/LDHqLZZBFlJ0ND7TAAJV5ovu
	 yRaGjK361BSeby5WjNztq3zkdfmtmmgQSqs3+SX4Guc1fP4X+ZsvmKfr9XhgkWJpD
	 5jtYC1c2rpIEbA+SRKWs1I9QSzkh0WHfiyLxo92bFdQTlq969rQ0Dc3XooiH0bHIS
	 ju2MdzEjYs+jXT2r/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIwz4-1tMIuC1Zqk-00KQzW; Mon, 21
 Oct 2024 22:17:18 +0200
Message-ID: <079f3521-a9f8-4070-9e4e-d4e945f79db1@gmx.de>
Date: Mon, 21 Oct 2024 22:17:17 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Migration of parisc.wiki.kernel.org to RTD
To: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
 hppa@gentoo.org
References: <20241011-fine-bold-quail-2d60be@lemur>
Content-Language: en-US
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241011-fine-bold-quail-2d60be@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ngzu+Vqbv4EeCyjvAdaW0nVOVmfl81wxwuSfdJddzfnHsHU4G0U
 dRq5SUQ+P5vqyFIQMvCTaqXSOuMK+PlA+30T+/vHbPSHeUety26RWzD8O7hyIuvUR/fMFGA
 /kPjdzpXrH+zBsgw2Ysl3RZo+fHZhR1d6k8M/wMCCsjo9j5/A/rUKQvFni47H2EbAOlmBrM
 keFxsk+/RfhPAiOSFPTuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4lMGhq7f1Vs=;ezDxqSS3dIEKPO3v7+H+vdotJL5
 nLolmMLJSwRGsiypDF+sk2ZCwJJ4bk1sNeYm1MTLo2YRKebalTmz59G2trXLoQkWF8Yrha3/y
 /FTjtPxgFDJLzP1Dl65cjPxpQi3rSlpepQxeXJ89E0CW9iR2tlpwDoUpaqVdTbAFPZ5P7yCFe
 powvP0SA+R29cczlh6sF00WpHN1HG+QOn8QwZEKuBBKDH+r7R5ZwFc/8YBnZ3E5+lIWmY9Rk4
 KLCqB2ZvIzl7Wzq9rGnA6WL5q/7uT1fi2w/O3MBz7AX2gxUrqCaejE4ARp7oa8uMTtwBsZExu
 9gGfaw1EdbyHH8q4Ih68GR5KGl8Mrb7wMUaxJwhEijRfnB1Sx9q3GntQM4PcTZU+g/0S8Ey7u
 Ow1+xqGcHkp+i7S3vC4XM1lsbgQwWileqjlV9uJw4+lj1CTJoWl2HMjm1X1cDNQ8EjTeMl/ww
 g+XCre4Gaa+DX86Pcm3PhJJdis8kn83C66L/cJlv19LxKtBebOWzXtx+qduHgZQYOfMmx4neP
 /qEtBEnLt4kXDTBKDx3OmM7MbBctG2AOTfq+lH93h2e8M0EnahzMQolq22ZIJsI5N8U+BzJWv
 ICSwg9D7HYDcC7mCkAOzfGTihHFpc4I1HhfkyibhmKEVhJ6F2fgYKUXKQ9+hDlVzfiJ3+zba5
 b8pZ95oNTnj2dIbWosJNJXIHBVxKnGSv2OKQRvZUQdd4paKMaLOXLfYlooRrA/rJw6tZL4kCw
 rvDPR+V5oOPAmvYS3iu67+Al8p1Ih4Gu9/bJxRQC/CZVnn9iNhl/yKAM75+eDx3gQhiiPu7ox
 RPSx0MVDFUrjSIzWU80bYveQ==

Dear PA-RISC Linux users,

On 10/11/24 16:31, Konstantin Ryabitsev wrote:
> We are trying to sunset the last few wikis that we are hosting and conve=
rt
> them all to git-backed sphinx documentation. The PARISC wiki is one of t=
he
> last MediaWikis that we have, and I have prepared a migration path for y=
ou
> [...]

In the meantime, Konstantin and myself moved the
PA-RISC Wiki to become a "ReadTheDocs" static website.

It's now hosted at

	https://parisc.docs.kernel.org

and the source is available at

	https://github.com/hdeller/parisc-website

https://wiki.parisc-linux.org redirects to the new website.

Helge

