Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26A8D2A6C4
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 21:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbfEYTUk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 15:20:40 -0400
Received: from mail-yb1-f172.google.com ([209.85.219.172]:38641 "EHLO
        mail-yb1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfEYTUk (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 15:20:40 -0400
Received: by mail-yb1-f172.google.com with SMTP id x7so4995761ybg.5
        for <linux-parisc@vger.kernel.org>; Sat, 25 May 2019 12:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8TBDGzgmT2+HFhbssrWfB7Q0pbBOK8G1lfeC1lTFv+Y=;
        b=s+8V/NgC3OY7auBuFRrGZFhy0XNHTkmnxRk4wq7OTEJ+n5YPySxYhGN6ro13S6A2xM
         4kVw9/+qoaj/YE0Kbtzl0xBnODW9yl9JBY/PNyxw77CPlzFlAlGWZvuYDste2qwL3JUz
         oJPkSGb/3R7IaytzApxq0MaeFpSb6IRR3BhjB2yn9uwW/WQ73IB88f6dGcV6U/kToxb1
         ePgaSXFaZRhmgIzZRHFYvrbKa/MJ0vaqWM+9NdsW2qcei5n6ZMX7Wy8KuP2D/msn3vZE
         Sk7sMl+2TR343xM297v481Xm5OJaeJOL0slDvGoXbDz4Z+0zbkpmmGtAr8gXd6EvjlSo
         zXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8TBDGzgmT2+HFhbssrWfB7Q0pbBOK8G1lfeC1lTFv+Y=;
        b=CCtj57diyL7f6Gl+t+HkReAqObKdkZNixKm2spYSdsg9bcg75IaYWFiVHORF4CxFnR
         elnOn50B7k/E5D6XW6UnBjNNOb29FhElbw0mnme8rZngGrtK05aSHxLSbIXEWbB/R5sM
         q0u5ZVi9cVL0c8FJQ/N6wwNw3NMPKAWfjWz99iXPUdqau/4ekSdhxaRXpxt3Aa9qm60s
         se+hRPe5iNazZm3AlnjTOiCVjrxFLsTRMh1KzdOu+nk00WeGIa7Uiza8QBZFD0a8z7Zh
         yZx1lSx68Da5/Zs6JBshbcKqBPuIKvpMaSj4TrajWpxAk4DxAJve+LwOSNc3bzjZ61X/
         jk9g==
X-Gm-Message-State: APjAAAW24QClTBoGzSbWtZaYanVWhqEgT6saPXXiPQEfyJVe0+nlEFNt
        vgHiUoog7DDmocJB6sdS6qxB6IKRe3ihuVwt9nA=
X-Google-Smtp-Source: APXvYqxEDmH0aD1vGp+sOkMfqz/DwD3lQYel2ggQBpB2DcIVXLJ5dgNWS7WwLaLqZdbccUeu7hZXcYsvvxb+1MXGMX8=
X-Received: by 2002:a25:bcf:: with SMTP id 198mr4719784ybl.34.1558812039415;
 Sat, 25 May 2019 12:20:39 -0700 (PDT)
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
Date:   Sat, 25 May 2019 21:20:34 +0200
Message-ID: <CA+QBN9AMfD_uB2+9HaOy8-NcHOwttNiLWA-DZWnRrfZkeyzeZg@mail.gmail.com>
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

> Carlo & Sven, do you run 32- or 64-bit kernel?

8Gbyte of ram, I am on 64-bit kernel.

> Maybe the 32-bit PDC does not return the NP (iopdir_fdc) while the 64-bit PDC does?
> Otherwise we maybe should only trust this bit, if it's a "PA8700 (PCX-W2)" or higher CPU ?

Good question. I do not know. But, maybe it's related to the firmware?
C3750 seems to have an updated one.
