Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B365C3331
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2019 13:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732532AbfJALo2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 1 Oct 2019 07:44:28 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38880 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732423AbfJALo2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 1 Oct 2019 07:44:28 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0CE3325B7D2;
        Tue,  1 Oct 2019 21:44:26 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D65B994046A; Tue,  1 Oct 2019 13:44:23 +0200 (CEST)
Date:   Tue, 1 Oct 2019 13:44:23 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Helge Deller <deller@gmx.de>
Cc:     Sven Schnelle <svens@stackframe.org>, kexec@lists.infradead.org,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH] kexec-tools: add support for PARISC architecture
Message-ID: <20191001114421.zrbfjxmzlbz23zfy@verge.net.au>
References: <20190919182624.8543-1-svens@stackframe.org>
 <7250dbc3-9d6d-5971-216a-f164a6933f28@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7250dbc3-9d6d-5971-216a-f164a6933f28@gmx.de>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Sep 21, 2019 at 08:36:51PM +0200, Helge Deller wrote:
> On 19.09.19 20:26, Sven Schnelle wrote:
> > This patch adds support for the parisc Architecture. kexec support
> > for parisc is included with linux-5.4.
> >
> > Signed-off-by: Sven Schnelle <svens@stackframe.org>
> 
> Tested-by: Helge Deller <deller@gmx.de>

Thanks, applied.
