Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC37E22523E
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Jul 2020 16:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgGSOh2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 19 Jul 2020 10:37:28 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:48357 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725988AbgGSOh1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 19 Jul 2020 10:37:27 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200719143726.JAW6697.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 19 Jul 2020 10:37:26 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20200719143726.KSY29322.torspm01.bell.net@[192.168.2.49]>;
          Sun, 19 Jul 2020 10:37:26 -0400
Subject: Re: [PATCH v1 1/1] parisc: add support for cmpxchg on u8 pointers
To:     Liam Beguin <liambeguin@gmail.com>,
        James.Bottomley@HansenPartnership.com, deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20200718201021.23918-1-liambeguin@gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <76ee667c-49e3-3a96-4d25-81141af94dee@bell.net>
Date:   Sun, 19 Jul 2020 10:37:27 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200718201021.23918-1-liambeguin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=FBHGMhGWAAAA:8 a=jARn7x6QT4rOXmr0p7kA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfBoCVJW6Vd9lAJEhsIJ5ghXctl8rC1eqTbX6JC+eczfb6i7QSoicm8P9q5p8mkkROeJrF0ld1IEuRkP8NmiZnhWsqbiylJAUe91eNcenFy4lbaDKvu9t veV8ZLR9HQJDXkepI10GDCWAE8Hyqab35cJs2opU0Zy3DOTpm3aYHFxWbJ7KDEGNt4KAdE27fT3Uag==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Looks good to me.

On 2020-07-18 4:10 p.m., Liam Beguin wrote:
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Liam Beguin <liambeguin@gmail.com>

Tested-by: Dave Anglin <dave.anglin@bell.net>

> ---
>  arch/parisc/include/asm/cmpxchg.h |  2 ++
>  arch/parisc/lib/bitops.c          | 12 ++++++++++++
>  2 files changed, 14 insertions(+)

-- 
John David Anglin  dave.anglin@bell.net

