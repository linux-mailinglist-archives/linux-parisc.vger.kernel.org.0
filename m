Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3103A049
	for <lists+linux-parisc@lfdr.de>; Sat,  8 Jun 2019 16:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfFHOcx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 8 Jun 2019 10:32:53 -0400
Received: from mout.gmx.net ([212.227.17.20]:51761 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfFHOcw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Jun 2019 10:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1560004369;
        bh=lzSeV6vf/Pf3w3hsg6iNWXwV3mOPs/+GpcSio8UB2tA=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=bZiU4fkvGbVJGyP3s+9mvQ+65tcmdfaI6eLjKOrAjR1hYrih6Kjv5x28alCSsgsSK
         nJyVPrSQlJruvlo+SprWRZfxBY4+c/pFncQBVmTJ8NZVDSuXGRWZe9+xxqsekqUR45
         KyNDBCp6jLR9rncKUHedKT4HpwMhl6mcBAKwtgrs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.248]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MSHax-1h6AOY2ADj-00TReK; Sat, 08
 Jun 2019 16:32:49 +0200
Subject: Re: [RESEND V2] modprobe: ERROR: could not insert 'ipv6': Exec format
 error / module ipv6: Unknown relocation: 72
From:   Helge Deller <deller@gmx.de>
To:     Jeroen Roovers <jer@gentoo.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     hppa@gentoo.org
References: <20190608145201.56c667f5@wim.jer>
 <f3b34093-1b01-f321-3b98-6708cdc25434@gmx.de>
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
Message-ID: <487d5cc9-742b-82f1-604c-f24848c1580c@gmx.de>
Date:   Sat, 8 Jun 2019 16:32:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f3b34093-1b01-f321-3b98-6708cdc25434@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AyYo0JE31CcjrDi7qHk8YEfFvZO5VRh3JG/Q+J9+lMWo+41sR8t
 Z7snDPYLUl9Pbx+G/pvbe5S5oylWxSCqYEBPXZ0NKvKUQUJo4YqBeMfwqixA0YDrx3lsG+W
 HLjT2pm8wgNWkbiZ/eC5dFz9wNE/vgVCTMZChPJ5JTRQIaAHgpXCGQeStxRiG+dV3FYFOWS
 wG0QvEm5GFX7sCZ4AqTjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:biOtesZpB3c=:3e/ZofsHZPwHdJDBaSRxxn
 8imShKTfbLyHpDa2h8/cVxgAexRWaxe1CmsvwT0WmKeFkWxUoTOINkyKGx5Gw/0UYQkK/psUq
 y2A4VPKFbCy9q8oJC1QoTYlSfLDtaQugxEO/nn55SwUyPukPFClOoOloWy69TTaeeDZdxP9y1
 wmSKjjJxcu+kVQ84kQhGL9XEiHtJlMxdVCdBGkYSvwJpr3ia+wjz/wYHrqjzxk8Snx6JDoEeP
 govbR2FcEq8i15E0g7RFTN57ba6dy84zBAIBAAwRwbkq1zEuz/znkfna6YcCBVVyZi5Immied
 GjMYb9OTzvmlzM8u4yF7nfuLJVGe0jxGq7vZFac7nRrm0ArgN9nz5TSdoWeARTAMKviGaN7ZL
 Ek99cSdCRxXs15vytnZzT+kAr/1aMugZvbcI7hyK7EQpPodBYwb3FFLT2nihZWJQI3V9UyOsX
 uh9BQ8/bWP9LIlwBLd1DC3M5xxMQNOyVq3/npxEjce2nNiLrEZJmjCyoucHIyG00UdnBeuJJb
 e8F/nzSsLfFM799HMUezHDHfIsN1wVuCl5rVBi73LnRXux7l03kHWSD5tGMkAKdogiZhUaEWu
 or9xrII5iyxChyEOy9bzy6Vw+JLn70kLYzmXdRjQD/TnNx2mHYZcDHhq7a6U7zgWXj5zqtZJx
 CfmB5FlxAugKPmUVyTpRJhgVPTPY5HWIZsxMDTI5gB++2rA3OjlvcbHHsCS9S6WDELCcypOg3
 +yOskaygDgv2WXxqZG3SQDe+aRKgq3Ck1VclZ0dzY/I/NRk87qX4D0QA4EOyDK5/ub1y14pBu
 NoCyW4mYh7nAFPNkqjByHltx9IztG/aMssB5ZXpicqJhfFLFmjSp+LTZFdYxdc8BbwFqehXRb
 xVPz3NWuLpGachhOJWtKTXNZVQx03BbhSa44Oyy6sTuF8lPiwAzwrReSUI4whB4j0QUxMOHMV
 P3GWPhmRaZvHDvmIJV7KSQDBnMG7witB1jSjg/GqFmaBdxc6G3Fd09gz0YM7NTzibMycTgZcU
 C6uknonYftRmN8C0oiRFqQukpx9uzBPNQB9iLcH5QqOjgvKzX8iEgwM8I2kgLe1BZw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 08.06.19 15:41, Helge Deller wrote:
> On 08.06.19 14:52, Jeroen Roovers wrote:
>> # modprobe -v ipv6
>> insmod /lib/modules/5.2.0-rc1-JeR/kernel/net/ipv6/ipv6.ko
>> modprobe: ERROR: could not insert 'ipv6': Exec format error
>> dmesg:
>> module ipv6: Unknown relocation: 72
>
> You could try attached untested patch.
> I still wonder why you get R_PARISC_PCREL64 relocations.
> Can you send your .config ?
-> https://dev.gentoo.org/~jer/c8000.config

Thanks!

The R_PARISC_PCREL64 relocations are in the __jump_table section,
so they were introduced by this commit:
parisc: Add static branch and JUMP_LABEL feature
See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D62217beb394e654bbd2bb87c533dadd2d8bf62c6

Jeroen, I think the last patch I sent to you should help...

Helge
