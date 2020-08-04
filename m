Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EAE23BBE5
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Aug 2020 16:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgHDOUU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Aug 2020 10:20:20 -0400
Received: from mout.gmx.net ([212.227.15.19]:60243 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbgHDOUP (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Aug 2020 10:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1596550784;
        bh=GnNZSR2oqdU68wjo9FOfTkxagrr9upiPXyUpa9STJBY=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=Ls/833jZPKv34G9Cap2tTabagieonvgIq4CNoLSGlVMfyT5Vb7JV1X80h/dVCVZqB
         QBcC9MPd/YVpOUaksz6D5EH57n2csoUiY6qZsVbnrwLJTQ2Kn+aLO6/Ab9pnb3lx4P
         lsvsD5Qlkpq7E5eTNz8APSzwzBHlCPfjzKu1DXHY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.144.148]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hvR-1kmMeV2RIl-011luM; Tue, 04
 Aug 2020 16:19:44 +0200
Subject: Re: [PATCH 1/2] parisc: avoid needless empty lines inside register
 dump
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <5385100.WkMxZrnbov@daneel.sf-tec.de>
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
Message-ID: <b0b6d3c4-e42e-83c4-47eb-1020fedc6747@gmx.de>
Date:   Tue, 4 Aug 2020 16:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5385100.WkMxZrnbov@daneel.sf-tec.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g+ERq4S4QGw2Va6wEVhT4dxnXcPEQuKsidFiWAAXWD55xhBpDm8
 qaYjQveds85rYBzenvTH3a5U6SNTzcuxXhJYenn1WWoRDb2bZ6dOZfjYypKXtS4exfnSMG/
 KV3TQQqGjPD8BeDXAVEQjP9VcjMUThQbs/O7DTPDcvWXzJxz3kRH4Al3ZoZEOsGKwql+upf
 9y6h4QZ67ldWlUirt+UyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wmmCooeIMws=:8G9LBeKSaHSVtHcziCA6wR
 LeWakUOm87V+deE2tedRgLqv5UHBDtIJKZ5NiAj3eq26FAJ0C9T22/9LyDYBMnEraOCoLsFPP
 2qthVnZNL9vXyDuicFDOaAWEkCybgz+xQyTA06YLZJ/4/6x/EMGOmi8Z1BJZdIpX0Le6jCokE
 Yq8dMCUeColAldmM6fEHeOOwT7Y1gNg5RK5pga/Bc9xXARQvKeXWNLUSYZDUat/Tg5EcT27W3
 oNaCDklNo/xmXlVrbprVe9wdYiJVtmdyayP+K3GALVCXu5+eb5hdPWEhggHSwkoi1IjMIXWQJ
 wQFKEoAU1sk9KCku21X+82nTJpntXcNU3e9Rjg13W408vzvzS3GsOZ18lG2a5nuWAsDl09ih9
 2Hp34L6vGh/whyOBLpLQEX8HuaB6X0GhoXQZyh9xA75yNpcb4IFvhpLp5k6XjKr4Q8K3oYDwx
 LmeZzAiz5iJpd6UPYJWh/0x9Qes/WUK8DN9Ct/izPTYtUWLI28S/x9e3wg2+La7ezetWqDdLF
 1vFpRIOh0RowQKFsBxzb7t+EUukU4xJ+oK09NxIif5wByqDyV9tV6hzinRaksztHiCaTR2A7t
 rnK3cGBKkS7NgHUevdAZFNYsRMeIpSHtRdYAOfe7VN8kMazBoxbO6XZLBOBN746fuNnV1rQUo
 rHKY7QS91tZ5CIDi0gZuPowluUStLM5WEMqY2lThyx53j//VbAB+JZPtxeYghkUEgaAYYQm7J
 pEzutyFlDdJ6WDG1RLfDv0xDNS9Q0D4ER7iuJoEjZFDd0s5ygqLyPxhgQ4+pqrf68BiQR1nCi
 06YRXIM/AsgYJH/6SwvDBBztUnTcEVidEk2XtyJTIerzueayTm8IMxCg14ViGkKRUbMUW+gub
 cY172lG5eUxTvrNL2buTtPByzxfRJRlClo0Z9h+ukgdGE+NeGfKEbpozQ9YYJRCGUbvN2q6IR
 HlDLQf/MQWq9Mipaxgsrr6OoTppNMTvZfDjpNYMan3FgIJ5M+0K1DKF5NsbhGtfF/fs+FTRgW
 mr8pfjHaMm1TwtKzrq/8wDgyn5HgjdUrbna7eEa1OA/brVZZOoo+U8veNJuAJO8JDqXGg0h+L
 4hTy58ZkE/whMmFUyIe4AxUn9Y9OmcpU6D4pVbpkaIpwOwaUfxGgNXOVMHO/XFbbbL+NTxq84
 HCyNjL1ntFVFmkl69FCXNrhgnyJN6iQ0mmEfj9NkPpMjJ+0K6pgEnWCKzf8CqXRZ5thP8/sB8
 w6QyZ/oEixZXZR8Fv
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 22.06.20 20:51, Rolf Eike Beer wrote:
> Date: Sat, 20 Jun 2020 23:03:51 +0200
>
> Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>

Actually, I like those empty lines, because they mark a barrier
between the general registers vs. float registers vs. backtrace.

That said, I'd prefer to not apply this patch, but if more people
here on the list think it's better to remove those, I'm fine to take it.

Helge


> ---
>  arch/parisc/kernel/traps.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
> index 5400e23a77a1..e6a0bfdf5c26 100644
> --- a/arch/parisc/kernel/traps.c
> +++ b/arch/parisc/kernel/traps.c
> @@ -80,7 +80,6 @@ static void print_gr(char *level, struct pt_regs *regs=
)
>  	int i;
>  	char buf[64];
>
> -	printk("%s\n", level);
>  	printk("%s     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI\n", level);
>  	printbinary(buf, regs->gr[0], 32);
>  	printk("%sPSW: %s %s\n", level, buf, print_tainted());
> @@ -105,11 +104,9 @@ static void print_fr(char *level, struct pt_regs *r=
egs)
>  		      "fldd 0(%1),%%fr0	\n\t"
>  		      : "=3Dm" (s) : "r" (&s) : "r0");
>
> -	printk("%s\n", level);
>  	printk("%s      VZOUICununcqcqcqcqcqcrmunTDVZOUI\n", level);
>  	printbinary(buf, s.sw[0], 32);
> -	printk("%sFPSR: %s\n", level, buf);
> -	printk("%sFPER1: %08x\n", level, s.sw[1]);
> +	printk("%sFPSR: %s FPER1: %08x\n", level, buf, s.sw[1]);
>
>  	/* here we'll print fr0 again, tho it'll be meaningless */
>  	for (i =3D 0; i < 32; i +=3D 4)
> @@ -137,7 +134,6 @@ void show_regs(struct pt_regs *regs)
>
>  	cr30 =3D mfctl(30);
>  	cr31 =3D mfctl(31);
> -	printk("%s\n", level);
>  	printk("%sIASQ: " RFMT " " RFMT " IAOQ: " RFMT " " RFMT "\n",
>  	       level, regs->iasq[0], regs->iasq[1], regs->iaoq[0], regs->iaoq[=
1]);
>  	printk("%s IIR: %08lx    ISR: " RFMT "  IOR: " RFMT "\n",
>

