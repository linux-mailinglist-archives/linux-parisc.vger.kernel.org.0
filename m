Return-Path: <linux-parisc+bounces-2945-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA65D9DEBE7
	for <lists+linux-parisc@lfdr.de>; Fri, 29 Nov 2024 19:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9EA3281810
	for <lists+linux-parisc@lfdr.de>; Fri, 29 Nov 2024 18:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875EC155326;
	Fri, 29 Nov 2024 18:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="qLVvz4DE"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEAD4174A
	for <linux-parisc@vger.kernel.org>; Fri, 29 Nov 2024 18:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732903401; cv=none; b=quUmG+dgZ84QHocioWQTlQoW5THOIbuFeeoePjggyCnv8VdOWi0KMMINzhLHLe4r9LbwTfKwrziK7FaYY/fCMTS9hgWC7IQuK8b8oCQEgXeNcIb6WzHOwiEa52LuFiiUe3r6eKmhqk7/S9TQQbjcjd1aPkRQNhh3ZZw2MOCJESU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732903401; c=relaxed/simple;
	bh=jyDh0R2SznIL2F+ZiWLWRc4MKeKui45BpKNo0xpd7a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVYo0R93aRFYcYqCAFoOxonl21vVXAk8G1CVa+nQvxnJACIj7QnKPK2wbnomrj13e5voJfiuMExoDwcLkfjbo2R/aQB1XYnjBWMB9vumh0mPH0N3JitY4nnstRWafHgo3aSAFc/eOcxMuv3GRCZ2FiO6r7DPTpfkiACrJ/bGZpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=qLVvz4DE; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1732903393; x=1733508193; i=deller@gmx.de;
	bh=jyDh0R2SznIL2F+ZiWLWRc4MKeKui45BpKNo0xpd7a4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qLVvz4DEBAdoG552pclnRmr+RG1mTMxJ+8gnwh/6ihEcuxeXEqt87F9mhpoHzRAd
	 lJf1f2SJnB2wJgK68T75mEKEm7mha+zmZzamJoT9fG5Yx1rXQy5bmXaRjj20fCsWC
	 kaIV5+2KWn0P6D2yF1riLC7PY03bcEENtNYfNIZI3DEKK3eXrXnXDvaU9Fe+s1ZHN
	 NqpdteuQE/bYuFoMZbB+ukgI8S5f3WP6uC3SpRzT2xpVZpeIcfPXe51Nmz5hXKJGf
	 zxrOE6epV/1wDfQekLZmBt3miC7DNjToG5AmPp4r3AM/qQzGKTi5XE16AHb25qow+
	 6rlrpYtKEDl9HmyeUQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdiZ-1tViJo2ZNd-004jf4; Fri, 29
 Nov 2024 19:03:13 +0100
Message-ID: <a5b5e745-30b8-4a1d-b406-fc1d991dc775@gmx.de>
Date: Fri, 29 Nov 2024 19:03:12 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: stage1 compiler sometimes hangs
To: John David Anglin <dave.anglin@bell.net>
Cc: linux-parisc <linux-parisc@vger.kernel.org>
References: <54fbebcc-d4f5-40f3-8711-bac14dcd5397@bell.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <54fbebcc-d4f5-40f3-8711-bac14dcd5397@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:szxNRJTwWMM6ZZGnTXCDgdBJk/rJHwvA4JfkLbimvmrEs029/rB
 Ktx7o9er1s1PEeVw6U9kK55bIOTTYdK9npl1szJjSh2k88H+I59s4OStcsi02UYEQrcJyCe
 czA/44N/Vpw6xLC9CPG0sXZVMq16uAdvshFz7h14YjejgsLKZSbjX8WfaELX2qIRb2qRKnx
 G28S5Jr0X9Gtbt5uofZAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7jIg0I2rqz4=;aQJ3xk1b47bPDreDsnbuWtATk2K
 FcI9+SllASElT6Cty4C3QFB/5+4RSZXUJelI4zEX02J9pgApKhKMlaUeb9iP2o8mznu8Oy8TR
 9PlXrGGddPgSs+dlvL5rnxxAH9I2mlhtA33ULpxmSWVJ0/Bq2MJsjSFHC0AXVX6Ah2UE1c7AV
 d217GjgIwUZnwQZkiCrfnZ8i0+f4R07DleFKxMZyodrMqeykosiNytJrl82FlyS5/4k4e4QHq
 l4IRwxdGi+WAHT4afRlIDWfxJiQcL7gxaDn9DJOijH66C163ULBBmfKF/i1tABZdcZAJueCs0
 TakI0dhsE/NANrEFPpxvf8/Cr1mMjss+EYWn5b7HsQ7LARWppUpd17/0KJggGCM3o3/Fb6Nri
 mACMF8TPYdrw77rPGQddfP3puPolrbtBTYB65mduH94OuabKSNJFx3gp7xAGA/mDlaPIKKc8N
 o7nacxbneImXYvdzTniOQzZzq3ymC0488+14ailmLHC+6ra+YjctZ9a3zZxDymfrq45G9+7gT
 6W5pjdIXXj4TuPpMU/aUYWnsN085ZJLjkKNtWi0tTqpBRa4ls7TZLLoFpLp8CWsrCVR/XHScD
 +Js31hiW+bxyqb1uCyAsaQZ/F0WG/9+4HNG4nNk4/yB0cREEW5QeKoaQZ8lagq6JmOnJCReS5
 Q9U757QpTExtpS2eR2gsbyUHgE5qzUSv4Mybw8MQVRhNmh/XIxRBWspis75MLIWyrj2KL3Vbh
 GgfVuGywweWtjDS02AWcePMuEksv3sexXusQHBawODa88l3EoWljcchq5poVYuiv73PQt3F9A
 pEpb+/TastOO+rndzHY4BqYDsavq/PkFG7pl0eM4rtgSuz7PfZGJb5P59PBR3ZlDk1kkxbKAk
 VsWA2kAcfatb3CYnrIfe/3YNDk0y9itspoXWT1KyNf+Uy9cD8Snqjeanb1aLwrEz+5AlgEoZV
 YFuJMV/FF7x3mtbJjae35jr2+ejeFTqjOOdAojf5cJM/AaqUw5TqIsCC08CJ8etz0xsp6O0nG
 InsVvcCKdfWS33BhK+JKrL9rMpPC4UxPCfClsIPV0IR4RttQrEzOTugaWUUWlLwG5RfYAYopA
 QjrfjJaoRtgPQXVG1g6NnyHNQIgWFS

On 11/29/24 5:52 PM, John David Anglin wrote:
> Hi Helge,

Hi Dave,

> I have done a lot of work on gcc in the past month or so trying to resol=
ve issues with LRA.

Thanks!

> Sometimes cc1plus will hang during bootstrap.=C2=A0 This usually occurs =
fairly soon after the
> stage1 compiler is built.=C2=A0 Sometimes it hangs doing conf tests or b=
uilding libstdc++ for stage2.
>
> top shows hung process running at 100%.
>
> Once a hang occurs, it seems system is more likely to hang again (i.e., =
the gdb trick only
> lasts for a few compiles before another hang occurs).=C2=A0 Maybe hang i=
s more likely after
> system has been running for sometime.
>
> There is no output from strace if it is attached to processor.
>
> If I attach gdb to hung process, I see cc1plus is usually in parser.=C2=
=A0 If I continue process or
> just quit, process runs successfully to completion.
>
> I suspect this problem is somehow related to the size of cc1plus. If I b=
uild stage1 with -O1,
> the problem is reduced or goes away.=C2=A0 I've never seen a hang buildi=
ng stage 1 or with the
> stage2 compiler.
>
> Could this be a swap problem?=C2=A0 Or maybe trace bit gets turned on so=
 process runs really slow?

I doubt that's caused by swap/trace bits.

> Any other thoughts?

Which kernel is affected?

I suspect some issue with kernel timer (and thus scheduler).
You could try reverting this patch: "parisc: Convert to generic clockevent=
s"
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dparisc-6.12-1&id=3Db5ff52be891347f8847872c49d7a5c2fa29400a7

Do you still need to press enter so that systemd continues boot?
Might be related.

I see some 100% hangs with apt-cacher-ng (again) on one of the machines at=
 SAP,
although apt-cacher-ng has my latest patches applied.

Helge

