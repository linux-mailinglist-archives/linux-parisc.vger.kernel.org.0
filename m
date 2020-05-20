Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B603B1DB5CA
	for <lists+linux-parisc@lfdr.de>; Wed, 20 May 2020 15:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgETN5S (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 20 May 2020 09:57:18 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:54370 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgETN5S (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 20 May 2020 09:57:18 -0400
Date:   Wed, 20 May 2020 15:57:12 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, James.Bottomley@HansenPartnership.com
Subject: Re: [PATCH 320/320] ipl: Ensure no GCC builtins replace string
 functions
Message-ID: <20200520155712.434df07b@wim.jer>
In-Reply-To: <20200520101945.9676-1-jer@gentoo.org>
References: <20200520101945.9676-1-jer@gentoo.org>
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 20 May 2020 12:19:45 +0200
Jeroen Roovers <jer@gentoo.org> wrote:

> With GCC 10, [...]

Please ignore this one.


Cheers,
     jer
