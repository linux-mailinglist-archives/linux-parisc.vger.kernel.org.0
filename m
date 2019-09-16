Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33FA1B438F
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Sep 2019 23:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732011AbfIPVvH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 Sep 2019 17:51:07 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39179 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfIPVvH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 Sep 2019 17:51:07 -0400
Received: by mail-pf1-f193.google.com with SMTP id i1so735611pfa.6
        for <linux-parisc@vger.kernel.org>; Mon, 16 Sep 2019 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=xp6V7t4TI41msuZLjHeJiJxJvMm/FVNjIp5RaNv7pB0=;
        b=GxWeOc7zTuDYUYajdAdbYAvaccJrikTFmD4nfJkU5HyZynSGLvmket6htoL3nQ5zp2
         KDguv9LIZhDEYjJcbEkXqf8Wdelt31PYF59BRCD3Xgjak8CdaqUWQmyi6VG7ltH/wMzS
         lGZH1OCxp9IQEGAr2GfkpzcTFFQvsNiG3J07uxe6dTiKDjcNpBaQtjj58mRDIJ9SiM0J
         QbVjb8aQfMAZib94y6RgA3SNO77dquezQl4gpLuQkOmSssGz1SqoAbYk6358P0yF4wMY
         ADheIhZ9wC1DzTbJ8C3ns09gB/g5usDCWA+toBXS/v7QUS7r8yk5cE/PF6uoyvqMoT3E
         Jwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xp6V7t4TI41msuZLjHeJiJxJvMm/FVNjIp5RaNv7pB0=;
        b=qvOacIzmPYsJl+kRnM1wNvM9LlzwN9ODc9wizvSi2YB16ZfVEEYJQpC/gP0sUFSTdl
         YUkTYY0dkMBy06SkdN2h3BK2OpzGzg37yB4pIXgCKtRUONoCVNPImgXO36FNJpY+rKJr
         a9ywky6SVdOBK4y4wSCOVDuMTAs4ZsSrQAgUXia4ml5xlnQnglLNY8lPcKLxkpJXFKE4
         wtXNgVqTxOZOhW4KhX8zX92PaRi7P90eIQQCn0e0J4vE6YcWtr+zSI6ASG7/Wc8bOczk
         ybuOG3a+sJ4UDNmsTo4UcOXW1/w3mSgH3y4J7FxcrPQsqMKZgmxuGS9i9asSiYMJpWdT
         /wzA==
X-Gm-Message-State: APjAAAUH/AJzgU8JGDktZ03OEISPPdfOMjy8gJDhdU8ONwngZfYvM/Pa
        TtY1hTG4sZyYMZJCzZTpmeMmn7xRWwCuvgVu3eAgSJXTyPU=
X-Google-Smtp-Source: APXvYqy7C4tZaSy9axxN7mQyQxUZ92Xo3jObqyg4hr2l4JdNAJ8LAt0ObeheduJ9GLIJApEveZAJFuO6Pg2ob1hVRMY=
X-Received: by 2002:aa7:83d4:: with SMTP id j20mr530608pfn.261.1568670664518;
 Mon, 16 Sep 2019 14:51:04 -0700 (PDT)
MIME-Version: 1.0
From:   Arlie Davis <arlied@google.com>
Date:   Mon, 16 Sep 2019 14:50:53 -0700
Message-ID: <CAK-9enMxA68mRYFG=2zD02guvCqe-aa3NO0YZuJcTdBWn5MPqg@mail.gmail.com>
Subject: Bug report (with fix) for DEC Tulip driver (de2104x.c)
To:     netdev@vger.kernel.org, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello. I'm a developer on GCE, Google's virtual machine platform. As
part of my work, we needed to emulate a DEC Tulip 2104x NIC, so I
implemented a basic virtual device for it.

While doing so, I believe I found a bug in the Linux driver for this
device, in de2104x.c. I see in MAINTAINERS that this is an orphaned
device driver, but I was wondering if the kernel would still accept a
patch for it.  Should I submit this patch, and if so, where should I
submit it?

Below is the commit text from my local repo, and the patch diffs
(they're quite short).

    Fix a bug in DEC Tulip driver (de2104x.c)

    The DEC Tulip Ethernet controller uses a 16-byte transfer descriptor for
    both its transmit (tx) and receive (rx) rings. Each descriptor has a
    "status" uint32 field (called opts1 in de2104x.c, and called TDES0 /
    Status in the DEC hardware specifications) and a "control" field (called
    opts2 in de2104x.c and called TDES1 / Control in the DEC
    specifications). In the "control" field, bit 30 is the LastSegment bit,
    which indicates that this is the last transfer descriptor in a sequence
    of descriptors (in case a single Ethernet frame spans more than one
    descriptor).

    The de2104x driver correctly sets LastSegment, in the de_start_xmit
    function. (The code calls it LastFrag, not LastSegment). However, in the
    interrupt handler (in function de_tx), the driver incorrectly checks for
    this bit in the status field, not the control field. This means that the
    driver is reading bits that are undefined in the specification; the
    spec does not make any guarantees at all about the contents of bits 29
    and bits 30 in the "status" field.

    The effect of the bug is that the driver may think that a TX ring entry
    is never finished, even though a compliant DEC Tulip hardware device (or
    a virtualized device, in a VM) actually did finish sending the Ethernet
    frame.

    The fix is to read the correct "control" field from the TX descriptor.

    DEC Tulip programming specification:

    https://web.archive.org/web/20050805091751/http://www.intel.com/design/network/manuals/21140ahm.pdf

    See section 4.2.2 for the specs on the transfer descriptor.

Here's my patch that fixes it:

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c
b/drivers/net/ethernet/dec/tulip/de2104x.c
index f1a2da15dd0a..3a420ceb52e5 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -545,6 +545,7 @@ static void de_tx (struct de_private *de)
        while (tx_tail != tx_head) {
                struct sk_buff *skb;
                u32 status;
+               u32 control;

                rmb();
                status = le32_to_cpu(de->tx_ring[tx_tail].opts1);
@@ -565,7 +566,8 @@ static void de_tx (struct de_private *de)
                pci_unmap_single(de->pdev, de->tx_skb[tx_tail].mapping,
                                 skb->len, PCI_DMA_TODEVICE);

-               if (status & LastFrag) {
+               control = le32_to_cpu(de->tx_ring[tx_tail].opts2);
+               if (control & LastFrag) {
                        if (status & TxError) {
                                netif_dbg(de, tx_err, de->dev,
                                          "tx err, status 0x%x\n",
