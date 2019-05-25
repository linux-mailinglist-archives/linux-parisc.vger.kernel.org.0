Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADE82A5C2
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 19:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfEYRTV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 13:19:21 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:33963 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfEYRTV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 13:19:21 -0400
Received: by mail-yb1-f193.google.com with SMTP id x32so2004517ybh.1
        for <linux-parisc@vger.kernel.org>; Sat, 25 May 2019 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N3nDimxI7MmSDaDgEKPEBJA6XqMqiS4mACh+ZXbapFA=;
        b=ANATZrIgcywCehBDAtXIgiYDMEOoaz14a0C0ZRd+NeTdzUTfb6Rbk1tIG2ciHOi0en
         UPfQ3RIaiOBG0ygKr7kh70ievojcVhiHq0rQHHrvxngqz9Y1OBFFyxgSyGf11crM9U94
         fPX+eKBeLnnk1yJ+GST0hr4vPitSmxmLxmbW+cMt1IryDg+7JIoyZSJ9IvukgnRxQbFY
         fQCyeWMv0tDdGmc2loFXXTOik/lZy/Te5HMa8ARdrsNoDSxZHeL2dWUB2yWfIN88gKVM
         tGbUz6g8+/lfYXsQcKkrbjnRywW+ECHkJ2VJRhvYdU/1+tPtlq49z35T6eqEo5ALBsFM
         XQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N3nDimxI7MmSDaDgEKPEBJA6XqMqiS4mACh+ZXbapFA=;
        b=sER1Kj1hbUdpO5fDW0rqO4nxNRasLpinpbda/22lPsk2A630h5UO2mwP6KK4OxTaz4
         r8NAyVDfSCw4TTy/0HsJ7AmBEQ7SkJlGUvVLzYlNNGGZHyh7Z5GjFAM3q7O8+7r87kyK
         ZAUzk/faKTAEOTFNET72w9HZhbP4aWQLHh4Sb4SAve5NcNdZeW4qqQoHInFt7p1aBMue
         bp2YPuNO5cZFfe93U4Ah2Mpo1mi3zTt6w0Qvbc7/xJaX7OnEahBBDj4+Dn4jsXo5Owsq
         F871E9tzTWL8w3GMhMJ8Rf5z4HGduuRzKm1DoFdIqIAHrbcrrCLr72JcW4hwRuLiPTi3
         mqAQ==
X-Gm-Message-State: APjAAAULvLAQcQaco44kNZ6Xgqwsk4XLHOmTE/WoOZbvbAGIV6m1lSyh
        AOb3mKTc3HsDUGAGxcSZg/c4LPBKkrzDqfT2rBnFzUqY
X-Google-Smtp-Source: APXvYqw+3EleOLz9Xv1E4NG2SHj2ivwrVLoKowUTcgmR8f5e5MSyODwWn/Avroikn7sTIVqyBzNOzY6D6nVrQPfe5Es=
X-Received: by 2002:a25:bcf:: with SMTP id 198mr4469781ybl.34.1558804761017;
 Sat, 25 May 2019 10:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net> <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net> <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org> <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
 <9aa6caf2-c9d0-8bbb-8f62-dc1becea841d@bell.net> <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
In-Reply-To: <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sat, 25 May 2019 19:19:15 +0200
Message-ID: <CA+QBN9A9jw-QsZXcDHUMZU03TY_m5=kfcmVhpUNyv-y3xy2Heg@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        Grant Grundler <grantgrundler@gmail.com>,
        Sven Schnelle <svens@stackframe.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> Carlo, can you run "cat /proc/cpuinfo" and paste the output here?

# cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 552.000000
physical id     : 0
siblings        : 1
core id         : 0
capabilities    : os32 os64 nva_supported (0x03)
model           : 9000/785/C3600
model name      : Allegro W+
hversion        : 0x00005cf0
sversion        : 0x00000481
I-cache         : 512 KB
D-cache         : 1024 KB (WB, direct mapped)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 1093.63
software id     : 2007455457
PCI failmode    : soft
