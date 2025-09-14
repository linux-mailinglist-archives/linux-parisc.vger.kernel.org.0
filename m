Return-Path: <linux-parisc+bounces-4069-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE6B5655E
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Sep 2025 05:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA8B41A211D4
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Sep 2025 03:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A84F274668;
	Sun, 14 Sep 2025 03:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vnx7+S6v"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504C126C383
	for <linux-parisc@vger.kernel.org>; Sun, 14 Sep 2025 03:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822163; cv=none; b=DIBPvW+11AguKfMQ9ZxOka5XXx+jqUTyepN0mSbgGVb7iAbb8IE6WVl1pfmoleBWT3bLBAEKbxEnNtHNK4Zf+SjM4k9uwGGwfEQY0iSpGg7bq18KAYmjBDMQwZay/aKmSRM9ySdRFejdkr9EBge7o+9iTHu4qE0/VYAWC3r4EA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822163; c=relaxed/simple;
	bh=n+mmy3PjKTU6Jj1te3ZtONq7xS36QH+38sfXYxmW5ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ubNKpUDygUbdsMwSBj3BFpRZQRDi9ZzMr7vUg7DlcsiIMZuOd4/FHyjFozGxsATfyP2RsH+hPc7vx0QShUTGzhjshM9u96Qiri5FkNKZ68TF+GAoc2UZzad/E6EBrzRzQPaMaAacmVr3kTjLpewC0nOlQiysL6z6S1ERLok/+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vnx7+S6v; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62f330eeb86so55270a12.2
        for <linux-parisc@vger.kernel.org>; Sat, 13 Sep 2025 20:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822157; x=1758426957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=Vnx7+S6vR5uXvbxbQI6Y2nSi9+hEKUhrI+HwiAIdN707y/+/0p2YE+/GeqFmuX1GRJ
         UmfbavpAMsUNv/JYJb/rHEKQIImz68EFaYQS6v90t97us53l6aJTcciPwYDeAptqB5uE
         KIVroc2zNs2ycQRgXSexOBVTJGNWyP0I7PBdHbRfFW+/H6OrVTg6b6+9tLmEf7kiELSY
         Wh0ffdJCq58eBl69bD7bPJX2rKH96f8FrWO8iO46le5j7Do/KceVIc7/U+x0Jpi9Um1d
         9aLhofIKfXtovdWaTt6eDwUVr+rWqj0/U7p18dRBUBcBFfwoO+WWnrDPTNnaIkPi+hV9
         p0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822157; x=1758426957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=YDwCasM3Sd4nHqkXr6LHM+GejD1Ks4f29weE2DsumRKZ+rjOWLOSW2jAHKE18F0K8+
         z2XOayJCwJFZ84Zu527C7EIOb73P25J4jR32mqcZW8F/5JDH2pmr/Bn/uCNupmbrAoyn
         G/vZejn/hTiEQLOi+1fxBDTJ/qMoZW7s2ayThxRAWseBU61Qk8fnDyV3vX0Pg1pUCScJ
         cg4CH4Erd7CIpzyxc4MoTc4PDO9+dtnixYzuDelCpBHz2g2vqiy5VvW1INmCSzCZkv7T
         w/RMlcpiuWU85mEoiOp62pk+zQyw+K3QXqOkbJi7SzE3YziEcS/9o9kp0UWVn2lk8tds
         OxMA==
X-Forwarded-Encrypted: i=1; AJvYcCUsirAZRSQTpL1/HaIMJKxDQ4fLnxigMhc9YP/CdGJBU9ZiKo0tGzhPqZFmuvOfSu/Rq5pkg8vLXmECcqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9TlJMVGOHLaMh9lHX9HL6XfALGN6cSVHwm3bSvpBAz18LA7E
	4SZ+Mrs5lpeZgIUzbo0+zF9MsJPdyNqMaVsoX+HIy244DCukOpvrKVub
X-Gm-Gg: ASbGncsphtRTsEAMDjnBY72mq8g5BpBk7l/2bDnBrnwvzVwEG3XwMfFx7nvmfAlwoMz
	iCYI7EztAQrkXkuYirJHYiLk1zNnicqp1viXkbOSbaQYweTrTU4AAGM1H5YXojcFfUqOpc9mnR/
	l7AZdjwzjbs10xJxgDD8MppUpGow1s+t3fOXBia14g35FrX8rJO5J3/R5nuJC2ZOEx0Kwenc1qL
	JYb7LP/PL/YJDC0mYQGgvynGR551Xt/JcHYd+UiH12AetRrtuz2oavk995S1sMXnU4Mi+Y+jqa/
	xs1SN/dUvjU2iF4nKFaGfPQP14g47UHv+sboQeqOD5ejFmDuH5EK56/wVJexiI0WlTy0uKEpUFE
	bfEwtqxsIwAdmWn/xDBCQ9GDZmt7wGw==
X-Google-Smtp-Source: AGHT+IHVlqrM3WGO2PMhAdJqFymXZDFmcHUFnmRqsIL52zZcyiB7/sntw8UcjJnO5qIuj3xo01B0kw==
X-Received: by 2002:a05:6402:278f:b0:62f:26f8:fea0 with SMTP id 4fb4d7f45d1cf-62f26f91103mr1500285a12.33.1757822156480;
        Sat, 13 Sep 2025 20:55:56 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62f2b2a8c38sm677327a12.31.2025.09.13.20.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:55:55 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 47/62] init: fix typo: virtul => virtual
Date: Sun, 14 Sep 2025 06:55:50 +0300
Message-ID: <20250914035550.3706342-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 8b648b09247a..cf19b7c0c358 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -636,7 +636,7 @@ void __init reserve_initramfs_mem(void)
 	phys_addr_t start;
 	unsigned long size;
 
-	/* Ignore the virtul address computed during device tree parsing */
+	/* Ignore the virtual address computed during device tree parsing */
 	virt_external_initramfs_start = virt_external_initramfs_end = 0;
 
 	if (!phys_external_initramfs_size)
-- 
2.47.2


