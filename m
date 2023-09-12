Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE9079D998
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Sep 2023 21:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbjILTcj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Sep 2023 15:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237447AbjILTci (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Sep 2023 15:32:38 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312BECF
        for <linux-parisc@vger.kernel.org>; Tue, 12 Sep 2023 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1694547151; x=1695151951; i=deller@gmx.de;
 bh=61TBlianlGBAFTwuBTAD3iiuY4IgZwzI4i08ZGlMDAU=;
 h=X-UI-Sender-Class:Date:To:References:From:Subject:In-Reply-To;
 b=OZKSdaCNrg1cEkeYTQjAq18Eko2SEHIqpeCSyv0d+OOs65Qlu6TkFO6cu9hllNQUJp3aCQNk5Pb
 2RrnpimbwHVohW7CK2ls27nTh05KskqnGf2i1xQuKjRlbHCOMtghtrTuyOhJnBJdSNNfTO3uxeq8m
 2I8NGE0g/iWgJJVVsWdSxMSNkcOx15wP/ACV7CIr4x5kXxwY7HruIlQxAxHaOziCe7jyaQhqXTJvg
 JbJRpK4WmdLb9F0DuPOhkGUgjhMUsUZMykfbYe5kLbXfUi9bUuvyw26ekSJ6Eda+qnnM9hPCtD57Z
 3CRtPT7YVCMPOug2qqN/WT0q1ArpicTkXVFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.148.165]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9XF-1qpBgE1bZR-0095LB; Tue, 12
 Sep 2023 21:32:31 +0200
Message-ID: <db74e45c-aa0c-0256-96f2-07ebb936d57d@gmx.de>
Date:   Tue, 12 Sep 2023 21:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-parisc@vger.kernel.org
References: <1694366957@msgid.manchmal.in-ulm.de>
From:   Helge Deller <deller@gmx.de>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
In-Reply-To: <1694366957@msgid.manchmal.in-ulm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LboqJZujrYbmCmmFPjLO6/+cTxveyQCBJUo2E8xQSmj7j2BqA7h
 Ba3kZpZm4U4DTL7FDqeRCMWLn3AJRUsQDdYnclF1DGDeeXwC7zg0ax32Br0AipxTnCEhace
 n5qqCbD6+Br4MAIyNGqnri0MAHyT4KulrtttV/DO0Nk8MzFf4L5TVuOqj6hVN50NGeHQIWd
 ugvVp6b3TU9bTNfqQh7LA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3GGcev11K4o=;1g/NnA/ARYwB/WGMDns+HpeA6nZ
 cTyssbja3ktzeTh67Gd7RnF7kQhtd7ogSYnDG0Q6iKEO4VcUuLuwB/9ZR+/xOZax1BO6I0L4J
 lnQ4N4ZOwEBNtvMsLpUwnpM2S1j/efmz3iYW6YOKQe7fB9B48DrLXd6bAue68/4eaE/uhHzhp
 mH8gnfrPbXdIzv03TVRyLz4S+ouKtgDQw1oL04DCJHvPveT4w7DOJ2VPiq0bPDDt9krY0v/i7
 nl/vcL52d/982KI+YxBtq79XYqKvw6Sr/i3lMuNxWyUwvMkMDr+4NbCgA4OQVENFDJZqBA2/A
 eNhOcPTURzsAav0M073SUCCwdNWgm2pheaSl5X0FiAZmtk56JUCEpmodfiCYgEp95njMtKjIc
 sDliNriHdpC4HdgKMFrhh9hsnp3aI+bQERXq3Uf8kfwU7Kxti7Jq/RSvl7uvO0KdMEiIj1fr8
 jHqx3W7vy0o56sYCqT7Q4wvZkJOVqdOHSnMzyNlxaaGQ7Rj5YjDeDBDuVappBpZP4BSjxesDf
 tJvIkhMUTiXpXgNvBVlBiCXhBOEpRYOVysazS58I/sKFRfwdyiQSm93yghAy8nsdu1w/DfkoB
 urFr/vQxCE9bO+L80ZPaOq2mocxTOqBqSIGnilo+zbmskV0Uk86ieQYLpVKt33bHqY4JW51aD
 4Eoh5QLNfcW+/nAvKdFQEEm4QPvJIVJH+uWrbmQ2OmCFOBVvcxQV2whZuljrFPiwhr78f32G5
 V+yn4vkDU9UTaYCbuBTBUg07J+bthi/K6x2HBb9ikYxwNXcCloj3/IIx5PIa/kLkSCbq2VXhU
 2idpJh4RbkW4UAYO+T77MucjmMT2kwbpw5C2BextUlk69ExuFQ15mD9W80Pg8y1Tzuwr+fIWb
 xQNNq3EsdLwKBBXaK3nfCAos02FE5bwstZ1mtKitF3LPARgtpstBYDgKfRayXJzTN0MCMtmmJ
 /d8pFBwCpJVRLETDTQFN+6RezJY=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Christoph,

On 9/10/23 19:48, Christoph Biedl wrote:
> For the time being, just an observation: I monitor various parameters on
> my systems, and among them is "Committed memory", the Committed_AS value
> in /proc/meminfo.
>
> Since upgrading to the 6.5.x series, I noticed the value there grows way
> higher values then previously in hppa, even if the machine is idle.
> Values seem to rise up to around 1.6 Gbyte, long-term average is rather
> 200-300 Mbyte. Also, I cannot see any memory hogs in top. The workload
> hasn't changed in months.
>
> To sum it up, I reckon something went wrong in the memory usage
> accounting. Is this already on radar, or should I start bisecting? That
> might take a lot of time, though.

I doubt there is a specific memory leak in the parisc code.
Usually we just touch driver code or other arch-related code, so if
there is something wrong, then it must be in generic code and should
be visible on other platforms too.
We changed to the SLUB allocator, but I don't think this makes any
difference either.

Helge


