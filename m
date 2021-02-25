Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3CDB325895
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Feb 2021 22:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbhBYVYa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 25 Feb 2021 16:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbhBYVY3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 25 Feb 2021 16:24:29 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 787DDC061756
        for <linux-parisc@vger.kernel.org>; Thu, 25 Feb 2021 13:23:48 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id b15so4311684pjb.0
        for <linux-parisc@vger.kernel.org>; Thu, 25 Feb 2021 13:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zl7BGuEjRmRiIwCyoaPfFxWDxWG1s1pkq54saj9Pb+Q=;
        b=ZvNpz1SLjAkZXy8QFcEi+pMYA09UJhW69MDf1cOmpIxOH3XnIdEDjr2XcCN1KRj7q4
         0+8oqrrbbznjDHZAbrrfsI5TxEfwK+gmT/c5obSSzCBCfWUW98aAX+cY21BFv56e3XQb
         6tWKVweUE0lw6nSI5oUA4Pt4KQU6PZ1AgL3hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zl7BGuEjRmRiIwCyoaPfFxWDxWG1s1pkq54saj9Pb+Q=;
        b=hA8jDoI7yJy4LrQbxbGpUjI0QLtxFcXRliiLPZl/ZfI4mnC7FRudPsT7qhPbiOj5dq
         Tfd+JwhmlXhRSkO/Cl2SUYONu3Pqiwej3MzVSmrxuo53yH1Wxt/gICYkxWZ0x6WDeVCq
         aX3b82EcUccJh4lNI6BMHf5rG3ZhSFIYHdl8nFhGkMbzCF5lCxodSetzXQ3RBBD9+wwC
         DOQQ2Nmh9Rca56wVvgKKAaogvnIe0EH2ow6+DtoAJerpftHVq13mCZi5RbtLZnjvmAoT
         YAq90Q1uBE5xOl9Vpo9+J4XmmsWwtbGXeRcWlMiBwEevomQA/xl58FRVTpnI5Y+mpfoI
         Oivg==
X-Gm-Message-State: AOAM533f7p1CKoPJX6Le6CG3pYhAOME7MtGvULYDUXFJb0zL0+dRSKTt
        uYMLTZAfRJN04UWyqg/lf/oQ5Q==
X-Google-Smtp-Source: ABdhPJzl9SAZt3si9WtKf9YFkozO0evA7KE3UpvwhBd7Ug15yhD53/Z0pLqAt16pwyHfzB0nuyw8nw==
X-Received: by 2002:a17:902:9a46:b029:e2:f97b:47da with SMTP id x6-20020a1709029a46b02900e2f97b47damr4422664plv.77.1614288228089;
        Thu, 25 Feb 2021 13:23:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z16sm6550218pgj.51.2021.02.25.13.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:23:47 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Sami Tolvanen <samitolvanen@google.com>
Cc:     Kees Cook <keescook@chromium.org>, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: Re: [PATCH v2] parisc: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date:   Thu, 25 Feb 2021 13:23:40 -0800
Message-Id: <161428814140.2305182.15838957882450280547.b4-ty@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210224225706.2726050-1-samitolvanen@google.com>
References: <20210224225706.2726050-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 24 Feb 2021 14:57:06 -0800, Sami Tolvanen wrote:
> parisc uses -fpatchable-function-entry with dynamic ftrace, which means we
> don't need recordmcount. Select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
> to tell that to the build system.

Applied to kspp/clang-lto, thanks!

[1/1] parisc: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
      https://git.kernel.org/kees/c/3d1dc719bca9

-- 
Kees Cook

