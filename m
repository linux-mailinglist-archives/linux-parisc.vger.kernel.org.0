Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495073A04D
	for <lists+linux-parisc@lfdr.de>; Sat,  8 Jun 2019 16:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfFHOtT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 8 Jun 2019 10:49:19 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:48290 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727035AbfFHOtT (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Jun 2019 10:49:19 -0400
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jer)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 75E20345A02;
        Sat,  8 Jun 2019 14:49:18 +0000 (UTC)
Date:   Sat, 8 Jun 2019 16:49:14 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>, hppa@gentoo.org
Subject: Re: [RESEND V2] modprobe: ERROR: could not insert 'ipv6': Exec
 format error / module ipv6: Unknown relocation: 72
Message-ID: <20190608164914.1b8d546f@wim.jer>
In-Reply-To: <487d5cc9-742b-82f1-604c-f24848c1580c@gmx.de>
References: <20190608145201.56c667f5@wim.jer>
        <f3b34093-1b01-f321-3b98-6708cdc25434@gmx.de>
        <487d5cc9-742b-82f1-604c-f24848c1580c@gmx.de>
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 8 Jun 2019 16:32:47 +0200
Helge Deller <deller@gmx.de> wrote:

> Jeroen, I think the last patch I sent to you should help...

It does!


     jer
