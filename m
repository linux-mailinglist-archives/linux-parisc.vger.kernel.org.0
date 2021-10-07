Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E64C424FBC
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Oct 2021 11:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhJGJLd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 7 Oct 2021 05:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbhJGJLd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 7 Oct 2021 05:11:33 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C31DC061746
        for <linux-parisc@vger.kernel.org>; Thu,  7 Oct 2021 02:09:40 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id i65so1842017pfe.12
        for <linux-parisc@vger.kernel.org>; Thu, 07 Oct 2021 02:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=G47iEv8ijur513m3oXt2DjERXpYquuSHXkprQwsGHU4=;
        b=f/pxUHw3Rrqjw6tIHywyA+Of7Qopx7DnnxZg6DmK5bjhWUqDcRJZ6PKX9OH0Me6Dic
         76Y5loQU3fdSpZ4XfdNDZXnZkS75fCYa6AfVrAqiaHciLMtuiwJF3QsTkKl4vtOeL4vE
         KCjK2aHMBymBOtl5P49IFDbfR9spzxpGSzdHx4W3rioM43dIOVTBhgtggArhM2b3weIM
         j8w5DOoQ9MdjcJMOek/c5ein0JDhIBM4FLpQ7IfNNFeSqoLEssETUdW3fTcYGdrUrEzt
         anJfJvmUCNgpSJm/YadM4ohY2da6IhtKM6+76AdVd/6xBT9IigVjyD2IxsBmilEJOevv
         icrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=G47iEv8ijur513m3oXt2DjERXpYquuSHXkprQwsGHU4=;
        b=JRDjgqL7vOw3Md6Kqxo6fkcE9iik4RAOsMGeVJ1NSrDkiD+JFLqw4vE9OGgGZnsl7B
         F2C7hfkJwAP2k13tLBcnLKNwPtVfo/ZwqZSEWz+XLhI/2hSRDFVFhFtPNYZtMjSbgF0p
         GBsL+OppAe93B8eSGx/wPGU+xGq2cpUw6Q7p9EOxCptR83alH6MexX7kKB9dFzD0ggzt
         oY6ZCe/NcegrnFPAGDGf80L71VKDxwpiMRM5R7bsQY06rbCZ8Dn28InshkG5U5e7GTey
         5dguVMfhsIJ3q9EiMred8aqEeyPYgi6sfYXt0YkMFqxLJV7wZnmRpyeu0yB7RmdbF0gU
         WSBQ==
X-Gm-Message-State: AOAM532LKKcXU2tgcJjdVB7t0YMKkC9S+m7i4iEndsOyg7vcfunz3afu
        6PUNBRH5JHKEQIQKzqa0Qr59PzyNyYvLM2I3hxMM1wx2iL0=
X-Google-Smtp-Source: ABdhPJzJli11+Th4UI66979vZb/EKrLPvFPnb9ALfpqlhCD1J6pZGzwt8xIPqlr3RG+5GdTnDlReVouJv0r/eiH/4ZQ=
X-Received: by 2002:a63:5911:: with SMTP id n17mr2458657pgb.177.1633597779371;
 Thu, 07 Oct 2021 02:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtsteSfwTQKV8o6VtBQDoz-+nwOf0s0X8BCkQHgAc6sdw@mail.gmail.com>
 <2ef5185a-9a0f-5ee0-23fc-37e0b1dd1099@gmx.de>
In-Reply-To: <2ef5185a-9a0f-5ee0-23fc-37e0b1dd1099@gmx.de>
From:   cp <carlojpisani@gmail.com>
Date:   Thu, 7 Oct 2021 11:09:43 +0200
Message-ID: <CA+QBN9DGZN=-Rfj3nc9TXd+OSRm9ipNC78HBsGWWo=qm+SB3zA@mail.gmail.com>
Subject: ATI Rage XL
To:     linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

hi
in the PA wiki (1) the ATI Rage XL (mach64) is reported to have
worked. In combination with the fbdev X-server from XFree86/X.org

I think the news was related to kernel 2.6 or something very old.

Can anyone confirm it's still working with kernel 5.*?

I don't happen to have a card to test myself. Not yet.

C.



(1) https://parisc.wiki.kernel.org/index.php/Graphics_howto
