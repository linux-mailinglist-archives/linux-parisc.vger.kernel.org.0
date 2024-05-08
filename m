Return-Path: <linux-parisc+bounces-1362-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48D8C0117
	for <lists+linux-parisc@lfdr.de>; Wed,  8 May 2024 17:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E177A1C23CE3
	for <lists+linux-parisc@lfdr.de>; Wed,  8 May 2024 15:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8958D128814;
	Wed,  8 May 2024 15:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Cs/W2GsW"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F938127E2A
	for <linux-parisc@vger.kernel.org>; Wed,  8 May 2024 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715182480; cv=none; b=aofK1ozjRih2RiUew2TnrcJXPikr+HuDG8dR+LmScrLtCuN+Yq85xTc+9p7rKZGZ/4WSrksqzkIsuxT6lPkY2zxhFP9XNfcHHpXF+W/4Dg/9efqH5puj8Ck6Pp09YM+W8pE6mMHHCuLU3I+/vojQO/XzKalAJkHuIgnaaH0FZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715182480; c=relaxed/simple;
	bh=OM1eAfRhyV3Y6xgWugPNvS9Olp1YXcsXIUwGaArq1gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHJAdtd4ECQJ32nVmDSujblHlxSneCVN8EJ8B0o1VAorFiUyhdD1XiANYSiU+9twkOyBCimfBODks6ULN/g1xkxjM6XV7DhHARv+WhjuID/qmgqaGfOiJLVFSy9F4BIpeeoDCzqhwxHGLSCdn4TqEyanj6M12t9FIy3g1YAkEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Cs/W2GsW; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51fd4c6b83dso995866e87.3
        for <linux-parisc@vger.kernel.org>; Wed, 08 May 2024 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715182476; x=1715787276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzSCOae2a+QPgOLUGTOQmc4nIRcoyi9N83mBQKVx8Xg=;
        b=Cs/W2GsW4Akw5wpqOChNN54DDMID8THeUpU383oFyAk7zS0GvirQzNO+qXLQi9sRBa
         wpNWf0/qeC1tTYWo/4yaTC/RLvnGWvqpH8cKnxy29uy6ElLVTj9yTHdQgn6ZI1K4Cnel
         sHfjaq1P0Wnaz4xn87oQ/JsgLFISqcGIkKIQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715182476; x=1715787276;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzSCOae2a+QPgOLUGTOQmc4nIRcoyi9N83mBQKVx8Xg=;
        b=cbPTt5EMQQ7QiAebMZVSjUk+Iwj/ZJWYZQvbWmQrPUycnZ/b2+zAz7NeJQgsc/mtNJ
         W6dXRoTp93Xnb+NBt9SX9yCTg4Pd0Fk4jc4JvljOutMLG7RrsgrMhVrmEReNH0ilOzz7
         U1VbTzVXqseIQ7LyaculWP2DI2d1pYdn4+5XHcEQ4fUmSjA9zr1W2jm2Wvzr6L+cdBUI
         28arU9j7xBFEHunEECYMkfP78bQn6suW8rHvujRAzSZ1mAlckY/uAUAWAPmA7UszUFfT
         YgULpi2ZwOYR/wIvCNi3x35MtI1Fq87Ed/nlWZ0T+Np3/JO2L+Khi3PPlZ94lU5ObLa9
         yEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeI8PkCyhxT2Z4l8d25TKkq2sWjyCNeRRC6pvRFUjuhxJHzFwRWsSIsW5UM9R0C5rfRmM/ZtKZ0l5qNNOUIZaXJsY0qKUYipnFVRb8
X-Gm-Message-State: AOJu0YwYLXldtxCl5vnholUkhzisdCl+jdXHQuLBbvIT3vCo/jrvhI+m
	oa8JxsE1iBSguSlYRxpazNGBke5QkXhyYPvnK7Aa0sWZZBOxDkcN1RWp9mjf0K8=
X-Google-Smtp-Source: AGHT+IHZ7XK1ZuxPGd8HrjDaMtETjtJJqnKQXRun5AIyHliGUeKgct7es+zl9WyQAXcwu+/5tIrqpw==
X-Received: by 2002:a05:6512:532:b0:51f:8ad:673f with SMTP id 2adb3069b0e04-5217d0487a6mr1735900e87.5.1715182476038;
        Wed, 08 May 2024 08:34:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n4-20020aa7d044000000b005720e083878sm7657018edo.49.2024.05.08.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:34:35 -0700 (PDT)
Date: Wed, 8 May 2024 17:34:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Mina Almasry <almasrymina@google.com>,
	Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Ahern <dsahern@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Florian Westphal <fw@strlen.de>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Aleksander Lobakin <aleksander.lobakin@intel.com>,
	Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Richard Gobert <richardbgobert@gmail.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
	Shailend Chand <shailend@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <ZjubiL4nkULP9nyV@phenom.ffwll.local>
Mail-Followup-To: Pavel Begunkov <asml.silence@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mina Almasry <almasrymina@google.com>,
	Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Ahern <dsahern@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Florian Westphal <fw@strlen.de>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Aleksander Lobakin <aleksander.lobakin@intel.com>,
	Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Richard Gobert <richardbgobert@gmail.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
	Shailend Chand <shailend@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240507161857.GA4718@ziepe.ca>
 <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
 <20240507175644.GJ4718@ziepe.ca>
 <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
 <20240507233247.GK4718@ziepe.ca>
 <Zjsm3vO6rIY_sw5A@phenom.ffwll.local>
 <1e2823db-504b-4829-856f-3f45a45ccada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e2823db-504b-4829-856f-3f45a45ccada@gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Wed, May 08, 2024 at 12:35:52PM +0100, Pavel Begunkov wrote:
> On 5/8/24 08:16, Daniel Vetter wrote:
> > On Tue, May 07, 2024 at 08:32:47PM -0300, Jason Gunthorpe wrote:
> > > On Tue, May 07, 2024 at 08:35:37PM +0100, Pavel Begunkov wrote:
> > > > On 5/7/24 18:56, Jason Gunthorpe wrote:
> > > > > On Tue, May 07, 2024 at 06:25:52PM +0100, Pavel Begunkov wrote:
> > > > > > On 5/7/24 17:48, Jason Gunthorpe wrote:
> > > > > > > On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:
> > > > > > > 
> > > > > > > > 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
> > > > > > > > think in the past you said it's a uapi you don't link but in the face
> > > > > > > > of this pushback you may want to reconsider.
> > > > > > > 
> > > > > > > dmabuf does not force a uapi, you can acquire your pages however you
> > > > > > > want and wrap them up in a dmabuf. No uapi at all.
> > > > > > > 
> > > > > > > The point is that dmabuf already provides ops that do basically what
> > > > > > > is needed here. We don't need ops calling ops just because dmabuf's
> > > > > > > ops are not understsood or not perfect. Fixup dmabuf.
> > > > > > 
> > > > > > Those ops, for example, are used to efficiently return used buffers
> > > > > > back to the kernel, which is uapi, I don't see how dmabuf can be
> > > > > > fixed up to cover it.
> > > > > 
> > > > > Sure, but that doesn't mean you can't use dma buf for the other parts
> > > > > of the flow. The per-page lifetime is a different topic than the
> > > > > refcounting and access of the entire bulk of memory.
> > > > 
> > > > Ok, so if we're leaving uapi (and ops) and keep per page/sub-buffer as
> > > > is, the rest is resolving uptr -> pages, and passing it to page pool in
> > > > a convenient to page pool format (net_iov).
> > > 
> > > I'm not going to pretend to know about page pool details, but dmabuf
> > > is the way to get the bulk of pages into a pool within the net stack's
> > > allocator and keep that bulk properly refcounted while.
> > > 
> > > An object like dmabuf is needed for the general case because there are
> > > not going to be per-page references or otherwise available.
> > > 
> > > What you seem to want is to alter how the actual allocation flow works
> > > from that bulk of memory and delay the free. It seems like a different
> > > topic to me, and honestly hacking into the allocator free function
> > > seems a bit weird..
> > 
> > Also I don't see how it's an argument against dma-buf as the interface for
> 
> It's not, neither I said it is, but it is an argument against removing
> the network's page pool ops.
> 
> > all these, because e.g. ttm internally does have a page pool because
> > depending upon allocator, that's indeed beneficial. Other drm drivers have
> > more buffer-based concepts for opportunistically memory around, usually
> > by marking buffers that are just kept as cache as purgeable (which is a
> > concept that goes all the way to opengl/vulkan).
> 
> Because in this case it solves nothing and helps with nothing, quite
> the opposite. Just as well we can ask why NVMe doesn't wrap user pages
> into a dmabuf while doing IO.

Because the rules around memory reclaim, gfp nesting and guaranteed
forward progress don't match up for block i/o. I looked quite a bit into
gluing direct i/o into dma-buf because there's vulkan extensions for that,
and it's an absolute mess.
-Sima

> 
> > But these are all internals of the dma-buf exporter, the dma-buf api users
> > don't ever need to care.
> > -Sima
> 
> -- 
> Pavel Begunkov

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

