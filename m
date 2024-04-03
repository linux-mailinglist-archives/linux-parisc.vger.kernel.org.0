Return-Path: <linux-parisc+bounces-1029-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9199489674F
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Apr 2024 09:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC93AB299EF
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Apr 2024 07:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2B3286A6;
	Wed,  3 Apr 2024 07:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MrtYJFNn"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0955BAD7
	for <linux-parisc@vger.kernel.org>; Wed,  3 Apr 2024 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712130817; cv=none; b=oN2nENoXpW8rYT2JoFg+tL4JUXZkNODHPKYuiPb8gkNkDua2QVCvG7Ctz+U1Sd7LVAX3JtJANN8OgeJFb2DIoestrVkLpsu9c8Yx2EIzyF4JpBESgXYbW4TVfymjzD91BauE1fu3Og3GOoEr01PVHys9elhX2HuSci1OQgiE1uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712130817; c=relaxed/simple;
	bh=lu4lr9wamx7dI/HCTq6kawIsHy+GqxMxRmNu/rjakdA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BoAQNbHb94wtF3VjW77vXc1sstNfOptU7g/LRSxhbvmF1NBKKNFj2MZa6bRppnw28hX6r7vJs1Rx+fi0sPEDH4AibDiM3K0BiTotB3rXkIMBJ4lCcu3vuKjVTl2suLksOvKuv3OizQf9cq6LXhEs73TPy4ETjsdEC9l9JOwJpqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MrtYJFNn; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7e38d2f7790so696235241.3
        for <linux-parisc@vger.kernel.org>; Wed, 03 Apr 2024 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712130814; x=1712735614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z7p53XmkkGTALNH4Ix0xvzQLOZKvgVhwnYYuHGcSQF4=;
        b=MrtYJFNnPC9VhWUTMqaUxXOT+wiTRoVAdLq9f65kxYqzmMsr6NQGUYzD05TmJEnEcf
         ar69I7VjL3kPopRwa/Y7IgDEzVYlqrxlX9S2dpsOHNC/e0atozXduTBZl6fZNHUAfsdi
         2JVFtNvgnue09yJkbZI5RWzzJaem5TdDik5BhUbu8IxVAoxYr9f0sTi/uy+kulwBX2P+
         750tu0rewg1l6uYRl1GX8HQuX1W/lkzmx9QCiE0pmKs9/BUePI79DvY0pk67Fp61bSUe
         JnoD7Rp2k9iVeVjCihSXRAVrGCkzfdjjTOS5wasdJ44XBCojFqI/vWJfyRH0ZtkzboBd
         704Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712130814; x=1712735614;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7p53XmkkGTALNH4Ix0xvzQLOZKvgVhwnYYuHGcSQF4=;
        b=f7HUUM61IVoqq8N3tLFRX3FpGAFEogenJ+yHkrFgE/DFC9fbkpkFNmzkGBFwnsT9Ej
         DfukIzLzoBgCtEdVREcVi/0rBZWyLC+SnaA7tUwQYVHJLk3lk9gWkmJy8aE1csKV2uYr
         YADQ/lKvLrwThduzHFNcv51A0AiXxFE+ufsrJ/3x27fYIg6X0oZliAg7upGv9QjTI77D
         LHKSFYM5g7ZVNwquDJN6qxnNkzd2WYb6HBFwEmJtV4BSIcT6d6LENatlOfOh0UypZ2oa
         9zrXApZ8zfyCXA3DeoL5QPGfjf7jUpeBmnvvc3vCyofLTmPc6L4LCULKg1k6zmExn8YF
         K0Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWuFuB005DBi7v6YSv0EbA5uBBOckxEQghAKVnk3ctfnjYjhd5geoiOgZXrSeQj+nFPOQxsGuGLopXx/X2pw+Fsqy19rKlzzEBbofDU
X-Gm-Message-State: AOJu0YxV433/5pvc1l0kpjkjfk0f6d9cIkBue4aTxi3x3IrXIFPzAhTe
	ID9YSeIBljg5GGPWf/IYjTrma4RnLPABgZEt93Y8mOw7IuQIr2NdFkVkyk7ihN2MPlSyUT/r/GV
	NNlleNvcSYiVdeSvOd+Ruoa1fiwoBhunKeQcqpg==
X-Google-Smtp-Source: AGHT+IG60A9cZw5q2ghP0j48oSICnM4EvMleBb57CwMtDkNbKO547PHL78ohs2lagIPlHsnadarK5o/Vf4QbZb3wFa0=
X-Received: by 2002:a05:6102:4bc6:b0:478:8714:e1e with SMTP id
 id6-20020a0561024bc600b0047887140e1emr8289869vsb.4.1712130814422; Wed, 03 Apr
 2024 00:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 3 Apr 2024 13:23:23 +0530
Message-ID: <CA+G9fYvUwyf-5yB=xZVAPXrF3C9z==7bbhDYBnX9jdJ1PxzPnQ@mail.gmail.com>
Subject: sh4: parisc: asm/cmpxchg.h:60:24: error: implicit declaration of
 function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
To: open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@surriel.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The parisc and sh defconfig builds failed due to following build warnings
and errors on Linux next-20240402.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

parisc:
  build:
    * gcc-11-tinyconfig - Failed
    * gcc-11-allnoconfig - Failed
    * gcc-11-defconfig - Failed

sh:
  build:
    * gcc-11-defconfig - Failed
    * gcc-11-dreamcast_defconfig - Failed
    * gcc-11-tinyconfig - Failed
    * gcc-11-shx3_defconfig - Failed
    * gcc-11-allnoconfig - Failed

In file included from arch/sh/include/asm/atomic.h:19,
                 from include/linux/atomic.h:7,
                 from include/asm-generic/bitops/lock.h:5,
                 from arch/sh/include/asm/bitops.h:63,
                 from include/linux/bitops.h:70,
                 from include/linux/log2.h:12,
                 from kernel/bounds.c:13:
arch/sh/include/asm/cmpxchg.h: In function '__cmpxchg':
arch/sh/include/asm/cmpxchg.h:60:24: error: implicit declaration of
function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
   60 |                 return cmpxchg_emu_u8((volatile u8 *)ptr, old, new);
      |                        ^~~~~~~~~~~~~~
arch/sh/include/asm/cmpxchg.h:62:24: error: implicit declaration of
function 'cmpxchg_emu_u16' [-Werror=implicit-function-declaration]
   62 |                 return cmpxchg_emu_u16((volatile u16 *)ptr, old, new);
      |                        ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Steps to reproduce:
------
# tuxmake --runtime podman --target-arch sh --toolchain gcc-11
--kconfig defconfig

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264271/suite/build/test/gcc-11-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264273/suite/build/test/gcc-11-defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org

