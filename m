Return-Path: <linux-parisc+bounces-2575-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B59309950FB
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69CDF1F2647C
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C361E1DED65;
	Tue,  8 Oct 2024 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Esm3IblS"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B874C97
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396305; cv=none; b=ob/eMuvkuyprwNcvzpjWNhwWArh3pPi/Oj66UrZefajR2Crw6Qdt/NmeQNtytTM7W+rjfqaiMIJLHoTyomZhxXB53fq+YDkKUF96LUeMsav0fo67NzJrBFvPfWhTkoBsayz0TDYJndj2xypHVBHf0SQm+aTj2l3M4GrnQq0YS4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396305; c=relaxed/simple;
	bh=aetDmH2NilGTvMf839NYi3b2dnOTF5pYiBjtZB77M6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEMrMGeaiRv/4ZuCUJuEq3r8lY9XjIkpCCIitAD0URImlE+/T+tcLdHGCZlhnQWjvJ31WFLN9EyCxHsw/I0fUKfLskn3JYa5K8kSE5/T7HdCvttxQufxvsRsUUBpjseVOZToEnQie79Mi/kmXVCXLXbCg3+MFeU9MT168aYt7Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Esm3IblS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c88e45f467so1923131a12.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396302; x=1729001102; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aetDmH2NilGTvMf839NYi3b2dnOTF5pYiBjtZB77M6M=;
        b=Esm3IblSD88JZwIYyYxXNA7KnD9lu2bupssWB3NcfJkLGZgOBP8QjSgH0zxEHXNv9a
         SKN6/DWCap20gytm2TYPGTjF1WxyQwvfKcWG9bMiQ8RGpy2FerAkOglNqssoeP2RFYfP
         vKGNTKOqZPjXt7gaMURTDR2X6BQlGXDjPiUgof8Lwruwb4sXsfct0/neUxcE70zXhOi3
         54xZ2Pzevhw82UsSu/wQf1w4LNunuhpkwjL1vZLCJj7+lo4HACdHTkQtXA1I013C2VvL
         /ONWdquRBvC0jIDsEpit/89g7a420ll3FGcpnQIwJ2YBJ1hWMh3UZAsptEwI37R9ecjv
         4lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396302; x=1729001102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aetDmH2NilGTvMf839NYi3b2dnOTF5pYiBjtZB77M6M=;
        b=cGOunK5s6+tJBXenxncLMGPxY+tiAtIddPbiCD89m4Rlfy1IkJ+LCzzgiuNJ0wa/LS
         //F4x3ljbO1WAYlhQA4BMXF0pl8YttuatSu/jsnrN08T7krx5koJptmI5t/L8USXPCGz
         nVcQ8hA5e6c8c+iQeG5QMpw7kzpXdVCBZki4Um8fwQTc9DnwSEVVLOfQWFpNs5KG8zmU
         zWjD3Ngjla5umprhJyU18Nm2oakDqb87X/pDO2PKNB64unUyHcQoRMJuDr6RVki9pc7y
         MpFPlh1KiTLG3qFqSmp44ZoKTuOJ94uMiyItEGKuqhB2S7mI7JkMkb36BYmv2NnLd1pV
         X4ew==
X-Forwarded-Encrypted: i=1; AJvYcCXZBf6OFDYVSjGFAelDWlmWIF8BVZV3nlBCkBQbmDdiM2n1k48zg3m4Jik3wPynqf6+HJcYkkSIxnktkPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0xZ5UdT5/GFPfW3HyqMPAiYC9ge4rUSmzL2hLwzgZ3bIcZiV
	fxk4w4glzjGkMSyQISmHCKJOXEQ5Shizqlz/U0T+WLvMTpw6Jz0eAoIosNbjm53JbE0+mOZAOWt
	pvCz0Al6f5II4IH2fDvaGkATlqQyNf0X8pt8MhQ==
X-Google-Smtp-Source: AGHT+IF6H3Lvl6/NmA82bxuWyc/gR8SMikRNZ7hPVFOE+nrj/em3ufiBwEctKYWf3rwHepOwHOxLcsK7Ag6vWLVesNE=
X-Received: by 2002:a05:6402:4307:b0:5c9:3f1:e5cd with SMTP id
 4fb4d7f45d1cf-5c905c7a8famr3615578a12.0.1728396302336; Tue, 08 Oct 2024
 07:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-4-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:04:51 +0100
Message-ID: <CAFEAcA8L9djaHeeEShySGa0LKt-qDovgBxvFMDTOF_+=J7+u3w@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] include/exec/memop: Move get_alignment_bits from tcg.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is specific to MemOp, not TCG in general.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

