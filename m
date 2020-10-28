Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A5329D5CA
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Oct 2020 23:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730058AbgJ1WHV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 28 Oct 2020 18:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730060AbgJ1WHT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:07:19 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248ACC0613CF
        for <linux-parisc@vger.kernel.org>; Wed, 28 Oct 2020 15:07:19 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 141so767066lfn.5
        for <linux-parisc@vger.kernel.org>; Wed, 28 Oct 2020 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=MqJgj12KEJs6fU7vsaZp1Zad0GwpjvOq3iDuYwNSKEM=;
        b=HbMnmzUIdW65cArOXl4cxhjxhl24W4BkuF46r+l9KuAA489q1/INMfhCTAZa/qP9tr
         Qf3JV0B6pUcyx3bmwSbfeOu7c2cPnvNE1GQQPQwdSS6LFqUq1In36GW+vrCrB7ELPscs
         klqGfM+scER373h2wgZbQQOdGQdWIM9OCaK44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=MqJgj12KEJs6fU7vsaZp1Zad0GwpjvOq3iDuYwNSKEM=;
        b=iJJGf2lGOEvXaZUgy69DP8gScVSydII/4xxTJGLphG/GZOdNn4EkAQPR//W7ESSbos
         ApiBSRjlp79BiWu6dzjtO/EGiygWeJOVO2SOIHUxsrIzLa4xaJhJjnDWdstL2YbNy0U8
         NH2JGZKMYQifTybhRp//XSbDLzlNjE+Na/YOfktKGKV/ui7hcLLsxI+3qAnqf7vcqZvm
         fiz8XrCYLDBsgl2ylsJvUyVo/TioU6NBzfo5UBnlBYgHDSk19uCgtwOMMkjZ2On+rV9x
         fRRWIMmw5lWz94H4BQoGl7A0WDQEWjA0GHukl2ROO9ZBqx4NuhxfOv81wRhSE8AuDUFI
         Fssg==
X-Gm-Message-State: AOAM531RkQg/DGPFv8tPTEVho0jt5cxDql2AenBC6fRLjH0d5DJG1Ril
        so80KGVwDUCKmTWZ8e4Rmg5IFEvfThvIUPlI
X-Google-Smtp-Source: ABdhPJwbS8Eg9TtDj0k/jB3qA+LrlhDy+5dZr0SvO23CrdBwVE/Fau9mDKVPDFQwkwvE41EP0TOEUQ==
X-Received: by 2002:adf:fe48:: with SMTP id m8mr7296470wrs.127.1603873127564;
        Wed, 28 Oct 2020 01:18:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j17sm5657301wrw.68.2020.10.28.01.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 01:18:46 -0700 (PDT)
Date:   Wed, 28 Oct 2020 09:18:44 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-parisc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] Fonts: Make font size unsigned in font_desc
Message-ID: <20201028081844.GS401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jiri Slaby <jirislaby@kernel.org>, linux-parisc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <20201027185058.GM401619@phenom.ffwll.local>
 <20201028054307.GA1205568@PWN>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028054307.GA1205568@PWN>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Oct 28, 2020 at 01:43:07AM -0400, Peilin Ye wrote:
> On Tue, Oct 27, 2020 at 07:50:58PM +0100, Daniel Vetter wrote:
> > On Tue, Oct 27, 2020 at 12:33:05PM -0400, Peilin Ye wrote:
> > > It is improper to define `width` and `height` as signed in `struct
> > > font_desc`. Make them unsigned. Also, change the corresponding printk()
> > > format identifiers from `%d` to `%u`, in sti_select_fbfont().
> > > 
> > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > 
> > I'm not entirely sure of the motivation here ... height/width should never
> > ever be even close to the limit here. Or have you seen integer math that
> > could potentially go wrong if we go with unsigned instead of int?
> 
> Oh... No, I have not. I just thought we shouldn't represent a length
> using a signed value. Also, width and height in console_font are
> unsigned int - that shouldn't matter that much though.

Oh this is actually a good reason, since that's the uapi structure. And so
using the exact same signedness should help a bit with accidental casting
bugs.

If you mention this in the commit message I think this is good to go.
-Daniel

> 
> [3/5] doesn't hunk properly without this patch, I'll send a v2 for [3/5]
> soon.
> 
> Peilin
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
