Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3E35E9590
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 20:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233029AbiIYS6r (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 14:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbiIYS6q (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 14:58:46 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888A82A706
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 11:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664132317;
        bh=FqzCnH+CEblPQKZouSx1I6qPn3HcqtKj/0cCx378GQY=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=iDB0pa8SCUpoi76xiVC5oPnYtMhUXDNQb2RLNY0Fh7ajM8aVIBOZAdosoSVIE8agi
         wIYxgNqedQd6gsxVrWITpgL0ydQhSf4nagEReR7WjGKaMOyTEg1EPFWlDU2fKbO+Df
         G4L50TrRCpIaMiPGqvJeb4rORvNKFOpWkPjvnsH0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KPq-1pKySN1s0I-010Msw; Sun, 25
 Sep 2022 20:58:37 +0200
Message-ID: <114efb2d-7f09-6a80-43d7-2a132146774f@gmx.de>
Date:   Sun, 25 Sep 2022 20:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on UP machines
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yy/7g0NzOi/igNi7@p100>
 <d195aae3-b76b-1365-6e53-28c6791c77e3@bell.net>
 <92a8b235-7d04-9931-a153-440adbc8802a@gmx.de>
 <bffa9fac-a6f6-fc7e-0e66-5df215aef2ba@bell.net>
 <e2ffc031-0e62-8e2b-82eb-aac0460a453c@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <e2ffc031-0e62-8e2b-82eb-aac0460a453c@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fj+siY+hhq09pW316vEP3GMq6wh2TqqTIPWVPAkWgiBAKcEMk7E
 mrkkrlrtE0Q0QuzReiXG+3S6eOhjuRywGohqfzZ1xn1mo/IWe+Vp9UwXOwUlcVmLxM7Jr8f
 4lbU/UgdYJMZDQt97sQU655QprZGiBCQnhYmgF2VbC7scbwQ/TOgD2HEA9qGX/86MRDh67r
 5f+WO/F0OIOEkCAtiX/Tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QIk1mMeyOi4=:DL5+GWe4n34+GqNbm1NDAl
 FNm7IcEymJ78Qd2N4nL9zObJvn5GIJUtgrigmpu/GUCN+8hAhA1Gy/YtR7q0Pz5g15Jj3T34W
 63UG48wudEDT0JgIxIfFzQSDRAXcnYKyylcI6CpEJRENx4Zd2kOlqOkRelNfxjiwZTjdSxEb4
 h98WfEq20HZ9147z7vgZLQ76A/XmGf87SiAsszWJHJtL3i8SpYDkFqkiuGr2Eov7LLqUP59OG
 uccbiYq65YFhQFROWVOjiP1oTq0HPbQ41Pw5M3AEGiF3+8qpI/v8CcKC7IMa5G+5aF6eYYD+d
 XzhzkUDKhN7BAxKywvP8qn2z4WrxFaChSjn4cSVxzHninvZXZHLHWc4356QZ4hy9le98+Q/3z
 G2oi8DBEu1iMlyxn1r/joXHjqGS9R4aghVhKraEUIyVSfaWkDyDnqYxYUq4jgr/gM8nt0Xch1
 N/cf609UyYHN0hcHuS6oHCRaAM1UXsOaP6LLHIYS8xfy8gA9qeukk9v0S74DMeHI9d+Cy3bS8
 TZKKsmZ4Re0sgjsJTiqW5MIXNOaeZlcRli866Bld//B1R7ntl7VQA5Ezw1cDZyJg7XgryJfVw
 FMKtZSbevlcJ0uhu0wu93q3uf7uaokjpkbkyTSrMG1Uq8lb1RTiADH1qaxQEeqcRt/5jAMrHH
 Hl0lxkElgQwsdNiDoXzX7zwvkrw0HyUOEb96tOCfWm9F3W/1HksBrBVnkFVsvGIAzdgbA9Mm+
 eHTGJQZSjmj570a5eTZ4GsqpdoCOccrODq5GfK8bkWaR3CSk3uDJfK0vVRS7GxZ7b46qgqdr9
 Xcz6P3tYekSoA5lyhJ3i/EVydvtP+1nM5EOaC1RAm8uSljpBQ7pUMgb7aAj1qzNhARpZmf3+o
 g4+qNWp2lKNLXY3eCIl6mlSHMoksnhi+pjvegzuSaRStjmvZywNWZajfAQnw6rptot1yj1GPG
 x9+n7d6KSJDmdSpPu36rPn98hYuy7w8tMvOSzDci+AqpOi3d/5fkjEgolWI8fp9vWkOzlIVIw
 t6I/F1KtpLuDLQQNiqCBW7lSDZpaHTEipQkF+GqryTvObtMH6Chnn/mpJq1nk/m3K+yRzIrEz
 R4tmuf/21ihouT6T2A1+RUkSc6NmDsG12pbuxWgxgzIH3czg6MALgg48Xh2BG4fkv3zFe0hM3
 aU9sCxK9BHfPlJ65pa04dlihpZ
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/25/22 20:44, John David Anglin wrote:
> On 2022-09-25 2:19 p.m., John David Anglin wrote:
>>> One=C2=A0goal=C2=A0of=C2=A0that=C2=A0patch=C2=A0was=C2=A0to=C2=A0drop=
=C2=A0the=C2=A0CONFIG_PA20=C2=A0ifdef=C2=A0case,
>>> because=C2=A0a=C2=A032-bit=C2=A0kernel=C2=A0could=C2=A0be=C2=A0compile=
d=C2=A0for=C2=A0PA8000=C2=A0in=C2=A0which=C2=A0case
>>> the=C2=A0"pdtlb,l"=C2=A0will=C2=A0burn=C2=A0the=C2=A0machine.
>> Don't=C2=A0think=C2=A0so.=C2=A0=C2=A0"pdtlb,l"=C2=A0is=C2=A0available=
=C2=A0on=C2=A0all=C2=A0PA=C2=A02.0=C2=A0machines.=C2=A0It's=C2=A0not=C2=A0=
64-bit=C2=A0specific.
> There is some difference in implementation between PA 1.1 and 2.0. 64-bi=
t register
> values are used in the PA 2.0 implementation.

That's right.
But if you build a 32-bit kernel and choose to optimize for PA8x00 CPUs,
the CONFIG_PA20 is set and the local-purge is used unconditionally.
That breaks e.g. when running such a kernel in qemu (which is 32-bit only)=
.
See my just-posted patch.

Helge
