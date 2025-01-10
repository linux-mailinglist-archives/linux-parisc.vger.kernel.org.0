Return-Path: <linux-parisc+bounces-3180-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FABAA09B14
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Jan 2025 19:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EE3F3A6AE3
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Jan 2025 18:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B62B225774;
	Fri, 10 Jan 2025 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rN5YQ4Qg"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC3A21C175
	for <linux-parisc@vger.kernel.org>; Fri, 10 Jan 2025 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534495; cv=none; b=iIR73a0GskrLjk0o5xlICOLhulGTb+nfSfHOVuZGdJTffCtPrlmml/ABu1z/UaSuxiCEC6asrezMYTX5ZH+2tQWnXMKSc2G/rAxQ5uWoVNKKwbEzmGViGmpwX+PsqSqIO7qt11wlWxc7Dsqtm9Uv+Qq6/4pvP/q8mokYZptLPh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534495; c=relaxed/simple;
	bh=ZTZcWQBF8tUo+J/JUKmX7ofVEYD/oEfP//Lw5p3vMVE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZpIOmgq5FIPox2umMCKK1NbM2Y1MQXW971sD3Tz+MfA26aSJ5j8alBZTE3lVOqQ4efANjYinmICVqfTn5zwrP8z5XWrmDgIsB/95nDKb8qr9JAXZkVCZ8taefC37cLoySozTnnWvdS7xeo0qX83fAo8qmsomBHaFFud/YZkGDaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rN5YQ4Qg; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43582d49dacso16414215e9.2
        for <linux-parisc@vger.kernel.org>; Fri, 10 Jan 2025 10:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534475; x=1737139275; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqQy0/uo7rp5xt5hxwNN280PfwFL6RX7EFGPCdWY0es=;
        b=rN5YQ4Qgxne0RHdvEWxSnVWuekoLjrSgQpBMyjzlbrZYm1LmGg03rDRNufoGUgrqm1
         fRjnJsRo1w7eHCzSXj/ofLjpXz7q/v85GiJkPwg3IvDMvefS2fIGQzD5bW6VBiKviLbO
         87+Wrmprat2mQXyZjSWVadja9OF6qD1bXpO4ip73dKrL+K3EAHnaA+XbztJKV8wDoLON
         kcfkxi0KRxH81TX31k3jtBEx+ylXA2d/tEqiEY55nTCW+7RKk5wNZbT1mqLmIsaWEQgn
         GECj3ff34jj4uN41yAzH+erWgR/dDYYb5GbUFspw5BeL/Ys7QkcazE3NWX4+YNgn+7Cl
         M3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534475; x=1737139275;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqQy0/uo7rp5xt5hxwNN280PfwFL6RX7EFGPCdWY0es=;
        b=oYVoXAaSKqLMF/E6t3f1AbRdtinGHKCAR08F8BDZFBI7HWhn4Zm2eToVclEfU59do2
         uzJOUdeEuDMgpDtaH9hKK+4asQQlE6PXbNACmrQXhINoMyN8779/l+E90zh3o+hFtPLH
         keqyCEpTbFXG08moBnMd6AEpdiWwYrKWgXcI9tiaG+u2dtP37Uux2WndrrjMR+9yuGPK
         T5ZteuQcvRoXMUZqGJ/Odabj4QmtaqSEvgsEtY1lF311Ygo5Ab6oRGtEHAqsRqHwvy8j
         hwQ/JQfmILk5Bn+tZpEgGv1BVqWuQY4xbOHUMlwnwX9vlp0H6ywzUPPlwErXFEhg7n68
         fV6A==
X-Forwarded-Encrypted: i=1; AJvYcCVtle9Lz80UtGU2pp9S5g/BgRaArKcXQtQkjQfvKeJGZyYrN+5niGjy7zFbvyfIBH8Kt9zYD8wuS5tNVHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGpY/TVCG/jGkEjTmznhS8NON7tC4rFI+gTNlK4H0QhJ2trQ7t
	rGKwqaV+3NMT5B1hzye1VAXI0RNn6XpwhQ/Zs+ac1R+LAA5fYb6I6pAwTkeHIKWAnqSJcs38e1f
	WnqdfrtPAWw==
X-Google-Smtp-Source: AGHT+IEHMyjAf4Ii6uANDaoYyo5ZkF+D1/fwKOgm4kaaSXfegc+L5vVxTYn6WIEloGlJDmt93RFbSdb2jTZqKA==
X-Received: from wmbjt19.prod.google.com ([2002:a05:600c:5693:b0:435:4bd2:1dcd])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e44:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-436e27070b1mr106983675e9.20.1736534474969;
 Fri, 10 Jan 2025 10:41:14 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:39 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-13-8419288bc805@google.com>
Subject: [PATCH RFC v2 13/29] mm: Add __PAGEFLAG_FALSE
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

__PAGEFLAG_FALSE is a non-atomic equivalent of PAGEFLAG_FALSE.

Checkpatch-args: --ignore=COMPLEX_MACRO
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 include/linux/page-flags.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index cc839e4365c18223e68c35efd0f67e7650708e8b..7ee9a0edc6d21708fc93dfa8913dc1ae9478dee3 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -484,6 +484,10 @@ static inline int Page##uname(const struct page *page) { return 0; }
 FOLIO_SET_FLAG_NOOP(lname)						\
 static inline void SetPage##uname(struct page *page) {  }
 
+#define __SETPAGEFLAG_NOOP(uname, lname)					\
+static inline void __folio_set_##lname(struct folio *folio) { }		\
+static inline void __SetPage##uname(struct page *page) {  }
+
 #define CLEARPAGEFLAG_NOOP(uname, lname)				\
 FOLIO_CLEAR_FLAG_NOOP(lname)						\
 static inline void ClearPage##uname(struct page *page) {  }
@@ -506,6 +510,9 @@ static inline int TestClearPage##uname(struct page *page) { return 0; }
 #define TESTSCFLAG_FALSE(uname, lname)					\
 	TESTSETFLAG_FALSE(uname, lname) TESTCLEARFLAG_FALSE(uname, lname)
 
+#define __PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, lname)		\
+	__SETPAGEFLAG_NOOP(uname, lname) __CLEARPAGEFLAG_NOOP(uname, lname)
+
 __PAGEFLAG(Locked, locked, PF_NO_TAIL)
 FOLIO_FLAG(waiters, FOLIO_HEAD_PAGE)
 FOLIO_FLAG(referenced, FOLIO_HEAD_PAGE)

-- 
2.47.1.613.gc27f4b7a9f-goog


