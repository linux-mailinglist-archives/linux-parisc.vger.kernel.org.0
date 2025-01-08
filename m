Return-Path: <linux-parisc+bounces-3138-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ED5A0577E
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2025 10:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079903A71D9
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2025 09:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACEC1F7544;
	Wed,  8 Jan 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="LKYR3CmT"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D81F76D8;
	Wed,  8 Jan 2025 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736330149; cv=none; b=ImCObASrOeu+QbwiIVmbJjNeAK6V1KPPVtMch3m/ezTSGnFKi6L5656siuFLKafMLfF3aVMggHQhdM+H/StKvpOOUhIxmeXjwQ+CW3o/FYms1wQ/yR20kPe/AnFnqqntOaTVyKJGlx/xs5bznz6DRWxIfOeMFvOMMIUqKY12Kpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736330149; c=relaxed/simple;
	bh=LOcLJoHuXGeCsqWi41zWQyajyaxK80/wSjjIMZBnptY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F/NAJOXW4chJLKWL82eSnX+LR+2T3e9Ko1qW+0Pw71kW0jIAHrFevnajaL83vnOoFJh+u0ENXpCAJXbUvrL9hsR0d1A3FP+BMIN0b0tQ1dLsqo19+6OpWi1e2YneUrWhu6u3E43cSDc4lnDv/lSrmrN6jyOy9toR6VdEyX0WWzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=LKYR3CmT; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736330107; x=1736934907; i=deller@gmx.de;
	bh=h+FDPMNYxrfjF0i2mQ0uoWU9n5W/BNw1XId/Jy4xp1w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LKYR3CmTAnqKAJfB0F+Ml25i8CNqE6DQqynPEeG2J2j6gZxVXRlDZ4WSDp/r2/jM
	 7b1tcqQjJ0p942+xZWgtH8n0N8Qw3Ie57BoHJZchtLb/7AdsTwGHycNDWHgPsscbU
	 mb8o+KbgkkHg88dtI2RExiVQTYBMUXW0plFt+auVQ8ir2yBMW1BwJ2VY3IFzazJns
	 8wQ03WeH9RLLF99Rz9lTbGCjshrTejn6fKSmGM/a7HrC/vxHkhmAIE5I6OfUTHNOZ
	 1WFekoL7H0D/Yz9oOmYHgIkjlj0ehdgcBKppc9oEVPTfT618sjPutGYcDVjCyaR2h
	 hwHC9ffGJs4Ltn9htQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNJg-1t05yS2wRG-00MHsk; Wed, 08
 Jan 2025 10:55:06 +0100
Message-ID: <6e8ef32e-6698-496e-a9e4-09f0ade5f264@gmx.de>
Date: Wed, 8 Jan 2025 10:55:04 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/28] module: Extend the preempt disabled section in
 dereference_symbol_descriptor().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain
 <mcgrof@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner
 <tglx@linutronix.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250108090457.512198-1-bigeasy@linutronix.de>
 <20250108090457.512198-2-bigeasy@linutronix.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250108090457.512198-2-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NhXedhMSLlZ7ulSfMLkndsPoKhwqFocc8tNYosRsVObc1ugZJFU
 4P/lozizkTV2AndWGOCWRIr4tm8hvnaO6v8sy0/QbHSC+zWUo7IWH2ru+foZTuHQryj6Zqr
 warogruhQdz1S2NOSGHAmpl1qrGvQnbQT5tE2UO/fi1BQmvYnlVlfS21cRarHDYwDpKrjKz
 TnsrEWWNiZegEzyRTEbsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6AZrJ/KbjLU=;ub3kUj1c3dF3BTYf0wjHg+aHhFu
 ebYetpUe1Zpunwk5noPXayYJZcIT7xEEREgQPwehB0sVXuEh3msskx47rCpHotSRgbV6dnFC7
 mYtI/6z2OQEGAza/cNCBJu/xI+/n+oDGMqWtfnxJAKtLTqp+iiQPO494IuScgglISYG6St8ZD
 08yzhM4pA5FZ10ig7nJ4X/cKtWw4hINZ8cnxV1yGk0fSGnrxgY6K6BN/P1ZI15yhq50Fr8YeG
 ymylELXaGCp8o1SWlkpYD6L/BPQcNp1i4inKSsPB/HwyhwuRv+SMPRbKOOy3Ulcqg23LVY+sG
 MueIPzCA25O7pwRF/77EEeDuOqhm5wNKxGYdT4zh41hID9zPEwUl9xmWpkYA5736CUDUBQPUT
 F4KbAWXLtwu+DpCXtwqVpPncaAOULidLsWaB44NzH5vMizK5ZNsyHdDzfqAelD6C6iuI0IJ4X
 DmPzP7GUGNVwAfpd2Q8bmb4D1chJ3k1cljXBcdY/JEKrlH9jbCfNJPfPSDTUjGYfe1E88hArU
 7vM5/xZsEjVcyVR8bykZKyInaRu8HrBAztfMYAHQYmGq6s8E++xK4GLecMDECcBm7EQLlSyGN
 2lhi/2nri/rcbvcNpI2OIHOyej47vWnZMH5xdZ8/1OmZovh2aTrkP6PnoGJxj0DP+p3WpmIyk
 HatAKEMLAcEXGHfK05PGQ8jGUpC+73Anei54Xn0d6k5LX/oix2GeBkMuGpN+3W48K1rws8Chy
 DlFz71wlIXJ3viYbOkgaj8Va/scnIIGZrLaywkQHM9zPaDYkn7ejrA5KxCS02wt3Kcue7PktB
 Ak6DIs8a0tL55AwXD76HB64kbK7CQvS3daBIP+BAn+Hvu5dGm62SljUpGCgN+vwNDIacHbNt+
 Eh6ICY3AVzXLBduDNFPkSrzN7j5oP1yNWm39qYU0T23IT7oIkqXNs82S4vvjHUJsOh8IRdMLJ
 /O4dUP/GjYECPC0ayOEIkPFcXQWoH79ruZw7WFGCJtnyPMODNKkBSbBqiZCgSYv28eXDF+/cM
 1/WGaiXuq5CssOktRjqP2gUyIuR8/WmXhdFAYo4CugGhUE2nsCYj/DJ2VKDuJI5fOic1yo66Z
 SJCRL24LwUJv7Mw86Dx82GrS1TgdaM

On 1/8/25 10:04, Sebastian Andrzej Siewior wrote:
> dereference_symbol_descriptor() needs to obtain the module pointer
> belonging to pointer in order to resolve that pointer.
> The returned mod pointer is obtained under RCU-sched/ preempt_disable()
> guarantees and needs to be used within this section to ensure that the
> module is not removed in the meantime.
>
> Extend the preempt_disable() section to also cover
> dereference_module_function_descriptor().
>
> Fixes: 04b8eb7a4ccd9 ("symbol lookup: introduce dereference_symbol_descr=
iptor()")
> Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Nice catch.

Acked-by: Helge Deller <deller@gmx.de>

This patch really should be backported.
Can you add a Cc: stable tag?

Helge


> ---
>   include/linux/kallsyms.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index c3f075e8f60cb..1c6a6c1704d8d 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -57,10 +57,10 @@ static inline void *dereference_symbol_descriptor(vo=
id *ptr)
>
>   	preempt_disable();
>   	mod =3D __module_address((unsigned long)ptr);
> -	preempt_enable();
>
>   	if (mod)
>   		ptr =3D dereference_module_function_descriptor(mod, ptr);
> +	preempt_enable();
>   #endif
>   	return ptr;
>   }


