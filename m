Return-Path: <linux-parisc+bounces-2003-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18712954B74
	for <lists+linux-parisc@lfdr.de>; Fri, 16 Aug 2024 15:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82BA21F24FEE
	for <lists+linux-parisc@lfdr.de>; Fri, 16 Aug 2024 13:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EA41BC08C;
	Fri, 16 Aug 2024 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="djTjyzGW"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079081B8E84
	for <linux-parisc@vger.kernel.org>; Fri, 16 Aug 2024 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816615; cv=none; b=XBGilv/9I6X6HdlFnWoUUbMaHJEmZMpDhqH6pl+M7xAEuPqbe2+NigK1dOAv9A9XSixBgDpsChhmtrD8X4Cef3QLuC/+ouaZdWDJCf4SYJp2NKF+shh0YleGbQEY3KNvxGKiBodzmpo/3SLlo8mSSJs4EjIFoS4bOoAyVDdyruU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816615; c=relaxed/simple;
	bh=l9MAxaCNe54/qqO/Y+exMLKMOMV8xf6Li74gXljpzr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0mh++xPekfO1HrJZzAUpLVVnjGznd9QGB/Tr6IQGz8zHBuiSkt1bfoPXPzBIsSEeuY/HnvRoNe79GtbyLADTuwrbMEke0k9/XyTmUwd3Claarg7vWnA3XE+X1J8S8wR6jK+kgNMXmkFbC7YLrEz7bAPeaLJBWj8+mvm9L6FsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=djTjyzGW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37186c2278bso1161669f8f.1
        for <linux-parisc@vger.kernel.org>; Fri, 16 Aug 2024 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723816611; x=1724421411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXX2C3wnh7+8WNV/qSncynwi6/HDTD/vyOk/QMV0TUQ=;
        b=djTjyzGWtKWLKEYbuPG4VyWD46rmku+Cbncmua5RgE6+yjnHx/52DaiFUIyw/bVzjQ
         JniurdlfaHT66rRZK3qduwM32/9I1DDz3RPt9k02p1N3g2GZmIqebX+SwGZTWWeAJ9yd
         +lTzw8o/DjqVBVaHT+JLnt4HmdYkIIXQP3KBVJwxNqQfgiNaXIYsaBB/a2B4Q/zjfcEl
         rk9FehhMG8YKBJnzCwBhvoxnxHi7pD3Sz2p8MSN3P6PLJPTEQf3DAjzoGy/wI8/8mdnA
         qvsGv7q0zMTfXuqB2aGa3k9HCX56rPUR+/LD3VEDFUDFRHpUDoPs0K5Q5/Yubjt83TBC
         Eblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723816611; x=1724421411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXX2C3wnh7+8WNV/qSncynwi6/HDTD/vyOk/QMV0TUQ=;
        b=XDG14o5Bh8kSoUold9dpMtGdI1HxiQVHiR58+v0CEPpcNFDZGRSI5+9Dp5f/Sct5UG
         bebSJamjIhHhuIVa/GBNACfZPUthnsWsl5FV0J5dqY9aTST7/EZIjUsrEl9H1O5b472R
         L5qSc/QLZ3wCpcUFj11JzhomWEn/VkJEubSOe2Vqeawku5+a8r80DuTcORGuGtBlKPtE
         IGrlj0yUVSCU8LnH0hAnWgZN2wMOG6k4kDjjNeOUx+FF61Pgyxv00y+ZlODYyiZCx1UR
         N1Uh3ZfC95uirQl3zYgHo6MF8tsLMVFI8PSmAhCr+dQcJaT9jF1AfSa8Tytg1b0C2W4v
         OIxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBkOmk+p1UxwiyY+LgcHpOGHNSz/H3pe0A92pPviDnyhxcPh4YvKDzimF16UnF8u8jnY1cg12YKzQuqdLsTBUm+0GqbBjlzcAKRWz5
X-Gm-Message-State: AOJu0YwBrt/SZtKzzl7v6TtvQJvGUsmxi5cKMdrd168fSosSxSf2pOzP
	uEMiYzUTQ9XTSgcdJfUYDB5x8UTUAN1bh/0/p2S8/n4oDy45lpajs5iDKiJARUhTxGa6RivMw2d
	UhW3GJD2SMbL3KDHjLNYbhZZ9Zli8HrGPmk4a
X-Google-Smtp-Source: AGHT+IE0JOrXVLQSixhP01cdcARFbW0ccbM6G+qKTpkPzMcItcOgty9rR4OVVmPUNtu/xY88xZ5p9Oo2vXeH/2ggoXM=
X-Received: by 2002:adf:fecd:0:b0:366:f455:e7c1 with SMTP id
 ffacd0b85a97d-37194c3390amr2137247f8f.27.1723816610994; Fri, 16 Aug 2024
 06:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813211317.3381180-4-almasrymina@google.com> <20240815174852.48bbfccf@kernel.org>
In-Reply-To: <20240815174852.48bbfccf@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 16 Aug 2024 09:56:36 -0400
Message-ID: <CAHS8izN0Wb7isGbhO+cvYNfG+v2bsvvfy7P0cSsMD7USfd+4bQ@mail.gmail.com>
Subject: Re: [PATCH net-next v19 03/13] netdev: support binding dma-buf to netdevice
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 8:48=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 13 Aug 2024 21:13:05 +0000 Mina Almasry wrote:
> > +int dev_get_max_mp_channel(const struct net_device *dev)
> > +{
> > +     int i, max =3D -1;
>
> I presume the bug from yesterday is self evident once reported? :)
>

Yes, my apologies. The int return value from this function was being
implicitly cast to unsigned in the check I think, and that failed the
check.

My test didn't catch that due to a test environment issue. I had 2
ethtools installed by accident on the machine, and the test was
invoking the wrong one. I think I have that ironed out now.

> > +     ASSERT_RTNL();
> > +
> > +     for (i =3D 0; i < dev->real_num_rx_queues; i++)
> > +             if (dev->_rx[i].mp_params.mp_priv)
> > +                     /* The number of queues is the idx plus 1. */
> > +                     max =3D i + 1;
>
> The +1 is odd. The function as it stands reports min channel count.
> Not max_mp_channel, if you ask me. And if you renamed it, you don't
> have to use -1 as "not installed".
>

Will do.

--
Thanks,
Mina

