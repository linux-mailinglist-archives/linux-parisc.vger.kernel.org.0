Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24EF4616C5E
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Nov 2022 19:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbiKBSgU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 2 Nov 2022 14:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiKBSgJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 2 Nov 2022 14:36:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB182F67B
        for <linux-parisc@vger.kernel.org>; Wed,  2 Nov 2022 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667414061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QqLWPThYSO+7/uH6VGCIiG2p0FrpcxY/esl5LuglSyI=;
        b=hcb25Wuv/j1+BPGN+ZztQ1F7j4gESVpLpTCK/P6ePG7RuV+CF6/oA9H25POKTyf+sN9e1R
        goCl5QGl21VQ9GF/Tl7K4PaMNJCUbElb/7tl3BnZIkRwEGGlgt7uHyzny9otm5dQY/3ytj
        IGUhyxSedKXQSZbR8dm5dheJ/Kdr4E8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-JT5XemesMcC1jMtsGb5Srg-1; Wed, 02 Nov 2022 14:34:20 -0400
X-MC-Unique: JT5XemesMcC1jMtsGb5Srg-1
Received: by mail-qk1-f199.google.com with SMTP id bk21-20020a05620a1a1500b006be9f844c59so15840222qkb.9
        for <linux-parisc@vger.kernel.org>; Wed, 02 Nov 2022 11:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqLWPThYSO+7/uH6VGCIiG2p0FrpcxY/esl5LuglSyI=;
        b=e/HtKVxLQfvB7R/i5B3mZGdOdy0HWG3mX9cp6vosrpHac7Lmn89tsc83GJQC2lifni
         PfHyAyROFZXIj5T4kDRoHdltTw9XIT4O7KyZYter7y3xcMIHTM15lv5Eu5uXe8O3PPgU
         CV6X1VXDY/zv1W277RuYf6RABCbtO0QYzH1me0TewXn7pQItRVMHQM/BJ852zDbnRBza
         zpHEoMlIp/jhdKjDBgQ1EkeLUCsMQBe4wPi8XF9czAb7uI575qxB+p/umX8Gj23msLCu
         B9xQTnCzRINsTTlX3oFrLFu9+mRE5AI0etl8hrTJpwY/J63LCx7p1XguEo2/DbpqRHGD
         5llw==
X-Gm-Message-State: ACrzQf2lhZWuHr3GNkJem5qNHWvj2cHb97as8bVwT0Gd+lVWS6Qn83fp
        3Bk3iU8xYHeCMehqIo4FTxNvVn9/4ICiwTDEmMgfX/mQUWMhmn9Wba68h0T8eESNwCZS2CC+aX6
        3ZrcOq1U0aTXSXZFDVtGc5HWm
X-Received: by 2002:a05:620a:2185:b0:6fa:9b5:7bcd with SMTP id g5-20020a05620a218500b006fa09b57bcdmr17834813qka.689.1667414059897;
        Wed, 02 Nov 2022 11:34:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zQBXSq1wHjxRSmwTcnsY0fuwHzVoafdqUQfLwgY4gLc/C2queTj08Inp5WgKA+UYkDnhs/w==
X-Received: by 2002:a05:620a:2185:b0:6fa:9b5:7bcd with SMTP id g5-20020a05620a218500b006fa09b57bcdmr17834779qka.689.1667414059700;
        Wed, 02 Nov 2022 11:34:19 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006eed47a1a1esm8757820qkd.134.2022.11.02.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:34:18 -0700 (PDT)
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
Subject: [RFC PATCH v2 4/8] smp: Trace IPIs sent via arch_send_call_function_ipi_mask()
Date:   Wed,  2 Nov 2022 18:33:32 +0000
Message-Id: <20221102183336.3120536-3-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221102182949.3119584-1-vschneid@redhat.com>
References: <20221102182949.3119584-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This simply wraps around the arch function and prepends it with a
tracepoint, similar to send_call_function_single_ipi().

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/smp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index e2ca1e2f31274..c4d561cf50d45 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -160,6 +160,13 @@ void __init call_function_init(void)
 	smpcfd_prepare_cpu(smp_processor_id());
 }
 
+static inline void
+send_call_function_ipi_mask(const struct cpumask *mask)
+{
+	trace_ipi_send_cpumask(mask, _RET_IP_, func);
+	arch_send_call_function_ipi_mask(mask);
+}
+
 #ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
 
 static DEFINE_STATIC_KEY_FALSE(csdlock_debug_enabled);
@@ -970,7 +977,7 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 		if (nr_cpus == 1)
 			send_call_function_single_ipi(last_cpu);
 		else if (likely(nr_cpus > 1))
-			arch_send_call_function_ipi_mask(cfd->cpumask_ipi);
+			send_call_function_ipi_mask(cfd->cpumask_ipi);
 
 		cfd_seq_store(this_cpu_ptr(&cfd_seq_local)->pinged, this_cpu, CFD_SEQ_NOCPU, CFD_SEQ_PINGED);
 	}
-- 
2.31.1

