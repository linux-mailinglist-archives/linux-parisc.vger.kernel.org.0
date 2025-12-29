Return-Path: <linux-parisc+bounces-4398-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D248CE673B
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Dec 2025 12:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDE6630112CF
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Dec 2025 11:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B2B2E7F29;
	Mon, 29 Dec 2025 11:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hv5d9f+u"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yx1-f68.google.com (mail-yx1-f68.google.com [74.125.224.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449603A1E6B
	for <linux-parisc@vger.kernel.org>; Mon, 29 Dec 2025 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006383; cv=none; b=Gei7hXp1bp2nwSvfbNVxRkoqHR6a16uh9SlO6nUcsWr7PzqcPIf2jL40lsUPBjoBF9Hgq3n8VvF41C6Y+TfuOPYoQJ+aleZ5a59TFZXjgstzj0amWqAD5MbuBV4q3R2Q8QucY2QTKeSjP1fxNBS27CDkfVkQfBLZlTguCJTTDls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006383; c=relaxed/simple;
	bh=0dQ/R9FgC/lreN0H8Evtv4q4teLsqf2wv7b9fDw/ZDc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=popl+GNMs88H6vGnB1yQWZRBZXvsq1HMa6KITWu2LTaWHLKA4i909dcncJYRSvr2EhdmTVIpmj4WWjWsdfe+9g1zzm8asdy3OjRTO6uT/Iim/n6Kyl2Dv3sfUYC6NrR2foZLjrK43AqdCnv8a2QDfAYn7NYCOdi3lkw+ADZ5fAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hv5d9f+u; arc=none smtp.client-ip=74.125.224.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f68.google.com with SMTP id 956f58d0204a3-640e065991dso7374015d50.3
        for <linux-parisc@vger.kernel.org>; Mon, 29 Dec 2025 03:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767006380; x=1767611180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0dQ/R9FgC/lreN0H8Evtv4q4teLsqf2wv7b9fDw/ZDc=;
        b=hv5d9f+uc/A0SAes5XKvmqHsX+vgmxWfy+h3YgI2iMm37s5t+N35bAVGYLqipN2PiR
         mfBGmxe2+aSwjFTrNb9qFT9CL4qWeY0hQzaY4HhfwRz5xye8pkaTPBGTfv4pCPYVorPA
         my74uNrcC7xBtLolES8ISZjgCmJg6NdeHsNUq1lKHsmMUqtDl2Pwywko8BrfQOBadogt
         mqOK0JAb/xcpi2qr2mqYTWyp4LMWWdy9EMNVto4fPEDp8WKVGhy4IhSuzr5N7XYfd1vp
         hY+H7EU37CAHNaEbqJ0M7wEwG2mQQdOKfgFuuEfLZAl8Nl4CL3pcygkTRXcf4Ib1yDKo
         WuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006380; x=1767611180;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dQ/R9FgC/lreN0H8Evtv4q4teLsqf2wv7b9fDw/ZDc=;
        b=DHjObMrlIgtjFBq6FFAJ5QFAISehe3GNIjwHyVQ+tKkkVkmu0zUFRXVSq5FNHQ6Zvn
         gzlnVP30zvWWrXoMBkXXu7ZYQ9bLct4z1akVOnRpGMt2QeanwvfYrX4Le/iahaQNm8Wa
         TP0Pw2GlaYKqK0Bxr0cz6e9TTvd+rgIZXH+GkfMJgqOjQpfy6IFW0fzGh7Q+2zxjIu0P
         yKkaacc+qZPcc5zsrFwZIQWlkuQhgl/dQ+W5/2DTV4EZ3As9k1UmsCKHgpo12OkSQt5+
         d4Gi+gFbkYe5amSoIDwKr1qOaIzo/TOs0zSRJuX9/gurwehgQg+WEirSDivYyhl5FGpt
         UY3Q==
X-Gm-Message-State: AOJu0YyqmnPi4b3WdRmKRvCv7IGhWyhmsND5+TIcy/zWlauW6t999sFC
	tqSRculKYq5hpi2fVlvWQmlRoVffvUkNtlfXno7J0ZV0DuHrpsbKBIIOn2yB7OEI
X-Gm-Gg: AY/fxX7Zjl8isXvWK+ArDVakMCQcVjkzC67eEeiFsz/27eHfa65D/JlHfZbe8GhPPm0
	RDN4QjX1PVaTYMw4RvSwi7jLlGwaRVUzHkejn59KyC+l0trPxLfjoZeus8Sw7Lv8LrtPZC6j/ar
	RyyLL8GX0gLUE1eKrVMACZhyyDpr8ZKXMkVxevKplrWAKf1xaSqsdvgoy9yR2+jWPsCch+3e8Zw
	qVq+82MoCRv2FjqX86kmJyivvKPfMO4zlhTZlYgNHRQMwH/NcjUUrqRCw306HxgmTmME4R6vgby
	nvM2oWxUMrUIUe0/FTnTmqhLc6hecaz4jI/XNdsK6EQLHlSsPhP6wm9ap/5Ii5Qy78LlicoNbn4
	pV4ZmCMYnPXh4Lfrwwp/lPvrLrlCxoMOGZ+33Gk9FaUSwtIJ1QMsYeiif8Zdm7t5nSBXkkdCuNj
	EI/0B92KJ0g9YFpA1+XO375w==
X-Google-Smtp-Source: AGHT+IG/kV4rE7Um0CwLJxkCsuvMl34AxwoHydp0mdiexWulguVTxnzVXTemwwUFrfaSeHfW2RAoEw==
X-Received: by 2002:a53:e007:0:b0:644:4eec:222 with SMTP id 956f58d0204a3-6466a8d0c64mr18330082d50.85.1767006379859;
        Mon, 29 Dec 2025 03:06:19 -0800 (PST)
Received: from glenmorangie (dhcp-67-147-84-4.gobrightspeed.net. [67.147.84.4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a81d4e4sm14700528d50.0.2025.12.29.03.06.19
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:06:19 -0800 (PST)
Date: Mon, 29 Dec 2025 06:06:13 -0500
From: Michael <macallan1888@gmail.com>
To: linux-parisc@vger.kernel.org
Subject: HP NGLE documentation
Message-ID: <20251229060048.141359d4@glenmorangie>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; powerpc--netbsd)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I finally figured out enough about HCRX and PCI Visualize EG to write
my own manual. It's a work in progress but I think it's at a point
where it can be useful. Not exactly for beginners but anyone with some
experience programming graphics hardware should have no trouble with it.
For now it's here:
https://cvsweb.netbsd.org/bsdweb.cgi/src/sys/arch/hppa/doc/

and a de-obfuscated header describing the registers lives here:
https://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/ic/nglereg.h

have fun
Michael

