Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0A5A27E74
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2019 15:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730681AbfEWNoZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 May 2019 09:44:25 -0400
Received: from mail-yb1-f170.google.com ([209.85.219.170]:40537 "EHLO
        mail-yb1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730549AbfEWNoY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 May 2019 09:44:24 -0400
Received: by mail-yb1-f170.google.com with SMTP id g62so2279665ybg.7
        for <linux-parisc@vger.kernel.org>; Thu, 23 May 2019 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lBEvz1/eov6t4QWEvVy0qSN/fhnv6zs1kBBX4AcxKWQ=;
        b=n7qkTtzmyTCMqBh+vgwHZtthFuB6rKfWdo/wRtmaavF99ooA6VHWLoIPy82+r4VVbr
         h14CAR6PHGTm/57v6/iAOUD4Y1IORJwj6IILm2j26I62AZAmwD9afU8nXu7xUk5HhBOf
         +bIAatjvQePlMehP/qd2XDxgH/To/Ma2mgp1xAlXuEqszX6t9l5XG+myMDcZyKT9MGQI
         3b5CVY2HAly+pfEcjg5Z1iBN6h/kmO6vrqPfONhmiAR7o+DIUmwX0ojsSmVkS0VL57kg
         oyHMpgGN8cNjDVuShifxEZ4w2hx0h1S1IgZjgWyf4U+VXqr7Kp3dfT32MPGcQz0JTyOi
         Cs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lBEvz1/eov6t4QWEvVy0qSN/fhnv6zs1kBBX4AcxKWQ=;
        b=FPDyyuzGoTKdHFwDhFh1a+HzfB1Ff1hXmcHeWimOxZlzXp94VMSriIK9yKVU/5yLwO
         pNY9BhWt00Zi8UIrcIKJtMy0FwyHi4Ow6bM9LbShXjid4+uvZF4cuNmLbmw49cuUgU3y
         qBtH35ZyMzv7tZcS8L43RVlZuZ7ON/7M/fSNlJ5/WEnn1y9dWHushOlz133lVDq3Qkld
         sWjJ9WNj82427oItLJ9JDeTDbpzdWTMtcJz8oIKHvpd0rF7zCB/OBNU9STxRPrE8XEAu
         msCqB12aC+7ZO4ILcXo8nFe/tEX3IOf0fqpvOFk9hEIdQXPWy3DOGepzeJNRL8S8sx/q
         RCeA==
X-Gm-Message-State: APjAAAVyxRu3IfyzrBN1umxG5M2M048ZgXHV/Kf65PCJpFhk62HRo8DR
        kGEySEKY1tMwrW44lIsLt5WkwQyPnm8ZmJBix90tQOK2
X-Google-Smtp-Source: APXvYqw3U/fToJPUpCI4yGmpKHxtRrv/m7UOgtlAyZ3CbwoMG6lAdkanHUsHC62atNWBSKE1aB8pWskz2ZmFuliTXu0=
X-Received: by 2002:a25:1dd5:: with SMTP id d204mr22694029ybd.34.1558619064020;
 Thu, 23 May 2019 06:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net> <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net> <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
In-Reply-To: <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Thu, 23 May 2019 15:44:25 +0200
Message-ID: <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Grant Grundler <grantgrundler@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

maybe irrelevant, but I have just noticed this line in the dmesg
(kernel 4.16, running on C3600)

"runtime IRQ mapping not provided by arch"

drivers/pci/setup-irq.c:                pci_dbg(dev, "runtime IRQ
mapping not provided by arch\n");

It's not exactly clear to me, googling I have found this
https://patchwork.kernel.org/patch/9775659

what do you think?
