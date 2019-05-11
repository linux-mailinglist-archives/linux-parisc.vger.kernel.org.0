Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5539D1A849
	for <lists+linux-parisc@lfdr.de>; Sat, 11 May 2019 17:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbfEKPn2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 11 May 2019 11:43:28 -0400
Received: from mout.gmx.net ([212.227.17.21]:50065 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727017AbfEKPn2 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 11 May 2019 11:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557589404;
        bh=K4xjLc+zwRBID94Y74f7EhNJMBZ3aQNfDQFZThoTPDg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=XNr0q8+iw4UU6o+Uff6P3o2Vq07TRvGYBBCG9ryJjQ3vmxpf12pCghfKupwvcqFUN
         LoCDMyzK1rCaFvHOh9nysKVzWSw27f8FKToAFSqMUT15sJt33wuuMN9+6lzZ1qwGCl
         /e0+nPWOrmCz2AKS1z/5tZvVKaAFjoNXPRYMOqyo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.179.253]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mn2WF-1gxXKt09hP-00kAoj; Sat, 11
 May 2019 17:43:24 +0200
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     John David Anglin <dave.anglin@bell.net>,
        Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
 <CA+QBN9Cuf+O8uKbdhPkfAdpP0YThM4FBkHJV-DdRPYe2M146aQ@mail.gmail.com>
 <dd0ba2b8-4267-9e84-6712-6e6463bd496b@gmx.de>
 <3f99216a-a653-3552-a347-9c645d274b98@bell.net>
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
Message-ID: <ac66dab9-6686-c03c-603b-eda4ce0e3e4f@gmx.de>
Date:   Sat, 11 May 2019 17:43:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3f99216a-a653-3552-a347-9c645d274b98@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Hyv+uqMss0nIJoGbZ/Q2Sacwu+s6EeJtFItgXOqUu6Pdl8oysGS
 bMhlAd36m1SXbjEtO6afjTrcNG49jrdZTH7CoONJPDj1e7fVu7K1BLBqGVcb8QXG9dcQgHC
 NW7F6tDfx/+cifOCHwn4oyGXwxHjdb42nBeydz/VZeIgWwuFPA1afR/uXdETJ+A3O/PoKfk
 FRByf/ZqWRPiFSUvsevPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TUzvY3AbeMc=:Z6PZjLadiJY34b/n9stPlX
 Y16/vFF9/kJyPPP8eIe/K0ndlDTqYpRX/CpfFiezD85o5MhJjQRYGNh796qI3SJh2RJdRrSpU
 PYq9u4pxPUmO4pvbreclC8UuRPcgGkkHQ8BagM9lxxI7uyXpz/wRo7f7ZSRzlg6xaYWT5e9o/
 J/tNnikEmjTHjfmt2dh8QPKCEovF5rZ0vxc2v34YeTprSeRtFH6MeXLRNn/sjKKqLsW06OfUC
 zVFP5HQHErlA1GdSL+oVYLRH5lNSRgUZ4e6YYQ3rJ9UxtK4zmTDFjnv1EU/2HFT1dJfJcAQHa
 oWfOYOQF7spvH0VIWiZZcH/Xm77IcQn3dEKb8+WRf6qr2PgRAgrrr5LLOnZr+ohx7bUNw+Z44
 eznquAbd2krQbJKW/473Il+VyynwdAppgpmqFc6n/dTdeV5S4eMfHJ56OCG6+5+JHkS0dqb/F
 LS5ND5ul/5gClfqCV9q0ejN0JWTMHWDAqYRTmkB/Xe2OeBSQCDVWffETlJLmOPAibhctdfXWa
 rrmbEDHmyQ8o6JuT3oMEOL7wSxREG2cEHQ3JeqdZ7K7MwZ6eN8V94tN/8A1XjY5OxMm0bNMGl
 pLXEclUxGoZjxDOU2HFrUZtmIuqZGgiByu36DpAS2i0PE1KgIZ3VdzMMCPEXN/taw0gnaPwf9
 aXKnO7/e8EniL61LLfFpgsIzFwUkj5rbNmTaSStc09nqJiDGMPIJT3J/oZF61/y6IOTXkGFcP
 ZDBYiVLCeGSxgrVN/5YA0e8NCtG/CNhm9OLZGIulzFfbKgsVQUQeV8y1jyhJUGtaQLls9DWDh
 uuE5xo0rv2aFKB67s0GjeJcbn+H8/bJzcJi9ZqGJibs2QR1Zxe03VXk7aF2ZJa00sBaNpVglq
 26kGfQE/lVobNmdBrQnVD4gLtxa/iH+4ZkW8EUGKxkvIvExiE6Y6CZX8sflpGkOFPYB238ThM
 TpArFL0GYlGMuhhtS0Qf5aXJIWURWob3Ir5qie/q+Pd9y1nTaT0fCFi6nCUX/RpyxzjFoGFpQ
 Kde1fGpVgIB9MhHBy1WcLR0=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11.05.19 17:27, John David Anglin wrote:
> On 2019-05-11 6:47 a.m., Helge Deller wrote:
>>> I am testing a few sata controllers, see here
>>> http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&p=1563
>> In one of our buildds we use a
>> Silicon Image, Inc. SiI 3112 Serial ATA Controller (rev 02)
>> PCI card.
> This Syba card also works:
> 00:01.0 RAID bus controller: Silicon Image, Inc. SiI 3124 PCI-X Serial ATA Controller (rev 02)

I've added both to a new Wiki section "SATA Controllers":
https://parisc.wiki.kernel.org/index.php/Hardware_support

Helge
