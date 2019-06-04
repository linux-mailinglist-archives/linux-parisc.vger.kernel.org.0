Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B14C35052
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2019 21:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfFDTgV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jun 2019 15:36:21 -0400
Received: from mout.gmx.net ([212.227.15.15]:36553 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbfFDTgV (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jun 2019 15:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1559676977;
        bh=rukd97wDlQLwysrjmyCq1j+MqmwpUKN1B1I+9RKUsEE=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=eN7L8vQczB87EZo2YYrGO18ELpoGfbNXgu4fBqYOUhiROxe762CdhFZR2vYqfl4q/
         qJum+oFh4zVYzmTTy8Ogl3Z/67dr9qVzrxYqaymJnsn3kj6qGmiITVXiZ7mVI82ruH
         FfEinhJswlbmfq//qBv7hfLTK5UYwzvOF3K8NnfA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.195]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LngNT-1gvLqA0vBH-00hyu1; Tue, 04
 Jun 2019 21:36:17 +0200
Subject: Re: [PATCH] parisc: Use lpa instruction to load physical addresses in
 driver code
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <5d53371f-d918-0333-08a7-ad0d04eb3b26@bell.net>
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
Message-ID: <5aaedf55-97bf-8d38-da37-bdafa54b5e9f@gmx.de>
Date:   Tue, 4 Jun 2019 21:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5d53371f-d918-0333-08a7-ad0d04eb3b26@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JDGxFb+JzuCS1AfqyFt7BvH8ggohLiDL9A7N22upm6FxW47mY1n
 wWWr+ZZ37FXxk7DKNXVjrclXGV3vPK0lgKbuqzyvyFsQqn9DnGI0Ib+K4ATVsa0wnnav9DE
 w2jzit64Ccn0FUUZR5JPIx2SLQwbbNmh/d45SXHLianx6fbqcK5ZiFJ4p9QPeWCXvrgqFO6
 eneBkrTVk3WxeUjc1piYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qt/exCQ4ZIY=:MeAfLkYrWJEWQqp2U1kZ9o
 Txp2hPUVmBtCU288RYiUL2Upcs3ZVo38hcTHyWVTg3lEfAjwAm1Ax1U2uQ37KtG3sJEDUiLCH
 Y/9JA9uV1BrxvaVRLSAwoUyazkZ3jnQnaLuZtmNKxMotNqAvbCf2LsS5kyWWCI9PP9VzmoTyR
 oQfO7vXu43A6m1y9iiaZ3kivpVB54znRtYK4UFUW8miO0eYTWVnYvJrqIN8o9rRw03jS3Lj7m
 umDvErd9ltpINf53FSDkDcKoW3Cva3KeTs/A2RrDr7fwdG42ZmbYkuAcFYAzU77U8NfFS9mkz
 SHHv+Ckn2uhOSb14JhLCND2PyYcQd+K0Ma7fBqAWo24zcep41ScQfM5odwNiH0pwFFXSParLV
 PAbIt74M5/nd0q4NP+CP7W3Mtv+uxaDeksE3XKvZCJw+wewkiT0ooMacMYA51xCrVxR8Nencs
 KbS62yJN7N9Yf7J47E5CD0LMPEoE8lXm4hUrl1SVdV2kkg+a9a8ZvsJ4fHBjaXoE1JEhmWLdO
 c3N5DYrAgwhQiCtK4VB95D6NdQ+hdlvAsXRkX5EiW+LrvsEFeXghSYFSTrZNt3/O/H5v5N6SU
 9lMcdDw49ojdIBxlHFi7QGU5h4VsBU7Ly4HJZUfenpkdozt8PLL7crp2P+pedrrAQC/bp08e1
 Szj2u5DEBN6I/gHeneH0oE4WaCmBw1848lE/nqZSAkGIlZlA6rwB1Yxc5nqe3EHsiDp+uEr+C
 WwSsLXfdpSNKVItt+3cF8fptGxYTbznq7SyxLyX+I2MqFGnR6pkTKSowdTOpYYEXRDOcf+yzP
 3Ll2r1/IzDwYQtc/gbqSE4ZIVNbxMxrSKVnPePiPo+xMNQ9sMKEhPFE8CbAl4ZlwmxLlpnsSK
 XEh0EQNmaq7EEXKRV6UyTSaAmnaZwkEHFl8ioP55ydi1v9c+MYAaEfK0lL/oc+e02L49Dm0t9
 67IS3FlCyUQKtBMqerdUlPGTrZBN0PAdD0MUB78FdY4hRXShs7rwf
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Dave,

On 03.06.19 01:12, John David Anglin wrote:
> Most I/O in the kernel is done using the kernel offset mapping.  However=
, there
> is one API that uses aliased kernel address ranges:
>
>> The final category of APIs is for I/O to deliberately aliased address
>> ranges inside the kernel.  Such aliases are set up by use of the
>> vmap/vmalloc API.  Since kernel I/O goes via physical pages, the I/O
>> subsystem assumes that the user mapping and kernel offset mapping are
>> the only aliases.  This isn't true for vmap aliases, so anything in
>> the kernel trying to do I/O to vmap areas must manually manage
>> coherency.  It must do this by flushing the vmap range before doing
>> I/O and invalidating it after the I/O returns.
>
> For this reason, we should use the hardware lpa instruction to load the =
physical address
> of kernel virtual addresses in the driver code.
>
> I believe we only use the vmap/vmalloc API with old PA 1.x processors wh=
ich don't have
> a sba, so we don't hit this problem.
>
> Tested on c3750, c8000 and rp3440.
>
> This patch includes the previous change to use implicit space register a=
ccess in loading
> the coherence index as the two changes conflict.

Actually, I think it makes sense to push the drop-sr1/use-lci-without-sr1
change backward to the stable kernel series.
After that, in the second step, we could add the code to use lpa(), which
I don't think should go to stable series.
Would it be OK for you if we split it up into two patches?

Helge

>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> ---
> diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/inclu=
de/asm/special_insns.h
> index 3d4dd68e181b..a303ae9a77f4 100644
> --- a/arch/parisc/include/asm/special_insns.h
> +++ b/arch/parisc/include/asm/special_insns.h
> @@ -2,6 +2,30 @@
>  #ifndef __PARISC_SPECIAL_INSNS_H
>  #define __PARISC_SPECIAL_INSNS_H
>
> +#define lpa(va)	({			\
> +	unsigned long pa;		\
> +	__asm__ __volatile__(		\
> +		"copy %%r0,%0\n\t"	\
> +		"lpa %%r0(%1),%0"	\
> +		: "=3Dr" (pa)		\
> +		: "r" (va)		\
> +		: "memory"		\
> +	);				\
> +	pa;				\
> +})
> +
> +#define lpa_user(va)	({		\
> +	unsigned long pa;		\
> +	__asm__ __volatile__(		\
> +		"copy %%r0,%0\n\t"	\
> +		"lpa %%r0(%%sr3,%1),%0"	\
> +		: "=3Dr" (pa)		\
> +		: "r" (va)		\
> +		: "memory"		\
> +	);				\
> +	pa;				\
> +})
> +
>  #define mfctl(reg)	({		\
>  	unsigned long cr;		\
>  	__asm__ __volatile__(		\
> diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
> index 121f7603a595..217f15aafa4a 100644
> --- a/drivers/parisc/ccio-dma.c
> +++ b/drivers/parisc/ccio-dma.c
> @@ -562,14 +562,12 @@ ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, uns=
igned long vba,
>  	/* We currently only support kernel addresses */
>  	BUG_ON(sid !=3D KERNEL_SPACE);
>
> -	mtsp(sid,1);
> -
>  	/*
>  	** WORD 1 - low order word
>  	** "hints" parm includes the VALID bit!
>  	** "dep" clobbers the physical address offset bits as well.
>  	*/
> -	pa =3D virt_to_phys(vba);
> +	pa =3D lpa(vba);
>  	asm volatile("depw  %1,31,12,%0" : "+r" (pa) : "r" (hints));
>  	((u32 *)pdir_ptr)[1] =3D (u32) pa;
>
> @@ -594,7 +592,7 @@ ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsig=
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
> index 8a9ea9bd050c..296668caf7e5 100644
> --- a/drivers/parisc/sba_iommu.c
> +++ b/drivers/parisc/sba_iommu.c
> @@ -569,11 +569,10 @@ sba_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsi=
gned long vba,
>  	u64 pa; /* physical address */
>  	register unsigned ci; /* coherent index */
>
> -	pa =3D virt_to_phys(vba);
> +	pa =3D lpa(vba);
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

