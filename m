Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1C887165D
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 12:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732471AbfGWKmt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 06:42:49 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46772 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729836AbfGWKmt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 06:42:49 -0400
Received: by mail-qt1-f194.google.com with SMTP id h21so41331294qtn.13
        for <linux-parisc@vger.kernel.org>; Tue, 23 Jul 2019 03:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N4xK5veZG09uUkAaPdHZto+xy99VCECeBtRkb6sAB/w=;
        b=OyqEscqSIWL2Ugn6++0ThaejYaPcfl/dP0fdn5hCqlzc2t8pfoz4MlOM+Xk+asUoct
         FiUm+3v4NyN8dWanQRZOHvuh5rQJ4QISW2CWyzR9a5Tz+JBtFJarIIELRC4BbB06kQ++
         RWzcnK1JCTLL4xUeQVW2vm0rsnj/lhFeXdnqs/NnqZiJ+5pXfeqZWPu5e+FGNR5XRulB
         XixqlGZphAgJK5t/hATXnZ/7+a8ulp2QFZG4AQi7Z2Dj4gIDbeccDS6mayPtAfnSoDHV
         LAmH084ZChCjHBJz9D624JIk5SD3X8rsmTipwmIKwKRR5s8o5CvjTnS77zAlqHohoxau
         RXfQ==
X-Gm-Message-State: APjAAAVRAtAwYI6/xl3hOkzOVR80PdKtKDq3JCq97XPIGgQtAcjdzNqZ
        cSvBV7UIVROqrtZl0AHKiJt4Dw==
X-Google-Smtp-Source: APXvYqyaExRlYw/QlDd/NWuqasay2jAYk3JOBnWzJfjESy3cklpZQkiKPy3zfhsnVUYaS/Q/QI1fjQ==
X-Received: by 2002:a0c:d4d0:: with SMTP id y16mr52541534qvh.191.1563878568268;
        Tue, 23 Jul 2019 03:42:48 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
        by smtp.gmail.com with ESMTPSA id b7sm18536990qtt.38.2019.07.23.03.42.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 03:42:47 -0700 (PDT)
Date:   Tue, 23 Jul 2019 06:42:38 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     syzbot <syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com>,
        aarcange@redhat.com, akpm@linux-foundation.org,
        christian@brauner.io, davem@davemloft.net, ebiederm@xmission.com,
        elena.reshetova@intel.com, guro@fb.com, hch@infradead.org,
        james.bottomley@hansenpartnership.com, jglisse@redhat.com,
        keescook@chromium.org, ldv@altlinux.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-parisc@vger.kernel.org,
        luto@amacapital.net, mhocko@suse.com, mingo@kernel.org,
        namit@vmware.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk,
        wad@chromium.org
Subject: Re: WARNING in __mmdrop
Message-ID: <20190723062842-mutt-send-email-mst@kernel.org>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <75c43998-3a1c-676f-99ff-3d04663c3fcc@redhat.com>
 <20190722035657-mutt-send-email-mst@kernel.org>
 <cfcd330d-5f4a-835a-69f7-c342d5d0d52d@redhat.com>
 <20190723010156-mutt-send-email-mst@kernel.org>
 <124be1a2-1c53-8e65-0f06-ee2294710822@redhat.com>
 <20190723032800-mutt-send-email-mst@kernel.org>
 <e2e01a05-63d8-4388-2bcd-b2be3c865486@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2e01a05-63d8-4388-2bcd-b2be3c865486@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jul 23, 2019 at 04:42:19PM +0800, Jason Wang wrote:
> > So how about this: do exactly what you propose but as a 2 patch series:
> > start with the slow safe patch, and add then return uaddr optimizations
> > on top. We can then more easily reason about whether they are safe.
> 
> 
> If you stick, I can do this.

So I definitely don't insist but I'd like us to get back to where
we know existing code is very safe (if not super fast) and
optimizing from there.  Bugs happen but I'd like to see a bisect
giving us "oh it's because of XYZ optimization" and not the
general "it's somewhere within this driver" that we are getting
now.

Maybe the way to do this is to revert for this release cycle
and target the next one. What do you think?

-- 
MST
