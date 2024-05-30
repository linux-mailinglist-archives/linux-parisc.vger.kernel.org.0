Return-Path: <linux-parisc+bounces-1465-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B18D568A
	for <lists+linux-parisc@lfdr.de>; Fri, 31 May 2024 01:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82ED41C22FC4
	for <lists+linux-parisc@lfdr.de>; Thu, 30 May 2024 23:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D36187348;
	Thu, 30 May 2024 23:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="QL4+RqL0"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209131862BB
	for <linux-parisc@vger.kernel.org>; Thu, 30 May 2024 23:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113109; cv=none; b=G7i3E2+p/UmKof6RGPfNORMjypHq3uGcT6rhCiC6jQrvKORWKhVgu2Eigm06AnnksivMq8EreDSsomXIN55XnTPxId5uqwwoYtT+oGTENdsxjzKcvP0wyycS6qGTs0/4vricxtX8Yo93u8ODmA3bjhrVf0C7W6wYXbCtT/yTP1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113109; c=relaxed/simple;
	bh=W93FmhGSt5rN/d9ZkTtKHNbj8y2kiVp3BB6JpqBPjtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvQ1pXQ1Zz3oHPtIS1aZ/t4mBv0UHd+Gw51CdUzv9n5ioFVaSDbcEa4uCRsYOk1gw/wrIUyISbpNFNEmX95T7lcvfQEGJvdqbxDoXeP5sZ4lGFXO4IDgut95PkoDuXQJdHJl3t/2km1WcE4BJG8/yzEani+TtrTQDMVFtUzx8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=QL4+RqL0; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-702342c60dfso734098b3a.2
        for <linux-parisc@vger.kernel.org>; Thu, 30 May 2024 16:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1717113107; x=1717717907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLw2WCX7NzhXHaHBtGiNDa+0R1r9ENCFVNNCzI5O8YY=;
        b=QL4+RqL090NmzqnmmaV35StPPgSYrm0/E5FYyEyBNDFbnjFYn4+7lynHidmbHWfEVL
         1iBcOwtdX/+OmGH9OHA6Ly9dCXC0kAmMRNt7jsngsMzCorwTnvSYwsuvbd/30RasDM2J
         CgWFzSw7fo3h/P0Vna2SEUkG3BW1pwRp2ZYJmicLk3iur+HVCLaN4mTrgCpO4EGR65xr
         zvIJIWco9NeeSE1nTauAdHI2pE5kFmj0GGL6zKrRbn7msIZJ7JKuUeM9tM4Yd+OHVqGp
         tw2mwrdzVMXg0wyfG0apx+qaFVSep6SjKcJrNGom1L34fJ84bOjAqASDJTHdFqEXjqA6
         2XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113107; x=1717717907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLw2WCX7NzhXHaHBtGiNDa+0R1r9ENCFVNNCzI5O8YY=;
        b=H60PzPwsLgvYJmOFzWWyvHGT10pPMMWA57h8/2i94W8F6fBSNPTdIFPhmKMSymTwnK
         +kCMCuqJ7k+lFLkNb5qYe2tgxmOZ8f2iNLXkknqt1KWKBV6PQ8Zyyxw8iDtc9fguRSsm
         yo4IwFePmoG2GKg/8klRyXmI9AnOysQ5fxX1Ubnm3xz7Ibq0l+zUifaLEBySUtanR4ER
         Vs8k4JVKTh8WTuU7rjDTEQe48kSsVgY4+U3iGbxQpa1kOL3gwyi90mxp+UvsUPCJDb+k
         qIzhBxhoVgV53DYSNV1K440wGL9M44W9k6eYqDMK7WVtAiI5pIxl89mDaMxSaXJLeJcB
         kqlA==
X-Forwarded-Encrypted: i=1; AJvYcCUobYtopw0692Mg45BV85bK/lj7HstVRbjy8YcKgmw+Vnpkk2Pzrw8Eebrw+tA0rqgjZXilyU/maxR3GFGwiuOkYzMZllcda1B80Jf0
X-Gm-Message-State: AOJu0Yw/shjCZHMBATmjAjVnQWLa9MuBo6U/4qnla+T6lWZXpNCSYgn0
	3v299syyL7+G2R9GN6Q5hTyGyXx5CAOb72DKpCefmnPalRh5JpOpuK47EinFYO0=
X-Google-Smtp-Source: AGHT+IGLIircvxxELNZp6hQL4M8a4oqQMuIfbGbj5ESP+8hykh0tgC9NyJcGdtZhysmk5TffXmp10A==
X-Received: by 2002:a05:6a21:7807:b0:1af:f23c:804a with SMTP id adf61e73a8af0-1b26f245bedmr579669637.38.1717113107315;
        Thu, 30 May 2024 16:51:47 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881? ([2620:10d:c090:500::4:5439])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7b7esm298915b3a.13.2024.05.30.16.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 16:51:46 -0700 (PDT)
Message-ID: <49e4d52c-59f1-4321-9012-aabb1e8cc005@davidwei.uk>
Date: Thu, 30 May 2024 16:51:41 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 01/14] netdev: add netdev_rx_queue_restart()
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
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
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-2-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240530201616.1316526-2-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-05-30 13:16, Mina Almasry wrote:
[...]
> +err_start_queue:
> +	/* Restarting the queue with old_mem should be successful as we haven't
> +	 * changed any of the queue configuration, and there is not much we can
> +	 * do to recover from a failure here.
> +	 *
> +	 * WARN if the we fail to recover the old rx queue, and at least free
> +	 * old_mem so we don't also leak that.
> +	 */
> +	if (dev->queue_mgmt_ops->ndo_queue_start(dev, old_mem, rxq_idx)) {
> +		WARN(1,
> +		     "Failed to restart old queue in error path. RX queue %d may be unhealthy.",
> +		     rxq_idx);
> +		dev->queue_mgmt_ops->ndo_queue_mem_free(dev, &old_mem);

This should be ->ndo_queue_mem_free(dev, old_mem).

