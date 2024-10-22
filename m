Return-Path: <linux-parisc+bounces-2831-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3106C9A9F4B
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Oct 2024 11:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA6631F21226
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Oct 2024 09:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D1C199FD7;
	Tue, 22 Oct 2024 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TbLJuePj"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1136199E9F
	for <linux-parisc@vger.kernel.org>; Tue, 22 Oct 2024 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590939; cv=none; b=TYUgpVR0+l7JfiCJ1Sz2qS4mOZaDXD/FiRwA9et/gsb25/Z5JOGPhSWPwXi/ToJ1FkF7l7VqbFd1asdHCjwtnNZKP59E8sT5CxmGsB6ThnD1aAMljSpJWx0hC0k1NcGwNJejeCM//VUKmCwjxzASp30PePOJ2RZLbguxLXX4WNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590939; c=relaxed/simple;
	bh=ib0DWrahXU+UyLhjJUyjqhEX8gbxfkcMrsQFOh4hUoo=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TJWoPauA+O3nhXW0ymEv/FXghPD1NpN1kEn8IDTkvM1CUxD48dm7B7QlEIHwh7jBQtRLqFCRLleBH7iasqHhUK8OgmlfOy75JKsLeH8KIWfQimLuDqniWyaWQOWyYWypKvN2CJD9OGEuwoAjS7tVqRVs7bF+Uimvmza2JljLkkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TbLJuePj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729590936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ib0DWrahXU+UyLhjJUyjqhEX8gbxfkcMrsQFOh4hUoo=;
	b=TbLJuePjYlu20NEG+69gzGvscslMzPN/6tyM1tpgytys6/l3m2GIOhqF6wvZDhuTSuNl99
	A+klR4f1Zszh9NCHA29dYGXuZNJg1vOdxPi3VtzuFMHKoOyYdFHWRYZngnd6uyq7V+gGUY
	GqCJGTlZ4l887MVtefdL407xn9ecyvw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-dHteC3rPPzyrfl2XUDxFig-1; Tue, 22 Oct 2024 05:55:34 -0400
X-MC-Unique: dHteC3rPPzyrfl2XUDxFig-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4316ac69e6dso23040085e9.0
        for <linux-parisc@vger.kernel.org>; Tue, 22 Oct 2024 02:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590933; x=1730195733;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ib0DWrahXU+UyLhjJUyjqhEX8gbxfkcMrsQFOh4hUoo=;
        b=jCXcDv4sw535TcHx8k2mCNK8D/VgR6x/Xo773oTl0EMpVJlWXp9R1MBa5EqgJK0sFe
         qAX13hGN9lUcE9XABHwlV2fP9a0oMO3cwnPLLawAp5TvTvjZoIKNUhlGCeehnggk1y7K
         Hky4Y/eCiAAZ7R/BOnUPQsvO3ufkPZM4hEkebG/bte0m92snnVC1XNfWqEspY3XJYJ+3
         04fNCT1t51rrVPQN+8wYxaI6byEqB/5ThUXZWk143r0PxqY3pZVwkROf9vzavehHmWsP
         biMibzxPUZAYzCA8+Rn+q2WbiV2+17aWbYWHHxYoEwJifGGiTMz0tX0/bJ3nC/JvRr6y
         AjNA==
X-Forwarded-Encrypted: i=1; AJvYcCUQitX6zmfFEtOkseNwnE9eLTcEnD6p+GlIw6ubkbHp/Fh9CRSzQZ6wHK7m43zLL3Z1mtUZGbk6lhYVIoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynmvu7kVPNnxtoKDEqWzB9mpAhmeubdTDdQXRs4FRYudfkYx8Z
	j0Ir5vovYOHeV1jTFPDr1/hck7blcLfYwyUCd2ch3GwEMpATb5EkKZA1t+54f4ByTAfg03N60qf
	fuYQcQ6tjjBAMEDzWmdhYrcx64iE7WdqKY/5hvA151s/ghr9vpgetxmZl+peatQ==
X-Received: by 2002:a05:600c:5124:b0:431:40ca:ce44 with SMTP id 5b1f17b1804b1-43161691682mr122114255e9.30.1729590933373;
        Tue, 22 Oct 2024 02:55:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgyq6n+8jcts2tjTo5SADW9rqMjfT6xN3E7y9DOoeJqaiyEJ0e6Yke+AVbsNQve6hNbgctXw==
X-Received: by 2002:a05:600c:5124:b0:431:40ca:ce44 with SMTP id 5b1f17b1804b1-43161691682mr122113835e9.30.1729590932884;
        Tue, 22 Oct 2024 02:55:32 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b93ea6sm6296161f8f.84.2024.10.22.02.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:55:32 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id DAE67160B2D3; Tue, 22 Oct 2024 11:55:31 +0200 (CEST)
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
Subject: Re: [PATCH bpf-next 3/5] selftests/bpf: don't mask result of
 bpf_csum_diff() in test_verifier
In-Reply-To: <20241021122112.101513-4-puranjay@kernel.org>
References: <20241021122112.101513-1-puranjay@kernel.org>
 <20241021122112.101513-4-puranjay@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 22 Oct 2024 11:55:31 +0200
Message-ID: <871q08ihrg.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Puranjay Mohan <puranjay@kernel.org> writes:

> The bpf_csum_diff() helper has been fixed to return a 16-bit value for
> all archs, so now we don't need to mask the result.
>
> This commit is basically reverting the below:
>
> commit 6185266c5a85 ("selftests/bpf: Mask bpf_csum_diff() return value
> to 16 bits in test_verifier")
>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>


