Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294126C6D70
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Mar 2023 17:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbjCWQ0c (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Mar 2023 12:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbjCWQ0a (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Mar 2023 12:26:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2727E2D71
        for <linux-parisc@vger.kernel.org>; Thu, 23 Mar 2023 09:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679588734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Rf1EargHhjBzXfO07IgMLtInuWGSM9rCL6OoPVE8vbA=;
        b=Mz2Pv64YQ0sSR6Myj4znjH8HJN/gehooaIdPGsuPAI3fquzqLel7vIm6K+ODrakOzK6+ZM
        dFfu0ItLtTvUwwef4FDS8a5RbAMioKObk9XoZ2lXl4z1MFmZzLdb5rCADDZL6lyntc6Il/
        B9Y1mh8NuqTknuxr0isL/nfK+wR3FjA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-JdLOL-zsNhyIRjI1QV83kA-1; Thu, 23 Mar 2023 12:25:29 -0400
X-MC-Unique: JdLOL-zsNhyIRjI1QV83kA-1
Received: by mail-wr1-f69.google.com with SMTP id v30-20020adfa1de000000b002d557ec6d15so1616787wrv.18
        for <linux-parisc@vger.kernel.org>; Thu, 23 Mar 2023 09:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679588728;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf1EargHhjBzXfO07IgMLtInuWGSM9rCL6OoPVE8vbA=;
        b=EAHM49B6A3ck/mq9XzjUG4OnX6TyDfOI7qENLtAySR2i7xM9SV5/qXUbbl9YMGoPRj
         C9BJG/xfbFef/M5MhbNaQx+e6hX8KncfRw+Q8joX9EjsRLovUwXzQ09Rg3m2vUIZvbWw
         JlJXwy06TAPq0AvOOy8GZSREc99CCl0POWzQRY3L0HhUb3f9TTmQj4Jhocfi2yM/ay1O
         ny7CKXu1xCwC0QWphs5xw5ObVESf35PihhkVaXH2TgjjzfGeizUD+RU5Y5JOpRcPhYVv
         KX6zJcmPM3xf6GUWZRRJNew/04gAEjFBJgS1zeiMpFggox0Q1CQhw8qxezbs/Jbe5JPe
         FkBQ==
X-Gm-Message-State: AAQBX9ebyP4OBRtNLPRFhd5SRr8Si4Vf63CLwKaAwh+2VlLnG/yhQ+yW
        oeAepuSzZRAUB5+NXWjcPay8kD7xGtGIOjmTpj3g5sHkJGu6whnyLH+9+jCy+SmMqDlj2CeHGDT
        PHa0d7+9H967ZCm2mQlVmaZV7
X-Received: by 2002:a5d:4568:0:b0:2c7:e5f:e0e0 with SMTP id a8-20020a5d4568000000b002c70e5fe0e0mr2967366wrc.65.1679588728477;
        Thu, 23 Mar 2023 09:25:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z2pOP19Ooh7wiG9F4iyBZnUcLGOtnlVl1iiXTySJV6QCXnwRVxEdgZiRrRO9IHVKHT4hkvPQ==
X-Received: by 2002:a5d:4568:0:b0:2c7:e5f:e0e0 with SMTP id a8-20020a5d4568000000b002c70e5fe0e0mr2967333wrc.65.1679588728212;
        Thu, 23 Mar 2023 09:25:28 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id d10-20020adfe88a000000b002c70e60abd4sm16586783wrm.2.2023.03.23.09.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:25:27 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
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
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
In-Reply-To: <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
Date:   Thu, 23 Mar 2023 16:25:25 +0000
Message-ID: <xhsmhbkkjcu4q.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 22/03/23 15:04, Peter Zijlstra wrote:
> @@ -798,14 +794,20 @@ static void smp_call_function_many_cond(
>  		}
>  
>  		/*
> +		 * Trace each smp_function_call_*() as an IPI, actual IPIs
> +		 * will be traced with func==generic_smp_call_function_single_ipi().
> +		 */
> +		trace_ipi_send_cpumask(cfd->cpumask_ipi, _RET_IP_, func);

I just got a trace pointing out this can emit an event even though no IPI
is sent if e.g. the cond_func predicate filters all CPUs in the argument
mask:

  ipi_send_cpumask:     cpumask= callsite=on_each_cpu_cond_mask+0x3c callback=flush_tlb_func+0x0

Maybe something like so on top?

---
diff --git a/kernel/smp.c b/kernel/smp.c
index ba5478814e677..1dc452017d000 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -791,6 +791,8 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 			}
 		}
 
+		if (!nr_cpus)
+			goto local;
 		/*
 		 * Trace each smp_function_call_*() as an IPI, actual IPIs
 		 * will be traced with func==generic_smp_call_function_single_ipi().
@@ -804,10 +806,10 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 		 */
 		if (nr_cpus == 1)
 			send_call_function_single_ipi(last_cpu);
-		else if (likely(nr_cpus > 1))
+		else
 			send_call_function_ipi_mask(cfd->cpumask_ipi);
 	}
-
+local:
 	if (run_local && (!cond_func || cond_func(this_cpu, info))) {
 		unsigned long flags;
 

