Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D972F3A00C
	for <lists+linux-parisc@lfdr.de>; Sat,  8 Jun 2019 15:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfFHNvT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 8 Jun 2019 09:51:19 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:44166 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726870AbfFHNvT (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Jun 2019 09:51:19 -0400
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jer)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 192A1345A00;
        Sat,  8 Jun 2019 13:51:17 +0000 (UTC)
Date:   Sat, 8 Jun 2019 15:51:14 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>, hppa@gentoo.org
Subject: Re: [RESEND V2] modprobe: ERROR: could not insert 'ipv6': Exec
 format error / module ipv6: Unknown relocation: 72
Message-ID: <20190608155114.11ea7bc7@wim.jer>
In-Reply-To: <f3b34093-1b01-f321-3b98-6708cdc25434@gmx.de>
References: <20190608145201.56c667f5@wim.jer>
        <f3b34093-1b01-f321-3b98-6708cdc25434@gmx.de>
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 8 Jun 2019 15:41:45 +0200
Helge Deller <deller@gmx.de> wrote:

> You could try attached untested patch.

I will.

> Can you send your .config ?

I have uploaded it here: https://dev.gentoo.org/~jer/c8000.config


Regards,
     jer
