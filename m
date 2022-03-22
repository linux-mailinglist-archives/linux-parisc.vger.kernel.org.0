Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29C84E45CC
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Mar 2022 19:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237228AbiCVSQ3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Mar 2022 14:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232524AbiCVSQ2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Mar 2022 14:16:28 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F25621E2E
        for <linux-parisc@vger.kernel.org>; Tue, 22 Mar 2022 11:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647972880;
        bh=EhXtag+/lO7rPQPFUrU6vgnsioZaF6LQYNdgBz9q2sQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=FKybHimgBpQCo8dKhjx9QXgkHOeRRX+qlnq4A7vff1JwKyqQjOoqzMTZphrYmBFIP
         EfjBY3vrOdnJ6ppgJX+Sd95/+aeDfNwSjz+bhnpZRtZpsAgj17JfL5rsMUHY2TuG0M
         bsXx+jMH6HYJ+n3bKg442jcz256OfQMsuPa9YYYI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.191.132]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1oFEwb2LAn-010846; Tue, 22
 Mar 2022 19:14:40 +0100
Message-ID: <23931882-c00e-79b1-09ed-91c8799d0aa7@gmx.de>
Date:   Tue, 22 Mar 2022 19:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
To:     Sam James <sam@gentoo.org>, linux-parisc@vger.kernel.org
Cc:     hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xiRD3PGolxcM2ZhqRtMlexrr1bzkCRbvbS0ZXsR1qPbX9ZdL5Kw
 QQRIJvZdZJevDT2/9nDnFlybhS9p6nW+//mFplPoKUyJzZLgEEy2tBoHaLA9kNNdmNWOmZ2
 NszZwZ5Kyx0MKdGFOF9VLVs5NLvCvaDspMxiJUJo8cqVI/0DDya4LGjfYFlkX+lYOhIs9Y/
 TtVjLQgPSVhAnT0AAOmqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:v2NFwbev+Y8=:9SitLcQikyN98P18FkrqAm
 o6dxM7/212g1I5QXPmeLXYsGhWxzeqFsmeaog7Ztt3PhOw3vb85aeLE0HtUU0ezEEI2msEY6Z
 PvJ90D+we34MGpZwShsBQSL4VtAtVj0chNRUfJmkibyNwMpx67VIEdAdS8TRgh1WoXemVppme
 GpYf2HDjU6SUakWsSxEzWnEB8n8XGEMtEkVQUNoW2Jpj7CrbeE8fuIXtMdh68m8PW+ebMQVkH
 sDciFKEScw+XsNEeJy3LqUCXl7WDKamizymTKtxRzcMjMd293/9ZU5hZfwwsHATGqoTf9kBlA
 ude8GLSq/8lKrK201xYJHquX8zjxEKH7wxLGbk8bNRYGFHwCzOGCUY/zMIXC51Ni9QBGc34p+
 Z5mr/XaurDrJXrJtgxwlWzPOJh5NypkOVf4DicgrpsQDVYfA0PC3zHd5K9ryJg03u3Yyzb0FU
 Zaahe9VyybIAuQACJFxIIUdlJh1r2RUbI4gaG3KQ4Knzq8lgqkgFVMNLfYDTKP5Cr3T3WUxNj
 o4khlGdyAa39gsCivEGwZNQFgpD2RP9jWhKVqUtQD5XN0r80Zw5EmZVwGz86R6roU9RvWwvrm
 AaGWuM307XJnhvEv9A+JYlyPl979LH4e5mWki0qaW0FQOZPUaLNSw0XJsZazOxQAtjsoKhQXp
 sY8cUSxK7Ut0ejnG4209+85Suh0voFW168s7jI8FWRWEjeS2sE65gnRGNgv5g2lQl5/twFAnp
 q7hRXviCIhTwVJgpyKTS3tAfifXKVlZonxYVdYBJg4+wO1yR6itzweWqWk49Rl84QaquNBne1
 jT0282ISJ7dYATvKetKGw0tXy0wf7l2jMOpftWTMcHrUBAJDPSscM79yKErT3d00DiyncQE9g
 gy7p9zTFuqCfAVrE7lUxSsCFQ5nnLny8n+f/sU0gWSSb/fFkxhYcAn5SCHQvEfKb7MYgxbrCN
 NB1O2eGOiodCUBQarCFZBYefKHOhlLV0uQwqCrxZ5v4aJZXhElk8DR3gu6JGKqba9YNRnTvjA
 i2oAC6KDRzGwyvzp4waUL6D+30oeijAP/fHnURRF/Y5bS/S10Q8SdM0s4+JWtVuLI/GS1S/Af
 AviakjJS4eXEQA=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Sam,

On 3/22/22 18:52, Sam James wrote:
> In Gentoo, we've just got our hands on an RP3440 (PA8800) which seems to=
 quite easily hit inequivalent aliasing issues.
>
> We've found that under some workloads, the machine copes fine, none of t=
hat appears in dmesg, and all is well - even for
> over a week. But as soon as we start other workloads (the problematic on=
e is building "stages" -- release media for Gentoo),
> within 30m or so, the machine is in a broken state, with these messages =
flooding dmesg:
> ```
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
42994000 and 0x426e1000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
426e1000 and 0x41b56000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
41b56000 and 0x41aae000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
41aae000 and 0x42774000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
42774000 and 0x41202000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
41202000 and 0x428dd000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
41e2c000 and 0x418f6000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
418f6000 and 0x42980000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
42980000 and 0x426cd000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
426cd000 and 0x41b42000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
41b42000 and 0x41a9a000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
41a9a000 and 0x42760000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
42760000 and 0x411ee000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x=
411ee000 and 0x428c9000 in file bash
> ```
>
> When it's in this state, GCC ends up ICEing at some point and other user=
land command fails too (e.g. last night
> I tried unpacking a kernel and 'xz' failed the first time, but worked th=
e second). It might be of note that I think
> the failures end up happening during a HPPA 1.1 build.
>
> I appreciate this isn't really enough information to solve the problem, =
but I'm not sure what I need to obtain:
> any suggestions for how to debug this further & get more information to =
better receive assistance would be most welcome.
>
> The machine is currently running 5.17.0 along with Helge's tree up to (a=
nd including) Linus's pull for 5.18.0
> (https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git=
/commit/?h=3Dfor-next&id=3Da04b1bf574e1f4875ea91f5c62ca051666443200).

The INEQUIVALENT ALIASES messages are most likely not related to the insta=
bility
of your machine. I see them randomly on the debian buildd servers as well.

Instead of using the latest (development) kernels, I'd suggest that you
first try with a "stable" kernel.
On the debian buildd servers I'm currently running Kernel 5.10.106+, which=
 is pretty stable.
I think Dave is running 5.16.x quite ok.

> We're also using GCC 11.2 (but a snapshot from their stable 11 branch), =
glibc 2.34 (with latest patches), and latest
> Binutils 2.37 (with patches from upstream again).
>
> I've also attached the running kernel config in case any suggestions can=
 be made there to either aid debugging or
> reduce the chances of this issue occurring.
>
> TL:DR: Lots of inequivalent aliases issues when running certain intensiv=
e workloads (but not others?), system ends up
> in a bad state and needs a reboot to function correctly (otherwise userl=
and may misbehave/crash), need more help
> with how to debug/get more information out of it/narrow it down.
>
> Of course, if needed, we can provide access to the machine for kernel ma=
intainers and show them how to induce a broken
> State (or do it for them repeatedly) if we can't find a smaller test cas=
e.

Is there any other output in dmesg which is not INEQUIVALENT ALIASES?
E.g. "stuck processes" messages?

Helge
