Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB47707591
	for <lists+linux-parisc@lfdr.de>; Thu, 18 May 2023 00:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjEQWmL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 17 May 2023 18:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjEQWmL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 May 2023 18:42:11 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-001.bell.net [209.71.208.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84D640CD
        for <linux-parisc@vger.kernel.org>; Wed, 17 May 2023 15:42:09 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.181.186.176]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 645C61A7009BC099
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeivddgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepvdffuefhieefvdffjeetjeelvedvveekjeevvdetffffhefhfedvfedugeeugfegnecukfhppedugedvrddukedurddukeeirddujeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddvrdeglegnpdhinhgvthepudegvddrudekuddrudekiedrudejiedpmhgrihhlfhhrohhmpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpnhgspghrtghpthhtohephedprhgtphhtthhopegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnshesshhtrggtkhhfrhgrmhgvrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprghuthhhpghushgvrhepuggr
        vhgvrdgrnhhglhhinhessggvlhhlrdhnvght
X-CM-Envelope: MS4xfOeHzwFJe4cj5hpKSAlKnOyb7QPWde2fUHvodbX4lA7k0As/MbkRCrF1T/LBY7uhVjVCLwKlOdDj82Izi70nK5UZJCxXZgk4YqDtJZYGEN+MLo/iesUf
 ofxEfwd8mvgrM9b8UdzDMKkzLY4sLEjdVxsr9z6EqYo6nqqD8bYNgjmPHU7cnnebn0mOmb4maU5TZtfdWCrvXXMy8dqMOzGTD3zCARHEs+CIXnFTe6ctG0ze
 IHtfJovhNTej1bTXpJnYO7/a2QqCBAGgcA3N1P1g+9E8SAZPC7dzj9Apm4RqT/zvX1Sv7Yq/6GvN3aARZCgyi0W7nj7Dl8x+9cnYc+IzGr7UOiexLpFRDUZm
 mL9fTFyM
X-RazorGate-Vade-Verdict: clean 0
X-CM-Analysis: v=2.4 cv=W7Nb6Tak c=1 sm=1 tr=0 ts=6465583d
 a=4B+q39mD0Bm0IdZjDiNhQQ==:117 a=4B+q39mD0Bm0IdZjDiNhQQ==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=CdBjmbDcHoxA_gq0JA4A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.181.186.176) by cmx-mtlrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 645C61A7009BC099; Wed, 17 May 2023 18:42:05 -0400
Message-ID: <b79ca871-5979-abc6-85ca-ab7747660c0d@bell.net>
Date:   Wed, 17 May 2023 18:42:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC] more progress with radeon on C8000
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <ZGJ7bTYEBGtYMNiA@p100> <ZGPsMKZQCdu5+c59@p100>
 <e7cd632a-7f9d-bb55-8357-bef82f9b7249@bell.net>
 <fcbba765-49e1-76f2-2ae7-4bc88970221e@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <fcbba765-49e1-76f2-2ae7-4bc88970221e@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-05-17 4:44 p.m., Helge Deller wrote:
>> Firmware still fails to load
>
> You need to install the debian firware package:
> apt install firmware-linux-nonfree firmware-linux-free
Thanks.  Firmware now loads.
>
>> and acceleration is disabled.
>
> Yes, if firware isn't loaded the acceleration will be disabled too.
> But even with firmware loaded the ring tests will fail on AGP cards.
Yes, ring tests still fail.

Dave

-- 
John David Anglin  dave.anglin@bell.net

