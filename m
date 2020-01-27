Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E680914A007
	for <lists+linux-parisc@lfdr.de>; Mon, 27 Jan 2020 09:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbgA0ItL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 Jan 2020 03:49:11 -0500
Received: from mout.gmx.net ([212.227.15.15]:51121 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726769AbgA0ItL (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 Jan 2020 03:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580114939;
        bh=I/5PZnrrgZxO7dwKini8I5E4vTRqom7xKPuBjoqav+k=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=JKhO8jhA91h6qgKi+8ZMrWIHPPnLizjHooOhQnWj9WX4Rgb3jzFY7xuZvUBo7zfgg
         7M4Zi79s7whcfl+3GzjuxdIcOZQtdyF3X4oNWaIsp2jbVGkRD+gReLAfzRdbDjA59f
         FRhidP1DJdxzVXv9Xy3Yx7cwFCF3ol7+xTi3iNHU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.84]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2aD-1jKqtg2TDT-00k7Om; Mon, 27
 Jan 2020 09:48:59 +0100
Subject: Re: [PATCH v1] parisc: Use for_each_console() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     linux-parisc@vger.kernel.org
References: <20200124160739.65256-1-andriy.shevchenko@linux.intel.com>
 <1579883942.3001.14.camel@HansenPartnership.com>
 <20200124173846.GL32742@smile.fi.intel.com>
 <1579888788.3001.26.camel@HansenPartnership.com>
 <20200125102508.GQ32742@smile.fi.intel.com>
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
Message-ID: <310fb56d-8b7e-6dca-f36a-41729ef66e25@gmx.de>
Date:   Mon, 27 Jan 2020 09:48:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200125102508.GQ32742@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HJOLuYIHbNhT39iTQ6nT+y+XbKaJiS4qglCKaR9UIq3GPJUkKnN
 ZVH6gP9+XT1ej2tzvpaU2/v3I2tYGNiCE//MmdWSvZxO/08IKv9xvBdBcctEnU3HNHbjpnk
 kcU2vdl7qmDaGFtFyjcWtMrhHEXdADS7Pd2I/bAZEFqfe3dxTc/eAurYuuraCAq8rUys7oJ
 IPNpfXFKJbkKHjXYhUpWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yyIRyhqEK9Y=:84hKae1K3YWAEnw5qnN26t
 qughQcx+nwe/nZ2HWzPlrMmMU1JBiT1tDGffpCSxhnXpsbujAAgYxlKpuuX0rMW0VOun52qw0
 /YckKOeKTDG8ExRHCAuSMOntZGPxOOOrXp4YQl9xPl/6BJNuJ4L4l5aRgccMJ+NmecEmiE+i8
 S7CuLzfeEp01YM4tcSRcOAp+01toUvJKEvv2Jej+fC78xV0P4FQCzHn6/flOCvr36hVNM4yln
 6lDsjH43pnVRLhq3n+Jdu83RrefUuVk6DykcxyJ8THScVApkyV7gOPW7eoWIZB0HdPqcAu+VS
 3pslc63PbZ11DY+xdSGfCY4y55S4lv/PfCiBg+7sAUJ/vS+cBcnJeNB9U1om/o/1GBruOrfr9
 Qxftrc0QyfnqzxuUstHkK2i+BaVO54X3aHEtX/QupmfLos9pUxrCiNrKbhgdEE6g1Sz9EoXwh
 H7Yhjnc10+RedmrEeuTinYckrjfSVmunT48fzycxvhp8OQQgCOnHbYA9lEICCg8anuNOZhfaW
 JjWdVEWb46mjcbRVvfi4bxmsmzPUlQrrrie/sLu/t0HmCxXT8/QlJsUI+bcnJN8Rmvjsm7Z1i
 G4Z6hB/zSnT/o0AREuYfeQ1KCyE/Ip8ZRQGvcqI2KxmALsz015JyG66Kqe49nhSJKf8XSfnwZ
 2/92xbhefX9ZqSDy02VqHQ1gbSY8V+R41B1NY18FCiZeVPWQQgog0x8SiwPrI/CyzdfelNNze
 BVPLnEYZ2BC6F6KDX1C26f6rOJVwGTCFiA0BKLAQCE9DcEm9FuecnDsTWbJ7mlM/RTijSdBQe
 +Q8xFa6QtCC24rxt4f66LYDTmBvkPu+ThQvExWLrztp8VtE29tmyPlfCFfLNqIC2sjYHSz7wv
 ehFssjeLmHMKOnGPGX7nt4e8y+rxnR1DxZhtpZTvpV5UXWeq02aqOhxyk4qQVeBig3Y9039Vh
 mOOZMQTjiUobcZEdbuXvi0Iq1UphM21KnBxkQRv/32rp+BCQds98r9To3zAmgzh0mqp7/UIYl
 tYezu+X4lbFc3T5NdohJJQwzsqdCEn7EFc+fqzVTHb9dRyQf24JPZons+mRcXu79RWYCTv8T5
 vyJMOp2yM2Ouz4yfIrIxWAenDj3SYh5Bu+kahIzXzMmCWEQqC1QH9zbAOfQkoohNDLHL876Nu
 0YuVg4ByLI3lhY0dAhDWc+dMndzWYzZiwQnx5XH9LJpj6fPSdXOCFlPDxY89ZzhXutWet0MLm
 /dlJQW/tUPdKZn91r
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 25.01.20 11:25, Andy Shevchenko wrote:
> On Fri, Jan 24, 2020 at 09:59:48AM -0800, James Bottomley wrote:
>> On Fri, 2020-01-24 at 19:38 +0200, Andy Shevchenko wrote:
>>> On Fri, Jan 24, 2020 at 08:39:02AM -0800, James Bottomley wrote:
>>>> On Fri, 2020-01-24 at 18:07 +0200, Andy Shevchenko wrote:
>>>>> Replace open coded single-linked list iteration loop with
>>>>> for_each_console()
>>>>> helper in use.
>>>>> -	while ((console =3D console_drivers) !=3D NULL)
>>>>> -		unregister_console(console_drivers);
>>>>> +	for_each_console(console)
>>>>> +		unregister_console(console);
>>>>
>>>> This is wrong.  The old formulation iterates correctly in the face
>>>> of element removal.  for_each_console is defined:
>>>>
>>>> #define for_each_console(con) \
>>>> 	for (con =3D console_drivers; con !=3D NULL; con =3D con->next)
>>>>
>>>> So it's not safe for any iteration that alters the list elements.
>>>
>>> Ah, I see. In this case we need to keep a pointer to the next
>>> element. Though, the original code assumes that console_drivers after
>>> unregistration will be promoted to the next element. Do we have this
>>> assumption solid?
>>
>> Yes, the original code simply removes the head until the list is empty.
>>  That's a recognized way of emptying any list while letting the remove
>> code take care of the locking ... it works because parisc doesn't have
>> a braille console.
>
> By the way, consider this code from register_console()
>
>   for_each_console(bcon)
>     if (bcon->flags & CON_BOOT)
>       unregister_console(bcon);
>
> It works based on assumption that next pointer of the just unregistered =
console
> is not damaged. So, My initial patch will work in the same way.

Yeah, but that's a typical use-after-free issue, which I wouldn't count on=
.
Isn't there a way to make both safe?

Helge
