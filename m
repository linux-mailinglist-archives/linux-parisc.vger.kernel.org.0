Return-Path: <linux-parisc+bounces-4307-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA3FC7BB6F
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Nov 2025 22:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 61D6535E7A9
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Nov 2025 21:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF662A944;
	Fri, 21 Nov 2025 21:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="J4e1PU4e"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DA63FFD
	for <linux-parisc@vger.kernel.org>; Fri, 21 Nov 2025 21:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763759133; cv=none; b=Cg/7PgTFBUF/FWyGvRZUdtrytXt97YFLKJ84MxHlY3JWeypTmOoGllW5bo9nurh6N2rWtTQiZLO+gSyq5RkRlTe0wjbjJP/p6yI1DVXL3ajsX+VFzG2cVvKQ0io0g79Jscq5x9PERjoCfKk8/UOXfsf4LREK4rDcsfFqbXob6Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763759133; c=relaxed/simple;
	bh=b7WzDDSglZLmH0oqMxTCjpbeB04BNNmzxG7qxT0c9JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jzGYNWG9JWuxu63PcUSbjERYFMDxirzyf2XdS/j2wWj1ycg0Q5RiNE1uj5nGVT7EZtqlUGArF/M/7gkFs+mpWxD/mVSUiuvtPb5SgzXPGH590BQR6hr4VM4fLiPoVd9WI+0dgHsWh5icodohih5GR0KlY3aWLTy5bKeFw1Rokl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=J4e1PU4e; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763759121; x=1764363921; i=deller@gmx.de;
	bh=PeTlfcM+QppadPxpWEvuTFvs84X34cBUt/H7r4Iysfg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J4e1PU4ellVXipD8KPZQzety2Sf9evnVek46/s+cnwwhMWPrssFUqwaL1VJxnxZx
	 FVKtK3O/DX5gcbeiDMsLNcClEp//7QZp99PMxpqOfZ7cg1DWdrR+//q08QNXvPDKy
	 jO41StqslO/GoIDJHpjiuWPD/HMJqCNIfd2scTW/V6YME6+pmqQARWRsqh5IakGgt
	 aZB7eVXN6bRNQdeU784jo4DCCYOQLeXEtrlyB/iuqQjCZPwtyI5pBU+HZTdeFiegt
	 LJxu/PyiSi82l2kb1RpMvc/VbNwNcxfon824O8lfrFRJTlLRIOWZoAdSycyy9wRT5
	 ouEqc+FAiEVo5zJkqw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.198]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1vyuwX1dKW-00ajNL; Fri, 21
 Nov 2025 22:05:21 +0100
Message-ID: <092acd39-3783-4f33-a26d-e6b4f8dfdf1a@gmx.de>
Date: Fri, 21 Nov 2025 22:05:20 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PIDFD_GET_INFO
To: John David Anglin <dave.anglin@bell.net>,
 linux-parisc <linux-parisc@vger.kernel.org>,
 Christian Brauner <brauner@kernel.org>
References: <2380a8de-5284-49f3-8155-f7fb9496b422@bell.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <2380a8de-5284-49f3-8155-f7fb9496b422@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m55o6AhtKKXF8PbKnUncUVuIV5r245MiOambdlsl9E8LN+7vJ6S
 ZDvjPmz/JSkM/XrPhO7FRas/iurfuOBWeJTfGnDnFFOblf6TepRi9mQZNKCAYSKYBhIJklr
 BANo436ou/D1KCXhSlgtkWgNmHtwp8Woi5NfD1ccPp6/r2JPaTZwm8H+R6eD9kPvp4dEwFk
 yayx358DAd+ogeG7GHNiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VY/3Kql2hus=;Ko7e5xY9FEhz+M50owAp74tPljQ
 dwkRjPikEaz+KD3OtEWuxpL7tll46GXp3Ri7hOTg8CeKhUI/occdWnLsY9tQJKuIfdHrV/9V4
 Qz2LZHUUYiMJ7stKI2RDh21ljJZoD7OsIvFTL/YkAc+grM7ox0PWTqxtVlarlRqWRgXpJtBfo
 bjbp/zOoo1lIwSQN5Yf7CpauV6QZx35ilMX/50YreWiA5Yt5bc8xNb6mfG0BEyPUHLA8SdfEc
 UpHGLIxC8kxVe+Nyd7XfdVHgp26kSv3oLRMTmf2wX2LJCFUf5QKP+P3X42IGe0uLqvU7cDtzE
 XeUdE4iSl+VMFmPkFA3DHvCkLwJRdX9+QknWk/HYT7mcEjg0NxXG4WgSswDhgGD17rfLmOqtz
 JxUcL3GIxHHVbn9HyY4jnam7TqvBez8O3UQrYHLgy5Ds5aShLHm0P834juUW42AG8uQWty+re
 CeB32FJAPglbiJ/AMo4cg18oni5Y7VYZnYSLrVxz9X+xbyUaB44nZs36VblfPjZRysiQEICqO
 itl5gTiLOUUkCQ8+XEujwNkVLGxtCJWe6MUQytzaq7LCbGJR3kbcGdFNK+PS5Q9X1T0BqdrwN
 cpfzBfHBisy99wSeNlmam+6BUITX/JL5hzMs4fPgfG1crNpsW6lHMVOnwR9fLyUjOq1PB7xi4
 PbV7cwTiwYMJjyh0T9dFOEfnDhFee/xvR94gxvun8s7Pw3e1lwt+5gLU6ZG5kszAUd0sFywJW
 K86TdvkVsqWNl13mdioyq9HbIQPAulgOiURXNOSe8l0VjhR+sqRnKc85DaFUZFiqrzsLBMb2w
 dv0DMIX+0WXWwX1MKgjlTqZC8ZX8hu2p3N6TdiH8z8isv/u9FXK5Ro1T0qll5N9bH6NBpKBQ+
 jnr/Y3RMyq7LzrelJaUsMQDN9563XdynNI4pCdrPq30VFw4DBAGY8mA1MwvJfP+xdwhHmsfLl
 GAOL0vydo6frsndHBG9Tjj6+/qCtdmAkiiums3UH7VxYgf4HVuPe+QUVFSWAJMC2ELGBnxA+r
 GE8lfGzRAqholaDmLSLEzdj+lbHaKDi5CRGnMr/MrL5xMdnMUKF/muDax9BTnq4F7tDkjPL8u
 AOQnc/tpqGIB8WkLbd8I4UUKBlkQ5oJSvQ/bXZcS6q00X+IDPWZJNdpn7Ec5CaHG9OYScASMI
 BnL+tG9HeNhG/kEVEOq/VPvZple+5sB7NwPW8CQS0xvdNUEJVKlmat4CSskpz6KLFlLv1LppJ
 v4156nJfuufK9LJyn16t8+CWQoYkvhsuyos/VQqZaGHd93qGFRpQjrtuJU/2qrI+NhZ6PbEdW
 CjpudE4hBe+1ldbDtCbfQcNJVJLhIjSHYsXNwZ6JEE1EwinUw5YhcWVpwpj8MkpQsd8DlvZ9w
 zHW/rhjvybT0cxmIbRcss8DJWc86C7NZQtX9s3vvGnZQsOhteo8hZ8lMTJ/i7Rm6a3/b86JYj
 FkhVy++6+yVWbdhRAMlgYBuKOJNXzDrIy1y7rrjeD+NfTHtHsVxMc9y21JrIn9yn5A3d22tQ7
 v1s9j+FmMWFT2qBuu9bJ4qgXjV7soGmnO5D6jGEJnzUXQ2clee63/USgP5jUHsnbg3FFnUVFr
 wFjnx5sDg+MbMFCbCLbKTKOkWIDTC1u3JF++FQGybMKWm1vTX2mvFAzM7kI6Xn9oBc/+LgheJ
 VwX2L5fDYY5H/mBLduvEkuzC3M2vsZQ6rCJCVi69tjvIg/bowa1TDEvakm/xI527TErgQhNKm
 EbKrfz+m1MHIUX16EQm/dE0yGkGPY/+7y/i+26lKTPbpZp7VwBa1+afi0Z/djGbtosrm2ATL8
 gAEhA1BXGpSKC1YItHjjEDDRhvkwqpYb6zqWZvEwmsFtLNY8wNEOJdIuQCvgHqi1cKZo/tH1f
 DadNMs/kM4iQRwVDNtWvfc/mW2RTNlGecE+g7M5+05b1/8gv6Ob7SK8ZiFyUiwJT5l32N/Ad6
 RpfvfSAei9UcWaZrb4SubEcCttMDlyWE8mtlUK9AF9A7/GTnDJycHzBIeDCuxRiQdCHLln8hY
 XsV4S1AWXhazqRGdNiyRsYXPi3aDWCMLfjUKJbblB5YECVejKJD3kNaL3By145IzW0M7xI99e
 XHGE0xcUEpg9QsGz/tjRIfy1IPd75JMymr9MDg4FtmnG8dJzdZHaMkQWdJ5W5uGXWbiEqLiYN
 OF9+Wyl9Q00E4v21Q65HN+tLKZYDgDI8rrDjhuQieIoLkQmmn2VtDngqzi2+59pIy2Y6YOUHs
 SPPea0TJGwh4jGMzI90IeHtPjACTTazJHBryxKFjm8qJPJ9Yi08F06X19iWbJje7F/b4ixldO
 Nw5Pixlp2eHsmN4DkxYBEPo8vZNeE5RwrMqU9jlertpNjYycXmgB673f/QPrdDn0pOoxj/64v
 uN8O3JayYp/cCDaxN3PZxRF2/9XPyWdZR5lvLmqqM/SYiKojKwWQN1ztbZsFFfaMIZPJdPJOp
 ZAbEHyWUQDg5bQDJzxvGWSOA9m21ri/V06+Q5crVxoGwIr7TmVGHe8pCKEo1H6/WhbmIKjPv3
 tvjHLHUjB+8LEAvGrBbNYRKkOh4K4KyhbBvJdg/CwuR+fsubWJvlFQ9sYUvmKVVTgNwQMuyML
 9YWxv06vFN+vkUbcdjGuo2++X3YA8yDbNef7832tAeHeE2Yga3oJ68brNtZt4LvDA1bP1Dabm
 AERxGiVzGQxv8pJWh4TiNl+s0fM1dzSPhuI7WMwd6TRUnqHpeSpvC3rNPYQ08ldeVwcg7BgOD
 shqgVJeuyeaLsilO6onaq3uB86ISICQhcqqjFOpR4mw0iKsDC0K82CInIxCF+zqd9tTyMwiVo
 wQyzthQQN+AWmlJvmhP9qaxqHHyAvPBgo8I1Y70B8/sJJXyHDM4iCcUIuwIbATFGVxIIDQF2i
 5euwI/KKqYd6XTKPvDTee8TnHMI/ert+4QcAG/CB2MqcASVFM4O1TWFpEgoUceUk5RDnEdXey
 C4lPRFO/JMUvy7Lj0mS3UFouHbvHw1u5EMh0PYytMhLazP407RVm9jr/NjZHTV2uYYJHW7RbK
 ZTc2miauNgpmTeWnr0F0vg9yBcaWx+IXSsmmEjvFImRmuih3sAoVN+kiHy5DTzFoJAmGoVfjM
 9dcRW0danPiRyxb+ytdsjlwnk4BbdJY8nxeZTsxDq9laqNLxAwLmMqrRLMvum0qK/6igZCzD2
 AAtRNgvcJ5uiHNmaUUfjy+C54Ep9Ue19LLhTniRHlUorZG8sKRqZO3pWYGKo+hszMc0eBbRJn
 8FS9hE9rTlMTy4g0NJwINLuLupxganPqMsJx2KTTtDerifzXVYrOZMP4yQqNit21KXK/VmWI+
 mHRCwIDZnGvRRo+LpTCgii7bjRHPTpBz4MMfaG0Frbrc/5Zr8JgbTTba7XDkE7GBmsRpH3ov3
 umd6WU2YQOThSmDlUjvNesVIADZV2wB9rpBGQeQZ4RfZQwmgT9fZ/sHfF7fncZRZfuWmo4Ivn
 h/h2PoBWDPnyiDom96dfm2SchLfS8L2sJiSJW32yABRqTxIN5LpClDZNA+XyEJfzivry7Cw2r
 +NJEy1smWs1p0sDPkGZMPSLQOodB8L0NGwbiRL02x+CcWOVoWWI6e6AwOjRwdkFMnfJNyQRq5
 LPBx8V+gZWOl2w3Y/6GpWzVGG1WHk9SxzORkh+eU/SVMDHIt++/r7EpdpowlPgdASHSDMpbiT
 VfUNYM8QG+De4ZRI5IC2lE12m5mpEn+C8qDYCFsA1CiIkP5ew/oONXMHE0FNdGR/wX+H5AQEB
 U9GWTG5unaKSEpiKhjlSGJiv+ps1n9kZnXMV/yKPc8FrVmi7ld5Xk4jqbpLwh1H+dkrQoC3tL
 TR0eL0toZjuNqfBndSt94ec6e915vEogTexcWMI+HzuHG6qh6ICH0UuDiskWtNvoxv+jnjfXb
 dq6C6Xn88aUGvuW/38B19DOyRXOKhW4/ZNcWlcJE/dhwNb03XJ5bY9gWP/+wCW2mzTiW3lHBl
 5LTOge03kwCTYhn6y6NIR9uEK/2aFcdKxjttdm3WgwSe4BDMM1ZYmr8zhTqwJnb6Z19vq/uQY
 syokml77qYwUVBYvz+7jwp3Magg8GDicCMfN5Vc2lVVpdbIae/Bdz6g03maaDS89iNRBLcRK2
 cjwXE/kzkauVLoQaV4I/ugEby79UhfogPsT+yfdNkZk3I75YXOCzciMP8Ja9m7YuQC9+WPoDq
 XtDz6VM+uAe9VbfFOrD5frsORYnDODaq++TyEoM9O+OPxBYafqiExSH6la+MY7XE5bAIBT/5O
 R76ji+SXe5AqZiUkEFWfltujRS/4Kjg3xeQANLwPVGXMdBLfV25X7ST91w+8cko3S8o4jqnQw
 0ODQ5BJjzyNy12MSHjdwECXfzYCkbdZc2SNHLel9prwmYIVmmPhOGFhqLEEMOT9GvbO2ytBmK
 PnBwJAcAE1SbqXBuewyE7SGLgelUrOPbxgGhwPe3Zv4DJ2bk56NhB++NdR+sW2vOwXHPzMEZ1
 PtmGIPhcFJa75n7gxRsg9VHum/k1eFGlRYRxq5W2qQHZ/vun762z/a1S/aXY/sAybRrhr5svR
 SvIy9D88+Y7u78zzKIInx+gwUz2DxnUgmlKfI0Z6zUy/9PMnSnKnO9Q3GlQkDBbxrjhAQi+Gf
 jQvjFdD3tfed5nAwj0YgVcNzxvC0LasGukHRQYmB5pT0G/UD4Sm47yU2N9DHM6bZEKRbWl1Dw
 25GZjcsI+D4n1O5GZIU58O+NODoB4JDXlIs35Xe+zsN2mk1fYLptvyFifTx68tGA9c+5yHe/t
 IahchcXLaS76rbyFaJFcOITHEqKarYDPDO+9PbPUVrG84pbDxMkxBTdleKDELrajoWYhiNfmz
 RNlfkxq1UEAf/eDcCF3jyvAWFpEa/BW2VD9t4i7X7WdxKQ0Fn6eAWRnM+RNwStxKo3KwKYO7C
 66w6Ub/wtglWixgS8f7hlTTuC94pVXywuyNt69a9MBiEV8DKC5v3d1IqStxOpUcf01Fsyd99Y
 /NL0LSqa7EDKbMfHLPh1OFs5AG/gh1qpdrXYEhUGctkZddJYj2iIdhoRSJKEszYQEBjV0u1s8
 pXB259wstdrLiF1Ka7sShUL7j0=

On 11/21/25 20:04, John David Anglin wrote:
> We have a new glibc failure that may be a kernel issue:
>=20
> make[2]: Entering directory '/home/dave/gnu/glibc/glibc/misc'
> env GCONV_PATH=3D/home/dave/gnu/glibc/objdir/iconvdata LOCPATH=3D/home/d=
ave/gnu/glibc/objdir/localedata LC_ALL=3DC
> /home/dave/gnu/glibc/objdir/elf/ld.so.1 --library-path
> /home/dave/gnu/glibc/objdir:/home/dave/gnu/glibc/objdir/math:/home/dave/=
gnu/glibc/objdir/elf:/home/dave/gnu/glibc/objdir/dlfcn:/home/dave/gnu/glib=
c/objdir/nss:/home/dave/gnu/glibc/objdir/nis:/home/dave/gnu/glibc/objdir/r=
t:/home/dave/gnu/glibc/objdir/resolv:/home/dave/gnu/glibc/objdir/mathvec:/=
home/dave/gnu/glibc/objdir/support:/home/dave/gnu/glibc/objdir/misc:/home/=
dave/gnu/glibc/objdir/debug:/home/dave/gnu/glibc/objdir/nptl:/usr/lib/gcc/=
hppa-linux-gnu/15/../../../hppa-linux-gnu/:/usr/lib/gcc/hppa-linux-gnu/15/=
../../../hppa-linux-gnu/
> /home/dave/gnu/glibc/objdir/misc/tst-pidfd_getinfo  > /home/dave/gnu/gli=
bc/objdir/misc/tst-pidfd_getinfo.out; \
> ../scripts/evaluate-test.sh misc/tst-pidfd_getinfo $? false false > /hom=
e/dave/gnu/glibc/objdir/misc/tst-pidfd_getinfo.test-result
> make[2]: Leaving directory '/home/dave/gnu/glibc/glibc/misc'
> FAIL: misc/tst-pidfd_getinfo
> original exit status 1
> error: ../sysdeps/unix/sysv/linux/tst-pidfd_getinfo.c:52: ioctl (PIDFD_G=
ET_INFO) failed: Invalid argument
> error: 1 test failures
>=20
>    if (ioctl (pidfd, PIDFD_GET_INFO, &info) !=3D 0)
>      {
>        if (errno =3D=3D ENOTTY)
>          FAIL_UNSUPPORTED ("kernel does not support PIDFD_GET_INFO");
>        else
>          FAIL_EXIT1 ("ioctl (PIDFD_GET_INFO) failed: %m");
>      }
Which kernel are you running?

I could reproduce the issue with 6.12.33+deb13-parisc64, but
it's fixed in git head (6.18-rc1, in both compat-32bit and native mode).

There have been quite some changes in between those versions, so
maybe there is at least one patch missing backporting?

Helge

