Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C683282381
	for <lists+linux-parisc@lfdr.de>; Sat,  3 Oct 2020 12:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgJCKFH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 3 Oct 2020 06:05:07 -0400
Received: from mout.gmx.net ([212.227.15.19]:42185 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgJCKFG (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 3 Oct 2020 06:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601719492;
        bh=RizOq9otC8RQbuqihdOSBK2fMF8g7ji9r15wyyWGNaQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=XSCqFEo9wUlKdC8slXc+ajUtsM7AP6oT/FOiZeeMV76Tu9TSwEblrCSIp8oqZNu8l
         9QAPPbQCEnLXozIsaooQeBmGOer+6RX9FAMLDeIwvKqXaJzmYiegFn147Q9KZE56jL
         qmOA00dCLjkSYZt2drZ1G2yBQ1frKCgTI0I1dky4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.137.81]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1kGRDK26s6-009M7L; Sat, 03
 Oct 2020 12:04:52 +0200
Subject: Re: [PATCH v10 1/7] parisc: start using signal-defs.h
To:     Peter Collingbourne <pcc@google.com>
Cc:     "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Richard Henderson <rth@twiddle.net>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <cover.1598072840.git.pcc@google.com>
 <efdbcb5fc45a2dbdf1e2363d68ab0f7b5a276980.1598072840.git.pcc@google.com>
 <c83eeeff-ae86-14e0-a8a4-bcf71e5acb5a@gmx.de>
 <CAMn1gO7-MQbdYaOFtW1Oc8mBmgPyuT=0CfuD50jNQ8ysMrp5OA@mail.gmail.com>
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
Message-ID: <a2836205-9f34-99c1-c113-7b54b8243a6d@gmx.de>
Date:   Sat, 3 Oct 2020 12:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMn1gO7-MQbdYaOFtW1Oc8mBmgPyuT=0CfuD50jNQ8ysMrp5OA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kzgLC3Ytt1Yy9DBYlbM7fkCADYOuE/NmRbRHuDpJnJxyk5SMq5Q
 D+NiIBtPWEJ4df8F4W2VhHiYS+ue2+Q6UdmQM0osD9Y0oobvFk2FGtmOq6Uw7TVOgRjh8L6
 NCnOSbFpqmboPGhHJ4CQrShMFihQ7QKs2KUQRhZqaikEhUn4SQyfMEYK0xpABjTc8OGsHRO
 XQFcfpQP+2Wt0ZQz5zV+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k4kJlo6mam4=:/wDnwzN0VZDvFu7mTXNY4O
 pxnR4XJswGjPbfJ1SnnTqIkMO+zQga1b5S4xstBNwTfvtmI924rZuw5h5kKx86D5GDySaKol+
 ws6AB3mKwJw3olfWf1KoUPcStBq/gp2XLuScJz7P1cNL/ftIkSFPmUvaw+zHKMk8hkUTev1XG
 ZJKF+Ba9OgQnYgUretzu0jrcMOQHC3ADqaaY1NynQeymWq6pA7S5o9nmY/jT/uVh65xO5O6HF
 NPgjw9MQ2DpYYWJQbXRr09AXtXD4kDA8L6VXfvtEgUPUnz/umhJ4Lhkb846CHTEFs0DjR2/SG
 kY06csLVPhy8uGvHImzq4pD7OTHD/bbTX2cvO2KEIVjpUrAjgBrzmO6d4c1xRNVCvOz75OdyY
 yxjbowZv5PJwfS3xlJX7zCo7H2kxrOqbTBEiELiEeSIHKTwYVTzci1Djno6kzubHaGELgC/yZ
 Cq7g0Gvrc+A2GrPO1VJT1NdKGKBWi6tZ41NOHSmmuG0oHvnyQXTpZL4nWLv0X/t+xCQICmx9q
 IAsGgVBpYuPA+rGMAgfjKbU/4bAim20388TJBH/HifTNDTKXxEf4Cl2CTgdlxXcCvYbjxIJdb
 dYeTQO7IgDa8TWgZDG7QknYjIom7SHAmhZ6++er/o4heTYaeV889m7xqEyKwaNTzj/xReLlCT
 dDiVVzV/U3TyDW8lP8JgQaCVSEYh4BCdNaOFzqE72pje+vCQ/m740K8mWMnnkxHy7YYM5hBEa
 NlL1J2quK4Ief3iMs7amYUgQ6D4i1wyd+uU7WSa3seGD4PLXXCY3813gwKKiwCFVOpERXSmac
 bf3/mWgn614F7PhR4XxRi0UWTjfeuMgrrrQIEYefS54c1dex0yz+P9jrm7ny9XDlKc5473IQI
 m++C0PVErjcgHzdya5pqCpvMqCSSfQpdhlN5uuxr64hSYLse9yeEHHgcDbt/ACqgNMkrd5b+K
 mXGXOIjy74S7z6o++AbPuuSC4MLSOjHlm90xjvtYw88NzDLeTa5awYkGxqNyePTX2Swa0HLsv
 4idyrv6qsiJMu+8gbmYHjLKtyzltZnHUqk5yzlPKDGDWoQXowbkrvX2di0IGCZlogmy3JOo2/
 Zj9WdoLZopxF72sHaadniQfvkoVHWo9zH7Ip1nHVmg9WH2+V+0cqUKAaK/SColeyVmUbFrDR2
 he/95XTlh7lnbF8LkYtyednih+au6ifQNMtR1ar2Lb6ZQfq/5r7l09uVmFtq1IJDrU+qW4OfX
 PrTQNwiAstv4Qk0VT
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/3/20 3:22 AM, Peter Collingbourne wrote:
> On Sun, Aug 30, 2020 at 10:07 AM Helge Deller <deller@gmx.de> wrote:
>>
>> On 22.08.20 07:10, Peter Collingbourne wrote:
>>> We currently include signal-defs.h on all architectures except parisc.
>>> Make parisc fall in line. This will make maintenance easier once the
>>> flag bits are moved here.
>>
>> The patch is basically OK, but....
>>
>>> Signed-off-by: Peter Collingbourne <pcc@google.com>
>>> ---
>>> View this change in Gerrit: https://linux-review.googlesource.com/q/If=
03a5135fb514fe96548fb74610e6c3586a04064
>>>
>>>  arch/parisc/include/uapi/asm/signal.h  | 9 +--------
>>>  include/uapi/asm-generic/signal-defs.h | 6 ++++++
>>>  2 files changed, 7 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/inclu=
de/uapi/asm/signal.h
>>> index d38563a394f2..92a1c7ea44b4 100644
>>> --- a/arch/parisc/include/uapi/asm/signal.h
>>> +++ b/arch/parisc/include/uapi/asm/signal.h
>>> @@ -69,14 +69,7 @@
>>>  #define MINSIGSTKSZ  2048
>>>  #define SIGSTKSZ     8192
>>>
>>> -
>>> -#define SIG_BLOCK          0 /* for blocking signals */
>>> -#define SIG_UNBLOCK        1 /* for unblocking signals */
>>> -#define SIG_SETMASK        2 /* for setting the signal mask */
>>> -
>>> -#define SIG_DFL      ((__sighandler_t)0)     /* default signal handli=
ng */
>>> -#define SIG_IGN      ((__sighandler_t)1)     /* ignore signal */
>>> -#define SIG_ERR      ((__sighandler_t)-1)    /* error return from sig=
nal */
>>> +#include <asm/signal-defs.h>
>>>
>>>  # ifndef __ASSEMBLY__
>>>
>>> diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm=
-generic/signal-defs.h
>>> index e9304c95ceea..ecdf6312bfa5 100644
>>> --- a/include/uapi/asm-generic/signal-defs.h
>>> +++ b/include/uapi/asm-generic/signal-defs.h
>>> @@ -15,8 +15,14 @@
>>>  #endif
>>>
>>>  #ifndef __ASSEMBLY__
>>
>>> +#ifndef __hppa__
>>> +/*
>>> + * These have a special definition on parisc, see:
>>> + * arch/parisc/include/uapi/asm/signal.h
>>> + */
>>>  typedef void __signalfn_t(int);
>>>  typedef __signalfn_t __user *__sighandler_t;
>>
>> please drop this special-case/#ifdef for hppa/parisc.
>> Instead please drop the typedef in arch/parisc/include/uapi/asm/signal.=
h,
>> same as you did for the other architectures.
>>
>> I've committed this patch to my tree, which will collide with yours:
>>  https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.gi=
t/commit/?h=3Dfor-next
>> If you like I can drop mine, and you fix it up on your side.
>> Just let me know.
>>
>> Other than that you can add:
>> Acked-by: Helge Deller <deller@gmx.de>
>>
>> Thanks!
>
> Thanks for the review and apologies for the delay in getting back to
> you. I've picked up your patch from your for-next branch into my
> series before this change, and removed the special case for hppa. I
> also build tested my series on hppa which revealed a typo in the
> #include directive which I fixed. The new patch looks like this and it
> will be included in v11 which I will try to send out soon.

Thanks!
Ok, I've now dropped my patch from my for-next series.

Helge


> diff --git a/arch/parisc/include/uapi/asm/signal.h
> b/arch/parisc/include/uapi/asm/signal.h
> index f1fd4fa880d7..e67b1bfb82ba 100644
> --- a/arch/parisc/include/uapi/asm/signal.h
> +++ b/arch/parisc/include/uapi/asm/signal.h
> @@ -69,14 +69,7 @@
>  #define MINSIGSTKSZ    2048
>  #define SIGSTKSZ       8192
>
> -
> -#define SIG_BLOCK          0   /* for blocking signals */
> -#define SIG_UNBLOCK        1   /* for unblocking signals */
> -#define SIG_SETMASK        2   /* for setting the signal mask */
> -
> -#define SIG_DFL        ((__sighandler_t)0)     /* default signal handli=
ng */
> -#define SIG_IGN        ((__sighandler_t)1)     /* ignore signal */
> -#define SIG_ERR        ((__sighandler_t)-1)    /* error return from sig=
nal */
> +#include <asm-generic/signal-defs.h>
>
>  # ifndef __ASSEMBLY__
>
> @@ -85,10 +78,6 @@
>  /* Avoid too many header ordering problems.  */
>  struct siginfo;
>
> -/* Type of a signal handler.  */
> -typedef void __signalfn_t(int);
> -typedef __signalfn_t __user *__sighandler_t;
> -
>  typedef struct sigaltstack {
>         void __user *ss_sp;
>         int ss_flags;
>
> Peter
>

