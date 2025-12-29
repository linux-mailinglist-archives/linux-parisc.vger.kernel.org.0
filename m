Return-Path: <linux-parisc+bounces-4400-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A834ACE7B80
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Dec 2025 18:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D909330011B3
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Dec 2025 17:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2100C1F0E34;
	Mon, 29 Dec 2025 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="REwE0M4w"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588E1155326
	for <linux-parisc@vger.kernel.org>; Mon, 29 Dec 2025 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767028572; cv=none; b=NNsNaVytOLd4V2CJBB5O83UGioHbL8UpZfxYUq+oY/GDqvcLjXz4TpqH070O+wQCA3PFKdQ9CQJLzb5JTnTiIfumjfpMDrWf2Z03LpzB3m+VrC57Lppc9h/K6/EAaYvVk2YbvPdft1OoXIrBzaPdIR/WYb8IHFdnuXjN/fHgyjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767028572; c=relaxed/simple;
	bh=kKzv2hdSnBfOeoWxaEtGnP0wxHIijccCOHQ8XEobQuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C5bq1B8HXsdCg7haE3eUIIVV8pWAoO+qDYl//Sjexe8T5mXgQN7kLyt9WGs8KqnWiFei3xpqN0hyJPh7KJkpuOuQM7Ehw3aebzNvuyy/DjBTf06h8kF5kFm4NJfpH3SM2x8aVez+I2oQJ9Ia6R2qsssLJw8gYBfKNHYHoNzJwYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=REwE0M4w; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767028567; x=1767633367; i=deller@gmx.de;
	bh=kKzv2hdSnBfOeoWxaEtGnP0wxHIijccCOHQ8XEobQuo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=REwE0M4w7dsgonyz0dwlMjARiWPei2/Ttqmn75pbQCRki26Gh0PC0LKruCKBHbCW
	 KI5kMSSxmb/8Nfy3Sr3672S6qJsJWSKGua/4butBp+AV8QiYgmXmVQQI1QnTQYm3+
	 7TsLGc6Xk9RuhNFA6wvfVYJ/a/54f+7r5x3jt/98cVyNk0CjalvuICS7zHnUKqObC
	 MnI8mUUFNk9HdDteKmc/W2p4vC75PfJ+79aMWoGaC4m8ptI9WvZ60QpZfSvt+P9hW
	 g+MpQYYcnb0pQClAyHdOWWQ3kzZm3Z9SzTHMSphDZy7FRtlXJ+TuZOjSAbRWBedea
	 YyxivvTqSbAjUtS5Wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.44]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfYm-1vlFDa3TS4-00HOso; Mon, 29
 Dec 2025 18:16:06 +0100
Message-ID: <fd189e99-523d-4937-9843-327d10414784@gmx.de>
Date: Mon, 29 Dec 2025 18:16:06 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: HP NGLE documentation
To: Michael <macallan1888@gmail.com>, linux-parisc@vger.kernel.org
References: <20251229060048.141359d4@glenmorangie>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251229060048.141359d4@glenmorangie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/tUA9QHtWZF81JG9IFuwCjCBHLjF/26xw9C3M88gLKB2zRyYqKt
 E38b8+ogOB8Vf3KU6dvLXUbpu14hJ6HL2tOqcQGSrGdU2XeGHcUs29Fs4B9glhzWSHY/ch+
 kOG5bdWtUjuJ9HW7Q8UiSPkNcbXiMIt6nRutRYrQ98fNyl0h3gcOz6F3MRzUGYpgg12EuKA
 c7S1yQ/pbx+TgbdFP9dAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9pe9OnVhhTU=;8BfRyzhSGcbO7n8A5JkBoJdKu/z
 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
 7/S6Q==

Hello Michael,

On 12/29/25 12:06, Michael wrote:
> I finally figured out enough about HCRX and PCI Visualize EG to write
> my own manual. It's a work in progress but I think it's at a point
> where it can be useful. Not exactly for beginners but anyone with some
> experience programming graphics hardware should have no trouble with it.
> For now it's here:
> https://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/doc/
>=20
> and a de-obfuscated header describing the registers lives here:
> https://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/ic/nglereg.h

That's really great!
Thanks for doing this.

Any objections, if I reference your cvs tree and put a copy of the files
in the PARISC Wiki (https://parisc.docs.kernel.org) ?

Helge

