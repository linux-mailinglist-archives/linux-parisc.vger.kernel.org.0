Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6BC433F1E
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Oct 2021 21:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhJSTUV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Oct 2021 15:20:21 -0400
Received: from outbound5h.eu.mailhop.org ([18.156.94.234]:21006 "EHLO
        outbound5h.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhJSTUU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Oct 2021 15:20:20 -0400
X-Greylist: delayed 2762 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Oct 2021 15:20:20 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1634668322; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=N+HGt/fmzlTNhVCd2EUg7+0ARMHmZmEDbPqPM7Vf4lpL/uH8+uf3a9ObdU1+1yW+HMYfjIniZAEoB
         ZSbnj/ZLsr7zE6LAoauoSBA3cIwRTIgfYPczqa77zzkC9Jj/qQ7db+WmO6KrxX17QAuD5YJ0pRAasT
         YSVvZXdZ7sq0xN1UHhTu2MBZcZSMv8j8iYTQUIBtqJ3MvB+c6kOCwrb2ej4R7ee34oWHq38/SSusID
         QalAJpVLq/GtS6ckJaCNDntcD6R0ML26C2jdWzDMZv/LPknuPQeuRWLuEtuKFqivLgcCYfUNa6L9Xq
         ECSmVRit8DPxSD3RcM3Pz/PkGqXGW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         dkim-signature:dkim-signature:from;
        bh=aeJiy4AbgA7EPfkCdZ5o29TxakUXWu3WA+Zc7IFdNk0=;
        b=GYZujmynAKUxPMEJyRDmV2eEb8pBekSL0O5rM89eHDz/DFS43+b4kuzlVDi7Z0JVsaa4m+5cZW3xR
         rkPFIgcL+fgiOwhKwoCnuwTjQqtK5Qu5kbGlwkHZRAIk3gYE0uOi5HbtlTpozcLjYoCNmaXlfuJDVu
         xkK+JtCBurCWrVAzH4lrICaGebHsL7WOV+jL7tXxrEFVJpL0TlveFibRCaLhoxNf7q8N2qPUk7y7gK
         oA8Crox1/DlwwagWQGOJ7LZ8fexWqIV13TQ5h7265GFqV1UuA9eYvc1RChWHKgxQT0i91pf6aY0yA1
         rt3gL1WXvYBPad6uYTa30qUPUmyQrFw==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=aeJiy4AbgA7EPfkCdZ5o29TxakUXWu3WA+Zc7IFdNk0=;
        b=khlWLCjWq92qYSAY1N/SrQhkB1D/lTq0WxFSTU/yg7UfZXZrj+jqMpbwk9WSBuK7ksio4Qmy4fJJe
         ZE1tkmmLgSZ1JaGsCnMt5hqzPjV+4RfmP2X+1y46HIqTswVNsKoEVbxF8nPmXXTxR5+DZ9OZsXJ6jw
         IwLECeAZpkmDfqjM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=aeJiy4AbgA7EPfkCdZ5o29TxakUXWu3WA+Zc7IFdNk0=;
        b=j0ibu8rY4yF+UUXMml76It+7mmo4BbBrTN9k027lo9hJrdNpNLkWx3Eqf0FTnI+9SdPVHnJiNKGAY
         RhETMV1nvQSODzB89T7SNVhO43lgHsTKP+kPilPm853tyAS2URoCiydid7rLqX3g0soLl6yYxUlxIU
         5x2ydlnxSOBUpY7aLHu9bIrDQkLyMOi9gJmZJNF1lHNggFlxP2KJ6fN2CHPhv3dJHiYrVF9FJxgpTk
         jpZCfmADLnN5+wQZHNkGFvwAJniGuiWdjRa2SvBVRQQ5uETRssAnlCjAc+45+pWTCZ5WSOExB+GgSS
         V10ZhG7A288rTBGf7kInynCuN0a4elw==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: d888373a-310a-11ec-a070-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id d888373a-310a-11ec-a070-973b52397bcb;
        Tue, 19 Oct 2021 18:32:00 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by mail.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mctu2-00Bhg0-OO; Tue, 19 Oct 2021 21:31:58 +0300
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 0/3] ftrace fixes for PA-RISC
Date:   Tue, 19 Oct 2021 20:31:49 +0200
Message-Id: <20211019183152.26191-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I tried to enable ftrace, but it didn't work. These are the required
fixes to make it work again.

Sven Schnelle (3):
  parisc: don't use dereference_function_descriptor() in trace stub
  parisc/ftrace: use static key to enable function graph
  parisc: mark xchg functions notrace

 arch/parisc/kernel/ftrace.c | 13 ++++++-------
 arch/parisc/lib/bitops.c    | 12 ++++++------
 2 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.33.0

