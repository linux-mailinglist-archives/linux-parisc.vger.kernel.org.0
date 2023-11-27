Return-Path: <linux-parisc+bounces-71-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5237F9C26
	for <lists+linux-parisc@lfdr.de>; Mon, 27 Nov 2023 09:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A9B7B2093E
	for <lists+linux-parisc@lfdr.de>; Mon, 27 Nov 2023 08:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE7820F9;
	Mon, 27 Nov 2023 08:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yufLAChD"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B04C111
	for <linux-parisc@vger.kernel.org>; Mon, 27 Nov 2023 00:57:52 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4af6a700087so1139452e0c.0
        for <linux-parisc@vger.kernel.org>; Mon, 27 Nov 2023 00:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701075471; x=1701680271; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q3a/gp0k8Xr24VWAVkFjnZAQbXQVNc8sm8eV5Fej3d0=;
        b=yufLAChDj9RN7rEs7pvz37PwOkjlxXw2veCZBn/kT8ZeGDOsQdKerKh5evKH8dvbXM
         gqS0SBq4QiEyHlkbQHswNW1sOvl0n1yaj6qdh5yTsb5tMVnNZ3X4Re2Q4o4BL9P+S3sj
         jDtjUtswG4m7sodXvxUL74b827RytT5IlFTL7Rsi+mAE6abTnzqxB85xpQM5SKufD7I/
         VcTva3Ats9RaonsQyK1EKcu2+eYpwL90EaGt/eu54yd5yQADh5jt1u4VLC6EyFjpea6/
         WeE4Sm2+HMUUujjORkDWIJwN1Tdc9oVkZz8393bodcB7KetcwJa2OZzxKvN29P7zyGm+
         gtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075471; x=1701680271;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3a/gp0k8Xr24VWAVkFjnZAQbXQVNc8sm8eV5Fej3d0=;
        b=DlUQZkAFJyhakLLy1O5+7bJtkmlG37jU9fk6OZHZ71uGJosxig+qpsEIHqX8OiFrCi
         AgYs8vZgGN3hjG7fTPI9wenrq5GqsGbBIVZkajcKPhLehTclkDDWk6GdPGKt0MthWGQW
         X21VZeZ36CaasSz1mvOtUVvFjde6UxlRL3vUBiWgviqwkpDtqQijBL7YzFfczQDbDCVL
         03Kdqc3zUsiue8eco7SVU228gGkmNncY8CDN2JNJtcBWpHWbUCbK+y9UH3TKafbHVSy6
         eBHEART4l2eRw9sDms8Tj/kgSqnqDekc5Srhwibcfm6cYpRCTaSvkRvWSq8jD5TAod+I
         q5NA==
X-Gm-Message-State: AOJu0Yw5FsTRgHgMWtbL+C7C/Nv9o1EKraHhlcxfUyKzjc3zQONQFWFw
	dN2jNZGdy5gf+YCLSXyWNAG1WBOscpOo5WAfYueRVw==
X-Google-Smtp-Source: AGHT+IFv95af33s1Ivrbna3UuLQx1RVxE1lA8CxAKNGR1f+9OlWM5+Mw0oXtBMJb+qYB4sJZRWgnDMtvK5EbVnJyJ9Q=
X-Received: by 2002:a05:6122:3106:b0:496:2e22:29e3 with SMTP id
 cg6-20020a056122310600b004962e2229e3mr11176649vkb.1.1701075471346; Mon, 27
 Nov 2023 00:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Nov 2023 14:27:40 +0530
Message-ID: <CA+G9fYsM4Aa1smp2Xahf=z2WOGpXsAC3GzUW06HJN9pucm837Q@mail.gmail.com>
Subject: parisc: bug.h:71:17: error: invalid 'asm': operand number out of range
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, regressions@lists.linux.dev
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"

The parisc tinyconfig built with gcc-11 failed on mainline v6.7-rc3.

git_describe: v6.7-rc3
git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline

parisc:
  build:
    * gcc-11-tinyconfig

In file included from lib/math/int_log.c:14:
lib/math/int_log.c: In function 'intlog2':
arch/parisc/include/asm/bug.h:71:17: error: invalid 'asm': operand
number out of range
   71 |                 asm volatile("\n"
         \
      |                 ^~~


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
 - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.7-rc3/testrun/21323529/suite/build/test/gcc-11-tinyconfig/log
 - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.7-rc3/testrun/21323529/suite/build/test/gcc-11-tinyconfig/history/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Yk9c7RsS6V5pdDdOYzHSrlpZQk/

--
Linaro LKFT
https://lkft.linaro.org

