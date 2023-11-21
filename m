Return-Path: <linux-parisc+bounces-23-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A07F2EEE
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Nov 2023 14:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B6191C218BD
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Nov 2023 13:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8B3524D2;
	Tue, 21 Nov 2023 13:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="GK8CvCux"
X-Original-To: linux-parisc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A250710EC;
	Tue, 21 Nov 2023 05:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YMO/rrzpk/fT99hfnjoBUouJ6d4LW4Gzi6oHbkmZ8c8=; b=GK8CvCuxSWeygfo9fzBQ7w1Vs4
	AHDVtHC+B7b5l34WgOU4T8hL8AxjA/R28KBbaipDk0D4hrOwzQw+H4lF3/zKxSd6j8PhvbvQ8H/kU
	mvC0G7bHxk+QCFtsN/IrQH25IhpqAnxDLpT94xcqeqt0JhVUjKEjY3zPahSqxh1cVpbH4wdyA1XnA
	EEc6HJhjVub46m/4yZDEAVwMHEimt4nzQdCFAPYFuGoi14g9MZpmSq1nsXjJYotTk4AUpQxBLYgAH
	bU8R+GHn9q9X71Ne2iUYTebBIKn7f8/vyRSeY0zTMSfe7ZG4l8sDR9C8kuf0l1g5d7Lk9YmpM9qkr
	IoVjlf6w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35564 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R3e-00079c-2e;
	Tue, 21 Nov 2023 13:44:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R3g-00Cszg-PP; Tue, 21 Nov 2023 13:44:56 +0000
In-Reply-To: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 13/21] arm64: convert to arch_cpu_is_hotpluggable()
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1r5R3g-00Cszg-PP@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:44:56 +0000

Convert arm64 to use the arch_cpu_is_hotpluggable() helper rather than
arch_register_cpu().

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/kernel/setup.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 165bd2c0dd5a..42c690bb2d60 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -402,13 +402,9 @@ static inline bool cpu_can_disable(unsigned int cpu)
 	return false;
 }
 
-int arch_register_cpu(int num)
+bool arch_cpu_is_hotpluggable(int num)
 {
-	struct cpu *cpu = &per_cpu(cpu_devices, num);
-
-	cpu->hotpluggable = cpu_can_disable(num);
-
-	return register_cpu(cpu, num);
+	return cpu_can_disable(num);
 }
 
 static void dump_kernel_offset(void)
-- 
2.30.2


