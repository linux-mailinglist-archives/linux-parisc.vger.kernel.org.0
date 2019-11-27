Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60CD110A7B5
	for <lists+linux-parisc@lfdr.de>; Wed, 27 Nov 2019 01:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfK0A7P (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 26 Nov 2019 19:59:15 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40076 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfK0A7O (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 26 Nov 2019 19:59:14 -0500
Received: by mail-io1-f67.google.com with SMTP id b26so20958189ion.7
        for <linux-parisc@vger.kernel.org>; Tue, 26 Nov 2019 16:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=VbU/38+yNJ+zfC9u+frCXiwxMQpfNcWxp5XLS8niF1A=;
        b=A10E0Zkk+zRrcOORDMMGCsKvy9BHFgf9FxT8Q5Z+F9T0wHGy8ix5R/AeW+qpfr2BLY
         AuSpKXkAJKbWFrfzzgtr9gXIip0OYbus86/WG9/IaIKfRq2eNqfUL4oW0gSl7kAGiLKC
         hpLn9uWQyeaELHETva1e3D83DjU/edfu7aUWAOAV7ru9LRkEs1dfRabuSYfIFDcLaDFu
         IReRx9b2JQ1INbGgMuTdZECfpMi3o8NeOqWOkz82VQhy4PIh54PN+jRYK96gnq2z7w4q
         ywrDF0yv5vR+B5AzLX9VjE216xTiY7ZcEEGWPiRNZbxy8JRTu5eTmdXKEHIE7XLW7Xbq
         V6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=VbU/38+yNJ+zfC9u+frCXiwxMQpfNcWxp5XLS8niF1A=;
        b=luuEGlPMoGYHD58ZAV+ol7+nAGE6NbDACPC6tuexpn2VtY7Ee99OPwnPdjS/gwGeMD
         hFdzfx2KrAxWy2UcujT2+8TqgJ44cToYoaV11NjX9e+kdJI2V+goUGo9figvwhrkrkFM
         nm6Cd3uv7RjFPRSlpuiTE1UYdFF062biPbzkfKztjtkuGUX/wuSDdugIc8rZH5n2ri96
         UNTNbTZEOoWwsx5Ji1n2Z1K5a2ZS6pVh70GgSZeZK3ttoingeMyFqHBcT5cCYKe3YeiB
         OzKSN+c+YM57ksP9q4/SQtfJxLL+y5WeVrhmKVAM6Xzpd3uq8y4tUPbISq7B4C6r90fv
         8UtQ==
X-Gm-Message-State: APjAAAX52CZz8HwG7NI+65k3+vz+j7k1TBgFsZExlLiIKIlqLCsCWOxX
        hr58HrpO8VY7IAa6oO3SakT2Ww==
X-Google-Smtp-Source: APXvYqxCcCkr//QkJqo4RilDXTt5UmXBfkRr7b/U5pz2/bN55Ik8XDB5pe77KNzYh8fyijKcertCWA==
X-Received: by 2002:a5d:9b08:: with SMTP id y8mr36537219ion.108.1574816354041;
        Tue, 26 Nov 2019 16:59:14 -0800 (PST)
Received: from localhost (67-0-26-4.albq.qwest.net. [67.0.26.4])
        by smtp.gmail.com with ESMTPSA id k20sm3215043iol.3.2019.11.26.16.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 16:59:12 -0800 (PST)
Date:   Tue, 26 Nov 2019 16:59:11 -0800 (PST)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Kees Cook <keescook@chromium.org>
cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        David Abdurachmanov <david.abdurachmanov@sifive.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@suse.de>, bpf@vger.kernel.org,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        kernel test robot <rong.a.chen@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
        Martin KaFai Lau <kafai@fb.com>, netdev@vger.kernel.org,
        Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tycho Andersen <tycho@tycho.ws>,
        Tyler Hicks <tyhicks@canonical.com>,
        Will Drewry <wad@chromium.org>, x86@kernel.org,
        Yonghong Song <yhs@fb.com>
Subject: Re: [GIT PULL] seccomp updates for v5.5-rc1
In-Reply-To: <201911260818.9C5DC1E@keescook>
Message-ID: <alpine.DEB.2.21.9999.1911261656110.23039@viisi.sifive.com>
References: <201911260818.9C5DC1E@keescook>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 26 Nov 2019, Kees Cook wrote:

> Most notably, the secure_computing() prototype has changed (to remove an 
> unused argument), but this has happened at the same time as riscv adding 
> seccomp support, so the cleanest merge order would be to merge riscv 
> first, then seccomp with the following patch for riscv to handle the 
> change from "seccomp: simplify secure_computing()":

The RISC-V pull request that contains the seccomp change has been sent.  
It's here:

https://lore.kernel.org/linux-riscv/alpine.DEB.2.21.9999.1911261311520.23039@viisi.sifive.com/T/#u


- Paul
