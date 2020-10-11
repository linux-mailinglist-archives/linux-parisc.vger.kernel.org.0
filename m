Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3179828A743
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Oct 2020 13:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387716AbgJKL4c (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 11 Oct 2020 07:56:32 -0400
Received: from mout.gmx.net ([212.227.17.22]:37877 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387690AbgJKL4a (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 11 Oct 2020 07:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602417379;
        bh=aCwJTasXSGutuCXfxx14Zy/SrMcqLgSB9diEc+V6GHY=;
        h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
        b=cnQLyeCmGzBPu6LwDsO490F7F6q6mx2spo74VuzhuN1jwb6Jm1ji1uUu82ENuyDkg
         otTg9gs4fOCiNMsr1cDoo5YMwCj4lark6V7ZmBBfvC3bVCV+NQop4pCS4deUz7mY6l
         p/Zu+BqEdxcKvA5D5QoQuT1fhq8iYYgyz+1e8oJ0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.189]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNsw4-1kphSV23xI-00OCsh; Sun, 11
 Oct 2020 13:56:19 +0200
Subject: Re: [PATCH] parisc: Add MAP_UNINITIALIZED define
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20201010215431.GA30936@ls3530.fritz.box>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <5ac6cd13-de63-c625-88a6-ba736480f79e@gmx.de>
Date:   Sun, 11 Oct 2020 13:56:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201010215431.GA30936@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Czt+Fq80VoZsHjzmn3nCqLWzpOuOJJOr58d1Q8soN59CBCLxTow
 QFrcDxK71GmVzHvMWOk0T7mVIKV1vp4yGqw2KkCFJDCUrZsuvJDmOWR90Z3bw67DAMwwMOP
 G+ig/BD9LzfDwMOVCWI6iZn3bBC+qMrvg3I4wqQISrU8GN9g5fO5of70b8P5ZkTAe2rQqx2
 C9EpkGw9F4GAcAllBff8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M1sKYCc2T6o=:lPglXA9fCrLbsciCvfFts9
 rKWHl5Yk/4Mh28ddWQaT9ckV48IfmMv5wiKZmiJCRFIGtCGZnkZ4Y99NXN+wHA8nWMr3/kQh/
 LJWso2/Zu6d0M0x3PTDuHWDTor9z5TfDZ5cFNK9cgtxGWx22cszPlu9S4CYAx+/MkA0ENXIZ3
 SyDfg83keBVA1bTOHmAZ4ZPCaDV3b17hKO/QUfhn9jW8b+9z9lwUWppedXE0ozu7oWK6s2UF/
 fMvg8MhVFfqFkLmJqtNFYDQRbOjvDcBYKYMXkZVDlhqITdLw8gzuYUdJIX9UNreO8cohRk8xP
 00wrsPX3TUi+5H7O9/GESIOME9keGH292K1QDPTJP+6T6OV05onEyfw3nJnTzASyQAhL2aCx7
 ztWKQTk9yfdd/V0WD+Iqe2czCOoOrduOHmV9KBBsNZQo4hB5Is0abqrc7/9iT7p/nwHVcw9EN
 Ov7QXmYAjVhPP6VbNukQebEKlZs8ZBjzwKz+5Zo9nzHCnAd9kfmd49CNIiQwViwxhYFMa+bD8
 v59RGXUDw6t/vxY2Q1tGinkF4setJHjJAW8wDDW/jVEJs1sWQ52c9N63Ki3sp1ZHF+MCc95sT
 wiVM77oyXef8hMDhmJW4wGP1EuHHiyU40iEgVnbmX4LVsefRvsiLzwrS/AqIcfN+BjhmaJNio
 yGzIpnzqbRtE0wEfiWL6UW/18TAFfjgVKAxoXyGfTaBTA/S+EQyIrj6mwwvuAtuh73ygZAlrl
 3iFlAvZXY30WU9MXCdnepgeEMMZCxpYf5dd9R3WDOLFd2W/NMGJe765DhBBrgSGgmPoGsEO06
 mjGD//eE4Q0FPaRx/fhAzFlIdvpztliHP7SZ0+pvsqa6I45p1P4PMYw5Q7mOjhcyijMumehJ4
 Jkt5/2TnFkHql5rHIOpNlbFrHESVjMflcM4KBeM01rNtcPC0HpQRRqTH7I4b/ex+n6AA4+G8P
 giYaowSVOSw9zxSADcpznNRjvzKmZXoPRomXoRte0b8qJZW3NI72kAaUsxB5FaqcQO3gqpKwl
 tcp0FbXMVaX03TwAMi6XTcBrf//LK+mdKOdAmbHSOL/2S1BTfUHtPacYf0HReWfv23DnR+Hdm
 2LONAi2lNWA5PCBExckTYA/4RHOgcXmlHi/h0mBJm56XNAPf4/QydFALmk8OezPa3cO2Vb3Ax
 zt20hf87pv4ULxvM1dkZdjqJ9LoR2QsC59R/4OuhWqJ5i4CgH96tF+aix9u7quiDW2mg+V9qm
 OWXSJh7MhTQObfOiF
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/10/20 11:54 PM, Helge Deller wrote:
> Define MAP_UNINITIALIZED and use same value as other architectures.
> Fixes build of debian foot package.

I'm tempted to #define MAP_UNINITIALIZED to zero.
That flag was invented for embedded usage, and becaue of security reasons
we probably will never deliver uninitialized pages to userspace on parisc.
So, defining it as 0 should be fine, as this fixes build errors and won't
have any other (negative) effect.
Thoughts?

Helge


> Suggested-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/u=
api/asm/mman.h
> index 6fd8871e4081..d828b293b6de 100644
> --- a/arch/parisc/include/uapi/asm/mman.h
> +++ b/arch/parisc/include/uapi/asm/mman.h
> @@ -25,6 +25,8 @@
>  #define MAP_STACK	0x40000		/* give out an address that is best suited f=
or process/thread stacks */
>  #define MAP_HUGETLB	0x80000		/* create a huge page mapping */
>  #define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap u=
nderlying mapping */
> +#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could=
 be
> +					 * uninitialized */
>
>  #define MS_SYNC		1		/* synchronous memory sync */
>  #define MS_ASYNC	2		/* sync memory asynchronously */
> diff --git a/tools/arch/parisc/include/uapi/asm/mman.h b/tools/arch/pari=
sc/include/uapi/asm/mman.h
> index f9fd1325f5bd..c7af0f2292fc 100644
> --- a/tools/arch/parisc/include/uapi/asm/mman.h
> +++ b/tools/arch/parisc/include/uapi/asm/mman.h
> @@ -39,6 +39,5 @@
>  #define MADV_SOFT_OFFLINE 101
>  /* MAP_32BIT is undefined on parisc, fix it for perf */
>  #define MAP_32BIT	0
> -/* MAP_UNINITIALIZED is undefined on parisc, fix it for perf */
> -#define MAP_UNINITIALIZED	0
> +#define MAP_UNINITIALIZED 0x4000000
>  #endif
>

