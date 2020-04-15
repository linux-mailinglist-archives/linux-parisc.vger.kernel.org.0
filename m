Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F7B1AB42B
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Apr 2020 01:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389035AbgDOXWg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 15 Apr 2020 19:22:36 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:47074 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389018AbgDOXWe (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 15 Apr 2020 19:22:34 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6CA85120ED569;
        Wed, 15 Apr 2020 16:22:33 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:22:32 -0700 (PDT)
Message-Id: <20200415.162232.1194362016278310196.davem@davemloft.net>
To:     yanaijie@huawei.com
Cc:     snelson@pensando.io, kuba@kernel.org, hkallweit1@gmail.com,
        leon@kernel.org, mst@redhat.com, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        hulkci@huawei.com
Subject: Re: [PATCH] net: tulip: make early_486_chipsets static
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200415084248.24378-1-yanaijie@huawei.com>
References: <20200415084248.24378-1-yanaijie@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 15 Apr 2020 16:22:34 -0700 (PDT)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Jason Yan <yanaijie@huawei.com>
Date: Wed, 15 Apr 2020 16:42:48 +0800

> Fix the following sparse warning:
> 
> drivers/net/ethernet/dec/tulip/tulip_core.c:1280:28: warning: symbol
> 'early_486_chipsets' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied, thanks.
