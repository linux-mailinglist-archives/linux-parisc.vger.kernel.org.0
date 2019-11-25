Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 644F0108CEE
	for <lists+linux-parisc@lfdr.de>; Mon, 25 Nov 2019 12:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbfKYL2T (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 25 Nov 2019 06:28:19 -0500
Received: from foss.arm.com ([217.140.110.172]:49048 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727779AbfKYL2S (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 25 Nov 2019 06:28:18 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C678511D4;
        Mon, 25 Nov 2019 03:28:17 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 914F53F52E;
        Mon, 25 Nov 2019 03:28:16 -0800 (PST)
From:   Qais Yousef <qais.yousef@arm.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Qais Yousef <qais.yousef@arm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Richard Fontana <rfontana@redhat.com>,
        Armijn Hemel <armijn@tjaldur.nl>, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/14] parisc: Replace cpu_up/down with device_online/offline
Date:   Mon, 25 Nov 2019 11:27:48 +0000
Message-Id: <20191125112754.25223-9-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125112754.25223-1-qais.yousef@arm.com>
References: <20191125112754.25223-1-qais.yousef@arm.com>
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
 arch/parisc/kernel/processor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 13f771f74ee3..4dde5fe78f0c 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -212,7 +212,9 @@ static int __init processor_probe(struct parisc_device *dev)
 #ifdef CONFIG_SMP
 	if (cpuid) {
 		set_cpu_present(cpuid, true);
-		cpu_up(cpuid);
+		lock_device_hotplug();
+		device_online(get_cpu_device(cpuid));
+		unlock_device_hotplug();
 	}
 #endif
 
-- 
2.17.1

