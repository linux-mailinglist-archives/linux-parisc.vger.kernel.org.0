Return-Path: <linux-parisc+bounces-3661-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4380AB7FBD
	for <lists+linux-parisc@lfdr.de>; Thu, 15 May 2025 10:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31301B6898E
	for <lists+linux-parisc@lfdr.de>; Thu, 15 May 2025 08:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C360E27E7F3;
	Thu, 15 May 2025 08:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QleRWDJ1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4074A283CB3
	for <linux-parisc@vger.kernel.org>; Thu, 15 May 2025 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296316; cv=none; b=GYOsvJNaGMhzr/WCT+RLvMJ0mZYLCi/ReqdDHoMR6/f+mjKYK+8g8xMDtKXbQcpLROQ4YA2R2eY4Yu+NpqJwPi/sv4d7eKJ7vpZ6FtqimboDhbLsrnAQJNhZoqwRpVUbLaMG2mHkJ44QJXCoQadZr7M9q+WRMZrICTTsDLmk/m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296316; c=relaxed/simple;
	bh=0tGKkkemugSf6qbz3gshaWCoVsCRbxCI+SQBbX3dIFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgkyhOcyGui0Wa5vwn7eAQAxMwb6L15FHlYdI677Os8/+ksjfnwsAJhMkoLAdAwuhLuCRp+dnjY6zKofAHHJ/AGeJ0jRQovI3LpPtZjpR4tXL4zKj7yieIfNHy44kW0j/byzDuVKqC16zZvevTfV7mK/DtTuS4bh9azif2a1Jps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QleRWDJ1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so352995f8f.0
        for <linux-parisc@vger.kernel.org>; Thu, 15 May 2025 01:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747296311; x=1747901111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edff1LhptN7FQ5Bq2oruaEckY3n2IP7/Je81wTRfspE=;
        b=QleRWDJ1MjKGuTARD+JMrNkTAxf4HJRsTFLkXkCVtL9CbWW4H8867e4gRrYe6EwAgm
         XPMtN/ccgxu1Iakt4TGULyjyPIWkeK++REj8S0mb+Lp0Y5BdRQJ1RgMKofZ+1rn3lsyW
         bxi4phbRhYV5kVMHXtDrnLPMbUHaadKUFkpJh31Uhr5GNhzN3CoyH06OzrvpRMWIGd1p
         lPNsa58+0OPS7jisV6aHdqQaXvnPOoiqqmJRmt4T6k338Xqel0OrIM7fT7Wlbtpc6I1K
         tJpyOs9c9HSn4DpSUK56f70L5Bp4sMOeG4KS6HeQFC/D8fEHOlBzkrpRaFUFsy+XNvVH
         FJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296311; x=1747901111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edff1LhptN7FQ5Bq2oruaEckY3n2IP7/Je81wTRfspE=;
        b=br2mqPv/Vu7mu8KPV4508vpspeADCdm7Xo7FPKhsFDB1nhsbln2qiCKmgmkKVn1vLB
         t9wLCx964t+UVRIr4+cCZR0DVks4xR8yHNVdFFlVkMa49RRPFF69aJI++iwtxUdICSHg
         BEsPBmp1ZQ7U/tAorhlpKc5W1rihHv3h9ceaUSKZMt0+MFGiITs8Yox5WZ3AYqeIWnme
         NO4Ob16uOJoeHycN6bu3lMmXxRNp3HkaX9v1bRMUQMnFnGMJOQzQHjqdKU4+JG6BzG4m
         iuTNjpnkDncRzRTDMDQb1x81cD6s7j+dmZlp3Gkxe/i1Y6YPLDp90NiORTiCmNg7xJGp
         fF6g==
X-Forwarded-Encrypted: i=1; AJvYcCUYl+5TQTRxek0hl5Nq55jd8j0q35H3YRpJHnUJGKNTlafK7gMLDDxTZz/X3552b/lmyGZoxsUCNkw0K0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIA60oqv1NLp30VzDot/qplAf2AEa+WURCv7SyRUy9Cmrw26Z
	JdqgrUIpshfuT/NoJhFLTYglaiCm8OhkzPj9YX1yoZhGTLNHZ9YFm+N4TmtdLto=
X-Gm-Gg: ASbGnctCADrQAIqOpznKZ33+EHb/ROmKH9Fj7OzUzPjfIf3xG58EZcnTr6VlqpOOoGN
	aM0R6/Uun/B9miDwk6898jfkbybj6llqWKJ25jGPQREkGQ3DWhgNuLwUiyYrSxgbTHhpQTOMzKp
	/5PycSP2YLYomi/B8DEgo20fuDi6n3Dntx2vz21zWV860ZX2+UXEZ250Vavi5nGTZeRSyJh28UQ
	/kRA7xKxCswGr1oe0TALi78QXsFROAN6VlyFmyBm5oDLSxHV9KfPZRn6V+8Kw2dyTcaWzIH66U1
	WME82H0EI9SFbpfr5uM/QzDMb6AFouVDnIMYbpH8YqdX4P4egL0yPQ==
X-Google-Smtp-Source: AGHT+IGXvziHODCht+twr6uozgFfTyAclIKdnZuTVey4CsU1/XVbIcw96mTLNhe3rmJT4ESA13CsYg==
X-Received: by 2002:a05:6000:2911:b0:39e:dbb0:310f with SMTP id ffacd0b85a97d-3a34992746amr5945525f8f.39.1747296311397;
        Thu, 15 May 2025 01:05:11 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85df68fsm9441727137.18.2025.05.15.01.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:05:10 -0700 (PDT)
Message-ID: <e2ebf88d-46a2-4f38-a0c8-940c3d3bee49@suse.com>
Date: Thu, 15 May 2025 10:04:53 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] module: Move modprobe_path and modules_disabled
 ctl_tables into the module subsys
To: Joel Granados <joel.granados@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org,
 linux-parisc@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250509-jag-mv_ctltables_iter2-v1-0-d0ad83f5f4c3@kernel.org>
 <20250509-jag-mv_ctltables_iter2-v1-1-d0ad83f5f4c3@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250509-jag-mv_ctltables_iter2-v1-1-d0ad83f5f4c3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 14:54, Joel Granados wrote:
> Move module sysctl (modprobe_path and modules_disabled) out of sysctl.c
> and into the modules subsystem. Make the modprobe_path variable static
> as it no longer needs to be exported. Remove module.h from the includes
> in sysctl as it no longer uses any module exported variables.
> 
> This is part of a greater effort to move ctl tables into their
> respective subsystems which will reduce the merge conflicts in
> kernel/sysctl.c.
> 
> Signed-off-by: Joel Granados <joel.granados@kernel.org>
> [...]
> --- a/kernel/module/kmod.c
> +++ b/kernel/module/kmod.c
> @@ -60,7 +60,7 @@ static DEFINE_SEMAPHORE(kmod_concurrent_max, MAX_KMOD_CONCURRENT);
>  /*
>  	modprobe_path is set via /proc/sys.
>  */
> -char modprobe_path[KMOD_PATH_LEN] = CONFIG_MODPROBE_PATH;
> +static char modprobe_path[KMOD_PATH_LEN] = CONFIG_MODPROBE_PATH;
>  
>  static void free_modprobe_argv(struct subprocess_info *info)
>  {
> @@ -177,3 +177,33 @@ int __request_module(bool wait, const char *fmt, ...)
>  	return ret;
>  }
>  EXPORT_SYMBOL(__request_module);
> +
> +#ifdef CONFIG_MODULES
> +static const struct ctl_table kmod_sysctl_table[] = {
> +	{
> +		.procname	= "modprobe",
> +		.data		= &modprobe_path,
> +		.maxlen		= KMOD_PATH_LEN,
> +		.mode		= 0644,
> +		.proc_handler	= proc_dostring,
> +	},
> +	{
> +		.procname	= "modules_disabled",
> +		.data		= &modules_disabled,
> +		.maxlen		= sizeof(int),
> +		.mode		= 0644,
> +		/* only handle a transition from default "0" to "1" */
> +		.proc_handler	= proc_dointvec_minmax,
> +		.extra1		= SYSCTL_ONE,
> +		.extra2		= SYSCTL_ONE,
> +	},

This is minor.. but the file kernel/module/kmod.c contains the logic to
request direct modprobe invocation by the kernel. Registering the
modprobe_path sysctl here is appropriate. However, the modules_disabled
setting affects the entire module loader so I don't think it's best to
register it here.

I suggest keeping a single table for the module sysctl values but moving
it to kernel/module/main.c. This means the variable modprobe_path must
retain external linkage, on the other hand, modules_disabled can be made
static.

-- 
Thanks,
Petr

> +};
> +
> +static int __init init_kmod_sysctl(void)
> +{
> +	register_sysctl_init("kernel", kmod_sysctl_table);
> +	return 0;
> +}
> +
> +subsys_initcall(init_kmod_sysctl);
> +#endif

