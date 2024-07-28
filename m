Return-Path: <linux-parisc+bounces-1861-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096C93E588
	for <lists+linux-parisc@lfdr.de>; Sun, 28 Jul 2024 15:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09CF22817AA
	for <lists+linux-parisc@lfdr.de>; Sun, 28 Jul 2024 13:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21AF3A1BF;
	Sun, 28 Jul 2024 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="XOVPS6Lf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9D71A28D
	for <linux-parisc@vger.kernel.org>; Sun, 28 Jul 2024 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722173178; cv=none; b=kxthwSTepE8vVi1djJM3jvpj9pjwXvfNiDDpGiz8PWDdv2lMViNaSejwhkVPvXDXJvNXAy2qjK9A5J/GlJP08YVDHshdHNC1n/XnaF1W5eFh5P2kRs2Swt2819yGKDOy3oeAsbI3QnIHcOO1nMkRblH2pArkYwbgYjEBa+ifnnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722173178; c=relaxed/simple;
	bh=i7OBWf8F4iHzaNfiN+FawibrpYkQmw6WUT1ohhTqpck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ezh/PNWjSTml0zJxYcyB9kyxyPDNfp/+Ut51li8FDrAQbougQi0PGDBe8im/KO5qyI3txUg2LujW5p7miKl1yuKt03+ekuhPVo50PG+hSP+SP7yEGywTSDQtIc3Se+n5GA7vzqeknGEiQmhMHrukxx7B/E+HkZN9bt8hjDO1C3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=XOVPS6Lf; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1722173168; x=1722777968; i=deller@gmx.de;
	bh=x7lg0ixPH3y9jYobLTk9qYN1Cjawop8pu7g+g8gQ85Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XOVPS6LfUTIKAMp3EnjJ+UZAIKLN1voIXsRlyIkV1kYxiXlgH9n/e5uOwTqHrY93
	 i5JPtfnRLzaZ/9sPxDEz7PMBpzVKcP9ceTQVwzRaERNg4Bk7SuEAYU0B+4tPm+UGD
	 P7qAIHsY/AOpNID4/E0Bwn+eA/xQuS3eBB+gyxsW1UH+17bQGHLu598xSvi32eZs7
	 NUl9xOS2N2dO/jatGI+EHUcyyF/PGL8iY+vJ19eoZJOPTj4eeOdCxPqLH6jDSidFI
	 XuYGtkxEugkrkD68qexrV4+BwlDWT0u0nXtPUmDDtA8PjQp3XuOnDeCwd9oShYKbp
	 QcX3gGa1rv9se1jSfA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.33]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzay-1sgH5Z3MPK-00KvQx; Sun, 28
 Jul 2024 15:26:07 +0200
Message-ID: <14682bd6-0cb6-419b-998b-fcb8a54e7c1d@gmx.de>
Date: Sun, 28 Jul 2024 15:26:07 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: fix unaligned accesses in BPF
To: Mikulas Patocka <mpatocka@redhat.com>,
 John David Anglin <dave.anglin@bell.net>,
 John David Anglin <dave@parisc-linux.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org
References: <1e96c3f-d45c-b128-907b-ca2fba5f6a2d@redhat.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <1e96c3f-d45c-b128-907b-ca2fba5f6a2d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P1FapXjTahVExIdPQMaNdWQrB7hXcogi5q2LH2UXO5UFVzX7nDJ
 Wt9LgQSZ4s9+MU38gBPhyz/cS4qCER01NzDu4nTfiTUWnb5NV6GVtsYLwti+9AngYDw/vmb
 mARi9EF1IKHm3RN+3y/5dCWoauMBhSL98BJwTq5RjEt/M9Nhf0PJ+6lp6eSffGKVVfqmo5k
 SD35vpVNv7kKaLQ8R00sQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tl715ew64W8=;N4IaZnAGvefND/mUT1A5UfODoKZ
 6oOt97Pwu4VxhSbTVIVZvYyKK5VHlEZT+Zr/XwQCIAkBwLalsTXpLjWYNdOe+viVibSEqTYRn
 v5UWoQCGBPDQBm/YqBrGorvP7qPRi/1omtjpqJ8w1n+402LIqWUQSCqRuQ5Ufh0yQy1nNNlIK
 PzSwvp650cTGl+y7KjHMlHS6QluFRZeEdNvNgc9CCnsIs+gyVtlyj/ny2tUtsFIRfy/aXBSM8
 3FRV1a7i4RwhXs0lAwazWX+v1rcJR7YErHQv3RJgTbOFFpRMzsjMy+r7MKU+PEQanvBmDNo5c
 0mhJyuQ/vX9dr4/WLjJTELrPtWKN2pWHjkgnW2orcd79r8xkoEqC6khIMTMsGcGr1zJKVqvQq
 3X8zqgA0vkaoO9cLpPBi7Diy9p1P2HshHmAZohvi6jEHpUQQtJRXBpozPHaRVWyIb+uNB2q+P
 /nVPWO6G5E0R9mKhKx/qEGeP4i9yL/LOLYoIvSxyl9bbjOl3kfv+MV1MctZKySyZP6YF3wPRK
 PKZNh7XL4Nxr+kKhzzMHVe3ak1JXPUQ6oLSr1KuiDIelHHFd3BUe3+FxTLV720/Z1ppNv3gC/
 qxkslIMq5caAlSjEt4+F8/k220PHwyy2VB1sNS8Rw+rmHJlLB3NHCCtloYZUasXmaEkU4dfmD
 cwAjzMryo0NgpAESj5p72DM/GG5iRXbDPb26UgWvFACLUdqx5JzdeLgzS2g63M4UfmtMMt7LU
 D8lr/Ulh/Ma9rFEv9Zh34xZt7NRT4ulibJYTByLHozURNaHzWH8GMXVSXP4WNKPgLTfJf4Ovr
 sfIn2w53hqwulA7fJIJ12aZg==

On 7/27/24 12:11, Mikulas Patocka wrote:
> There were spurious unaligned access warnings when calling BPF code.
> Sometimes, the warnings were triggered with any incoming packet, making
> the machine hard to use.
>
> The reason for the warnings is this: on parisc64, pointers to functions
> are not really pointers to functions, they are pointers to 16-byte
> descriptor. The first 8 bytes of the descriptor is a pointer to the
> function and the next 8 bytes of the descriptor is the content of the
> "dp" register. This descriptor is generated in the function
> bpf_jit_build_prologue.
>
> The problem is that the function bpf_int_jit_compile advertises 4-byte
> alignment when calling bpf_jit_binary_alloc, bpf_jit_binary_alloc
> randomizes the returned array and if the array happens to be not aligned
> on 8-byte boundary, the descriptor generated in bpf_jit_build_prologue i=
s
> also not aligned and this triggers the unaligned access warning.
>
> Fix this by advertising 8-byte alignment on parisc64 when calling
> bpf_jit_binary_alloc.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org

Nice catch!
Applied.

Thanks!
Helge

>
> ---
>   arch/parisc/net/bpf_jit_core.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Index: linux-6.10/arch/parisc/net/bpf_jit_core.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-6.10.orig/arch/parisc/net/bpf_jit_core.c	2024-07-23 20:35:34.0=
00000000 +0200
> +++ linux-6.10/arch/parisc/net/bpf_jit_core.c	2024-07-27 11:40:17.000000=
000 +0200
> @@ -114,7 +114,7 @@ struct bpf_prog *bpf_int_jit_compile(str
>   			jit_data->header =3D
>   				bpf_jit_binary_alloc(prog_size + extable_size,
>   						     &jit_data->image,
> -						     sizeof(u32),
> +						     sizeof(long),
>   						     bpf_fill_ill_insns);
>   			if (!jit_data->header) {
>   				prog =3D orig_prog;
>


