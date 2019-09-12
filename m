Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4C8B107D
	for <lists+linux-parisc@lfdr.de>; Thu, 12 Sep 2019 15:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732287AbfILN54 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 12 Sep 2019 09:57:56 -0400
Received: from mout.gmx.net ([212.227.17.22]:40973 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732286AbfILN54 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 12 Sep 2019 09:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1568296655;
        bh=lCz0qIsGO5YnsccD29MaamdSrOMj4ud33HFJD9xu534=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=l2w5KHY3FA07rFsTX3ymc0O35oTrDyEhV2IM3qSjCEWuxSKkjdglO5EhlOj4L4A0Z
         RZy2htJy1ydaAn2WWgQNOjz4FcDJif46wej0P4BWFs8LlPxScLfU3a9oAchL5s1e7A
         J4CBEDDyvp64iVNlSaqGGZyZ7lEduINqKysmhwF0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.190.232]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfJX-1iOgpU1Ukx-00vAko; Thu, 12
 Sep 2019 15:57:35 +0200
Subject: Re: [PATCH] parisc: Have git ignore generated real2.S and firmware.c
To:     Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org
References: <20190910114514.3f1788df@wim.jer>
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
Message-ID: <933229e3-6e5a-0793-b421-27fc5a0b3c84@gmx.de>
Date:   Thu, 12 Sep 2019 15:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910114514.3f1788df@wim.jer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VGpC9wlGfW1pNzNjT3eWtn/q6xNZ+FsQx7tPPKOW7u4+e7d8O1I
 V6sbjkLhl8FMbDAELZO2GNU+J3KcZ65yaiu3BzO4ss1GAnVjKuaPScuh82ev6SYSGMFaFA1
 VUQZfTbgV5AeqWnR5oV0NhbHhKfG9SxWA/Qnp4GBQr69TMpBsFTQch49uRDrxol6hN2ZzY4
 sAt+kWROd1idQWYuzP03Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zxoWXe2YrvI=:6fo+++8frXFG4oxHo2eBxH
 LMU5LgNNFE5Hp6Wfxgl8evwqIgPgxz3Q4bv71XH+oKmgCNhNiKE9UFCyEoZC7AOgT5KlwCKvE
 0IKtTnJPXjP8wAj5zj6p9Xsf9Q6oUT2vY3eGKgTBEKdxmlg0PtSBYlcny7RtQLBoy5uKE4V5O
 UxI0Uxh2pUXUoZzkZ1hCkR14sXqrfHkp3Yo+sFMRIFEDaZ3kSRfx6iBNqQmFMQbBKCPN0/pkr
 8hJpyv8iJltlRDJ7oqsgsgVGgMKmhgCqkKwit9UNIhEucwseNs3GKId4nNWR6yVdIu/aV+iZs
 U8tzjNElGKEfXf2M4/EEAvOFkalBPMjK4gcXk4vq8dKD2xlSqP6OdXum6fNVP4iDYCfs2CW5F
 uvjIvpK/9cY6rfCdUkxVQr/ShkYJJdbLTNFvr9Le9yVqRw6uYdVPY4yr213VxDlepH79mFvpf
 LxQprtMRTyX6n5xIgwbYVbVXGqyjsaW4k9zP5VZSereakDnT379Vn522vAm4CGUu7gYikHsZg
 Rmv4g0WOxHrYRA+hQlIxUDZp4TIPtkua8vwa1B3e/nuR762sLRI/K3tvaFcamcqTFwtKG1Kf9
 V3KBxoUXX+WiAKFwA5tjIqvquc08xVlw6losp04eI3ihY7Wf5QAfHv+8T7Uk2N7yzIl9RZ2mi
 wwAmjU8o9l7BYsf+UhyXc9asA67ZNSZDhvi5G5+Nl7uOaa7oZdQqz6LCfjfDIikWtKlC8mmIw
 ma//K0KL2XRG+4scx3B/wQp1YjsPxRU5ysfZNcZ56Y1I5STrDQQZHnkxePrk4iwkqHfcFAm9g
 LsRXo11h8pky9PEMifeRJtxX5F2dYqasnbXib3UKSvs/eVaWVJq5Jx6NcaZ+pxB6s9C0639QL
 6SgbpKmHQC/Z8RoeQ9n1sTJlJeVKkLSbZBU9epLk0W6aoc7+yWT90tR80EcvhJx32jBYpEwIH
 aZFbud4cKm94YXcs6iQT2mlbNn2ZtOkNsjLHQrNgwMFAWPCRwyNFEpcTpSS0KrKiYnQ6/42bY
 Uy1xo32fCdVfGqWEPQ5o/mQwv3zZhJgZMUrCD9CTQ90pBPua6t6B4YPeML47/9Rd6a33vNarq
 WNggg1fjp2l5ZjejlzjTYSvpVY1nLyI/CSObw2eLwCX4M06QdcNB4xuW/6Unpb9oCbrBLMv02
 nBQDNCsHr2vJol0vy6+STwn/aYsoYfFaF9qh2Odbal48OofoPzxt3GA7Om4YcP0/hxYkJDgU9
 aZrCl/6d7gU92aCnn3aDGRSBfQGSBI5/1eblqNA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10.09.19 11:45, Jeroen Roovers wrote:
> These files are not covered in globs from any other .gitignore files.
>
> Signed-off-by: Jeroen Roovers <jer@gentoo.org>

Jeroen,

can you please check your mailer? Your patch below is not detected as
patch, neither by git-am, nor by the parisc patchwork at
 https://patchwork.kernel.org/project/linux-parisc/list/
As such, I may have missed your patch...

Anyway, this time I fixed it up manually and applied it to for-next.

Thanks for the patch!
Helge


> ---
>  arch/parisc/boot/compressed/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/parisc/boot/compressed/.gitignore
> b/arch/parisc/boot/compressed/.gitignore index
> ae06b9b4c02f..926cd41c1069 100644 ---
> a/arch/parisc/boot/compressed/.gitignore +++
> b/arch/parisc/boot/compressed/.gitignore @@ -1,3 +1,5 @@
> +firmware.c
> +real2.S
>  sizes.h
>  vmlinux
>  vmlinux.lds
>

