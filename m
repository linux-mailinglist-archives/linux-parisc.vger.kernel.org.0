Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4956B497227
	for <lists+linux-parisc@lfdr.de>; Sun, 23 Jan 2022 15:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbiAWOhj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 23 Jan 2022 09:37:39 -0500
Received: from mout.gmx.net ([212.227.17.20]:33057 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233480AbiAWOhj (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 23 Jan 2022 09:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642948628;
        bh=2pu656PLv9lr12C0IZIyVBUVDcD2WNDmV/Q0cQCkIVk=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=KPItin1YSNXPStovnICnN2dajheMJUICL4Gtoa+j0fDyHbjL9WR+LBl1VzpJuKPW7
         FpDTJNhhoMRDyOmKvSX5sy/lmHvcjZ+VaxobA0BuMc7JH/iRL44iUqkheJKDIKHZZl
         d4/mdAviI6CU8+QOU8uLO3o/eDLz0AEaFY749bmI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.228]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1mDkRm0Q6Y-01867t; Sun, 23
 Jan 2022 15:37:08 +0100
Message-ID: <9063d674-4c9a-bf15-95e2-5400d0dfa704@gmx.de>
Date:   Sun, 23 Jan 2022 15:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: pagefaults and hang with 5.15.11
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
 <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
 <4372681.LvFx2qVVIh@eto.sf-tec.de>
 <9f531648-c222-f203-8bf0-04f7199c115c@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <9f531648-c222-f203-8bf0-04f7199c115c@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H6LRO3UH8n4oMTp0gKUeMlXBRIGUvQavLGVpmBwP4wCz2CnXuhw
 bVeMqVhlQyk5grV6H1exCH+Fk/A+JnoCu/h/4A6IBnbHo6bZycwCDxJRhXfl6d9eCBF/w+6
 TfO+VBTSoG5p+QvWTVUXu3NgVLEl/kYKarV8jeLV1KT0HYot9zI9rVc44RNOM9htN1OFhil
 YD13NGIgr+8dyMjv5ZtlA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d22zyvDsvho=:ZEvmxb2fyD2Wqe6MCy7KNE
 ejen/kjUaSUIQAA8qpGn/EBhayvPQKkytu8rPM0m5wf8ncWLAU1EsNVmUSIVj3eFdXlq2E3WO
 1azeygoH1z66YEVLMeHSDYygTIwXlUYmACKCwS1LhHf1i1er2KbeMHfJREYHAS8NgiE8OEEhU
 xoq7gpWC2K9ODAd60Ij5JDRMZk4dty+dcZ63sWI17eDReVpZ3ZHG+DSZ8ksrvwM3+O95q+Jas
 JFr2cqmZQZ3Tp4s7rZKEH1y66Q9OSU9D3S1pFN70G3NefR5L5opZI4Ps67r2vHwbWyQ9qKjQh
 ln9lLayyfup/1QsgKNnwpB8hp1gP0WEh+UKLsEB0Qbws9S2wrSXp8tnvE7MsFSHWBXBShPbeo
 HuxEg7Bd6h/uSwBVOY+wWOqqQxfhu9f5Ez4SXkDqlKayi13cuHejA1Zg5dnJfasqfLbZmpaCY
 wLP2znD+g8tStdRR+V8VJHtMDZP6Cdux2d46C1pHy1bj308QJHSqqZ1J2aP0+PsBepl/wnioD
 OcTM+qGk0KEdY0YPCMJs9YJwoW+5D+maziChHJj92CR7MqCegZjQoIkLzad4rEMGeVSdB51xN
 +mzJEPy6c5mpeFKJR2eHRIACngSarOp2qVmUoijAkMDAfmEFGeFLQDUOvD7r/2XXXibidiSPu
 Ep3Xy/GatBNHdU8D0qa/BhgmV3bQbhT4vkioa8vevcN3NYfpPO7JjuYLBK7kzaSDS7BF/5of8
 WxspY1wDFkqQS4yPkIZSo0xF9gzCNaFKXcGVCY3o/PXdOZx7JKfWhkSThAsBZ7xSBMaNxaSoa
 xAN7rSeEX42FZN1zGZrNrbW7oPSG0J3NuKZisq+zMacfogBTqvDSlqPIM8siUcRBrg0RKK7ul
 q3ACN1gTS45h7EvpM/pEpWkMxuUB68uwy1ASqXZyMTTCbN2dXuJCnpGWsm4ufuSsiQQeCmm0r
 K7DWvstG41Y4MadV92ysXSd8CSV9DeYgwF4LSG2JkLP3kAnzJoV3BSa5dD2nfz0mHw9VSyIQS
 7fLhfNT5TaF7po+p/eSiHbiiBnQMjwQz34uf89SXhjNBZJgbS5flXbEOkv18rC0wwpn0neRCF
 ybJBxKQmXFBe6k=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/23/22 14:51, John David Anglin wrote:
> On 2022-01-23 6:53 a.m., Rolf Eike Beer wrote:
>> Am Sonntag, 26. Dezember 2021, 18:22:12 CET schrieb John David Anglin:
>>> On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
>>>> [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613
>>>> rcu_eqs_enter.constprop.0+0x8c/0x98
>>> This is probably not reproducible. You might try this change from Sven
>>> I haven't found 5.15.11 to be stable.
>> When I was running 5.15.0 I had uptimes of 21 and 29 days before crashe=
s, and
>> then 5 days before I rebooted into 5.15.11 to test that.
>>
>> With 5.15.11 my longest uptime was 5 days.
>>
>> I have switched to 5.15.4 afterwards, which is now already up for 2 wee=
ks. I
>> see regular userspace crashes with that, usually gcc or ld as the machi=
ne is
>> mainly building things, which seems to happen way more often than it ha=
s
>> happened with 5.15.0 for me.
> The problem is how to find the changes responsible for this instability?=
=C2=A0 I'm sure they aren't
> caused by parisc specific changes.=C2=A0 It would take a very long time =
to bisect and test, and it would
> be very easy to make a mistake bisecting because the issues are close to=
 random.
>
> So the best we can do is to analyze specific problems and try to fix the=
m.

I also faced problems with 5.15.
So I switched all hppa debian buildd servers to 5.10.90 and they are runni=
ng stable since 14 days now.
I think 5.15 isn't used widely yet, so there are probably still many non-p=
arisc related issues in it.

Helge
