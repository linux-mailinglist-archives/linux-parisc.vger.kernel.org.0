Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C1024C498
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Aug 2020 19:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729448AbgHTReZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Aug 2020 13:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730630AbgHTReI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Aug 2020 13:34:08 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C702BC061342
        for <linux-parisc@vger.kernel.org>; Thu, 20 Aug 2020 10:34:07 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id d11so2408643ejt.13
        for <linux-parisc@vger.kernel.org>; Thu, 20 Aug 2020 10:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=++DU+mGMau0wCVk26WL7BRudLdRoW/TdcNVBaFfSVeo=;
        b=WJVp6ukadTpNcM9SYJpDROIRN+tD3gRH5NoPQs0+HAsQmLtJTImp5dRFMc7wGC3HgN
         R/lFt0vUnPt7BGWZ9GyHNRaZ0vNwnvZs2Kqg3u8nexS2ZBfKmw9OlPBaaVZioiS7BHsl
         YQ4r7w5vrJPUKxgqdugvjbGIbRfRLzSot++CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++DU+mGMau0wCVk26WL7BRudLdRoW/TdcNVBaFfSVeo=;
        b=um0Ruh7fhjlIRdH1R1lUhBcZT/m8S9fMFTTDGem61n8rIBt6hyCTwLRepX9J5Bh8cH
         5/cIPSHLSBpWAVvAKWErJP0me+eMAZOBmYAyXiFloNgyW5ZKqA/Fk2FSUp7aAse6yygz
         gIJ85orBmP2CC+I/uU4LwJLvDTF6FD/TQyMgLRvzP2ojfS/FkXK/62VMn29SEM25D+Kc
         f19yM0yPMNxo2K1yjt0dUgEVfhWt+FASsdA/WpPDoKkT0DW2Kje2fuoAv07GLy9wLIFH
         /P0h9Dc8ZCBNpQ+E82Cwhci8McMz6ntEV3VJq1cR/+0gKXp8WhI+tG7CbW6Z27lLAc4o
         cL8g==
X-Gm-Message-State: AOAM531Ybcoj5cT2rJ7KnJbyh44j7Utg2Sh+xEpo4aPj0L5qUuONS1mr
        C3XENDGd5+oSstDUaERiBdf8u+NwPND9TA==
X-Google-Smtp-Source: ABdhPJzJ3MsOspugHVhEexXrfUEMgAt6NKskJvSBnT+7Yv2XDbkWR+aP37bDID9+DBvaxDEfgdkB+A==
X-Received: by 2002:a17:906:fa0b:: with SMTP id lo11mr4498693ejb.235.1597944845353;
        Thu, 20 Aug 2020 10:34:05 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id d9sm1671633edt.20.2020.08.20.10.34.02
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 10:34:04 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id a14so2841345wra.5
        for <linux-parisc@vger.kernel.org>; Thu, 20 Aug 2020 10:34:02 -0700 (PDT)
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr4013793wrn.385.1597944841643;
 Thu, 20 Aug 2020 10:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <20200819135454.GA17098@lst.de> <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com> <20200820165407.GD12693@lst.de>
In-Reply-To: <20200820165407.GD12693@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 20 Aug 2020 19:33:48 +0200
X-Gmail-Original-Message-ID: <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
Message-ID: <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
        linux-mips@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-mm@kvack.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-scsi@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Pawel Osciak <pawel@osciak.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Aug 20, 2020 at 6:54 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 20, 2020 at 12:05:29PM +0200, Tomasz Figa wrote:
> > The UAPI and V4L2/videobuf2 changes are in good shape and the only
> > wrong part is the use of DMA API, which was based on an earlier email
> > guidance anyway, and a change to the synchronization part . I find
> > conclusions like the above insulting for people who put many hours
> > into designing and implementing the related functionality, given the
> > complexity of the videobuf2 framework and how ill-defined the DMA API
> > was, and would feel better if such could be avoided in future
> > communication.
>
> It wasn't meant to be too insulting, but I found this out when trying
> to figure out how to just disable it.  But it also ends up using
> the actual dma attr flags for it's own consistency checks, so just
> not setting the flag did not turn out to work that easily.
>

Yes, sadly the videobuf2 ended up becoming quite counterintuitive
after growing for the long years and that is reflected in the design
of this feature as well. I think we need to do something about it.

> But in general it helps to add a few more people to the Cc list for
> such things that do stranger things.  Especially if you think you did
> it based on the advice of those people.

Indeed, we should have CCed you and other DMA folks. Sergey who worked
on this series is quite new to these areas of the kernel (although not
to the kernel itself) and it's my fault for not explicitly letting him
know to do that.

Best regards,
Tomasz
