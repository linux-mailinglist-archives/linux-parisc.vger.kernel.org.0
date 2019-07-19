Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D258F6E8DA
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Jul 2019 18:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbfGSQeB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Jul 2019 12:34:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:43579 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729228AbfGSQeB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Jul 2019 12:34:01 -0400
Received: by mail-io1-f70.google.com with SMTP id q26so35116482ioi.10
        for <linux-parisc@vger.kernel.org>; Fri, 19 Jul 2019 09:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=K0tO5uO221nvtR7gnlqeSa9IqFZGmt58DDiOBmYEiu8=;
        b=gNlh4J9LXikYcPe6hpRIWa1Toxtbc2lJACJTIeW/vVeerWnUGNeBjia8Y2RX0dPjSG
         p+J/WT/u7DDWs2bJVEvGMvqza2qHTp7NV8mEnAYx+2WWwAs7K5n5qa0y9sEo5tci5SZf
         RSkxr/3xLY0l7IkGjxYrUk6ARZJ+HmlFNp1TbprmsOuvyJS2wOE5XDYEkc3BnrGV1HeV
         hPUMhaVe2wXkDMHLD4tb1Nqc9Be9bfExRsAIP1YKuVo1MhRj8LF7UR35SW6X0QJzwJVe
         eg1K/vXa2GUyJ8pxgFIB2VHf8GynyOhwMQuUBCat9KnDvcDjsAeTmaQeACQamb1DKd7x
         Pslg==
X-Gm-Message-State: APjAAAWKcOrEicGV/d0swYxWwKDfB1dMMdvomcnGs+9soya+JevLaVMn
        D3oM7KHOEuhnLtf+7zr3CA7Wl2G+IEqJ8rX1jTEdTEd3Wyh3
X-Google-Smtp-Source: APXvYqzXnjpSQV9iFQbyh8yurehonYeDVnnn919X9PLqsJYbWXJy2VpoCVH3ZDalQ76trhEOtpL1aMd4nm27xBBAS+sOD1mk8YpL
MIME-Version: 1.0
X-Received: by 2002:a5d:8c87:: with SMTP id g7mr47222471ion.85.1563554040200;
 Fri, 19 Jul 2019 09:34:00 -0700 (PDT)
Date:   Fri, 19 Jul 2019 09:34:00 -0700
In-Reply-To: <000000000000490679058e0245ee@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000027494e058e0b4b3f@google.com>
Subject: Re: KASAN: use-after-free Read in finish_task_switch (2)
From:   syzbot <syzbot+7f067c796eee2acbc57a@syzkaller.appspotmail.com>
To:     aarcange@redhat.com, akpm@linux-foundation.org,
        christian@brauner.io, davem@davemloft.net, ebiederm@xmission.com,
        elena.reshetova@intel.com, guro@fb.com, hch@infradead.org,
        james.bottomley@hansenpartnership.com, jasowang@redhat.com,
        jglisse@redhat.com, keescook@chromium.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-parisc@vger.kernel.org,
        luto@amacapital.net, mhocko@suse.com, mingo@kernel.org,
        mst@redhat.com, namit@vmware.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, wad@chromium.org,
        yuehaibing@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

syzbot has bisected this bug to:

commit 7f466032dc9e5a61217f22ea34b2df932786bbfc
Author: Jason Wang <jasowang@redhat.com>
Date:   Fri May 24 08:12:18 2019 +0000

     vhost: access vq metadata through kernel virtual address

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=123faf70600000
start commit:   22051d9c Merge tag 'platform-drivers-x86-v5.3-2' of git://..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=113faf70600000
console output: https://syzkaller.appspot.com/x/log.txt?x=163faf70600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=135cb826ac59d7fc
dashboard link: https://syzkaller.appspot.com/bug?extid=7f067c796eee2acbc57a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12c1898fa00000

Reported-by: syzbot+7f067c796eee2acbc57a@syzkaller.appspotmail.com
Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual  
address")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
