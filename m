Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6934395A2
	for <lists+linux-parisc@lfdr.de>; Mon, 25 Oct 2021 14:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhJYMLC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 25 Oct 2021 08:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbhJYMLC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 25 Oct 2021 08:11:02 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F44C061745
        for <linux-parisc@vger.kernel.org>; Mon, 25 Oct 2021 05:08:39 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y7so10543519pfg.8
        for <linux-parisc@vger.kernel.org>; Mon, 25 Oct 2021 05:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=60LUac9TbUAUeihKiMhbVBI8yC6QLbGShqutIFMCmP0=;
        b=EHN7QEkaP6algAUHLgboVzmyUvL+Nw1o+J+uhG7qiE1MSHWoGrMfuC4hUImpbyfn7W
         Ez7IVPo3DiBZc0UcmSu953mL6KuL7RqTLLzA5Z/sfOEROFZnZ3LRFAjwKeRXN3n0Poj1
         GFyWn2XhJz8j/CWtJpTJEczMK7IRL6RTnC/SGd4KwOtmcdaYL3rNeVEtH6IkecWREGkT
         bYGzgXpTP6Jyj/klc7dA91ZPjdy9oHjZoXPwSvbSkkDhUHPlxAxx4yU8pRUYNMdk3LbZ
         J9aFWdNVVX+uwjfNg4fBrGZ2qXoWmUKYTh+QNLbWrFhfeJNEHoaPFbKbw8pW8Ld0Sptv
         O3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=60LUac9TbUAUeihKiMhbVBI8yC6QLbGShqutIFMCmP0=;
        b=J9UfxOzrQc/pM5NAdMlqXgQOUTA6I6bR0VoEe7fYvYEGTnA3fDR3ykaZPl90B9vJ6/
         zfIvUTpP2HfDeN7Y27aO/Ps6JOirY/Jgrxv4Sfe0e8Hnqr3dElehwGX6nM82SjKmhYOA
         6VyofSTpCXZMbyut6h5Bd+wYjdRSFFErp09hk+7qcU342Gy0Pe1JUwZZW2jZ9TOo0otl
         FsQKR6tuf86Sziy+Olyhgvixu0XrAwNR3pGB9+JBAwmArthi5rDkW3NxHaL772w+eFZ6
         RaEk+mCCfFRcGLXOvQ5vlDeJU1kigXp9OUUNgSzGMzUAqKZ0VSYp8B9eziTaALrc7fgs
         tlFQ==
X-Gm-Message-State: AOAM533B4qb+KunpE7I/br4+CnKoxYGlR47dSKVga6cvXTalH6kD+kS4
        G2TgNOlHBCyZ39giB+CKxNZrAiq+vcCrcg2OkRNEK6Y5NaA=
X-Google-Smtp-Source: ABdhPJxQnUv5U9DPUS58N/Qig4cIbYMFqDbkLvyDzwgzWBCIV9UBZd3vqm1DFoE5KM5Gv+Qve9tv9Ms8NwL3SCDtKg0=
X-Received: by 2002:a62:27c7:0:b0:44d:b86:54f2 with SMTP id
 n190-20020a6227c7000000b0044d0b8654f2mr17955354pfn.68.1635163719116; Mon, 25
 Oct 2021 05:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtsteSfwTQKV8o6VtBQDoz-+nwOf0s0X8BCkQHgAc6sdw@mail.gmail.com>
 <2ef5185a-9a0f-5ee0-23fc-37e0b1dd1099@gmx.de> <CA+QBN9DGZN=-Rfj3nc9TXd+OSRm9ipNC78HBsGWWo=qm+SB3zA@mail.gmail.com>
In-Reply-To: <CA+QBN9DGZN=-Rfj3nc9TXd+OSRm9ipNC78HBsGWWo=qm+SB3zA@mail.gmail.com>
From:   cp <carlojpisani@gmail.com>
Date:   Mon, 25 Oct 2021 14:08:38 +0200
Message-ID: <CA+QBN9CAQfBf6WuLRKRCVm_OOzN5VRNP2a4A1GNfnBFBUkC4+A@mail.gmail.com>
Subject: Re: ATI Rage XL
To:     linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

anyone?

any news about the mach64 support with kernel 5.* ?
cheers

> hi
> in the PA wiki (1) the ATI Rage XL (mach64) is reported to have
> worked. In combination with the fbdev X-server from XFree86/X.org
>
> I think the news was related to kernel 2.6 or something very old.
>
> Can anyone confirm it's still working with kernel 5.*?
>
> I don't happen to have a card to test myself. Not yet.
> (1) https://parisc.wiki.kernel.org/index.php/Graphics_howto
