Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC62BBF1B
	for <lists+linux-parisc@lfdr.de>; Tue, 24 Sep 2019 01:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391259AbfIWXvf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 23 Sep 2019 19:51:35 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44159 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388338AbfIWXvf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 23 Sep 2019 19:51:35 -0400
Received: by mail-pl1-f196.google.com with SMTP id q15so40896pll.11
        for <linux-parisc@vger.kernel.org>; Mon, 23 Sep 2019 16:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XsWEYEMa3OUxN/rIyJmCXyYBeWS8+cU9XND539Ca4bw=;
        b=E/y9NXZybs6vA4vrlalGFLTtZlxrC7FtgNZ3guYdN0O/ZGcGF24vZNUnIPI9RNeUSU
         KG2oaE52Aag0Vkpz8/5DKgjwGlCVtVq1vVyhPWrz1aox1UxP7nt4VCA8fvKlCohfnkIs
         mSJV6kjx7O2bDKd2DZFiUTXqHAySN3KKJ4g6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XsWEYEMa3OUxN/rIyJmCXyYBeWS8+cU9XND539Ca4bw=;
        b=U/GTbXDa2xlDG3EdBq3MbJ0h2K+ZkAWOqbaj4b1/iDh1lemp3ZcF/FyzGgHxMzGlsu
         pAOwmp9u/paiOJ43B+EViJ0i0adEVnYusYc15bhjEqtyEyPr2VuIfcMC8Ui6j68daCBT
         UKKR4/NL6fB2YEGMYxZVlsVRxloIfzEH36ksEneyWHVKrqggSGY0s++OyfuF1Kd593WY
         UITMwkXwPxmeCjmI0tVaMU9YK8+KBH1GhA2+lAtmVFoNgw7NYZ4UfOG2mTxiVNc/3ew8
         RnPXr2G/UlXx2m+7AZJQ/88PG9LiSBEJS1q4a1LEw6X1N1ykAHzaO0fudsHHZ9kMPtsH
         W9Tg==
X-Gm-Message-State: APjAAAUpYrs9WEvp+11WAtYSLaINiRCQPcTlk3GIXI3nbDoa9UkMfWs/
        Zn7s0GGlKZR2B+vvm9EG4lRogw==
X-Google-Smtp-Source: APXvYqwU0BW/btrE2Yva2gh7adQAX91dLGmJKvlNr/ftvqFACr7SANo+L9CNSieSziIXVJm4hCuctg==
X-Received: by 2002:a17:902:36a:: with SMTP id 97mr2247384pld.75.1569282694325;
        Mon, 23 Sep 2019 16:51:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m4sm5126340pjs.8.2019.09.23.16.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 16:51:33 -0700 (PDT)
Date:   Mon, 23 Sep 2019 16:51:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Drewry <wad@chromium.org>,
        Oleg Nesterov <oleg@redhat.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-um@lists.infradead.org, X86 ML <x86@kernel.org>
Subject: Re: [PATCH] seccomp: remove unused arg from secure_computing()
Message-ID: <201909231650.1CCAFBA6@keescook>
References: <20190920131907.6886-1-christian.brauner@ubuntu.com>
 <20190923094916.GB15355@zn.tnic>
 <CALCETrU_fs_At-hTpr231kpaAd0z7xJN4ku-DvzhRU6cvcJA_w@mail.gmail.com>
 <20190923193446.GL15355@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923193446.GL15355@zn.tnic>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Sep 23, 2019 at 09:34:46PM +0200, Borislav Petkov wrote:
> On Mon, Sep 23, 2019 at 11:41:59AM -0700, Andy Lutomirski wrote:
> > On Mon, Sep 23, 2019 at 2:49 AM Borislav Petkov <bp@alien8.de> wrote:
> > >
> > > On Fri, Sep 20, 2019 at 03:19:09PM +0200, Christian Brauner wrote:
> > > > While touching seccomp code I realized that the struct seccomp_data
> > > > argument to secure_computing() seems to be unused by all current
> > > > callers. So let's remove it unless there is some subtlety I missed.
> > > > Note, I only tested this on x86.
> > >
> > > What was amluto thinking in
> > >
> > > 2f275de5d1ed ("seccomp: Add a seccomp_data parameter secure_computing()")
> > 
> > IIRC there was a period of time in which x86 used secure_computing()
> > for normal syscalls, and it was a good deal faster to have the arch
> > code supply seccomp_data.  x86 no longer works like this, and syscalls
> > aren't fast anymore ayway :(
> 
> Uhuh, thanks Andy.
> 
> Christian, pls add that piece of history to the commit message.

Yeah, this is just left-over from the "two phase" seccomp optimization
that was removed a while back. I'll take this clean up into the seccomp
tree. Thanks!

-- 
Kees Cook
