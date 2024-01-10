Return-Path: <linux-parisc+bounces-325-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22548821B61
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jan 2024 13:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21F3F1C20DAE
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jan 2024 12:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C961F9C8;
	Tue,  2 Jan 2024 12:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="bmzU9iWl"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B082BF9C3;
	Tue,  2 Jan 2024 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1704197162; x=1704801962; i=deller@gmx.de;
	bh=uAGHcEkap2SFuefC9cpcqBlQ76TanOfJ8NSrSxq5QxI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=bmzU9iWlY7UBk6eWT6i+iDNGDMdhj8OP5YlNbVMPxWOSaC3Wc4sxOsN0kESMecPu
	 E7jqZyswN9cjr/d3RJqFjKfy9aAt6QylXTIwNkdtI01oKdlJczWXZiVs1PpZks2Ii
	 A5dLVz+jqCcenJQa4FWeodj21kvXS9q/JdTHqfPPMLJj4KPAPftw0cfpiLMBHOUdx
	 +kPiYKXIF3Nn594apPx2bJNi13jRXbPuuXlF0JUs/a4QmeHPRmS8WUa430kj3W7SP
	 djPV7OkHi5ZmxaSopQa8b86sXX//Bm6VRAAc5kRNjpbfOk29xJ7PHlDt1DYb2YWQe
	 vCAwYa/U6stnt/m7BQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.159.184]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5UD-1rPG610Qml-00FG9H; Tue, 02
 Jan 2024 13:06:02 +0100
Message-ID: <dbe21c9c-bbe8-477f-a6fd-97dfb2ce7220@gmx.de>
Date: Tue, 2 Jan 2024 13:06:00 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] video/sticore: Store ROM device in STI struct
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 James.Bottomley@HansenPartnership.com, arnd@arndb.de
Cc: linux-parisc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231220134639.8190-1-tzimmermann@suse.de>
 <20231220134639.8190-2-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231220134639.8190-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nfgny22kzhpakaYBWinm0sF9XrS1iJY7O6t80oGozLzMMqqMRxe
 6FAbvR0pQtvhEnj05eycKWTouSvDnHqMIi4ecNHL1p2TH0DooupuZSxIa6BeupqAtBJDuUP
 XWpM5irayfb/se/xEZ4l+167KbBxHIruI3yLn17KC3mkc/0474R693bE5J8nid/yLztp71s
 p6GOF3AiJLx/diDSRNqiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vCoNzJR5R7s=;dlmE+nuB6QjNOG+jfazPpTKxX61
 2XPeV2oEy7cBOT8BkLCM47xXnO6DYOO6c7fRYBO3z6FnZ1Nm/d9y+nmxq0oWwZ1RiuN24sKCV
 7aWYcI8agM5Dfyca8A8uDYTz6EWoRjnZamWAcQIv6EGPBVf+AsOhUa2zQ+crXAVqEb2+JzirB
 YUhmjJIP3bmQEWFtuX7ZJQIRS8DTLijjjV5Trg+lZDJJvfUmLjJvWKqTQub644IGhmKAGmVZC
 mmFHwiim6RqVBtQ8rEVtLfo7GLIriLNudb6PY0rWYFtWoSWbF6pIe3QIBdP7WHTDEESHPxGfg
 Ph7ucgiQPJ4Itn07qrHlTPG5S85eosDa5Q0panBFrh2DIxB0HLAdvzgLQ4MEPL9UGjokqf6vR
 GSVJcaZDmGaGd7JJoA0alrS6Edc9SkHxcqtedGGhH4qBllEhWsHpKU3ckUuOiGOpVBR4laT98
 yXCWAuJHDfg+KIK10MVq+8bQgd5pnahIaTSgrJea3iWO+g4pCKykm8cRgQ9xv737yUB/i/+bB
 8IbVzg96aJEwlE4rHbaea2atffkhVqdvWUQhHpEBhM6VaqjJGZYN3a2v9XXV3K3IvjQCpwljU
 6N1Mabm/+DrX4zHZtpGWiYGLVy+xyyUebY5czfvVwZrEDNMfd1L7PHcEGER0NYDFuedvgcRd5
 RRaf/nKaDpQ99cp6Fc2oBCpzg4Bm9uKazfOL478cPshW4vOp7xSLLBerGBNZlriY7IHUEV/2N
 8bNhmalVJdG5+WxF+lIvTo5qkur19qznbBqd2irdA8qM8kmPLha7SffIl29XlGCrCjxHqvld4
 bv/Wc2tm/giv2JBhrAPzwF8Tc4we+g6v3DtmnUNdtXj6eyC+Pxq2YknpNhfj1aLB5JDk+hX/G
 HlVIvwZb6dUilr/FYNnGOvnkxwDPr3W+iC6lmtJnMySlcpA4j2XmRaR5zgiK3xE2NnrARxOPZ
 8r6QUqcnkNFknPrRnk6QCLbtkq8=

On 12/20/23 14:22, Thomas Zimmermann wrote:
> Store the ROM's parent device in each STI struct, so we can associate
> the STI framebuffer with a device.
>
> The new field will eventually replace the fbdev subsystem's info field,
> which the function fb_is_primary_device() currently requires to detect
> the firmware's output. By using the device instead of the framebuffer
> info, a later patch can generalize the helper for use in non-fbdev code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/sticore.c | 5 +++++
>   include/video/sticore.h | 4 ++++
>   2 files changed, 9 insertions(+)

Series applied to fbdev git tree.

Thanks!
Helge


