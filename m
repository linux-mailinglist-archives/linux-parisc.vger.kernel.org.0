Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65FF77035A
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jul 2019 17:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbfGVPOn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jul 2019 11:14:43 -0400
Received: from mail-pg1-f179.google.com ([209.85.215.179]:34396 "EHLO
        mail-pg1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbfGVPOn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jul 2019 11:14:43 -0400
Received: by mail-pg1-f179.google.com with SMTP id n9so11587647pgc.1
        for <linux-parisc@vger.kernel.org>; Mon, 22 Jul 2019 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i8M6AK4de9Ik8pIGK7ZSAo/fkLcx89Rz2FU4ueU7AtI=;
        b=XQ0f5nx8fa3pklvdGG2u9IOZZJTUyDUTYVVk+sNJ3SCJPR77BhV8NbHcipLbVy1xvT
         Slg0Se3QHTC0ZyO53T8oEMnYmpMj/IpwJ3J26/3ycCvlPIjGxwvchFbXcMJqk0o/mpqq
         1Yt0CuEo1ILTMuVgHTe5nTzixjn08mjGXwYpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i8M6AK4de9Ik8pIGK7ZSAo/fkLcx89Rz2FU4ueU7AtI=;
        b=T7Gbi7QjmVpCY6Gux9Um0cTlTttR+2IwZ7KPOFczvtfnZLQRHVJKtIfjFj4lvzWVlQ
         B88bsP2mjK8law1pidYU3KWAf0vZQncVKrtEecH/71578JxSGzFuUM0MClo3DrIYp3fN
         Hr9RfeSNAJr/1Wj6LZ1b4ZG7kr619okJ+eEoXe0Avg87dbBlhqYYSfKTcE9jXCcOQyCM
         p8rfXQH+JEY8bSGtzJ5WrTIyZhijyKuj4aq6JWn6nThrkZjQykmk8MyVkP8KCXAFC5Vx
         hVxzkm3SfFp0UQE+8S9/n1OvdYcy+N9iSEgzAIqqMOewCZGjEKpTRA5ovQjjR9PdfHIg
         HBpg==
X-Gm-Message-State: APjAAAWwQysAmPYqUEXR+1/LJl0bDVdsELe7R4ncpqYIn5mII3hbsZpw
        5KrIagLgn2ig8KaI1D12xxU=
X-Google-Smtp-Source: APXvYqydSiyMRzj6QXFVzUWNzUL0LUUvnGotJgLD9n9VUjcgfggnl8W+/75TLlsXhUbwOLV6q6l9PQ==
X-Received: by 2002:a63:1310:: with SMTP id i16mr71092692pgl.187.1563808481910;
        Mon, 22 Jul 2019 08:14:41 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id h1sm51944925pfg.55.2019.07.22.08.14.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:14:40 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:14:39 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        "Michael S. Tsirkin" <mst@redhat.com>, aarcange@redhat.com,
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
Message-ID: <20190722151439.GA247639@google.com>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <20190721081933-mutt-send-email-mst@kernel.org>
 <20190721131725.GR14271@linux.ibm.com>
 <20190721210837.GC363@bombadil.infradead.org>
 <20190721233113.GV14271@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190721233113.GV14271@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

[snip]
> > Would it make sense to have call_rcu() check to see if there are many
> > outstanding requests on this CPU and if so process them before returning?
> > That would ensure that frequent callers usually ended up doing their
> > own processing.

Other than what Paul already mentioned about deadlocks, I am not sure if this
would even work for all cases since call_rcu() has to wait for a grace
period.

So, if the number of outstanding requests are higher than a certain amount,
then you *still* have to wait for some RCU configurations for the grace
period duration and cannot just execute the callback in-line. Did I miss
something?

Can waiting in-line for a grace period duration be tolerated in the vhost case?

thanks,

 - Joel

