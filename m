Return-Path: <linux-parisc+bounces-2192-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F339F967ED4
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Sep 2024 07:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A75EA1F220D5
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Sep 2024 05:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843B9152E12;
	Mon,  2 Sep 2024 05:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="yI2jV3VA"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A7142052
	for <linux-parisc@vger.kernel.org>; Mon,  2 Sep 2024 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725255112; cv=none; b=DAjZwaG1oO0xWUMUTg50NawwNUplZhloyOFS/pSNRHNynLa7NdMXLJK0FobEilfXsuqjigGE6JdgD9xOiD0SMqnOIpF+o8E33MgfqXiXcAXS8V0FW7rXuIovJbgFHKUz/+frZflWOjTj+CkiXNC3/yeh9PE1wKegV0tFntNJ3qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725255112; c=relaxed/simple;
	bh=p7pV+OekQRanLYGDkHAzPVIoQUeenJaMBzGXbvR4lNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AmBjgmZfabxQg6luqBFn7qLLK6jZmR5U27Vv76LsbAPucoGgfa5EIU/2UB6Pvv/CRkCgJWpNQsi0xjuRv1QGmuci8kVgStKyqszw6K6T9GcfDABmVbpVeW7EzFVQnOH7SaDWx8QSyw27vblQbwPO1zuZ96BsaGCpr5TPCr0Cw84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=yI2jV3VA; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-70f6b9a1716so132148a34.1
        for <linux-parisc@vger.kernel.org>; Sun, 01 Sep 2024 22:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725255107; x=1725859907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dcARxruAP0vzhVrIv4mZE+MUS7Q/ymIzQKM3BTvM2Fg=;
        b=yI2jV3VASmzs8rFu0R7i7/aVcG13SLaVSBX4ouMg0JZcVxlniLgP2QI20NdomGgINx
         yhNrERDM238EorFwfOhrojkbftDYOFHo9alsjzzYh1ddFzgqiztsyAcb9+xn4qMBmVCX
         dRYdpFvxsSrfmHaQ6hQxeGYw1CxmVX8Did31ejFfoi720lu6UFxuWcr7vlp5teGL/4UR
         QqjMz/0XrF/m93pdOv4J8UtHyiz7y9vycaCX/HnjS/j/u29XP8MB18oU7Rv6hMMjnrKE
         94jb2MzbTF7AkHrGPQQkH+admxyQZdij8kJJ46mMh62aQtXulTcXrDYSUQDAQO0rUs4y
         o8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725255107; x=1725859907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcARxruAP0vzhVrIv4mZE+MUS7Q/ymIzQKM3BTvM2Fg=;
        b=jnHGUDtp8jA80WeYxJdEmjOBFdq0d6UXMyPC58hLggBvf8fRSgZ5nnO1dCvHA8ZNQt
         66ttxSzzWj2LvPjyeo67ECVpaiF/e67la+/0l1RpdjZVPSu8Bm/j9e2R9RtgiILZcCK2
         aGO2f7GdDujsoCeqeWeIKftH41BIhLKh7m766Cm5fr99g2hnc0vY4MI2SHzod4ens3n/
         zibbdD/JKDpK7LfBCpYptic7Zrz6zwatZ103A/gqpeDVuyIiBKC5nYRuMUTw6kmuNjDZ
         SxagzgJVTELhuUhmNAly3LTbOXXc+073NLW93WWbyJr+k9+xq3kUY3aLBE2zV/ug+Ckf
         S6MA==
X-Forwarded-Encrypted: i=1; AJvYcCUyekQKb58PUM2wenmhZYuri/6/gB2yhCjoby6j+g7xq0ZHolxrLuqr4rYti5vThMg75r0dVVulMM7ULCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFbl/MJeQFVjF2Baxz/5TuqGWFkwAAQZ+ly+SLnLIClLyc1uGk
	ec5RpIZrRbIhZPLXdAYesRQiIGGnJuLCctirzXM6fSiLSUai+RDKf7YZS45cRLQ=
X-Google-Smtp-Source: AGHT+IG4O9VSEnbCHyMlef62PC66eJmk+Wcfg7k+VoUwjggysZcp2Zp81AWYRWJzYn+qz65dfh/WPA==
X-Received: by 2002:a05:6871:b09:b0:26c:78ce:b0cc with SMTP id 586e51a60fabf-277b0dd215bmr5158894fac.8.1725255107434;
        Sun, 01 Sep 2024 22:31:47 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a692fsm6076279b3a.60.2024.09.01.22.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 22:31:46 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	kernel-team@fb.com
Subject: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user addresses
Date: Sun,  1 Sep 2024 22:31:27 -0700
Message-ID: <cover.1725223574.git.osandov@fb.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

Hi,

I hit a case where copy_to_kernel_nofault() will fault (lol): if the
destination address is in userspace and x86 Supervisor Mode Access
Prevention is enabled. Patch 2 has the details and the fix. Patch 1
renames a helper function so that its use in patch 2 makes more sense.
If the rename is too intrusive, I can drop it.

Thanks,
Omar

Omar Sandoval (2):
  mm: rename copy_from_kernel_nofault_allowed() to
    copy_kernel_nofault_allowed()
  mm: make copy_to_kernel_nofault() not fault on user addresses

 arch/arm/mm/fault.c         |  2 +-
 arch/loongarch/mm/maccess.c |  2 +-
 arch/mips/mm/maccess.c      |  2 +-
 arch/parisc/lib/memcpy.c    |  2 +-
 arch/powerpc/mm/maccess.c   |  2 +-
 arch/um/kernel/maccess.c    |  2 +-
 arch/x86/mm/maccess.c       |  4 ++--
 include/linux/uaccess.h     |  2 +-
 mm/maccess.c                | 10 ++++++----
 9 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.46.0


