Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B88283CA
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2019 18:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730913AbfEWQez (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 May 2019 12:34:55 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42188 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731336AbfEWQex (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 May 2019 12:34:53 -0400
Received: by mail-io1-f66.google.com with SMTP id g16so5364746iom.9
        for <linux-parisc@vger.kernel.org>; Thu, 23 May 2019 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Iz31yxamDJ4SLEgYHA+H3kjkT5XCb4Zp6/gfezC2Qt0=;
        b=br9pbADirR+994GWUgAiKh+WIakMAmwjJW/UntS6Vn0UL+m+lo1dO/FTn+atO0TVUF
         WdA8FOmw4uGU2Bt+yb06vyTwDWlE5VoB/+44IeS//dPUmBtjE65Z0H9wy+5UAvWjM+bU
         m+bJeRTuOymmNkxLknco9nJkzLY7TqLdw6esosEZQQvPH6sHVcKReo2wvVHJQn0pMBUf
         OX51ptx8FqYA5dBO+dTICUUbyHUOH7QuXKfV6eA1u0UfOiAAh+Mf72MaHLSqmppeHekG
         sh6nJDFdLtpjiUyCOrk9t/mGk5+b5qcprSS2UKQvflivDDj11xTdb5tgLHk7Hl+UCr+t
         3OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Iz31yxamDJ4SLEgYHA+H3kjkT5XCb4Zp6/gfezC2Qt0=;
        b=uCIsAhAqZxvMoYxx/1Fxt/QjlnZi4LkY+y74PsKm4iHIqH9GuwC3p8r6rayzkpCb/V
         9muZpTgCOFsnEYS7QWs+HaHXBPcbu32inrgVOAGBlsEP0ROYQYa3QEDOQR8quk5Hk7VJ
         0ZRJHbD3DtAK1ofXh9FkGb7ci5QWg5YF1zHeIY7a8nGmtTwbHGKavHsZkBsMAoD2YA4U
         u9SQ4+b1ixOxPaFdlZJTG2t/wPWPlaZPx+smR7WqZSgtrB9TfzMLSfDJFJATbE5Decfg
         ZvKTv0MzMd1h70MfLLawQF2bdcsamIJspb3gWoGTU8nBs31FIB2g0rlDv8HqABFefZif
         4rdQ==
X-Gm-Message-State: APjAAAUQOo8zxuA8BFBGTIyyV48UECeAa/X5IqGMGsdoA+LfFnPGzjGN
        E05U+G/Vhls7pe8zyRWRHAN98w==
X-Google-Smtp-Source: APXvYqxbigL0wIoR0wevysC4IvW0XTy55FvFJYU3fuOueOdFBp/HEFetU0vD2YZ0NHaH83jARAO6OQ==
X-Received: by 2002:a5e:8e4d:: with SMTP id r13mr57452598ioo.300.1558629293065;
        Thu, 23 May 2019 09:34:53 -0700 (PDT)
Received: from brauner.io ([172.56.12.187])
        by smtp.gmail.com with ESMTPSA id i25sm8797750ioi.42.2019.05.23.09.34.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 23 May 2019 09:34:52 -0700 (PDT)
Date:   Thu, 23 May 2019 18:34:41 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        torvalds@linux-foundation.org, fweimer@redhat.com,
        jannh@google.com, tglx@linutronix.de, arnd@arndb.de,
        shuah@kernel.org, dhowells@redhat.com, tkjos@android.com,
        ldv@altlinux.org, miklos@szeredi.hu, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 1/2] open: add close_range()
Message-ID: <20190523163439.56ucetlt6duvnhdj@brauner.io>
References: <20190523154747.15162-1-christian@brauner.io>
 <20190523154747.15162-2-christian@brauner.io>
 <20190523162004.GC23070@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190523162004.GC23070@redhat.com>
User-Agent: NeoMutt/20180716
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, May 23, 2019 at 06:20:05PM +0200, Oleg Nesterov wrote:
> On 05/23, Christian Brauner wrote:
> >
> > +int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> > +{
> > +	unsigned int cur_max;
> > +
> > +	if (fd > max_fd)
> > +		return -EINVAL;
> > +
> > +	rcu_read_lock();
> > +	cur_max = files_fdtable(files)->max_fds;
> > +	rcu_read_unlock();
> > +
> > +	/* cap to last valid index into fdtable */
> > +	max_fd = max(max_fd, (cur_max - 1));
>                  ^^^
> 
> Hmm. min() ?

Yes, thanks! Massive brainf*rt on my end, sorry.

Christian
