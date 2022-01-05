Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD7B3485243
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jan 2022 13:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235854AbiAEMJ3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jan 2022 07:09:29 -0500
Received: from mout.gmx.net ([212.227.15.15]:44021 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235413AbiAEMJ2 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jan 2022 07:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641384538;
        bh=YelKOGdWUsJTHmRUTgeEAWUyFe6ZkFA9+uY6+mV6i4k=;
        h=X-UI-Sender-Class:Date:To:References:From:Subject:In-Reply-To;
        b=OWnWyBl0sRom7ijcgSHNOXgbL6zQTIHNUruOVCWyKJRT1Vhq4E6sOn7T0labQytBe
         y9Hs5EvesmWm4GbURQQSsYsaDkbyhxrFkCM0q4O2Y3VntiUaSVcjpCOpKFfxN052hJ
         uSD8c0eW0orzWPEo8+lXyfHHUVwz38fuyM2RYMBk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.36]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKZ3-1mov7l05Pj-00Lmqy; Wed, 05
 Jan 2022 13:08:58 +0100
Message-ID: <4f725f27-744c-c34d-5eec-fbc04eb7f623@gmx.de>
Date:   Wed, 5 Jan 2022 13:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
 <3407744.iIbC2pHGDl@daneel.sf-tec.de> <87pmpbds1r.fsf@x1.stackframe.org>
 <2089338.irdbgypaU6@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Subject: Re: pagefaults and hang with 5.15.11
In-Reply-To: <2089338.irdbgypaU6@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XeqY1KtIml7ETyh+Nc8S5lDJ1lvSp/Cn8m+qd9V4FUiqcmtCXtc
 Nkb6Xl6blqlFSUMcGUsD7s9Hwa/hb5nh04bkVnkslC/ipyRlVY+Rv4Zm1KDDQOFhIL9WCIL
 2+NNNxNzFGsaA3NtLucH9LOcJzjDFqhQ/tXEfWPMset+8EEYDUKbcvt/2ygNpqB21CvfnWw
 3eNu7uOCLaluk6npMW34Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0zbfrmuAIzM=:hzWh2fDHkakVX6bD3pn+8Q
 9FuwHeUCWzHl2ilQvYAKH5lwEd/U21foRP28XkrTJGyPw8jr5jECsmsXjbkfuMNG7ibmLrgN1
 kD3ZCmAa4/TUkaERXx71yeuAUShhbVLRTN3aArZA41mEwxpLiudYsiRPxQr7UhAd0XVzfryuc
 HgcfvBrp7KsYLmkgXGosSU/FiUPE2iuRC71exw5ngLvARCDf4AtdAyRZKFNyPVLp0LCZFCUss
 ZU8DKcEPx5JuAEXd/tQQcCtAuZYZA2o7DxTqLIYgq+k4F2LOnIrVL4lgvMZwJVi77owl9p0RB
 ejSkqgy4/t7pcBQXiK1UtUEIsgW+t60AtlNiMpU24ASPamQzMkgx340WRiBR+8U3fffFgWUaM
 x6J3vbZlHx/A7Vt9axW+Km/VPjOjhm7G8E4bdjGhZuEx6i2iDowCNeNFHG5osmfLvsPxNkzwW
 fx7I+2P9SdjczB3tLXzBsDAVIolPdbjX72Kc4qF0l/BBuDcL/0acehA5kNdHxpwtm0fF/d2+G
 sdUoX4Ek3Bxekl77iH0+J2V1RDCG9P+25lavz8zIS1Iy6V//quU44qQDCwTn/tJ4JL4kDwIiW
 SyX0Qy+bRmOxPhAg2YfFN5Ex8EyG55x++Pu87vrBvrXpNAN5dWLrh1suXzHk9yzXoCqzZg2bQ
 GMi6EscSD5MmnC6pkpPwP+c8t+P3DQ0yK7bLDD8Lg3BTqPe4Clu+ByonGMu6L32sLfV7BF03O
 zIwIzDTWAUKGgE/ta/xORLulDOwxRe4xWkj4DuRDptF4KMrn0RD/ibZV/kvL+rtqjXWHX46Fd
 GuqXA7iV5MFsAgDWgIcSaRkrac6wVpVxF+9R3yyIvhbc5t/yhKAAF69CMzoWhlVbsU73jqVgO
 /VcJ9tBt/yVEoAxjkzZNJ9uf8EcSxgpEvSCQ+fU+OGvmX6mR8w6QREYLkKrfqMnjs2br0J2FP
 3JsKphf9Su1mp8Ll8xdE0lwT/h3cg1d4UkG7ctQGvSHGQ6r7RoZNFs9nmkLuNVBKFiZ/4nf8c
 CxZ60lCUT/tOzp3VfvosTwwkFBOskDSP4kMopXCvgdEIGWZA49xH7k3l66Jowt9MDSbYAIIZ1
 kkc8ay+oOFNaL8=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/5/22 08:42, Rolf Eike Beer wrote:
> Am Samstag, 1. Januar 2022, 23:12:16 CET schrieb Sven Schnelle:
>
>> Looks like you have a serial console connected? If yes, could you trigg=
er a
>> 'TOC s' from the BMC, and post the output from 'ser x 0 toc', where x i=
s
>> the processer number? This could help debugging this.
>
> It locked up again, but the important part is not in the mail or the wik=
i:
> clear the error log before :/ And even worse, the C8000 does not seem to
> support "ser clearpim". You can see the firmware commands of a C8000 her=
e:
> https://parisc.wiki.kernel.org/index.php/BMC.

I think you mix up the BMC console (for remote management, always availabl=
e) and
the BCH (boot console handler, only available on machine reboot before sta=
rting
the OS).
I'm sure the C8000 has a "ser clearpim" in the BCH.

> Fun fact: when doing a command in firmware that prints a lot of stuff, l=
ike
> "se", and then switching back to the normal system console via ESC-) see=
ms not
> to stop the firmware from printing more of it's stuff, so you get junk o=
n the
> serial line until the firmware is eventually finished.

Yes, I saw this once too.

> Is there a way to
> switch the C8000 firmware to more than 9600 baud?

In the BCH I assume.

> Sorry for the bad mood, but if that is what you first find after wakeup=
=E2=80=A6

:-)

Helge
