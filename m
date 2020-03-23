Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA5418F64C
	for <lists+linux-parisc@lfdr.de>; Mon, 23 Mar 2020 14:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgCWNvo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 23 Mar 2020 09:51:44 -0400
Received: from foss.arm.com ([217.140.110.172]:49624 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728663AbgCWNvm (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 23 Mar 2020 09:51:42 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7313A11B3;
        Mon, 23 Mar 2020 06:51:42 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E1E13F52E;
        Mon, 23 Mar 2020 06:51:41 -0700 (PDT)
From:   Qais Yousef <qais.yousef@arm.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Qais Yousef <qais.yousef@arm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Richard Fontana <rfontana@redhat.com>,
        Armijn Hemel <armijn@tjaldur.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org
Subject: [PATCH v4 12/17] parisc: Replace cpu_up/down with add/remove_cpu
Date:   Mon, 23 Mar 2020 13:51:05 +0000
Message-Id: <20200323135110.30522-13-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323135110.30522-1-qais.yousef@arm.com>
References: <20200323135110.30522-1-qais.yousef@arm.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The core device API performs extra housekeeping bits that are missing
from directly calling cpu_up/down.

See commit a6717c01ddc2 ("powerpc/rtas: use device model APIs and
serialization during LPM") for an example description of what might go
wrong.

This also prepares to make cpu_up/down a private interface for anything
but the cpu subsystem.

Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Qais Yousef <qais.yousef@arm.com>
CC: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
CC: Helge Deller <deller@gmx.de>
CC: Richard Fontana <rfontana@redhat.com>
CC: Armijn Hemel <armijn@tjaldur.nl>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: linux-parisc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 arch/parisc/kernel/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 13f771f74ee3..7f2d0c0ecc80 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -212,7 +212,7 @@ static int __init processor_probe(struct parisc_device *dev)
 #ifdef CONFIG_SMP
 	if (cpuid) {
 		set_cpu_present(cpuid, true);
-		cpu_up(cpuid);
+		add_cpu(cpuid);
 	}
 #endif
 
-- 
2.17.1

