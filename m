Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC201720E9
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 22:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388963AbfGWUiA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 16:38:00 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:34545 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388897AbfGWUiA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 16:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=IPmAZTF0hKh+QLwv0ELrYrxHMNKuoC35KvFMzbalBcA=; b=YidJAsUgKHlmzN6jb2OrfXWAZ2
        WFe845YkJSTlMM/dG1sr23PVa6LkPPbuYTgWeuhf2GR/1ONawS62hrWSW7gOFcoOvcCc6wJ+WEuea
        ZgZUkMgk7z7IdHqagwUWjtdrMhaVPkeApi0C/jCICh+26Xk9yFHvkHW+tPzL160AfX24=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hq1Xq-0002i7-5q; Tue, 23 Jul 2019 22:37:58 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 0/4] Add support for kprobes on ftrace
Date:   Tue, 23 Jul 2019 22:37:50 +0200
Message-Id: <20190723203754.7126-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

these patches add support for running Kprobes on ftrace infrastructure. While
at it i also fixed on bug in the code patching function and add Jump labels
to the supported features list for PA-RISC.

Regards
Sven

Sven Schnelle (4):
  parisc/ftrace: Add ARCH_SUPPORTS_FTRACE_OPS support
  parisc/ftrace: Add KPROBES_ON_FTRACE
  parisc: Update feature list
  parisc: fix race condition in patching code

 .../core/jump-labels/arch-support.txt         |  2 +-
 .../debug/kprobes-on-ftrace/arch-support.txt  |  2 +-
 arch/parisc/Kconfig                           |  2 +
 arch/parisc/include/asm/ftrace.h              |  1 +
 arch/parisc/kernel/entry.S                    | 99 +++++++++++++++++++
 arch/parisc/kernel/ftrace.c                   | 67 ++++++++++++-
 6 files changed, 166 insertions(+), 7 deletions(-)

-- 
2.20.1

