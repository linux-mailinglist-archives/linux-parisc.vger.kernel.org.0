Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70B41A799
	for <lists+linux-parisc@lfdr.de>; Sat, 11 May 2019 12:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbfEKKrU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 11 May 2019 06:47:20 -0400
Received: from mout.gmx.net ([212.227.15.15]:49071 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726472AbfEKKrU (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 11 May 2019 06:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557571638;
        bh=oXuQD7tBj5tgmLBGo8rJ21yTh5nJY7Xxh6lmEYp2d14=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=gtTt4WnM/f8G3aIw0xgczp+Duwkdta4KuXFAR6oLTdWXShnA8U5kljcOEV0Gbl7eA
         0zAlcE5CLNy4iOQ+9oWM5uNLF56nLnisbS7cR/ViongBCZN50mS1y56izvKxpLyddQ
         6Zr10XfL9VZo5d/U41yI7Qx3g93d3DHrmIFxSBqM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.179.253]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqb1W-1guSUI2fPE-00mef1; Sat, 11
 May 2019 12:47:18 +0200
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
 <CA+QBN9Cuf+O8uKbdhPkfAdpP0YThM4FBkHJV-DdRPYe2M146aQ@mail.gmail.com>
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
Message-ID: <dd0ba2b8-4267-9e84-6712-6e6463bd496b@gmx.de>
Date:   Sat, 11 May 2019 12:47:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9Cuf+O8uKbdhPkfAdpP0YThM4FBkHJV-DdRPYe2M146aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i4NzdWexQw6hnuq7AUjxKABWjboDYwySDJkrnDqF/WI3OdpzTeF
 zud8cOR+9RPGCHhCzX/pxKpcccwB7a01v1SsmFe3cF20U5KVo2qRqScgVdG6PJ37rFJkA/6
 nnwgN8VvS1w5LT9VhVXK0auqqGAQA5eNL2yKUYxGVFaMJ/oevVWzcqFlHptDEA6bEhgEMrU
 VKVfGeXXGjFTGQeOxCmNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K2ckDjzI3r0=:t666eypgvO+momm5a4Rykr
 3DVjVcMsO/8RqoNKkefGUKvWvvRAUBWHeYURVKYJNEOflVAZ1rMgEJXIdj/ULotNOMLLmtiDZ
 4BIf3iBm464LMyactQeGBMzEcbK7zQjtKXUMXjAs4XH1bwi/HDm1CYk6lljX0XCoOZ07gBdOP
 sOv+nPWM8eR2tR/LqxBrXhQ/5SD+NqUVTORBwqHe3tQ5S2DU+H1xLRLEnU0GwrQdBxJj0RJpR
 Iwej2Ybe9/Om5XDlIBku7R+qpRqs/M8oHFPwMYfp9SXD2NeZTjgeqboraUPrfwaNgPEzOqX8r
 aHgTzJxfuHizZ0MZ8NnNXVcBIfUe3dv/KejFaf0aDP/1Q0Og6FRoc5WjmkFyVlRBY9qcWD7Mq
 qg0EwNBkRC3qMQ/Gy4xMSSCjJ8ss3vQrOY1/8zVPyxWQidSnsKGQHZgnqVq98B6BkpiOk28Q8
 nr8eOd7ovW0nvUA4ug2l3/VL6fNQgqmVpOmZEdobnI569R121Mk544pKUCYGOlKkB02Xcab5m
 0t76Ps0hcmjJSrHFALz2IKaeKvl0k+XY/r5HkSNu88hdKLTFVcs1qkeVVc09ldEGoDtSpNBNh
 H4/Mjk31pk/8x+FPI9Sy1erga1gSMV1ZmBgEYo7XMRjHr5XBzHzZbFBqXzc69c5t3L9XGjIvk
 i6IHwbioWIX58xD0MaFYUuHd1Wwio0iJuEy2a3F0MPsoRNEm5pMFxc7Jvhh+5mu93gs1lvsTI
 qJKEy4TDbi6lr0Cx43EJ5fCTODXFAe7Sr3gxt+LrmURYyhoPEfMTzEelfNTx2p3L3oOIVoyQ7
 v3HR/b4Gg+n9PA8veiMcDvg83xf+G4KsV4q2evt0/xM952ZM3ayxP18kWVDUZEaMWGj7zzmd5
 enQLaRVNBU0j7Qt3q0YhSi9dn97I083Q2x8HLNa5xPscqDTlVoGeNaEUWlHlmO
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10.05.19 13:43, Carlo Pisani wrote:
> hi
> guys, unfortunately, it panics with Marvell MV88SX6081 sata controller.
> I will publish more details later

syslog ?

> I am testing a few sata controllers, see here
> http://www.downthebunker.com/reloaded/space/viewtopic.php?f=3D50&p=3D156=
3

In one of our buildds we use a
Silicon Image, Inc. SiI 3112 Serial ATA Controller (rev 02)
PCI card.
I'm not sure if it's fast, but at least it seems somewhat stable.

Helge


>
> Il giorno mer 8 mag 2019 alle ore 21:15 Helge Deller <deller@gmx.de> ha =
scritto:
>>
>> On 08.05.19 16:23, Meelis Roos wrote:
>>> Just tested v5.1-5445-g80f232121b69 git on A180c, rp2450, rp2470,
>>> rp3410 and rp3440 and it seems to work everywhere for me.
>>
>> Great!
>> Thanks for testing, Meelis!
>>
>> Helge

