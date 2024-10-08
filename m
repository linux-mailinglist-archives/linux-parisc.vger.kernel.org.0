Return-Path: <linux-parisc+bounces-2577-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA36995102
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9AEF28288E
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDE01DED7A;
	Tue,  8 Oct 2024 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cx73qknw"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F774C97
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396333; cv=none; b=SUKh2xghyjGuQplepvhxIbxP68tBcmPe3XI7oAOkCLzzearvp5LkPCjS3D+1AUudK2UACOX88ru+ThEbIsn4oTaPFioMbnco3yDsbGUg6N9+jy5FJ+FoHxvWxfDxkqe9tbVLTDa5eP0tgxk1rzMyaxaQxeWfwobretNMFEYR7t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396333; c=relaxed/simple;
	bh=2l3ZDx6KfEzG9FBRNLYNkBYdxJ2VQK7XfM57EJm+wcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnfPCP26S4YsN/HbFZm1Trf/QwMqKlo9NlhOFTA65DQkPqDRkHZC+ZUAJYBO10raAAPU16FA/PN/uyLbaqUYJv503m5fPr1wAeqL6+wOkz6XkPa59vZ9o6WHI7ARd/ReuKmyo1K3uBZQo9LCC8eVjfZjtsxPzx2kbGD1TnokPkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cx73qknw; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fac60ab585so59724251fa.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396329; x=1729001129; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2l3ZDx6KfEzG9FBRNLYNkBYdxJ2VQK7XfM57EJm+wcg=;
        b=cx73qknwVUPYy9IcGGxPujSN0CjBqP0pTuqg0dJtfktlNwTU5q+MGmhZ9b/m7B6LYx
         bIk7IqLE1JwYDrv0quBHmp5hP/1eXbcNgyHLUOinaUKWXnVyVXOGW21G6Epr2wXVCBCV
         2g8qNoGhQNy3I6OHqgkehwLhFbOeO9FUC79rqtW5hs/rMuIyiUB3KOF/6fH9Me0Fx/mK
         An9GuOcITK5lGjigevUoQ5LzeFjvroA5OOEYgZOjSBhfCR1krDzVttWRVMgzxWYxu3NP
         XF70rs0aRU3l7rVDgBWpRVC9iwcWCh6MdLzc3wZ1Hwr6p2iFBZgq3eBBVqa9+tXtSmv3
         y+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396329; x=1729001129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2l3ZDx6KfEzG9FBRNLYNkBYdxJ2VQK7XfM57EJm+wcg=;
        b=r8qUZon7UEbPBu/ZFRo768cgymCJX4kKdo89NGNzfy1S//+xawe+4ezN9nyVvgDc7e
         WDInR42hQ+Ngu7G3qy+fw0+cr1oy5rLIGPgs8s3+kgae/5qAEPOI/SfOpQDHuxgo8Tfs
         NSdRDMFdQx32XaR/OI8qrckHUq0QlYlyhsQPdc1/IGo9u2LpjmqYvqdOAT5PHmdwS75W
         2EQG7htj+Td/vGEVlR5B0nbLCNFLR0fSp8yuCuFDmGgcrilYWs6Zbd3snlDu1hcVaggr
         xaschFfu3i5KdV/VStt+WP9e9T42lIgjnDakK9yThUb7THfNsGDMmqKsBa41BdUkUxiw
         BCjw==
X-Forwarded-Encrypted: i=1; AJvYcCVX+V39ZIFhYzRKzIKecPMh9wdN8nfUa19DtToLdFSfPJCAre6lPf1lBIHxH9U+ahpuxMX1CZsZAP1hvkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqwvNOPaTLS4/fOREBGNMHu3hVQ33gXBi0qiRsOgQS6Wz8706t
	fs1dqa+gCBvafPemCYZMaluq1gsdJBEtWpNO+ecvEH1j0PLOzk9EkiS0iLmwz3X6s0vJm2DXFpg
	1+csNEga56N+66u5MgYnlDzBm+zR0lIPEbXJ3xA==
X-Google-Smtp-Source: AGHT+IHBZUuuXGIdrsRP+B4qX5P0Sr0NlGymNkJEVP1ALv2MaP/eBYA9REXK0nzhHDZeS8C0X8vz1WSBjTAJppTqxcI=
X-Received: by 2002:a05:651c:19a0:b0:2fa:c49b:d14f with SMTP id
 38308e7fff4ca-2faf3c509a5mr79361221fa.2.1728396329406; Tue, 08 Oct 2024
 07:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-6-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:05:18 +0100
Message-ID: <CAFEAcA9V5-hbQm6iDP80cH9LQi3zcCp4kHZDp4MG2y25SP_PZw@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] include/exec/memop: Introduce memop_atomicity_bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out of mmu_lookup.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

