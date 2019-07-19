Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301126EB6C
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Jul 2019 22:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731137AbfGSUEB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Jul 2019 16:04:01 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:50085 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728724AbfGSUEB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Jul 2019 16:04:01 -0400
Received: by mail-io1-f72.google.com with SMTP id x24so35747066ioh.16
        for <linux-parisc@vger.kernel.org>; Fri, 19 Jul 2019 13:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=aPsM7izy0lsHgieRMKZNuSLjrGTa3/1dak1h6g1FuBU=;
        b=tsk104qnlkrWoTH+rEEPHuV4krvhQkOINz9B/67isAhv8ab1ZZSaFTkOdeRk0bh9yS
         vpMWMCOEu4FheoIgchnym2WiyRgaYqDVRJ3hMNKqJZyX07O6Yk/im4UaqvDIHXOhhj5n
         gnrpUKNFZT5t4zjryHetKHw+TA2Eqg9lLPvfcsedjPgJ1T7cetNYB/114PuSeOlHbRIS
         1oW+acXpWBOpO/PkIi8+379WS2xhaPaW/PAgjm03yyxJWMCG9FAuBzBVeS1pR6rG7oEE
         0iUQVVC8Aft3s9ieRKxas3OknXqWS8QA3smdJouHXUeiSjoqq7MLpGLC36uRoelE9XWW
         3SLQ==
X-Gm-Message-State: APjAAAVTgXyaXRwvYEEpEhfqZP1SkGv52ssukVa8zvW4dV1nBSrg8fCT
        UKF9qUVA3JkFB/dX+QXqJwlrT7C0I5AafLdNmxueIF35NCec
X-Google-Smtp-Source: APXvYqxidYggLhCDlKDPPoGD3FSWeBWxwtOzAyrvnQyzo3ixpa+XRzwDjKZfxioOdAVAMIp4fTiorW0EVPKAU++mh06/cyXjSy0g
MIME-Version: 1.0
X-Received: by 2002:a5d:87c6:: with SMTP id q6mr29436327ios.115.1563566640206;
 Fri, 19 Jul 2019 13:04:00 -0700 (PDT)
Date:   Fri, 19 Jul 2019 13:04:00 -0700
In-Reply-To: <00000000000045e7a1058e02458a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002c183d058e0e3abd@google.com>
Subject: Re: KASAN: use-after-free Write in tlb_finish_mmu
From:   syzbot <syzbot+8267e9af795434ffadad@syzkaller.appspotmail.com>
To:     aarcange@redhat.com, davem@davemloft.net, hch@infradead.org,
        james.bottomley@hansenpartnership.com, jasowang@redhat.com,
        jglisse@redhat.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-parisc@vger.kernel.org, mst@redhat.com,
        syzkaller-bugs@googlegroups.com
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11642a58600000
start commit:   22051d9c Merge tag 'platform-drivers-x86-v5.3-2' of git://..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=13642a58600000
console output: https://syzkaller.appspot.com/x/log.txt?x=15642a58600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d831b9cbe82e79e4
dashboard link: https://syzkaller.appspot.com/bug?extid=8267e9af795434ffadad
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d58784600000

Reported-by: syzbot+8267e9af795434ffadad@syzkaller.appspotmail.com
Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual  
address")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
