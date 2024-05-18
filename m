Return-Path: <linux-parisc+bounces-1429-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7B98C91EF
	for <lists+linux-parisc@lfdr.de>; Sat, 18 May 2024 20:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5192A282148
	for <lists+linux-parisc@lfdr.de>; Sat, 18 May 2024 18:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE7C56454;
	Sat, 18 May 2024 18:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="eR1BZGWi"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690EF54907
	for <linux-parisc@vger.kernel.org>; Sat, 18 May 2024 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716057974; cv=none; b=fBNSpN7ins9jlhKcxVH/TJtZvaRS3ZjK6KuEr9N+NbhXKJY0+1O8lwgQ4HbGc0zU5pPxMSTq5oLsP8lAC39smwZNrZbUrfm9u7Bq5dyt/yGHf0zOsM2g4aFOlT82A72Rfa5JE+zXLGE8d6tIjYm1ksCqdyhwbuRc4/qxljj/4t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716057974; c=relaxed/simple;
	bh=zQdyUAfqyEGFQFtZHOsOkjixcTwdwCIOHdjVrBr5h0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3BxvK40VKxTBxNXjkCEq/pYfVJKRWWjBpYQSL7rSjEhBoa9zMBGecfH0U2YI0mhQUWrD1UgeLC5U6FBPmNBEn3dqFKWDpoUWCludOje6ks2sTjB1MZhi5ywo3wdYFbO0y0azugoF4DPlLApiyEFKReWd7z/Rdz2E/8A5qyrS6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=eR1BZGWi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ee42b97b32so41065255ad.2
        for <linux-parisc@vger.kernel.org>; Sat, 18 May 2024 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1716057973; x=1716662773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtghe09oJ6h1zM6r9/hcuib2w+0SfFSyUIep5UEjz/8=;
        b=eR1BZGWiXUpu2rNKW2Dg0cebePtcPzqYX2u5sAFvIGD+F4YpaI4u3yxUrMF+gvTohG
         affruCAaUkXyjjMKkYm2juD+Qy8Su66gtY7GTZSw/0NV8Lp5VsnFW5Eeuy9jLGUqnduO
         sfBEHdUFPniJ+ymxgStYAf3knUbYbu13wMvCjt/gGpJUao1H7fIMRVoIo3Zdk0e1j7Jk
         gGrny5nnCtrzU5wwSTUSnMoslxlmwQHgozR5HStBaLReUsSSObFhENpDWdzmADxItp1p
         prY4wfdoqXZl+zZLTNCR26qlRpJN3t4e0Nz2ujcdkegRJyydgbisxR10yo8UJA7lcKKl
         M0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716057973; x=1716662773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtghe09oJ6h1zM6r9/hcuib2w+0SfFSyUIep5UEjz/8=;
        b=SBOt7sS8Y8f6I+3gJ3VxDNL/R6NdZaGohwS35eTH+gQe9ZRtbXAIVJzEBXq/eYQcWx
         YeqklRdjFRjETXx3P9VAOhWQYzN4cXzs1qiA29VRgLrn6mfw/3RvvvP0FSYly7PL/K2h
         1d4e9h6/3GCu7OL9NUlCdXxinUwreDKC8X5EmrsHikzCsDkOO/1A3FpJOJwD+ATyQCNr
         KuFhCvMzHMKKIy4CNImBW2MvMrbKlWOvWWmFvK5YR+8BwJUtUeeKanYs9JaJXFeIcoMN
         rZnIPhvYyH1UXQ64E5+lrLVYsUqUsg4SAg6he1ljKXG1qpIFZ1oKGlf7qhheidnBg+o/
         oQzw==
X-Forwarded-Encrypted: i=1; AJvYcCW4RmJrNT4/2swBe0KN7rQTH0wNbei0Z79/0AcotmudPoGl7yn2em++qS3kRCi2dwgvYs3jf/xVrE9EYEt4ZBmYZnlsdqGbOkopaejm
X-Gm-Message-State: AOJu0YwKRV6ItuHfo59LlGsoiRFYu5xw3RsxTvuMcxoXtW8sC+fKIrit
	IMUqSXAnAI1yc7MOFDUWtXrHe/HUs9ZLURvKrq05hIZntUCYYTlENnJ7yD/wlsWNt49r3EGP97M
	ZAJ8=
X-Google-Smtp-Source: AGHT+IGg0S5X0hOpYwIoBA7prkwh880WzDoU3RkbOFeT/k39JSwrbImT1CJOj9wyUMDIZCVhykRgQw==
X-Received: by 2002:a05:6a00:1988:b0:6f3:8468:f9d1 with SMTP id d2e1a72fcca58-6f4e02c7d62mr28356985b3a.14.1716057972513;
        Sat, 18 May 2024 11:46:12 -0700 (PDT)
Received: from [192.168.1.16] (174-21-188-197.tukw.qwest.net. [174.21.188.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a6656esm16665141b3a.38.2024.05.18.11.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 May 2024 11:46:11 -0700 (PDT)
Message-ID: <d85f4ba4-774f-4577-985f-45a5a1866da7@davidwei.uk>
Date: Sat, 18 May 2024 11:46:09 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 04/14] netdev: support binding dma-buf to
 netdevice
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240510232128.1105145-5-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240510232128.1105145-5-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-05-10 16:21, Mina Almasry wrote:
> +void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
> +{
> +	struct netdev_rx_queue *rxq;
> +	unsigned long xa_idx;
> +	unsigned int rxq_idx;
> +
> +	if (!binding)
> +		return;
> +
> +	if (binding->list.next)
> +		list_del(&binding->list);
> +
> +	xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
> +		if (rxq->mp_params.mp_priv == binding) {
> +			/* We hold the rtnl_lock while binding/unbinding
> +			 * dma-buf, so we can't race with another thread that
> +			 * is also modifying this value. However, the page_pool
> +			 * may read this config while it's creating its
> +			 * rx-queues. WRITE_ONCE() here to match the
> +			 * READ_ONCE() in the page_pool.
> +			 */
> +			WRITE_ONCE(rxq->mp_params.mp_ops, NULL);
> +			WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
> +
> +			rxq_idx = get_netdev_rx_queue_index(rxq);
> +
> +			netdev_rx_queue_restart(binding->dev, rxq_idx);

What if netdev_rx_queue_restart() fails? Depending on where it failed, a
queue might still be filled from struct net_devmem_dmabuf_binding. This
is one downside of the current situation with netdev_rx_queue_restart()
needing to do allocations each time.

Perhaps a full reset if individual queue restart fails?


