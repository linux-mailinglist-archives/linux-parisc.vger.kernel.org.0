Return-Path: <linux-parisc+bounces-4228-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB9BE5753
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Oct 2025 22:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB64519A7309
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Oct 2025 20:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C2B239E9B;
	Thu, 16 Oct 2025 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1O7csivf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C3F27464F
	for <linux-parisc@vger.kernel.org>; Thu, 16 Oct 2025 20:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647902; cv=none; b=OLGAP3dQnPza/D1SYFD0Ynk4s8PQheuCmkUpXRTBGSTi3MqmFzgrfyj+ZVodk4DFnbCmBUUAOi05c8+AyxMvaPjr8PD3ehyEsl+rRsApFnAet1QmWr8wug9INCub+Hj7EqaclvSnvxHM4XyaiXK89994ymJc2K3YnekWo1KZOjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647902; c=relaxed/simple;
	bh=GhHU4iPjORnVvj7EJwyv1YvPZ+2TaweSCXtFMjYeZ2M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=fX9/ofl2PdDZX2c5Z5kUG5MT9k1qt23l6v8LkPqP+6HrFj4vjbA/40Ri6g8oSnsBcvoAACsae3Z2IrZA7zLW7xDgmTZMqv+qfKraV3+n1IxqTE/TBulyR0wicu2lgzgsxRVic4cHWprfJ+1vC0PtC2sssQ4Y8Jupf2e6IZ21Iec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1O7csivf; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-28c58e009d1so22239315ad.3
        for <linux-parisc@vger.kernel.org>; Thu, 16 Oct 2025 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760647900; x=1761252700; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6nZbTmQDZxpmi+1ka7zwVrmO7uBI2OvTRVg33KzmXjQ=;
        b=1O7csivfcABSyWq236e4wxWge/haoITTgWYP/x6xeQXQ95wN7B8PnYx9TdQt8W7Eg4
         rFD42D7LF+tU7HSUjxSNnD34rBkaRHx89WrdxweN5yijFhaaI/5lXMxw5h/44h16UtED
         iJmIEopRPNmpxNs49JAvVurT46i38xffbE/L6+Qn1S7Ahz7cpzdXARdofqiJPHBjyrEK
         RgPS8y9z3MO52LKjy4nMlkfkH2kTvkgNUKUw9pT2Hs6FudAoqq3W36/KJeQV2ZFWOGmv
         QkI6ZlJQPqrXxljQWbdKqBHLG2gO41lSsvUKD7rXf515JVvDblypDoYWqistelwhW+U7
         zgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647900; x=1761252700;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nZbTmQDZxpmi+1ka7zwVrmO7uBI2OvTRVg33KzmXjQ=;
        b=OPgKXLnUN7PQx/6WD8TEdgcK6YpQDMoHXRai4FGmlZXtL2LzpTbMGmD+z46T/p2i52
         aDk3u8jDtvkER2Nan4i1HRiI1OqRlI5k6bzEdVppyAJ4kSoSJeDpzgWwOXaETnRDwhAl
         uXKpQus+RRx3dkiKw23Somb6n7BKkUiG7ZKUXYmOAZ5u6tNbvFadeZ33V02g1gEraPoX
         UWD4Xpqxl/7X9yBgH7RQQ2cqN0/2wIk/Y3F1xPZl0KsvhBSE7HJ95GQ7rv/VN8zmASu+
         7Kx57TTavEAcoGdxNWTBGzIKzQvdnqMFKpA/dQBh+58i3a9iUcfdYEbU5fWRMHc4DVLL
         j6mw==
X-Forwarded-Encrypted: i=1; AJvYcCVQC86bFYLta82qVPJfVALPQNmuhF/iMK4NIRA7Yo9YuU2hjS8QCLZEzsEqnPaChKp3il+TJgNboDO1lZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPhTNicvlNqjtWwJTKrs0gbEIJrbZIfW2U+dCw9F++BUGnGkO4
	3n2WuotaqKfTTttAX/VG0eER6j8LYyur6SGqpZpPb174HMT4eo5Hfj6cyJbn3vpLkpNv8oYywEC
	3pyL217+A6w==
X-Google-Smtp-Source: AGHT+IEHfOY72uJUvBCnJ5ENVW0fS20nzW/B9v5h4y7BfTJmI1t6+XwAYww7St/6smNRI0xBD99JxPcLvBGX
X-Received: from plpw9.prod.google.com ([2002:a17:902:9a89:b0:27d:1f18:78ab])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19cf:b0:27b:472e:3a22
 with SMTP id d9443c01a7336-290cc6da03emr14255865ad.56.1760647899791; Thu, 16
 Oct 2025 13:51:39 -0700 (PDT)
Date: Thu, 16 Oct 2025 13:51:22 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016205126.2882625-1-irogers@google.com>
Subject: [PATCH v5 0/4] Switch get/put unaligned to use memcpy
From: Ian Rogers <irogers@google.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

The existing type punning approach with packed structs requires
 -fno-strict-aliasing to be passed to the compiler for
correctness. This is true in the kernel tree but was not true in the
tools directory until this patch from Eric Biggers <ebiggers@google.com>:
https://lore.kernel.org/lkml/20250625202311.23244-2-ebiggers@kernel.org/

Requiring -fno-strict-aliasing seems unfortunate and so this patch
makes the unaligned code work via memcpy rather than type punning with
the packed attribute.

v5: add a patch to make parisc still use a punned version of
    get_unaligned_le32 for an unusual boot case they have. This is
    untested but suggested as necessary by:
    https://lore.kernel.org/lkml/202509051042.7KOze0fZ-lkp@intel.com/
    I wasn't clear if this work was picked up, but I don't see it in
    v6.18-rc1 and so I'm resending rebased as v5.

v4: switch the type/expression variable __get_unaligned_ctrl_type that
    is used by _Generic to be a pointer to avoid 0 vs NULL usage
    warnings - always use NULL and dereference the type. This should
    also hopefully address analysis bots complaints.

v3: switch to __unqual_scalar_typeof, reducing the code, and use an
    uninitialized variable rather than a cast of 0 to try to avoid a
    sparse warning about not using NULL. The code is trying to
    navigate a minefield of uninitialized and casting warnings,
    hopefully the best balance has been struck, but the code will fail
    for cases like:
    const void *val = get_unaligned((const void * const *)ptr);
    due to __unqual_scalar_typeof leaving the 2nd const of the cast in
    place. Thankfully no code does this - tested with an
    allyesconfig. Support would be achievable by using void* as a
    default case in __unqual_scalar_typeof, it just doesn't seem worth
    it for a fairly unusual const case.

v2: switch memcpy to __builtin_memcpy to avoid potential/disallowed
    memcpy calls in vdso caused by -fno-builtin. Reported by
    Christophe Leroy <christophe.leroy@csgroup.eu>:
    https://lore.kernel.org/lkml/c57de5bf-d55c-48c5-9dfa-e2fb844dafe9@csgroup.eu/

Ian Rogers (4):
  parisc: Inline a type punning version of get_unaligned_le32
  vdso: Switch get/put unaligned from packed struct to memcpy
  tools headers: Update the linux/unaligned.h copy with the kernel
    sources
  tools headers: Remove unneeded ignoring of warnings in unaligned.h

 arch/parisc/boot/compressed/misc.c   | 15 +++++++++-
 include/vdso/unaligned.h             | 41 ++++++++++++++++++++++++----
 tools/include/linux/compiler_types.h | 22 +++++++++++++++
 tools/include/linux/unaligned.h      |  4 ---
 tools/include/vdso/unaligned.h       | 41 ++++++++++++++++++++++++----
 5 files changed, 106 insertions(+), 17 deletions(-)

-- 
2.51.0.858.gf9c4a03a3a-goog


