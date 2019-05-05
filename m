Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248A5142AD
	for <lists+linux-parisc@lfdr.de>; Mon,  6 May 2019 00:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfEEWHt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 May 2019 18:07:49 -0400
Received: from mout.gmx.net ([212.227.15.15]:52043 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbfEEWHt (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 May 2019 18:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557094062;
        bh=ejDEaGAqzEhULCj1nCjPs6SKez74UVvksk///Y0ann0=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=fH6xu6KwomKICpdWkUxjIWSUlPMSJoh/UFYz+mpk5K901Z+X7ZIeMLETUZCgj1neD
         v6kme8PQ+RDdTK1+vW1oSjn9UYnsV4ip/rTSVmZU6ngJCBy+FoxomXaavuNN48WEmG
         fodoO+U1PNkTdY11COOqjBjM+pnyDoh8h1ETajcI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.88]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M6BKc-1gYIiK2Z9m-00yBRk; Mon, 06
 May 2019 00:07:42 +0200
Subject: Re: [PATCH] Rename LEVEL to PA_ASM_LEVEL to avoid name clash with
 DRBD code
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190505215434.GA25118@ls3530.dellerweb.de>
 <eb66a85f-f5e7-d9ee-4a8d-8cd2759fb9f6@bell.net>
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
Message-ID: <cf0af76b-34d5-4299-53be-46aa7b8c2372@gmx.de>
Date:   Mon, 6 May 2019 00:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <eb66a85f-f5e7-d9ee-4a8d-8cd2759fb9f6@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:2zkXmK1ooE+1FULCwzeqBs2bO4xShY+008YaONqtJMoxD+izRKJ
 Sp+UYRq3ZWG5Oy5S+5z2hFT3GJteprsiQydYcKIgmNZ32kj8tBvIDLVW4TG5fi7U/Lq7Pj5
 HnyHZXaK1cYp93oRfjmeQLWkZVultyH0MB2gTm4b8pkdPw6aWXZfwFtZOqMb3sZM7IDvEVl
 2/VU6P7LXjciJXsQWfXfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fPV+/8rkMQ4=:EQMONkQdnMydgxfneMwQTo
 qRzcIwV6besDlD064ni/e6hNhRL3XOk7075mxUCFv/ELCYreoAVf/ATNI35iD5IXyxZWqg9Ad
 0Ry0KpHcuFnU4qc/tQGSxvNgZ+6oHe5IwzEhPmyvBekJy/yvM5eiUqA3AHQDKsxiXPPZ3X1ze
 zAJ9HoUGRT2IuOSJKROVKsn5jGfjxpzjLXuEckAp39mRx3+q1iPHkUas02K6NJFNq5/Q5gOwv
 wSySBicmzvUCfQFg3Ch8E4iX4Vj82bmZ9lHctxDpCmHZRyChi0vzncXoPh7ZOZ+GvRsBtiDdU
 0c8O7gJttT4w8eW/kHMHfksB4lYUenj6bdV6NLZd+oJGUtmBiFPG3/8dr/9sy7dpJ2RkLSJ94
 Vk58D0YFNroELEimul+baLTPrErn5uLa9V/M210rRB7oaaFaJ0HBxTYEcF3QY906vpKrwk4iX
 060YjF9Hd8CD9xT6k+IWz9fpIZ/n6JMjJA+TBpb4pSTe6mn2SUqu9ZFBxZxu34XWcqAT+pkeZ
 t8byYtvkGRNJ4gN0YMT3u24JuH0Ozu/w3cnBGrn0tMpZpQwl83KxM6rOFZiaUnmNkXSdnx8kA
 ZnHldAP3qBp7ZaCtZhnnprO52C74NZ3zZN1lXliIry/7oywFxjylhCWBqd/K6Qytiswxux5yU
 qY9NtxjCleqcRsrIMgJDtkzbmaJrT4025Baic7JbUA0MU/sbD7Yc4R40i9O/LdhOSitqB7OR1
 rAHa2a3Cg8fbsbaeCT/prDxb3xSIvEz6KjO//06x3C8IhmQRy2DBfnpQEg/GsMlnZLAfUV2vS
 aLADmjKu1TSrw5D/UWenhdr/fYoXRjes0M67G5QOyyq8WpAGlFMrNKy7OVFlZIS/ph4Z5dhVu
 gSO+lTjOT8AFJGxvEoOH2CBxrqOwdTPaUyQOnJ00FHpO3w94nqq3ClUt4LS8MH
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 06.05.19 00:03, John David Anglin wrote:
> On 2019-05-05 5:54 p.m., Helge Deller wrote:
>> LEVEL is a very common word, and now after many years it suddenly
>> clashed with another LEVEL define in the DRBD code.
>> Rename it to PA_ASM_LEVEL instead.

> I'm sure we used it first ;-)

Yes, we did.
LEVEL is #defined in both:
- drivers/block/drbd/drbd_vli.h (since year 2009)
- arch/parisc/include/asm/assembly.h (*earlier* than year 2005).

Helge
