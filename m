Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44FAC2A6CA
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 21:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfEYTe6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 15:34:58 -0400
Received: from mail-yw1-f43.google.com ([209.85.161.43]:41751 "EHLO
        mail-yw1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfEYTe6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 15:34:58 -0400
Received: by mail-yw1-f43.google.com with SMTP id t140so2378736ywe.8
        for <linux-parisc@vger.kernel.org>; Sat, 25 May 2019 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SIBWFSDvmnU2lpd4D/oaBlHXoGiTaW7YvdiM/umnLfA=;
        b=sRwBz3qjv+iK8jg8Eah3xOpwJKqpNM7qJTvQKhWWVaTugGwEISnS8m9UB+TPzQkGFO
         e5RwBiNrmX1ErhFwR/4YKlWrr3KJrJIc+T9NaPUzIM8hNLD0Y2lOljyR7aipZDJw8DDJ
         iFSQvZOl+SuJ0DHDL4gRIKp+LQrDNTFTwC8BNgLODY4U2MChmrsZEXH+GqBcHbcM7QQO
         17BktsksI5VgCK2TulehJ9FUTPC/jr7R+uuMrHPDNAytTkhm4f1uqAGN510Xk/aGWHbk
         xxGCOgS9HEU+nHUOKlnGNqnUgkRissLjuknn3+wiTpwa7FP4WQEDklnEm6+kR3VnIq8r
         8abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SIBWFSDvmnU2lpd4D/oaBlHXoGiTaW7YvdiM/umnLfA=;
        b=ujpQccS983M2YQXUFd3vCdnWM0wUhlldEBB3t9uTtMqgnjTNXmDQerhyh0Nhzqq8l8
         edls+LRF4qRMcwSx2RKGk8wrV8VwjNbZJVbIWdAXtbBkdPEBDRoOzcw8A3Cz54q0uzyz
         DAwnJCNWY/4juR2JLB6eAaZqYAFfuPmzrEaLAD/ihU2ka4JV832VemxaRpwrBnp6ObUI
         xS8xTC6bNbqqZlWov2HigIPh2xP28QN8PCGmComQaMDlV3xC8xC2TMhfhxp7IcxuFx/Y
         1zV/iLuWtuuj0Y+ea/l9vpRTrj9EpqH0Z2eGJiv95FNwl61Pr0inLkOlTHQXNrK8O8WB
         UHIQ==
X-Gm-Message-State: APjAAAVcFuiKFHbthWcgOkGfdrcj+yEXfzbS7i9WpGaCPXdYxDllO2mM
        VU66B59s17xkJ1HJFH7fNplUGom4RdbkvbZRwtsC6zgD
X-Google-Smtp-Source: APXvYqwqQRWy51egRfXOLB68SrYBhyDM+Kit0rWmf4eXyOnK1PduF1UbyQlDWHL3fVj1TwnzI1zz67kRGEMCr6XwHZk=
X-Received: by 2002:a81:1a46:: with SMTP id a67mr50484248ywa.166.1558812897590;
 Sat, 25 May 2019 12:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org> <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
 <9aa6caf2-c9d0-8bbb-8f62-dc1becea841d@bell.net> <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
 <CA+QBN9A9jw-QsZXcDHUMZU03TY_m5=kfcmVhpUNyv-y3xy2Heg@mail.gmail.com>
 <55e937b6-a95e-d6e4-ef30-f9040f4daafd@bell.net> <20190525181304.GA5637@t470p.stackframe.org>
 <1a4a708b-09a0-cb46-1491-554df106967a@gmx.de>
In-Reply-To: <1a4a708b-09a0-cb46-1491-554df106967a@gmx.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sat, 25 May 2019 21:34:52 +0200
Message-ID: <CA+QBN9DS3MyCVeKVvrf7vkoPKk_vF9CLvyzoS8PiK92djN8PSQ@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     Helge Deller <deller@gmx.de>
Cc:     Sven Schnelle <svens@stackframe.org>,
        John David Anglin <dave.anglin@bell.net>,
        Grant Grundler <grantgrundler@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> do you run 32- or 64-bit kernel?

# uname -r
5.1.4-c3600-64bit-SMP-experimental-r049

# uname -m
parisc64
