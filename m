Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A255A21C83
	for <lists+linux-parisc@lfdr.de>; Fri, 17 May 2019 19:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfEQRbZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 17 May 2019 13:31:25 -0400
Received: from mail-yb1-f171.google.com ([209.85.219.171]:38218 "EHLO
        mail-yb1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfEQRbY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 17 May 2019 13:31:24 -0400
Received: by mail-yb1-f171.google.com with SMTP id a13so2936495ybm.5
        for <linux-parisc@vger.kernel.org>; Fri, 17 May 2019 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=5sstn1KRwZW4lGnfrNiazkj+I9VCu+Zm8qXmfmLYuXY=;
        b=JD2Y/60RjTN7jAlaT9ZdHpoZJUtBG6mlJAGtEBfGL/0uLV/dxgkYPD7EzlmeN+5XiM
         fS5AqKUh9vHKiGuwUfkmPoQuAFhetSDw7LBDQVRvzK+l2PksJeNfaQQCbL88ihIVaLmK
         jxfK5Zw/EiHxeIc5mc9ThTJISa2QBLPM1FCN0/T7otwfNDdUEC0dD2pukTl1d/dURxSw
         xCfpTW59DyVDQCyA6eZgAelNq5WZi/I3AAVivCER1TdilDL/mr+OQ75/5UIYtipnJ11R
         a/ovMW251n4cISA3u/rdKm3papFmHWSlSLhNtg1bvioKKr/whVFs0kpo34Pvse3sTBWT
         ai4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=5sstn1KRwZW4lGnfrNiazkj+I9VCu+Zm8qXmfmLYuXY=;
        b=LodlaLwyWvdRRUqVhxczIPwizgsJ3haqKjdwRHBvCWLprX0Uu1LHpBZKjzf2xbTC5B
         WfFQyOgLqCMHFSoBqKBiKWQ+LLLcLYv4fKoMvrSeFNeX8Dohzr3Ob5akgk6qTZv635Ro
         9n6AUiOz9EFTNwhczAxiEnS3ZXb8j+aHJXFaoz5cWpEbhR/vzlR7hz9IBk5UZ+4EMafG
         /zxQC42/nFzSDq/zDcNpYC3VAn4mLfFn6j8/BiGHS0k5j5wlIAt3YNvr7qkrxYXnMjMG
         lQQ2JoG4i07a/cwJGJLuIcWKlfssAfQADgSqh2eDeIGJ3PUaoHQ/6o7gbDUnNFA7C7H6
         CcEg==
X-Gm-Message-State: APjAAAU4fEtHuzBGFZECZbX+OH4/C3I9bv+ZUEqGk1FnjfqfugA2R3sg
        GpKdlOmGUR6Ju7aGKu/l1OoulEgH2N65VD5ghPEQJA==
X-Google-Smtp-Source: APXvYqyfZGPL0nyxphph2mw7B/l7F2ydv5AxtXFy034Qj2eQpAZaMY6rJN1t2hPTW8EgspE7McrYjlhLwzSSqQJM7u0=
X-Received: by 2002:a25:428c:: with SMTP id p134mr24438416yba.62.1558114283839;
 Fri, 17 May 2019 10:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
In-Reply-To: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Fri, 17 May 2019 19:31:18 +0200
Message-ID: <CA+QBN9BoQibEM8yW+UPzTZMNt2SAORVkPij6d4=jKOchjm9XBA@mail.gmail.com>
Subject: Re: C3600, sata controller
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> I asked a friend to lend us his card, which is the card2 listed below
> and not things are becoming really weird

> card1, Silicon Image, Inc. Adaptec AAR-1210SA
> card2, Silicon Image, Inc. SiI 3124 PCI-X Serial ATA

card1 is not PCI-X, the chip is PCI. So it's not problematic.
card2 is PCI-X, the chip is PCI-X

on which machine have you tested card2? C36xx? C37xx? C8000?
and with which test(1)? how long, and with which result?

(1) ours are published on the website
