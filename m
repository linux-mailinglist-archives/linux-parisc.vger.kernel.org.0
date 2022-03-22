Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D00904E46F6
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Mar 2022 20:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbiCVTyu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Mar 2022 15:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiCVTyt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Mar 2022 15:54:49 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D008525EB0
        for <linux-parisc@vger.kernel.org>; Tue, 22 Mar 2022 12:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647978777;
        bh=XWcRxcmwdj5q3E0jh0jpLuT/lOiqGSQATMYXIImqItw=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=EWIAW5YmgAMsv3CayhzMm98MnZGI60K8hORyxjAPOyFUftbAye8s0Ytqa0+zrU5te
         girNxaSK8WC+SNmelCre1Nn/CUrWZKWGajyQV2jvQ5sYkBZVdZjmWzVLPtVwhulkck
         QftluT7rioOL0AcvPOZnVL+B4F8ck5vB5015VPas=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.191.132]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VHG-1o7mUN2mDa-016zmC; Tue, 22
 Mar 2022 20:52:57 +0100
Message-ID: <a8756bee-e149-c03c-36cd-6842eb12d2de@gmx.de>
Date:   Tue, 22 Mar 2022 20:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
To:     Sam James <sam@gentoo.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <b84f1c67-eea7-f07a-0163-6e06b0f5f650@bell.net>
 <309C1399-6AA2-44BD-8EB9-FDB66F5D972E@gentoo.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <309C1399-6AA2-44BD-8EB9-FDB66F5D972E@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bn4RJt7yUgFKyKrnoQyoPCpWGV7tS9aLDmPQGE9vwQYplAF7Mm+
 Nqy7SgX2gsTqcUWiMgf5jfGM16668AE+Kp1lI79gKVQl6zBlxQ/a7T0+U/2AMeyuXb2XJLr
 Z3ao3exHjzztbkWwSdk+P3nz4wMsO9B4Bq0CCwPPwP24ETUKrMULIoCzhM8rR0Hf/4/TlGh
 d+IHZIts+9nwHrRu8POIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gdS116j/sAM=:bYc+rnzh8m+8+2+lZtc0s3
 6qBF+dvRer0IQYXJVXPPLFCo1k7Eo2w/7P7LIXANUpO3TM7xth0kBsnfp+oZOAM7jxqufFL9x
 din0Q548bP8jElj6+JRsquBbVrB+Oce4HChrG38IFic10QZzpCiucTvs179/VeUIpmTALPKXu
 AKM1/0TlK9VRP0iitpujsMbgfMlH9Z2+eo2T1Imgf08R0xby++k4Mt+axNaLp01njlFu6dsO8
 ek9qyTm6H4biLq8x2yYdUPrrJxYcL9eiQfZOllK0eR9YYhEN78QOfox/V2R6K7EQli2TFHheH
 11US9/gICuktRCyqPlCf7Kox9cYtSf8/g95GU5PZHOeQtrSzN8pIP2U6Wx2P12eW/UskzOwCk
 3o7kb7AQL80W/duGvBQZUKa3ZHL8ecpWNl+ZvqirPNF8JxKimFDiyN2iA6rJzvrjnmTGYctig
 VZmOlQQ9hHE+hpQ6+ReQauSk+xOTw5QTRV1C0AEwSduXIGbF01XltWWilnhad9IlepA6tuX/X
 PeSicGMznGr8nZayijYaQdsdfl6nRB4xDjRo4UjnM+Gbn8umpGTGdMeCOkjj2SINclbIqQEgP
 DajVIHaxngOm+jr6gZeC9qFkTvRVlCqp/pyPjVD07sJwG/NqF0EPWKlqGym3baLMrwM0Wkgd4
 XeoKeau3/OwL5yy7f0Id1jJcR7VKLMh/XmaAK2suRRC/ohDuEEtIQtm4yw9vtmFxKhJGvhyvw
 SxpNdHe7xRApUOg8DsqCUHsVCNcm2j9Zvm6KceorcbkS/RfGRNmDBkQgiANMFpQrnBkRYnHHe
 3tFxdle1vHAVEuJdKqFjBq6aMPN7DqlWrHRjUj0N7Hn+JlJJZ/29C9abrGOwa9aZZyEeuu8V+
 xnStpooUquxgYe1DMY3SPJUf/fAkK4eQALqKFsTSN1qqyxvVk7V9X+eI4owbkRVgfbvG3v1Ex
 M0aA9HKXSM7FaHgcqkftJxkF3NlSQVh5r1e1pqkSG0Pa23eGh0WqELYBCUUCG11e2fVGPgKGq
 528VAZZ3BORjtWeVKP5WutI3PZfTyxpydgyPnPAjx6n1sIp7O5WDLGMq/E5TUwwgZTSDocmKX
 //uIT0/BvyPtV8=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/22/22 20:37, Sam James wrote:
>> On 22 Mar 2022, at 18:19, John David Anglin <dave.anglin@bell.net> wrot=
e:
>>
>> On 2022-03-22 1:52 p.m., Sam James wrote:
>>> Hi all,
>>>
>>> In Gentoo, we've just got our hands on an RP3440 (PA8800) which seems =
to quite easily hit inequivalent aliasing issues.
>>>
>>> We've found that under some workloads, the machine copes fine, none of=
 that appears in dmesg, and all is well - even for
>>> over a week. But as soon as we start other workloads (the problematic =
one is building "stages" -- release media for Gentoo),
>>> within 30m or so, the machine is in a broken state, with these message=
s flooding dmesg:
>>> ```
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x42994000 and 0x426e1000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x426e1000 and 0x41b56000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41b56000 and 0x41aae000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41aae000 and 0x42774000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x42774000 and 0x41202000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41202000 and 0x428dd000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41e2c000 and 0x418f6000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x418f6000 and 0x42980000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x42980000 and 0x426cd000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x426cd000 and 0x41b42000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41b42000 and 0x41a9a000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x41a9a000 and 0x42760000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x42760000 and 0x411ee000 in file bash
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES =
0x411ee000 and 0x428c9000 in file bash
>> I don't think this is new.  There are no changes to the code that detec=
ts INEQUIVALENT ALIASES in the latest pull.
>>
>
> Sorry, to be clear: I wasn't trying to suggest the issue is new -- just =
saying that we've been trying 5.10, 5.15+ to
> see if latest changes helped at all, but they haven't.
>
> In our experience so far, there has been no good kernel version for us o=
n this hardware.

One of the debian buildd servers I mentioned earlier is a 4-way rp3440, an=
d 5.10 runs stable on it for me.
Did you tried plain 5.10.0, or including all patches from the stable branc=
hes?
This is the kernel config I used:
http://backup.parisc-linux.org/kernel/STABLE/debian-config

>> I've seen this before but it's not occurring in my current builds for r=
p3440 and c8000.  I've been running for-next
>> changes on c8000 for several weeks.
>>
>
> Yeah, I haven't seen this at all on my C8000 (or Gentoo's other HW, a C3=
600).
>
>> I suspect a problem with shmat but I'm not sure.

I suspected that as well, because I had the impression we still carry a pa=
tch in
debian's glibc. But I checked debian glibc sources again, and I think all =
such
relevant patches are now upstreamed.

Helge
