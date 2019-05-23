Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25F1828DA1
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 01:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387981AbfEWXJr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 May 2019 19:09:47 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:46781 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387705AbfEWXJr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 May 2019 19:09:47 -0400
Received: by mail-ot1-f50.google.com with SMTP id j49so6975656otc.13
        for <linux-parisc@vger.kernel.org>; Thu, 23 May 2019 16:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mxauAMOj4R8Gc/TVlhK+wYQcC/F0D+rPhAQdiMU4n/g=;
        b=k88zyy5uCuyGy48JVLmYORI9TRz+cgHPke4tC+2frT0vjW9xFvYT0Q8Mzp9EYkZPP4
         Ra1/jSXB5Q3vlNoItHHLErFVqYTWmbnNmsczFRSNviKVQ/wsudzIZfBLP8hV+z7GYA+c
         7WJUUZihbwoKF8E+w4HW3UGCPSeFWqMwf5QTL7SiVZbXVyKvtsiFpWdQZRIA7rmxEIox
         uOuUO6QvhLfgCc6NnAgNk87euNxjpjSrWapxVJOfb+FWKnVZr8qGJ1uC0t4cM7ujfrqk
         NX7bkvYufyB5qnl40U2XgS9QzFrL+gi+wtX0v7gAbXop3usEfz+Gc3ACr7v0ivmctgWR
         NU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mxauAMOj4R8Gc/TVlhK+wYQcC/F0D+rPhAQdiMU4n/g=;
        b=iCGoyFBM0jK+H2mE6Lcfijon6l2F06IfMw9kqZU5shI4CBBo1CfBpqTnGLQpP8odRR
         5nIX/cjljbaJL6iZM/21spfmt3YX7fHWFORraPPOU2ap6fj6Ic8tkEcy8AUiqclVkzZg
         /sbPlVhcUlMZypyPrytrQ3sEdrPzYjId9AXDDTsXaNcIqjVsyUIAxSA5gMvboSIaxJmD
         jk+j8tYbI2zzZUCDJqAe6grTG7J/aJh5PfYg3TADMP8gFH6OgDRf0B4slfgD9Sql71R+
         3Slupxp3z8jbuu2rebQyvV9x8dPZCQAKXSXQeXzOJOM4nrigUwVZJiTSQbyoaxp9/qY+
         0wDw==
X-Gm-Message-State: APjAAAWnFdixU4FyevPejdeqJ9Tfxmpu6YuT5xN7eyEIW95yvlF+GgdQ
        b8A9gujWvgYVcb9t4LTUw/c+ebO7tasJICZFW1NOeA==
X-Google-Smtp-Source: APXvYqzAeGh6MSjJUe7QNsLISGeYsJ0O7vAH3S+HTSPC61WkUUMbybm9SBt2l6wC/nxe9eNfK/rXW0sn/6knTqcgDnc=
X-Received: by 2002:a9d:460d:: with SMTP id y13mr34703762ote.244.1558652986376;
 Thu, 23 May 2019 16:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net> <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net> <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
In-Reply-To: <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
From:   Grant Grundler <grantgrundler@gmail.com>
Date:   Thu, 23 May 2019 16:09:34 -0700
Message-ID: <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, May 23, 2019 at 6:44 AM Carlo Pisani <carlojpisani@gmail.com> wrote:
>
> maybe irrelevant, but I have just noticed this line in the dmesg
> (kernel 4.16, running on C3600)
>
> "runtime IRQ mapping not provided by arch"
>
> drivers/pci/setup-irq.c:                pci_dbg(dev, "runtime IRQ
> mapping not provided by arch\n");
>
> It's not exactly clear to me, googling I have found this
> https://patchwork.kernel.org/patch/9775659
>
> what do you think?

Red Herring (ie not a problem).

AFAIK, parisc never used firmware to route IRQ lines. For starters,
the CPUs never had an IRQ input and always used messages (equivalent
to MMIO writes) directed at a CPUs EIEM register.

IIRC, the PCI Host bus controller to route IRQ lines to slots in a
specific pattern which is hard coded in the PCI host controller
driver.  See dino (?) and elroy PCI host controller drivers.

cheers,
grant
