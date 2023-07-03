Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E9F746448
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 22:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjGCUlF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jul 2023 16:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGCUlE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jul 2023 16:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A021FE5C
        for <linux-parisc@vger.kernel.org>; Mon,  3 Jul 2023 13:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688416816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qEyfUvIleE/DMwxJ9dU5lavWxgzOCjVd+5vXxKWRfUM=;
        b=d/FwSPsRvG0nxuZWcWx+SlDcXvnoXG+b6srwHSEl6N7i1umFzVHKhkzdPJ165Lqrv2Drd6
        a7gz6EHkKJO07ciInFiq2ge6vPk+9HgJPxcqR/jXME47CttW5sNJK52emG2/4xQXzcoDsh
        C2oL8rGCYRn9yY9KqExBZ0yRS39ISXI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-_xYCz6DdNyukg9a3-lbWZw-1; Mon, 03 Jul 2023 16:40:11 -0400
X-MC-Unique: _xYCz6DdNyukg9a3-lbWZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF7D71C07240;
        Mon,  3 Jul 2023 20:40:10 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C2E140C2063;
        Mon,  3 Jul 2023 20:40:10 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
        id 7B5273096A40; Mon,  3 Jul 2023 20:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 77AB43F7CF;
        Mon,  3 Jul 2023 22:40:10 +0200 (CEST)
Date:   Mon, 3 Jul 2023 22:40:10 +0200 (CEST)
From:   Mikulas Patocka <mpatocka@redhat.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
cc:     Vegard Nossum <vegard.nossum@oracle.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Frank Scheiner <frank.scheiner@web.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave@parisc-linux.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-parisc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] parisc: fix inability to allocate stack pages on exec
In-Reply-To: <CAHk-=wj=vEtN54KzMHDrguaS8zNg4ppoFP4mm7vVThotGo53nQ@mail.gmail.com>
Message-ID: <a8a1cd41-1246-e2cd-10ea-9bc571148afe@redhat.com>
References: <ccadf5d7-e22a-ab5b-21e8-18a788251845@redhat.com> <CAHk-=wj=vEtN54KzMHDrguaS8zNg4ppoFP4mm7vVThotGo53nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Mon, 3 Jul 2023, Linus Torvalds wrote:

> On Mon, 3 Jul 2023 at 12:59, Mikulas Patocka <mpatocka@redhat.com> wrote:
> >
> > The patch 8d7071af8907 ("mm: always expand the stack with the mmap write
> > lock held") breaks PA-RISC.
> >
> > The breakage happens if we attempt to pass more arguments to execve than
> > what fits into the initial stack page - we get -E2BIG in such a case.
> >
> > The reason for the breakage is that the commit 8d7071af8907 adds the test
> > "if (!(vma->vm_flags & VM_GROWSDOWN)) return -EFAULT;" to the function
> > expand_downwards.
> 
> Heh. See
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f66066bc5136f25e36a2daff4896c768f18c211e
> 
> which fixes this differently (and, I think, much better).
> 
> Just removing the VM_GROWSDOWN test will actually break some of the other users.
> 
> Notably the new and improved expand_stack() function that now handles
> all the complicated *cough*ia64*cough* cases automatically, which
> allowed unifying the page fault handling code around this area.
> 
>               Linus

Yes - I confirm that this fixes it.

(please, also send this patch to Greg, so that it will be included in 
6.4.2)

Mikulas

