Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0613368B141
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Feb 2023 19:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjBESwT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Feb 2023 13:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjBESwS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Feb 2023 13:52:18 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488FE1C31F
        for <linux-parisc@vger.kernel.org>; Sun,  5 Feb 2023 10:52:17 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id gr7so28530962ejb.5
        for <linux-parisc@vger.kernel.org>; Sun, 05 Feb 2023 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FHO7GI+A1DWHNoRePsnR8I5+C4R4p3/7zIJvX3p+LUg=;
        b=HW9XJWDNzeOCSuB6xjuHzGjlFrFpNWXt04d038AYbQHAwGjnEJnVJFaDX127TnFYpL
         ydEGn0SwgrZ26RVkS0s0lgFAxMQXSWztEh7hBcLvV0G2Q3rBSAhctrbX0nTU4l9fQ760
         cFueFrfradqcL9O/I0nJrdeB83AKu6+dYCVG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHO7GI+A1DWHNoRePsnR8I5+C4R4p3/7zIJvX3p+LUg=;
        b=tt65f5AnJ6aZ21PJrFMmtlBuhTOTIPwL3YaypH+YGlBjIS45szgBXpA6J7rG84D8uE
         aPu+aA/gTqii0uMmoBBSWgxzQcZEe2mxXDI+jvV3CG1oCCo6Iy7v75Zjeplh2yIxtQhm
         jGSrLpxQNrrcvr3Se6QHX4CvRNtkrmSkGzeKWk3PsjFwi+og/NeEK3zkTgKhPBbyFd51
         zEShhQd2WfEzf04qKkCypuoq6JQWlZJHqn+J1xyvHk8lkkYlHYK78ruk5ShphGJtO7rK
         G8fVJclrMlvYFXkVsgUT/1VW2IgrMxY/LqfDJYjRMBfh2Jc1BiQmgqS5x3vRtOeyg546
         NrqA==
X-Gm-Message-State: AO0yUKWXuIBt1RvyxY8Gi1Kljcv1P2TRSfMKNvHdQVTeSiUFzi7b84UD
        H5vMBDVIsbC3IoyJUSI47QDSBoQwN2nxPLwwvCQ=
X-Google-Smtp-Source: AK7set8nijUqMFkrEQ3QfIpLytlsGjfiYtAyotdlq5lYeHPCLZkZdKwPlo3/WF+BQQEp1Rwz3jPg7A==
X-Received: by 2002:a17:906:d8d0:b0:84d:3403:f4f2 with SMTP id re16-20020a170906d8d000b0084d3403f4f2mr16825086ejb.62.1675623135595;
        Sun, 05 Feb 2023 10:52:15 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id q19-20020a17090622d300b0088a2397cb2csm4463043eja.143.2023.02.05.10.52.14
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 10:52:15 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id p26so28429026ejx.13
        for <linux-parisc@vger.kernel.org>; Sun, 05 Feb 2023 10:52:14 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4354270eje.78.1675623134603; Sun, 05
 Feb 2023 10:52:14 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV> <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org>
In-Reply-To: <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Feb 2023 10:51:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wirpn8qX5hCyeS0a4GCQH5p-2ACXgzJTj7zjZ5rGux_Bw@mail.gmail.com>
Message-ID: <CAHk-=wirpn8qX5hCyeS0a4GCQH5p-2ACXgzJTj7zjZ5rGux_Bw@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Feb 4, 2023 at 10:16 PM Finn Thain <fthain@linux-m68k.org> wrote:
>
> That could be a bug I was chasing back in 2021 but never found. The mmap
> stressors in stress-ng were triggering a crash on a Mac Quadras, though
> only rarely. Sometimes it would run all day without a failure.
>
> Last year when I started using GCC 12 to build the kernel, I saw the same
> workload fail again but the failure mode had become a silent hang/livelock
> instead of the oopses I got with GCC 6.
>
> When I press the NMI button after the livelock I always see
> do_page_fault() in the backtrace. So I've been testing your patch. I've
> been running the same stress-ng reproducer for about 12 hours now with no
> failures which looks promising.
>
> In case that stress-ng testing is of use:
> Tested-by: Finn Thain <fthain@linux-m68k.org>

Could you test the thing that Mark Rutland pointed to? He had an
actual test-case for this for the arm64 fixes some years ago.

See

   https://lore.kernel.org/all/Y9pD+TMP+%2FSyfeJm@FVFF77S0Q05N/

for his email with links to his old test-case?

                Linus
