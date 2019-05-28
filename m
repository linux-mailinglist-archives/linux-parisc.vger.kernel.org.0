Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 421B02BE76
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 07:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfE1FBM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 01:01:12 -0400
Received: from mout.gmx.net ([212.227.15.18]:46247 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfE1FBM (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 01:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1559019664;
        bh=faJqr2G+zkhFSPTsbpVnMhVhsABo7JRF/27vbjeohwA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=J1ZHijq6wPG3cFq1hQupw1iBjq988GgAn1s8MelmK9m1YttLsj07CSI6QN9qV1dRX
         GI0W6SAAFVZtO6aNC5Qk9xiYMiMUd8m+n0atDUaSaMa+5fijJGqtgFfEY4lWZj/hxy
         xWLNarptFcf94zM/Ee76tUA1yMeHuvE5gD+PRb/Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.62]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5eR-1hD02n1Ao9-00J46O; Tue, 28
 May 2019 07:01:04 +0200
Subject: Re: [PATCH] parisc: Use implicit space register selection for loading
 the coherence index of I/O pdirs
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <f267f3ce-9baa-5e2f-1f0a-c08e59a53a7a@bell.net>
From:   Helge Deller <deller@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=deller@gmx.de; keydata=
 xsBNBFDPIPYBCAC6PdtagIE06GASPWQJtfXiIzvpBaaNbAGgmd3Iv7x+3g039EV7/zJ1do/a
 y9jNEDn29j0/jyd0A9zMzWEmNO4JRwkMd5Z0h6APvlm2D8XhI94r/8stwroXOQ8yBpBcP0yX
 +sqRm2UXgoYWL0KEGbL4XwzpDCCapt+kmarND12oFj30M1xhTjuFe0hkhyNHkLe8g6MC0xNg
 KW3x7B74Rk829TTAtj03KP7oA+dqsp5hPlt/hZO0Lr0kSAxf3kxtaNA7+Z0LLiBqZ1nUerBh
 OdiCasCF82vQ4/y8rUaKotXqdhGwD76YZry9AQ9p6ccqKaYEzWis078Wsj7p0UtHoYDbABEB
 AAHNHEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT7CwJIEEwECADwCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEE9M/0wAvkPPtRU6Boh8nBUbUeOGQFAlrHzIICGQEACgkQh8nB
 UbUeOGT1GAgAt+EeoHB4DbAx+pZoGbBYp6ZY8L6211n8fSi7wiwgM5VppucJ+C+wILoPkqiU
 +ZHKlcWRbttER2oBUvKOt0+yDfAGcoZwHS0P+iO3HtxR81h3bosOCwek+TofDXl+TH/WSQJa
 iaitof6iiPZLygzUmmW+aLSSeIAHBunpBetRpFiep1e5zujCglKagsW78Pq0DnzbWugGe26A
 288JcK2W939bT1lZc22D9NhXXRHfX2QdDdrCQY7UsI6g/dAm1d2ldeFlGleqPMdaaQMcv5+E
 vDOur20qjTlenjnR/TFm9tA1zV+K7ePh+JfwKc6BSbELK4EHv8J8WQJjfTphakYLVM7ATQRQ
 zyD2AQgA2SJJapaLvCKdz83MHiTMbyk8yj2AHsuuXdmB30LzEQXjT3JEqj1mpvcEjXrX1B3h
 +0nLUHPI2Q4XWRazrzsseNMGYqfVIhLsK6zT3URPkEAp7R1JxoSiLoh4qOBdJH6AJHex4CWu
 UaSXX5HLqxKl1sq1tO8rq2+hFxY63zbWINvgT0FUEME27Uik9A5t8l9/dmF0CdxKdmrOvGMw
 T770cTt76xUryzM3fAyjtOEVEglkFtVQNM/BN/dnq4jDE5fikLLs8eaJwsWG9k9wQUMtmLpL
 gRXeFPRRK+IT48xuG8rK0g2NOD8aW5ThTkF4apznZe74M7OWr/VbuZbYW443QQARAQABwsBf
 BBgBAgAJBQJQzyD2AhsMAAoJEIfJwVG1HjhkNTgH/idWz2WjLE8DvTi7LvfybzvnXyx6rWUs
 91tXUdCzLuOtjqWVsqBtSaZynfhAjlbqRlrFZQ8i8jRyJY1IwqgvHP6PO9s+rIxKlfFQtqhl
 kR1KUdhNGtiI90sTpi4aeXVsOyG3572KV3dKeFe47ALU6xE5ZL5U2LGhgQkbjr44I3EhPWc/
 lJ/MgLOPkfIUgjRXt0ZcZEN6pAMPU95+u1N52hmqAOQZvyoyUOJFH1siBMAFRbhgWyv+YE2Y
 ZkAyVDL2WxAedQgD/YCCJ+16yXlGYGNAKlvp07SimS6vBEIXk/3h5Vq4Hwgg0Z8+FRGtYZyD
 KrhlU0uMP9QTB5WAUvxvGy8=
Message-ID: <7f0bb17e-79e1-5718-9bcd-d4eaf57c3a77@gmx.de>
Date:   Tue, 28 May 2019 07:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f267f3ce-9baa-5e2f-1f0a-c08e59a53a7a@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lodoGjZC21I1wUgwcmLOHfvY9d5JetAbC85R+dBJDgiheUJZxzI
 poQq3Ua/gU8vwWLpYpwpR344xooCWAmrXBL9tTNHB8C4y5BxhILA1YX2jHYfyDU8kgn1Tvf
 VTlik0ntOWtccHkyaMl/x5G77XnJIZTwt0TjZoKA9jH8MdypPe3/MsvMyrIBtURYQud3xYE
 6nMdbsIua8Uerit2EShtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UQfSv8Ntndk=:K/rdrwIDYCQuEUq2nUEEfn
 L+V+1PGv3vbkQDGdRkSmtKVBL/gSKlysM00jyi3fYXGPP4gpbZopnHl1HfGthRBWJ+LFGCA1K
 N2lMNw8p7ugyh9KhEf3iyC58kEtMhD1OrzR0JnhdziHU9l5HXS8topxhzs3bWLYfAbSZQkjw+
 BQCLrROCF5MIQ2AYpeT9cEFGgnWoje9Eq/dTmzHn4KLsnzazqSSTqlcjWY1FcLfoYF5Wayt7p
 pG9CBFtHLsInrPkoe/CC0ONqpxk82RYxpScIQ+yGIA0+7EM1k91zIViuehDiEXTWSbKTOjOAS
 rKLLF77NS83HUgUArlWpoAVh6S/n/r4pw3lwbnebSgZO7IvE3R10kxxV2GSmtNXHFZqxpAPMZ
 RXHvgi8jGh0rh6C7NT4W65xZ2FcEfuNjgSnKo+FD+JTfyNaVxX0jPAKz0sNSRpdPp9xqw0EP5
 rQRDa1hnHYIiNdNsk3Xu7pv6117e4aoUI3SX7RMchOgVCvAvLTpQ1GdQVvpLwj9v81KZI9UzO
 V2p3OteW7XOFNEQtCaxvHTYMWwH+HyOmZhYAscsIfLjwNBDX+WsIFklE0VqmtKv0UENcaPuoy
 dUgp2i5JUT+3hJjbZlDh1mOR6NBYyeaolFeaBDs1MlVG+ZIttjjt6dEwqE+okJe0c3SSbIv5D
 k1Z3lYMvzNm9fBZchfe+MAjQb5/j+u379vd/NTwkH/CeHq+14EyUN6JGYrcOTvPPElKiggwKv
 78MbT8Wq6tVxpKVajc8RkiAlql06JxYLY6yw1T6xfZkYNqddFN5zqa27FPIN/A5wVYS/VQvOw
 kgxyRM6ETqP9DGrjPnj3vdvLQWxVWqXRHhfuRv3K3CmnVd0TQl7iEHxni0R/lXNxC4e1/nlPG
 LEVqCFz3skOWkFfTnzUT4Y1iqfNE4OwM81C9dyuGxypIUuol5ftFbd6cLhpEsyQPw4LQ7r4IC
 BE5BablFQeTeMgQDwKHzoIVN/HKt0n1KgjAbeISiL84CO0PfOXsep
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 28.05.19 02:15, John David Anglin wrote:
> We only support I/O to kernel space.  Using %sr1 to load the coherence i=
ndex
> may be racy unless interrupts are disabled.  This patch changes the code=
 used
> to load the coherence index to use implicit space register selection.  T=
his saves
> one instruction and eliminates the race.

Fun part is, that I had prepared exactly the same patch two days ago too.
In addition I added this:
+       /* We currently only support kernel addresses, and sr0 is always 0=
. */
+       /* BUG_ON(mfsp(0) !=3D sid); */

and explicitely mentioned "%sr0" to make it clear:
asm volatile ("lci %%r0(%sr0,%1), %0" : "=3Dr" (ci) : "r" (vba));

Anyway, your patch is good. Will apply.

Helge

>
> Tested on rp3440, c8000 and c3750.
>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> ---
>
> diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
> index acba1f56af3e..d7649a70a0c4 100644
> --- a/drivers/parisc/ccio-dma.c
> +++ b/drivers/parisc/ccio-dma.c
> @@ -565,8 +565,6 @@ ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsig=
ned long vba,
>  	/* We currently only support kernel addresses */
>  	BUG_ON(sid !=3D KERNEL_SPACE);
>
> -	mtsp(sid,1);
> -
>  	/*
>  	** WORD 1 - low order word
>  	** "hints" parm includes the VALID bit!
> @@ -597,7 +595,7 @@ ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsig=
ned long vba,
>  	** Grab virtual index [0:11]
>  	** Deposit virt_idx bits into I/O PDIR word
>  	*/
> -	asm volatile ("lci %%r0(%%sr1, %1), %0" : "=3Dr" (ci) : "r" (vba));
> +	asm volatile ("lci %%r0(%1), %0" : "=3Dr" (ci) : "r" (vba));
>  	asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
>  	asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));
>
> diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
> index 0a9c762a70fa..5468490d2298 100644
> --- a/drivers/parisc/sba_iommu.c
> +++ b/drivers/parisc/sba_iommu.c
> @@ -575,8 +575,7 @@ sba_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsign=
ed long vba,
>  	pa =3D virt_to_phys(vba);
>  	pa &=3D IOVP_MASK;
>
> -	mtsp(sid,1);
> -	asm("lci 0(%%sr1, %1), %0" : "=3Dr" (ci) : "r" (vba));
> +	asm("lci 0(%1), %0" : "=3Dr" (ci) : "r" (vba));
>  	pa |=3D (ci >> PAGE_SHIFT) & 0xff;  /* move CI (8 bits) into lowest by=
te */
>
>  	pa |=3D SBA_PDIR_VALID_BIT;	/* set "valid" bit */
>

