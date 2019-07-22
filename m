Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8A5E70145
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jul 2019 15:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbfGVNlz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jul 2019 09:41:55 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:33492 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbfGVNlz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jul 2019 09:41:55 -0400
Received: by mail-qk1-f179.google.com with SMTP id r6so28633018qkc.0
        for <linux-parisc@vger.kernel.org>; Mon, 22 Jul 2019 06:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r7jurWEbcB87wkHM6FBIF/d6ZCsIeD3qrag1BaWvzr0=;
        b=ctSiEsOEiyiwu0n3CEQABL3/Tosruh5w/+6uzF92xLW34JmyfhThCGBMfVUaYt9dcx
         eW2R16GiG0XcoxTfHQmNNe2NbtDmD4V4zDlbn3sIafmR+axGp5w7q8jG/t+N5A5vd1+2
         T8limk/5bxxJguypRZGjOMgCVjJ3UuJ440SlT4VBiuew99yPu+wjBAGDyiX6h7A0CwOA
         dwL0M70N/ZKBJ7e/9dDovVWnU15MNgA7ZpwwgLu6rerH2A7rFP/VNIWBW0CDFkWJkGIk
         02tVH4RCMUcpMeH+V7LrZ4lwFpUMFWob0uRUx2w20StfeAVPWAbvrasBs/AM3w8QAsz1
         Qvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r7jurWEbcB87wkHM6FBIF/d6ZCsIeD3qrag1BaWvzr0=;
        b=XiGPngpNWoFr1qo4G7LAY/mtWpX3oHlOXFjDKeVHfXOvroGPVthZhcdxOJwT/lgUV9
         prsNztA7QfD+jKqXJLeytMuFbBEfxAjWExMoBs1Ghvjxku2RYQTNPjWhKEjmMXCpqk20
         OaRTfsOQe7/rPGLgz/WScppdZf9B+xo2fzjzfjFGeTd7UdsxnUn7Y6sytui8E5e6RTRu
         4k0hsr6egJgQxjMcdouMI+CThUnUd7Kr2oDsHcaCbnprlC2/SoAU5Ldh+IWN+Lel1Mmh
         TAwxqHCtC5pQ6f01Q+q6Rv21Dudw0rqeaNesa676WT5fFcmhT3GGmKDGLXI1pnvpECHX
         adLg==
X-Gm-Message-State: APjAAAWlMYT8j3dJ/ur/Iz7g2N74V2M/criNyilQ1cv6MWWRXmL8T5t+
        MNQX+rmbQQG/UMcD5pOyioJD3Q==
X-Google-Smtp-Source: APXvYqxGgJ5n0Ggl2+5KtjzE7HLyY29aRN+3J2KTmJj1bDyPcTuyXmhCmMkJ3yMp7O1QI/DGhNTc3w==
X-Received: by 2002:a37:a6d8:: with SMTP id p207mr42748278qke.387.1563802913858;
        Mon, 22 Jul 2019 06:41:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id x8sm17451291qkl.27.2019.07.22.06.41.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 06:41:52 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hpYZc-0003Vr-7E; Mon, 22 Jul 2019 10:41:52 -0300
Date:   Mon, 22 Jul 2019 10:41:52 -0300
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
Message-ID: <20190722134152.GA13013@ziepe.ca>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <20190721081933-mutt-send-email-mst@kernel.org>
 <20190721131725.GR14271@linux.ibm.com>
 <20190721210837.GC363@bombadil.infradead.org>
 <20190721233113.GV14271@linux.ibm.com>
 <20190722035042-mutt-send-email-mst@kernel.org>
 <20190722115149.GY14271@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722115149.GY14271@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jul 22, 2019 at 04:51:49AM -0700, Paul E. McKenney wrote:

> > > > Would it make sense to have call_rcu() check to see if there are many
> > > > outstanding requests on this CPU and if so process them before returning?
> > > > That would ensure that frequent callers usually ended up doing their
> > > > own processing.
> > > 
> > > Unfortunately, no.  Here is a code fragment illustrating why:

That is only true in the general case though, kfree_rcu() doesn't have
this problem since we know what the callback is doing. In general a
caller of kfree_rcu() should not need to hold any locks while calling
it.

We could apply the same idea more generally and have some
'call_immediate_or_rcu()' which has restrictions on the caller's
context.

I think if we have some kind of problem here it would be better to
handle it inside the core code and only require that callers use the
correct RCU API.

I can think of many places where kfree_rcu() is being used under user
control..

Jason
