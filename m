Return-Path: <linux-parisc+bounces-3709-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA6AEC1E6
	for <lists+linux-parisc@lfdr.de>; Fri, 27 Jun 2025 23:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BF1D7A70CB
	for <lists+linux-parisc@lfdr.de>; Fri, 27 Jun 2025 21:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B4A26E70F;
	Fri, 27 Jun 2025 21:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fz5EEKVV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2532326E6E5
	for <linux-parisc@vger.kernel.org>; Fri, 27 Jun 2025 21:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059348; cv=none; b=E8Pnfey9SZblMUoU/77kRet+dzdbi5blPSO4EOYibeEoHEC3B5qI1hiRMYjgui44oQbSj0gQ0ab+dEn4jWPbFgJO7cmW+rnanYTcQ69geA1LYjGK7+EmzIowBmw2X+Le7fnQ5kBT+D8wKvPkoPmDWLOMrD/90aWSEL9w3/Z8TSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059348; c=relaxed/simple;
	bh=FpEEvNVIhLp2ILPd2Y9pVbYSEco+BRWJyKFH3Fltmt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fif7kVpQ2uWWoHYWDNqTjK0TyzHCG/HMnrU6cS3weoampeGcGtQWtdLguUnnhd/ndmVP0vWzAotfdtghPaFUe/u3t4taLv5Hhn9zkYY65YRmoajDxkorHe2f084lVgwAQkeSaSCikPZ8BYhzJpRPsg/xjQKTc+33iM+JcjBHN3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fz5EEKVV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so536987a12.0
        for <linux-parisc@vger.kernel.org>; Fri, 27 Jun 2025 14:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751059345; x=1751664145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FpEEvNVIhLp2ILPd2Y9pVbYSEco+BRWJyKFH3Fltmt0=;
        b=fz5EEKVVNxB5lwcHiLfKRlpynr7i5Q9QMX5e+JkEKZPeLi61BpfAcnlpooP7bnNBUq
         BCrzt5RQI8jyO37O1t5AMp1UjzoD5dR+udv061Vo8nuiJH0mjyFHEMAFyQvan5uhfzsH
         YtZiGXGl+Yoh3k6auGAr0nu4REJ7y3YXx0an6tV5JF9T6FEaDpD9SVzaO9OV113UpbRF
         eLktHntd/H4uc9gWdGvFLUmxKDKL/CubtuTp+dE6ruRxObwejG5KaYIuVdiWiGnfljul
         qEjhAECStheMxIx9N8X0WVWwWzQFBdrUCFRbOp3/jacBV9uTQgv8+CdvEUel+p1EKXTt
         NU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751059345; x=1751664145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpEEvNVIhLp2ILPd2Y9pVbYSEco+BRWJyKFH3Fltmt0=;
        b=jBf9wOKEbpAqfSSl4gY/+L8GgloDSErV7HhR1JX2woRrXXt68UNV9MChFfeQtm3jDR
         rc2unREailEOMh0t1GDEn0o55bs8+3pzPjkEAMqNcvRzmyLxNVRDs5ptR6YKSvinfis4
         HdwXvZWZOI6TB4cYZUMktubUq574go1VEi+j93ygsE5REf3ilnw0jQX4U7lbq3W3ang0
         UxiQ6TruK0r16KB7ljOTcYVOmnxPZ5hneh0h7IFEH81SN1TGz/UH2iUs3htRQw0ppOjt
         gFT7T65M+6WXH0HpmIRHFM/bXD++70irkjS3a4cxzWBEfbr0tlvba+vqOeguCoijDTII
         cZGw==
X-Forwarded-Encrypted: i=1; AJvYcCVWqD4hHaJ5YZTRT50yDg8poRm1C04W17/H6RvEnBxi8png2gi7EEaql0aH7pSdV0qw4UZuyA823OU/KlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYJ8TpUpFD0V9iCeIwURIvNhu6xNHO+V0MVLqepKEeT+Vi6LL
	tHsxVLzg/Q7kOX1DmA4gN/hsb1fEPy38PkKQafGHqw4hcR351C9hxSPbyNxCiiDt2Tw=
X-Gm-Gg: ASbGnctwBuUv9o+GHAXwiXLVaToy0ixJSsK8sLvV8BFVS33ByfOBHvqfWJcH8JIYmpH
	Tiv6yDGmaTA1e5BDflBR+/IeBjdcXOc4OSu3KXArAva1esXfV8pAoy4LNJevYvD25ohAFIKgsYW
	Jfs23c/8WSSNBw8luYwoXKiAUGliIf341C1bCg0SDMDmcTQk2wufz3WGlZh6IRmHdKnbwUwS9tZ
	2EZvc+N0itD/KmM74lEVbCcZB/opexaL5pHEPeyTiFBCbJqPI0U1lhpaodDkEDdX9cBu9W3siRP
	yP2bfyQIuxhhYAEliAdchHjzXAjrmHK0I159pBDRiUl+ORUcG9cRXB48zmmeiAWO6DA=
X-Google-Smtp-Source: AGHT+IEhRpi1a+ylgSTtqA9H2w9J4GcdjNSwWATiDChYYeonPQQWN1MyDJAiPdTm3iTzCwA2upy5aw==
X-Received: by 2002:a17:907:c881:b0:ae3:6659:180b with SMTP id a640c23a62f3a-ae3665919f1mr212348166b.29.1751059345430;
        Fri, 27 Jun 2025 14:22:25 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae353659e06sm188421166b.44.2025.06.27.14.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 14:22:24 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:22:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH] net: tulip: Rename PCI driver struct to end in _driver
Message-ID: <23bh2e4lsts7wf7sjk5mgpwuzny3vzr7dau6aetgmhzcqnivr6@adsr6srfeyz5>
References: <20250627102220.1937649-2-u.kleine-koenig@baylibre.com>
 <20250627194826.GF1776@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gil6ck3d4nu3jnup"
Content-Disposition: inline
In-Reply-To: <20250627194826.GF1776@horms.kernel.org>


--gil6ck3d4nu3jnup
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] net: tulip: Rename PCI driver struct to end in _driver
MIME-Version: 1.0

On Fri, Jun 27, 2025 at 08:48:26PM +0100, Simon Horman wrote:
> On Fri, Jun 27, 2025 at 12:22:20PM +0200, Uwe Kleine-K=F6nig wrote:
> > This is not only a cosmetic change because the section mismatch checks
> > also depend on the name and for drivers the checks are stricter than for
> > ops.
> >=20
> > However xircom_driver also passes the stricter checks just fine, so no
> > further changes needed.
> >=20
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> As per my comment on a similar patch for a different driver:
>=20
> From a Networking subsystem point of view
> this feels more like an enhancement than a bug fix.
> Can we drop the Fixes tag?

For completeness: Here the same applies as for said other patch: IMHO
the Fixes: line is right, but I agree that we don't need a backport to
stable and I'm ok with dropping the line.

Best regards
Uwe

--gil6ck3d4nu3jnup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhfC4wACgkQj4D7WH0S
/k6ZzggAjq2dQhojPlg8/z7CcgJGZywQFo9AMXtN/M0eaOe2KhKCKRpB5lAWTzj5
2fSN+odHViavpPHqSviQRdzRHnC7oa2POUgA5zIVrimVT+hE/c8GsZ+D9rQKOBwN
rY5ixevncpuhVabyB4TIR2pjcJpQbMv+wRuR9LUGL+T+71097TM7itKLGZZU3++D
wlTA0FZ98ikuMVzR5fjgMscl05WS8n+6ALAueql9ppx8sqA9Fz3kh+8HCt3XnZPk
nTjws/Ujx6uAaDhDOP/cVXDNF0Dib5rw5TEdqu/aQ9iE3S2wTUhROJXgNApqmWVY
oIEpp8SzDEnZbnO/vZNRYygkoi+b6g==
=/LwN
-----END PGP SIGNATURE-----

--gil6ck3d4nu3jnup--

