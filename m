Return-Path: <linux-parisc+bounces-948-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDCF88B611
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Mar 2024 01:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5A6B2C4737
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Mar 2024 00:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE1A139E;
	Tue, 26 Mar 2024 00:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jwc72MJc"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E50139F
	for <linux-parisc@vger.kernel.org>; Tue, 26 Mar 2024 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711412911; cv=none; b=l4N4YLKSE2/nXoDy98g33q6MNUfwtLw2OMuXxUi7vx/5CCulvxD9dGcZP9W6fSA/ywcoaAYvUUQwZyYuOZG/qzHSEDOC80AAqTxbWMbf5S9+VjHD6Yx/6l+q2m4+/SRYkAxVoVir+pfDGAkiruN2+nD1h3br6623RdTAspnTt04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711412911; c=relaxed/simple;
	bh=q9rJFj0LGRVbIR7Im5V+4jATTEQF0xUdYxt97RfhsCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQiHNzm7gjd6bZKvg49+OGiYkNbd42Zqja9a7Ywl7Gd+cbQpNBvIGguKwVcCH8sBHLsiugouWHSp95JgKy6uQ5cvLbbxUMUh0bUoR5gKhmQ4lB2Uxrw+Vb7efbzSLHhFl5EJIfdaUv62esPoyt+GCM6aUCBhehKlFDy1M5IdaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jwc72MJc; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-515a68d45faso2408305e87.3
        for <linux-parisc@vger.kernel.org>; Mon, 25 Mar 2024 17:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711412906; x=1712017706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AS6qRiVlQsc1+zZ8NlPzKQQkZa8BexCVQalpdaPfxc=;
        b=jwc72MJcbOv3kNXMWOzcqkprlIA0kzQenPVePAM+2MCIOWNpyQlr6Bod5r9PGyvAtH
         W6MB0rm6nc8gi1c90MEweCLFgqrpGJGagH8d9WJ+/WPLaNmtIo9qwAX7olhxp7p1+eyd
         DcyyHKRIsnQpuHfXC265pgCXIuHYOQ18/yzNq9b12LEYr0kPYRM0GpIGdh8sOyaD9+kR
         qvdPyYoNIACwyhXeSLQae4+A4idpRdC3nULounqP9EtnB1V1RPwCNZ4w4UvOv+JUb4FC
         0pIfwgms3iFSJGJuud3CMLeDpCdI+yUp2mJeizZI7bwQ90Mb/sYG+eprzKPZ3MZUedo+
         6zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711412906; x=1712017706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AS6qRiVlQsc1+zZ8NlPzKQQkZa8BexCVQalpdaPfxc=;
        b=IhlVkucVftekQn1a+SHw4OO4zkw1ri4gSFe9JAXHvKlSpq82i2lhj9BoOv0kWdLj23
         acBxgpaTH3Twc0H2Jxx9++B1xNg9KuswpMhAHKQybfMNurmWkC98VjlBky1jnWvyYtUm
         QI2U4t159BotpRn9I2TElwbnzsSMX4m1yQ6J4u8EZ8yFmDMWKRYIXfZ4IKF8O3OMH0tI
         TikRqyPvx9vWj0myJczs/mL+xBD4ABNtDbN1GIKordPoStsI7gWLAxpekkCdhi/jphPF
         3pt7bSHvKdQvgcgpVtBxsmbrNuVKQ1maEjwHbKRzeQ7879wg5oDEKAmkwDIN9uqTbZZ/
         M9mw==
X-Forwarded-Encrypted: i=1; AJvYcCUXH2Cr9a1uGCedXy/RsUAfm0xDRhP2K5d7GALD8S6wS+P7JC7bUSUjIRskmHKveGdqX+GjIrU+PPz4Z8beeBRlgeAhWBXu/bUh13qY
X-Gm-Message-State: AOJu0Yx7xQn2xgzCgiK+X7d60HBYf5alPuCQDfw8K9nKbA99162FyhXE
	tKIQMzJ6eGT8AQInwwqhf9HUPbdb/GMj8LR/KUZEB8dCdPRVN3PJgaFtnG07eBcFPx0gzYdBpX1
	Q9ufs4bZ3CCg1Pb0qZt6qPPvtX7RiOuaKT8IY
X-Google-Smtp-Source: AGHT+IF9aQZZlm3m7qhQmoIyJ6RkPwr/Dop+uoHu7fO/1Q5QVzyOPH34BhQ7Hc1bMJCfX+wA5X9L6ZhSH1TjcEziOMA=
X-Received: by 2002:a05:6512:456:b0:513:2b35:2520 with SMTP id
 y22-20020a056512045600b005132b352520mr5371798lfk.58.1711412905481; Mon, 25
 Mar 2024 17:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <6208950d-6453-e797-7fc3-1dcf15b49dbe@huawei.com> <CAHS8izMwTRyqUS0iRtErfAqDVsXRia5Ajx9PRK3vcfo8utJoUA@mail.gmail.com>
In-Reply-To: <CAHS8izMwTRyqUS0iRtErfAqDVsXRia5Ajx9PRK3vcfo8utJoUA@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 25 Mar 2024 17:28:12 -0700
Message-ID: <CAHS8izPR+SioMKNv3=2ajK=GGOE26BTaxOMykHJfjttqYjx1wQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 00/15] Device Memory TCP
To: Yunsheng Lin <linyunsheng@huawei.com>, YiFei Zhu <zhuyifei@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 11:38=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Tue, Mar 5, 2024 at 4:54=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.c=
om> wrote:
> >
> > On 2024/3/5 10:01, Mina Almasry wrote:
> >
> > ...
> >
> > >
> > > Perf - page-pool benchmark:
> > > ---------------------------
> > >
> > > bench_page_pool_simple.ko tests with and without these changes:
> > > https://pastebin.com/raw/ncHDwAbn
> > >
> > > AFAIK the number that really matters in the perf tests is the
> > > 'tasklet_page_pool01_fast_path Per elem'. This one measures at about =
8
> > > cycles without the changes but there is some 1 cycle noise in some
> > > results.
> > >
> > > With the patches this regresses to 9 cycles with the changes but ther=
e
> > > is 1 cycle noise occasionally running this test repeatedly.
> > >
> > > Lastly I tried disable the static_branch_unlikely() in
> > > netmem_is_net_iov() check. To my surprise disabling the
> > > static_branch_unlikely() check reduces the fast path back to 8 cycles=
,
> > > but the 1 cycle noise remains.
> > >
> >
> > The last sentence seems to be suggesting the above 1 ns regresses is ca=
used
> > by the static_branch_unlikely() checking?
>
> Note it's not a 1ns regression, it's looks like maybe a 1 cycle
> regression (slightly less than 1ns if I'm reading the output of the
> test correctly):
>
> # clean net-next
> time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
> 2.993 ns (step:0)
>
> # with patches
> time_bench: Type:tasklet_page_pool01_fast_path Per elem: 9 cycles(tsc)
> 3.679 ns (step:0)
>
> # with patches and with diff that disables static branching:
> time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
> 3.248 ns (step:0)
>
> I do see noise in the test results between run and run, and any
> regression (if any) is slightly obfuscated by the noise, so it's a bit
> hard to make confident statements. So far it looks like a ~0.25ns
> regression without static branch and about ~0.65ns with static branch.
>
> Honestly when I saw all 3 results were within some noise I did not
> investigate more, but if this looks concerning to you I can dig
> further. I likely need to gather a few test runs to filter out the
> noise and maybe investigate the assembly my compiler is generating to
> maybe narrow down what changes there.
>

I did some more investigation here to gather more data to filter out
the noise, and recorded the summary here:

https://pastebin.com/raw/v5dYRg8L

Long story short, the page_pool benchmark results are consistent with
some outlier noise results that I'm discounting here. Currently
page_pool fast path is at 8 cycles

[ 2115.724510] time_bench: Type:tasklet_page_pool01_fast_path Per
elem: 8 cycles(tsc) 3.187 ns (step:0) - (measurement period
time:0.031870585 sec time_interval:31870585) - (invoke count:10000000
tsc_interval:86043192)

and with this patch series it degrades to 10 cycles, or about a 0.7ns
degradation or so:

[  498.226127] time_bench: Type:tasklet_page_pool01_fast_path Per
elem: 10 cycles(tsc) 3.944 ns (step:0) - (measurement period
time:0.039442539 sec time_interval:39442539) - (invoke count:10000000
tsc_interval:106485268)

I took the time to dig into where the degradation comes from, and to
my surprise we can shave off 1 cycle in perf by removing the
static_branch_unlikely check in netmem_is_net_iov() like so:

diff --git a/include/net/netmem.h b/include/net/netmem.h
index fe354d11a421..2b4310ac1115 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -122,8 +122,7 @@ typedef unsigned long __bitwise netmem_ref;
 static inline bool netmem_is_net_iov(const netmem_ref netmem)
 {
 #ifdef CONFIG_PAGE_POOL
-       return static_branch_unlikely(&page_pool_mem_providers) &&
-              (__force unsigned long)netmem & NET_IOV;
+       return (__force unsigned long)netmem & NET_IOV;
 #else
        return false;
 #endif

With this change, the fast path is 9 cycles, only  a 1 cycle (~0.35ns)
regression:

[  199.184429] time_bench: Type:tasklet_page_pool01_fast_path Per
elem: 9 cycles(tsc) 3.552 ns (step:0) - (measurement period
time:0.035524013 sec time_interval:35524013) - (invoke count:10000000
tsc_interval:95907775)

I did some digging with YiFei on why the static_branch_unlikely
appears to be causing a 1 cycle regression, but could not get an
answer that makes sense. The # of instructions in
page_pool_return_page() with the static_branch_unlikely and without is
about the same in the compiled .o file, and my understanding is that
static_branch will cause code re-writing anyway so looking at the
compiled code may not be representative.

Worthy of note is that I get ~95% line rate of devmem TCP regardless
of the static_branch_unlikely() or not, so impact of the static_branch
is not large enough to be measurable end-to-end. I'm thinking I want
to drop the static_branch_unlikely() in the next RFC since it doesn't
improve the end-to-end throughput number and is resulting in a
measurable improvement in the page pool benchmark.

--=20
Thanks,
Mina

