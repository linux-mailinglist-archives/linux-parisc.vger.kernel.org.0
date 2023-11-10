Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 572B27E8455
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Nov 2023 21:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjKJUjM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Nov 2023 15:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjKJUjL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Nov 2023 15:39:11 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D511727
        for <linux-parisc@vger.kernel.org>; Fri, 10 Nov 2023 12:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1699648729; x=1700253529; i=deller@gmx.de;
        bh=JJCnm826L0tcD/jpUWJ3M0u9IRwj+0BFOLxcnpoLyqc=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=A2e3UZcyXbAawNIdsq0AJ/AhiFZP4KA3+CmLxGm/SykXXUTmqwvgJGkEydHsYQud
         TClMJL6LIbkh2m32+xXRQj54fb3aM2ge2rMa2R6LyzVaUkqxZNTvwB7biry9sDJG9
         W3gu+IO0MGV0yLYJj6t+HvG6phIWs3/3xVqlzCTyOPC/rEM6rfvn8L5AYrjCLSyxE
         JcgJQTe40uxFfA47MzIUXOuiG7JHryjLsY2CfeikxwUvBc00qBOoj6Rx9AzSDmd2X
         E2v/NAu58HSwfzOj53rSkEHll6vPGli2CzT5OP4qQ0sv9zjLZk9sCwDPwfLPdCuCY
         0AMhDn7EfxqGUGrpNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.22]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXXuH-1qtfde2avn-00YyJp; Fri, 10
 Nov 2023 21:38:49 +0100
Message-ID: <cf75a1e4-c269-4530-b3aa-b02a81597acb@gmx.de>
Date:   Fri, 10 Nov 2023 21:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: prctl call wrongly succeeds on HPPA?
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Sam James <sam@gentoo.org>
Cc:     "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
References: <87lebjz9z6.fsf@gentoo.org> <875y2jro9a.fsf@gentoo.org>
 <0fec2446-a523-486f-9df7-4c6af9e2e0e3@gmx.de>
 <7409ec05-7a28-45fe-9604-519de5ae934e@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
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
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <7409ec05-7a28-45fe-9604-519de5ae934e@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V3Ri6GIKD7G1/+pp1XL1T0rZZ9cdzl1M+4VYJSh84SYEgnd7D+T
 99yB1C2ZLtXImmPndXRDwjZ1fIpWIHs/yWYY6jo1NowcoTGx3rcBYfonOrwkvq7GaUXKb4m
 snApnARZyG2XbmFPXAKZxtKTXKJfdraIAQeKdYnV6e5ew/l2vTPGtxwgq/DVpk2XQ4JeDKr
 zwaSfXuey5wPgFiKo/zFw==
UI-OutboundReport: notjunk:1;M01:P0:9IBsRGCG3EQ=;omKV9ikbJSRPJNH0uI8TAmxP9WJ
 8nAfrg/QV2ptLZFF+R+7xpBY/k3HputbUP+dCBtrV59Mk+/c/DLJS+ynUWmeXz9/35jq/NRti
 k7JAbukt5VtmvmRqkZ76WW59jTBNDTOXbat8dzC2RsKO2OLW1v+ycJaJSuBllYbXWp9gGl9K8
 oc5zTqqnXaLQkL+NNQs/PL1Y2IVSoCU/MrdSUv15m1Dl+GmS+lOMvrif61jHUQTEnRRMEsi/j
 yuR33YbcukNXEWN2Su0phFopQYGLCX8bvE+Rm/IaXDYDdz0yC0CnQ4uoI0jxczlCWSzwPGLYx
 62rystqmZj+AMHDSTszyulI9/2CnBEjzkKUK4zdVykb7HDtNUyyE17af54Vj4e4tU93LeGTDX
 IiY033JQNXF/h3VnQykWjUCZ63GWLsAJmU26Cb8A/ntNfMaVvIal49/2FryHxa8bjV1jfbjPA
 QtAIIgXN1M84sJDhhe4zwMQuGueR/vXe8xKoPIl0/b9lEPvhoYREXZvczAi5pwaml6ydhximZ
 9xB9zhgUv0w0Bvcn2GFkfSklqJjGZs+5Gyc92MMBy5aDHPxXB5m6q9MEnKsRf82fDPCjFf8Ot
 dn+S21xsXqWNELADkLsH4FnS54c3wTPwQwFfletL6lO3h4HkCrcVzntZZq8iP/oC+OkZkdTXD
 BPYE6CUm9G8/g7k3JALFbPlmRgFkNbca81WHm96tyw26mUCXfeTftW8TuIIRCGpze2lrLhFzP
 m2Lv+a4ju1MGObmPUinQxdIm3fb1MJ9lkO8B50y3vGOlwrtDufVBiDtcwib5jASExX8sKL5tU
 U9y+WQgVK27KtLGx54iQuuunkOf3eI7rkwaE2v5vmlWcCDxH8/AKgqefZBY5xZmQKA/vHUAn3
 WcwBK3UK9HFVSgSvICTy3cJPUYgEnB2dP0A+1zCuQq41g4btXfmNEuQy53mh4rpDMvbSWHhjZ
 VP/hf+AtmnJHoMlUupCusMEVAgQ=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/10/23 21:12, John David Anglin wrote:
> On 2023-11-10 3:01 p.m., Helge Deller wrote:
>>>> On=C2=A0HPPA,=C2=A0we=C2=A0still=C2=A0need=C2=A0executable=C2=A0stack=
s,=C2=A0so=C2=A0this=C2=A0option=C2=A0doesn't=C2=A0work
>>>> and=C2=A0leads=C2=A0to=C2=A0a=C2=A0segfault=C2=A0on=C2=A0boot.
>>
>> For=C2=A0kernel=C2=A0we=C2=A0don't=C2=A0need=C2=A0it=C2=A0any=C2=A0long=
er.
>> But=C2=A0there=C2=A0might=C2=A0be=C2=A0dependencies=C2=A0on=C2=A0glibc=
=C2=A0version=C2=A0and/or=C2=A0combination.
>> So,=C2=A0I've=C2=A0currently=C2=A0lost=C2=A0overview=C2=A0if=C2=A0we=C2=
=A0still=C2=A0need=C2=A0executable=C2=A0stacks...
> FWIW, I recently changed gcc-14 to enable GNU stack notes and fixed a bu=
g in the
> 32-bit PA 2.0 trampoline template.=C2=A0 All execute stack tests in glib=
c now pass with gcc-14.

Yes, I saw your commits.
So, any code compiled with >=3D gcc-14 should be fine with non-writeable s=
tacks?
It would be easier if it would be a glibc dependency (for distribution mai=
ntainers)...

> gdb still needs a fix in unwind code.

Ok.

Helge
