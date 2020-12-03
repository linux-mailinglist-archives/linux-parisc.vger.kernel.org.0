Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 140E02CD8B5
	for <lists+linux-parisc@lfdr.de>; Thu,  3 Dec 2020 15:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgLCONd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 3 Dec 2020 09:13:33 -0500
Received: from mout.gmx.net ([212.227.17.22]:42843 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726318AbgLCONc (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 3 Dec 2020 09:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1607004718;
        bh=MUkkpILyfgrQfQY976D6recA6bnhmC7kVR/cM3IM/SU=;
        h=X-UI-Sender-Class:Subject:References:To:From:Date:In-Reply-To;
        b=gAzwv53ktylgVKJ0tNNaoK+ZTw/GeV1GLzFw/O8qtuIyK9B8+baUALy6bwbeLXvLR
         Z5T6KY/R1VD5jYkMgk2UoJqqKLhKN/NkRjIofELnqpfQoFSx0gxb4QLz0UGtwTv/b2
         Jta9Vliqy3aujFQQqhX9uARSDhxStUZFAprgD8ik=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.122]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWASY-1kefDA1rJK-00XZlH for
 <linux-parisc@vger.kernel.org>; Thu, 03 Dec 2020 15:11:58 +0100
Subject: Updated installer images 2020-12-02
References: <0a96d4a4-4c72-0b47-0b80-44b6418baa6a@physik.fu-berlin.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 mQINBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABtBxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+iQJRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2ju5Ag0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAGJAjYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLrgzBF3IbakWCSsGAQQB2kcP
 AQEHQNdEF2C6q5MwiI+3akqcRJWo5mN24V3vb3guRJHo8xbFiQKtBBgBCAAgFiEERUSCKCzZ
 ENvvPSX4Pl89BKeiRgMFAl3IbakCGwIAgQkQPl89BKeiRgN2IAQZFggAHRYhBLzpEj4a0p8H
 wEm73vcStRCiOg9fBQJdyG2pAAoJEPcStRCiOg9fto8A/3cti96iIyCLswnSntdzdYl72SjJ
 HnsUYypLPeKEXwCqAQDB69QCjXHPmQ/340v6jONRMH6eLuGOdIBx8D+oBp8+BGLiD/9qu5H/
 eGe0rrmE5lLFRlnm5QqKKi4gKt2WHMEdGi7fXggOTZbuKJA9+DzPxcf9ShuQMJRQDkgzv/VD
 V1fvOdaIMlM1EjMxIS2fyyI+9KZD7WwFYK3VIOsC7PtjOLYHSr7o7vDHNqTle7JYGEPlxuE6
 hjMU7Ew2Ni4SBio8PILVXE+dL/BELp5JzOcMPnOnVsQtNbllIYvXRyX0qkTD6XM2Jbh+xI9P
 xajC+ojJ/cqPYBEALVfgdh6MbA8rx3EOCYj/n8cZ/xfo+wR/zSQ+m9wIhjxI4XfbNz8oGECm
 xeg1uqcyxfHx+N/pdg5Rvw9g+rtlfmTCj8JhNksNr0NcsNXTkaOy++4Wb9lKDAUcRma7TgMk
 Yq21O5RINec5Jo3xeEUfApVwbueBWCtq4bljeXG93iOWMk4cYqsRVsWsDxsplHQfh5xHk2Zf
 GAUYbm/rX36cdDBbaX2+rgvcHDTx9fOXozugEqFQv9oNg3UnXDWyEeiDLTC/0Gei/Jd/YL1p
 XzCscCr+pggvqX7kI33AQsxo1DT19sNYLU5dJ5Qxz1+zdNkB9kK9CcTVFXMYehKueBkk5MaU
 ou0ZH9LCDjtnOKxPuUWstxTXWzsinSpLDIpkP//4fN6asmPo2cSXMXE0iA5WsWAXcK8uZ4jD
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
X-Forwarded-Message-Id: <0a96d4a4-4c72-0b47-0b80-44b6418baa6a@physik.fu-berlin.de>
Message-ID: <7e3b0525-e453-7e8b-38c4-a6ee72e29eed@gmx.de>
Date:   Thu, 3 Dec 2020 15:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0a96d4a4-4c72-0b47-0b80-44b6418baa6a@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U5fS1eoUnh57ayR20xVVCSLM6xS6tN8mWvqUW/DQAPccj92ATs2
 w4dYFdRDb6V6ykXI26D6YRnlxuKS8tGEVzwVMmNzhwU15NnLw4KwDYMzhFt+ELbgSq1gGiK
 kxReZWJUubdxbgG/8XujzegJLrZJF3TolShUqzhD1Gpu6WEQzSlkKfUwrdiKDCvyD8vsbKR
 6MqANUHfgFxaPZJ+qH8fQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3/707SPSrjs=:IZBl29TDasN3WywAFHwoon
 B1rlDxRUTSC0f9WyQFAfgDibbxHjWGE1m0e8sNJQab8Uja3eEJkJ4UZfIid9+snjSTKrQXcCU
 457Lsjcu303H5ckp/rfY+xkcb8IeJvfYQkuPTGF423m4VfiXlaU3Ie/AJ3UclwIE4r+Bnj/XG
 u2gtx0m+8zCKXt32FkwYm7FkLGVwMZBtQ0Z70f2fld1PSAffHprHmqf+T34mz86YtY12UGOVS
 2xXgxzf/ijIb96LLTJ3oLLW0hDara8eJpWDV1G+R7TiC7XTNyJXP2wQ5a3SlxHDAKacL+/NqC
 aR5tjA4sWkvimRG3NKACTTNmgRzwq3CH80WTxFfhTsMrhiUwmM4E/aL26ysOTFFy62QuEj6Fx
 +Gq2/s5pKTgUddtRbKTM9NdUNUnKzFyPuI0+ppaQudNpfLRgVYt9jImuynGtoT/C3TGj1Irvs
 Eqsh0KObbrAmnRYoO2+drk2RR08hxjfd5pkmpvd6F1d1nxgUf1jqe/IiMkvMzVNRI7wkoTYPk
 LUVb65hIZUWKhPcuA1qqsOV0ggrQ26mVrNhT3cZKwb8fqBQoqyeYk0y5KKR3Y1IxqMXfCZebf
 51+W9XWhM8fRbZacs9SosefKw6+5YZZSLOiQ4+JkDrVHQgBardRLXarNQIhCZKTxK9ZKVh/0c
 mwEC95grog6gGvvPNjQD14qX6FeJYfRwjL/17Oltb8Q19y9NILcE9p6HHTlToHQHW+XP0vShI
 lbT9YVuWHJ7en9vRNJPpBxMKneKM1y/LfM91+CSjAXqe++2y9D6ye6k7+MjcOdepMUBr6oD50
 Yn/LHZFyoaXh5eb5PTE5y+p5eCQVlFf7zf9i5Q3/2XVvp0/nJSX9nDijbzeUhizv/CYh6EXPH
 bdDGWk/SINaR9D9MKu9g==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


=2D------- Forwarded Message --------
Subject: Updated installer images 2020-12-02
Resent-Date: Thu,  3 Dec 2020 14:05:23 +0000 (UTC)
Resent-From: debian-hppa@lists.debian.org
Date: Thu, 3 Dec 2020 15:05:08 +0100
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-hppa@lists.debian.org <debian-hppa@lists.debian.org>

Hi!

I uploaded updated Debian installer CD images today.

These come with the latest versions of the kernel and the debian-installer
application as well as various other updates. The images can be found at
the usual location [1] as well as the debian-installer for netboot [2].

Known issues:

- We still don't have support for contrib and non-free, so the images are
  missing non-free firmware. It is planned that the Debian Ports FTP serve=
r
  will be extended to support contrib and non-free but I don't have any
  influence on that as this is up to the Debian Ports FTP maintainers.

So far, I have tested the images on sparc64 only. Please test on the other
architectures and report back.

Thanks,
Adrian

> [1] https://cdimage.debian.org/cdimage/ports/snapshots/2020-12-03/
> [2] https://cdimage.debian.org/cdimage/ports/debian-installer/2020-12-03=
/

=2D-
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

