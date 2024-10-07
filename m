Return-Path: <linux-parisc+bounces-2527-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE519938DA
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DDBD1C21191
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263AF184551;
	Mon,  7 Oct 2024 21:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="NCpKrgZ1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E861A175D44
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335784; cv=none; b=BQHSdQTN/dHqemKwuD3oaPW1a92kzdqqdmF8mcLcB/U6m3Nm+r5CY9Y4QTGIiRQNIepvt3Xog6z4/456FbdUTZJHvcXUaZTF9XHbHhn27aX6FsU6QD5Y87Gs5d1d3ZWDRKUyb+HKx3Qiqf5h3E/IGiMmD5eM9sTjNv687UdBz2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335784; c=relaxed/simple;
	bh=T85YfBemxJdK0/e5PLZXGMIDjqZnzI9+8Eee9nJwQ8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBwUSUbMabeSR4kvlO+VnBgfjLy4d4AHgz4L6TvDETl5gkQoErEVM1deg9/0Kiq9IdsSJDc46Qk6yVYRjj1NAoVz6HE8rRgL89xR3kolBbgSF7X55vToQCH2/lhnZE0vYxAycVMnSKN6WLHFsvwi0vgebL64uKPH0IemiuVGupQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=NCpKrgZ1; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335772; x=1728940572; i=deller@gmx.de;
	bh=y7YOKmsDd2Sw+bnZNnqv9bTpXJJSuIu8qmMnvJ+HE10=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NCpKrgZ1hMZlIx8RiFTWozCUXTftmc6F8L0nz/v+xdJa3ruWLNgXnw0xBqB8fgV4
	 Xfexjr+3gSlD7JU7wdiviYec/uDI5wOd1Sqia4RkBvkI5DM75HH+OpnwBB/e/i6/G
	 LoVJhi0ppvq1ogk6UoShEjgxn5hErg10akVlIuU2nNmXlgUIeNoU07N1ApPP/wIVM
	 WLeiT22LKVj+fWsBbONwa6gvurv9c6vAL+MzNNZsfuLk1OwkbyOZ0efzo9pu+uhb/
	 /GUiytCPiIRZ46dn2fdIwoA8d3Pe5k0NglrQSC2pV/U4ylLhWTYlmy/NTR4hMhVjH
	 CKsZjnvcDvaakqaZ4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McY8T-1tYcDJ20J3-00gZGZ; Mon, 07
 Oct 2024 23:16:12 +0200
Message-ID: <05f3367d-1dd4-4b44-a804-7951665d93a6@gmx.de>
Date: Mon, 7 Oct 2024 23:16:11 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] target/hppa: Fix priority of T, D, and B page
 faults
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-11-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DLDA+Fd56ZzGQFtc5i+Js8hT/eAkUNWLho0gh3A9iixw8FIUXIy
 j1abqNTug7msrjYYy3U0ZjUQ64czsQO+N2N9zQH/jFwB5ZPZZsOtj4UqAScQZf1/99FPmNz
 a6y8u4vIx/hZuvsSYcHxHFvBDT43SYwlzJS95VsZ1ZXSFYVgoLAZVGN1EIg87Y8yGTkLydn
 2/AVj6eYeiH6D//kxCAJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1aQxiWF0D2E=;NWKq02qCJghaPaqqWqdIHhZc0OT
 udabMPYtdonRHgHW3MZR2RjevvFEQFMc0lz0JuKSPTqJtir/2zveTMqt0hm1lMVYrxWn1xire
 KCy9AM4XAR/nCwrMOEL+VdeTpBSOAXteQuCiTw50PAMXH5MFVolePRPxb7TSeamrStsuCpLjS
 /LpxH1T6XCt5Q9yhXHB7RbrJpmNmXuXTEPo0UTV+L9xhyB5sYAngQx0DbF0w53qFw7+cWlLK4
 f9zNQfdTfQr2RYSDNUusFcoTBK77edRD2HTGwrjuhuXzV832zNnzD7owzZN2rmgr+zFUlTKWQ
 j+T5prL5wlUpKSbavTk7wHi+OT4Pzq9PXGqRZaXqEr0PF1ibMLjdPXR4w+9ZARvaHEmgz3lkr
 N+XV4slh5uhDrEbGPrtfnmGS1TDkFGE9WTUlaiF6dENyAKZBqKTluSb+Reunt6xphhCVSoHOS
 mH92HSZPELdWm6NR6GuKN1KXq0XHUaMNtGunlLPaqNcfsbGjZ2h94RWL3QwSxJdqHMFqBcXam
 MHTn5anDuLVtdmiRBXQlBGQC6ZxPNMC65G5FeqwoUaxW+MkyW01ZWrv5O+hprRJOf9WiX6HLA
 cNuyeffMYPea25toVNzCJoe1f2BOkt2TK03weVQaHeG//g2f9z7KUQWbTu6x8yZDT6wYuyODO
 PxpN46ZOZU+GrOKCdWVaAzZ8Eb19qKWzY5iVGmJWJ7bIjL/n1hms9/mqk2vIhpTmEA8XpO6st
 rsXHU9qxEeXnSv39OCRdwZol18VZ1MZSdbbucRnO39/CRF+grvelbxRIQ4bz4mehHchl+7Jo4
 FQdqp2EppiBdUuIKMw9Jcwbw==

On 10/5/24 22:05, Richard Henderson wrote:
> Drop the 'else' so that ret is overridden with the
> highest priority fault.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/hppa/mem_helper.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)


