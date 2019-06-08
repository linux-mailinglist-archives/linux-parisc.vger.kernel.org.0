Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A701839FFA
	for <lists+linux-parisc@lfdr.de>; Sat,  8 Jun 2019 15:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfFHNly (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 8 Jun 2019 09:41:54 -0400
Received: from mout.gmx.net ([212.227.17.21]:42779 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfFHNlx (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Jun 2019 09:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1560001306;
        bh=k7x/4zp5ARJ9Le7Dort9Y4E78k6i/6XoL9O7rVjiiH4=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=F8RT7LNTvfE94JlyCIMc+EnEFdONz+Vf5n69t+eD+3/WywjUJ0ggry5yqhl60Auqr
         yzyUM0Nw3pG3U/3TKSph0x9FeR69yLEatJRlHMmyTXJ76SslXTOaySuWcj+rNUkv/e
         IGpN2JvQxZqW2IEQm/LbtvUnfTd19LeHk+1tBPKo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.248]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LnPnu-1guCIu2sO6-00hcod; Sat, 08
 Jun 2019 15:41:46 +0200
Subject: Re: [RESEND V2] modprobe: ERROR: could not insert 'ipv6': Exec format
 error / module ipv6: Unknown relocation: 72
To:     Jeroen Roovers <jer@gentoo.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     hppa@gentoo.org
References: <20190608145201.56c667f5@wim.jer>
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
Message-ID: <f3b34093-1b01-f321-3b98-6708cdc25434@gmx.de>
Date:   Sat, 8 Jun 2019 15:41:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190608145201.56c667f5@wim.jer>
Content-Type: multipart/mixed;
 boundary="------------601799566D79CE0DBB2E6E56"
Content-Language: en-US
X-Provags-ID: V03:K1:zZTgsM+I+6POeAEAzk+zOd+SRof/JyX+hFAALhTI77d4WdnR8ty
 N6SMslnf3Rp00hqxU+Noyrasu2Vd35SiXWUrFdwb2ziYLcqCOJxq4JX41SspQTWCXVsje+L
 uF1YlfbuUG3/SxBcXLvSSrPG4/CkfMOQ8dbLFZafgOZstIWEwuc/drF1t3GZr6SmUyUUVrK
 uJRlCh6WUgGJ1CuEQ394g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7KafrBOhEtE=:zeb2UWrzYw5sScaAR9DsYM
 eTWlmQeya2Xhje5Wz38iRts5WIBf0yy49MFhS2+M7NYNgOuRNYbv38OnXGXH9uvrVpswPzrIg
 /TajAJgPBHRoC7etlUvunJCOcL9V4hAYQsHCra8T0CRsenj7iWMQL3TvcJL7bcLdF/pMMLms8
 PIW0TbQMWa2wcxc6cmjSOgvqF9N8sPwvQOj1aAaHhN9dNHv/vfA1I0HW+1mmlG3IfMauUCgVi
 Lak3aJm6kS8FHCsclXKiG/lZ9mU96CxTj8sQkk6OPuIdy3DBqsejqJ68xmY3ICMbQZayJC/8D
 qOkRucOeEpcV9herj3LKZbpNmaHcetqmuQfv3S86XUaPFooH1RBURlzm4Ok9+O8dHdptJCbVN
 IuS02J3lMHkWwYL1Bm6j0BtNvvFdc7ufK7H5+JNZgY6bLysvJgrkXlkh9zE/ZUlct+/88+8Pl
 HO1A7kZSj++B8k0fvnCSMshaBD9lSb/j1eYtkLNbwHjhpaCdI6arQVhWXlmtw4PJgvccIO2qg
 hKABUBKAt4QMuePIV8PgjCsid5QiIqgTlcN16h/v5jshWvVJt/gVwo3TiAMi/PFGzbDJYRIsD
 QbmHUjZcrz5UGEWoe+jQAZKvaLDB+ui6r4/iWrd6avqJgsQVVSRDZKzQIn78WJuo4NCsOcN4w
 C+t0u7H+wPsavhXhQ7iTXihyVPcGEnsukLyxIh5bDlAqUrUYGxbFEGbjW2SEhcGWmp3aI5DpV
 7uyVp/dp1B++s/rvm4uOjw8VH0xkSHotAvnhMl1VkXPfJGB54kzuUIUB7p+2fjwI+3nKXKjta
 8xW4wkWGvc1QbXzMMZfqO2qolsqT4IDRB4nUzvOBCgbBGCflK3S4lGmJdi7sf7AAykQ7/LLAw
 VQIaUf+Iv7OmVqh70bwAcbrCeMHFTA/m+FFOJqfUBJREArl2QdK/iSm+I/7IiQm2XknLgOelj
 uFjNbh4l0io7IKDOtlTHAhK4Lc9eBAWM=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is a multi-part message in MIME format.
--------------601799566D79CE0DBB2E6E56
Content-Type: text/plain; charset=utf-8

On 08.06.19 14:52, Jeroen Roovers wrote:
> # modprobe -v ipv6
> insmod /lib/modules/5.2.0-rc1-JeR/kernel/net/ipv6/ipv6.ko
> modprobe: ERROR: could not insert 'ipv6': Exec format error
> dmesg:
> module ipv6: Unknown relocation: 72

You could try attached untested patch.
I still wonder why you get R_PARISC_PCREL64 relocations.
Can you send your .config ?

Helge

--------------601799566D79CE0DBB2E6E56
Content-Type: text/x-patch;
 name="pcrel64.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pcrel64.patch"

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index eab964a8bf4b..ac5f34993b53 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -780,6 +780,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			/* 32-bit PC relative address */
 			*loc =3D val - dot - 8 + addend;
 			break;
+		case R_PARISC_PCREL64:
+			/* 64-bit PC relative address */
+			*loc64 =3D val - dot - 8 + addend;
+			break;
 		case R_PARISC_DIR64:
 			/* 64-bit effective address */
 			*loc64 =3D val + addend;

--------------601799566D79CE0DBB2E6E56--
