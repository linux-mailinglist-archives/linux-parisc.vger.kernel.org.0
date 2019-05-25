Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF942A391
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 11:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfEYJBb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 05:01:31 -0400
Received: from mail-yw1-f52.google.com ([209.85.161.52]:43961 "EHLO
        mail-yw1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfEYJBb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 05:01:31 -0400
Received: by mail-yw1-f52.google.com with SMTP id t5so4604912ywf.10
        for <linux-parisc@vger.kernel.org>; Sat, 25 May 2019 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zYgO9uyIeeGJv9LGOHWDiZqjTRffqO4dRs9BqqNVK3I=;
        b=n4zZEAFMzmbnbk/YqazfTwgsDaC0f++44eZpqqoCQIUP0yyu3j4qPCtFH4iqsLAzVI
         LixZXXzeVi5ZEzk6xIRY3uPH+aGrB/16zPxmClvepgD1n0hIvae/oN85qZd+guIs4NXj
         h+Cqng5W0m/YT861RdF2D2lG0nB8HNsdDyKlA+A5ZvbirwXbHjCAxOwzHlzKSoTk98OO
         HZYOteJ9FeVi+x+NHHDZGM3aNqsT/fXiKu7Q1Lw4CZszLIGf47Fyf1bBbMuVGQKteF6m
         fdxtpjEMnvUKRBd+1vWB4RinRTxrIyXMON/kN0I0x7tZUqXJqXpzrIxpcNJ3mpTvqN0e
         O0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zYgO9uyIeeGJv9LGOHWDiZqjTRffqO4dRs9BqqNVK3I=;
        b=GWfVibvoUUG6lgKTlbeHeQwHW0vvZi0u73uJnEdKSsW+khubxXysKkeXGx42DD76Si
         yODc93dL5xreybIUC+R6OPVWaqAkZvpoUL32e9jbwscgjPuhnJ14wePTXahXqrfdCGuv
         V32RxZCgvbzYN+mBI0RVDY8bQDWJXriXu9VjujoKSgdHCm78CkADQSHGjHuUffHnqfBj
         vW8ZbsDPCtlHLUyxGc/hm8HVrab95TVUwu85sM6dBdz6AEAdT8qbn6E+wbGDtmCUO6h8
         GN3vyGKCuIHW5R/hGozIEfNzojZcxFH1fbxArFFiGnvlTEcI5USKMvi1XoP3Ttx/Qvmm
         a9rQ==
X-Gm-Message-State: APjAAAWRlIDMzBrtVsXQegvdvfdfZJH/2AUrzZPYacNh+0TQo94AbSd5
        foVUnD4jno6ZVCCJO383ThwO+7I4VjhoPPbmJ2E=
X-Google-Smtp-Source: APXvYqzwnebgg1dfUl/tzHgQ33ADEz/5EU+NveRrWGgIJn7zv4NIiMTVbwvDpp0N0f8Lb6NWIaqPC2IbMxMAFT6ItYQ=
X-Received: by 2002:a0d:d711:: with SMTP id z17mr39485801ywd.128.1558774890967;
 Sat, 25 May 2019 02:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net> <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net> <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org> <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
In-Reply-To: <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sat, 25 May 2019 11:01:27 +0200
Message-ID: <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     Grant Grundler <grantgrundler@gmail.com>
Cc:     Sven Schnelle <svens@stackframe.org>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

on  kernel 5.1, from the git repository, compiled with SMP

dmesg | grep altern
[    2.551002] alternatives: applied 156 out of 175 patches

this patch has made my day!
It seems the solution for the problem!

the card is still working after 10 hours of burn-in test!

--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -52,7 +52,6 @@ void parisc_setup_cache_timing(void);

 #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
                        ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
-                       ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) \
                        : : "r" (addr) : "memory")
 #define asm_io_sync()  asm volatile("sync" \
                        ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
