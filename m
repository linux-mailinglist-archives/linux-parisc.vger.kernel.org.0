Return-Path: <linux-parisc+bounces-2585-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCA89951AC
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 16:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7675B1F225E4
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 14:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0EB1E049E;
	Tue,  8 Oct 2024 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SAwG0bBe"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C914F1DFE1C
	for <linux-parisc@vger.kernel.org>; Tue,  8 Oct 2024 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397538; cv=none; b=SrCNmeXin79/BH4F5eW7maSQDF21jS99FgdeWGjW/rrZoHUCzvo0YqAeCamKXGhfCCyUdPjvuDylIGPUif0jspDccNXYh6Uk9wxBUU74JtsMrmM9kj/dXjzC9CswnwzXRJHlbGw/7sH/ZCOPqWiW3Z+dZkVCVvpVrdc5tEZ7VtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397538; c=relaxed/simple;
	bh=KFyOI4kR/oCoxSqEZ5bt7UtRlDCHr0O31AoUd84Ktk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ia14jOe0Uy0zvHgNURxLMazvr3pQ9lSKT3KOKafFn4aoCOrMtAEizZGPU0DDRzcglYjm+rqBUSZnp6FbDVS/vEzqAjiYa+qgcB27AdSfrqDnm+VwIsT+0XvdCoFAaxyGEFmhavQs7OEbSUxnCV9poGet0qU9j9ur67IkuT6Q7I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SAwG0bBe; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so241026a12.0
        for <linux-parisc@vger.kernel.org>; Tue, 08 Oct 2024 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397535; x=1729002335; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFyOI4kR/oCoxSqEZ5bt7UtRlDCHr0O31AoUd84Ktk4=;
        b=SAwG0bBe2yEW8VmsW+fIR6St5zcux+fJQSFJGlHI9SENrqJwOxcx3tWEV5r83yKaJD
         TzHabYTjKa4lYWf16tvZEd1XcNRhlMfdDLKVQITLQUSChBsi9YVkQyzx7eV30SNt186j
         vw5ioO/yahiN6JAbnlSr4/CZ2yd+4+uwBI3VsEKpFqMdoYcXkizOefKkdT35yc1Y6wg6
         QUjtrr+7VpnIRJmsjbpQjAZo0O+8TkbQfJZ+CtR+krOI53Hd6GhiVKwXzyAD/GAo2B+d
         6hfWiaVgaveRRZ3Cof0MZBtdpJCkFtlrC5MeuYMB7VpMZZlmx4ajE12ZnqR6vYY7qwyy
         JizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397535; x=1729002335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFyOI4kR/oCoxSqEZ5bt7UtRlDCHr0O31AoUd84Ktk4=;
        b=CJ8hREuIL3RWz+ffo0kaVNCZ5xIIbKENe6kkAcUYFrDNXHkdVkSRPz9SQpZiuSq93n
         cnnKEpwq0vUCrlPKWe3yPrksjDKcCerVTCSFlVFhzE6d5l5DLvqW4bIRYfGDM3/yckkK
         ZvtHdrdgVzaDndhTat2NrgyIxruSUxF+HdXiMqMPT85qSllhxQCbYfGfUuhJu96MMDo6
         C9qdxVzp/vNR6/m60qB5bqIC8y8JIElGOqnsmBnzCSli1gVt3T3DMpV5FI04w2hSf9oh
         g7vVli9mkuAt1sef/VIo1m4Gyo3eye/ms0OE6crTXwO36jUtWhY3ToltpAToMpIEcVut
         cnoA==
X-Forwarded-Encrypted: i=1; AJvYcCWpVbkEkRcsBXZP1ldrQy634PRmFzJqBSIWYJ37Vi5XMk3okYP4f+3H9exUwQ04nFB4bwdzu2zg/ehgc/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpqezr0zPi49kInt+9F1/eJwbEhsbDtjZ6UnNqO+VR4AGvBXE
	hHY9G7n2t8iBf7/Rjga2RLvPCr25N/Y9rfeFignW6DjMhVxYkc0K3W18vZvNJoqQycnZRXLRG0b
	//+JW6QUoLDM1r+zsY38DQXcsQN30JObyhdgL7Q==
X-Google-Smtp-Source: AGHT+IH6vDRkL8posdyuwttmhFmsw/CjaMeEXHedCAmJUQDyqmuFFuzqUW413BB7Q7kpg2ghdilkoR5TzKy13fwkI/0=
X-Received: by 2002:a05:6402:5187:b0:5c5:cb7f:e56a with SMTP id
 4fb4d7f45d1cf-5c905cfc19emr3762017a12.1.1728397535021; Tue, 08 Oct 2024
 07:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-17-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:25:24 +0100
Message-ID: <CAFEAcA8aKThqSWLwCAEb3ec3QPtBowMfvgRn8TxN1C-kGcrdgA@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] target/arm: Pass MemOp to get_phys_addr_nogpc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr_gpc and
> get_phys_addr_with_space_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

