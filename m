Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52AB87F0BEC
	for <lists+linux-parisc@lfdr.de>; Mon, 20 Nov 2023 07:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjKTGlT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 20 Nov 2023 01:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjKTGlS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 20 Nov 2023 01:41:18 -0500
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF354DE;
        Sun, 19 Nov 2023 22:41:14 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4DCF758099C;
        Mon, 20 Nov 2023 01:41:11 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 20 Nov 2023 01:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1700462471; x=1700469671; bh=GMBe4W7kCOnfw5jbBsNeYHAQJAqkSPPKMik
        1GPsLD4I=; b=knzWty0u7dMUHPJTocDO+Eyosbs6Z18rdAuAzLqdq5E2yHPCV85
        +vQ4FOwYamhMrvfA5/Ibk7GiCN+oYiXWfiBkwfeuPIlPrIRGgunncL8yHcqlF6kE
        4FRMvNyVm6MxScxOYwdx+exltyriSjV4jSn98n7hK7Nob7IoBP1itxUI37q7AI6j
        iWCVSf9cWLSSruPHJ3uzHLdegH4loKT/aQWWS9IuZ+QARoakKnDNG3K12jx4TQxA
        hPRZByfA2yOPSFHKapuPutwoFcwN0s0yMDIzi5VgtYm5wd7fTd1DSX27iME5eoy+
        W225qmrdUI9FdQZlh+P/+x3KOE2qcPsKHiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1700462471; x=1700469671; bh=GMBe4W7kCOnfw5jbBsNeYHAQJAqkSPPKMik
        1GPsLD4I=; b=DIQFr7qOD9de0L1l0sywh3/FI3aPur9q6VhtZ5+JSBoeXMy6y34
        yGcFn7ZHXptMLGa3iS72pFLk7RIlx7HtgZbjVQ0fuYHoh66b0BYs9bRdU6dwxneV
        4BzaAxzZGlqMSbpdOuBZn/yp52KrYVHHJaq2IwAn5WFhX3HfZf+MCuMlhOMRA8qB
        l0Lor1vB9+LP3m8QjbGEasCOzSi80jCBPmY+TewJjDV0wPzAIUfxod6KvS1LN6Nq
        ns/efCREYSNvDhQFEOcdxigj0jW2muwFec6tj2107H2N9Wof7bsXXxty1o97SqhS
        Bw2kAim0dmT/rcNWBShihZ/OI/bqpE4WTIg==
X-ME-Sender: <xms:hP9aZZ1U71oF2cgUYhVYchu8FNZczJwzh9UlAGnW00FyUpiW8RMYuQ>
    <xme:hP9aZQExniwbK4jpTv410rcCd-dsfeczpBx4GlPdR8AnechJor6hXPuJWxeB-gsYb
    ymJ7iBMr9KpmnwI20Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeghedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:hP9aZZ4briH4EEkKNug8qHQ5sn82P8oeDj8QZYSL18Duk0lZ2Mwqug>
    <xmx:hP9aZW0ifYJHMTrFmCM8HhSUeARyHebnCbtY78k558t_HfTBxdECQA>
    <xmx:hP9aZcFa9XrPHqNcdJI-xhbAcxri1Vek6j2mkAWEMwerhvOfNqft7g>
    <xmx:h_9aZflqo8i0dundzmSNt0vmQryl4PCDBRvNNK2H53aYHAryo9b5-w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 73BB9B60089; Mon, 20 Nov 2023 01:41:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <2a7bff92-8e25-4cf7-acf1-8ed054691fd8@app.fastmail.com>
In-Reply-To: <c441db4c-1851-4b09-a344-377a1684e9b5@huawei.com>
References: <20231118100827.1599422-1-wangkefeng.wang@huawei.com>
 <CAMuHMdU+MMiogx6TcBwxFL7AODZYhiAZpVHiafEBfnRsDaXTog@mail.gmail.com>
 <c441db4c-1851-4b09-a344-377a1684e9b5@huawei.com>
Date:   Mon, 20 Nov 2023 07:40:47 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Kefeng Wang" <wangkefeng.wang@huawei.com>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc:     Linux-Arch <linux-arch@vger.kernel.org>,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org,
        "Richard Henderson" <richard.henderson@linaro.org>,
        "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
        "Russell King" <linux@armlinux.org.uk>,
        "Brian Cain" <bcain@quicinc.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Nicholas Piggin" <npiggin@gmail.com>,
        "Christophe Leroy" <christophe.leroy@csgroup.eu>,
        "Yoshinori Sato" <ysato@users.sourceforge.jp>,
        "Rich Felker" <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        "Stanislav Kinsburskii" <stanislav.kinsburskii@gmail.com>
Subject: Re: [PATCH] asm/io: remove unnecessary xlate_dev_mem_ptr() and
 unxlate_dev_mem_ptr()
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Nov 20, 2023, at 01:39, Kefeng Wang wrote:
> On 2023/11/20 3:34, Geert Uytterhoeven wrote:
>> On Sat, Nov 18, 2023 at 11:09=E2=80=AFAM Kefeng Wang <wangkefeng.wang=
@huawei.com> wrote:
>>>
>>> -/*
>>> - * Convert a physical pointer to a virtual kernel pointer for /dev/=
mem
>>> - * access
>>> - */
>>> -#define xlate_dev_mem_ptr(p)   __va(p)
>>> -#define unxlate_dev_mem_ptr(p, v) do { } while (0)
>>> -
>>>   void __ioread64_copy(void *to, const void __iomem *from, size_t co=
unt);
>>=20
>> Missing #include <asm-generic/io.h>, according to the build bot repor=
t.
>
> Will check the bot report.

I had planned to pick up the series from=20

https://lore.kernel.org/lkml/20230921110424.215592-3-bhe@redhat.com/

for v6.7 but didn't make it in the end. I'll try to do it now
for v6.8 and apply your v1 patch with the Acks on top.

    Arnd
