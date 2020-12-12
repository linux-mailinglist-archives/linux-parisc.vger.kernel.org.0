Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0DC2D8398
	for <lists+linux-parisc@lfdr.de>; Sat, 12 Dec 2020 01:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390606AbgLLAq5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 11 Dec 2020 19:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728538AbgLLAqq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 11 Dec 2020 19:46:46 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16708C0613CF
        for <linux-parisc@vger.kernel.org>; Fri, 11 Dec 2020 16:46:06 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id m12so15911753lfo.7
        for <linux-parisc@vger.kernel.org>; Fri, 11 Dec 2020 16:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1p8BkEtCdcNBP/TpCqa88TfNrEdwTBnXM61elkmQDlU=;
        b=vPmJzs+nnMzMYiLeSl4C70AwwAUmtSXcRtz7EHFhXOG3+HSYoFdEGzQYdbnIfuLhe1
         cpLA6/bKDco/ZW56K0yojauLy12p9RMJ4MYQUMAZkQKn1JGQikvuaZfR0PCAwR/VHwqu
         l8KSlmgfW9XQH81QbMWcZWDg6fTfP5u9gInsHFToPISthtmCvix2Zi4MyAVk8WOEDUbJ
         6rVaVkrA8lMaHHNzl8tzPLP3FKzwRwCbx4UWePv66IKRrK3BWVszh2/HuHa0/BXzK05/
         +RmxfJa60vjGUHEMlcdmB6LQFBStfB7tIZX79j1mfET935nYYecl+y81TGJ83zzfgTnD
         hTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1p8BkEtCdcNBP/TpCqa88TfNrEdwTBnXM61elkmQDlU=;
        b=NZXX1021BMUVFVAfeDnHQr4UheWOJxTYHgjb4v0PM5ff63M0rtum0GouHlvuZbcynU
         7BltiyHuy39VI2s1duvvflwp3/+6w9TJdkUCsPCthz2PoaR3aQLnJyAkjAvolsQ/fbjx
         MpWoEbJRmaL0YOCbjscQ4m85FFc5SoGmkRFbr49Y+zzV2rYYm/c4mM/DWygH3pPfD5Ca
         /zaWwpWDgKoiT+pBjxiyDjwE7JxTZ7TdlnhmLLBmP5EahjkHAZHR2jYPGjdXN3oVlLcu
         yp1ewjWNfM0FqN/sQZkbfSLtuIwxxRCcT05udTW7Iuuhqg5NJe/OWiujMZPD0Uq1n1+a
         DXRg==
X-Gm-Message-State: AOAM530Wr/MnlMMel7fd71+JNUR4HttFyyyKbRGfMA6p40fUdmrsMkuK
        RvYnOZn4bcGNT4b4GPGTNfPuj3sbMi/M4bjgEmvASA==
X-Google-Smtp-Source: ABdhPJw+G3KfJG3M7IoDnPiDCepv2YgkNV/jArpapqMifWmjCRwgJbTiMDpguzIYWZxJHM0zdf1udksfd+uvUSH+FdI=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr2692550ljo.368.1607733964618;
 Fri, 11 Dec 2020 16:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de> <20201210194044.065003856@linutronix.de>
In-Reply-To: <20201210194044.065003856@linutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 01:45:53 +0100
Message-ID: <CACRpkdbKZzaTq+Am6q38Ya5wuUjiMbLE5g2i8bb_mJEWTkXgCg@mail.gmail.com>
Subject: Re: [patch 15/30] pinctrl: nomadik: Use irq_has_action()
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        Tariq Toukan <tariqt@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        netdev <netdev@vger.kernel.org>, linux-rdma@vger.kernel.org,
        Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Dec 10, 2020 at 8:42 PM Thomas Gleixner <tglx@linutronix.de> wrote:

> Let the core code do the fiddling with irq_desc.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose you will funnel this directly to Torvalds, else tell me and
I'll apply it to my tree.

Yours,
Linus Walleij
