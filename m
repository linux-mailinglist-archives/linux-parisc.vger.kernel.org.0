Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67AD0704ED
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jul 2019 18:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfGVQEw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jul 2019 12:04:52 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45085 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729582AbfGVQEv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jul 2019 12:04:51 -0400
Received: by mail-qt1-f195.google.com with SMTP id x22so34118759qtp.12
        for <linux-parisc@vger.kernel.org>; Mon, 22 Jul 2019 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vwvk1p704PvrHoU3x+syVrBIr03+GtruOtffq5nOmqI=;
        b=eCJDQVgp/TUa3SJDw5YNpJdxoRLDUf0uKWF8HiEN2E6tOilw6te7IXdJ74mZFUYqp/
         9cs4iQsc0KiVAOncyf/4OEnDeZsuNdAdxwUKQmiZzySVbAR5OjTuhXiGRkV1rgBYswjM
         IQx0Ulu4NMDBwDAviDS9g4pKXJW+xpv+Iy8d6aVLlz84ufr1JzYd1aeEamQT0VorPgKU
         QT1i21qMa2c8H2+8UBfm4o25QcGgTYS7VKw/3eTMHAe7UkpWzGXLekAdlCSWusHGhsa8
         cEkwa4My8xWUN30i19bWw4qGMFPnC91vuvyuUJqr/Slt5ziIHR7WpgLw+5d/ULuZjsfk
         lFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vwvk1p704PvrHoU3x+syVrBIr03+GtruOtffq5nOmqI=;
        b=fVCYwsDyP7gCf3lG53WGYHFh/kTy9wGu2rtAmARpNazQlVTCN71hliL9spgu2UQZiE
         D3NWv2qrgtMotYwgX6jTll4R6Y0OkT9tVNmTK/4sz7LQYfy+Z40gKlhJevLAzussV0lS
         gEgr06BkRyEQMIB5d/zmCfSr2ZhLWbf7uGgggPS6vL9BW4Nc/s84eLz2AAaEwkEsagK9
         lsnx3bq/wkd9WPRtjG9nP6S6WHFy2Q3ZU4jiGcYLeDQlUcF6GaYgD8HP1WSRZY+DBnpz
         R+FxIomq4X2lUyAxBKgqLfQTgv3Gd5j085cIp62QuytWxULT4SFJfn8+SVe+7ryjBukJ
         e0dw==
X-Gm-Message-State: APjAAAVupa3pTk888OLq7N+ayH80wxYtNaU08NpDaqxyrgApUJcHedzA
        lzkctrMKMji4yaGtIiNUJXYfwg==
X-Google-Smtp-Source: APXvYqwAqmiUCOGD8gRTdb/gKf382wokrezGvhSEToPpHN31WEGoX97JjGxgPReHba9ZDH0CrbO+rw==
X-Received: by 2002:ac8:431e:: with SMTP id z30mr50035442qtm.291.1563811490053;
        Mon, 22 Jul 2019 09:04:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id y3sm20100502qtj.46.2019.07.22.09.04.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 09:04:49 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hpanw-00059A-U7; Mon, 22 Jul 2019 13:04:48 -0300
Date:   Mon, 22 Jul 2019 13:04:48 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, aarcange@redhat.com,
        akpm@linux-foundation.org, christian@brauner.io,
        davem@davemloft.net, ebiederm@xmission.com,
        elena.reshetova@intel.com, guro@fb.com, hch@infradead.org,
        james.bottomley@hansenpartnership.com, jasowang@redhat.com,
        jglisse@redhat.com, keescook@chromium.org, ldv@altlinux.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-parisc@vger.kernel.org,
        luto@amacapital.net, mhocko@suse.com, mingo@kernel.org,
        namit@vmware.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk,
        wad@chromium.org
Subject: Re: RFC: call_rcu_outstanding (was Re: WARNING in __mmdrop)
Message-ID: <20190722160448.GH7607@ziepe.ca>
References: <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <20190721081933-mutt-send-email-mst@kernel.org>
 <20190721131725.GR14271@linux.ibm.com>
 <20190721210837.GC363@bombadil.infradead.org>
 <20190721233113.GV14271@linux.ibm.com>
 <20190722035042-mutt-send-email-mst@kernel.org>
 <20190722115149.GY14271@linux.ibm.com>
 <20190722134152.GA13013@ziepe.ca>
 <20190722155235.GF14271@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722155235.GF14271@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jul 22, 2019 at 08:52:35AM -0700, Paul E. McKenney wrote:
> So why then is there a problem?

I'm not sure there is a real problem, I thought Michael was just
asking how to design with RCU in the case where the user controls the
kfree_rcu??

Sounds like the answer is "don't worry about it" ?

Thanks,
Jason
