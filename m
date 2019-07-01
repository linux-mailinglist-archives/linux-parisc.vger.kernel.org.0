Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4BA52356
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Jun 2019 08:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbfFYGOF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 25 Jun 2019 02:14:05 -0400
Received: from verein.lst.de ([213.95.11.211]:59791 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbfFYGOE (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 25 Jun 2019 02:14:04 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 4350A68B02; Tue, 25 Jun 2019 08:13:32 +0200 (CEST)
Date:   Tue, 25 Jun 2019 08:13:32 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Vladimir Murzin <vladimir.murzin@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>, Vineet Gupta <vgupta@synopsys.com>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        Helge Deller <deller@gmx.de>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm-nommu: remove the partial
 DMA_ATTR_NON_CONSISTENT support
Message-ID: <20190625061332.GC28986@lst.de>
References: <20190614144431.21760-1-hch@lst.de> <20190614144431.21760-2-hch@lst.de> <a017e704-c6c4-7718-7f8b-eb8a0eced14d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a017e704-c6c4-7718-7f8b-eb8a0eced14d@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jun 24, 2019 at 03:23:08PM +0100, Vladimir Murzin wrote:
> On 6/14/19 3:44 PM, Christoph Hellwig wrote:
> > The arm-nommu DMA code supports DMA_ATTR_NON_CONSISTENT allocations, but
> > does not provide a cache_sync operation.  This means any user of it
> > will never be able to actually transfer cache ownership and thus cause
> > coherency bugs.
> 
> By the way, Documentation/DMA-attributes.txt doesn't specify cache_sync() as
> requirement for DMA_ATTR_NON_CONSISTENT it only states that it is responsibility
> of the driver to have all the correct and necessary sync points.

True.  dma_cache_sync has always been a rather odd interface, as it
doesn't specify in what direction we need to sync and doesn't
participate in our ownership protocol.  So my mid-term plan is to kill
it off and replace it with the existing dma_sync_* helpers.  This
series is the first step towards that.
