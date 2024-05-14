Return-Path: <linux-parisc+bounces-1404-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB48C5A24
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2024 19:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCB701C21A72
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2024 17:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708431802BC;
	Tue, 14 May 2024 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0iOWUnBD"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6591C17F39D
	for <linux-parisc@vger.kernel.org>; Tue, 14 May 2024 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715706937; cv=none; b=tYZfyJwqwGHqmMME1Fd3dXvgg6w4XfghVexfUbMBbp1z7xZ93pl2lhnEa4fEzpJdydH4GNyaGGEnmNgIhkIxZjRQrDecSlfTkRJ0UIvxXctX0V3ipwLRjxPtx3TTRaZTeFa5b5HVuFCLO9cH94cmx6qT+QHfYOUCw4guJpwezn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715706937; c=relaxed/simple;
	bh=JphrTnGE11d/hcgLanrvMdnjxLSu0oYp2e2Hwwop9sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8bv3UMnpZTHD4qDnHpKgqHaStevRvJyap+/cFhsfuNbu4iK7MRuZYV71ei8IUU+UPSO87I3UE6Os3cYdI3jQNSdVK970RSnH3a5zy6mK4TIxOGpHNQQm93W3wXU/iouhtLLk45l2Oau6AgTbKWyGLkGkeORYpb9yo1oL9EgBc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0iOWUnBD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59a64db066so46549266b.3
        for <linux-parisc@vger.kernel.org>; Tue, 14 May 2024 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715706934; x=1716311734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JphrTnGE11d/hcgLanrvMdnjxLSu0oYp2e2Hwwop9sM=;
        b=0iOWUnBDzJP8ffTn7q6qGPHMBKoAK2jWGPB1fnj68OQljM1csqUFLvPtPlrkGkTqDY
         Vqdbb3tImIM99DQ8Lglibm2JxMP7EWa1fUXdHtcBAfOkOZPh6XI3f535F8wRWntSYn3O
         0t9exVre0Q9nMFx72/hEX35IFOOgJFYZMPJSQJuvvoitWok2x8anqnrLIN9k2E77gx3/
         GMql6scUnB/KnFb2CYg+ikZG9YSGieC1q+VcKFydFMlbmiyCoTW5qJgM3qPxX4qw/SQc
         BVSK6uLSIAeDmF+4lm1Q4UJaWQZUEaY/ocJSIVWJ+/RUhIg5dDBTwfiS+AqwJ529ZUQx
         Z4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715706934; x=1716311734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JphrTnGE11d/hcgLanrvMdnjxLSu0oYp2e2Hwwop9sM=;
        b=ozjjh0Bu9ujYqktQC6a/bCc3Myr49qbsW7635K9Q2AnIpp300E6Huz+Uat6GoYA/0v
         GYOOfeVVh0nl+BQOB/JPd4eCJL93P5L0DYzGR5OQa8hPTjCQWPPSNigxzkx0dfhFvQQv
         Ok0605ryjW3jRPEIEuV0ZOfoMH/CMQFNZDqEjEWFGZBsgNmOTJ8E6LLH3KnKoGPstSp8
         BWJRj4sU5C+MR8TGaUAPD/Ub7SpDepBOC+Hb3Mq5JyxAjYGSNQsN4AUTuCmoYgtjRfis
         c8yRFdiGpBq7lqrgWzzONpm5bhlHmruskUVi78ZhZfdBAdhZmwj5bAlR3iFPy8Hjbfi/
         FI0g==
X-Forwarded-Encrypted: i=1; AJvYcCXef1pBmByBUTJ4nREhoNAQ4b7WzEmVZKDFTu8lp4Vx4VTMziXjM0MyGS3Xg65AXb3qNfZNEHVIV+q8577+PMXSvj7aS2UhN6wh0Syb
X-Gm-Message-State: AOJu0YwBIGzdBCUnhkt28oWUPkOtAvJq87NOfFsfoHCr3DFcRR9Zbxxu
	J3c7BkTvsizf/oPVQDYRN9KldN7k6FEiCWCLAx1N/ZB9XEoNqzTZxAvXQgYorrQrt+JxLC7eM49
	ZwfBP1TM4Npl9wk9gQQ8ycYjNAPNPCcfW47Ji
X-Google-Smtp-Source: AGHT+IEwOQpqw4ZMKIlz9X6LbLlfb8P5lzGCaO4YFYW5AVzaTN7hWpB9KsS7Ts3tYb3EwJ+JwuI+UCM3+u1xlOEFWOo=
X-Received: by 2002:a17:906:714a:b0:a5a:8ac4:3c4c with SMTP id
 a640c23a62f3a-a5a8ac43e15mr130162166b.68.1715706933383; Tue, 14 May 2024
 10:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510232128.1105145-1-almasrymina@google.com> <20240513163114.52b44f66@kernel.org>
In-Reply-To: <20240513163114.52b44f66@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 14 May 2024 10:15:18 -0700
Message-ID: <CAHS8izMH9223wbHQk8zbtqP-hfydvqkmo3k3BYeWYrpkuVcnVw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 00/14] Device Memory TCP
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
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
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 4:31=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 10 May 2024 16:21:11 -0700 Mina Almasry wrote:
> > Device Memory TCP
>
> Sorry Mina, this is too big to apply during the merge window :(

No worries at all. I'll repost once it re-opens with any feedback I
get in the meantime.

--=20
Thanks,
Mina

