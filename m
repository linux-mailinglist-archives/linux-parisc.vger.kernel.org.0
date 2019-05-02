Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7424C11FDC
	for <lists+linux-parisc@lfdr.de>; Thu,  2 May 2019 18:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfEBQOg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 2 May 2019 12:14:36 -0400
Received: from mout.gmx.net ([212.227.15.18]:53121 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbfEBQOe (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 May 2019 12:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1556813652;
        bh=8O9NNkmgROT36yGW4T9bj82tzqx9WPe2xkp5FbBQv84=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=QR+vqhdtIphFB6z8q0756RCO49Y/Od9RNDnPzPAC5+PYEhOctweC+fqvW7kQWV/eg
         yRqh3oahSHWtcRCDuFZj2wSi3UOAiud+S6y0L1GGZZGV0EXkrQmA89Y75lRvDVNGGq
         GJ6NPhgLt55dlriFHkDYWKsd4K5W/aEVYnPu1CRo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.20.71.127] ([193.16.224.15]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdeR-1haGZt0Nin-00EhL8; Thu, 02
 May 2019 18:14:12 +0200
Subject: Re: [PATCH][RFC] parisc: Use per-pagetable spinlock (v2)
To:     John David Anglin <dave.anglin@bell.net>,
        Mikulas Patocka <mpatocka@redhat.com>
Cc:     linux-parisc@vger.kernel.org
References: <20190428173431.GA21286@ls3530.dellerweb.de>
 <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com>
 <383ae5f2-cfa9-784f-2f19-8bcc5ade53a4@gmx.de>
 <alpine.LRH.2.02.1905011219190.27284@file01.intranet.prod.int.rdu2.redhat.com>
 <7dfcef75-193f-6373-92f3-f448c59bba63@bell.net>
 <alpine.LRH.2.02.1905020920560.18084@file01.intranet.prod.int.rdu2.redhat.com>
 <3595abed-26ea-9aff-60ef-e0893bf07af2@bell.net>
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
Message-ID: <a98ef81b-cd8e-b81d-df24-8c508e8a01b0@gmx.de>
Date:   Thu, 2 May 2019 18:14:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3595abed-26ea-9aff-60ef-e0893bf07af2@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oELphURWPVLqjQBORVACXSwVv/x7Gqf0BEy68UeYJokfCN+8JQP
 3aMDeLELHUM3/+VD7Cy87i3pp5u/u4s0l64i3msPJpRZhHN2r01ppHRDiiSULft5fXTklqB
 zItRWOUbc+003Y7zVoB2f+1bhLWT/VZiThKxWpUS2defhGeiB6RYmZPg4Hh3OZI1mwjbD8h
 DKFQWa4ftcrTstr1SVjBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o2GXPQDmnVk=:ZLycKOgVQFfCzxs8pLDw06
 nc8CX5xJd2jDt0ZbGguQV3MdPt1ymuNmohKSId+0rCV2rmh2ejHgK/53YKs8oChxNVZwRx4ZG
 GbYahfSN/iS+0r9eCc/eWyzzBbKIk7NMFCT6GlHZRvCVrE1ulQ0JfTGBzPRq53N3aon10uR+r
 TdGEU3XvHd6fz0KvxEzvHgbLMfuMymK4DMcfdToxQ3aO/PxzlfCpmdDykmxMw4/SWFj3l04X1
 UUlBymcVmL189FhG8GKRdhP5z4h8+coSGF324iVih2M+G/tVweKPsKbmnkOaaYqbt2TCG8KA1
 iH2bwnsNQv4t4BconMBWM7yjjt4B7nRBABzxefrJJxKGKtGmVM4kbJVI+kriR5jHc60aA2dLx
 cbt4RmIj6cpFqmHqfLtOTG/xfGEFSSvVVcH2eCsQPIMG5PjZXBxXchtIV+ovTpzA8udEDI0yy
 h5SKwiZgU0WYb3zqKs7rv6V/HLwJm01PdusdfbSidJcXG/xlmjjmEx8GLZaLTkeNkMJplzySv
 NkCcEBVU6IvjMo5x0xxsykjG9yeVVQNMrJOcChp9xU14vhE1CUT7t/9R7hNxz8qId86bacomx
 8iNeo2b0nsl8WnCFZ/BHf09/bLWfilPsyadNEdlxJvbBuE80RuP3UGNZihSe1QVS4rToEWiXY
 AtaTZyu62H2h2FcuuT10MceCbHEVNkfrnnp/qYJPrpJvulMTsEPFrC8n6ERXyE874pS+NKo8X
 MSJCDmdbPJSxSOOQqu5WBtZS0BRbbn0B5sXhFCCA2R6qyJN3FTf4SezMKPChbUrZvu9fuwnFz
 EFYNiAd7jA3o48g0u9WJG3/aedkgSQPbWu2aFs865B2yZtIYwr5uHQYkj/MvYhrUeeOqmOaEV
 W7E/cs1NfOwyAjt1T2FS+2RkRfwmBSXXzhpx/8DQEis9tcyU/VMJLVf3AM1JyB
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 02.05.19 16:34, John David Anglin wrote:
> On 2019-05-02 9:43 a.m., Mikulas Patocka wrote:
>> My obeservation is:
>>
>> CONFIG_FLATMEM_MANUAL=3Dy - doesn't compile. With the Helge's patch, it
>> compiles and works - but it only sees the first 1GiB of memory.
> I didn't test FLATMEM.

It should compile now if you check out the for-next branch again.
And it only sees 1GiB of memory, which is correct for FLATMEM.
Instead it tells you to turn on CONFIG_SPARSEMEM:

[0.000000] Large gap in memory detected (786432 pages). Consider turning o=
n CONFIG_SPARSEMEM
[0.000000] Memory Ranges:
[0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024=
 MB
[0.000000] Total Memory: 1024 MB
..

>> CONFIG_SPARSEMEM_MANUAL=3Dy, CONFIG_SPARSEMEM_VMEMMAP=3Dn - works.
>> CONFIG_SPARSEMEM_MANUAL=3Dy, CONFIG_SPARSEMEM_VMEMMAP=3Dy - hangs on bo=
ot.
> I thought I selected CONFIG_SPARSEMEM_VMEMMAP but will check.=C2=A0 Have=
 multiple
> builds with original SPARSEMEM patch that were okay.

It sometimes hung for me too.
I think my VMEMMAP patch overwrites other memory and thus only sometimes c=
rashes the machine...

By the way, I've rebased my for-next tree, fixed a few small issues and dr=
opped the VMEMMAP patch for now.
Please give it a new try:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/lo=
g/?h=3Dfor-next

In addition I addded a for-next-testing branch for further testing of the =
remaining patches (VMEMMAP, JUMP_LABEL, ...).

Helge
