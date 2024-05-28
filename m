Return-Path: <linux-parisc+bounces-1443-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B968D2288
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2024 19:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD549287FBD
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2024 17:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBDF20309;
	Tue, 28 May 2024 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F4p6t/tW"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726329406
	for <linux-parisc@vger.kernel.org>; Tue, 28 May 2024 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716917816; cv=none; b=mrwpeXdaNOT3UGwx8Nhu3aZL2ncfNswa+74yWOEKaWXza0ve+IOCeCMCGJJpreo3pEzsLZS2oeGChouWwk4w3ExVUkqc7opk6AuLsbMZ4C9z8NW0M21Q0wkIXCbJUmtPwe6UQhl+qixGs1ncz+YgDPbAJoWXQ8mmKxii0Dqtm+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716917816; c=relaxed/simple;
	bh=5jqpjWDjCYeF0iZMmfNh1F02B5hbFSGCHFwvks87kGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcYQxVMeEG4QJxAIABkVwo7pclp+KhlRiX1A23iiu4p6O5tWqBK0F7sr+u1I0+wm03aidNm68xzmZ7fOPSjV2e5mHYsxrOd7Nz3UjevPFFTurgw+6rJ4SknORLYqAM+IkYL82HY32Hjcdyai0oB7xK6PbUenlP8TJNvwytJzmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F4p6t/tW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a634e03339dso116694466b.3
        for <linux-parisc@vger.kernel.org>; Tue, 28 May 2024 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716917813; x=1717522613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1nTYMe9Sz2kd146CNINlSxaoddIUqGPBCQrAMYzjnQ=;
        b=F4p6t/tWtjSOVYylJbwcLVV6UTyM4sNrgf29x/I2qiaXmlzGuSs/libx4uluVN+nqU
         Q1wu6ZyJ+t/J5G4TTactfmH72bg+9gQMI6XUV/JPUvIcgZPTSklK6xODqYbVvKUruZsd
         qGcZJqKk9SLen5tkhgx7pjnVQN79mjH/J3XY5cJYmSYfwEdHgeAgZgJLCWfItyd1aUlo
         m8SST44+ucTlAuYiprzs7++Q4aRuTHjVObQuxYwumcTSK42endimDnDiRHgNYuUyIKni
         X0y60pnKnN3oBLyeEGWlqJk5sfZxG3gqEzLBOt9HDhyBsgJwOczZkJZdgWzCHvs7ja5e
         tsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716917813; x=1717522613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1nTYMe9Sz2kd146CNINlSxaoddIUqGPBCQrAMYzjnQ=;
        b=g9LXm/AGCkHpWvJHtzz5Uj3btCV1QsTftl1dMchpFkKwIYQ6ki7rDcHaQV/IAqxpAp
         Bq0r4MnIVyCcU99Pbi3b2xzs2hseqlahBj5xjZYvfTKg4ItZQiLkZrwyP9vtDi5DX0za
         kn4tvHXOF3YcSEO4Z1QQ+uqsWOUJObESTRQ74eFmOd1R0PXnLk7jf3AEdbrbmNzAY3IK
         NDPtroWe100QXaCyjnN2HBkzLGCqiLZgTVwVAyQud72sawRfHCukTNL/VdQRAucynEXq
         EYD/2zYsAc+l9jSVPZm9xoISa2gwoSVPGZ9FMwSY3J/UeddnidpeOAKlcCOOGTDwoS9y
         DUMw==
X-Forwarded-Encrypted: i=1; AJvYcCWjGv8NtDWr5mNo9Buta+ksI820idvvVCWLgnwHBFFsMQzg5csr91ySYLZvlo0tjA/sxv18J27afUjwgGu1+x9hNE7qZDH1hBNkBTr8
X-Gm-Message-State: AOJu0YyKHDzdjhscY4LD2CWISUF+pihK+JCSq9niHK/fVnoWmDy3kaSH
	38mH6HAG5qw1vNmKvivLx8dAjzfk+I89ZWzJMjtucMGpcfjzZhYPNFOW+G8Xx9Vf33vCAzLBeb0
	ocBvDpRl2gYd86bgh8szkrUnPAFplSN5NahAz
X-Google-Smtp-Source: AGHT+IFf32eXkuapluEvlBEyoJKJxifsmiVKQ0AvF4ow+8ygeGf1col+Xo1abUwIXzRnUJhSc+Yk6CUkl0RPaD3UYic=
X-Received: by 2002:a17:906:3c1a:b0:a63:42b6:1976 with SMTP id
 a640c23a62f3a-a6342b619f5mr156681366b.68.1716917812713; Tue, 28 May 2024
 10:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240510232128.1105145-12-almasrymina@google.com> <9097e78d-0e7d-43bd-bafd-e53a4872a4d1@davidwei.uk>
In-Reply-To: <9097e78d-0e7d-43bd-bafd-e53a4872a4d1@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 28 May 2024 10:36:40 -0700
Message-ID: <CAHS8izOe-uYjm0ttQgHOFpvp_Tj4_oRHV6d1Y1sWJAZJdCdCBA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 11/14] tcp: RX path for devmem TCP
To: David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
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
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 11:02=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-05-10 16:21, Mina Almasry wrote:
> > +/* On error, returns the -errno. On success, returns number of bytes s=
ent to the
> > + * user. May not consume all of @remaining_len.
> > + */
> > +static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *s=
kb,
> > +                           unsigned int offset, struct msghdr *msg,
> > +                           int remaining_len)
> > +{
> > +     struct dmabuf_cmsg dmabuf_cmsg =3D { 0 };
> > +     struct tcp_xa_pool tcp_xa_pool;
> > +     unsigned int start;
> > +     int i, copy, n;
> > +     int sent =3D 0;
> > +     int err =3D 0;
> > +
> > +     tcp_xa_pool.max =3D 0;
> > +     tcp_xa_pool.idx =3D 0;
> > +     do {
> > +             start =3D skb_headlen(skb);
> > +
> > +             if (skb_frags_readable(skb)) {
> > +                     err =3D -ENODEV;
> > +                     goto out;
> > +             }
> > +
> > +             /* Copy header. */
> > +             copy =3D start - offset;
> > +             if (copy > 0) {
> > +                     copy =3D min(copy, remaining_len);
> > +
> > +                     n =3D copy_to_iter(skb->data + offset, copy,
> > +                                      &msg->msg_iter);
> > +                     if (n !=3D copy) {
> > +                             err =3D -EFAULT;
> > +                             goto out;
> > +                     }
> > +
> > +                     offset +=3D copy;
> > +                     remaining_len -=3D copy;
> > +
> > +                     /* First a dmabuf_cmsg for # bytes copied to user
> > +                      * buffer.
> > +                      */
> > +                     memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
> > +                     dmabuf_cmsg.frag_size =3D copy;
> > +                     err =3D put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEA=
R,
> > +                                    sizeof(dmabuf_cmsg), &dmabuf_cmsg)=
;
> > +                     if (err || msg->msg_flags & MSG_CTRUNC) {
> > +                             msg->msg_flags &=3D ~MSG_CTRUNC;
> > +                             if (!err)
> > +                                     err =3D -ETOOSMALL;
> > +                             goto out;
> > +                     }
> > +
> > +                     sent +=3D copy;
> > +
> > +                     if (remaining_len =3D=3D 0)
> > +                             goto out;
> > +             }
> > +
> > +             /* after that, send information of dmabuf pages through a
> > +              * sequence of cmsg
> > +              */
> > +             for (i =3D 0; i < skb_shinfo(skb)->nr_frags; i++) {
> > +                     skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> > +                     struct net_iov *niov;
> > +                     u64 frag_offset;
> > +                     int end;
> > +
> > +                     /* !skb_frags_readable() should indicate that ALL=
 the
> > +                      * frags in this skb are dmabuf net_iovs. We're c=
hecking
> > +                      * for that flag above, but also check individual=
 frags
> > +                      * here. If the tcp stack is not setting
> > +                      * skb_frags_readable() correctly, we still don't=
 want
> > +                      * to crash here.
> > +                      */
> > +                     if (!skb_frag_net_iov(frag)) {
> > +                             net_err_ratelimited("Found non-dmabuf skb=
 with net_iov");
> > +                             err =3D -ENODEV;
> > +                             goto out;
> > +                     }
> > +
> > +                     niov =3D skb_frag_net_iov(frag);
>
> Sorry if we've already discussed this.
>
> We have this additional hunk:
>
> + if (niov->pp->mp_ops !=3D &dmabuf_devmem_ops) {
> +       err =3D -ENODEV;
> +       goto out;
> + }
>
> In case one of our skbs end up here, skb_frag_is_net_iov() and
> !skb_frags_readable(). Does this even matter? And if so then is there a
> better way to distinguish between our two types of net_iovs?

Thanks for bringing this up, yes, maybe we do need a way to
distinguish, but it's not 100% critical, no? It's mostly for debug
checking?

I would say add a helper, like net_iov_is_dmabuf() or net_iov_is_io_uring()=
.

Checking for niov->pp->mp_ops seems a bit hacky to me, and may be
outright broken. IIRC niov's can be disconnected from the page_pool
via page_pool_clear_pp_info(), and niov->pp may be null. Abstractly
speaking the niov type maybe should be a property of the niov itself,
and not the pp the niov is attached to.

It is not immediately obvious to me what the best thing to do here is,
maybe it's best to add a flag to niov or to use niov->pp_magic for
this.

I would humbly ask that your follow up patchset takes care of this
bit, if possible. I think mine is doing quite a bit of heavy lifting
as is (and I think may be close to ready?), when it comes to concerns
of devmem + io_uring coexisting if you're able to take care, awesome,
if not, I can look into squashing some fix.

--=20
Thanks,
Mina

