Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C06749112C
	for <lists+linux-parisc@lfdr.de>; Mon, 17 Jan 2022 21:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243041AbiAQU7I (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 17 Jan 2022 15:59:08 -0500
Received: from mailproxy02.manitu.net ([217.11.48.66]:52406 "EHLO
        mailproxy02.manitu.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235739AbiAQU7I (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 17 Jan 2022 15:59:08 -0500
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Jan 2022 15:59:08 EST
Received: from [192.168.2.104] (85-22-8-212.ip.dokom21.de [85.22.8.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: bodack@yb1.de)
        by mailproxy02.manitu.net (Postfix) with ESMTPSA id 50CEDC1861;
        Mon, 17 Jan 2022 21:54:03 +0100 (CET)
Message-ID: <ad76da1f-0fc4-30d9-cf11-d54246132acd@yb1.de>
Date:   Mon, 17 Jan 2022 21:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org
References: <20201019145750.GA17788@ls3530.fritz.box>
Subject: Re: [PATCH] hil/parisc: Disable HIL driver when it gets stuck
From:   list04 <list04@yb1.de>
In-Reply-To: <20201019145750.GA17788@ls3530.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello Helge,

i tried to install Debian with a current kernel > 5.8 on a HP 735/125, 
but HIL keyboard doesn't work anymore.
Error message: HIL MLC: HIL seems stuck - Disabling HIL MLC.
This always happens whether the HIL keyboard is connected or not. So I 
suspect there is a problem with this patch on this particular hardware. 
Maybe there is a solution for this.

Best Regards
Yves

