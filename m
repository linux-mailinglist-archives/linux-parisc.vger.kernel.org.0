Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7660145CC45
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Nov 2021 19:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350828AbhKXSn3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 24 Nov 2021 13:43:29 -0500
Received: from outbound5h.eu.mailhop.org ([18.156.94.234]:33831 "EHLO
        outbound5h.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350906AbhKXSnY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 24 Nov 2021 13:43:24 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1637779214; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=abPTzITWqOzatKuUBFUCfmGlxMdfNhMNInfqWxjlnMv1zxQd1TpxpfMckdw8HWQZsQx7p528KENVk
         ppCujtSJzr2ePFzvlmWwUiLOjcgqx/SOiDFSs6QvvD/gEbI31DoeEe10/mWqP1nNYtcx/lvni0p1xK
         AXqLNHzDQPkHqdAWhmvpSuNMQvILs3ItDVa2ZPIBvQ7N8o6heoJf5t3TL+MnVOJH5Vrm0tnVB/Ic7S
         zPklbCYucZU84Wcrdf6eRUL8GpZevarHdmN/sP5PucBlHlA+QD70OtHNfBWGgJ1cYtl50dFDL4hMRp
         Y16JLUHdMndlXw6NmHmayxfTua/OF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:message-id:date:subject:to:from:dkim-signature:
         dkim-signature:from;
        bh=qCAqzTXmhf9ZGKj8dwJrzKH1jzYLtNez/+yPXoLBMgw=;
        b=hjco+YAZgIausRLKuF3m5NpwAzWz2zHXEoIfvs50Xrj4puwUnOa7PGLC0G3CeqAcoSaBtvOX/dJ41
         aSJoDiO1Ndo5aJ/AhmoshGbQYSDixIgp70ZJGTtY1UQ4sx71bk5aIcCxw2CGZRmDXqP5kqwnwB3isZ
         cvehbo/Up1VA+FrGZWPX+IjfZPbAlUGElrUy4hPLhImCyeDUBiefAw01rjCkIHh8Xwy8YYt41dGDsx
         soJEzhn0JvuE1Bqrj0IXBj4FaGagjIYvvMoB697/jCad3TSxl3xDMiHNjTju/fx3UgTUDgPyaavZJq
         7kbNZkNt4/98SU/CFtOwdbrtgIM+hkw==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-type:mime-version:message-id:date:subject:to:from:from;
        bh=qCAqzTXmhf9ZGKj8dwJrzKH1jzYLtNez/+yPXoLBMgw=;
        b=kW+Ck4s0qJX52st9fsFnjdVEJzMBy5NnPeBb2T+xXRK4cwTSijrPVtRw76sid4iKVAS3WFSYQA/Xb
         i63Haf5juc2TU9nDCgXmk5+jADH2zhCayKkongdM+YETPR05KLYe/fXFiLb3bzm6w/0/z0mP1gxPah
         mDSfo43CAa0t2e8o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:message-id:date:subject:to:from:from;
        bh=qCAqzTXmhf9ZGKj8dwJrzKH1jzYLtNez/+yPXoLBMgw=;
        b=gnGIUQn9XHtu3eSErRpLDsReC5VW6KXDXhW9AK3+xFkFrG66cUqJiymrLcstFLWGrQhVeV/BG2UM1
         4A4O5gmu6SZQyoKVKJ/FvNonAUjogwvKtI3j32ZLPKHWgWNajwdkpUs0l+r/mHrPm/OTYK6ZhbPhMZ
         2XT9WHeK/+Z9W8kkJMQE0tbh/mt00k7pTiAwu75b+4O8g18h0qu/4fRScN1WXjQczZ3RkHHjC3CwTa
         UiYQiEa97iQif2U1tPZom8rOegU/7haLeEqFGVP7urN0aKnqJOL5OAPNOJlQBsvWCF5IWRockeUUBf
         6zENuHFayswmCu2jikTgO5XGmREFZZw==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: f4b9b7d0-4d55-11ec-a072-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id f4b9b7d0-4d55-11ec-a072-973b52397bcb;
        Wed, 24 Nov 2021 18:40:12 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mpxBi-00FtDM-Tl
        for linux-parisc@vger.kernel.org; Wed, 24 Nov 2021 20:40:11 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Subject: hpgraphics RPM for visualize FX cards
Date:   Wed, 24 Nov 2021 19:40:09 +0100
Message-ID: <87wnkx5ree.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

https://parisc.wiki.kernel.org/index.php/VisualizeFX mentions
a hpgraphics rpm that contains a few header files for the FX
cards. Does anyone still has a copy of that RPM?

I've figured most of the 2D stuff out, i.e. i can boot the card
even without STI initialization by the Firmware (aka BCH). The only
thing i haven't figured out is how to configure true color mode. I hope
i can get some idea from the header files.

Regards
Sven
