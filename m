Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7215E82B7
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Sep 2022 21:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbiIWTxT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Sep 2022 15:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbiIWTxS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Sep 2022 15:53:18 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C42130710
        for <linux-parisc@vger.kernel.org>; Fri, 23 Sep 2022 12:53:17 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 84385580A10;
        Fri, 23 Sep 2022 15:53:13 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 23 Sep 2022 15:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1663962793; x=1663966393; bh=CPzJdRIyef
        IFIL6wOyy3xMdqx7XEvC95QDeVGbdSL8M=; b=fdsO0pBPvmTmmjWVAtu6NfQ3My
        svHnja3KP2HGjtho85NILwaggMtkS24yL/jtOtjZyyMs0gEhQaKeB3lXnXOmWmgd
        R16x0RCt4ovvWHE5iBZl0zqVoSa1mwZ6frz1Q7AdYgTJn+ANFxI+Fz5MhVG4gVAY
        d+Dz6osdXBeSgdy8q0QMQSyUr0oVOLKgANOSwUhSmNhylIxMXmjVnZgPsZUzXSKu
        RcADqrQqH396Vz7P6XdCYbdBWvLdUyb/ra8iRArrKwz+r3OZ/rJsYF6sZdSz7siZ
        oEQk3KbnHDMHcpgz3XFbyiGxGrHljjsgnBjxjIg5A5uypV20CYexpsXTrQKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1663962793; x=1663966393; bh=CPzJdRIyefIFIL6wOyy3xMdqx7XE
        vC95QDeVGbdSL8M=; b=qd1iS+Y7crgQlBPyNmpgGQscRqWv09Y4lmesh2ehHbz5
        klJpNWVgPtWyDcObEAUoFLmG9vkD9IqBmvEIjNKe4h8G8B+P4KWm2cPn6Y8nHkcR
        Ql9rNr5w7yqZmJZab+Y1Sy2Ptk4Jd4CErIl/g5bf9BidRRZLy6MMSL/aGfIrZeBh
        iCYiuDAS5UGdq9Rkb0aa7v0MSItswN3KZJOvC+nQAifmdmm+ZofqguHApn2JozuK
        JaB9mj9IUGt2P4oF90XfOTSuuKaH3erF14+AqiywL1ioU5vmRdg6VUIPpcjAIPjC
        nl3Zv6R2LZV8OoIa0QMs860ZjdO+9JAKormjW/uLvQ==
X-ME-Sender: <xms:qA4uY294ud_e8780W92RIJu4ASUJb8mVHdJNpKZlN-QT_bj-GnNYMA>
    <xme:qA4uY2sddnThOodffYUdP3S2lJrfWnewEkWdVTYhfWIRf2PBTVa9yjscLjTLUbXDi
    g7DynezA-hmdY2SKJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefiedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:qA4uY8AAvZRm0rufc819ZHz16KIiwNWI_aZcQbQHGmJXEGOcw5smrQ>
    <xmx:qA4uY-c9CZm8_D5gfvc6RHU_wlu69HPtN-SGvYdDbro1km0KLJPjoA>
    <xmx:qA4uY7OpxBVBd1r7Im8Kzjk8dj0h0wppF5U1LOcXbVx-Gh8KAeHT4w>
    <xmx:qQ4uY0YaamSY8mOm_tOL8ZMWBON-ZMYmHITV0XjuoBjdKXf-nRblDQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id AE227B60086; Fri, 23 Sep 2022 15:53:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <97efc9ed-886f-4a2d-b4bc-758adb8e02a0@www.fastmail.com>
In-Reply-To: <20220922191839.585186-1-linus.walleij@linaro.org>
References: <20220922191839.585186-1-linus.walleij@linaro.org>
Date:   Fri, 23 Sep 2022 21:52:50 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Helge Deller" <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] parisc: Drop homebrewn io[read|write]64_[lo_hi|hi_lo]
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Sep 22, 2022, at 9:18 PM, Linus Walleij wrote:
> The parisc implements ioread64_lo_hi(), ioread64_hi_lo()
> iowrite64_lo_hi() and iowrite64_hi_lo() while we already
> have a perfectly working generic version in the generic
> portable assembly in <linux/io-64-nonatomic-hi-lo.h>.
>
> Drop the custom versions in favor for the defaults.
>
> Fixes: 77bfc8bdb5a1 ("parisc: Remove 64bit access on 32bit machines")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Helge Deller <deller@gmx.de>
> Reported-by: Helge Deller <deller@gmx.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Arnd: please queue this on top of your pile in linux-arch
> if it looks all right.

Applied now, thanks!

      Arnd
