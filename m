Return-Path: <linux-parisc+bounces-4632-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG4WCfTprmlRKAIAu9opvQ
	(envelope-from <linux-parisc+bounces-4632-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Mon, 09 Mar 2026 16:40:36 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF2323BE1F
	for <lists+linux-parisc@lfdr.de>; Mon, 09 Mar 2026 16:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 545E9308ADC9
	for <lists+linux-parisc@lfdr.de>; Mon,  9 Mar 2026 15:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF96202C29;
	Mon,  9 Mar 2026 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="yFHqhtVr"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo002.bell.net (mta-tor-008.bell.net [209.71.212.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8519F13F
	for <linux-parisc@vger.kernel.org>; Mon,  9 Mar 2026 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070447; cv=none; b=D0fUWgdD2I8j13oYXt8Bwvf4ZFmophPVrhQ/wxjr/leJnra0Jt+npM1e3TbcLmyat8YdsFzKSaAwywUZKcv3Wl7hqVykM2y4qN+Zg/1rj1fmbvhAg9H2KeFh50sKntPBHMdH7+RghPDlqdDVVfV80TmZnJ8tBPDqYPGNuQSnWRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070447; c=relaxed/simple;
	bh=cwXVUvhspO4qdksh9bbrOe8CkmomQXJOo9ZBj1sztm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQL2rlYmVoULk1X3/YzFarF5yrggV1pTxd3nWhfhTBWo3u++1hXCNyXh5khtGbf2N2LYVkmztzLcSO0OmAmSWW4RUllww1EprKLOtEcB1kUT2fLAU35pKpyerFHNrO2IR6RxM83NETMu0EToqpupg/7sROntDSCfhAtbA6MwadU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=yFHqhtVr; arc=none smtp.client-ip=209.71.212.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1773070445; 
        bh=PT2jzZ8Bi+SEyRqIA+U3KbUzeS3rLSAwp0rNz+RIglA=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=yFHqhtVrYwonFjlmAyDVbI28ExFEVejTgDLrcY37qRS0bcpiSQRLS4lqb4hGCew1ESDbEMiFifCPi1fqIxHfZq4fEv3aPPDACHiBZbi8jSQLjG+CPJKLN3Rk/p4/0k+z4VZt1fdVaP2XFy4MjeJTjajxy8/vI82h4PyGnmguWkTWu1S0rYKYR47kVqZIm0FU49aIdOVrbR4wRXAZ3q/iK7NlVLMH4PfUwLwlYPdJGW8/KyeR1c00iAa529kRYyBzQv71XXhj6GY2Bc1Rzt4iRd2LqI73pKEGJKT9MOSS+SfD29+58x+KLXc83y7iDL2svQsxVHdr+1lThF/GFnKD4w==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 69AED9DE00023485
X-RazorGate-Vade: dmFkZTFNc/XXdgTuqjbG0hf0ZWQ6yte4d0idjal8Feo2RhwiJLeiNgHT1Vh1H80OwyIkwRyMaZE8LGh5mMGFqi4R3K5n/Nf4yqAK1dN+4tFJ0NUGEf+o5/mk+1nSwKTmoqV9xbCbeVRwA5EcmBQ0NDajtjZ9meZ2Pv+4EvObrOyQMZdOQ+MezNEb6WPWsmDcoNHharj8ru5kGgV4Sj4MHIAkY8gCI0BurKmVQvrioH/qva3NDu0XDj4WptexHIp8lKYEw+Miq8pkIAUxdxFBe26JXPQtZVOgX8i2yDqfFcVSwfpJ3k+x3CdutJjigfkai1XasBUKWcM5EyC04Du7ETuCfN0WUtJgDFFir+QPvgRM4T49WEgm/ycdtaCbZyCB7b+ZSN5L1/wCckjv50JWRhYvHX8fV8ApnAX3G9lc0S4vTp1yn2hv3s16ifwXkOdymP6yCfhH+nidGHxVQSi8F5wfpkNaqlYKszDMneeMU0EAmnMw7IspS2VTtX4ctzRgU9d5Qk2WlrRa2ky38WW5oLGrBBC3C0dmJfJjgoXJRCiEV5hf1SkoKTPpvryFah78O2YFy1u8UVriZ3Ew/fjowFezr8NdiKJyOK4gTl/cUIn5CKmAPacb4s/ULQuENzaHiMCenofzsk67Vw4EZIvnIs9ElBQqShHl3HjmszEcIRlksaU6/A
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.112.252.193) by cmx-torrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 69AED9DE00023485; Mon, 9 Mar 2026 11:32:53 -0400
Message-ID: <d2b8a47e-9103-4d79-a0f1-eb1d7ff7421c@bell.net>
Date: Mon, 9 Mar 2026 11:32:53 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Fix cacheflush() syscall to flush correct cache
To: Helge Deller <deller@kernel.org>, linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Felix Lechner <felix.lechner@lease-up.com>
References: <20260309144112.5888-1-deller@kernel.org>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <20260309144112.5888-1-deller@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3FF2323BE1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bell.net,none];
	R_DKIM_ALLOW(-0.20)[bell.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4632-lists,linux-parisc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,lease-up.com];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[bell.net];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.anglin@bell.net,linux-parisc@vger.kernel.org];
	DKIM_TRACE(0.00)[bell.net:+];
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[linux-parisc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gmx.de:email,lease-up.com:email]
X-Rspamd-Action: no action

When generating generating PA 1.x compatible code, the fic instruction needs a 3-bit
s field (i.e., implicit space register selection isn't supported).

Dave

On 2026-03-09 10:41 a.m., Helge Deller wrote:
> From: Helge Deller <deller@gmx.de>
> 
> Somehow the assembly flush instruction was swapped for I- and D-cache flags
> in the cacheflush() syscall:
> SYSCALL_DEFINE3(cacheflush, ...)
> {
> 	if (cache & DCACHE) {
> 			"fic ...\n"
> 	}
> 	if (cache & ICACHE && error == 0) {
> 			"fdc ...\n"
> 	}
> 
> Fix it by using fdc for DCACHE, and fic for ICACHE flushing.
> 
> Noticed-by: Felix Lechner <felix.lechner@lease-up.com>
> Fixes: c6d96328fecd ("parisc: Add cacheflush() syscall")
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/kernel/cache.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 4c5240d3a3c7..b189265785dc 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -953,7 +953,7 @@ SYSCALL_DEFINE3(cacheflush, unsigned long, addr, unsigned long, bytes,
>  #else
>  			"1: cmpb,<<,n	%0,%2,1b\n"
>  #endif
> -			"   fic,m	%3(%4,%0)\n"
> +			"   fdc,m	%3(%4,%0)\n"
>  			"2: sync\n"
>  			ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 2b, "%1")
>  			: "+r" (start), "+r" (error)
> @@ -968,7 +968,7 @@ SYSCALL_DEFINE3(cacheflush, unsigned long, addr, unsigned long, bytes,
>  #else
>  			"1: cmpb,<<,n	%0,%2,1b\n"
>  #endif
> -			"   fdc,m	%3(%4,%0)\n"
> +			"   fic,m	%3(%4,%0)\n"
>  			"2: sync\n"
>  			ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 2b, "%1")
>  			: "+r" (start), "+r" (error)


-- 
John David Anglin  dave.anglin@bell.net

