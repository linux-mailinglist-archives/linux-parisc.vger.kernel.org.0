Return-Path: <linux-parisc+bounces-1909-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FDF947F6D
	for <lists+linux-parisc@lfdr.de>; Mon,  5 Aug 2024 18:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 178981C21158
	for <lists+linux-parisc@lfdr.de>; Mon,  5 Aug 2024 16:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2234E15D5BE;
	Mon,  5 Aug 2024 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ooMfse3W"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186D815B122
	for <linux-parisc@vger.kernel.org>; Mon,  5 Aug 2024 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722875652; cv=none; b=gmK4FWf/z9LcPIPgbQ6MTV4UzHVb/N/QlXnT8511rbHb3mjq14rLeba/NiW2JKtbcKEV/Y9gzENI0VZ9CBG62y/6hLdMJ68zGch00o2DYfzQTlcq+8/7EUWiHiaUIs23IhEViZJNsJxPHBjuhvnvGvYi2dQJAOGEIsANKsuDqys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722875652; c=relaxed/simple;
	bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2ZkKvX3YGqusEVnEicc2qEERmCKGk34T2TOG6jgdOaUUy4Q9jAwz5mBAxU7gPcju0YcFjWEWXgYw52JR68ULh5J4jy/nct6VttZ7+KyCLbF6IaKfCfkgKmdZ8Dko/HbCaBaJk6RD6SoLF6xkJjN/qYCnqXu1/QEUX+ibo+aQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ooMfse3W; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6b7a3773a95so61207116d6.2
        for <linux-parisc@vger.kernel.org>; Mon, 05 Aug 2024 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722875649; x=1723480449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
        b=ooMfse3WVKfuxOLSSKdlcT9aqFqVw/RtyRXpOBsgOCTn9wKceQcM71mSUyFUCGbjdh
         26+ROdikowegVtjSUS4uWVUhtc95hLL23dlnWFj8cp65MVc4drKNIX9u43DWF2Bats8h
         t0heAI4eFDoxqmiGWoYtMgQD56gP+7qgIFOqzvLbDpke6iJR6YapJ+kA8HjUL+DyHiKy
         +7NkKP96kiTMdLcfY8EpRMfItKrh6siytmWkC/b0tGgiJkDeyeXjOqlFRgZJ9luyNyNG
         6FpewpnZhlzpQ9biBgMEY7x44yXFsfP3XIyl2lb1fAFA0jwMYwVdtCGFuyqF5RwPlBAL
         hg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722875649; x=1723480449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
        b=fMVmJ/cdrYqP6iQSmfCkqYhNuqJKiSORBROV2S9vwf9mszJhKXDzTDXAxtM/pJzYge
         2kafYJ7nrupGvENNW+mh32PoWiC4IvN/YJcBsToZk0lbj28TqbsKJF5oCoJVIl+rLaNC
         oOkUVetd2V1+w973HYOYFyRZzJ2FDTsyp1VHfawKVpEldbyweoi7kX17ZM24E1f7LTOl
         k0SKYLweATonrFK0LJMSkkz3VaALeRSnzsa1JTVHJ/3nevfOXXPRjysmNcpM3BizV+Ns
         7OB33qLYSXeJ9uoxM5nbrAgBWN4eyRfIZxd3+nDKYXXs7b6Tqp6EfGRXBwG+u1CDGqCu
         JTlw==
X-Forwarded-Encrypted: i=1; AJvYcCWchxdd1ETDLHG2lFyNjwqdxTToZvph+cVlatjcZ5dydDxtrMEK+an+oobMVg9lc0UOz5eUENy0XGw++QSngi6pELfm2BxE4OVg0Bhm
X-Gm-Message-State: AOJu0YxrCefs+V4P3n8Wbh2B/wn43CttDfbenCqXp5GB0MnlHUWXPJCW
	CYVOaQdIlB+tCciH0tRZiWW6pCzrc/RqejUSvwk2Vs2/49Vj5bM5KOj4gxxw7O/Beldhgi6g1VA
	gp+nZaYxU/TSEv0d5f+YnCpIVqE3TJaFQpuOD
X-Google-Smtp-Source: AGHT+IE3X2dzKDTfvW579W1ONWZvzHmSuPdaFYmL6fjjzD5I45yXHVQPoF1XfHnvXWK/VzgEqMK+gXEJqks0i1Xyhdk=
X-Received: by 2002:a05:6214:4412:b0:6b5:7e97:7151 with SMTP id
 6a1803df08f44-6bb98345fa9mr131458736d6.17.1722875648824; Mon, 05 Aug 2024
 09:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730022623.98909-4-almasrymina@google.com> <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
In-Reply-To: <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 5 Aug 2024 12:33:55 -0400
Message-ID: <CAHS8izPxfCv1VMFBK1FahGTjVmUSSfrabgY5y6V+XtaszoHQ4w@mail.gmail.com>
Subject: Re: [PATCH net-next v17 03/14] netdev: support binding dma-buf to netdevice
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
	Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Christoph Hellwig <hch@infradead.org>, David Ahern <dsahern@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Helge Deller <deller@gmx.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Jakub Kicinski <kuba@kernel.org>, 
	"James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jeroen de Borst <jeroendb@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Matt Turner <mattst88@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Paolo Abeni <pabeni@redhat.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Shailend Chand <shailend@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Taehee Yoo <ap420073@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Yunsheng Lin <linyunsheng@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 4:38=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/include/net/devmem.h
> > @@ -0,0 +1,115 @@
> =E2=80=A6
> > +#ifndef _NET_DEVMEM_H
> > +#define _NET_DEVMEM_H
> =E2=80=A6
>
> I suggest to omit leading underscores from such identifiers.
> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+=
define+a+reserved+identifier
>

I was gonna apply this change, but I ack'd existing files and I find
that all of them include leading underscores, including some very
recently added files like net/core/page_pool_priv.h.

I would prefer to stick to existing conventions if that's OK, unless
there is widespread agreement to the contrary.

--=20
Thanks,
Mina

