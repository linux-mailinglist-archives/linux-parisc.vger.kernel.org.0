Return-Path: <linux-parisc+bounces-300-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E1818ABB
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Dec 2023 16:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79E261C209F6
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Dec 2023 15:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF0F1BDEC;
	Tue, 19 Dec 2023 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f1OiNQBm"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51371C288
	for <linux-parisc@vger.kernel.org>; Tue, 19 Dec 2023 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7c45acb3662so560576241.0
        for <linux-parisc@vger.kernel.org>; Tue, 19 Dec 2023 07:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702998175; x=1703602975; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ux8sE7fHthR2voG70KnB7oZ6Al+8xU+cq54AC46rn+E=;
        b=f1OiNQBmkE/WwH0eRklqLQxrvKR3jrms8WO1P+V2JQ5xPPfrbuojhZxOM88hgjC7+e
         cYBNtjHoGSCjw77S3mLInsMbw+ZAg+xrJjRsPkOax5meqvuK06ZbYCJelrEj5IxuE63U
         je3a4J/iBKrJJeHZOZBNoo2u8ILyDMHJE3rSO1Ai6VXT0d2OfaCD9winWIMSllEM/xs3
         DqKOF5WOUQL/Pwu+LcOM9nMzNJWMkM1oKh7ACHfU9k6pJAUEFXoE5wsaercIk+U5b0S8
         7ce1es0pi4gQPhpBfWPLp1chDVfC//Lo9Afd3g16lwJrd2SG/L0lSJMs9rlGI2NengUX
         RNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702998175; x=1703602975;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ux8sE7fHthR2voG70KnB7oZ6Al+8xU+cq54AC46rn+E=;
        b=SA0KH2QfqDpH99wtko+28wwl5+5gUaqnwzxGmX/O2L7kEt0HHHA1VF7PukfakzBgNP
         ib2TqALYoGLXGW+wqEpFHsNAhK7QcyAkSJ0FPrWR3GN+8RgVio2Vp0/vJmKiyKSTpOnr
         zpkY7xeMslEzf4hUhCe2AT/2RbcWg+VON2Y8drqKVBNO5g03a5r+dmOpyBZvw2Q+loDe
         C/rNhJrPBruuS/VO9A+s3y/YuIV/u5cax2QxEMLZBjE3sTbyDJztBQJgAYYrC222cAJV
         3uuPc3QQe0vnp4gZHd256Nm3VgfeM5WvEYRIzYj96NvYA5+wiR7Ts3Uzx1uajfkcxmNB
         wI9Q==
X-Gm-Message-State: AOJu0YyigPqrW9mGsAWqZue0TZydv5grf1kKJFm/U61nzai7oq53Wb6R
	XjF0UZyAlTay6xm6NDxF9UkZkIiJgBjHP6RqTn8nIPXBKFZ2xyL1OBI=
X-Google-Smtp-Source: AGHT+IG6e+HOmJxSwcUNT8DhH+LV9pJe4Lfz8mAYCBraGDKFr0Sdv68iV56I17MY7FbjZFs19wdqPnFaFyVyj8ww5z4=
X-Received: by 2002:ac5:ca0a:0:b0:4b6:b829:7d14 with SMTP id
 c10-20020ac5ca0a000000b004b6b8297d14mr1300298vkm.11.1702998174099; Tue, 19
 Dec 2023 07:02:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 19 Dec 2023 20:32:42 +0530
Message-ID: <CA+G9fYvq+wdDhTjR2YkULF-_-nQNPGzCeOON-08EbVyidj-J6w@mail.gmail.com>
Subject: arch/parisc/mm/init.c:534:29: error: invalid application of 'sizeof'
 to incomplete type 'struct shmid64_ds'
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-parisc <linux-parisc@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"

Following build failures noticed on parisc on Linux next-20231219 tag.

parisc:
  build:
    * gcc-11-defconfig - Failed
    * gcc-11-allnoconfig - Failed
    * gcc-11-tinyconfig - Failed

Build error:
arch/parisc/mm/init.c: In function 'mem_init':
arch/parisc/mm/init.c:534:29: error: invalid application of 'sizeof'
to incomplete type 'struct shmid64_ds'
  534 |         BUILD_BUG_ON(sizeof(struct shmid64_ds) != 104);
      |                             ^~~~~~

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Steps to reproduce:

 tuxmake --runtime podman --target-arch parisc --toolchain gcc-11
--kconfig defconfig



Links:
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231219/testrun/21768759/suite/build/test/gcc-11-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231219/testrun/21768759/suite/build/tests/



--
Linaro LKFT
https://lkft.linaro.org

