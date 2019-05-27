Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFCC12BAC6
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 21:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfE0Tf7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 15:35:59 -0400
Received: from mail-yb1-f170.google.com ([209.85.219.170]:39923 "EHLO
        mail-yb1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfE0Tf7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 15:35:59 -0400
Received: by mail-yb1-f170.google.com with SMTP id a3so6954446ybr.6
        for <linux-parisc@vger.kernel.org>; Mon, 27 May 2019 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kc/RmcCw4lIKmiWWeTI/jQbyDSacVGDFUWBKirdagJY=;
        b=ex+/QcGD2qn/WlsIq3pOiOyoOrqncaek0m5vKOnQNzNk7kt2OSLyeFlDU7YaDuc6kJ
         3OBzCFwAbdLe6v+izGm27iqJlS70ybhL3o3d4gAJsJeglIraK26UoNFRyaOOLvYQ+Fhg
         dLKLRqUqxeazkp4vMItYbsaIjavhHrE3mORzLSa+bP7qJCZvKt0eTgTNran5aCoa69mi
         Q3fd3O+4QiXCTKmlG/uRd/M65cgBxhPcQpnPA6syEG0PLPKev4D/00TmM/slmho0LQIn
         UWkscpdVCcNoBIV8/qt22Vt2b0JAD1ctVQ42bA32mwlxLwz4K3KVSbBjcAEhBUuRdFRu
         0yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kc/RmcCw4lIKmiWWeTI/jQbyDSacVGDFUWBKirdagJY=;
        b=F3kXrMG57fiXHMsYoMPgj3lo0OPunVShr0B4IE/w2eAyrXbKz4PzH5h0XcCus+3Zpp
         2S/wd4neEQlC6so2WfYInKF8smERKv1zqCvMVPLINVEKWvDf/Gj6F1ZESwEyDey/RbFH
         N3XlOn2+EOeQDN6RXCvB125ZrFpsctEzPjNbiQQmu+8eX9mQJ/NE8igzwiLGBhbuN4Ef
         tZZVq/kiAnxgJenl0r+O+CQ8X1Y2B9Gp2E6Akshz2eJ5g/XWiBPt08FYDz3onLRqUqPS
         NA/2YVhALjyckMNv31ko3R7C9aJ4Y6rcvXnkfqip/7+KIs4E0GhAoptdvmPHgP5N1QFQ
         eIjg==
X-Gm-Message-State: APjAAAWFlMevNyQHlaA4NU/w4Rf30kQhv+laFyv04jiG/YZSex1YcGvM
        4W2z6Fh8gtVITnN3EHVoUXIFxK/nF0Yjyt0ZRwA=
X-Google-Smtp-Source: APXvYqwgC8igw8z5+1xep2kQr743VpbknAR/KJosDWYstmh8UWtIUGGfgA4q3a0SIitPvz14MZGajKvtBcSVCqR9tTI=
X-Received: by 2002:a25:81cc:: with SMTP id n12mr5973368ybm.382.1558985758282;
 Mon, 27 May 2019 12:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190527192000.GA17551@ls3530.dellerweb.de>
In-Reply-To: <20190527192000.GA17551@ls3530.dellerweb.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Mon, 27 May 2019 21:35:54 +0200
Message-ID: <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

isn't possible to burn the flash in the C3600 machine with the
firmware of C3750?
these two look similar.
