Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCDC65F7ADA
	for <lists+linux-parisc@lfdr.de>; Fri,  7 Oct 2022 17:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiJGPqL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 7 Oct 2022 11:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiJGPqG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 7 Oct 2022 11:46:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB93D6170B
        for <linux-parisc@vger.kernel.org>; Fri,  7 Oct 2022 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665157562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jAXnJ0u7W03NIJPSLVmnFtjZEFHwdySA+neP8cndke0=;
        b=cnfLusFySM+0ljpD4fvEASgHjvEVbCz3ffHHY44kK+TdcF2A3qAxGr96jIASuIBSMSOSUI
        3f358q3u2HMRRN8E6suLgLsE5GTnUcdzI+/sb2YkTOtMNx4HUqwYujH7M8bqPgmMF2jRks
        Qv6qjGGV/vKNdDwoFNXGjdP6yquZpB4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-1FBdEXbAP72Q_KqTqY1_LQ-1; Fri, 07 Oct 2022 11:46:01 -0400
X-MC-Unique: 1FBdEXbAP72Q_KqTqY1_LQ-1
Received: by mail-wm1-f70.google.com with SMTP id z14-20020a05600c220e00b003be0a6b3b13so1522732wml.8
        for <linux-parisc@vger.kernel.org>; Fri, 07 Oct 2022 08:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAXnJ0u7W03NIJPSLVmnFtjZEFHwdySA+neP8cndke0=;
        b=lT3Lg26BduKpgBa2mCVwQrYJ/UdNomVcpHyntZJsI2fnvQP9dN3Zftn5QMP4WYhEjE
         WM7LuSaiv2XUOVvAKoAMtlsw0F7sLcEbnURykh9YcPCCd4gCq+p01km33I4MbNH010qr
         zRkDR0Bdy6r4LEfXTU1diKtZuI2h0QrKxIjNooS76bKLcIfO0yMI1x8pKljAAeGtnLZP
         iYu6mATS60oByTrRltUomgBTfdASFSRrXFR1hqUanBYfanxg4LvP5RgVNK9IQWgelxv/
         6iLsYy17XAUOhS/7pjSNdYE+NC8JODUoJ65YwXQSjk5Noni162bXjvFrY9DRnGJVSz6I
         22cw==
X-Gm-Message-State: ACrzQf3LSUJVFDrus/S8zxU4C3N/2AWXTqOawNO7k4YPY6Nu23N/L0lP
        DmT8DUC7vV3SOzrW6MfmD5rHV5pEte95+AWl9iw0tcbf5NykVd9Jp3cHcdRHmIST4DDzTuL38PF
        B7JHEFg3CpsSjeP2KcCFfiSNa
X-Received: by 2002:a05:600c:1d11:b0:3b4:7644:b788 with SMTP id l17-20020a05600c1d1100b003b47644b788mr4004371wms.114.1665157556409;
        Fri, 07 Oct 2022 08:45:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5EpDwoqxaA3kuqs1iO/JBIwLdmLfBJiR2SaBRc8PnLfbv3ObEmlrGj1DHjl4vmQIuUA923ig==
X-Received: by 2002:a05:600c:1d11:b0:3b4:7644:b788 with SMTP id l17-20020a05600c1d1100b003b47644b788mr4004355wms.114.1665157556194;
        Fri, 07 Oct 2022 08:45:56 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id i18-20020adfb652000000b0022e38c93195sm2339428wre.34.2022.10.07.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:45:55 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Guo Ren <guoren@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH 2/5] sched, smp: Trace send_call_function_single_ipi()
Date:   Fri,  7 Oct 2022 16:45:30 +0100
Message-Id: <20221007154533.1878285-2-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221007154145.1877054-1-vschneid@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

send_call_function_single_ipi() is the thing that sends IPIs at the bottom
of smp_call_function*() via either generic_exec_single() or
smp_call_function_many_cond(). Give it an IPI-related tracepoint.

Note that this ends up tracing any IPI sent via __smp_call_single_queue(),
which covers __ttwu_queue_wakelist() and irq_work_queue_on() "for free".

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/arm/kernel/smp.c   | 3 ---
 arch/arm64/kernel/smp.c | 1 -
 kernel/sched/core.c     | 7 +++++--
 kernel/smp.c            | 4 ++++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 978db2d96b44..3b280d55c1c4 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -48,9 +48,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mpu.h>
 
-#define CREATE_TRACE_POINTS
-#include <trace/events/ipi.h>
-
 /*
  * as from 2.5, kernels no longer have an init_tasks structure
  * so we need some other way of telling a new secondary core
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index ffc5d76cf695..937d2623e06b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -51,7 +51,6 @@
 #include <asm/ptrace.h>
 #include <asm/virt.h>
 
-#define CREATE_TRACE_POINTS
 #include <trace/events/ipi.h>
 
 DEFINE_PER_CPU_READ_MOSTLY(int, cpu_number);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 60fdc0faf1c9..14e5e137172f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -81,6 +81,7 @@
 #include <linux/sched/rseq_api.h>
 #include <trace/events/sched.h>
 #undef CREATE_TRACE_POINTS
+#include <trace/events/ipi.h>
 
 #include "sched.h"
 #include "stats.h"
@@ -3753,10 +3754,12 @@ void send_call_function_single_ipi(int cpu)
 {
 	struct rq *rq = cpu_rq(cpu);
 
-	if (!set_nr_if_polling(rq->idle))
+	if (!set_nr_if_polling(rq->idle)) {
+		trace_ipi_send_cpu(_RET_IP_, cpu);
 		arch_send_call_function_single_ipi(cpu);
-	else
+	} else {
 		trace_sched_wake_idle_without_ipi(cpu);
+	}
 }
 
 /*
diff --git a/kernel/smp.c b/kernel/smp.c
index e8cdc025a046..7a7a22d69972 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -26,6 +26,10 @@
 #include <linux/sched/debug.h>
 #include <linux/jump_label.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/ipi.h>
+#undef CREATE_TRACE_POINTS
+
 #include "smpboot.h"
 #include "sched/smp.h"
 
-- 
2.31.1

