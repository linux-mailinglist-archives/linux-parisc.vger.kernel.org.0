Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD9A91BFEF
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 01:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfEMXrr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 13 May 2019 19:47:47 -0400
Received: from mail-yw1-f49.google.com ([209.85.161.49]:38821 "EHLO
        mail-yw1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfEMXrq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 13 May 2019 19:47:46 -0400
Received: by mail-yw1-f49.google.com with SMTP id b74so12473677ywe.5
        for <linux-parisc@vger.kernel.org>; Mon, 13 May 2019 16:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T2JoHeLpcgYT5WmRwz07PSeUGVLQDuFfdMgk5QS9pGg=;
        b=DwSN2JIq55N/xBX8LUz1OoPomoF2YiA1zBcdXvDtY5K37bBp6zYHIGUnGbjDnIWfzP
         L4UD5L2pI2p+X1GD/F0XQTt+FpnG+HoXt9sR/OQwVm+b5h/ZId6QQVrqCUWPUvQ2IIQO
         RfnF7fcaRT/pEzx6CEltITkbzkCUp8oC//wr0pAgQlu/+acZH/nLf5X8ZMlyaVQS8WXj
         BmeFowKTdakAZxyKBHdQtshzm0bTxvaeEaKi+Y0Zg+HC3ZXqsECN4rpDXRDg2/ju6EcU
         CTUyJxK8hX60kbIKUWrMZl2uTcu5VOUscfaCDLhDWQQUEDxr3GMkiqxk2hc3N1TOKIwF
         9U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T2JoHeLpcgYT5WmRwz07PSeUGVLQDuFfdMgk5QS9pGg=;
        b=jVJwkJch6WAQk/XMqwBLPzqVGPCoj+R4bU+ji9mH8LvR+UN3qnnpLmWZdKAt9cp+C1
         VKOFVf6Kks1K8YmBYITqbwijgkxirklECZ1gopNlAgt7sVLKsP/LHLlhNO2GJRQ0m3LC
         AFVyB2WlG5wvIhP75klPNDrcQ6khCSZDY/kOP0cxh3vEq2VNZ8l7LkjQl2F81PD2oD/h
         LOms6FvYxij1p3rKSmdBIFqoeS2bZ9Erl8J9rKqBF6ovZHWnHKiWRxyr9bKzPo8bwGCw
         NFITK2/k4q5D0umC6ALLyR6+smVutHZC4/cC1NOR7bEB18yCq7RqF8GrNLFgCMqpD/sg
         hSDg==
X-Gm-Message-State: APjAAAVAhyQ2glPrb3u1DHc+K3Ih8ClAFDS6h0hII8aeMG/2WlTKK36b
        haJsGHY+7lX6HfOlR88bv7m1zL9CH2toz09PVAE=
X-Google-Smtp-Source: APXvYqzeRxmNJKPtm5us1SeXYq/30gsVW1zV5FmQySFcPLKjerLOyUtnktaepsrdOPPf9wWypu5guMCDDHlqVp2m88U=
X-Received: by 2002:a25:84c5:: with SMTP id x5mr14963102ybm.85.1557791266067;
 Mon, 13 May 2019 16:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net> <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net> <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
In-Reply-To: <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Tue, 14 May 2019 01:47:16 +0200
Message-ID: <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
Subject: Re: C3600, sata controller
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> > The issue is probably the signaling voltage and clock rate capability.

well, I have just checked again, the Italian Wikipedia and the English
Wikipedia do not report the same things about the PCI_X

X___X

in short, the Italian Wikipedia says PCI64 = PCI_X, just PCI64 is clocked slower
while the English Wikipedia says PCI64 != PCI_X, but it doesn't explain why

And the https://www.openpa.net/bus.html#pci doc is even more confusing
in the table about the PCI buses used in PA-RISC computers overview:
why things are named differently?!?

What makes me perplex is: the PCI-X is physically a 3.3 V PCI slot
with/out a voltage level shifter.
So levels should be compatible, but so what is the difference between
64-bit PCI slot and PCI-X slot?

In my head, there shouldn't be any significant physical differences
between the slots. The newer PCI cards - 3.3V will fit and work in a
PCI-X slot, and PCI-X cards will fit in an older PCI slot as long as
the voltage - 3.3V - matches, and they should do!

Now, I am even more perplex: need to check the PCI-64 and PCI-X specs,
and compare them.
