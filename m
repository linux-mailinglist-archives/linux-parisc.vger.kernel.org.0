Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A23B410B008
	for <lists+linux-parisc@lfdr.de>; Wed, 27 Nov 2019 14:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfK0NUC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 27 Nov 2019 08:20:02 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:39896 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfK0NUC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 27 Nov 2019 08:20:02 -0500
Received: by mail-io1-f70.google.com with SMTP id u13so13407171iol.6
        for <linux-parisc@vger.kernel.org>; Wed, 27 Nov 2019 05:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Dieb0lQvqlt6xFxUKoKJqEpe6Eum8R1EEaj/3uLPMYk=;
        b=N+HHCjg+vCgAvdyVyXcGW0GsfDxEMLI9MRL4BT5tqEOfCqktAs/lh0K6Pty5wlo+hQ
         TyWF/z1Q6egZp3SZuGSic4ZQXItTn92Ltg0OfVerw3Y3j2FmReKIAHznzJEA8JFVObP4
         1n65XM6iibTctYP+AyIDe66GDvM9r6ih4kKkuO9ecQc24yZ7pvlNRHsHH5BLIsnhEDoy
         hR3FavLbF8KQR0hS0cN0csQq8lLwAeGB1Y+HPgI+bUcvLeyQJJXti+fFWwGYS632q7bx
         CqtjkvcimXT7nCRDfP2zAzPOj2RZXaCI60LF8DAx9NsNxC5fmJ0ghdXdPgtfyE147o5f
         ICXA==
X-Gm-Message-State: APjAAAUo8aTh6WrYytxQn9dcmV2n63xklw0nBtLiW4+7p6xtEr6VXNOJ
        UyurqDH1xmqS8nCcS2CcHbR3epGBQmzNcdVe2mhu9jyAAPcW
X-Google-Smtp-Source: APXvYqyLYMnPvrXLLHZp8gVP46nF3bGzrcXU111CNvKZooaehsGZ3tFx1Dz3uSdNW9AoXotiFgnLwnoRKF4IoeWFZEIVBi2ovtIo
MIME-Version: 1.0
X-Received: by 2002:a6b:c0c2:: with SMTP id q185mr2514112iof.280.1574860800376;
 Wed, 27 Nov 2019 05:20:00 -0800 (PST)
Date:   Wed, 27 Nov 2019 05:20:00 -0800
In-Reply-To: <001a11441b6c6cb96c0569120042@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000093ca84059853da04@google.com>
Subject: Re: KASAN: use-after-free Read in ntfs_read_locked_inode
From:   syzbot <syzbot+19b469021157c136116a@syzkaller.appspotmail.com>
To:     anton@tuxera.com, deller@gmx.de, jejb@parisc-linux.org,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        linux-ntfs-dev@lists.sourceforge.net, linux-parisc@vger.kernel.org,
        luto@amacapital.net, syzkaller-bugs@googlegroups.com,
        wad@chromium.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

syzbot has bisected this bug to:

commit 910cd32e552ea09caa89cdbe328e468979b030dd
Author: Helge Deller <deller@gmx.de>
Date:   Wed Mar 30 12:14:31 2016 +0000

     parisc: Fix and enable seccomp filter support

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=143090dee00000
start commit:   3e968c9f Merge tag 'ext4_for_linus' of git://git.kernel.or..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=163090dee00000
console output: https://syzkaller.appspot.com/x/log.txt?x=123090dee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e8c053ac965e0dd
dashboard link: https://syzkaller.appspot.com/bug?extid=19b469021157c136116a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142d219b800000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143029db800000

Reported-by: syzbot+19b469021157c136116a@syzkaller.appspotmail.com
Fixes: 910cd32e552e ("parisc: Fix and enable seccomp filter support")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
