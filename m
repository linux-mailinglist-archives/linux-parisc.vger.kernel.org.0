Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8AE37871B
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Jul 2019 10:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfG2IQB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 29 Jul 2019 04:16:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:56693 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfG2IQB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 29 Jul 2019 04:16:01 -0400
Received: by mail-io1-f69.google.com with SMTP id u25so66319262iol.23
        for <linux-parisc@vger.kernel.org>; Mon, 29 Jul 2019 01:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=0rPakemNyIs9fbLrhB6s/ulRRU21c/3n0kSBtdCA0Eo=;
        b=L8LM9zAfuwGsHzHE4p94vqf+dXZKY73/tiIp2TM41MAdU6SrC2VKjHBHu55HUFQy5v
         /UBrkR7E00AqrB5LC3m3T8SImq5bbUthE0g/HYktc54+qn+PvrCox+cYkh4ZuHF0SLK0
         BvTyNOatYAbpQcPJL3OiURXcPTuiPeKC6YkfRNq0lQ9ujSDD7qIWN3DD3j2/68CyWAbc
         pHteb+Bun254sNQ0rHsp6mJNdeFFsiwuL+7EfGQfYUss3tf3PU+tGxkQ3g/qVf3GV++I
         HosGFv+udchYq8auOTX60zE6znIq3ixbO7sTlOs4/7wdSpGy7tcYW1FxM9IaNSMovMYb
         WxrQ==
X-Gm-Message-State: APjAAAUDHMHdCE1hotrEA3Dx0naEYUHT33bK8NWM0RMzN/M+rOgwbsw/
        ghWc9zvh0wyTXxqwdDqwVCZXZgIrCj13TmwqAUcHjzOW+U1B
X-Google-Smtp-Source: APXvYqxSkxuHca0jLTiQmdMdnlp+TfywXlCfVmn/nxBSNrXe+PgHcKdxjXDq/A4yJcJjcL3n5aaCmQIspC/xzgAeN42nGa5pW21x
MIME-Version: 1.0
X-Received: by 2002:a5d:994b:: with SMTP id v11mr53971532ios.165.1564388160200;
 Mon, 29 Jul 2019 01:16:00 -0700 (PDT)
Date:   Mon, 29 Jul 2019 01:16:00 -0700
In-Reply-To: <0000000000005718ef058b3a0fcf@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000094699a058ecd8017@google.com>
Subject: Re: memory leak in __nf_hook_entries_try_shrink
From:   syzbot <syzbot+c51f73e78e7e2ce3a31e@syzkaller.appspotmail.com>
To:     catalin.marinas@arm.com, coreteam@netfilter.org,
        davem@davemloft.net, deller@gmx.de, fw@strlen.de,
        jejb@parisc-linux.org, kadlec@blackhole.kfki.hu,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-parisc@vger.kernel.org, mingo@redhat.com,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        pablo@netfilter.org, rostedt@goodmis.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

syzbot has bisected this bug to:

commit fc79168a7c75423047d60a033dc4844955ccae0b
Author: Helge Deller <deller@gmx.de>
Date:   Wed Apr 13 20:44:54 2016 +0000

     parisc: Add syscall tracepoint support

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16ad2cd8600000
start commit:   b076173a Merge tag 'selinux-pr-20190612' of git://git.kern..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=15ad2cd8600000
console output: https://syzkaller.appspot.com/x/log.txt?x=11ad2cd8600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb38d33cd06d8d48
dashboard link: https://syzkaller.appspot.com/bug?extid=c51f73e78e7e2ce3a31e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=105a958ea00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=103c758ea00000

Reported-by: syzbot+c51f73e78e7e2ce3a31e@syzkaller.appspotmail.com
Fixes: fc79168a7c75 ("parisc: Add syscall tracepoint support")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
