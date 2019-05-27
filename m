Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5612BB24
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 22:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfE0ULf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 16:11:35 -0400
Received: from mout.gmx.net ([212.227.17.22]:53331 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727056AbfE0ULf (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 16:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558987886;
        bh=GnQInjqJ9pfjmq91NjLqQUvTUzqPC3I4PoPidntrHPQ=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=XsortY0We8JLrzL47hE9vTcrB7ZqEtlBaoSK9G4jHiPmyT2SDP/7NA2zk0gqjqMJJ
         GyoThf+byXLE6r8rzHPEvQKY3eeYmMppAueX0JCFnPWMSiwg8QhNFOdCEbXz05kYR/
         fgidEJmLUEseBanIjNH9WyXRgMPpH/fdqKqkcgmo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.141.183]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LbR3e-1gltBs1pj0-00kxo0; Mon, 27
 May 2019 22:11:26 +0200
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Sven Schnelle <svens@stackframe.org>,
        Carlo Pisani <carlojpisani@gmail.com>,
        Grant Grundler <grantgrundler@gmail.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <a3f85e95-272d-86fc-916a-70928d5f07ef@bell.net>
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
Message-ID: <a6462d98-46f5-8cad-e4ef-228ee2ea5829@gmx.de>
Date:   Mon, 27 May 2019 22:11:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a3f85e95-272d-86fc-916a-70928d5f07ef@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qgV7jd0qXcVOFIhGQDuuH4GCG5oh56VpfUx++NrZIs9Vkt1zzlp
 igZbnN0/13iqfnSApggYDXEdFwzUgAsSVptYVoZ94snSsXlUll0rwFAjrATwR6PxyI6WmY3
 qQjgCRC33pIK3Q3yGQDukt0kIcwPVLUUbYdhZDFH1KlndeWjdUVCCNcJDSArCAEJCgeOPpb
 vnGvNc8HNCd+zj6RLQ0mw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/Jm5QBlQm1A=:0MNVe+EZqEp3Xav2+48a53
 m4wJam+0q/5e86gHML3EfrrX1Ux+5Qa2FtziNyIEOVeDdwC7D8epIRDV7aX9ZqmEP/9GX7G5q
 f7pqdVsgyED4xYJEpYsSE+xZCqOc3ZgrHv5D2PUfuDjIbAcr/mimJsNITK1Na8sVAFA0GKC8q
 b+edX+afugpAlMKZK/Arhhwht1J7HiJXLGqvmZbJddJc3h4+igvSgoCD5mZjeTyxZnnSrewVT
 YFmI00mb6TAYluWTVvflf+Rq3e8zL0k+7dSwhU84j6GuEbYfJ53rNZl3nzfDxQ0TV847zhyW0
 BbGndFM3UnyIMoEJIgGELb6TDoZZ3pZ/Zpern/yHwhEsz5Q63/W1Ev4lH1nrXceBNjuzXB+mK
 zY2q/jB/v62rAT3aXqmP67Ka+qVt/5GcwRdAo4gzxUHBMA1JnF94eLceUCrpgdo4v2gJhsioj
 C3V5j1/ydgQd4YYc4pvYTMMWqnVN68/6qjPm/7vf3qssgtQZOARPEvRjRMzkfsbKy81mOrTyC
 CYV0IVQ6IQbsQJUIB3mSLLT0eUbzqVe1xPfV55MmtsowbJlPinsKip6nTHMmn3ABVkctZ9P1y
 CCN1zXKRQzoR1VPs5oN2LXd1FkrYoFBeAvzCM0ufqbc4qIRIk8cHPPJ5swyCxD1hwRHSj88i2
 e6uZOfPFSSlILWBmCkmwNOK3tdi34LioZPZhZyGpUEuaQP3h2O7NHaMSqj7Tr3pwK1hizhlUA
 qwpaZtfLqNlfSRaFDBFNEEHes6lCB6WffK4JGZ4JEdW7hRHooDkTFjcl4Zc78MxZQyPPkmg91
 fiQKnEFaEvck4Joa/he8miMRqyjGWOCipIyDGtkhxYxtN5oWg6b46eHcm1e+5fV7SdvgXQOjA
 pYAEpp+ZcP83OtSgMP2QoEZB7L4J/28hBDo9XiA9pwgqZWQHSnDonVwBdl013zEYoiyLu6Kef
 FWLAzEWXkZT0GYkgqRfg/10gLVogWEokDDsbAI5ovZNxpPnQ0j+56Uz/b8+GPnXOIo21e4vIM
 F3KHCE07Mo0r6AmG10Da4aEphGiZEuSxihphIBmkY9/tRqxPKiLdnPPcBC1EcX4ZSg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 27.05.19 21:41, John David Anglin wrote:
> On 2019-05-27 3:20 p.m., Helge Deller wrote:
>> This fixes the HPMC crashes on a C240 and C36XX machines. For other
>> machines we rely on the firmware to set the bit when needed.
>>
>> In case one finds HPMC issues, people could try to boot their machines
>> with the "no-alternatives" kernel option to turn off any alternative
>> patching.
> Just wondering about soft fail versus hard fail.=C2=A0 In lba_pci.c, we =
have soft fail by default:
>
> #if defined(ENABLE_HARDFAIL)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_REG32(stat | HF_ENABLE,=
 d->hba.base_addr + LBA_STAT_CTL);
> #else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_REG32(stat & ~HF_ENABLE=
, d->hba.base_addr + LBA_STAT_CTL);
> #endif
>
> However, in sba_iommu.c, we crash on rope errors:
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ** Make=
 sure the box crashes on rope errors.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_R=
EG(HF_ENABLE, ioc_hpa + ROPE0_CTL + j);
>
> I suspect Carlo's C3600 HPMC issues must be from rope issue.> Should rop=
e errors be soft as well?

Don't know, but seems logical.
If so, does it then makes sense to a kernel parameter (e.g. "hardfail") to=
o ?

Helge
