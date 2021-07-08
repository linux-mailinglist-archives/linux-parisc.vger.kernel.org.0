Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9133C15B1
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Jul 2021 17:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhGHPLc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 8 Jul 2021 11:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbhGHPLb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 8 Jul 2021 11:11:31 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBADC06175F
        for <linux-parisc@vger.kernel.org>; Thu,  8 Jul 2021 08:08:49 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id y9so5038481qtx.9
        for <linux-parisc@vger.kernel.org>; Thu, 08 Jul 2021 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:organization:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A2lQ1y/orDMQNUEXLTETNoGW6ipZLA49f+lo4DxkQTA=;
        b=IG0/w+IMGrUw6Vr3pXUAy4w51HrdpzH+dp5MCiPrbr0zOwkBHS+AsMmD8SQuMFUjYU
         Hs1tTHwUVegLVDNMlVXG3PpxTjcV+yVbUxf4ktyIbU0gGzLcu1JtnBZt2qYB7C5Vk5u/
         YFoIbAM2ypS++mIC+o6Bp2h6nLQn6JB4T66U9kx0UnPXf7GDxEYyFVs7veg4NhozdKKQ
         Fk8o39aXquvFqA38yBPaiG2tLtRDh5znGierjZj+1Mc4nK+ayQ0yH/kSN4pMJrrZTSG+
         GjCbIvX04r3lQUknRz+S0JdN3v36N0oKWEbssE9UCyWXFxQ4X30dzif77erBefXraMBn
         JaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=A2lQ1y/orDMQNUEXLTETNoGW6ipZLA49f+lo4DxkQTA=;
        b=srZ3ZC60lyPX5sYu1vWu/Kc+PyL9q7UJq7vpIEernB0cA0lYOhrmPx9HN6SlajJ8GW
         0gfG2DfeXNoF2x4c2rDJlhsqIFeHa9+BLIqQrFRy3YOlmQpY1f7EUYm3MwQoKsxiGMF0
         WNO9MCB6C3zOvNVy8TAr3IkJA6NFbXzIYR3f/wKSRxAXhKTfKfman0QVwYS51WCtGfgI
         cVueLssPj27BMsNUeD0B5udRSuPoyCmfNX/5XorC10VO8+pTmxuV0ztvFla7IQhti/qa
         lJ3VvLchcW31laVwndaeqvpWbEroXbfhHD96qj2o8xN+DYJyABmmenCAhsDFRx+rKoa+
         J2Yg==
X-Gm-Message-State: AOAM531oh0VAhvxZByn1dswOFHTzLOxHC39DomAAnDB+DA9ViXm/cqAH
        Hpzo1um1ncOKbRH9RlhgdJrW6A==
X-Google-Smtp-Source: ABdhPJykAIb6xl/0NUHtNKq/lDZDnYHUiHAevTI568j20etsPdR21J/3F20fBzYO5JQ8Nidjfn05/g==
X-Received: by 2002:ac8:5c83:: with SMTP id r3mr28469432qta.78.1625756928553;
        Thu, 08 Jul 2021 08:08:48 -0700 (PDT)
Received: from iron-maiden.localnet ([50.225.136.98])
        by smtp.gmail.com with ESMTPSA id t30sm1106247qkm.11.2021.07.08.08.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 08:08:48 -0700 (PDT)
From:   Carlos Bilbao <bilbao@vt.edu>
To:     gregkh@linuxfoundation.org
Cc:     andrew@lunn.ch, alexander.deucher@amd.com, davem@davemloft.net,
        mchehab+huawei@kernel.org, kuba@kernel.org,
        James.Bottomley@hansenpartnership.com, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: Follow the indentation coding standard on printks
Date:   Thu, 08 Jul 2021 11:08:47 -0400
Message-ID: <7263255.EvYhyI6sBW@iron-maiden>
Organization: Virginia Tech
In-Reply-To: <YOcRfBtS/UJ81CFq@lunn.ch>
References: <2784471.e9J7NaK4W3@iron-maiden> <YOcRfBtS/UJ81CFq@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello,

> - Your patch did many different things all at once, making it difficult
>  to review.  All Linux kernel patches need to only do one thing at a
>  time.  If you need to do multiple things (such as clean up all coding

Greg, I am going to divide the patch in three parts, for atm/, net/ and parisc/.

> 
> Why not use DPRINTK(), defined at the start of suni.c?
> 
>     Andrew

Thanks for the idea Andrew, I will make a new version of the net/ patch.

thanks,
Carlos. 


