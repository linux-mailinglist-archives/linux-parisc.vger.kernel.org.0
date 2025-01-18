Return-Path: <linux-parisc+bounces-3233-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2AA15EE9
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jan 2025 22:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08DB318865FE
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jan 2025 21:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5473139CF2;
	Sat, 18 Jan 2025 21:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="NW7xM/SN"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7351F95E;
	Sat, 18 Jan 2025 21:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737235900; cv=none; b=aKv3uxAp9Ft6bgZmUqO+KDHexSJQBJF6hKNXK2UFx1HjVn+YRDhT26amVVQ3dVddGgQ+MWbE1GnqBgWqViLFNMks3dhDVl4MnNSYZQUZdMgw+lxk/rozdyLyEpGeLtgpB23IY0HFHkDNLjyihfR1YKRXr1+IWqBDkEHw03wrffM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737235900; c=relaxed/simple;
	bh=AoRQla70eJcGYrHXvueEFBICy/EKopC8cOWVBukGTxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4BvphrfzafrZUPTaffHBbIUqUxWPlbwPwsfSIsiIWeN4tJkwMvJkfsptSZq1qoeMMXxwsvojnWynWoMMJIUB/5vch/MiJRxuNMCED2RRe4QNfNfDokKpZbqyaaelJciVue/uLeEuETve4UGYxR+jVXs1LRIQb0x4/TtqC7ZzoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=NW7xM/SN; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737235896; x=1737840696; i=deller@gmx.de;
	bh=7CMs+OeYt8TC8Oerj/fG7ypoBLHYZA5UpQ9aC+/A5Gs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NW7xM/SN8gaQlVaH9/2PitqjsVqZyD8LceSQu3Z2flhOctvDa5JXPqmQwN2baUw+
	 NDBW2xzf+rjjEtqq/mTK7Q5Dzh/uqDJ6/F8n/CMu8nwz151M4yzeiLllavdf0OKLm
	 15i/7BJgGiAfCdkE87v8/G4nF89FXdPb6StlCF5B2oJ4aH4NuP2iAtJcHx65KWdOr
	 nQvFHhCKfUttJPVpcbl5aYVhzojMWzNi6Kkgy8wB+RK4XCF/wVRLccoGRg1XO94Zj
	 FHsUCtNTNDASAoejKn+moJg2hbWs0pG/OkOcXSlPyydJcK0oVqEXW6lE1sN/nQTyA
	 aLonzEArxu1lOyHkzA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KUd-1tT9W23SAr-00tx5I; Sat, 18
 Jan 2025 22:31:35 +0100
Message-ID: <fc71c8f8-dd4f-4b84-94a8-cecb16ba5352@gmx.de>
Date: Sat, 18 Jan 2025 22:31:34 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: add vdso linker script to 'targets' instead of
 extra-y
To: Masahiro Yamada <masahiroy@kernel.org>, linux-parisc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
References: <20241221061631.328327-1-masahiroy@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241221061631.328327-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hQ1QlB9GCPJ2FynHK68Mo2bD2jyrRGZRD9QkvsoAgcFEpFNBct6
 PlAWfJQ0MIW+z276H31RP/PIuzPzsHR+97/0fbvGuNOkg2hc+P6G94V+DPIJCFZnTG7wEZc
 xqUbeMJtzIXCd+8bBRqr92Z1se1SxLMFMQdrDirR3bo7dtbLl/6WIOesRtsiFmkefqz6hOS
 Dt7/VR+Rs9a9rujXEZZnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kx6F5d8ZoQ0=;l7DeZBH9bbqpGpzFREFR10OUXaY
 OUd2nrUOww5Yq7uXVBV7ux8YeWSW+qNVsrmpnDxKdiCTKYjKYHzN03272mEBcgsQlC/DDAOe6
 gh+87hZayfNw8IQmelCmlFN/tgLg+vDTDFXkuB8z1OA60hK93pVLThWBYxsCop6D8VqxfQDMk
 wUgJG9vN9C1gK24v3zappkW4N4hF22Dmv2ocV6LSvkCRo4h4zJ3vuub3xNScIrr7qNAUmZ6dj
 gZBba+XiWT8cDm1XVNQ7NA2XZlEdvPMniRnXEB0ZVfxs3YmD5+hR4RVWfcJo754xcpElZmvxG
 6tERbX49V6bYna2xRxnkjIakcaMMWCUGCWg/1ubNqukVyjy1RxIHyKcCepUHFO7TEXIO3gkf7
 Qk1buh/NsV3UKeLGa73y28lxm6gi58enX5zVBm3nMmhks6O4OUrqU5UBivdi47Ug/RjPooKOm
 ssDYaMAVMBz6Q+0j9kGC0z6i+GhDMXALZ221lexTyw1LN8N4+n3LFXQ3mKY+dgKwaT+6cM752
 JW77y77+o3+kdvF3rhJDtu2Y1PcYAyOY3+QVw7zu0+1tPS7R403duLUeVGpSAzWXnpe7XtkdX
 Rn5RU18TG5sFWiNP8fgpbwXdQlXFDmDTJa5W+s1nN++uqQuZ/AuLvt094tIpYBGoxy3kmwDTa
 rnPscDMTzyvNvGRgreYh3fhSIw+o7iJznAJHHsmtpJlbtUR2r/aUJ1nvMZ3SbaV+axXQbS3Zy
 nIypsiB1qoDyRu9slonWSptx1hMKptAmEBRaw4eu8UskUU1jYjtQeePFTSkzGYAW94V6UVH5T
 jh6lOtxJuABGf9edfREI/zHz0baOMa4TKwupaZh1tqZiA5zBTL9a3qwnab1ADZAFy6o9TMGUh
 XmcrJRfrCWomDSHHop/aj5wiahel/kiDA1n/K/1RG7HtWjj5MJ0FAV3f2mFihMV6V+VhiA2xX
 EUr0XzkEiqe4IeFFMRrbwuoP6iVHZ8VdX8ZsQNGBaM0hbIyywfiFKqX36NL9vXz3ixZxgoXRV
 6pmsD58dhNr0qDC4nakSyuHUiHopJdUk3kVTH5wSYoV5cCSnL7h5xaoChBD5NCEB1QTLi/+lF
 yE888NYTEpZwm2giJ08OIyrOzf8GLqkP+ZgmpoDWp6Vp+qOXB+lwDmmF83j90wMONy0soczTD
 +qnVWYMh/hfkq/OxYHJ4egggDLq8ge4xsCjCsbSSKEQ==

On 12/21/24 07:16, Masahiro Yamada wrote:
> The vdso linker script is preprocessed on demand.
> Adding it to 'targets' is enough to include the .cmd file.
>
> This commit applies the previous change to parisc, which added the
> vdso support after commit 887af6d7c99e ("arch: vdso: add vdso linker
> script to 'targets' instead of extra-y").
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Helge Deller <deller@gmx.de>

I've applied this patch to the parisc git tree.
Let me know if you take it yourself...

Helge


> ---
>
>   arch/parisc/kernel/vdso32/Makefile | 2 +-
>   arch/parisc/kernel/vdso64/Makefile | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vds=
o32/Makefile
> index 2b36d25ada6e..288f8b85978f 100644
> --- a/arch/parisc/kernel/vdso32/Makefile
> +++ b/arch/parisc/kernel/vdso32/Makefile
> @@ -33,7 +33,7 @@ KBUILD_CFLAGS +=3D -DBUILD_VDSO -DDISABLE_BRANCH_PROFI=
LING
>   VDSO_LIBGCC :=3D $(shell $(CROSS32CC) -print-libgcc-file-name)
>
>   obj-y +=3D vdso32_wrapper.o
> -extra-y +=3D vdso32.lds
> +targets +=3D vdso32.lds
>   CPPFLAGS_vdso32.lds +=3D -P -C  #  -U$(ARCH)
>
>   $(obj)/vdso32_wrapper.o : $(obj)/vdso32.so FORCE
> diff --git a/arch/parisc/kernel/vdso64/Makefile b/arch/parisc/kernel/vds=
o64/Makefile
> index bd87bd6a6659..bc5d9553f311 100644
> --- a/arch/parisc/kernel/vdso64/Makefile
> +++ b/arch/parisc/kernel/vdso64/Makefile
> @@ -32,7 +32,7 @@ KBUILD_CFLAGS +=3D -DBUILD_VDSO -DDISABLE_BRANCH_PROFI=
LING
>   VDSO_LIBGCC :=3D $(shell $(CC) -print-libgcc-file-name)
>
>   obj-y +=3D vdso64_wrapper.o
> -extra-y +=3D vdso64.lds
> +targets +=3D vdso64.lds
>   CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)
>
>   $(obj)/vdso64_wrapper.o : $(obj)/vdso64.so FORCE


