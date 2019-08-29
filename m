Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A91A1F5D
	for <lists+linux-parisc@lfdr.de>; Thu, 29 Aug 2019 17:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfH2Pi1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 29 Aug 2019 11:38:27 -0400
Received: from verein.lst.de ([213.95.11.211]:47339 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbfH2Pi1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Aug 2019 11:38:27 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 904E468B20; Thu, 29 Aug 2019 17:38:23 +0200 (CEST)
Date:   Thu, 29 Aug 2019 17:38:23 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     iommu@lists.linux-foundation.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        Takashi Iwai <tiwai@suse.de>, linuxppc-dev@lists.ozlabs.org,
        Helge Deller <deller@gmx.de>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: remove default fallbacks in dma_map_ops v3
Message-ID: <20190829153823.GA20459@lst.de>
References: <20190808160005.10325-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808160005.10325-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I've applied this to the dma-mapping for-next tree now.

If there are any issues with the parisc patch I'll happily take
incremental patches.
