Return-Path: <linux-parisc+bounces-434-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5383BC2E
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jan 2024 09:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4744B28BCD7
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jan 2024 08:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FDB1B948;
	Thu, 25 Jan 2024 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JuvXD19/"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9810313AC4
	for <linux-parisc@vger.kernel.org>; Thu, 25 Jan 2024 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706172072; cv=none; b=jF7e5dkVeKcXbOFn54CCBB+9FDATjFxAYJqiegk9X7owEVHk1IvvXebsG3mgZwcJLPEDoVMKAYDGryJ5+c9sCNZR9YbYpfRE4ujuputXzQL2Xvk0aupFhJTf/k9CXRR7gLfwEAzkwEOrvyzl5s1Rz5twv7SI5wRW+jg3wZ81UeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706172072; c=relaxed/simple;
	bh=uaw2OQxOj/iJ0FDVCczkm669hzJBFI58+e9xoVccMms=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TLSL3SnXpSCQNRsec56j4ZKlcJu2CInNGCseEontaQufgYTuuBeJnK3+ujJy5O6udTDEYmp6iafvhzQdCESBAWjgOngjKG/1kzVe/6HaMNf9z0VVl8DG0T56HfFVoFok+bTaPjGrSeh1eY5gRchHtcDQWTAjRyU7532uBvpX59o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JuvXD19/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706172069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uaw2OQxOj/iJ0FDVCczkm669hzJBFI58+e9xoVccMms=;
	b=JuvXD19/IzER7z2WT7ZySt0KmFha5XKjHOLWJDw4H2bvSgJJrA1XgIovkedMtkC/GkEKud
	jv8lmp+y1fG8CrFrzI6QqyYAudHSVcHBODNy1eUtgH3MxQ4Z0AJ9UbPJc8g+GYDgur/gJ5
	htDYegcsRxbbYwBgH0UhW43/Piz8Jwg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-lTrGm5mBPReM43ciNS0T5g-1; Thu, 25 Jan 2024 03:41:07 -0500
X-MC-Unique: lTrGm5mBPReM43ciNS0T5g-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3393b54f33aso77516f8f.1
        for <linux-parisc@vger.kernel.org>; Thu, 25 Jan 2024 00:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706172066; x=1706776866;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uaw2OQxOj/iJ0FDVCczkm669hzJBFI58+e9xoVccMms=;
        b=uJ3MhFLIhpaV5i1xIfeWWvmBq5UNjOib9DCjVLKUDD31Rmx548QeEZM6ztjrF+qqQi
         FzGzgMSRe0anpk2NYPJwOVTkHqk00oypw+a25V+OtF3XTaH/UTIfl0oYhPugYrf91QRy
         TC7ppYACwUM9gtxqWrMHYtICj//ZFQ4q9oszdmrv4oZALmwBlekWw94Czwcz1LAQgYzD
         8Cg2YxmfR4aokbmi7pUU9rbzqb5vZBHBrwkxP3E2UQX9H1bVZnKFHArNu0FqSn1fWxQP
         Okku7J8xR/zUHn5YbSnLFcg/6Qhgxmt9qvPMDsDxXpB4jC+2CSArr/BjXXW+m0UH8gPZ
         yU0A==
X-Forwarded-Encrypted: i=0; AJvYcCXUELzHgvFr+LbbZSIQCV17nEnbygNiaPRVIZYOUoMhBb9r1WpxHP/CN+M9KfAZYGyKkXXLfdpqgA6YJSRDjARt5uNV9UPOp92y8340
X-Gm-Message-State: AOJu0Yy4YR5NrzHMDAga5r53DkQJ06iU+/lsyZW76+yj+Zbid1Znkl/n
	aWJDLIEx0WlS1IELyBooitNaz2Xe3EsEJ/Iik2zkUnTlKzuABDYgGs0HDPFqnvMEwbsBfkA4bxs
	lknn0nnSa/0gZ+lxDCoiRFppQ1KfEHzW2ECIWSihBE/2B3u6rt8eYf9lrl4tbhg==
X-Received: by 2002:adf:a1dd:0:b0:337:cf8c:af59 with SMTP id v29-20020adfa1dd000000b00337cf8caf59mr661353wrv.1.1706172066735;
        Thu, 25 Jan 2024 00:41:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5Lvs9xGjT0kLSYRJQCsGyMbe8bbhQ21hw/TvaKxqphBRKbqtzBf+YXCVVrIXGF/wap9IkmQ==
X-Received: by 2002:adf:a1dd:0:b0:337:cf8c:af59 with SMTP id v29-20020adfa1dd000000b00337cf8caf59mr661340wrv.1.1706172066350;
        Thu, 25 Jan 2024 00:41:06 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-244-75.dyn.eolo.it. [146.241.244.75])
        by smtp.gmail.com with ESMTPSA id d21-20020adfa355000000b003392a486758sm12793418wrb.99.2024.01.25.00.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 00:41:05 -0800 (PST)
Message-ID: <b2d71d3d01211af31e706acf386904760bae8301.camel@redhat.com>
Subject: Re: [PATCH] ipv6: Ensure natural alignment of const ipv6 loopback
 and router addresses
From: Paolo Abeni <pabeni@redhat.com>
To: Helge Deller <deller@kernel.org>, "David S. Miller"
 <davem@davemloft.net>,  netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-parisc@vger.kernel.org
Date: Thu, 25 Jan 2024 09:41:04 +0100
In-Reply-To: <Za7dsxCjItn-dlfy@p100>
References: <Za7dsxCjItn-dlfy@p100>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-01-22 at 22:27 +0100, Helge Deller wrote:
> On a parisc64 kernel I notice sometimes this kernel warning:
> Kernel unaligned access to 0x40ff8814 at ndisc_send_skb+0xc0/0x4d8
>=20
> The address 0x40ff8814 points to the in6addr_linklocal_allrouters
> variable and the warning simply means that some ipv6 function tries to
> read a 64-bit word directly from the not-64-bit aligned
> in6addr_linklocal_allrouters variable.
>=20
> The patch below ensures that those ipv6 loopback and router addresses
> always will be naturally aligned and as such prevents unaligned accesses
> for all architectures.
>=20
> Signed-off-by: Helge Deller <deller@gmx.de>

The patch LGTM, but the above looks like material for the 'net' tree,
would you mind sending a v2 including a relevant fixes tag, the target
tree in the subject prefix and possibly the stacktrace you observe?

Feel free to include my acked-by tag in v2.

Thanks,

Paolo


