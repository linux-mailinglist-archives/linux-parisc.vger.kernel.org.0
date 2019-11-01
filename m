Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6BEECB4A
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Nov 2019 23:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfKAWSK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 Nov 2019 18:18:10 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33365 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKAWSK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 Nov 2019 18:18:10 -0400
Received: by mail-lj1-f194.google.com with SMTP id t5so11727356ljk.0
        for <linux-parisc@vger.kernel.org>; Fri, 01 Nov 2019 15:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ud8wfiXrHTzq132w2cPE58LYyKZtAiUxGmpzRikyLm0=;
        b=e4r3ID2zS8KWiE6/l7e4Dq+5yo6sc7GpXIzvBkbpzDgtIz5fN+6KE6lAKXl6D9cQNx
         Mo76ECdQCatbiuuFOJXpdePhXb0dMEco1dZ1fDQNHfvTV5FwCR3o4HCum9+fO/unvAPi
         VwjhG/RjJDUWfZZq2fzKYX7AZ4zQgEdhTl5OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ud8wfiXrHTzq132w2cPE58LYyKZtAiUxGmpzRikyLm0=;
        b=NKeWFhI9gjhjn/bKicjDHE/xEbhxU5KSxbWyU7EaNYVhFcAQsd+lh7wLjgCVIozo7w
         NudgvyYirnQTlgDepMTZ2vdHBoRZP+0lvxJoazzApYy610tcP2SXRje28KvJdP3k9kIa
         UYuKalkGPpjWp67o3XqWCP8i5LvN2D13HYzy568Y75xrsBPq5IeamiSCOvKUyWxfzvq/
         Jv34Kzy8oFpRc51E35pMG3IetH39cyGT8VNs/JnH9K5NPjO7kGLwYEuVt3YBJ9zU8DY4
         /jojuGFP4u6ORDPfgx8V914ahWm0c+18v266w9/nDePWh9X7yN35feF5LeiPzzdjYdff
         iX+g==
X-Gm-Message-State: APjAAAVGcWv8o4mCBRUiAIVfIfos9EgM4s9K+ROgG6S3UlbdFZNuvp2s
        dqsL93q4mCVfQA+EecF4q7Lhv5RVzDc=
X-Google-Smtp-Source: APXvYqz1HMQbvj8vcA3Jl9SkqdXk0uT2W3VFiJ9siflTB2YZ3rgDzSGE1/7LlW2xBxSqGBJwYpC4GA==
X-Received: by 2002:a2e:7a02:: with SMTP id v2mr4554697ljc.224.1572646687901;
        Fri, 01 Nov 2019 15:18:07 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id t4sm2774356lji.40.2019.11.01.15.18.06
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2019 15:18:07 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id x9so6875317lji.3
        for <linux-parisc@vger.kernel.org>; Fri, 01 Nov 2019 15:18:06 -0700 (PDT)
X-Received: by 2002:a2e:a407:: with SMTP id p7mr7528920ljn.148.1572646686541;
 Fri, 01 Nov 2019 15:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191101202019.GA22999@ls3530>
In-Reply-To: <20191101202019.GA22999@ls3530>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 1 Nov 2019 15:17:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whPiZSgzj_FtrDWbP1x6rssAQaD6t4zvwC_s9UbsOwM=A@mail.gmail.com>
Message-ID: <CAHk-=whPiZSgzj_FtrDWbP1x6rssAQaD6t4zvwC_s9UbsOwM=A@mail.gmail.com>
Subject: Re: [GIT PULL] parisc architecture fix for kernel v5.4
To:     Helge Deller <deller@gmx.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Nov 1, 2019 at 1:20 PM Helge Deller <deller@gmx.de> wrote:
>
> please pull a one-line fix for the parisc architecture for kernel 5.4 from:

You do say "one-line fix", but I'd still like to see a diffstat for it.

Pulled, but please check your pull-request script.

                Linus
