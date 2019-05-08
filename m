Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747C517FFF
	for <lists+linux-parisc@lfdr.de>; Wed,  8 May 2019 20:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbfEHSna (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 May 2019 14:43:30 -0400
Received: from mout.gmx.net ([212.227.15.19]:39693 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728580AbfEHSna (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 May 2019 14:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557341006;
        bh=5woknE0ynSWjSqkRWrtBDKTRFIvphm3rDrSPtB6nJZA=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=ESuw9ruOHji9bmMYWGLYcg4cUohAzFuuipI0OkmYJC6BlB7aD92U0Uhjqaxrux2Wb
         raupG17MqCT0gwasl0m33zD1j79h/vYLkQMaLYq6iSgTEk++OyTLDVfB8YT7hvyKWP
         7lhJfLr67w7vU4R4sHZ+sMSKFJGfA2buXvJ7YfLQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.10]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MIe0O-1hQeSU2AnI-002DK5; Wed, 08
 May 2019 20:43:26 +0200
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
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
Message-ID: <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
Date:   Wed, 8 May 2019 20:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:dwjlgWox8n5eYoK9K9yDudRQuV0FAjsqH+7biSB4SiOVjtmmWGo
 3tjin5PtnrsW6uzRWQGgleMw6AtDtCO9m3/Jg2c6eO+AqnkxpmmGHrTDKt7lv4uIntE1ds0
 uP9Uv2+42MNb8jjVoaIdN/jcyTSwel1FpZMORuJxkhfykuTVn4wDHCEnKiLCA2rJQ8SZ6OS
 P3Lk4TAJGB8iVDuagvAvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IRBzzXhty2Y=:glPjWpbnBnNjg227e/kk8k
 T4AaenedfEEMYlqCt6FEOcGr/3F6aEGL97gZVbMTtzHiEyva2vx3HdYogYKHVj7FpJkKzIJ/G
 BmG1iBeqtr/rqDoCmZBD1DKQJ0VdYep/wuErwgHImWO4GArrhE/GqN1x9bt3HdlpoCCbYTHUd
 pkuy0BzHEX+Ikobh2UDaZH4neCqynggucRdLSoAfnFzT1ElliVls066xrobRytWn9IvHW5OuJ
 5CZeX2c//N+6DNdyRMrLgUaghzPSVuCQXquZITQbb5ulwP5f/6zvaphniPjPQOCwQpKxXMNuJ
 WJ2YQbjLgANFACr8PbbJJeHQPmSWvwYmx0Xnhn0L3rFTfPhi6g6qgqL3IaJxkNoQnY650y6Jc
 35tM31qFWwU7FVO6AJHaGC10egy5WJ8FXvcZt0ZEmfO6oJGzORqcNOlKtqhOGk62u8zQvs+wo
 fvAtL4vcpfd6HVGPKR+Vz5CxZ9p5p+yHpHtIFd57L6bJn8pZnJ0R5FtQ3BKnNwRrz26P8beJc
 Fi2ePZAPK5+UXqd5HWowUEPwtZ7Q2KqgbF9KZ/w2rSAFvazJMl1TDwPozBI2tt2APpE3E7LsJ
 6NBZSwtbn3S+NbrpD5DMXOX4RMnFrbWhifuCPBrVSAl+DwkQlD/6jigx1pM0EVgk2IyFeYOx1
 cB86BmFs5y5SSnikoKZRC+bMI1NmFF0eMSP3TPC4H2zxzYyzypZHwtcey8aGRaa8hcOaM2nvc
 kW4pluuMNIUdOdfR5sZRL/FCUizHCeETG841oC9SzlOGUuGaRZ3TlOD5Pfy9FsZM5J/MDEpvV
 JP/Lso9AvztBliCPTV0ZC+/7PGeK4c/D4xe/Tf3gJBYQAfI8wuUHaWXLpjFeD9tdbzmGg9lcW
 QFjWE5oX55iBuaNPaUO41+C9OP73YIehdrPMKQHlcZChU87//fGufNEkG69XNI
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 08.05.19 16:23, Meelis Roos wrote:
> Just tested v5.1-5445-g80f232121b69 git on A180c, rp2450, rp2470,
> rp3410 and rp3440 and it seems to work everywhere for me.

Great!
Thanks for testing, Meelis!

Helge
