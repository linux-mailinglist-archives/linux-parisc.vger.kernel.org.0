Return-Path: <linux-parisc+bounces-1011-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E289416E
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Apr 2024 18:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D82AB22085
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Apr 2024 16:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3039E4AED4;
	Mon,  1 Apr 2024 16:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n3zGUtc4"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DD1495F0
	for <linux-parisc@vger.kernel.org>; Mon,  1 Apr 2024 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711989719; cv=none; b=WujDcTtAciGijngRuzE4sllA2+JF6nD35z9uYpGJkou3XZ/R34HRYoFEUd1fJT356DM4/vMmcL/G6V2bfgVdPaUxdAnIaTthtl85/V7eDSf4p4Gkz7LsAMD5iJ/NQejQGuGRd15E7mnBdb8j4qfesOD3IPFxvlQ4y0sxNT1hFhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711989719; c=relaxed/simple;
	bh=/qz+y5YC2iKyofjEybG266txkeP8b0dMGw22Spe7v0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeoZskPiZhQnNbxxgyYJ4+bw6gp1kPLHPyl2H82SooNU6rBM8DqfRXmH/WHRNAcPZRZeoJ0MmThXPuCHNT4axyef8YdjWTWIJIQMo3Zj7KFFqZl9lgmHXQL1o323GOlPBUhbIbl2p2U5xdr0bJfFCfQFYEcgUGwdTfIP+aNaVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n3zGUtc4; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78a2093cd44so311507085a.0
        for <linux-parisc@vger.kernel.org>; Mon, 01 Apr 2024 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711989715; x=1712594515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm96Do3HD9Ni1RnQFtInuSgt43w6ZXYVK1hdTCMkucA=;
        b=n3zGUtc43hdlJzS0vlsQ9zojO+o3JLCLP8Knau9xVG4w1cEG3LDkcIOuLYNp7sjGZu
         I6vsz97YHQfSNd2A2IkpSq/LDUaZlmsjbdbwPZAUceHgfbmZRQNDMPO084xoAjzzr0eY
         JiYn+MiR591GvCKF+1tRNonooMpwCei0XARJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711989715; x=1712594515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm96Do3HD9Ni1RnQFtInuSgt43w6ZXYVK1hdTCMkucA=;
        b=lKSFyKSy7tu08B6uhJux8TWMEVnb/Emha2upmMv/7JNEDXr4Q6PCCpwZZb3fks6dV5
         ALgLOYpg0yNsNoMJhe7c7un54H5vueVrRgx+Br+BF0G8Gz9cqUuE7WMHdMFtbYAXBXjS
         QR4biL6X90KRM6YtCBL69lJd+4cQaQSSBm8io20sWFNNjJAnYuEFK0aYDIwnzlvOw9Ix
         lADlU+NPqshaIYmACE1V4QNPrUZzHlxhSe5SheHclGdYPtrF2nL9/dRlIUcR7wt+7AD+
         EYU0nGTluxOL6pzNcQ8orRGioaNwDEPkHFdg566pjXBVwPe1ydMXh/XrD0TZUj7rHXM6
         3+5A==
X-Forwarded-Encrypted: i=1; AJvYcCXNTt49HYGePwyY16Fdcr0kXUIk0nQaYadoRTkGA1pRy2eK7LfJcbjZmtobc6DWhEjmNyYliv00vN4FuSnpjgwOwOmEdSAkfOoHUcs/
X-Gm-Message-State: AOJu0YyNCcIySb8Xq3pxJKQsDXurJZI3oiYIgVrRmZK708dnzDcAR6gX
	CNq+euIHo71ArcnQ3wb9eORj82tMXbatYVv0yupv8L5TrBY/O15w1WA+kpcOpiLfYi+sDxqD/RU
	=
X-Google-Smtp-Source: AGHT+IG4qiFGEvTo5Kjk2qyJqLd57eU+PTk71Lx0x+tpr6iqTXZRuChJ8AzT+OftRAMHwJE2+pJ/kw==
X-Received: by 2002:a05:620a:1223:b0:78a:26d6:72c0 with SMTP id v3-20020a05620a122300b0078a26d672c0mr11513587qkj.18.1711989714891;
        Mon, 01 Apr 2024 09:41:54 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id a12-20020a05620a102c00b0078a68148b72sm3559156qkk.57.2024.04.01.09.41.53
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 09:41:53 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-432d55b0fa9so499001cf.1
        for <linux-parisc@vger.kernel.org>; Mon, 01 Apr 2024 09:41:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7JomonUMM48tHmTZF1d0xdgu9hB2rJcsFKkCZsMxO6Ktdo5yd9HZnv/ijcJ4MQbksxEW47ODv09lclwgRAG8fz6IFU/ZT9KO8P3nT
X-Received: by 2002:a05:622a:5a89:b0:431:4e0b:d675 with SMTP id
 fz9-20020a05622a5a8900b004314e0bd675mr1027105qtb.18.1711989713017; Mon, 01
 Apr 2024 09:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306125208.71803-1-yaoma@linux.alibaba.com>
 <20240306125208.71803-5-yaoma@linux.alibaba.com> <87zfuofzld.ffs@tglx> <6109a3e3-ca88-4a4d-86c5-c4eb0d7f6f9c@linux.alibaba.com>
In-Reply-To: <6109a3e3-ca88-4a4d-86c5-c4eb0d7f6f9c@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Apr 2024 09:41:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xr8-rzANK8oKyEZpk1FZ2dy5HqBXKpk3O29PhG1fRowg@mail.gmail.com>
Message-ID: <CAD=FV=Xr8-rzANK8oKyEZpk1FZ2dy5HqBXKpk3O29PhG1fRowg@mail.gmail.com>
Subject: Re: [PATCHv12 4/4] watchdog/softlockup: report the most frequent interrupts
To: Bitao Hu <yaoma@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>, pmladek@suse.com
Cc: liusong@linux.alibaba.com, akpm@linux-foundation.org, kernelfans@gmail.com, 
	deller@gmx.de, npiggin@gmail.com, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, jan.kiszka@siemens.com, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 25, 2024 at 2:48=E2=80=AFAM Bitao Hu <yaoma@linux.alibaba.com> =
wrote:
>
> Hi, Thomas
>
> On 2024/3/24 04:43, Thomas Gleixner wrote:
> > On Wed, Mar 06 2024 at 20:52, Bitao Hu wrote:
> >> +    if (__this_cpu_read(snapshot_taken)) {
> >> +            for_each_active_irq(i) {
> >> +                    count =3D kstat_get_irq_since_snapshot(i);
> >> +                    tabulate_irq_count(irq_counts_sorted, i, count, N=
UM_HARDIRQ_REPORT);
> >> +            }
> >> +
> >> +            /*
> >> +             * We do not want the "watchdog: " prefix on every line,
> >> +             * hence we use "printk" instead of "pr_crit".
> >> +             */
> >
> > You are not providing any justification why the prefix is not
> > wanted. Just saying 'We do not want' does not cut it and who is 'We'. I
> > certainly not.
> >
> > I really disagree because the prefixes are very useful for searching lo=
g
> > files. So not having it makes it harder to filter out for no reason.
> >
>
>
> Regarding the use of printk() instead of pr_crit(), I have had a
> discussion with Liu Song and Douglas in PATCHv1:
> https://lore.kernel.org/all/CAD=3DFV=3DWEEQeKX=3Dec3Gr-8CKs2K0MaWN3V0-0yO=
suret0qcB_AA@mail.gmail.com/
>
> Please allow me to elaborate on my reasoning. The purpose of the
> report_cpu_status() function I implemented is similar to that of
> print_modules(), show_regs(), and dump_stack(). These functions are
> designed to assist in analyzing the causes of a soft lockup, rather
> than to report that a soft lockup has occurred. Therefore, I think
> that adding the "watchdog: " prefix to every line is redundant and
> not concise. Besides, the existing pr_emerg() in the watchdog.c file
> is already sufficient for searching useful information in the logs.
> The information I added, along with the call tree and other data, is
> located near the line with the "watchdog: " prefix.
>
> Are the two reasons I've provided reasonable?

FWIW I don't feel super strongly about this, but I'm leaning towards
agreeing with Bitao. The sample output from the commit message looks
like this:

[  638.870231] watchdog: BUG: soft lockup - CPU#9 stuck for 26s! [swapper/9=
:0]
[  638.870825] CPU#9 Utilization every 4s during lockup:
[  638.871194]  #1:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.871652]  #2:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.872107]  #3:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.872563]  #4:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.873018]  #5:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.873494] CPU#9 Detect HardIRQ Time exceeds 50%. Most frequent HardIRQ=
s:
[  638.873994]  #1: 330945      irq#7
[  638.874236]  #2: 31          irq#82
[  638.874493]  #3: 10          irq#10
[  638.874744]  #4: 2           irq#89
[  638.874992]  #5: 1           irq#102

...and in my mind the "watchdog: BUG: soft lockup - CPU#9 stuck for
26s! [swapper/9:0]" line is enough to grep through the dmesg. Having
all the following lines start with "watchdog:" feels like overkill to
me, but if you feel strongly that they should then it wouldn't bother
me too much for them all to have the "watchdog:" prefix.

Could you clarify how strongly you feel about this and whether Bitao
should spin a v13?

I believe that this is the only point of contention on the patch
series right now and otherwise it could be ready to land. I know in
the past Petr has wanted ample time to comment though perhaps the fact
that it's been ~1 month is enough. Petr: do you have anything that
needs saying before this patch series lands?

Thanks!

-Doug

