Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637C346A4D6
	for <lists+linux-parisc@lfdr.de>; Mon,  6 Dec 2021 19:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347252AbhLFSq6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 6 Dec 2021 13:46:58 -0500
Received: from mout.gmx.net ([212.227.15.18]:52519 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347270AbhLFSpC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 6 Dec 2021 13:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638816090;
        bh=TmJVixc3sUqb3RUYJ39lX2uiqYiEAC2/ZFE9A6O+PsY=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=fMwSWSHafnmBGd07oCV7s2X7ci21FIW0c7qKphfFH9CX2FQmtQNRyZpBXK/PAm0YV
         bifN6D/VPyXiTk3iCS45Nk7A/VKTuphQJdX+G7RtIoaVOx9Cz+KgxiMCfS0dwPkdPO
         FGr1bW/L2ucWRQ7/QRINUzPH+dJVzapvtSnyUpN8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.133.142]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7b6l-1mvelj2aq5-00860I; Mon, 06
 Dec 2021 19:41:30 +0100
Message-ID: <e76b69c3-0351-7054-bf8c-6de2bd9c33ca@gmx.de>
Date:   Mon, 6 Dec 2021 19:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Your System ate a SPARC! Gah! in map_pages()
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
 <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
 <8341244f-5db3-3dd0-5952-88e706eb9e81@bell.net>
 <a00c91d7-85d4-7c5d-85db-af812aadcb31@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <a00c91d7-85d4-7c5d-85db-af812aadcb31@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PfAxFYQKKh5oSb0poL9qVuKz1qFE31nbtHBVzxf4Q1WglhZLDOH
 t6OAHuw4znxjVr6ZgjuIbhFNQ9fxAkCFRZdzovT/ZBxWGE5YbreZAh4nChLV7DO+nUb/+wn
 JpS/T642C1pPLgZu9Cc2pd/MvdDS0J5+AxzcGjv32NU70K6oBMJU2+NLrpB065Ix2Cmo43A
 BGeaZ0DFpJqb9baBZIVqw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hdRCahCKAZY=:v3oxBRkihBJPl6d6yRtGUu
 XlYIwU2paklYSYdcPLGd5TAAlBIN7jEeXe67ZeLy7E5yoTS9UcMF7MTVhyeNdyXfF0V0Bps5E
 TpRyusQnJhOjjcsTJHI7uXTgOXoHzlv4VeIzw/uNj8fqJ9TWKo0Hr6SeWNa5dyIESIQjJYPOr
 JsK48fJYpBWoiPukGi40KCqwa5LQBZQBmeXXAP0Ygx9erSWozkKeK2OCwR8i5BtlUld9s6tJx
 lwFs4+3SOMConpCnYfPs71rIpoluGIQquTxnR7f83Ut9buGi7VZl0Mzb6sWsMvuicmyFspWaS
 q+FlP6NXlX7wKNNI6oyngFvaUyeMER+UC9gAqlnUELFabX5MJ1AJeuD3FYm//5v3/9kUtOYUa
 kcHGm1/6BRXlbqTswbHQMcb4aEHGJe4lioW/S9xnOS4BTjX5Nc7BsJk9ogFowrhObwsfMO9NB
 6zxkHKeiGMbtud+FcL1QezZXBBIGe4F3wPoJJIEAjuZ9IS3WngGA1Yg+ivrYEPYEsFoXzBeJL
 ydRIfUvELL8bTylYMbnfx8HR/Dds4etN8r+7tu9rhDmrHulNey1FI+SBiLWj3YMnnCeqfILkn
 YyCsqu3pd3xMgjGSWSYfrcmEV57d/saPF7l6wqm8VstL+iV8xm4pQErGQvBJ+rZTBHeH6ZSgd
 xl+M2gNF13Lk9RKTO6LP5jdmA9rGc8JX4fvooldHBVqKavbgra0LJlvsc18RidH9CwI6ZqDFf
 yFIEOFFwNvrMw5+fty85mf/CFtYMEcJ/l6xwP1aOZP+nt6ucPOWhqJuTLbjiBmF4r25WjODos
 Ijjxi4A4O2RewJLYWU0w5jHEEo0S5pr1rPSNw040C4PW0TGmnRrfG2lQJMPQ+bzgp7ZnaiEv3
 tItYP3R5sYi0RJCRSGYWxsQXmDs9iJuD2HCtNwc+Ps3o2mBWXpuvD9tTdG+LC6UmhxigET+UO
 4abFyOk9RbabzFAcTWm4frbhAg53iEtmLh72OIcsUvlEkRTKPdIPwxzx3Ci7k1vvOmmKR6o2+
 bd6miDbiodM3T8k1V1HIaksca2ubyZm/d0ljVFytu/IZXRudxfin1cT96M+vy5wRaYT8NCekc
 Lyximz2vOC2pas=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/6/21 00:05, John David Anglin wrote:
> On 2021-12-05 4:00 p.m., John David Anglin wrote:
>>> Does=C2=A0it=C2=A0boot=C2=A0if=C2=A0you=C2=A0remove=C2=A0the=C2=A0__in=
it=C2=A0in=C2=A0front=C2=A0of=C2=A0map_pages?
>> I'll=C2=A0try.=C2=A0=C2=A0I=C2=A0thought=C2=A0of=C2=A0trying=C2=A0it=C2=
=A0but=C2=A0wasn't=C2=A0sure=C2=A0if=C2=A0map_pages()=C2=A0had=C2=A0to=C2=
=A0be=C2=A0an=C2=A0init=C2=A0routine=C2=A0or=C2=A0not.
> This appears to fix boot.=C2=A0 System booted okay about six times.

Do you have huge pages enabled?
If so you could try this patch (instead of markung map_pages __init):

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 1ae31db9988f..a9a510338ced 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -405,7 +405,7 @@ static void __init map_pages(unsigned long start_vaddr=
,
                                } else if (!kernel_set_to_readonly) {
                                        /* still initializing, allow writi=
ng to RO memory */
                                        prot =3D PAGE_KERNEL_RWX;
-                                       huge =3D true;
+                                       huge =3D false;
                                } else if (address >=3D ro_start) {
                                        /* Code (ro) and Data areas */
                                        prot =3D (address < ro_end) ?

Maybe the whole kernel is initially mapped via one/multiple huge pages(s),=
 and
then we suddenly turn huge pages partly off. Therefore maybe not all TLB e=
ntries for the code of
map_pages() is already loaded?

On the other side the problem is somewhat similar to what I see with patch=
ing
the kernel code in the fixmap code on PA1.x CPUs... it showed strange asm =
statements too..

Helge
