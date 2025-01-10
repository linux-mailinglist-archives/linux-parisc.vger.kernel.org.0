Return-Path: <linux-parisc+bounces-3194-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED780A09B7E
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Jan 2025 20:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21C457A1FF6
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Jan 2025 19:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD1B28DB17;
	Fri, 10 Jan 2025 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aAuwYjkP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB6E28DB0E
	for <linux-parisc@vger.kernel.org>; Fri, 10 Jan 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534816; cv=none; b=UHKovsVL1QO4K6YyaKZ/cZrakcsrkLdDTIETZD6P7mZuHnNnrVtetDwgHXNwbpiJroA7HCnv5S08X9KerBCrYq3VF8Us25iy2EElaUbr6/STGQxfDWd+2CI37ghKogy9G7Jbif5OIta6SFvBl0K6DD3Wgic667kqLTlqKaI9bIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534816; c=relaxed/simple;
	bh=gGBo/k79fltK/LiW8yEcfC3C6FkuDBayaBiJeug/v8c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JSsHX/OFBthJ0JD8mfi3PXL/1p/inJH5IbZEgA8oI1pIFq7R6c39HoZTiQfku5F6MD9q2/LDBc0UJWPhNpSeZewhfgqaiKoWOK095GfvJpUqKcxMMSRFhydXRlL9UMu7cl4moNZXUw1UTiLhoF4vfH/5VGl/x52jnTsFqYdPQfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aAuwYjkP; arc=none smtp.client-ip=209.85.167.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-5400e88b7a4so1811653e87.3
        for <linux-parisc@vger.kernel.org>; Fri, 10 Jan 2025 10:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534813; x=1737139613; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=49F9KmkByYRspQkaSYzsGBFq+GnQYA+RnfOGnAD1TNs=;
        b=aAuwYjkPXRsQGBjRUE9wOqIKWx803RZKLPLeFjC0tYX3cmLVsk7KwVokFzEtu2Unpx
         +Rx/5QCuv4+Np6jm+IrS2ErMCNPaBHRZn6O0gcMU0KOf5+MUj0yo93xVdyFW0WdoY7yE
         shIrwuPVoPK7xmPvKU2SEwVXPK6QKW+keA/0cparmxf/yNAEmFOvsaO9sJO53jSRVatq
         nwEwFlTPvOdDZSOBfilZyKwlag8C8gY3TYASJYEeuaiZdacHq/8mf9Z4fsEX3MN7F+yh
         0MykYjxCfmjh4z2gPkEcbNIVZMnn98KTp6PMY2gDJQfdiOw3Ki0kEtFx/ewsA+N9XFmX
         8IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534813; x=1737139613;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49F9KmkByYRspQkaSYzsGBFq+GnQYA+RnfOGnAD1TNs=;
        b=fcKxpvBvrVkjWo6KZOsKEmGSDiTrdKZeKXczyeFSsPimCPOsu976U3dFCN6dobtk03
         0FlgQHAVXHY3eFB3GIo9TDIFaaS8QW8Qs3arwd1GeOp8HgRHzJUb0Jq9QP08I1Op2XsM
         o45b2+5C0C9909yVPNHXAEbXz5QdgpsKCn2SNiHhOXaY5HAPq6TcuOQ84DeNo45JO4DR
         j/HjNmh93mOoyCiYf8Unp3S2Cma3jb5n8brQoGdi7pFCD1t+BYpI70GcHSOksj/ZQZxO
         cHeoy5Y/Q7gnPlCMX/t3qj0UO0AvVQNb/LycODNgXkaG/xmZ0OG6T0qHN40lkDswru6u
         rJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaG+4JVnptnKtDWG+h49MVkblC1L/H5YBjp7L7M5LoVlUqV6r8MzEst9/pR0eFx995T3pIdVP++cXN6xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfPbZoFxcr4B3oN3GNAuLashZPvilr+OJiiOM3U8LlAshI7Ax3
	w2jhrdmilYWIiGsLUCg8jh1z+HkVaaB5wZFXaIV9UrPzVHbKtfSXVtGz10oFBaXfxuuhBAwWWpk
	vblXFGfyq8Q==
X-Google-Smtp-Source: AGHT+IFKWz0raFavEVPdqLi0m3c/SgK/uJNRKjAz6M2EuA2Ei6coxzOA0we1XFhGSIskVPMsumh+r4On/rf0kg==
X-Received: from wmrn35.prod.google.com ([2002:a05:600c:5023:b0:434:f2eb:aa72])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d07:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-436e269a5f5mr112362055e9.13.1736534508901;
 Fri, 10 Jan 2025 10:41:48 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:54 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-28-8419288bc805@google.com>
Subject: [PATCH RFC v2 28/29] x86/pti: Disable PTI when ASI is on
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Now that ASI has support for sandboxing userspace, although userspace
now has much more mapped than it would under KPTI, in theory none of
that data is important to protect.

Note that one particular impact of this is it makes locally defeating
KASLR easier. I don't think this is a great loss given [1] etc.

Why do we pass in an argument instead of just having
pti_check_boottime_disable() check boot_cpu_has(X86_FEATURE_ASI)? Just
for clarity: I wanted it to be at least _sort of_ visible that it would
break if you reordered asi_check_boottime_disable() afterwards.

[1]:  https://gruss.cc/files/prefetch.pdf
      and https://dl.acm.org/doi/pdf/10.1145/3623652.3623669

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/include/asm/pti.h |  6 ++++--
 arch/x86/mm/init.c         |  2 +-
 arch/x86/mm/pti.c          | 14 +++++++++++++-
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/pti.h b/arch/x86/include/asm/pti.h
index ab167c96b9ab474b33d778453db0bb550f42b0ac..79b9ba927db9b76ac3cc72cdda6f8b5fc413d352 100644
--- a/arch/x86/include/asm/pti.h
+++ b/arch/x86/include/asm/pti.h
@@ -3,12 +3,14 @@
 #define _ASM_X86_PTI_H
 #ifndef __ASSEMBLY__
 
+#include <linux/types.h>
+
 #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
 extern void pti_init(void);
-extern void pti_check_boottime_disable(void);
+extern void pti_check_boottime_disable(bool asi_enabled);
 extern void pti_finalize(void);
 #else
-static inline void pti_check_boottime_disable(void) { }
+static inline void pti_check_boottime_disable(bool asi_enabled) { }
 #endif
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index ded3a47f2a9c1f554824d4ad19f3b48bce271274..4ccf6d60705652805342abefc5e71cd00c563207 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -754,8 +754,8 @@ void __init init_mem_mapping(void)
 {
 	unsigned long end;
 
-	pti_check_boottime_disable();
 	asi_check_boottime_disable();
+	pti_check_boottime_disable(boot_cpu_has(X86_FEATURE_ASI));
 	probe_page_size_mask();
 	setup_pcid();
 
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 851ec8f1363a8b389ea4579cc68bf3300a4df27c..b7132080d3c9b6962a0252383190335e171bafa6 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -76,7 +76,7 @@ static enum pti_mode {
 	PTI_FORCE_ON
 } pti_mode;
 
-void __init pti_check_boottime_disable(void)
+void __init pti_check_boottime_disable(bool asi_enabled)
 {
 	if (hypervisor_is_type(X86_HYPER_XEN_PV)) {
 		pti_mode = PTI_FORCE_OFF;
@@ -91,6 +91,18 @@ void __init pti_check_boottime_disable(void)
 		return;
 	}
 
+	if (asi_enabled) {
+		/*
+		 * Having both ASI and PTI enabled is not a totally ridiculous
+		 * thing to do; if you want ASI but you are not confident in the
+		 * sensitivity annotations then it provides useful
+		 * defence-in-depth. But, the implementation doesn't support it.
+		 */
+		if (pti_mode != PTI_FORCE_OFF)
+			pti_print_if_insecure("disabled by ASI");
+		return;
+	}
+
 	if (pti_mode == PTI_FORCE_ON)
 		pti_print_if_secure("force enabled on command line.");
 

-- 
2.47.1.613.gc27f4b7a9f-goog


