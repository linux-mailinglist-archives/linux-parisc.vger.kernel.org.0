Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 371C52BB5B
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 22:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfE0URD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 16:17:03 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:45282 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfE0URD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 16:17:03 -0400
Received: by mail-yw1-f66.google.com with SMTP id w18so7021923ywa.12
        for <linux-parisc@vger.kernel.org>; Mon, 27 May 2019 13:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=et5kqQIcVu5Prbj+KYZ8gCcrIJiixMrTcbTRXir8Xxo=;
        b=d/43DefyOJ6f3ZzaYwqpkyxdlC4hVhMWvYPnv4THqoXc/Khv1yMNdcfJFSLN6zntAG
         mHwTuUaH35nSw8iHHxDiPVNvM9qsHY1IqtEs0S1d/Ql0LeDxn1kllYcnMUJQ4+y4Rjv3
         wq31qyFmfZY6DRwfe8F6CYXDX3EBnwcDVSlHz+3RZZ63spov9oBtlhk2iIIbN+xEFri0
         rqEF7SxlwRexmD5CDEWoUabYOwR+1uSC/c+6sL7BvGsth6ntcxKmO7mnS9sXE90uSsFa
         BubyiClkb2E+5mM2wx10GIUg13acjWdrPB6j2aE1fI9y1Lfr5vAQ8ME8QKcU/yEv1G0k
         HABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=et5kqQIcVu5Prbj+KYZ8gCcrIJiixMrTcbTRXir8Xxo=;
        b=YSaIQr3xtZB8C7Drxwdpn8TDZ3HngnIwP8CYV6IF9YsjV8rX+anwOdOWoRdjRRTUM4
         mK1bQPHKTw5WuKwOAwlwjXTOjFAAbiUe/VmFwmKx3GgXTsIp7yxox8glEKhPFrokH1tq
         MSQLS7zY8w0P/C3u6kN0zatwpNyY+1MthE36uLSmWhgVYrLVstCYwvyDXDQqjU/w5+S8
         U3gpeLGxovLhC8QKz1DTs4M2YgtH0vhlAByKu17ogpfV3p08eDQQCKT4E/YpKjUATty5
         cTThnyUsoELRqgQqfGMJzGnkmZpXprOZtqo+jegxy5EtP5W5pHVkPDr+58mRK9k85gvw
         J/NA==
X-Gm-Message-State: APjAAAW6ZwdrnjqxJ+AI/HCNXjg5tyo6Mn+fehocn97f+BxUA78bKR8l
        GAWZF+1+b6c/3d/vzd3wP7RxbDdMEZnyP8hi4n0=
X-Google-Smtp-Source: APXvYqzgnTBo98dAcJ4l7HLvO8KDJ2pYwXOy8T+V4EuVDl1uRpm1uAplOdCwhAoFuXO5+OKJiH6Kxlctbi5BsMHw4nY=
X-Received: by 2002:a81:ee05:: with SMTP id l5mr4850019ywm.245.1558988222601;
 Mon, 27 May 2019 13:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190527192000.GA17551@ls3530.dellerweb.de> <a3f85e95-272d-86fc-916a-70928d5f07ef@bell.net>
 <a6462d98-46f5-8cad-e4ef-228ee2ea5829@gmx.de>
In-Reply-To: <a6462d98-46f5-8cad-e4ef-228ee2ea5829@gmx.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Mon, 27 May 2019 22:16:58 +0200
Message-ID: <CA+QBN9CEiVNVzpqPwCO1PtmCgbfq86NYg0CrSz_vA51cBrVJgg@mail.gmail.com>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Sven Schnelle <svens@stackframe.org>,
        Grant Grundler <grantgrundler@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> If so, does it then makes sense to a kernel parameter (e.g. "hardfail") too ?

here I am using a Kconfig line to choose the pci-failmode that has to
be compiled when I configure the kernel. It's comfortable.
