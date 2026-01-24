Return-Path: <linux-parisc+bounces-4512-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YyGeIW+FdGlw6gAAu9opvQ
	(envelope-from <linux-parisc+bounces-4512-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Jan 2026 09:40:15 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E305D7D012
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Jan 2026 09:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8DFD3011C4F
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Jan 2026 08:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB63886341;
	Sat, 24 Jan 2026 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="rfTHWIwg"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B625C3EBF3A;
	Sat, 24 Jan 2026 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769244011; cv=none; b=JFppAbGF6qSZQNMNyi+ZcuyWO3S8C7/lq/gwfmt9dUGBrSSE2Cj6UfjNDBhf/ZyZPlVU4tA6wJJ9tGsbMvJojEZUGYLQ/YBFlDN7+wT3pCmrgp6NHbgEStgFgj4GPmr/y0a+p72QWR+cOvBCYiw3qL7cew3g4GwpZxaAyww0mbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769244011; c=relaxed/simple;
	bh=L9yoAi7wk7OSFbEspQ8CXVZ7J5OKKGSu2NFAcF1XqSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PW2sj4bJv1to0Fu5xLurMJl/fdqhP/JWZdxdFHDhomex1045MFuotqoBLqRovKZEVxIzB6QDoCPUhSXQYxPCvc7Gft6acUNGyJ4sW7r2j5vbeCJXO+9QOqj6PCxIevogdQ66m7ExAv6DwRIXJ/hxYRT5SaYQd1dS/7VWPtGw0tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=rfTHWIwg; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769244007; x=1769848807; i=deller@gmx.de;
	bh=L9yoAi7wk7OSFbEspQ8CXVZ7J5OKKGSu2NFAcF1XqSY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rfTHWIwgKCvTqCJDcOmHq96e529rCoOG/Nd/n18Qmn5mtEBNQB/qvuNAIpX0wQic
	 MO4uSMOfyyWzbniFDBgzSiIK0BvMUxILWnaVhSizXsvxx3TNjZI8IYdH0tnWBUDkI
	 r9X/qt8GIKv6qTJdW3MX8I9FsPgfutyIM3f8EIV8nrrFutGb1w3NJwrCTgrYZ8FHJ
	 p0KnSCf6SPbUzUNafTp5maP73/980ZdudxCArbal7Pn2huEB3dv8mJ6VPMaukBdZH
	 XfcAxYa9lOLq+ng4uDQk/MiyZp83ahv0dsaxt7HlYSlnMeH7Gkj2BuOs299+2c/6N
	 wwsOdk64LVdFV0f0VA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.243]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wKq-1vkfeN2t5A-007m7T; Sat, 24
 Jan 2026 09:40:07 +0100
Message-ID: <a1c70066-056f-402f-ab65-ef60eb53fb51@gmx.de>
Date: Sat, 24 Jan 2026 09:40:06 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 1/5] parisc: Remove unused clocksource flags
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-parisc@vger.kernel.org
References: <20260123230651.688818373@kernel.org>
 <20260123231521.655892451@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260123231521.655892451@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DWTBRFL8li+de9FvkT3dPj2N6c61dOO976odxXbSfIuaeJO2oD8
 knLgcDdfdaIU60fpCUPcScQWwi9Nlmvjf6gPgVVxlv6j+jOvwF45K6fA6UgwG7JL0p5Sygk
 dYV7jySRXWJnQW3DQ10P6xlx7wmZq9DQBCS8u+qw7ou4ry/nymQwkjw8uBec0b0uli24i4X
 LaJGrPmsv4DxvbmK639IA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pYW0ehw6TtM=;OuEZ3OhqgfM6V+b4gxEA5TYwymT
 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
 Cq9oOBoYCZDcaUpQ6JClEB854f1zsJWoUhv3zf
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4512-lists,linux-parisc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,linux-parisc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-parisc];
	FREEMAIL_FROM(0.00)[gmx.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gmx.de:dkim,gmx.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Queue-Id: E305D7D012
X-Rspamd-Action: no action

On 1/24/26 00:17, Thomas Gleixner wrote:
> PARISC does not enable the clocksource watchdog, so the VERIFY flags are
> pointless as they are not evaluated. Remove them from the clocksource.
>=20
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-parisc@vger.kernel.org

Acked-by: Helge Deller <deller@gmx.de>

Thanks!
Helge

