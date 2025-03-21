Return-Path: <linux-parisc+bounces-3469-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2EEA6B8E3
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Mar 2025 11:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9178A3AE3C5
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Mar 2025 10:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E2B21579C;
	Fri, 21 Mar 2025 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmPDfar7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E557020DD4E
	for <linux-parisc@vger.kernel.org>; Fri, 21 Mar 2025 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742553536; cv=none; b=epmewotU1iygn67y+LWpXoIua/vT0BYUdRudnFc+bwlwRUG5nTQeIkWd7ZiYx6618PAgzubs6RDrZVv3+Ei2BgDqxADPWk97Bg/014wBLynE1+lE/LHfe2x/bNLRaXikFXWyojOI/4XEQsOWaPLDvUIhsdvQK4/b8Qq5843J4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742553536; c=relaxed/simple;
	bh=MTWqH0QQeN8BAJKCv6QLRpebs5XpSpSjpTCrE8UCWOQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=I2xRXxAumD8gEfdW8earfeGpJ86+/zIX0TTu4YpTmDFCd03b+7p6Os6ARDBrTztIavFyXJueXqCwHGNX24f0kOw+OiWSwAWsUAs8c0FMMN+tsNp5OpY7zgWc2ETd0D5Fb2/9OBli2GRFYCzQpm5hk1hWJ7uUggooZkJ1JrqQaJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmPDfar7; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224192ff68bso26017405ad.1
        for <linux-parisc@vger.kernel.org>; Fri, 21 Mar 2025 03:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742553534; x=1743158334; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wTXIzt5fOwRSNBhSHeFNg/2q6INGK9Me+w4LkNIlpHM=;
        b=OmPDfar7Id/sf/HUm8xmG5XOpl0bVf+pb7TUeB5wUwX+HR81y6a1K8qJWzBk0fNltd
         OXyQ72W7ywtnlWjySErK4a9Q7+X3gryRu/ueKXBTCS9brxEdCRAOtudzyV3C/FH+Vgq2
         BpGV0Z62QV2x1cxdB6Oa0pHoQm9InHcek8HzppuVuqrwYe6xzGwWLcqzspXa8AjoZhaO
         0zKPULRGgct/fJM5kyharxMUr4D78qsP/CkLpTESWHIO2sXFPSfFamC8pWn3LbzQJoRo
         HQY+DMdnuUlcXIMbu8HduoGSDW60NxO4Adcn+uv2oP8iJo65UQgUlHWq/w2R5lbuHF4D
         siKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742553534; x=1743158334;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTXIzt5fOwRSNBhSHeFNg/2q6INGK9Me+w4LkNIlpHM=;
        b=gJ5sfrg7MblfT1bYFjkb3nGUYYx8uGAxOcK0sl4Wbz4CoXGDqE7ZFJVL5QWDTT89oh
         UDoc1wMX6elkkhHTABbVYf5UFGAjnr/rjdJmbltfiQbY0kV5w8HIMO8t9Qn9JglORk9n
         afpmLRtUMjtv0MWerXUv45iCK4qpyxF7FAXYp1+Il52qtqllAIJcuqtsiTvG7PxHqklc
         u8LP0dkFOGinnteT9t9kqewCW1EAk9iXBPolRhJBdeejYxWK57gUQS4pUQtgmfGFz1Ne
         yl9V9af4GWcbkCZT4/fucj7dzZNTDmND1v4FH5FAFi6ejBNFRVKHDVRk0iz3tGfrZYYP
         CCCg==
X-Forwarded-Encrypted: i=1; AJvYcCXDuFYj0lKM7LImRz7+Daf9zzwAwp9ut6NqzsRGmcHWPJBNJzEkJTIZ9PYQvhe18sAraFPdbbwf9jww3Ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwviYKpuNZSYsaJveUa21p8+/+tz/wwr2OciyWaPsNJ1Z+yvi1Y
	liFlKz3b6NAXq+Y/yTtTCEP/2Yf+AMpK1hWlj2WB/DnLocyCzL7Fx0A3lqFrQp1o22QT/J0VpQ=
	=
X-Google-Smtp-Source: AGHT+IFBrPoh2xXBTLa37t7TLzk40CglNhwirrSlQoobmf2JjKUeSxL1XGZLKhnam/vZlx/gaxOnf/h6yA==
X-Received: from plky1.prod.google.com ([2002:a17:902:7001:b0:223:4e55:d29a])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:46d0:b0:220:fe50:5b44
 with SMTP id d9443c01a7336-22780da4559mr46020505ad.31.1742553534138; Fri, 21
 Mar 2025 03:38:54 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:38:48 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250321103848.550689-1-praan@google.com>
Subject: [PATCH] net: Fix the devmem sock opts and msgs for parisc
From: Pranjal Shrivastava <praan@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-parisc@vger.kernel.org, 
	Willem de Bruijn <willemb@google.com>, Mina Almasry <almasrymina@google.com>, 
	Pranjal Shrivastava <praan@google.com>
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


