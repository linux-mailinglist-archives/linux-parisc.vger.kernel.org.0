Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C13540EBAA
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Sep 2021 22:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbhIPU1O (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 16 Sep 2021 16:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbhIPU1N (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 16 Sep 2021 16:27:13 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D30C061756
        for <linux-parisc@vger.kernel.org>; Thu, 16 Sep 2021 13:25:52 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m3so21591067lfu.2
        for <linux-parisc@vger.kernel.org>; Thu, 16 Sep 2021 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndSLOBCyHr0CqKUTyXcxV7ueR+cLp8PrHz0AxU0LIug=;
        b=MushEZjyEhrjXlWoUV3Uqjb83CmhFXrZC4Nc+jwBRJFxxDdB8bMGjuyGmT68YyaCCu
         gjfyKlppV4mHDNlpXDh6ku01URAfSUmIod+EpYHIgBNun2WFP27ZPY17qVCMoFShjlmU
         SncI6jirQrSTS3yeyqP+cM+/8T7/q5A+dsVvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndSLOBCyHr0CqKUTyXcxV7ueR+cLp8PrHz0AxU0LIug=;
        b=4JdkNOnQ9X8T5Gl6z4WorX7+zhWsgAIoE72lnYRPWYumg+sJqBtMQcvttqErQzo65M
         pV2TAV4EkAlx1lzN+66UCLCjuyeXSq46f4QBvu7B33ElhUM1CbQnE/ztK/afJUoR+ybW
         Ayi5pmyW7bHoA/Wkme4LINU/V2zx+hRHlKYvbmSE+j6K2k4UmwqM8Py3R3JPP2OAqbCS
         JAH0wTJXH6QVU8UjuuSH3hClPJU0nWZXkDAIxynWlIh+JyljglOUECiVgXmhdIPdG2yN
         bbL3HB3fPzlfGtv87sxFQ73lmSwzJeIjCzIU1sJLKe6TxSvjMOIZ/XAYgeDtpbSCxbMN
         3vMA==
X-Gm-Message-State: AOAM531iOzBEy2DxXpfKVfWFW5S2HabrsbfPegk1HLPlIsJRtCMCaRob
        pCQtQHAcUSzZrBj8psYyyrxmZ49AnIZSsfPPCE4=
X-Google-Smtp-Source: ABdhPJzBYrcchRD+KenpRM9qAQQAbmRE9O49GOqM7LVqBB33nc6tA8S58yu1QBztFbiKDBVBe+DNNg==
X-Received: by 2002:ac2:5e24:: with SMTP id o4mr5355280lfg.522.1631823949982;
        Thu, 16 Sep 2021 13:25:49 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id u27sm96727lfm.38.2021.09.16.13.25.48
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 13:25:48 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id d42so1828427lfv.10
        for <linux-parisc@vger.kernel.org>; Thu, 16 Sep 2021 13:25:48 -0700 (PDT)
X-Received: by 2002:a2e:8107:: with SMTP id d7mr6761409ljg.68.1631823948194;
 Thu, 16 Sep 2021 13:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <YUNi6hTcS8nUrrpF@ls3530> <b3d13e4f-c9cd-495b-5df2-1080ca4d3aa3@roeck-us.net>
 <f3713fe6-2806-9d65-618b-a9d210193e60@infradead.org> <26cfe07e-98b0-ec46-9665-01d2f8761c40@roeck-us.net>
In-Reply-To: <26cfe07e-98b0-ec46-9665-01d2f8761c40@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 16 Sep 2021 13:25:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh82AyhEQmNoWzqoFQjmwaQ8XiNL3u=knmr844LKkJQTg@mail.gmail.com>
Message-ID: <CAHk-=wh82AyhEQmNoWzqoFQjmwaQ8XiNL3u=knmr844LKkJQTg@mail.gmail.com>
Subject: Re: [GIT PULL] parisc architecture warning fix for kernel v5.15-rc2
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, Helge Deller <deller@gmx.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Sep 16, 2021 at 1:10 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/16/21 1:03 PM, Randy Dunlap wrote:
> >
> > Already merged in the net tree.
>
> Ah, ok. Sorry for the noise (I already sent that patch).

Well, I _just_ got the networking pull, so now that particular problem
is solved in my tree too.

There's a few more from your list, but I _think_ they are at least
mostly pending in other trees and patch queues, so I'll ignore them
unless told otherwise.

But I've literally set aside this week to just get this mess sorted out.

Not only do I think it's time to just *fix* these damn warning issues,
but usually the week after rc1 is somewhat quiet since it takes a
while for people to find regressions.

So I have actually spent more time than I would normally consider
healthy on code that I in any normal situation wouldn't care about at
all.

(I realize that Arnd and Guenther are now scoffing at my "normally
consider healthy" since they have put even more time into this, but
hey, I usually actively try to avoid reading grotty code in areas I
don't actually care for).

So if somebody is aware of some warning situation that still remains
and doesn't seem to have any movement, please point me at all. Maybe
we can't force-enable -Wall, but I want us to be really really close.

            Linus
