Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63232976B5
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 20:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S460277AbgJWSPv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 14:15:51 -0400
Received: from mout.gmx.net ([212.227.17.20]:39637 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S370900AbgJWSPu (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 14:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603476935;
        bh=I2hHmlwr/A0rfVZBasfwfLmoGIllKV3KYmCScUTJ8Iw=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=cff9JzxzwP8af4NJsFifSGRqBoBzjzqFpst5uGTRSzCHYe0BHEW5xb/Xrb8V3IqPu
         iqFrXMILg+XDm1OM1c5M9WxwTdmkd+eu1pM6I8CQS7znbVFMMpsLmfgQDcqFmI95BA
         7SI7TntScG8mWpEXv+XOmZgp5dJcZBI+nXN9H3a0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.145.200]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU5b-1jriuC0seB-00eh4n; Fri, 23
 Oct 2020 20:15:35 +0200
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag
 usage
To:     Jeroen Roovers <jer@xs4all.nl>
Cc:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20200829122017.GA3988@ls3530.fritz.box>
 <20201020192101.772bedd5@wim.jer>
 <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
 <20201022173824.49b6b7f5@wim.jer>
 <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
 <20201022164007.GA10653@ls3530.fritz.box>
 <6f58641f-d4d3-ea28-3863-83a227aeff1a@linux.ee>
 <b187505a-2ca1-c385-3b4e-16ae49f5c1ce@gmx.de>
 <20201023090232.3b56d308@wim.jer>
 <20d34af2-7c5b-b9af-b4b7-062e2689c092@gmx.de>
 <20201023105312.5266bce7@wim.jer>
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
Message-ID: <3418756b-ca26-98c1-1bc1-a6cf2caef871@gmx.de>
Date:   Fri, 23 Oct 2020 20:15:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201023105312.5266bce7@wim.jer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:umLMPpRs4Ar2IwYIg+/hAfZcU8JtYfm2HP/TVroLDsqL7MWYiv6
 gbhc521/F/1IEPyzC794Ecj1eb3BGDKDvXbKibSa6255TtGKX0ykaQie/RmHKXf3/fxUT6r
 kjKBvrNEw0ZtmaMhM1QTjLKLUPDlbCQdC5qh9TMQPBkgPFdjFCCG9f7CvbG+Rwz5xyKKDKE
 yVGbql9iHNXsu16kJ2z/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pIKHfwUp0PM=:hjccXp/YQSMxoXUucmrZBh
 +P8dAeEAyhZg0Yb8NV2TDe1ha6qKPMTGp0uLG/NaJfBEfqo4h7h7UqbU1txe3pjJjioNvgTtK
 VA/boc6T0hZ6EP6ocJGpWPfZSA/jZLu12G8W+JfrA9O6+mEEN3JQTf5Th+ywCs3+2MTXqpV3/
 l1kXWf47sp78XhNGRkWT9GyOpV6672QgEo+ullI3AaLDi/ccULtlXYYETzESlki9MUBO7UTex
 l00sAh6Cmaix8DbRzrX6mvBtIqWgcjw6uaxCBpNHM9mAi0/UZJy4SyetZr5hliwB55EGjEkIE
 gTZITNRBkMHLnPQUyD24O9TOUfFOp8aGW+D8XHC5c9OMC7rPqHx9xfg9De+xicOKErNYfKPFu
 bogVoApQ9QkrwHMiH/GiFmigP17+VNnzVvuaxeuLL8TILMkD0qG/xN/A+o8D01pWXyyiQorcH
 oX7EPd/lruq1PNUDqIN/nBMPpqqY2h+IoUj9ojhPGxZXRS/oUAiyx5WZbfHday6WclxCbh/jF
 oeVMU0UI04ANKsQhrGStPCJAEIAXo9o8KnzYEsBKKniAnENBAaY0uSWhdBZ82LPgWlmxcADge
 qRmywFZgT5t/6z1fUF+9nEVzTTq5jkoAtTxsaPWtKWLKqksunkU29t9yNWhTRIrwVqcQsYTtY
 k7rZLr9fW1hluN3bu2X8VgDQ2/iWPZl0uV5qjun38AHwEQcxvSEuhsQnNNqZ6+FZuC6Q3PEqZ
 RCpPcnBHL9HgdQhfuJlPd6Ka/xDF3QtoiJOaNK9PY7moQNWoRPiPD9Q3zN5PmNHv3yyQIcp+o
 bbE18H4pD+YsMQ80LQ8tpRzCTGPjDQX0jXjRz/Vvg8PP5fUuoyfm7iIFwoibpTz1zDemvcyw0
 sZ4sw1eUNBJvbwm9ExNw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/23/20 10:53 AM, Jeroen Roovers wrote:
> On Fri, 23 Oct 2020 10:35:34 +0200
> Helge Deller <deller@gmx.de> wrote:
>
>> I think it makes sense to keep at least one warning.
>> Rolf Eike proposed a pr_warn_once() which seems the best compromise
>> as it keeps us at least informed which packages needs updating and
>> how relevant it is to keep those wrappers....
>
> I agree that if we are to keep the warning, pr_warn_once is a better
> choice.
>
> In the rpc.idmapd strace I still see
>
> 4635  inotify_init1(IN_NONBLOCK)        =3D -1 EINVAL (Invalid argument)
>
> so maybe you want to wrap around inotify_init1 as well?

Done.
Added in the new patch version.

Helge
