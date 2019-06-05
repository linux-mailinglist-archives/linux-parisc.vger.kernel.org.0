Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 400EF35D00
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jun 2019 14:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbfFEMi6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jun 2019 08:38:58 -0400
Received: from mail-yw1-f51.google.com ([209.85.161.51]:36572 "EHLO
        mail-yw1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfFEMi5 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jun 2019 08:38:57 -0400
Received: by mail-yw1-f51.google.com with SMTP id t126so283168ywf.3
        for <linux-parisc@vger.kernel.org>; Wed, 05 Jun 2019 05:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=FLoW8CyLozSZf8ymm84Gw0WP3MQ1Agik1tyc6HrVIyM=;
        b=DW1h/jz6BTdLZPcyeISUo4iV95p9Uak+ldgyToSWr0FZ4Lw1h0ON12OXPIVRr1xyWb
         5KjQs2IfzH2esibfHfHesNshukpHfHmXegfNww84pKoYIWjKAkhQaNjllAR27FEOr32U
         NiJdHVpiOLq82pGqCh1ebmIi5TkyOH21w5Q/R7vzOXFG8plLVJ00UYCMF4WqZ0tu4w0l
         OFEcuv+crwboq1KB5JNH0ZIWW7dPe3t5AVhcsdkJcalgeQ1mv8FFGcsfkW8NFGGSWnAt
         guC9K3rcpmiJesRtlSzbnVX5iDno+KtCfTYLrYM16+aYxHG59FlzJKd4LjctcDqMlAEq
         ZjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=FLoW8CyLozSZf8ymm84Gw0WP3MQ1Agik1tyc6HrVIyM=;
        b=s6Kx9Jl6XV9TR3lw9KISUaN+XKncGfT4el0Kq5aNfvfeoeTS9gJwDxkGtTB5jbNQms
         Ara5rInBzaCMl/ORd9Mfyz17lJIYAqNLgf1Q3jbHxj5Ry1Kg71nXtXViOmrzrqbjgTOo
         UTWEjTITRe/T7Xbq6IKBhwnRTPNAWcatRe4CZBYNG+Hh/cIpDMwu7plKU2QoR/Z4O6Uo
         durOli3/TODvBVY++RE9HRXb9bmO2MFc7FH5P5EI01U6rYFkoCqh9Pw1Ay1GYBeFfKab
         Vh0GlrkhsjBxCDZgd0C5A9FKrmsn1iRb7CqjiI2dGt3xnIf7q4Jr2uCIma/77Q2+XXyT
         Mmtw==
X-Gm-Message-State: APjAAAXo37T7zbOFIM8r5sOS58VhNJQSahah2YpoHBLJtGjrES/5qvBe
        LBF7o5P6tYCmJw3I/PhqcycTVMcjVpZ56/6e9+agKGa3
X-Google-Smtp-Source: APXvYqw4li9NJny6VAVUGBDPsVYqjDZLTIYkFdh3oSu5hErWmkT3rGGsoR0YCmaGJkIYq/b8pflS4mibbAIIwR7oHGo=
X-Received: by 2002:a81:a186:: with SMTP id y128mr7951503ywg.128.1559738336828;
 Wed, 05 Jun 2019 05:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <5d53371f-d918-0333-08a7-ad0d04eb3b26@bell.net>
 <5aaedf55-97bf-8d38-da37-bdafa54b5e9f@gmx.de> <99ef56f8-4814-93ca-4c33-71ccbad5dd61@bell.net>
In-Reply-To: <99ef56f8-4814-93ca-4c33-71ccbad5dd61@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Wed, 5 Jun 2019 14:38:31 +0200
Message-ID: <CA+QBN9BpA80MORxGafyit4-mPXk9jTWhNzd3Nj90WZwpZHoE=Q@mail.gmail.com>
Subject: SCSI Adaptec aha-3950u2
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

hi guys
has Adaptec aha-3950u2 been tested on HPPA?
it looks a PCI64 card with a RISC chip on it for processing SCSI commands.

So it looks perfect for a stress test on the PCI bus

found a discount for qty=4 units, so I am considering it
