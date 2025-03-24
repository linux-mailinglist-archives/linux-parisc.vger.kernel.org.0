Return-Path: <linux-parisc+bounces-3485-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27941A6D55A
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Mar 2025 08:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92EAC3A7CD9
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Mar 2025 07:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD172571D9;
	Mon, 24 Mar 2025 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jn23FPAy"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEAC25742D
	for <linux-parisc@vger.kernel.org>; Mon, 24 Mar 2025 07:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802161; cv=none; b=qx7aoMhzpDpJHP3WhiHJcVFilqqwhoDrO9fES3XbJCM5O1z6IoVAuu5vdlDNPhthLIl2WmnwBglsM0k/7lRV+mj0W9s1JQBJe9hd7kB7ShamkEwjAxnvFc3MLpSppU5Lu8hhqDr8S8EgMpHgTp8RPJ+o6AkbqoYI1GnsOyRdwKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802161; c=relaxed/simple;
	bh=nPjFw42nWYI2qOoFSaiSkfs/KiLKvsGF0sxhO9j9fw4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PC8o1aL2O4YFW/8IhrE47LhzsbzuQh2SpSJsNSYtqDBcTXSh//0mPETD1nOyG8tPypjs6PEy276YR9o9jf7AF4FfUwVcvzC+uwlzbq5//EqjmxEtZg2uRwdWIKBxDafu++kseQMPvTlHEGU1cGCheUcHx3fvO9MGCU96kNJjMrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jn23FPAy; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2240a96112fso112295135ad.2
        for <linux-parisc@vger.kernel.org>; Mon, 24 Mar 2025 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742802159; x=1743406959; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RoA2MiKiselm3nDF8hTntAC3AxrhdDHHbHna77xh+q0=;
        b=Jn23FPAyWEo6fYS4aTj5TGl2BG0C7tmaDSx5A/JYnsnAi4Rj4CnAgiOGZkX2LD3izO
         0xEzp4QUiYy5b3omD0PtkY2VOPW82B4XuPEjIurW0+Vx2cXf9EAPGeOAAY/XUPdEpvE/
         L+DgkZLaIdX4oRIW639+L/mc5dXojaGnRssHYcX2uoqGfk6S8cJIONOtei6FWUhmbth4
         ch07wY/DB0JJtCedOV8ZOetsnLnkIV4tUhTEKrnOlIodTmtEPZOQpB14APVwUIVEfoTN
         oqm5N5InMYe49ZN8+cW/Qu/ZrlsqlspdqKdSyh5xZOBnHidTCkGZEHW2V5ycokEJkJQ5
         LAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802159; x=1743406959;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RoA2MiKiselm3nDF8hTntAC3AxrhdDHHbHna77xh+q0=;
        b=PFpPbTlu5rGtR9WYlrguPhu1W9I9FtkXxPm8OeSqu5ztyxC8I75UJ9KpUdcyusYkHA
         0f6SHZ9etyiJVLS1UAE8PWrEZaZJvsK8NeECFTlb5HWkg5CAUq2CIle80orc9Ey1WwwN
         xr/PfHDxqtSXLMv0Jt/TPc7rC43M2LdlKOHazoQVXIdLpF/ZMoCxPlOXXPez2bS1XSh4
         xSKR1nMJ2EkSRwO6D1MjgYPELMFJFOynzgtVfUYmT0cn5A7+/chgPM9QtzZ3aSFmH/6B
         qwwjZeZfZaWIHdkgZUjjaA4SmYnK7WYOIOlYk1PY/8tToJiVAnd7R88yW10/qxwPmVpi
         s0YA==
X-Forwarded-Encrypted: i=1; AJvYcCUYbXUJpaN6DBsSMDIwX64K9B8ux2IPv26l2mGEvVhbpExQLXaXT2/7WIqQZLIG9sjFAhh/ael5WOwcwm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDE4Tmn6/xsgJEayN5iR2OTHJrndaQ8b3AonC8TQ/I9y2SFHP3
	4yWbGxqCpF5Z3JvoLUZ0WpW4ItnblK6n7mI9XC9+znduRT04QPFgRtbr7l8dejmp32Hqpkl0Wg=
	=
X-Google-Smtp-Source: AGHT+IFfTT6303wR/U98GKW4lIvj3fB0IWhVPILnwINYi04ZQTFPBYtzKLrvl5S3naxN8O8cJWPCwRaC2A==
X-Received: from plsu3.prod.google.com ([2002:a17:902:bf43:b0:223:8233:a96c])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f685:b0:220:c178:b2e
 with SMTP id d9443c01a7336-22780c7dafamr157239495ad.17.1742802159568; Mon, 24
 Mar 2025 00:42:39 -0700 (PDT)
Date: Mon, 24 Mar 2025 07:42:27 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250324074228.3139088-1-praan@google.com>
Subject: [PATCH net v2] net: Fix the devmem sock opts and msgs for parisc
From: Pranjal Shrivastava <praan@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-parisc@vger.kernel.org, 
	Willem de Bruijn <willemb@google.com>, Mina Almasry <almasrymina@google.com>, 
	Pranjal Shrivastava <praan@google.com>, Jason Xing <kerneljasonxing@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The devmem socket options and socket control message definitions
introduced in the TCP devmem series[1] incorrectly continued the socket
definitions for arch/parisc.

The UAPI change seems safe as there are currently no drivers that
declare support for devmem TCP RX via PP_FLAG_ALLOW_UNREADABLE_NETMEM.
Hence, fixing this UAPI should be safe.

Fix the devmem socket options and socket control message definitions to
reflect the series followed by arch/parisc.

[1]
https://lore.kernel.org/lkml/20240910171458.219195-10-almasrymina@google.com/

Fixes: 8f0b3cc9a4c10 ("tcp: RX path for devmem TCP")
Signed-off-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
Reviewed-by: Mina Almasry <almasrymina@google.com>
---
 arch/parisc/include/uapi/asm/socket.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/uapi/asm/socket.h
index aa9cd4b951fe..96831c988606 100644
--- a/arch/parisc/include/uapi/asm/socket.h
+++ b/arch/parisc/include/uapi/asm/socket.h
@@ -132,16 +132,16 @@
 #define SO_PASSPIDFD		0x404A
 #define SO_PEERPIDFD		0x404B
 
-#define SO_DEVMEM_LINEAR	78
-#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
-#define SO_DEVMEM_DMABUF	79
-#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
-#define SO_DEVMEM_DONTNEED	80
-
 #define SCM_TS_OPT_ID		0x404C
 
 #define SO_RCVPRIORITY		0x404D
 
+#define SO_DEVMEM_LINEAR	0x404E
+#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
+#define SO_DEVMEM_DMABUF	0x404F
+#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED	0x4050
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
-- 
2.49.0.395.g12beb8f557-goog


