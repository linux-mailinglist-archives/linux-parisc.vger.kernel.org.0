Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA4D324737
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Feb 2021 23:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbhBXW5w (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 24 Feb 2021 17:57:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235628AbhBXW5v (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 24 Feb 2021 17:57:51 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768ADC061574
        for <linux-parisc@vger.kernel.org>; Wed, 24 Feb 2021 14:57:11 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id v126so3867922ybc.13
        for <linux-parisc@vger.kernel.org>; Wed, 24 Feb 2021 14:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=z4mBhYxcVjU3ugzDlaj7Ky4xMjoUJPIBACtLHkRazB8=;
        b=A8tt3t7qdna4lAK4ThJceanHqJOIjULXo61rzAkeQrKoyCkR2wH5RgsDVRnQ64Mojs
         Hl5Q1CdYHS5lWOg9h9f+I4uLvewd438VGRSxx0dIBofjMw2A+ayjlt2GYckLdYXdXYgO
         nFJE0G548Ez80vBj9I0S4zNbmgFR29fmzWtwoSDYe5FpQ+U1vrFpTm0yz+I/3RPnpZ4u
         H5UKaqIISPunOgyNEz1IuVXoQWR5jrBgDOD/FGCZrGu5Nm/Gd8Sq70p2cjaxHfGZC3Ic
         p8KO2emm0A2AqZu3L6et1epzOaIZYs0Xe8isd5vxrvnw03DHyqOBNh9bi82uQLydr/VE
         HsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=z4mBhYxcVjU3ugzDlaj7Ky4xMjoUJPIBACtLHkRazB8=;
        b=fQE4P8zVR5ai2xKSPem5REF3P5x2z7hpSI3w4q9itrl0WQmLoACgpJfcHQ2s4U1xaM
         GKP6bgkRXcHOkIhvD4K18k+8o0vXemwnFieCM5CBbgp8DGIDQ8WtlpXTu4+TXNqf3DsU
         cvR78pNotJE6Fo6y4aTdM0xcyWrFJENRhu5Rp8zFOWIoQmyD63fgFQKVniYMaaBsQpN7
         Jmp9AgL+0UeM1ukIWOU0ve0bsJ0XQ3xGEJeGB6QpiO7C34sMzdo23ADhOUGbuyw1uLxZ
         S47rKV6D34UVig8/cbJ15gyMb8m8j0MZIdTIzTfm71F6972RCJhXF2DH1iTnFu2noGNY
         DOLQ==
X-Gm-Message-State: AOAM532TUsGsTkK8GnI4JnKIDTaQHpg+QszO8CIvNsflzcP8NbyLiX86
        TTJhhfHPglCgTN1vSKTI2m57OFHuD4fn0phOJ10=
X-Google-Smtp-Source: ABdhPJxS86Ln1XQ+TyhQREO4LaaSg7HDOgrKwtwnUseClDnA8CyNXUHSi6ImX3F5al8juc02g99aYPDROQZ8td6rLss=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:2c05:1953:5dce:c3b0])
 (user=samitolvanen job=sendgmr) by 2002:a25:e695:: with SMTP id
 d143mr54672281ybh.148.1614207430717; Wed, 24 Feb 2021 14:57:10 -0800 (PST)
Date:   Wed, 24 Feb 2021 14:57:06 -0800
Message-Id: <20210224225706.2726050-1-samitolvanen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v2] parisc: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
From:   Sami Tolvanen <samitolvanen@google.com>
To:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Kees Cook <keescook@chromium.org>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

parisc uses -fpatchable-function-entry with dynamic ftrace, which means we
don't need recordmcount. Select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
to tell that to the build system.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 3b15cdc15956 ("tracing: move function tracer options to Kconfig")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/parisc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index ecef9aff9d72..f56c67bbe495 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -61,6 +61,7 @@ config PARISC
 	select HAVE_KRETPROBES
 	select HAVE_DYNAMIC_FTRACE if $(cc-option,-fpatchable-function-entry=1,1)
 	select HAVE_FTRACE_MCOUNT_RECORD if HAVE_DYNAMIC_FTRACE
+	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select SET_FS

base-commit: 062c84fccc4444805738d76a2699c4d3c95184ec
-- 
2.30.0.617.g56c4b15f3c-goog

