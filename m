Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C844E29718E
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 16:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465259AbgJWOqp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 10:46:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:60908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S375361AbgJWOqp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 10:46:45 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E45AF21527;
        Fri, 23 Oct 2020 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603464403;
        bh=LtX8NeyP+cZ+2j1IkUU1onEVvrv3sB8QAV9FejdlLLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n+Z3zXp7hD62WA2GyjU1CFbNrrDqUUtJgO3Hhs0qmS6IRk1kCefdPKHlJkGJDQDby
         tb8m505yCaidWoXteLvLB2qPUN8tGHdSulV4hyYT/Cc4MZvzeSAaCs/I78FB9ZMO1G
         o8KazfPZPnsdksdQupxOqy9g0C+sIFUJot2idFhI=
Date:   Fri, 23 Oct 2020 16:47:18 +0200
From:   'Greg KH' <gregkh@linuxfoundation.org>
To:     David Laight <David.Laight@aculab.com>
Cc:     'David Hildenbrand' <david@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Christoph Hellwig <hch@lst.de>,
        "kernel-team@android.com" <kernel-team@android.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-aio@kvack.org" <linux-aio@kvack.org>,
        "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201023144718.GA2525489@kroah.com>
References: <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022104805.GA1503673@kroah.com>
 <20201022121849.GA1664412@kroah.com>
 <98d9df88-b7ef-fdfb-7d90-2fa7a9d7bab5@redhat.com>
 <20201022125759.GA1685526@kroah.com>
 <20201022135036.GA1787470@kroah.com>
 <134f162d711d466ebbd88906fae35b33@AcuMS.aculab.com>
 <935f7168-c2f5-dd14-7124-412b284693a2@redhat.com>
 <999e2926-9a75-72fd-007a-1de0af341292@redhat.com>
 <35d0ec90ef4f4a35a75b9df7d791f719@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35d0ec90ef4f4a35a75b9df7d791f719@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Oct 23, 2020 at 02:39:24PM +0000, David Laight wrote:
> From: David Hildenbrand
> > Sent: 23 October 2020 15:33
> ...
> > I just checked against upstream code generated by clang 10 and it
> > properly discards the upper 32bit via a mov w23 w2.
> > 
> > So at least clang 10 indeed properly assumes we could have garbage and
> > masks it off.
> > 
> > Maybe the issue is somewhere else, unrelated to nr_pages ... or clang 11
> > behaves differently.
> 
> We'll need the disassembly from a failing kernel image.
> It isn't that big to hand annotate.

I've worked around the merge at the moment in the android tree, but it
is still quite reproducable, and will try to get a .o file to
disassemble on Monday or so...

thanks,

greg k-h
