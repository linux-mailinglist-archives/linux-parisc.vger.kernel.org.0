Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 008092735A
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2019 02:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfEWAiQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 22 May 2019 20:38:16 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:43247 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbfEWAiQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 22 May 2019 20:38:16 -0400
Received: by mail-ot1-f48.google.com with SMTP id i8so3820206oth.10
        for <linux-parisc@vger.kernel.org>; Wed, 22 May 2019 17:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yzeZ08cvO/V/TG6GyLgu+rrTi9oE8S3FunHdg7oCVes=;
        b=lUTW2QP0AL2n/QOOfY/4Bl8QKiMwZIobY4iAlVjANCH6qevCNIbRcaIFRG6gXd21ha
         h3gQiARMdaryyQFGLncmN21RD47e+CXAhYGFTN1OfpqQ2HqFwSxtSRVesY/JpTdy+GXH
         SSWH4CaIhLWBWEDqyVJiuarTvjEIIP2o3eYO+eDREA/w6wkDngxr6d16k8Tg/HFC0Q4Z
         RIB+cN6Y8HDd5kpkI9YxfPFZk8mX5UrnOlRxeQg5QyKYaIVI7UG9uC+t/n0Cd6IKMCl+
         WhnjQz/bOLJCHekKg/C8ki1vrUdAlEAQezs+u4PFkehE9+5tJGCDGDF86fEHLLIyYO2Z
         cLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yzeZ08cvO/V/TG6GyLgu+rrTi9oE8S3FunHdg7oCVes=;
        b=M88nxEzJrTlRTA2zAHWwnSwThF3Xenktm5N6iuOl6dSH2okD/LU+e7sM6cSbO8me5N
         Ogwi0kdsRdRI2zXTDdRtW/QUCmI3FhT18GenHeUD+IgdYZuQnCI7DtyN96fA4/UW5wpn
         hAALZ6budlz1pPW+pWADeUjaOKOr7rgocn0s0tKs7Vtfz6vV3H1NJJoptyTJoygjHYbD
         UCaje0wIvo7YKqiJy9zt3uOx4fTvNPjA6UivXzVQQ0bc9meT/SxL+1/DnGvULOPFWm7q
         DmspkzAPOXm9MltWYIRzwlVAFoi9+Y4ZdcxsXQ2KAb5lXyXCWBg3snEGKVzMqrFPMXSf
         Drgg==
X-Gm-Message-State: APjAAAVAMxm7LPfLsvvuRFYU3HSDAAKooG21WmliXlXnhXdNp24nhuQs
        6MiuN46f4RA0YHgMcCm3NqvMHbyUacSa5PSZiL0=
X-Google-Smtp-Source: APXvYqwHn2vCsQPbFUWIrQ3QtLHxaxsG8FtAmgEHzM90Ixd7IDAQfssKGgJIb4d6leXk3WumihiZ1gmGaK+KXtkdiNQ=
X-Received: by 2002:a9d:460d:: with SMTP id y13mr30670276ote.244.1558571895454;
 Wed, 22 May 2019 17:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
In-Reply-To: <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
From:   Grant Grundler <grantgrundler@gmail.com>
Date:   Wed, 22 May 2019 17:38:03 -0700
Message-ID: <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

+linux-parisc mailing list (public list since link at bottom is public too)

On Wed, May 22, 2019 at 9:16 AM Carlo Pisani <carlojpisani@gmail.com> wrote:
> hi
> I have been testing a few PCI-X SATA cards on C3600 and they do not
> work properly for weird not yet clear reason.
>
> Here (1) you can see what I tested, how, etc.

Hi Carlo,
It's awesome that you are testing SATA cards and running linux on a C3600.

 "not work properly" isn't a lot of information to go by.  You've been
keeping good notes at (1) and I encourage others on the parisc mailing
list to take a look.

> Cards have been recently tested on a PowerMacG4 and they do work
> perfectly. Note the PowerMacG4 is PCI64, not PCI-X, so it's the same
> as the C3600.

While PCI bus type is the same, most problems with device drivers are
at DMA Coherency/Memory ordering level.  C3600 has PA8600 processor
and you might learn more about PA-8600 processor, Astro (IOMMU), and
Elroy (PCI host controller) from
https://www.openpa.net/systems/hp-visualize_b1000_c3000_c3600.html

If you can try some experiments, start adding mb() calls after the
driver adds or removes an IO request from any list or queue.

> My feelings about a PCI-X card in the PCI64 of the C3600 is that there
> is something wrong, probably the PCIXCAP pin is missing on the BUS?

I have no idea. It's been > 10 years since I've had access to HP HW
documents or used a PCI or PCI-X bus analyzer.

I'm skeptical on your hypothesis though - HP was very thorough in
complying with PCI spec - assuming PCIXCAP pin was defined by PCI
spec.

You'd have to get a PCI protocol analyzer to collect signaling
information to see where the card fails to initialize or operate
correctly.

> What do you think?
> Carlo
>
> (1) http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&t=337

cheers,
grant
