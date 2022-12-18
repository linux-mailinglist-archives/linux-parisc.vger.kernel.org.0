Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8B0650446
	for <lists+linux-parisc@lfdr.de>; Sun, 18 Dec 2022 19:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbiLRS2k (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 18 Dec 2022 13:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbiLRS2J (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 18 Dec 2022 13:28:09 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1BADF25
        for <linux-parisc@vger.kernel.org>; Sun, 18 Dec 2022 09:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671384724; bh=HGekGXgRUVGi3b0Mvd5kvJaJj5l5gO93p+MAlpAVGEw=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=f8CUkGtkMed5ZT1s8DfSHAALl8BbhEUE4lfMrS1r1fi7F78xVbqOFHOO34cEXkHRc
         BWYzGfwOjRRxPlk8khl5yizA7geF5xNafwlDJoLBZvFXCT8EueNhv1red0EmKcyfeb
         Z3qCO/9noh8IdC20n2h/0weyx8ztZo5M51I86P/eokFGlJz1fQWDKBiwEgWX3IaBxz
         OmEvb7/VChtes9Dc6usIKn6oPs8pqDvpY8TFL7kBoIJ/gDwxl4owIOUtOR+7CdXjwk
         s3PUsf2fT9kh8/KQw52roRg5AhTHNRb79Frsht9r1P7TVH8oScWs283QxV5Gtmopda
         iVlRAMZXe4IwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.185.62]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPog5-1pJHT50NSl-00MqL9; Sun, 18
 Dec 2022 18:32:04 +0100
Message-ID: <dddbf2bb-bbdc-2029-95a3-3d6ab7e582fb@gmx.de>
Date:   Sun, 18 Dec 2022 18:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Way to kill processes with unaligned access?
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Sam James <sam@gentoo.org>
Cc:     linux-parisc@vger.kernel.org
References: <1Mf07E-1oQMEy3JxS-00gYTD@mail.gmx.net>
 <2407F312-9FFD-4872-B172-405787E99C1E@gentoo.org>
 <f1e1830e-8cd6-65bb-9a27-44b14125234f@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <f1e1830e-8cd6-65bb-9a27-44b14125234f@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zgNT0EIlm07tAnJum/+IrVplxbTkPciyHCZcEauSrw/tjJqZeNT
 W2V+CiRlrsVU1llw2Ep1inM+nMV6nkdB/Zj2dOYNxyVowI6bTlTMnSc9oOQZGcopTt/k+xa
 t1MoxqGaYmPvRmuYdRhEa0oB0clvTPD1Zg2OKjzpDqe7IL5hd10LHODa7Ria7j2BG0Zv9n+
 zT2SHj/SpRvYo9MuM8upw==
UI-OutboundReport: notjunk:1;M01:P0:VPcnFEtK5Cc=;lZY6yRwgiYJO8iylrxsQcbC4uAe
 nsASk1oozic5uAcKxNoKLTiL8C44HWUWiWdpQbYQhgFrltGWKGOpACtsWuhh3wLAYSGdiOdNp
 87+fMiQkH0IlcYUpqU9zAsmFgE19wK7D/L0qLSW5eoVRriGrq9OcQJZVQkyAeNyegxltAl2Nv
 gKCXG4kDS2TdERqA/H2th7Rv4hFJHTxrKYPO9cMI1ae7Pu44GtC40ZiQRKLXJdlhvfuRZHieb
 8viuW99UZmfkc7KDoAkIspLGQNb94FvalBrsxvDW4uS1JdtGbfBNHReVSqjhxrtqJahjUtETL
 tyKf7Bo6vfF8P2qhnJIETsVZC/RcCiocq2SrtU9+uCBvAMRyxm99pM0EpkpiPANadCov1inAg
 XUzjt6VQ7f/BkjkgAIAZ6xfcWaUoFOpe5NYdBEoy3PX+SGXnBVi81Y+tWonW2Tw2CQedobGh+
 ZOVs2nSd72IVHMrcQHEJYcAZm+mgt3rr+F9XJjK4ONrkvI5zQqT4rWUnPtOoqjgYc8WzRa68f
 LfzcaSGpLUNXm6y3w6WUr5MwiLDuCP1yRE4ynBjQBFDUi+DCpGwe40/uVZddJNMfQghtRA/qb
 cygHIs9T9/j0d++figZbyXB1MBdSpNSbq84kZJVgjBjn1R6AJYESdWxJ1Cf69HJo5Y3/1mxVF
 7Vjwcq4YMK/Jj5vYKidqIDVevNaw7rnJcG7ya8y2mbCNYFq9XkG8FQE4nNO2IocomuXjPs/Xg
 uuIsL7BAsDt39rkF2brDXCJYuikBkKoxVrfN1wAJjXv/iv+jRfjNCNENiUzhIhZPlFDR/zLSt
 tYoIW47r0jvDdiInogsakXyyKFr7b9OkFh/VmWUEC5NGHGaMaYTAIDSpuN4QXoNGCy2RhXsca
 21HgK9B9emuQsFNf/hsOD4SeLmmxAJlMpzK3Xb6SJKYo2OaJ5Gzqqz23Ul+IPcI1KdKXcJd4h
 Dgb3e+2TipxVsD++M2rIKpyZey0=
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/18/22 15:11, John David Anglin wrote:
> It's controlled by /proc/sys/kernel/unaligned-trap.

Yes, /proc/sys/kernel/unaligned-trap controls the system-wide setting.
But if you want to just debug some code, it's better to spawn a shell
with the prctl program, e.g:
  prctl --unaligned=3Dsignal
               starts  up  a  shell (as defined by the environment variabl=
e SHELL) and sets up any
               process running under this shell to be sent SIGBUS upon an =
unaligned memory access.

> Sadly, glibc (I believe) still generates some:
> dupload(8822): unaligned access to 0xf8b3630d at ip 0xf720c88b (iir 0xee=
8104d)
> http(6292): unaligned access to 0xfab011cd at ip 0xf720c9c3 (iir 0xd4810=
43)

why do you think it's from glibc?
couldn't it be from the program itself?

Helge
>
> Dave
>
> On 2022-12-18 6:41 a.m., Sam James wrote:
>>
>>> On 18 Dec 2022, at 11:25, Helge Deller <deller@gmx.de> wrote:
>>>
>>> https://manpages.ubuntu.com/manpages/focal/man1/prctl.1.html
>>>
>> Thanks, this looks perfect!
>>
>>> -------- Urspr=C3=BCngliche Nachricht --------
>>> Von: Helge Deller <deller@gmx.de>
>>> Datum: 18.12.22 12:23 (GMT+01:00)
>>> An: Sam James <sam@gentoo.org>, linux-parisc@vger.kernel.org
>>> Betreff: RE: Way to kill processes with unaligned access?
>>>
>>> See prctl manpage, PR_SET_UNALIGN.
>>> -------- Urspr=C3=BCngliche Nachricht --------
>>> Von: Sam James <sam@gentoo.org>
>>> Datum: 18.12.22 10:14 (GMT+01:00)
>>> An: linux-parisc@vger.kernel.org
>>> Betreff: Way to kill processes with unaligned access?
>>>
>>> Hi all,
>>>
>>> I'm wondering if there's a way to configure the kernel such that
>>> it kills processes when an unaligned access occurs.
>>>
>>> I often get messages like:
>>> ```
>>> [18531.277742] conftest(4066): unaligned access to 0xf7fa1715 at ip 0x=
426cb787 (iir 0xf801094)
>>> [18531.487681] conftest(4066): unaligned access to 0xf7fa1716 at ip 0x=
426cb793 (iir 0xf80109c)
>>> ```
>>>
>>> I know what they are, but it's a real pain to figure out *which* confi=
gure test in a given
>>> case is causing the problem. If there's some way to make the kernel ki=
ll such naughty processes,
>>> it'd make it way easier for me to locate.
>>>
>>> (Sometimes when I've built hundreds of packages, I have a lot of these=
 I want to go investigate
>>> after a week or two, but it's hard to track it down afterwards because=
 of this.)
>>>
>>> Any ideas?
>>>
>>> Thanks!
>>>

