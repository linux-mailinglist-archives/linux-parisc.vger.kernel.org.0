Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F09863B2E4
	for <lists+linux-parisc@lfdr.de>; Mon, 28 Nov 2022 21:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbiK1UUy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 28 Nov 2022 15:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbiK1UUx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 28 Nov 2022 15:20:53 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D136BFE6
        for <linux-parisc@vger.kernel.org>; Mon, 28 Nov 2022 12:20:51 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d6so11297753pll.7
        for <linux-parisc@vger.kernel.org>; Mon, 28 Nov 2022 12:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=golang-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OqVtfjB5WX8NHVSh+W5FdHVz0rsFv89p+iazzj/PeSI=;
        b=RWJBVSgJIMV+dXXfN8nTxHF1uWG5t7edm3DnEhpQeof/5lgvFBg67uqU76aRGXkvos
         ucr1Os3O62etNBr7hUZE6D5kmc7G8t7S6EFALh2LFMK/6BWm6vviFWK3WR6RGBni+9ta
         b7ow1kAeEvQermTUF5/VM8nTwvdHAVZB2GXRYovHpJjpHuG9jQuWHhM/CyLo76XhsxGQ
         U7+C5smrjUp3hUyWcwvYOHcxNlejoEDZtFvOgGg0JGCKqwvIru+3zFU/6gJNe8x2JTU+
         jolZIrqC6OGDRbLC2Bd+1/x2OFaaQYQLr4msjUqmimblM116FdPLzE5dwVYx2nPrC8AE
         +kTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqVtfjB5WX8NHVSh+W5FdHVz0rsFv89p+iazzj/PeSI=;
        b=Dw13Fs8DwXo68sAappPE+znIjg3YuEMwDC0syhCDgbzfH67RvjL2rIPLcTe0CTiIiz
         jT2x66sgxG/+ec7t8bCXbZm17NIjFkBkXluHVyomWw05JQ9E+XXqVSr5H7GSY12cODej
         p1taejLzONzKAPtWzv+AX7Px0lWMxMxp0IstesAGA2xIORHhhOVV1dqBqnxW+Fb194VG
         pEXwtisjgMtwr1qqOwpZh7naw5GXoEoY33ScrJ+zba1m6WYaIE8d5og4vLOLe+uTGVG4
         Q0TdxAYUzoy2t34x+VDzmSLnEsF4ZkY6B9bpFDOMxchP0XyIxXWDqDT0BSrqshFt541n
         O3VQ==
X-Gm-Message-State: ANoB5pmOUmyBLFLGPhbzuGYV/nFXvN6YtScSbBtpkzySuboPH+tZgnnT
        2HvkxrT5l0IEaJdDuBdzstCfBGIQcCwu2KrGKF/AlGei2kg=
X-Google-Smtp-Source: AA0mqf6xzYSGERliE0uRfbAqmaUsYbYWPXgT0s3jjZo4K/tCzQFcmIGnxuvjQ072f5NFqTDTXsDDqS4/QD/dfMCx1jQ=
X-Received: by 2002:a17:902:e807:b0:189:117c:fcfe with SMTP id
 u7-20020a170902e80700b00189117cfcfemr33609080plg.124.1669666851269; Mon, 28
 Nov 2022 12:20:51 -0800 (PST)
MIME-Version: 1.0
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk> <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
 <cc3d9dc4727b3e7d76e76a2f0bb200ac@matoro.tk> <CAOyqgcXknGW0AvMy-noFZsSxYdiruoA_HxXaiuW+n-osyyzyMg@mail.gmail.com>
 <067345a4e47eed632a994084ae53856b@matoro.tk> <CAOyqgcWK4UhU-GhEvUo26X_UEK_GK-a1xzqr27J98HAe1J9VYg@mail.gmail.com>
 <8d3b98ad973d3cd0ed807ec9d2edeaf2@matoro.tk> <e4ea795a-ad17-4c8c-0231-579906813839@gmx.de>
In-Reply-To: <e4ea795a-ad17-4c8c-0231-579906813839@gmx.de>
From:   Ian Lance Taylor <iant@golang.org>
Date:   Mon, 28 Nov 2022 12:20:40 -0800
Message-ID: <CAOyqgcXbXHVX8qJzyFVgdV5J4hkZXwD_bwe+ZBzJsSdTQ7zbew@mail.gmail.com>
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
To:     Helge Deller <deller@gmx.de>
Cc:     matoro <matoro_mailinglist_kernel@matoro.tk>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, hppa@gentoo.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Nov 27, 2022 at 12:19 AM Helge Deller <deller@gmx.de> wrote:
>
> I don't know if it's relevant, but on hppa the stack grows upwards,
> while on all(?) other platforms the stack grows downwards.
> Maybe something is missing, esp. since setcontext() is involved where
> a new context including stack is set and this leads to the "corrupt stack" ?

Interesting point and quite possibly relevant.  See the code in
runtime/stack.c.  More generally, see if the tests behave better with
the environment variable GOGC=off.  That disables the garbage
collector.

Ian
