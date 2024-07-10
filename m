Return-Path: <linux-parisc+bounces-1817-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2BD92DA0B
	for <lists+linux-parisc@lfdr.de>; Wed, 10 Jul 2024 22:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16F9F1C219E9
	for <lists+linux-parisc@lfdr.de>; Wed, 10 Jul 2024 20:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F07198E7E;
	Wed, 10 Jul 2024 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJZxbkmN"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F66C198E6D
	for <linux-parisc@vger.kernel.org>; Wed, 10 Jul 2024 20:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720643360; cv=none; b=twhFjC6uhErtST9jmy3rntx1NHpvCfeQyGWH9pGYjC909fBtIaXNa6t0otG4ZUQ1V0CCQyGINrvbY+66cbh7Y4kDoocDu+eqLRkfmAwFB2rB2+maj4f3j/gdcxjjQ50007eklkC3LYZCh7081XrfZ0TKMBvOHzRjD3xhJXbGq1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720643360; c=relaxed/simple;
	bh=lUBEgBl64OukQYoXw+IzWRxkunsos7uu5wD0WIADxEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hu1WmKl77GdFc3641kH/jd8p2LJs/GBTG3ABx1MoHzoY6CKMfz5qwuaZXwucvGM0r6HlThr4cNuOxJebOpM6w2qZPJM/c3+Ly5+Q3fk39q+xq2Vjlcupcbr53u3T6iyDysVqU3XPXO9mbeF+TOiKK2bHuK6zJWCJjY6fMajkjNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJZxbkmN; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7037a208ff5so81639a34.0
        for <linux-parisc@vger.kernel.org>; Wed, 10 Jul 2024 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720643356; x=1721248156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ip/0MDOrHp5lX/Irp7UEa2BIGo3LvwiW3nUCmkpVR3o=;
        b=BJZxbkmNVvsrwsOuaaprwEqVg0CMet2325nHNs5uvMq63SzxrXSfmdtUd5/igfuBB5
         jgvxXpBg+b5P9K4cSsYXndaGhb9pG6io8fOpsrAVQd6eQbisUPDp5GX2yK3xOT31K+hB
         rLXwaUbLpXIB9Q8v6gUxwPZvMaiutAxat3yGpdgYDau0bKKtb1PqBwTj9smNTxWa9uqn
         ZOCLTZyhZ/8hIrlgllUXJArVcKmiCm1dWbpOErCJbkZe5/sFJt4kL9PtuqFW0Ove1CUu
         Nh8cY4TxxbDibsYnfTcPZ/+y1o+vX+c63l8fC/vydJq0Ce+I40QGkc0fyN+PLM3HKAgI
         +oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720643356; x=1721248156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ip/0MDOrHp5lX/Irp7UEa2BIGo3LvwiW3nUCmkpVR3o=;
        b=Au3EKDR+Y8IA0SVxbgO/GV5wKdm5ehFQOOSm6bJC4ITDNdWSlPLkH+V1fPwWuj3iOG
         V9tXXe6Y/QfQt9jggyzBxT1hbtMx//wWxSLtOXekdqDAAYULWAi6k4SloVTOtUz0GSgZ
         hYmAZjGeZ58JrRcZJt6brBoqrUfOlXa/b9lh0KQdvK23RktiFS6VSps/e2zCSjiKA6k0
         jCkvBL3WNUWERKB48XELMKznoNks4QS9Gl5xX24budF4smu44TxBDdmmD1V9+chGzkk6
         BWdH+HfkY6Ld3WsIy8aWS7IILD6jY3kpqssPqXHN8NrktA5Ua+L5CjCX/i5dpUU7jvcB
         uEpg==
X-Forwarded-Encrypted: i=1; AJvYcCXHHWZgcQu3+yhNhLlHoiUZm3v+qcjuSBIDC2tG3MLeqVUYau69AFIrU3q9NEXHBgkzqQooMnsdLdiqUlTFcMVBY+VHXLD7/nbjqzf3
X-Gm-Message-State: AOJu0Yy0qUXmiiz1DmZZCt64O4aokEf0FelH/i5ZM8S7H8d336mkO7rW
	k41c92cPy1sgM++dvoreH6JSWGfE19upBs05JzNxWjl2s23QK0pMIq9e3kk5C2Nm+fvy4pAlEQJ
	XXj4oHjBBWn3WjYObaslpx1u5QRySkvO2sqb/
X-Google-Smtp-Source: AGHT+IFh61JWNinxflrD0b4ZVWkvEczGu6mIg9bnLfCV6X6pe63Th6j/ytHY2kvRgro//9ydMtTk5x6Go2aTaB1/aws=
X-Received: by 2002:a05:6830:22ed:b0:704:4995:3733 with SMTP id
 46e09a7af769-704499539f5mr3557560a34.31.1720643355799; Wed, 10 Jul 2024
 13:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-6-almasrymina@google.com> <20240710094900.0f808684@kernel.org>
In-Reply-To: <20240710094900.0f808684@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 10 Jul 2024 13:29:03 -0700
Message-ID: <CAHS8izPnFxeEMEQkxq=A9Rp7T8ADJ__3eWfeQmC2hEBYQVzcvw@mail.gmail.com>
Subject: Re: [PATCH net-next v16 05/13] page_pool: devmem support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, linux-mm@kvack.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 9:49=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 10 Jul 2024 00:17:38 +0000 Mina Almasry wrote:
> > @@ -68,17 +107,103 @@ static inline netmem_ref page_to_netmem(struct pa=
ge *page)
> >
> >  static inline int netmem_ref_count(netmem_ref netmem)
> >  {
> > +     /* The non-pp refcount of net_iov is always 1. On net_iov, we onl=
y
> > +      * support pp refcounting which uses the pp_ref_count field.
> > +      */
> > +     if (netmem_is_net_iov(netmem))
> > +             return 1;
> > +
> >       return page_ref_count(netmem_to_page(netmem));
> >  }
>
> How can this work if we had to revert the patch which made all of
> the networking stack take pp-aware refs? Maybe we should add the
> refcount, and let it be bumped, but WARN() if the net_iov is released
> with refcount other than 1? Or we need a very solid explanation why
> the conversion had to be reverted and this is fine.
>

Right, as you are aware, page refcounting is based on 2 refcounts: pp
refs and full page refs. To be honest I find the 2-ref flow confusing
and I made an effort to avoid porting this bit to net_iovs. net_iovs
just supports 1 refcount, which is the pp-ref.

My intention is that when a reference is needed on a net_iov, we
obtain the pp-ref, and when we drop a reference on a net_iov, we drop
the pp_ref. This is able to work for net_iov but not pages, because
(as you explained to me) pages can be inserted into the net stack with
full page refs. So when it comes to refcounting pages we need to be
careful which ref to obtain or drop depending on is_pp_netmem() and
skb->pp_recycle (as pp_recycle serves as a concurrency check, like you
explained).

AFAICT, since net_iovs always originate from the net stack, we can
make the simplification that they're always seeded with 1 pp-ref, and
never support non-pp-refs. This simplifies the refcounting such that:

1. net_iov are always is_pp_netmem (they are never disconnected from
the pp as they never have elevated non-pp refcount), and
2. net_iov refcounting doesn't need to check skb->pp_recycle for
refcounting, because we can be sure that the caller always has a
non-pp ref (since it's the only one supported).

Currently, as written, I just realized I did not add net_iov support
to __skb_frag_ref(). But net_iov does support skb_pp_frag_ref(). So
there is no way to increment a non-pp ref for net_iov.

If we want to add __skb_frag_ref() support for net_iov I suggest something =
like:

diff --git a/include/linux/skbuff_ref.h b/include/linux/skbuff_ref.h
index 0f3c58007488a..02f7f4c7d4821 100644
--- a/include/linux/skbuff_ref.h
+++ b/include/linux/skbuff_ref.h
@@ -17,7 +17,13 @@
  */
 static inline void __skb_frag_ref(skb_frag_t *frag)
 {
-       get_page(skb_frag_page(frag));
+       netmem_ref netmem =3D skb_frag_netmem(frag);
+
+       /* netmem always uses pp-refs for refcounting. Never non-pp refs. *=
/
+       if (!netmem_is_net_iov(netmem))
+               get_page(netmem_to_page(netmem));
+       else
+               page_pool_ref_netmem(netmem);
 }

If you don't like the 1 ref simplification, I can definitely add a
second refcount as you suggest, but AFAICT the simplification is safe
due to how net_iov are originated, and maybe also because devmem usage
in the net stack is limited due to all the skb_is_readable() checks,
and it's possible that the edge cases don't reproduce. I was looking
to find a concrete bug report with devmem before taking a hammer and
adding a secondary refcount, rather than do it preemptively, but I'm
happy to look into it if you insist.

> >  static inline unsigned long netmem_to_pfn(netmem_ref netmem)
> >  {
> > +     if (netmem_is_net_iov(netmem))
> > +             return 0;
> > +
> >       return page_to_pfn(netmem_to_page(netmem));
> >  }
>
> Can we move this out and rename it to netmem_pfn_trace() ?
> Silently returning 0 is not generally okay, but since it's only
> for tracing we don't care.
>

Yes, I will do.

> > +static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
> > +{
> > +     return (struct net_iov *)((__force unsigned long)netmem & ~NET_IO=
V);
> > +}
> > +
> > +static inline unsigned long netmem_get_pp_magic(netmem_ref netmem)
> > +{
> > +     return __netmem_clear_lsb(netmem)->pp_magic;
> > +}
> > +
> > +static inline void netmem_or_pp_magic(netmem_ref netmem, unsigned long=
 pp_magic)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp_magic |=3D pp_magic;
> > +}
> > +
> > +static inline void netmem_clear_pp_magic(netmem_ref netmem)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp_magic =3D 0;
> > +}
> > +
> > +static inline struct page_pool *netmem_get_pp(netmem_ref netmem)
> > +{
> > +     return __netmem_clear_lsb(netmem)->pp;
> > +}
> > +
> > +static inline void netmem_set_pp(netmem_ref netmem, struct page_pool *=
pool)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp =3D pool;
> > +}
>
> Why is all this stuff in the main header? It's really low level.
> Please put helpers which are only used by the core in a header
> under net/core/, like net/core/dev.h

Sorry, will do.

--
Thanks,
Mina

