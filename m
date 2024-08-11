Return-Path: <linux-parisc+bounces-1963-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B44194DF94
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Aug 2024 04:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0841F2162E
	for <lists+linux-parisc@lfdr.de>; Sun, 11 Aug 2024 02:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0E7A95E;
	Sun, 11 Aug 2024 02:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fXSU5CVS"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC665BA47
	for <linux-parisc@vger.kernel.org>; Sun, 11 Aug 2024 02:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723342916; cv=none; b=WNMZ3cEXIox72whrL0u3uVh/H1mIF2ziM0L1E9Gi/lpFtt4ya8aTRPaZtd6vy9BkeZInFM8LIc2CnagxkplzAryfA6Rw89WRhcZGpisc8z/mrAqWdd5gh5Rd3RoEkVaN+QpRmMB2/ErvgbevK5Ux5BN0cu6SgdjnOCu+iE1NRgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723342916; c=relaxed/simple;
	bh=RG9LHAeha0E5bVe70AIhZ3CulzWRiRRdzwCyU2ikkxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sa2SeoItAHPVmUHXBvTIYNo4uo3Ho0AKY3B2Y5J5HcQ4HYjc8fQCJHkrS2T85RB3aa6HDZPFObEw3s1oRHht9JQpbxV6PUeiGvpRGYsewxFIIjfuLp2XcQ474m25G2/UAKzdjXp/pKo/X0MPAVeYFoMjPWUb6HAgmULtaC/pWQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fXSU5CVS; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6bd777e6623so11587696d6.3
        for <linux-parisc@vger.kernel.org>; Sat, 10 Aug 2024 19:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723342912; x=1723947712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RG9LHAeha0E5bVe70AIhZ3CulzWRiRRdzwCyU2ikkxg=;
        b=fXSU5CVSFFbF8Gxlcs6TWffKLPy5YSk54DIXLniQNmCL98F9FZLrOuOprTRSIAdWfV
         OuRxbRTXDbz0IaFjnxatxZa6jDXM3t0uCeJyAre0esHGCbqrFy0OIx72dNtkzCF0r/L6
         +fCsVj4DCPF5KHZv/sK2tO+JfhpZw44QwxkVdTSOWTPPW5tWtjCLfhBLKIRnnxftWvRf
         RyiZVW83mLx3R8xY/mXeh4hI/2z4v9blHJF+ieZTq9kHSWHzAlkXQDlPt+pQ7/bZm8Ic
         fisryOR9JByR69bcOEgnkmTWKQ6wFjsFlrhX1j6u42en22dm3OSrYiUv5vc70OTzpaTx
         XpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723342912; x=1723947712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG9LHAeha0E5bVe70AIhZ3CulzWRiRRdzwCyU2ikkxg=;
        b=HAatFUxhP4RpWWaESRTdP7G6SpheVTD4PFhWansn0/+e7uxmjwXvjntKNvF8yUwrbx
         VJuhTK8qamVSrChT1mo71FhMk4wx4+9OW0dpMWGEfQqn1nfxOb2Qod/dctuso5e1Cpvz
         j+pyZt2UzXg8oaXzV9SJ877H+ja892VUYGMhAmSo7EtFdRWdnTjSAykPLe0IJDt+qFvA
         TikNO6aXknG75NnHqiXDvVI7rPGHZybVnXeoOkupaVcOd4hsW5kXdv2Wvu2f0VnPFgnb
         l4Gq6TeJqsQ9cce2RmX3cGlrtK2bLxaFGZnGiRXpIuT8oGCa+ifH9/DfnHN9lkXlG6uR
         GxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyCiTwi/TVCPr08V1WNgO491WvGWS5R7rSD7q0iTPhNjxWCNoq4XzGNwKokCUV9A23CDBXwVsoH9WwIK6VspjAtcQGjv7n7/hHsHAd
X-Gm-Message-State: AOJu0YwKGgGOxH4Uq9fBPDlNG3Tze9Y8l4UDhzFCUjcd1cDlcgdbwl4j
	8unsAJi4AtrcKdicvrPdliCFHiv8JLCy4WASGybK6e55wpFRrut8d0Wiyo6EklJgs1k0sHsxUEH
	KLen7OFrUV3o2tcgL0rW/cWyVo73srNlkPlqi
X-Google-Smtp-Source: AGHT+IEZ2o2IjbltxUtgiFqMaggi2EMslyYy4EjJKqHkpI3i2lfifDNDb+nrXQWahxplCc4kLWOurPaC9Ylw74lSj5w=
X-Received: by 2002:a05:6214:43c8:b0:6b5:dcda:bada with SMTP id
 6a1803df08f44-6bd78e8296cmr66071346d6.55.1723342911553; Sat, 10 Aug 2024
 19:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com> <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org> <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
 <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com> <20240809205236.77c959b0@kernel.org>
In-Reply-To: <20240809205236.77c959b0@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 10 Aug 2024 22:21:39 -0400
Message-ID: <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem memory provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 11:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 9 Aug 2024 16:45:50 +0100 Pavel Begunkov wrote:
> > > I think this is good, and it doesn't seem hacky to me, because we can
> > > check the page_pools of the netdev while we hold rtnl, so we can be
> > > sure nothing is messing with the pp configuration in the meantime.
> > > Like you say below it does validate the driver rather than rely on th=
e
> > > driver saying it's doing the right thing. I'll look into putting this
> > > in the next version.
> >
> > Why not have a flag set by the driver and advertising whether it
> > supports providers or not, which should be checked for instance in
> > netdev_rx_queue_restart()? If set, the driver should do the right
> > thing. That's in addition to a new pp_params flag explicitly telling
> > if pp should use providers. It's more explicit and feels a little
> > less hacky.
>
> You mean like I suggested in the previous two emails? :)
>
> Given how easy the check is to implement, I think it's worth
> adding as a sanity check. But the flag should be the main API,
> if the sanity check starts to be annoying we'll ditch it.

I think we're talking about 2 slightly different flags, AFAIU.

Pavel and I are suggesting the driver reports "I support memory
providers" directly to core (via the queue-api or what not), and we
check that flag directly in netdev_rx_queue_restart(), and fail
immediately if the support is not there.

Jakub is suggesting a page_pool_params flag which lets the driver
report "I support memory providers". If the driver doesn't support it
but core is trying to configure that, then the page_pool_create will
fail, which will cause the queue API operation
(ndo_queue_alloc_mem_alloc) to fail, which causes
netdev_rx_queue_restart() to fail.

Both are fine, I don't see any extremely strong reason to pick one of
the other. I prefer Jakub's suggestion, just because it's closer to
the page_pool and may be more reusable in the future. I'll err on the
side of that unless I hear strong preference to the contrary.

I also think the additional check that Jakub is requesting is easy to
implement and unobjectionable. It would let core validate that the
driver did actually create the page_pool with the memory provider. I
think one of the goals of the queue API was to allow core to do more
validation on driver configuration anyway.

--=20
Thanks,
Mina

