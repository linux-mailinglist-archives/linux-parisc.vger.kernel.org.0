Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960C2252B78
	for <lists+linux-parisc@lfdr.de>; Wed, 26 Aug 2020 12:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgHZKhJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 26 Aug 2020 06:37:09 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:45555 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgHZKhI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 26 Aug 2020 06:37:08 -0400
Received: by mail-il1-f199.google.com with SMTP id m80so1198206ilb.12
        for <linux-parisc@vger.kernel.org>; Wed, 26 Aug 2020 03:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=s+S1ybGzUd8iygNXODv3AXT+lmQWjeR11J2cV5mYm3w=;
        b=s/evPFFdCF4OFPW++7GixnHR0KG3bzSFEP0nvc/u32u7qp5CBLF5f5BBjdDgsgRLG5
         x7JgV6mUR43yybApZ3rlsw8/Yj7JkB4gwXqaoexdKeWtOyl1TLMrdtCzgMJ+AJl5C7ou
         pSgnt1KDCOWn2J1uYEcyxvy+A4zvmCMu2g/Yix60xiheXNf1NJXp5L21pzhFtsqOqot3
         0Dv6ZnLQfHaq7TyBsmQ55CdcBOrTomsG0uCi+I6d76rMQlB2aV7dMm8IXpaIWXNPavbR
         v7DK1VE4Rtq0SnMEVX6/yRcVtCoGm/DWXYdfvrgQfYw6cAg0zAqZMTP2Zk0qXcdpW2VK
         pT0A==
X-Gm-Message-State: AOAM530qOUgo4Ayoh+fdfvqeR6Aund/h2t3YOf6ol3mP06AwArEOl/vt
        UMH8TmetEI/OM3gxt/OITao2jCvmz/lqJ7CeruoYTbJbyvY7
X-Google-Smtp-Source: ABdhPJwFOkEQiQlcbrLBZrdR500P0BvYg8EmtIBu12QCrRopxNO8xUNUEPw9NT9y4coEXoVv2cQ5uxkxQoYT8AjUb6itEQrOVS2C
MIME-Version: 1.0
X-Received: by 2002:a92:9181:: with SMTP id e1mr12178268ill.274.1598438226931;
 Wed, 26 Aug 2020 03:37:06 -0700 (PDT)
Date:   Wed, 26 Aug 2020 03:37:06 -0700
In-Reply-To: <001a11441b6c6cb96c0569120042@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b636f005adc56621@google.com>
Subject: Re: KASAN: use-after-free Read in ntfs_read_locked_inode
From:   syzbot <syzbot+19b469021157c136116a@syzkaller.appspotmail.com>
To:     anton@tuxera.com, daniel@iogearbox.net, deller@gmx.de,
        dvyukov@google.com, jejb@parisc-linux.org, keescook@chromium.org,
        linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        linux-parisc@vger.kernel.org, luto@amacapital.net, sdf@google.com,
        songliubraving@fb.com, syzkaller-bugs@googlegroups.com,
        viro@zeniv.linux.org.uk, wad@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit f7c6cb1d9728dea9d9f131ef57303d6821afb0f8
Author: Stanislav Fomichev <sdf@google.com>
Date:   Wed Jul 29 00:31:03 2020 +0000

    bpf: Expose socket storage to BPF_PROG_TYPE_CGROUP_SOCK

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16480fa9900000
start commit:   3e968c9f Merge tag 'ext4_for_linus' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e8c053ac965e0dd
dashboard link: https://syzkaller.appspot.com/bug?extid=19b469021157c136116a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142d219b800000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143029db800000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bpf: Expose socket storage to BPF_PROG_TYPE_CGROUP_SOCK

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
