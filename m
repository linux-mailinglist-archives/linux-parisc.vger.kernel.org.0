Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D751B616C52
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Nov 2022 19:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbiKBSgF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 2 Nov 2022 14:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiKBSgD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 2 Nov 2022 14:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14C72FFE1
        for <linux-parisc@vger.kernel.org>; Wed,  2 Nov 2022 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667414050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iOwZQK5qeETgL3wqlfHaHMAHqEn7+FhbLCJ4P7hdM2o=;
        b=AUtQ+S2xKMYXFQEbsiHOvNjJXSAp6C37S2qBKL7jBd6FLIOpe3Xpt8EOwn/MapnpV3KoGz
        wbp6F+nAso5uk7/tw/VzoSJN7NxnhOaLf9HvG7tmiP/32Q19yvivHxinRAU1iXTZQQa7ec
        EMgEsC0oM4WfuN/164eFobDdbhHvEtg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-6tM0xtqUNai9458P3FQEXQ-1; Wed, 02 Nov 2022 14:34:09 -0400
X-MC-Unique: 6tM0xtqUNai9458P3FQEXQ-1
Received: by mail-qk1-f197.google.com with SMTP id bm2-20020a05620a198200b006fa6eeee4a9so639617qkb.14
        for <linux-parisc@vger.kernel.org>; Wed, 02 Nov 2022 11:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOwZQK5qeETgL3wqlfHaHMAHqEn7+FhbLCJ4P7hdM2o=;
        b=eaFqHjkM1zUsxu6p+ERhpFPZtH5jeDe5ooKnMaAV95sjAelKLKgyjF/tsINfv4V6La
         q3XXRMXziPQd7WvzfewPboZyhVnN+onSY82UoSgJ4TwrhxoGksdMgNHmyO9tkrRMWsz1
         2RWu30XCrOd2qEZse9CKFhTZ5mrWlCs27fVA+L81qjuGqPACfU/c2+WVox3i3OgXoC04
         p7nbZ/ChI0v/ZZFSmiNlVA0g2tVkls2FWasUQHY2r775tKe2jQ3a4he0csEUZlNBhTqP
         Kjj+0wjTCSqTBVe/yqSUMv1onvYT4IQj/qp0uw4ttOrM4hEVu9x3wLXo9g3gSgEYiPRW
         yQJg==
X-Gm-Message-State: ACrzQf1xcTVvcV0IOriHmP7hi6prY2QuM5cODYhyqiCmCtfpiVrwNKdq
        Gm71yP6htBtyhh1dkqAHkllDE/ox1Q/vbqcJRMuplFU90c4kSAcZp8c6pMFipTIIA/p5cBwbcO7
        z5XGPMqi9b40VSbR0+nUKrXS8
X-Received: by 2002:a05:622a:183:b0:3a5:4255:a0fe with SMTP id s3-20020a05622a018300b003a54255a0femr5122024qtw.441.1667414048622;
        Wed, 02 Nov 2022 11:34:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM513iTu4ts5GTQjgBcRtTQiZ5hV5vnGyMiejNr5eqgULDfvGkfyMfW7xqa9AO3zDpp+iTddyQ==
X-Received: by 2002:a05:622a:183:b0:3a5:4255:a0fe with SMTP id s3-20020a05622a018300b003a54255a0femr5122009qtw.441.1667414048423;
        Wed, 02 Nov 2022 11:34:08 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006eed47a1a1esm8757820qkd.134.2022.11.02.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:34:06 -0700 (PDT)
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
Subject: [RFC PATCH v2 2/8] trace: Add trace_ipi_send_cpumask()
Date:   Wed,  2 Nov 2022 18:33:30 +0000
Message-Id: <20221102183336.3120536-1-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221102182949.3119584-1-vschneid@redhat.com>
References: <20221102182949.3119584-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

trace_ipi_raise() is unsuitable for generically tracing IPI sources due to
its "reason" argument being an uninformative string (on arm64 all you get
is "Function call interrupts" for SMP calls).

Add a variant of it that takes a exports a target CPU, a callsite and a
callback.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 include/trace/events/ipi.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/trace/events/ipi.h b/include/trace/events/ipi.h
index 0be71dad6ec03..b1125dc27682c 100644
--- a/include/trace/events/ipi.h
+++ b/include/trace/events/ipi.h
@@ -35,6 +35,28 @@ TRACE_EVENT(ipi_raise,
 	TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
 );
 
+TRACE_EVENT(ipi_send_cpumask,
+
+	TP_PROTO(const struct cpumask *cpumask, unsigned long callsite, void *callback),
+
+	TP_ARGS(cpumask, callsite, callback),
+
+	TP_STRUCT__entry(
+		__cpumask(cpumask)
+		__field(void *, callsite)
+		__field(void *, callback)
+	),
+
+	TP_fast_assign(
+		__assign_cpumask(cpumask, cpumask_bits(cpumask));
+		__entry->callsite = (void *)callsite;
+		__entry->callback = callback;
+	),
+
+	TP_printk("cpumask=%s callsite=%pS callback=%pS",
+		  __get_cpumask(cpumask), __entry->callsite, __entry->callback)
+);
+
 DECLARE_EVENT_CLASS(ipi_handler,
 
 	TP_PROTO(const char *reason),
-- 
2.31.1

