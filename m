Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 845401F6DB
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2019 16:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbfEOOtc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 May 2019 10:49:32 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42230 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbfEOOtc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 May 2019 10:49:32 -0400
Received: by mail-ed1-f66.google.com with SMTP id l25so179373eda.9
        for <linux-parisc@vger.kernel.org>; Wed, 15 May 2019 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oKULkZSRwqaiQxP7TL4UYPkN+uTDZlr88Vcbz3QuA1I=;
        b=gbthNhordMIYVnTy317gMGg6f/dfC5iQgBxjq6Pg3jScMLdLI0Vq4OcwB79UHvgEgC
         U1AgURPKc8JVgJXOo0PlK1NBODmUH4LG0c3iQOkHAxHOhxIV3lZFFgtryVL471yH2yaW
         C3klxUr1MKghIvHXbdcitmAziIPiCtbEw5zo2mlbo+BrqzIdRMNr8g8Hd8yvC+RFkoND
         3U7iWRnczi1gGSuo/hShIfYUEndn7uxrlNKw8BfZPzT5nVaY90n0JScdqCfYtxsar1cX
         tdmjNXgvyrjanexmF/91CzUGx8XsXtV3i+hqAVIqFgPvc7YR3o00EzVeVZB9N4qN/XJl
         yDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oKULkZSRwqaiQxP7TL4UYPkN+uTDZlr88Vcbz3QuA1I=;
        b=JkCs7k1CVI0NMB2dU5tZpnXOVItVor0fax325+wvndgguhqSKo/M7P0zvM0pe7H/vV
         QlZR2NNNvGUENjrNUtAovygae47SZfo97SY9yd/Daa/cedlMgOWOHPs7qhFTXPDT1jli
         n5fAbm4HmMWbdMMGe84xwvtmtt+Vdxh7GjjZ3ob0pCKfWU8K4hOqONmff2MGcddcebac
         YYwHj79Mfg+F3OEZNIaXt+B2Di4/mfUUz75X97f/IymmToV9JG6sjrfYjbeO3GfTEQtT
         dvetj1jNsRhvIdXFBOogfEq50NMxcruVDmRJcVMkiEQV/FG8uxLg8GiHht8Q9jj+KHf8
         NFMg==
X-Gm-Message-State: APjAAAWUAhSclZL3GH6s7lygvgdGqrpAeYv6RbU90+eDTYBNfCkhRfn5
        p18csZNly2f+WENxsKv9WRgOcA==
X-Google-Smtp-Source: APXvYqwtuLZTJzieEZtQQr5tQJZGg6NHI/b45QGiYK/CmzqPYIKTHEi4eYHx8oYap2x4c/tmYGlpdA==
X-Received: by 2002:a50:8eb6:: with SMTP id w51mr43141017edw.34.1557931770356;
        Wed, 15 May 2019 07:49:30 -0700 (PDT)
Received: from brauner.io ([178.19.218.101])
        by smtp.gmail.com with ESMTPSA id a32sm873557ede.76.2019.05.15.07.49.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 15 May 2019 07:49:29 -0700 (PDT)
Date:   Wed, 15 May 2019 16:49:28 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     jannh@google.com, viro@zeniv.linux.org.uk,
        torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de, dhowells@redhat.com, akpm@linux-foundation.org,
        cyphar@cyphar.com, ebiederm@xmission.com,
        elena.reshetova@intel.com, keescook@chromium.org,
        luto@amacapital.net, luto@kernel.org, tglx@linutronix.de,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] pid: add pidfd_open()
Message-ID: <20190515144927.f2yxyi6w6lhn3xx7@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
 <20190515143857.GB18892@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190515143857.GB18892@redhat.com>
User-Agent: NeoMutt/20180716
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, May 15, 2019 at 04:38:58PM +0200, Oleg Nesterov wrote:
> On 05/15, Christian Brauner wrote:
> >
> > +SYSCALL_DEFINE2(pidfd_open, pid_t, pid, unsigned int, flags)
> > +{
> > +	int fd, ret;
> > +	struct pid *p;
> > +	struct task_struct *tsk;
> > +
> > +	if (flags)
> > +		return -EINVAL;
> > +
> > +	if (pid <= 0)
> > +		return -EINVAL;
> > +
> > +	p = find_get_pid(pid);
> > +	if (!p)
> > +		return -ESRCH;
> > +
> > +	rcu_read_lock();
> > +	tsk = pid_task(p, PIDTYPE_PID);
> 
> You do not need find_get_pid() before rcu_lock and put_pid() at the end.
> You can just do find_vpid() under rcu_read_lock().

Will do.

> 
> > +	if (!tsk)
> > +		ret = -ESRCH;
> > +	else if (unlikely(!thread_group_leader(tsk)))
> > +		ret = -EINVAL;
> 
> it seems that you can do a single check
> 
> 	tsk = pid_task(p, PIDTYPE_TGID);
> 	if (!tsk)
> 		ret = -ESRCH;
> 
> this even looks more correct if we race with exec changing the leader.

The logic here being that you can only reach the thread_group leader
from struct pid if PIDTYPE_PID == PIDTYPE_TGID for this struct pid?

Thanks, Oleg.
Christian
