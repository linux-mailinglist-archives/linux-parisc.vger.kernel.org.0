Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21015CBA8F
	for <lists+linux-parisc@lfdr.de>; Fri,  4 Oct 2019 14:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbfJDMgt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 4 Oct 2019 08:36:49 -0400
Received: from mout.gmx.net ([212.227.15.19]:45813 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729034AbfJDMgt (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 4 Oct 2019 08:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570192603;
        bh=b+xIlAFi8B1f7D0qW3qrfQhYBaLPcacWimJimAlFJmE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=fGYCghw+Sk5jQkWqoyM9hbekCDIEY4q8ygHFTssJ644oHjsbGeRPnrmVLZDqF42Gn
         +a0OgIIFsnBLmaUeRy3RIdRgTe4mcyIqVpiqNMRfUYFNDmtdshQViTzuMDxxVDDKGW
         lr77/biIW42iG3xYbNVc9+Sx1OG8JnTpN8oBqJg0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.137.238]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel3n-1hfvby1Obt-00amhk; Fri, 04
 Oct 2019 14:36:43 +0200
Subject: Re: some progress with radeon on C8000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>, linux-parisc@vger.kernel.org
References: <20190928214436.GC18685@stackframe.org>
 <20191002141907.GA8897@alpha.franken.de>
 <c9ef7686-96fc-e4ed-33d2-ebee7fb4aeed@bell.net>
 <20191004120632.GA7472@alpha.franken.de>
From:   Helge Deller <deller@gmx.de>
Message-ID: <2a3a3491-7437-7969-29bb-368475d21e33@gmx.de>
Date:   Fri, 4 Oct 2019 14:36:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191004120632.GA7472@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VUgldb1pOxXxua9QFkleJ9RFSvylQH1oBl05hEelBSTu5vI52iJ
 tLSJebAJFgqoDQIB8j6bepNItLnUadaJsKmuJBPPnfItr+CirVSV/Jd2G5RpcCBgAzgWAKj
 QJBf2SUQ2wj4AzGhB50mRGBv0riE/uYqNAZgmu+dqBlH6KUdrC+yNAXgg//NH8evjmxNNY5
 2mI22rIDQgEa0ph9Ii9tw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1VwPStFDYJU=:lJeiFPt+hC8HH0rbfmebgJ
 7VmcTY7VBQHHNLMTQgHsV6tb5W7FvwewBt3KzpGdruBTCCuWKsLPf4C6eph1ApL3h8CQzqt/s
 qIhcZnAjoPUhvyceXZcWyxkXXcMYJXBzRhjhaKLGAH1BNIC46ecGLgZkmLZYN7cihb4rtDCYg
 OyifqmezvPkFPWLpub4OsmQLcsuY6zZDTA7z9TWfWTR83CZlQ8OhMJ7ivfeJSTNYO2MQoJr1E
 9ZvBtdNfwdsDJi31+9WDB6Z2pgf4zNJ6Ii6M6hlQ1CbnAZsObSYzhwIT0Xu7VULha3l0vAQ8H
 qIe63DFdS+f/D9tv5CJht++xJwBWyWKZtdDTuJRiVu1HRWmC6wfxSgr7mCYcBmUphrX8gybjy
 D+83fYn55qhodfLwhpukcagsAfi6zYNyvW2MLDrYW9TW09pe9oK/Y3/hw4b/lbs2Z2jgF3zC1
 5H7U1iv2vcOKmJwz1NUFrQMonSz4GAoUV80Ma7o1WjdoUpWywpnDZvHKih94bEu/HViG8NBVj
 +DblRVDcSOMONSlLquwXmwBGsX/OxeIEQ8rIkA6idM8Icv/Gzo6RgQqa37fNc3uUAFGM71nHe
 mWD6lM+OvQr73FpJaYcvX5pwc0b5fYKmU2xlpcI0+kNi4eZ5J5Wc0I8SzuH3HsT8bgFFJAggd
 VtsyvfJh1zQoOO4y57aT1poMVQG4m/PwJl9Tg1Jmty08r/dN2VXenTnfppYTtd+Ys+obIu4uL
 iGJloNTSY9xfZFN8PoG7GmwRWxs8uxoxlEnWsOiUSmCx1O+cV34+PXrgoVOK1HcJpdgYVFR00
 xGwA1pHF0BtRMTtS7vVhh0AS7fNwV1Jl30E8+qTo9RuucQuc8kKpovU7o2qD+Y+CKIxQA1OhR
 CvNbM/eNsstV5Q4d4krkjJKelrrzrQMoORXX0Ky8jMSPx7s9pnTsXX9RrPy+NOK4eeu5ON4fT
 YjDI8Z/GEgW3gCFbFzSYPGklSncka0AQjgNpM3h7hveAbYAdSYl/sAsmZZsEmqSUDjTsa+I+O
 2LOMOLO2mCVY6Bg6jrvaIK4YSRmVPhL3rQnoINZkU0vNukoR0Bo1A3U/faBfxpTUs+9+PbDGg
 KaFFlqQGrr1vGAGdVmwhaLgQX6ojt+zZdsV7n4iwjC/p+z20fHaoXi97xGFZDcKrdXEnySnlL
 0zdAxRJq5y+ip9MANn/Dz12UCZ58xEx4eOApdm0oz7D/rBujxexe2y4Xq+4gzIV/Ao38z1BIJ
 wadb7GMppHUYZAheYd989MvIMSNVScf9LioCKwA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 04.10.19 14:06, Thomas Bogendoerfer wrote:
> On Wed, Oct 02, 2019 at 04:37:41PM -0400, John David Anglin wrote:
>> On 2019-10-02 10:19 a.m., Thomas Bogendoerfer wrote:
>>> +	pa =3D addr & IOVP_MASK;
>>> +	mtsp(0,1);
>>> +	asm("lci 0(%%sr1, %1), %0" : "=3Dr" (ci) : "r" (__va(pa)));
>> I believe you can remove the mtsp and just use "lci 0(%1), %0" to load =
the coherence index.=C2=A0 The space
>> registers sr4 to sr7 are always 0 in kernel.
>
> ok, good to know.
>
> while reading this I realized what the other hacks were for, which I did=
n't
> include in my first mail.
>
> diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm=
/ttm_agp_backend.c
> index 028ab6007873..e84c7652eb1b 100644
> --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> @@ -66,7 +67,8 @@ static int ttm_agp_bind(struct ttm_tt *ttm, struct ttm=
_mem_reg *bo_mem)
>   		if (!page)
>   			page =3D ttm->dummy_read_page;
>
> -		mem->pages[mem->page_count++] =3D page;
> +		mem->pages[(ttm->num_pages - 1) - mem->page_count] =3D page;
> +		mem->page_count++;
>   	}
>   	agp_be->mem =3D mem;
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm=
_bo_util.c
> index d0459b392e5e..4bb301cab128 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -571,8 +571,14 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object=
 *bo,
>   		 */
>   		prot =3D ttm_io_prot(mem->placement, PAGE_KERNEL);
>   		map->bo_kmap_type =3D ttm_bo_map_vmap;
> +		printk("vmap %p\n", ttm->pages[start_page]);
> +#if 0
>   		map->virtual =3D vmap(ttm->pages + start_page, num_pages,
>   				    0, prot);
> +#else
> +		map->virtual =3D kmap(ttm->pages[start_page]);
> +#endif
> +
>   	}
>   	return (!map->virtual) ? -ENOMEM : 0;
>   }
>
>
> This is needed to be able to get the virtual address with __va(pa).

Can you make a documented patch out of all that?
I'd like to include it at least into a test/hack branch, e.g.
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dradeon-test&id=3D0ef942c21d37078ae6406b3e7075f3dbe6417a04

Helge
