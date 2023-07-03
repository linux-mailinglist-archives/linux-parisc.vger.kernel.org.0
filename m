Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 195F77463AB
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 22:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjGCUHI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jul 2023 16:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbjGCUHH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jul 2023 16:07:07 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF26310C3
        for <linux-parisc@vger.kernel.org>; Mon,  3 Jul 2023 13:06:59 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b699a2fe86so80627611fa.3
        for <linux-parisc@vger.kernel.org>; Mon, 03 Jul 2023 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688414818; x=1691006818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V2f6CeVEYoIPtaOwjl6002xqVQVMjkJu/zyh9V6eFF8=;
        b=GbiixYMXHHXBZ0ltURl5XxNTqpskB/3OMUg048je69dh8+JxT+T3r3eD/BqXas7qYx
         LKkcIDq7y/pUlsz4WpX8ZJTeHGxZLHf9mvTDcVOFURBp4WqoIk04HaoSVd0PKmu5UGG6
         98/OkPcPED5fnoVN38EEWY7PfST/j4SohBbU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688414818; x=1691006818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2f6CeVEYoIPtaOwjl6002xqVQVMjkJu/zyh9V6eFF8=;
        b=atCi5s3PxbynJzQt2ALXb0g99UPMitqQrG0q0eQafUcdUxdffm//uWkJbIobEGdTPg
         vo9+RjavHmC7NKVy78oOqNIxBFX4xNje2puiEXv3hSFXu+o3zAuXURK8CwMcfYm27fX9
         m+j+nkUoWPUtXPC/9kNAkwR8TOzrv7wS8oJH/lmpFrrLDBXBg2HYV3ubVbDykJdtQ7i0
         bEeVTuAHU7CFvxCLOBms6lUmiB9PCHJWT9ZRoPGqMA241wER+wYCC5gx9KFS0iAS+PFs
         hMSZRoaEvx0dKtiAr1ZdH3oXuOk7CuIAK9HyPX2mXyDa7dCts6wA3E6XDnOL/Y0TkFE/
         UZMg==
X-Gm-Message-State: ABy/qLawbLY85XtimsV8Bi6l7L2rPiMjlabyYhfUKkBkMgRZCsFSXGmM
        jtfn10+xI+EYzZBOJ8X7oIv6n8DTgtwkny0BO2rgrVWY
X-Google-Smtp-Source: APBJJlHcF7Q2UUVUZz4nQj4QH9QA1KgfDWuajl/NyEMK4fcuumxLxR/r/0GpiHzMkMuEkWMEATPAPw==
X-Received: by 2002:a05:6512:746:b0:4fa:ad2d:6c58 with SMTP id c6-20020a056512074600b004faad2d6c58mr6740138lfs.61.1688414818176;
        Mon, 03 Jul 2023 13:06:58 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id p18-20020aa7d312000000b0051a2d2f82fdsm11067320edq.6.2023.07.03.13.06.56
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 13:06:56 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-51d9695ec29so4561792a12.1
        for <linux-parisc@vger.kernel.org>; Mon, 03 Jul 2023 13:06:56 -0700 (PDT)
X-Received: by 2002:aa7:d71a:0:b0:51e:bf2:6c70 with SMTP id
 t26-20020aa7d71a000000b0051e0bf26c70mr2952942edq.39.1688414816375; Mon, 03
 Jul 2023 13:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <ccadf5d7-e22a-ab5b-21e8-18a788251845@redhat.com>
In-Reply-To: <ccadf5d7-e22a-ab5b-21e8-18a788251845@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Jul 2023 13:06:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=vEtN54KzMHDrguaS8zNg4ppoFP4mm7vVThotGo53nQ@mail.gmail.com>
Message-ID: <CAHk-=wj=vEtN54KzMHDrguaS8zNg4ppoFP4mm7vVThotGo53nQ@mail.gmail.com>
Subject: Re: [PATCH] parisc: fix inability to allocate stack pages on exec
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Vegard Nossum <vegard.nossum@oracle.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Frank Scheiner <frank.scheiner@web.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave@parisc-linux.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-parisc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, 3 Jul 2023 at 12:59, Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> The patch 8d7071af8907 ("mm: always expand the stack with the mmap write
> lock held") breaks PA-RISC.
>
> The breakage happens if we attempt to pass more arguments to execve than
> what fits into the initial stack page - we get -E2BIG in such a case.
>
> The reason for the breakage is that the commit 8d7071af8907 adds the test
> "if (!(vma->vm_flags & VM_GROWSDOWN)) return -EFAULT;" to the function
> expand_downwards.

Heh. See

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f66066bc5136f25e36a2daff4896c768f18c211e

which fixes this differently (and, I think, much better).

Just removing the VM_GROWSDOWN test will actually break some of the other users.

Notably the new and improved expand_stack() function that now handles
all the complicated *cough*ia64*cough* cases automatically, which
allowed unifying the page fault handling code around this area.

              Linus
