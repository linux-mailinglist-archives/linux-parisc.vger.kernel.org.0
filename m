Return-Path: <linux-parisc+bounces-2936-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2384E9CFFA5
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Nov 2024 16:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD587281653
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Nov 2024 15:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1678186E58;
	Sat, 16 Nov 2024 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bp/kRYf3"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B370143748
	for <linux-parisc@vger.kernel.org>; Sat, 16 Nov 2024 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771649; cv=none; b=J0EbNTLpvPyyhtrDNiNX4WE0nPHHjFT5A9LlorQmUM33oIZc7Ie2oPMGu7tLoHTQCFoXZUuXacAW9bomM40SHVYGZa+X0PiBC5hmsrhGmQ2fyWJmWTn0OABs3/mF6ptlVuf94Ydf6XtoFPVqUXg1vT5HMrLcF9DBbrylKE3l0yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771649; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=dennT9emW5F7kH7OuBTAzWwsV2m96XjOYrrnfXGUzj4k2ePkNc6gwGXPmSP9qZzFb2q1XyAL/3jLJ2nXfc6ujyLQhngy9drGPRSJtdHcWx0kwz7U7F4NF/TseT7qBZOC5zyQI82B0H8d3tsJebikvXDZN8jJgNDa+TZD81RHv6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bp/kRYf3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ea45dac86eso218067a91.3
        for <linux-parisc@vger.kernel.org>; Sat, 16 Nov 2024 07:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771647; x=1732376447; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=bp/kRYf3F1vBg4tW98r0FZaxgiZEADMnx/+Blhr66fX6KxqYrqBSIHB/Ey8vDQqTkH
         /yULZ/a27Utu9HmUCxMwgqglGhVkSO76xr6TBXJbckQVQlk9p/tZXdEBojd2yFPdeFWI
         /iIaC6w1xFKLWE8+TwdoGbahlrHKSvgYzZsMxl3kHmei2IK/hTheRgU+13eszGIbCYKl
         BFnkFiZ780iPvtmUhgeBkNVzqQ913oSqNgNdlyh/z57EJ2zUIU21j6u6Sg0P0NRjuZHh
         H8zS9OPuxtlf4vlaoNYrtQc1nbaBefg1ksaIasoDe+DEljJkJz5RfEWto6tZGpfV9J8S
         WSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771647; x=1732376447;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=RbnZH0exTxoowbsvts+ILI+CRvLUzY+8hRn9ZnfbIzZqt+mcU5VElf6F+ykyEg+nws
         m75qxWEU05dgrrZCXBlwzvBz68wkwgyydtRewbpqDAGxgP5z6OsB1wBbnKr9U6Hv5WpO
         5Zcgkv+5xZuMBQdTsWbX/im02VF+MNkp5irXf03EpPLIfbaL5CQ5kea5p1Su3SbihIOW
         4DGj1rw/LdC0RwR0wZK64WI+XbTNyGeAjnk2QYG2nYKubD69sOr+20ewuQf0VKzaEoNY
         jcjSUcvpu3z+LPZsJl4V02np6gA3eat1xw2YupxQP/5fYQENxiZ1OBtzISYyQF2UM812
         /rJw==
X-Gm-Message-State: AOJu0YwBquPG30S9uZ2XdqQIZmLK7DCibWnBrZDfllxANrQ2LXQ8gvZ2
	u3chPIZUUDWtAxNJYf7fnyL6xpwGnjmGn4QbxfBf1gXfmGEIQ9n7R3gtIA==
X-Google-Smtp-Source: AGHT+IHr65jCTqyQYocOXta6MUgbLP6ePKIult83DVNv9p6xwWh7RHe2AlMqzHNOBA4Gf2rj+lUWdQ==
X-Received: by 2002:a17:90a:d450:b0:2e2:9522:279e with SMTP id 98e67ed59e1d1-2ea15582e0fmr7469221a91.31.1731771647365;
        Sat, 16 Nov 2024 07:40:47 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea2110f2d9sm2455707a91.1.2024.11.16.07.40.46
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:46 -0800 (PST)
From: "Van. HR" <carlonowell008@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <9d47eedb4397c10c284425a1e0f11ebba5c33c1bd4ccca12f274ec7d2fd4d589@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-parisc@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:44 -0500
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.


