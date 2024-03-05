Return-Path: <linux-parisc+bounces-815-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451788727AF
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Mar 2024 20:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB843B29094
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Mar 2024 19:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E972F4DA11;
	Tue,  5 Mar 2024 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FRcoz8Mb"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713D85640
	for <linux-parisc@vger.kernel.org>; Tue,  5 Mar 2024 19:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709667532; cv=none; b=PsHzSTYBFAGInRN/v/l6tzrNb1WUdDXB3aNnd8bYt0ZfHOv3RkqxLq8GHYvlvxtv7rAi1jzaB8coOvurErqfVGJdbvcCtt80HPuwJmEHr8tE1zUzkr1d1JCCm/zySUud72+k/4EuoE8wZgivgATXM6sCOjFVpfjYlagOLsTnnJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709667532; c=relaxed/simple;
	bh=dbu7jPJNusoAIuT8pNXSfufXvY1iYoRgBC5JcoUfIfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwQ0N66lm4QgssVdgh0xQKR5NlZB0MwRwg4F7EDawC4G1bNKayUwp+Ykv8ghYz77XpOge9FDjvwmFInBu/oeke6RohmvBve6Nt2B8j6QAC/hRr+kpVyQCOoiCuyv/heZae+7fKC5W9o2iHbLAjJdChXUDvCUjrIWbK5UxoC6PRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FRcoz8Mb; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so1019763466b.2
        for <linux-parisc@vger.kernel.org>; Tue, 05 Mar 2024 11:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709667529; x=1710272329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbu7jPJNusoAIuT8pNXSfufXvY1iYoRgBC5JcoUfIfk=;
        b=FRcoz8MbQeQDcV4GpXollhLmuyqntrRmwucMFDu5EmYMZ8nbOuOfvmIlvlgmVq1Qf4
         c8lJN6BtQ/2TfFGDTo4HPiEpJzTWViGGaRilIyIcv/YXc0UkVYjdNrq+GnwgnSNZswFB
         Pwg6nffta5e0uvgM3W0mPp9zxsYyvJlniRkpeGoe5zpcYBAQopGXC4Z+BTDR8JLdoEOD
         V88jb3Ko2M9as9eI9Qr0iuz9SzXWQw5AjNC7hFnkfWYJw4EM1fEvnQS2lXdYIEDXZQnA
         nY7tNeKRoWpelHmLrOxuSUqt3/up1X9b9cwQdhDzb5wYSPQ3D/F4hmnXwL7TSHyC3s1t
         oqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709667529; x=1710272329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbu7jPJNusoAIuT8pNXSfufXvY1iYoRgBC5JcoUfIfk=;
        b=bPa2OidfGMZEr17T8gkrf1SCuihkqsE4M5BGLxjhfncaqfWLDXT6d4IZqiC+RjFxbX
         z6WBr1BmRuJvMf9pIbNj8pcezCbmp/4VPaxK+vEunqDt8UyplLA8DdWT3BZOFarG6bsv
         HoFXm5i2RDLTiwopekFWQDDcB19ZVHIHCHJKKy4SAzbLgWTDlEHV3H6GpK0gfC4LO3h9
         w5t77Gh9vABGJj2OmpV8JCpEOD8wI9kvmvyjjgDr8PqdM3ETrlvt9VgEU6q9U3oImfQZ
         2r4tUg+NpB4wfJIl3sZYaKXrrcgQTDNkY/MeyxUpnvtbxRftrfOM4U/o3tzNPyBPmcGf
         01Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXhCJSfcbqR9AoBuJ7NZ+MZAfFHwMELGWVTbIo7hwhoUz6WDmir0WnVN7GpKh1dr+z1soDDW+EKEi5hTwF7oDBELRUL9aodZowPUW+2
X-Gm-Message-State: AOJu0YwHE2+qYykFJlveP8iCWBHRMHeCj9+g5ZX8F8wH/WXm1lu4az91
	0FTK1b+000LORQkUqMngWKMfbkcKiTZGBNUF7et/zbUQ1YLXDiUwZhRt9tqFm/TIuVHm+3bnx0t
	qyE0cOmUE0B6OuSQAxaH7ETi8VfdtYsTuJkdmUl3Ghv/EWtkugZuEBb0=
X-Google-Smtp-Source: AGHT+IE9+/I3bSukMGSV69NWucyK49DrCDskm5u3bRNu62YrXsb5GYolXDQb6+2mnF70pbKLSkXCgPSxIq5NsfN3srs=
X-Received: by 2002:a17:906:b790:b0:a45:b36c:55c7 with SMTP id
 dt16-20020a170906b79000b00a45b36c55c7mr421516ejb.63.1709667528752; Tue, 05
 Mar 2024 11:38:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com> <6208950d-6453-e797-7fc3-1dcf15b49dbe@huawei.com>
In-Reply-To: <6208950d-6453-e797-7fc3-1dcf15b49dbe@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 11:38:37 -0800
Message-ID: <CAHS8izMwTRyqUS0iRtErfAqDVsXRia5Ajx9PRK3vcfo8utJoUA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 00/15] Device Memory TCP
To: Yunsheng Lin <linyunsheng@huawei.com>
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

On Tue, Mar 5, 2024 at 4:54=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2024/3/5 10:01, Mina Almasry wrote:
>
> ...
>
> >
> > Perf - page-pool benchmark:
> > ---------------------------
> >
> > bench_page_pool_simple.ko tests with and without these changes:
> > https://pastebin.com/raw/ncHDwAbn
> >
> > AFAIK the number that really matters in the perf tests is the
> > 'tasklet_page_pool01_fast_path Per elem'. This one measures at about 8
> > cycles without the changes but there is some 1 cycle noise in some
> > results.
> >
> > With the patches this regresses to 9 cycles with the changes but there
> > is 1 cycle noise occasionally running this test repeatedly.
> >
> > Lastly I tried disable the static_branch_unlikely() in
> > netmem_is_net_iov() check. To my surprise disabling the
> > static_branch_unlikely() check reduces the fast path back to 8 cycles,
> > but the 1 cycle noise remains.
> >
>
> The last sentence seems to be suggesting the above 1 ns regresses is caus=
ed
> by the static_branch_unlikely() checking?

Note it's not a 1ns regression, it's looks like maybe a 1 cycle
regression (slightly less than 1ns if I'm reading the output of the
test correctly):

# clean net-next
time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
2.993 ns (step:0)

# with patches
time_bench: Type:tasklet_page_pool01_fast_path Per elem: 9 cycles(tsc)
3.679 ns (step:0)

# with patches and with diff that disables static branching:
time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
3.248 ns (step:0)

I do see noise in the test results between run and run, and any
regression (if any) is slightly obfuscated by the noise, so it's a bit
hard to make confident statements. So far it looks like a ~0.25ns
regression without static branch and about ~0.65ns with static branch.

Honestly when I saw all 3 results were within some noise I did not
investigate more, but if this looks concerning to you I can dig
further. I likely need to gather a few test runs to filter out the
noise and maybe investigate the assembly my compiler is generating to
maybe narrow down what changes there.

--=20
Thanks,
Mina

