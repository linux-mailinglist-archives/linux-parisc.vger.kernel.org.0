Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0102482D13
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jan 2022 23:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiABWyp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jan 2022 17:54:45 -0500
Received: from mout.gmx.net ([212.227.15.15]:60455 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229723AbiABWyp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jan 2022 17:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641164053;
        bh=7HURSZT1U3GUAlqwNA6KvyNLPWZ8aU4ynerEFCSfdBs=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=hIKiFgTCIyyiTy9tY9sSJhStd8o0XWMMs/Zn2t1SCkuhGTOkDXxX38/qperMsQHBh
         3usNOrqPzM6HwPM/wqg+Ukg0bi46q0IKPpNxo0DZh1Fw+wu0r+pNTujHwuwAf4ZSjA
         iTJu5PUYaqItvI9McXAnvKF1IvsU94M+dh6BuImk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.152]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mo6v3-1mbOdb44z5-00pdnd; Sun, 02
 Jan 2022 23:54:13 +0100
Message-ID: <4918be47-6938-f3cb-2a21-8b6c1ed789d3@gmx.de>
Date:   Sun, 2 Jan 2022 23:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: pagefaults and hang with 5.15.11
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
 <3407744.iIbC2pHGDl@daneel.sf-tec.de> <87pmpbds1r.fsf@x1.stackframe.org>
 <2612761.mvXUDI8C0e@daneel.sf-tec.de> <87lezye8pl.fsf@x1.stackframe.org>
 <3a2b8b2b-28b6-00c6-2294-d26c450f5f81@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <3a2b8b2b-28b6-00c6-2294-d26c450f5f81@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:w/wdWXMEIUJgdvKM3p3vuM6u9Ymv7+s04g1abxyl7n1FVquZPhR
 aFE6tX8QtlTZFJSJJelBr7NARKAHy6QpSPQiuuymF+RjaAR4dd8+wJRJLGMo2soMoFity2N
 47I+IvhVtMb2DjMF+yMu4gp/hEW4v+CBgqeA4t5qANBLmlIWwlicyrwjFZd6RsHkpbeKLk7
 v2DLapMS82JUyyAPCe6zQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l1uHiM4hcMQ=:Uo3rfFqX/zcJfezP2F84R5
 fbOVW8HhzekBrvUE2sn8033wTXYrj8LQliL2Q+K3UpUIlQCnXc1laaBJVuDH6dCr5V3aXnLzL
 oLiWY+itzau3nd+uEPYc/Rc4IBfK9tOq+nMIf4OExafH0pmbgxBfT4ANpRjBzNx/hBSUeQZ1O
 I2/HyyOnye3/cfl75/94cjlkPS6T0CBJy05TlGW+CbKVqg0HGChiqCDo7OrE7UgnJTnoKR/Kg
 xi0CVrfemlPHjg1eos5l7Gp6HvhpninwuOVLZDA84rPEUP2k2DTZnvmpEu5EzsGspRvbOVZxr
 5Xyy4r++1YREZEJQAToGupqqVhYLfbHjDv1OrRjdfcr3kK36iXL2QmfkB6zSI4rK6wUwbgsox
 6lymoyMTWyHaLJqflJhoF/3MXOpiW3P8x43rwDdO0QVFkVIXxXbyR8U0fqcCf1cphZJKEpEVd
 KIahNCYphFkJq4p5hEX9MmsaMqcZKr/Km2PJY7zNBW3h++Aw7oLlDmzdjq6CQIOMah04lHKz6
 PRrEWBQiEjMX020Fv1ts/S977cxrvryT4WcIk+224UjnkwJ2qn+TtElojRBB+9i3LryuvzRRq
 NYDO7C5ECSdOfgDf0691q5qDFXQmmMiq52iltvlatTRB7s5rvPAv7/57aYkE+0ac7LbNs30l3
 YeR3S32mC/dSzCz6bder5CAxIXzkHrmBvnyu2yzIvYWXc16d4X3jqyB4Mk0gPN0rfYDykWsfX
 Uh80IrzGLO0sRZPXh+KUY2Jf6+Mg4gj0R3Wsz4P1vnyuiHYS9KGqE4S6GFRLFhlGJXpVgKTQf
 yDmfwoScnoWYgvam9h0iQ/FEcA1rP4B3u1ppfgJ7pHkA4FXDgYwYM+sGfakP6d+KMg37VvEqv
 CeW/nMpM4iulFWx4o9RJrP7LzRqwNZPyoD8Hl7VKPJynaWozxmBdZbL9VWhzjU5JjcTDPUnFv
 0ebpbiFfukhrMU+adQSwhbB80tWW9lpp6Gq2wrkCvZsUt/zi5V+ERNcVP2YRgIU3Z1s5pJP3E
 VG8r9sQ2+wENb8gVOG9CP0poKqaFz401rbd2W1/sa9/mBc2H5nHDBZzm8IRz0t1xOewHeR/05
 jRsfUPfKVqFHpA=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/2/22 23:42, John David Anglin wrote:
> On 2022-01-02 5:24 a.m., Sven Schnelle wrote:
>> Yes, when it hangs, press ESC followed by '('. This should give you the
>> BMC prompt:
>>
>> CLI>
>>
>> Enter TOC s - this will take around 10s, and reboot the box. in the boot
>> menu, you can than take a look at the TOC data with the mentioned
>> service command.
> It might be helpful to have this in wiki if it's not there.

I partly added it a few hours ago to:
https://parisc.wiki.kernel.org/index.php/How_to_report_a_parisc-linux_kernel_problem
-> Hung kernels.

Any other ideas?

Helge
