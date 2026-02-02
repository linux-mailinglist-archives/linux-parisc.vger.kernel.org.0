Return-Path: <linux-parisc+bounces-4534-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QvqxCA5IgGmt5gIAu9opvQ
	(envelope-from <linux-parisc+bounces-4534-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Mon, 02 Feb 2026 07:45:34 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D42C8EBC
	for <lists+linux-parisc@lfdr.de>; Mon, 02 Feb 2026 07:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11E81300422A
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Feb 2026 06:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271DE309F00;
	Mon,  2 Feb 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="SXIDpO//"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F33093B2
	for <linux-parisc@vger.kernel.org>; Mon,  2 Feb 2026 06:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014731; cv=pass; b=Bj4TRvGMRoz2dV5PCvibvruIB7+1XXrjzpRY2iiKT6zLC/L2WTbOPeTLZvDy/gF+u5luoCAbbCeXLs8muV+k3yqETGyWiCLWXY1OktbKuYKOasJXvHoCXsftBQPDKycWFO95AGsHnxE0m9y1VOwSlGwvdufZEYm9+T0EpdtZthY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014731; c=relaxed/simple;
	bh=M0One+f0ksXgSVh4NMgUc96YJh39MoB/brUxs7CTQCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3Ax4NbqpgRqRxYLQRGaRKxJTeVr4MkXOPJ2AeDkZq+8ZkvlIWpEQzk/ddpUq3G+j10Yie8HSN8GRWS4zZ8imUFWcgyDqnUwnSmLlzETbO6pMdZmo7O9G4X/+2Fv65Ej14/091FH9fGBoylWmly/ci6Hj8cH/eZa8zDeFev1P9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=SXIDpO//; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-352e2156450so1908244a91.3
        for <linux-parisc@vger.kernel.org>; Sun, 01 Feb 2026 22:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770014729; cv=none;
        d=google.com; s=arc-20240605;
        b=Oq3PyGZaoxBIGkgqyQD6V2SuE22hXpdYi4g+pRdmmpjFqrVzK8oUiighyg89HKxFqe
         B9B1325gd+dfWS7pRZU2UmPWcgdE5ppI2HvX2gSl+9a4rKX7D6T8hQqigCAtW692Bi03
         hVKxY7/oqbc2pV8NrtFZF4/SmIvaRjLqFH0a4YeM0Xc8b8x5FPrYEa8R+vDPChyCsyJU
         i8PUSXOK+v94PXZiZwqyW25TAF9GBDph0O9+sgRaqYU/Nl/lSdlEB5mpfblzDAhoeM+N
         a6x+KzzCyTXB1TFtd/aYZ9pnm/COipe4JBu4pkcaMTLbfrHCWC3PMWThcUlIkbL5Bb7A
         nYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xqCc9lm6oEQgjEbk7Ev8tHP5ppIT6grBO9XxI0k1xuc=;
        fh=SWmwbnvziA3tf692bXBnM/x1Z63xLBPWg/+Hw7Fp9sU=;
        b=Gtek03yP18aY+1fi9aQEkEzc+JgVWHAW8C9Jvkwo3j0OWwUXoF8UnGH35z1JAytt/K
         WuNQDV04KGUFviuyY4waBVNRyx/uxhVMtp6sQ5L5fXcg4kwIXnNEzt8fhf32R78qmASB
         KCDV2vM19NNhJLRKYdqFLC908SNaqH28NjSirZgKc4r8LfUubkIh3B0MV2rsOEFvOkd3
         +pZhQCnhiCONZF+bQhTpclBj47RctwEye6LDmvNpwuEtunYKyLi93LSXYet06HeFqMJF
         qUGHFL1QYV3Kw76cOE0E0klzOBiTBuJLB3I5w5AKKNwujFWqqrBVHx4geu5VUkWywqRa
         BS8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1770014729; x=1770619529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xqCc9lm6oEQgjEbk7Ev8tHP5ppIT6grBO9XxI0k1xuc=;
        b=SXIDpO//U89M/n74eFJC58g7KlRK+4OcfWjnNCBMb1wOgyjkiTgz5A4fQjZwEFyDhn
         UFnsgYyWwusEv/vVfhXFlkc4tGFaJaZcrCg70cNFolvu8kPKuAUyoJyx5HY78Ac/V0Yf
         8BAuWwQu/6aMmyqXv1Ctrs+3eieeKRBsX2Z4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014729; x=1770619529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqCc9lm6oEQgjEbk7Ev8tHP5ppIT6grBO9XxI0k1xuc=;
        b=VjKAxS3pYg8x+kHch823dzStnVxQrm5tvEnGJc2yckSDnoom4lgCVHmuNgbHi7JWVC
         pPncRMdtFC8CqzXT2tzDYAmqwluDHPN8M8Mqr9RKjMIfm9mJxn1BFeBFGzoq9IBxvTNr
         jN0CAqomrLbBVrJxBbCI+Az/KMnUwvsAOXjRduSXMwoJVcdD1M/9BRWcQrUHDVcy3kLx
         qd1DnE1Ins5NBM2WJ91DXjCkeV8SFHYLV4n9OPwTrbkm2aUVjyDliyY3ZTbz1A2CmLnG
         hRG0WIM06F39VpIxUWMjQiO4ISRJWncEh7M3iKkAGXy35ZcAc98WLY7QE2S0TkZuOIkJ
         5jPw==
X-Forwarded-Encrypted: i=1; AJvYcCUScOpH9cDSucjT427XyCZV0W4v2/AAvdXM2h4EqVrZ6o8qHES26tQs8QqRLiZ7EqXxAyJO8m/m2rCUIRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwVXKAwfd75zohg6XFMG360oGVJ5CK9VXproa5l9FYCHixHK2D
	9Js80NQR3Ysg8AWtx0/0SzTWrE21quiHzo5LtHhyQQQjZtExl9skvm/MTI6IxnY8VwDzv3KmdnK
	mfozX8/mHLfvkaLnjBlFZoI9tw57Um/OcUwTSsd1ygw==
X-Gm-Gg: AZuq6aIj43wElCZBdvMIHBxkG/RSDaXjAcdXenz9VK9doTIFXsrAIZqTe2amMqr0g9y
	gh4NtvwKxZPLIRB2VidFueNIaiS9BIdheeb1uHM8/GoWJqCM7BYEn2Ik2sNgiIzhtQXuG+wfuwm
	phQV1Q7y0h4CMp6AT+XGj742cf/tNXDmfb+pWEP6hXO9trmwQiiYdTIsbZ/YDfkalo5Pn1UCQs3
	FSkmD5e99n+D107bfNcXJ601r9NukRrVQctsfFAZmSSqJJ2FMWUEx5Gid/GrMjfC1fRIqMDdrZf
	tDqHSXE+LP9LPUwr7KJQkK58vUTHe33iCYH8yeD+ZT9611a9NgoJm1xaK33UYH1Okt+oQT1XnBe
	WV/pZ/EhDKHRW4e2NXchdgbvM8QMqMFwWEkVz/a5C+zhb15Gnad0xvyy6PQbCYPLC7WcCrgPRGi
	v3zOZEyeaG/4Fh5qFk8Wmthy/65wC7aAElHFU=
X-Received: by 2002:a17:90b:3a47:b0:34c:cb3c:f544 with SMTP id
 98e67ed59e1d1-3543b321237mr9934890a91.14.1770014729046; Sun, 01 Feb 2026
 22:45:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123230651.688818373@kernel.org> <20260123231521.926490888@kernel.org>
In-Reply-To: <20260123231521.926490888@kernel.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Mon, 2 Feb 2026 14:45:17 +0800
X-Gm-Features: AZwV_QgL45dE-xQAe4-3bA1NRisbqCOgt24W0Ww2hyenEOvTnYL9MVfHPqTBj1I
Message-ID: <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	John Stultz <jstultz@google.com>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner <jwiesner@suse.de>, 
	Scott Hamilton <scott.hamilton@eviden.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4534-lists,linux-parisc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,eviden.com,gmx.de,alpha.franken.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-parisc@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-parisc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76D42C8EBC
X-Rspamd-Action: no action

Great work Thomas!

On Sat, 24 Jan 2026 at 07:18, Thomas Gleixner <tglx@kernel.org> wrote:
>
> The clocksource watchdog code has over time reached the state of an
> unpenetrable maze of duct tape and staples [..]
...
>   1) Restrict the validation against a reference clocksource to the boot
>      CPU, which is usually the CPU/Socket closest to the legacy block which
>      contains the reference source (HPET/ACPI-PM timer). Validate that the
>      reference readout is within a bound latency so that the actual
>      comparison against the TSC stays within 500ppm as long as the clocks
>      are stable.

On my 1920 thread BullSequana SH160 test system (16 sockets with
Numascale UPI Node Controller), I find this approach is intrinsically
robust against system latency.

>   2) Compare the TSCs of the other CPUs in a round robin fashion against
>      the boot CPU in the same way the TSC synchronization on CPU hotplug
>      works. This still can suffer from delayed reaction of the remote CPU
>      to the SMP function call and the latency of the control variable cache
>      line. But this latency is not affecting correctness. It only affects
>      the accuracy. With low contention the readout latency is in the low
>      nanoseconds range, which detects even slight skews between CPUs. Under
>      high contention this becomes obviously less accurate, but still
>      detects slow skews reliably as it solely relies on subsequent readouts
>      being monotonically increasing. It just can take slightly longer to
>      detect the issue.

On x86, I agree iterating at a per-thread level is needed rather than
one thread per NUMA node, since the TSC_ADJUST architectural MSR is
per-core and we want detection completeness.

On other architectures, completeness could be traded off for lower
overhead if it is guaranteed each processor thread uses the same clock
value, though this is actually is what the clocksource watchdog seeks
to validate, so agreed on the current approach there too.

> +/* Maximum time between two watchdog readouts */
> +#define WATCHDOG_READOUT_MAX_NS                (50 * NSEC_PER_USEC)

At 1920 threads, the default timeout threshold of 20us triggers
continuous warnings at idle, however 1000us causes none under an 8
hour adverse workload [1]; no HPET fallback was seen. A 500us
threshold causes a low rate of timeouts [2] (overhead amplified due to
retries), thus 1000us adds margin and should prevent retries.

Thanks,
  Dan

-- [1]

n=$(($(getconf _NPROCESSORS_ONLN)/2)); stress-ng --msyncmany $n --vm
$n --vm-bytes 50% --vm-keep --verify --vmstat 30 --timeout 8h

-- [2]

[ 1873.419375] clocksource: Watchdog remote CPU 1807 read timed out
[ 1900.419375] clocksource: Watchdog remote CPU 1861 read timed out
[ 1925.924374] clocksource: Watchdog remote CPU 1912 read timed out
[ 1937.420453] clocksource: Watchdog remote CPU 15 read timed out
[ 1937.925028] clocksource: Watchdog remote CPU 16 read timed out
[ 1949.073317] workqueue: drm_fb_helper_damage_work hogged CPU for
>13333us 515 times, consider switching to WQ_UNBOUND
[ 1954.924464] clocksource: Watchdog remote CPU 50 read timed out
[ 2032.923596] clocksource: Watchdog remote CPU 206 read timed out
[ 2042.924367] clocksource: Watchdog remote CPU 226 read timed out
[ 2066.420624] clocksource: Watchdog remote CPU 273 read timed out
[ 2072.924015] clocksource: Watchdog remote CPU 286 read timed out
[ 2115.602465] workqueue: drm_fb_helper_damage_work hogged CPU for
>13333us 1027 times, consider switching to WQ_UNBOUND
[ 2139.924153] clocksource: Watchdog remote CPU 420 read timed out
[ 2143.419690] clocksource: Watchdog remote CPU 427 read timed out
[ 2147.420587] clocksource: Watchdog remote CPU 435 read timed out
[ 2160.924251] clocksource: Watchdog remote CPU 462 read timed out
[ 2165.419843] clocksource: Watchdog remote CPU 471 read timed out
[ 2170.442815] clocksource: Watchdog remote CPU 481 read timed out
[ 2221.420468] clocksource: Watchdog remote CPU 583 read timed out
--
Daniel J Blueman

