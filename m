Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF731AC80
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 15:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfELNpa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 May 2019 09:45:30 -0400
Received: from mail-yw1-f44.google.com ([209.85.161.44]:46806 "EHLO
        mail-yw1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfELNpa (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 May 2019 09:45:30 -0400
Received: by mail-yw1-f44.google.com with SMTP id a130so8763418ywe.13
        for <linux-parisc@vger.kernel.org>; Sun, 12 May 2019 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DEvWobkQkZItNh1BeNGiikpUAnQ405cWjxAUIf6+/o8=;
        b=hRH/ynu8X2IOHGPiS7oDdCP4mHle5hPHxAmm2P9iNnUBUnH/llcCZ0gAjMhv6kte9b
         Tj7zeD9cEonZSGH93bz3EZi1tUuIMnUtrbk4W4T/uQbzhU+R/yr4w2rKI/c7UBr6JNHL
         h2P91kSSIDgprLYg4JnGr4Ge0k2uziYO7sOz/oe0+A2e7RbWX9uWRs8X7cfnISdfblYn
         +R2KtBOrW2nz+Y/iY9KzRfz9cPbiTaGdRmMcX8rQjyEiZR0HVBx+eytFiD048aPwW+TS
         9wY8iEmAKPsm3u8Wtel+frA8PFBkv8NxYArwhqjkCajnQ/5xGNnhXA9zPZxzTXJj4z+M
         BaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DEvWobkQkZItNh1BeNGiikpUAnQ405cWjxAUIf6+/o8=;
        b=lIrmjlELA/IWBImYTz9XyNxMg4I+IvnqdtbqD9T76tZcl9OdZ3fEo7ZvgmVRfdMB1u
         /e1z8G3b+ge7SEdMx6G1bR4org7VkUfYRL9v+PJ6/QYwcw1pm1fd3LEcECPD2li2XuW3
         czROohUoOCC9gns6I89+6dtN4q5rti9BkSVHeFJb5KLfZ3cX9juHvjIQdUqVH6izZ7hv
         /BYy3QhEd+yIPBTaxhPfDFOhhjLyOTBJNZ7a9M+eKJCoU3MRxBlXKCVaagawZBHTR7rD
         UhsF4IqW3IiwYEshlRK6QGvr42qfUUgN8sIAe3JTWDlkWc433WqoC7X5VdD0dL2dzyMR
         fkpw==
X-Gm-Message-State: APjAAAWIiNFHZqas9JZlNLJZmB6xGjyO2qlyRRD/blyKEoosqS/lyUp9
        C+vi6c+KQhwJi4Gnug30T06ka8oeouBnnKmjDbM=
X-Google-Smtp-Source: APXvYqz8kdmsnyjHNuvt17ajsGveZODBxxr2M5zXzNBWCx79G75PRtHhSPV9+28PvCc6Dbzc0aZC45j4D83fPx4kmXA=
X-Received: by 2002:a81:4985:: with SMTP id w127mr10902856ywa.144.1557668729904;
 Sun, 12 May 2019 06:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de> <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
 <57fc8e0d-c04d-e82e-04ad-2debec0284fb@linux.ee> <CA+QBN9AfShbQ1JbcEMr++roxH0oivnEq-ndKc5yt6tGRos+N_w@mail.gmail.com>
 <63286d01-212f-aa26-cc57-8831dd3ded99@bell.net>
In-Reply-To: <63286d01-212f-aa26-cc57-8831dd3ded99@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sun, 12 May 2019 15:45:01 +0200
Message-ID: <CA+QBN9DLCT2WGWEPUg4yrOswUkB1PepkbuGnzwEAmxokOgX74g@mail.gmail.com>
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Meelis Roos <mroos@linux.ee>, Helge Deller <deller@gmx.de>,
        linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> I agree.  The memory errors in the PIM dump are recorded by the PDC firmware and they don't
> directly involve the linux drivers.  Might be hardware problem.

which kind of error problem?

those two cards have no problem when tested on PowerMac-G4
and we have a second C3600, reporting the same behavior

so, supposing those cards are OK, and C3600s are OK
what might be wrong about the hardware?
