Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A684F1A900
	for <lists+linux-parisc@lfdr.de>; Sat, 11 May 2019 20:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfEKSQc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 11 May 2019 14:16:32 -0400
Received: from mout.gmx.net ([212.227.17.20]:35053 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfEKSQb (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 11 May 2019 14:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557598562;
        bh=AYylFFsHLMQRx9XPrMfbvcw/fN5l/IuD13HaKUe9R9A=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=HI2xTWwbuMKLnIOKKCglDKw/JERQfezW773QHlfFbAgjL7QZzPewAAOAK3DcvuCUk
         xujR0Q1rGb7cZ4NeMc0I9ogj+kTQLnBlayfuoGaRsGbKuiyxcD6O9Mq9roF9+D1v2m
         F9pp2Oleq/80cFgr2Dql4vHuv7z79/IP3oXglOig=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.179.253]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6UZl-1hN2VP1Jeb-006xpD; Sat, 11
 May 2019 20:16:02 +0200
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Rolf Eike Beer <eike@sf-mail.de>, linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <3f99216a-a653-3552-a347-9c645d274b98@bell.net>
 <ac66dab9-6686-c03c-603b-eda4ce0e3e4f@gmx.de>
 <11714378.QMnzgogxCp@daneel.sf-tec.de>
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
Message-ID: <f73c00e0-f44b-7075-28ff-85ffe0d93eaf@gmx.de>
Date:   Sat, 11 May 2019 20:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <11714378.QMnzgogxCp@daneel.sf-tec.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MGcb9HgC2FW3o1iaiGlfprpSEg1EBZfQy"
X-Provags-ID: V03:K1:hKgU14BnW/Hsw93AqBF5eAN+FA3+0/qUtJf/yanav4CHw+MogCY
 GDSEGiYL6dqNycIX96GOHQQzn4OliB4m1nbM1mgtzrtJQo6Dzas+ZY4tc+K1J8ps1g3l5SE
 sgIq9mw2Y3pz9m2T+WgXzGWuHmBfUPrij1p58nk2Rnfg6nbXH6aeSVliPiN4JcfWVLuFBB7
 TOM8ZJjVkN8WfUJg2Qy3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5G1ERcqh5V8=:2+PuiR6b0WT4P4OH/ItRng
 evTnzGVfcJmHogjc9iGCABoKL72uwOuzsslKmbP231gKcWSE4cr8Ro9nch+MPDUfyJr3eATPA
 BWes3rAkrdQd5M6vlhOo1geKTgnykSweN4Bjt5OW4+h3uTMgA/RyYjRlOitnoAe0aNbGeDRGa
 qND82kk/1XcuReuJOB/oy0CGGX1o73yZLOS+K2zyBo27cOQLo2+sAZ1ir/c2ji7wMMkQLFpBh
 6YGdx2Qf8lhue+LTxlgXMaDOH9KJhRHf0w3NsjVred+uUIHySDewdp7cQ8vHJIFZ7ilCBwpDP
 rUJ9/LvP6EP/khlgcW1P5HL/JI8mSJxmSY8l74X5eTozGefyo06dzxbZdMrKLiLGnmomI7Mzm
 7kyjMdmQw2N2+x2YjJRdTSuplALwEcCSVJcGVJbwAB7tnp40vx2TfavWx1om2IrhhFEOiM4Ga
 rDGjrrlsqnXNlsj33qolbpgOWHjbkmAP9v+MQULr5lqEouSa2ZkiDWolhh3AAo1h2spl/G7dp
 AdoAfdFa5C0GnnX2pLzJ9fM2YqzGQ2ew1Jr44vvT1GC6fZnVQ38ncsQgjzXUin8TIyFM9apG1
 QpO2gNIEAyExKIPwTm8LYZzyrDiQPLrwlf80fclvf3tpOD8v8B8LCoWkzXbqqrGX1r7b5r8f1
 J8w1qGuaj/AF0AcdMEt93RJMD8oF1II+BdAiT0WXizpYfDGIg4zjYBQCtS4fFexps53X2GV/h
 hQpcmycvmEre+hIvISRD07KLc5fEn9CdsCH6SvvicUjcZtYpkN8oNnZu0s4SlN05JzfxC7SnW
 Nf5RLlyYXGFoz3wlynN10og8Wx9Y3lNWoFKYxBlg1BAnof+NOqk3oy+xnxLFqBykBkzG96mvu
 OQxR+TsrDQstMajhwHIWRjNhUeWxUTlq1E6mDYaJdBCpQumDCv8FC93RnjDyfg
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MGcb9HgC2FW3o1iaiGlfprpSEg1EBZfQy
Content-Type: multipart/mixed; boundary="khMnf4RaNTCs2p57hmZDN1oJeR4x8Biz8";
 protected-headers="v1"
From: Helge Deller <deller@gmx.de>
To: Rolf Eike Beer <eike@sf-mail.de>, linux-parisc@vger.kernel.org
Message-ID: <f73c00e0-f44b-7075-28ff-85ffe0d93eaf@gmx.de>
Subject: Re: 5.2 hppa merge seems to work on my machines
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <3f99216a-a653-3552-a347-9c645d274b98@bell.net>
 <ac66dab9-6686-c03c-603b-eda4ce0e3e4f@gmx.de>
 <11714378.QMnzgogxCp@daneel.sf-tec.de>
In-Reply-To: <11714378.QMnzgogxCp@daneel.sf-tec.de>

--khMnf4RaNTCs2p57hmZDN1oJeR4x8Biz8
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.05.19 19:43, Rolf Eike Beer wrote:
> Am Samstag, 11. Mai 2019, 17:43:23 CEST schrieb Helge Deller:
>> On 11.05.19 17:27, John David Anglin wrote:
>>> On 2019-05-11 6:47 a.m., Helge Deller wrote:
>>>>> I am testing a few sata controllers, see here
>>>>> http://www.downthebunker.com/reloaded/space/viewtopic.php?f=3D50&p=3D=
1563
>>>>
>>>> In one of our buildds we use a
>>>> Silicon Image, Inc. SiI 3112 Serial ATA Controller (rev 02)
>>>> PCI card.
>>>
>>> This Syba card also works:
>>> 00:01.0 RAID bus controller: Silicon Image, Inc. SiI 3124 PCI-X Seria=
l ATA
>>> Controller (rev 02)
>> I've added both to a new Wiki section "SATA Controllers":
>> https://parisc.wiki.kernel.org/index.php/Hardware_support
>=20
> You can add this one:
>=20
> 40:03.0 RAID bus controller: VIA Technologies, Inc. VT6421 IDE/SATA Con=
troller=20
> (rev 50)
>=20
> I have been using it for years, first in my C3600, now in my C8000.

Added.
Thanks!
Helge


--khMnf4RaNTCs2p57hmZDN1oJeR4x8Biz8--

--MGcb9HgC2FW3o1iaiGlfprpSEg1EBZfQy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQTPnDOmy1/TQodsisYgKkl43U+sXQUCXNcRYQAKCRAgKkl43U+s
XaNbAP9Dnq3mAXNkMwm+21h8tQoY/On8qWTs8mA+D1JAPOaNnAEAyybLn46nbnA0
uRuUutOTcOuMjogTpTvzrK3ksxmE1wY=
=bfzi
-----END PGP SIGNATURE-----

--MGcb9HgC2FW3o1iaiGlfprpSEg1EBZfQy--
