Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E38F10B0CA
	for <lists+linux-parisc@lfdr.de>; Wed, 27 Nov 2019 15:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfK0OC2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 27 Nov 2019 09:02:28 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37988 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfK0OC1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 27 Nov 2019 09:02:27 -0500
Received: by mail-qk1-f196.google.com with SMTP id b8so4618868qkk.5
        for <linux-parisc@vger.kernel.org>; Wed, 27 Nov 2019 06:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QiANxCdzbSnhcioCshDSncN9KNW/FPFbw4cOUMqmqeE=;
        b=ngfgP/ZTpPWsNp46WapVEeO/23UKqhQpYPxJU8Dc7TSCBLiuziZEFLNieXiEgVi/pK
         tGb3BLwoxViSQEurg9p1YJnhQF1sD9IHgHXkD4dFHyTfkGJsVJS4ua9HVSzdgPulEKos
         siwebeHBuryUKtLcjHPtFLBLXdDdua9RcF4wFtEbsdjZz6EHjLqTFvYW+vxzXB5jN+Bt
         ZlxupDjpq3KAjxtAiANabxP+G3KBnGAYg/VIaxmE3YgeSfvvmCL5Qj7pwJB7jsrY4fHt
         2De1tir7UzrXzumms27m8DxKOWYQoDT6QGUNDnwtE8ZizqoH8WZlW6euNObqwUQuAcY8
         Y8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QiANxCdzbSnhcioCshDSncN9KNW/FPFbw4cOUMqmqeE=;
        b=g7hTUXPNzEStbHrwOFiKu7K73j7r+xV7hTGTOtZ2hH11w+zfcrYfhyc/vZYqlyUjsh
         iChSNzznTNr+D2jx410Q26BXoJscPX3qpWu4W3SxlsQLOGC8btI1T73+oCi8bvy4JsXG
         Hep+n5XsT2+IQx+aXKg1qgvs2M5AsthJ+BRL0OjYEohzhlWhU06zu2XdqEH/VX3yJRzy
         Jb3Mn9Ni4g22MosxwBovXFLlcsVEGXjH38l5/ci2SFTlWuft+GpDcGD3n5u22/4KRnIr
         8Uwc2HtBd59NL27uws00RiHDFr3SxQapuhJJOybqfnyaGlyo7rb6xLTszPrQRksP9BJh
         LHGw==
X-Gm-Message-State: APjAAAUN23+UrL9J9OuruL8SyC0g8itOy85w4Gh5IrE30kmLFhhEUT+v
        fvrpllUIYYg9YSGQFMhHEE2Ip5oxaZjvPXsSoS3yBA==
X-Google-Smtp-Source: APXvYqzS6mlz4BCAYHUVdzb46ZrHHqG8DBfbMgLijDEeGXHUH+izQyzaEY6Dq5osj9QJojOwj5cAr/rMnM/acdv6l04=
X-Received: by 2002:a37:bdc3:: with SMTP id n186mr40399qkf.407.1574863346374;
 Wed, 27 Nov 2019 06:02:26 -0800 (PST)
MIME-Version: 1.0
References: <001a11441b6c6cb96c0569120042@google.com> <00000000000093ca84059853da04@google.com>
In-Reply-To: <00000000000093ca84059853da04@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 27 Nov 2019 15:02:15 +0100
Message-ID: <CACT4Y+Y1=+uGRNUk5G-m4vF4AhRTWRAngLJLGGiFmN_Y72sGeQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in ntfs_read_locked_inode
To:     syzbot <syzbot+19b469021157c136116a@syzkaller.appspotmail.com>
Cc:     anton@tuxera.com, deller@gmx.de, jejb@parisc-linux.org,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-ntfs-dev@lists.sourceforge.net, linux-parisc@vger.kernel.org,
        Andy Lutomirski <luto@amacapital.net>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Will Drewry <wad@chromium.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Nov 27, 2019 at 2:20 PM syzbot
<syzbot+19b469021157c136116a@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to:
>
> commit 910cd32e552ea09caa89cdbe328e468979b030dd
> Author: Helge Deller <deller@gmx.de>
> Date:   Wed Mar 30 12:14:31 2016 +0000
>
>      parisc: Fix and enable seccomp filter support

FWIW this commit somehow has an effect on x86 binary. I can reproduce
it. I've collected what I know so far here:
https://github.com/google/syzkaller/issues/1271#issuecomment-559093018
Well, actually it does not look like effect of this commit but rather
non-deterministic/hermetic kernel build.
+Al for affected x86 build bullshit

> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=143090dee00000
> start commit:   3e968c9f Merge tag 'ext4_for_linus' of git://git.kernel.or..
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=163090dee00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=123090dee00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7e8c053ac965e0dd
> dashboard link: https://syzkaller.appspot.com/bug?extid=19b469021157c136116a
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142d219b800000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143029db800000
>
> Reported-by: syzbot+19b469021157c136116a@syzkaller.appspotmail.com
> Fixes: 910cd32e552e ("parisc: Fix and enable seccomp filter support")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000093ca84059853da04%40google.com.
