Return-Path: <linux-parisc+bounces-2948-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF82B9DF396
	for <lists+linux-parisc@lfdr.de>; Sat, 30 Nov 2024 23:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73E59162B3D
	for <lists+linux-parisc@lfdr.de>; Sat, 30 Nov 2024 22:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BE2156F5E;
	Sat, 30 Nov 2024 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qm/nbqd1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561931531CB
	for <linux-parisc@vger.kernel.org>; Sat, 30 Nov 2024 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733007279; cv=none; b=XxvP4PqMcO7/qSf5mGcZTAvxL7oZ9IpPw7rbySbk4cSoK98JoXaWBmgUPKRKlyU29jFNNvRq/XjM5RWTuQuB3cPLs4NAAg0QMZDUjbIKg/RjVnaPLI3bTutw6/TgSwl23tue8NgAbwT7U/VOGFXNOTPGm5d46XoBLeVwm7H4l8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733007279; c=relaxed/simple;
	bh=bgvxSUrj/iF6zzluyI/8eakUHXjkFmPsvWgIAYTV64w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=b7ith3DNUwy1ihJdlVpwJLvSHsNsAoY1x0xR2gqZviOj9zT+fE84Rt2IvL4657XDCG8SCqWoUcBrZ5Pv0sJ3Q6RZL+XdJybGe1mpt8+4y3Sv9R3bND+bvOruH3mQERDBUtjfErVUw8MVh8g85JdufV92RWw+71S7MUmE08M/PaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qm/nbqd1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa55da18f89so465488866b.0
        for <linux-parisc@vger.kernel.org>; Sat, 30 Nov 2024 14:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733007276; x=1733612076; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AT31m8uexuHMeQI+aSBWPYCkCBrBLc/FcDOnt8Nw4/0=;
        b=Qm/nbqd18hEhpJtGFBbFklylTNxTso1t/AHEvNLprjs0CJ/RrMVzDtbZYXguqwcZVx
         uxPn7bj2FPS1DhKsJNgDAVrwgHD4OaRqn6gtmMsPSDeesAsfqo7Sm/iSoIudhUekkq5m
         UR3d5N5ZZY/kfprsHYMqd3HKVT4r10GGwQOe+1hXzJiW+Y0DtIIo1JuBQi81ZDQGT7dZ
         evb5WeojI3slsAARkK/pkYcmfb5PWm2HSd+26TiQ1aoROhjZvwll3eagicasSFQ4bFlw
         vVQsctDnygCPz0BspcfG3A3nd1pvZWNHylzNkWqVJjP/7QShJ2qYB/Z6xsTM2OOI/gMg
         TITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733007276; x=1733612076;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AT31m8uexuHMeQI+aSBWPYCkCBrBLc/FcDOnt8Nw4/0=;
        b=WyHbQSp1NpccVa+9fcMg+8R/rmfZQFmXSrUFRKDit/3Tu4K5TzLr6ai2UlTeou2We4
         K6+QT8yrjb9CIXRAq5H7EaTeEDt7QDNX/Kt64r7ukxUTEQCHT+pjME/uYI5mpWsKzupr
         4Jev7wF2TdyPhnGX8/eeRh0V/KYt68g2vOS4788vuTgrtmO4Ro5qoBL/PGBDFWkkHHFp
         Vm4qHfOoogdeNwxOxcKU/AXAB4BOnJ9BMbu4321AK/607mf0H4jam6CGc99CaPw+Fw59
         wvvtfhjx8Wwu+t1oEFUJL0FLV8Zd/OiVjCaNWwx3/r+NflBlH4UIAGDvaki5s1CRyTyu
         X89Q==
X-Gm-Message-State: AOJu0Yy7so6q70pZ3WEPTLPocEFeAiq2UiKYbeQzvxFYUm6jb8ocNVaW
	v8zKB+QIm5wq0jbygkFDw8tfpQ6uj3S0UDDnn/nObBvgdstzuCWlmIQ51NSe52oN0MMaV6TAnWV
	1/kBVw0Xic7HDpPUZVbO16WUxcSY/ve13
X-Gm-Gg: ASbGncsqEtG5PUTZplqYUxz5xPEkU1cAEOP4p6zh6cV1as+6s6vxXNyXuoe5zBL3ekM
	1gLPfMht+1j6Z9ivzud5mVbRvfWxGJgrWzv/2Z2oLzVaOa5yUQr3omWF5w7DbyPQQ
X-Google-Smtp-Source: AGHT+IH1/JNH7GjzqS16N8Ar1/VLV3jBLzF7zTehqXAUjLdKoCPRCsJEqcppgYNRG0KIlS87E1QrTdLrU1vucbcifAg=
X-Received: by 2002:a17:906:18a2:b0:aa5:79c5:7653 with SMTP id
 a640c23a62f3a-aa581028705mr1430187166b.47.1733007276486; Sat, 30 Nov 2024
 14:54:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54fbebcc-d4f5-40f3-8711-bac14dcd5397@bell.net>
 <a5b5e745-30b8-4a1d-b406-fc1d991dc775@gmx.de> <5468692c-df88-44ca-9f0c-f8d2e535bfa0@bell.net>
 <6d49b2eb-986e-4489-8f4e-878a4a24db2c@bell.net>
In-Reply-To: <6d49b2eb-986e-4489-8f4e-878a4a24db2c@bell.net>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Sat, 30 Nov 2024 23:54:25 +0100
Message-ID: <CAAZ8i81QnEYyEvWBNWeE0E=5xK9LDZD0FVkSuOGfQv9NFAwNbA@mail.gmail.com>
Subject: mm/slab.h "unknown type name 'u128'"
To: linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

hi
I am trying to compile recent >= kernel-6.12.*
with the toolchain hppa64-unknown-linux-gnu
+ binutils-v2.34.0
+ gcc-v9.3.0

The process stops with an error

In file included from mm/mempool.c:21:
mm/slab.h:25:9: error: unknown type name 'u128'
   25 | typedef u128 freelist_full_t;
      |         ^~~~

where "u128" should be defined?
Is my cc too old?

Let me know
D.

