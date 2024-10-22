Return-Path: <linux-parisc+bounces-2829-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E95A9A9F2E
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Oct 2024 11:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 826381C248A2
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Oct 2024 09:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF2419AD70;
	Tue, 22 Oct 2024 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0ccslYX"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBA31991CA
	for <linux-parisc@vger.kernel.org>; Tue, 22 Oct 2024 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590598; cv=none; b=tSMw8kQcRqFLTl9oDqFMUIPv4LkmvHwo+xsTCJG+/I2cbCbFXbfDMjeY+SuPsFFKKiEADpH/OS8MdftKddrpi43p9ArJj5WiM1vYJW71dRiCs9hlqiVzFhJfNlWKgzI8IKByYTNr2GGfzj11gW/cY3sY3OkqChFObBe7lo1C+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590598; c=relaxed/simple;
	bh=FHDMCQSj4bOSnFGm64uWhd8NfaqRwIffME40ECj3VBk=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jQ9+tJyFNJ50TPAj6M/uxIVwArLlfZyjVqzxEzwmWlNTZOVjvgDn6WD9lgKmxXNfM6BeUhjV3MSzgn8XBlJMa8RtxhVtdazrllmfRZe5vsnPcRjYHcesOYtjc/y07olFcKTF1BAG2h9lQGip9sjRtd/REQoi7cy49piUDjTFY28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0ccslYX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729590594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHDMCQSj4bOSnFGm64uWhd8NfaqRwIffME40ECj3VBk=;
	b=c0ccslYXT1Jvr5bfvIpZnLGgoYJXQt8jyPMqYh/lOVn9mdHEp9iAR0diAnVPYqR+TNq+Nf
	XyAhSrHk5BMwI9Mbkt0NMHTZyo/dX5j4AFfFM+L8igqIm2LwM3BR+iL9weRObJ4/05/Xi1
	a5MwUBsH6c0QpY1qHdlhnYY4tPy+4Js=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-YA1eY-4jO4uzVZXLi5SsBQ-1; Tue, 22 Oct 2024 05:49:53 -0400
X-MC-Unique: YA1eY-4jO4uzVZXLi5SsBQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d5ca192b8so2956305f8f.1
        for <linux-parisc@vger.kernel.org>; Tue, 22 Oct 2024 02:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590592; x=1730195392;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FHDMCQSj4bOSnFGm64uWhd8NfaqRwIffME40ECj3VBk=;
        b=OhozU8fZ1XGrgTMwQFKadSCJFA/kKXJftSt11HpjZ2hLUNrZ8DXgejVsNU4m4PI7nl
         ZznvHznPI7xRnAeKKda0hS7TtG3KESuiutIrI2EzE7ZSDDm3btfkI9Nxf0TgDnEZAJMm
         fO8cMz6tDjTVBoET+AHvCQSvld2tNbjW0vZtlgRKSWjoweIaBKNc3LFmZzzEhJWSnFMw
         alF/gasGfS7Jb5QKElMxJHDgAFR2sZv1HKvI8C+wALUkgGBEWaplPrjJlGmtrks89V3f
         SAM4Hle0BgInfrQfDl5+VVX07LSp9Mm9tIeMyZpB593tkVSjxvujx/IgLV99Y+19675j
         gu1w==
X-Forwarded-Encrypted: i=1; AJvYcCVcjTEHuoFmOoh/ZyAtPvhGp03iI5mZw8RQVJoRp1zE/i62/ES2Y6tVahluFY3ys1Snd/7D4vMe0jQcphI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx17SHwiXwJvjCd3a/IOi+7gpRSy5HGxI3YVNhf3aXnOQQUV7as
	n+lcUxBdMR4JX+jt6LWlTqmHmqK1J3saaoYJ0ufhaAPSLjCxA51999cMS/N1wK+l8rnVxBdDlBH
	pRMywAkUVIMK4tjFQonV+F4LvYz9i9Auow2a1JoGHvK8co+/o9uQVuVqDC7cpHQ==
X-Received: by 2002:adf:b186:0:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-37ef13cd752mr1751575f8f.29.1729590592138;
        Tue, 22 Oct 2024 02:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIEHKao3U/XFI7bzq9Kj6t6RyZxy0cnLw5nrYDT+Cbr6tQg8AZS6TySYFQBcdNzKRVWndUxQ==
X-Received: by 2002:adf:b186:0:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-37ef13cd752mr1751544f8f.29.1729590591777;
        Tue, 22 Oct 2024 02:49:51 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bcc8sm6205364f8f.107.2024.10.22.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:49:51 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 84B08160B2CF; Tue, 22 Oct 2024 11:49:50 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Puranjay Mohan <puranjay@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>,
 bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, "David S.
 Miller" <davem@davemloft.net>, Eduard Zingerman <eddyz87@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>, Helge Deller
 <deller@gmx.de>, Jakub Kicinski <kuba@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, Martin KaFai Lau <martin.lau@linux.dev>,
 Mykola Lysenko <mykolal@fb.com>, netdev@vger.kernel.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Puranjay Mohan <puranjay12@gmail.com>,
 Puranjay Mohan <puranjay@kernel.org>, Shuah Khan <shuah@kernel.org>, Song
 Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Yonghong Song
 <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next 1/5] net: checksum: move from32to16() to
 generic header
In-Reply-To: <20241021122112.101513-2-puranjay@kernel.org>
References: <20241021122112.101513-1-puranjay@kernel.org>
 <20241021122112.101513-2-puranjay@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 22 Oct 2024 11:49:50 +0200
Message-ID: <877ca0ii0x.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Puranjay Mohan <puranjay@kernel.org> writes:

> from32to16() is used by lib/checksum.c and also by
> arch/parisc/lib/checksum.c. The next patch will use it in the
> bpf_csum_diff helper.
>
> Move from32to16() to the include/net/checksum.h as csum_from32to16() and
> remove other implementations.
>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>


