Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541E4426629
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Oct 2021 10:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhJHIqu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 8 Oct 2021 04:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbhJHIqr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 8 Oct 2021 04:46:47 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C93C061762
        for <linux-parisc@vger.kernel.org>; Fri,  8 Oct 2021 01:44:52 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id t11so5685310plq.11
        for <linux-parisc@vger.kernel.org>; Fri, 08 Oct 2021 01:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=62iRjIHcD+GLCAX5WEZWkLOx2AnHo5X7tjkwddYbYuM=;
        b=cTs40z83ZqwsvHbzKJebMpNMDuDX9Wq02Dpdi29b8XaDkDtmyGMpsUtxvZw4EsHqnC
         XfB/g2bw5K+QjubKao3XeJl3WJzRypnq1FoNZ0ZbIMrQIRYT6zMqVcRnA04dlFwPwv2a
         ES/9EdP/yJwKVqkF9tL7quM8GWT1NSHaoDxxXXy0cX+8oJcVCCrzs1qiE4T3j16Dq52g
         FTlqJ2tLQ6o2aFVdkl4vNmK+H5wgLwwalAewMBQF85iBBj6cyVwawOucJtFU48lEMKH4
         jIU2PQ7foozUuepeBQINM/ad+v9IqXM6To8U4Rl5jmZOIX4Pb6Gs4oSzPNITG2C5h3nH
         Myjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=62iRjIHcD+GLCAX5WEZWkLOx2AnHo5X7tjkwddYbYuM=;
        b=oz2ArMw9C+CEE5wBSDvzP9oHSY84g6i4srpDoVPMvpOkYvDAwp9RNm5L4t7+Jdq6p4
         isnbcITNOfHHdp4jChg5+VjOHaIeyerQ+MmNn5gnBl4uyFVx5Mtrecq9FSjbl1SmyuCI
         oqElNa7OtZ3RSB+/j3xQJKP7YAzVCOBmv1Bfk8hdRAT//C1TJyKnM2x+dCYnd6fEnc6Z
         sT24/5XMKLXcKpgrNrvhdnSz6jKqJEnH7EBM/asvO8gAQN2eV+RkVz0RRCnRQMxuFXm1
         hI+fMnMDaIhgrZFJSMI/d65cpiKoJudFkoZXoRWiboo2c2XDVIDfi4kitopMWZhnEy8t
         Cm3Q==
X-Gm-Message-State: AOAM530d8V+I5/gdzpazvKubmgzKGKgyR7WnwBd5a+k1sqFBS3ZFfZy0
        1CbB38vMuKlBfbIESU7FJEF7HA0SG8FbSxIxOo4/wXAcHr4=
X-Google-Smtp-Source: ABdhPJx5cvNEbipRaOxpM3LQ4Etcflm6tR/3MQvwtqD1GJ+tw3JKswlHTaupcS06vZq+AYiodEItfjOEydmg2OJuOHA=
X-Received: by 2002:a17:902:7d89:b0:13c:a5e1:f0f1 with SMTP id
 a9-20020a1709027d8900b0013ca5e1f0f1mr8354852plm.24.1633682692141; Fri, 08 Oct
 2021 01:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtsteSfwTQKV8o6VtBQDoz-+nwOf0s0X8BCkQHgAc6sdw@mail.gmail.com>
 <2ef5185a-9a0f-5ee0-23fc-37e0b1dd1099@gmx.de> <CA+QBN9DGZN=-Rfj3nc9TXd+OSRm9ipNC78HBsGWWo=qm+SB3zA@mail.gmail.com>
In-Reply-To: <CA+QBN9DGZN=-Rfj3nc9TXd+OSRm9ipNC78HBsGWWo=qm+SB3zA@mail.gmail.com>
From:   cp <carlojpisani@gmail.com>
Date:   Fri, 8 Oct 2021 10:44:54 +0200
Message-ID: <CA+QBN9DCNEV7xOsGrvbncEU1oj14QX1cpPJNTT3A9STpVGGwmw@mail.gmail.com>
Subject: Re: ATI Rage XL
To:     linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Apple PowerBook-G3 use these cards

Name       , Model , GPU             , driver , vram ;
wallstreet , M4753 , ATI Rage LT     , mach64 ,  2MB ;
lombard    , M5343 , ATI Rage Pro LT , mach64 ,  8MB ;
pismo      , M5343 , ATI Rage 128    , ati128 ,  8MB ;

So maybe there is still some interest in supporting their kernel drivers.
Sooner or later I will try to grab some of these PCI cards and try
them with HPPA on modern 5 kernels. *

I know there is also a miniPCI version of the ATI RageXL and it's used
with some IBM servers, so again, maybe there is still some interest
even from those guys ...

On Thu, 7 Oct 2021 at 11:09, cp <carlojpisani@gmail.com> wrote:
>
> hi
> in the PA wiki (1) the ATI Rage XL (mach64) is reported to have
> worked. In combination with the fbdev X-server from XFree86/X.org
>
> I think the news was related to kernel 2.6 or something very old.
>
> Can anyone confirm it's still working with kernel 5.*?
>
> I don't happen to have a card to test myself. Not yet.
>
> C.
>
>
>
> (1) https://parisc.wiki.kernel.org/index.php/Graphics_howto
