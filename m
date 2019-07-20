Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1D16EEE9
	for <lists+linux-parisc@lfdr.de>; Sat, 20 Jul 2019 12:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbfGTKIB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 20 Jul 2019 06:08:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:34765 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbfGTKIB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 20 Jul 2019 06:08:01 -0400
Received: by mail-io1-f70.google.com with SMTP id u84so37542432iod.1
        for <linux-parisc@vger.kernel.org>; Sat, 20 Jul 2019 03:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=aIptGodPgqjQ+OCeW9XKeJdzrs6DHyh1FKeEsnaxVbM=;
        b=fLXt+AamjytqYhXM+Qn/dzAcEQ0Z4owvlR0ZRpJUahI2xCKv8HtMq8hPJt11UDMhco
         rNzvXer2NxL+1z4REUX1zJn8SiMUZH1Tizjo6++OHdw3PGA7HEDeWrpIRmAitwehgPOt
         Fba21TozTi6eErSOgoLKB0q2YPfY5CRvAnDVfKYz6EAf8rGAqu5oxgylnMZHMvEJfVFj
         FOPuW++ryRj4rn4CO5ePJQ1VDbm+KHup3e6BhjSMVVkhzlBbvUoJJRelVlJCLDoXrje2
         ybINY90pSh71ZPnQgpIbAckVZ4IOuGwREioPQkCew2TtUhcazsD/Z1opYpkpJ9lLSQCw
         rGyA==
X-Gm-Message-State: APjAAAViUAZAmjQtwFfgNvHvG0uDHb4Qflsh88NsIeP2wqPWSIhegMYE
        RVlUFhvK4wkjmFJWXzqFeIKIgmCZTOK9W1qqNYnqhPA2RuWL
X-Google-Smtp-Source: APXvYqxejQK5TJXgPG7zDzFOcVKgb6JtNNiEgaZkAwUZNQxIY+uT88/YtfjAsG3qEv0NnxidVHOC8aWEo8R9Py88FYjmq9+IoaCH
MIME-Version: 1.0
X-Received: by 2002:a6b:f90f:: with SMTP id j15mr48006883iog.43.1563617280803;
 Sat, 20 Jul 2019 03:08:00 -0700 (PDT)
Date:   Sat, 20 Jul 2019 03:08:00 -0700
In-Reply-To: <0000000000008dd6bb058e006938@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000964b0d058e1a0483@google.com>
Subject: Re: WARNING in __mmdrop
From:   syzbot <syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com>
To:     aarcange@redhat.com, akpm@linux-foundation.org,
        christian@brauner.io, davem@davemloft.net, ebiederm@xmission.com,
        elena.reshetova@intel.com, guro@fb.com, hch@infradead.org,
        james.bottomley@hansenpartnership.com, jasowang@redhat.com,
        jglisse@redhat.com, keescook@chromium.org, ldv@altlinux.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-parisc@vger.kernel.org,
        luto@amacapital.net, mhocko@suse.com, mingo@kernel.org,
        mst@redhat.com, namit@vmware.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk,
        wad@chromium.org
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149a8a20600000
start commit:   6d21a41b Add linux-next specific files for 20190718
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=169a8a20600000
console output: https://syzkaller.appspot.com/x/log.txt?x=129a8a20600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3430a151e1452331
dashboard link: https://syzkaller.appspot.com/bug?extid=e58112d71f77113ddb7b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10139e68600000

Reported-by: syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com
Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual  
address")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
