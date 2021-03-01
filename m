Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0150A328577
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Mar 2021 17:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbhCAQyB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Mon, 1 Mar 2021 11:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbhCAQu0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Mar 2021 11:50:26 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFBBBC061788
        for <linux-parisc@vger.kernel.org>; Mon,  1 Mar 2021 08:49:45 -0800 (PST)
Received: (qmail 14914 invoked from network); 1 Mar 2021 16:49:43 -0000
Received: from p548d494d.dip0.t-ipconnect.de ([::ffff:84.141.73.77]:45124 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 01 Mar 2021 17:49:43 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's max_cycles value
Date:   Mon, 01 Mar 2021 17:49:42 +0100
Message-ID: <5693583.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <11708426.O9o76ZdvQC@eto.sf-tec.de>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Am Montag, 1. März 2021, 17:25:18 CET schrieb Rolf Eike Beer:
> After upgrade to 5.11 get this multiple times per second on my C8000:
> 
> [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger than
> allowed by the 'jiffies' clock's max_cycles value (10): time overflow
> danger [   36.998705]          timekeeping: Your kernel is sick, but tries
> to cope by capping time updates

Not 5.11, but 5.10.11. 5.10.4 is fine. It could be a bad upgrade attempt, I'll 
retry once I have built a proper 5.11 kernel.


