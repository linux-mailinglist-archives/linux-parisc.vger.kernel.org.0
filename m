Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2837C1B7D
	for <lists+linux-parisc@lfdr.de>; Mon, 30 Sep 2019 08:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729592AbfI3Gf7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 30 Sep 2019 02:35:59 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:32963 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfI3Gf7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 30 Sep 2019 02:35:59 -0400
Received: by mail-yw1-f67.google.com with SMTP id k78so243483ywa.0
        for <linux-parisc@vger.kernel.org>; Sun, 29 Sep 2019 23:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0u/ZxTJVmLMcjpYLoI/dErjjzE3HuZCQFBBqwQyHBvY=;
        b=dBCwj5RSTjPJE9/8OjomzcijpSqUlJcbhvq83oDTUmhMt4eLJMACECCIj8EkySy496
         Vb+35GtGpDIe5I4OaqVo3pImS4hN+kRR+RDSfIWITzAZx0vL4SIb6VMYNJwU55eSOT3M
         6KH6nYvguwMw+sot1x9Fwr3Haz1MDRXyxm1WOP4lIIG6tINQsjMe9ZyubsGsLKd5j44C
         5DONRxXOSAq62gpwzyTHzegxd4xsC4w+cdZe234fsh305f63ZZp1hiQ4hQlN8s7KU6pj
         LOPtiik2M9KY09Sq3k4ItFsK+6OlP2vV9+8DscFxf73mO5hfQpQVOkVzzWkNULCDP5Ax
         sQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0u/ZxTJVmLMcjpYLoI/dErjjzE3HuZCQFBBqwQyHBvY=;
        b=VItJyG2V7RerTd4L1vxMnnIVy+XajtTBJrYxytlbDnIbOrCbXXjIZcByGMIfPMAeWh
         WWlHwamUKWaMCMTN3Sd6Y0JySLXAxZ33CCYDqlW5AIqy/Jkz3LZe/8ZH1jvkwc3n76KW
         i6Ljojq0JO+4jOsVmK6ixFT63vW6xKLUsGn1Jth/aQU6nEU1+fzXsIxlp8/AqEnbCosf
         NSWIJUpldjW3GtFyoO6HdtJqSzHp1+AcZ2On+LFZKxPbp/yzHoF/GnfLln5ogR7kj5B0
         ILasnm1C7ttF+Fl21H3gN0kxz9GCgqzY9O9fjZrBuqy3A/Hl/V97YmvCtXyMDoemo+Fd
         bUwA==
X-Gm-Message-State: APjAAAUow6eMzU1/971CJQQUtMOc0bwO548wkFtKsJ8N/iaa2O+jX9dg
        uipOnf8qUYkgHcLMcKiTlU1kODh5rpLne4Ziw1s=
X-Google-Smtp-Source: APXvYqx0oRqUOO6AwAcdIdlH6PzGvb00QT3cRgT4lzdq8Rhy+AcYpqG5RgM71gpQx739kXsuNqRrNfK+Om77BTEXoCo=
X-Received: by 2002:a81:55cf:: with SMTP id j198mr12208295ywb.128.1569825358356;
 Sun, 29 Sep 2019 23:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190909133856.GA32746@ls3530.fritz.box> <20190930082026.6ac087ff@wim.jer>
In-Reply-To: <20190930082026.6ac087ff@wim.jer>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Mon, 30 Sep 2019 08:35:56 +0200
Message-ID: <CA+QBN9DgX=-XvN3QjzL6Jti538cwhCEozEv++7bOYSnkLN53KA@mail.gmail.com>
Subject: Re: [PATCH] parisc: Fix vmap memory leak in ioremap()/iounmap()
To:     Jeroen Roovers <jer@gentoo.org>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

has it already been tested on C36xx and C37xx?

Il giorno lun 30 set 2019 alle ore 08:22 Jeroen Roovers
<jer@gentoo.org> ha scritto:
>
> On Mon, 9 Sep 2019 15:38:56 +0200
> Helge Deller <deller@gmx.de> wrote:
>
> > Sven noticed that calling ioremap() and iounmap() multiple times leads
> > to a vmap memory leak:
> >       vmap allocation for size 4198400 failed:
> >       use vmalloc=<size> to increase size
> >
> > It seems we missed calling remove_vm_area() for ioummap().
>
> That patch seems to work (tested on a C8000 for a couple of weeks). I
> was surprised it wasn't part of the "parisc architecture updates for
> kernel v5.4" pull request.
>
>
> Kind regards,
>      jer
