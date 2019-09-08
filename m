Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E012ACF10
	for <lists+linux-parisc@lfdr.de>; Sun,  8 Sep 2019 15:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbfIHNpm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 8 Sep 2019 09:45:42 -0400
Received: from mout.gmx.net ([212.227.15.15]:56441 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728254AbfIHNpl (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 8 Sep 2019 09:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1567950340;
        bh=dXZYLta2KvBbU87In2b7Bv0eKeBfYvl2pOV7kv05km8=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=B13g1rDrHws+yW5x2mKbjwVfTmvvx18RkXMETqHKDolsDirw6Z0eTs7/s3iUo0+qy
         NP+R4sta5+Mnv4bu2GwIlziM124vPInGkz5Sy9u0i8JHUtBVIgJIn5fvevtG3s4ybR
         Ew5y6IGnUcX/r64bKHM5jAevb+UiSjc3D84DCeH0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.33]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MexFh-1hmyt83iNl-00OWOK; Sun, 08
 Sep 2019 15:45:39 +0200
Subject: Re: [PATCH 0/4] kexec support for PARISC
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20190908093306.31455-1-svens@stackframe.org>
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
Message-ID: <f3d33f11-494e-b69d-cc0f-24c3d5ed4f93@gmx.de>
Date:   Sun, 8 Sep 2019 15:45:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190908093306.31455-1-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2ncHeaKMpISful4I7NTdZTWu82WFDS3PSAp+gfz+D8BU571zygZ
 age3BHiit4Ktf7JeBHfmZNCw3RLf7TLWwYNUS9G8NqaapPWXnEW9fQGbmIp+qkTLoU34NAI
 1AztTISPnQ28SCAgqeSB0QeL2CAZA8lV8oyvp5TdkBrYg5BcyUnqaft5a3az0sWUQDMRsoy
 1pjB6iy6l2QzIZEsNoTNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:641W1VC1eUE=:eoVoK92qDax68jN+txf2f8
 qGeCvLTqjqaCwAPww6dY/19QHlM9RbjYN2N2/Dw1MJj9woh20x64j8QFZZvUygjdwuWolviaF
 IhVXZuafYLqFYTX39lvrLNWekCeD7ebLsg6HvOGOx7aoYi0Wn00MOJmnqKUHnRcWyp6F0EObd
 aml34QmccIQo+F+GO/e0WZLS5LheNSgL1NzCVlj5YBcjNKWBcyVcEOIEHjB1ulIyOBVubxmDw
 9LNTonGHfY7bzWr7HEeEl9vLYdtsx0YM6FUlAv/aoXzARYrZZEdf8dDjaDEyiJNGEbhXAPvhA
 CYa8qn0XigjSxLSaVBwQp6S1KhIxOSZiX/0hxnliKGWrEWCp7SMqFYZIjNOAQJ3lNRQ0oUjpM
 nAO7887byncZY7OZ+jOe9dO6sLLmJWHAYLyyfbO5h+HQJTzUgiYPQF9U7QRZqmVGV6q++GLAo
 rSDNCzBjx5aK27NmmKb8psi6vsv9vvBVYCWtdtpyiCeNosGgshF+KMWnOjCTonFjU/xHqrvls
 KBK7iCacWidhXXlwyKHV8VtdKJc7L4Iq3FHHShZu7LZwQtoYYlXtOJRB3NQ76bmfOamqCnHQK
 vJ1NrY7aqGsdtxWSglUZFy+GVJQdqQ1ZyKCIInaf6z6ujL4WA129bQJhKwLWWIKIKddiKcDro
 HxskomIEqH6frm7j0jEW97b0jQTtW6LdecbZEtrbfoyxy51aYTMVEJMj8v/uvtPCe8RQ4GQmE
 4+r0lsQPNFvjzW4fzOpCLalBPELhzYtzf0lpCHDbCi9QsalhRv7xdhZDQ3FuA5sLwJL40/Smm
 xgR2BjIJ1FB2J8B2PDnf1iS6Rk58byN1mwQ4ZcTXil2zCsFdpXCxY5OsWk+WUxRIFjdCpV6DO
 b11oTUmlq6qD0FBfBkCwpvdrHowKp7Zn8TfCDuw6VS6uoCNG+dy8uv49dxnk2h5BIhzqUZ6zO
 /CRtpnA/Qc797HM2FhcLI/FvH7rr+in+f83FX1BsE+RLzLtEmtJf7N78lTEZE9ducI65apvaA
 0UDgK57nyOKFw0ND6mMYB7nMZWheAi12G5acgRq3sU+SVsibLBFVwrjjyWehYTZZN/R3WdVo+
 7coTLMYvgRfDINtICV8vK4EGvPtU3wBXOOFcNN7ZTmBZ3j20YueXJZ/2iTZMb+QA125ToOZR6
 D49+SCJlsrIqKlNeapvbyllTBGoDaQc7RNuPHrZjCpRkn7nlfaz+WgGK4v5KU9Z1r52kg=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 08.09.19 11:33, Sven Schnelle wrote:
> this series adds support for the kexec syscalls to the PARISC architectu=
re.
> Note that kexec() on PA8800/PA8900 doesn't work yet as i haven't figured
> out how to restart the CPUs on these systems.
>
> For testing you can use my patched kexec-tools:
>
> https://git.stackframe.org/cgit/kexec-tools/log/
>
> I will submit these patches as soon as kexec is merged into the linux
> kernel.


Thanks!
Patch series applied to the parisc for-next tree:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/lo=
g/?h=3Dfor-next

Helge

>
> Thanks,
> Sven
>
> Sven Schnelle (4):
>   parisc: add __pdc_cpu_rendezvous()
>   parisc: add kexec syscall support
>   parisc: wire up kexec_file_load syscall
>   parisc: add support for kexec_file_load() syscall
>
>  arch/parisc/Kconfig                     |  23 ++++
>  arch/parisc/include/asm/fixmap.h        |   1 +
>  arch/parisc/include/asm/kexec.h         |  37 ++++++
>  arch/parisc/include/asm/pdc.h           |   1 +
>  arch/parisc/kernel/Makefile             |   2 +
>  arch/parisc/kernel/firmware.c           |  13 +++
>  arch/parisc/kernel/kexec.c              | 109 +++++++++++++++++
>  arch/parisc/kernel/kexec_file.c         |  86 ++++++++++++++
>  arch/parisc/kernel/relocate_kernel.S    | 149 ++++++++++++++++++++++++
>  arch/parisc/kernel/smp.c                |   1 +
>  arch/parisc/kernel/syscalls/syscall.tbl |   3 +-
>  include/uapi/linux/kexec.h              |   1 +
>  12 files changed, 425 insertions(+), 1 deletion(-)
>  create mode 100644 arch/parisc/include/asm/kexec.h
>  create mode 100644 arch/parisc/kernel/kexec.c
>  create mode 100644 arch/parisc/kernel/kexec_file.c
>  create mode 100644 arch/parisc/kernel/relocate_kernel.S
>

