Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99833226098
	for <lists+linux-parisc@lfdr.de>; Mon, 20 Jul 2020 15:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGTNSw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 20 Jul 2020 09:18:52 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:53914 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725815AbgGTNSv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 20 Jul 2020 09:18:51 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20200720131848.MESD5779.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 20 Jul 2020 09:18:48 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20200720131848.LWCM16482.mtlspm02.bell.net@[192.168.2.49]>;
          Mon, 20 Jul 2020 09:18:48 -0400
Subject: Re: [PATCH] parisc: Various spin lock optimizations
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <048514e6-5f68-acfa-dd1e-25d4b2d09897@bell.net>
Message-ID: <1b7c4278-973a-7f1f-f187-8d340aa74ce0@bell.net>
Date:   Mon, 20 Jul 2020 09:18:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <048514e6-5f68-acfa-dd1e-25d4b2d09897@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=4hRuaKOVhG5qoD_5gUsA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfAUpsc/wRl001nhwSw4CqBlsmdRXtphcOpD2dOkWuDzlWrX4xhtslei7qcNJsMmIrTHtypR3z/cH5hqlUdvXDvU+CpRniYNXpTidg+KO+7Yq66S57TJE EdDA/pYQv2KWm1TozNN+VLpXm7URN6DJma8R3ltjHgap8uSukFf0o22k4R0JJWlfxGjABBym3QH7FA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-07-19 2:41 p.m., John David Anglin wrote:
>  #define arch_spin_lock_flags arch_spin_lock_flags
> @@ -46,23 +44,16 @@ static inline void arch_spin_unlock(arch_spinlock_t *x)
>  	volatile unsigned int *a;
>
>  	a = __ldcw_align(x);
> -#ifdef CONFIG_SMP
> -	(void) __ldcw(a);
> -#else
> -	mb();
> -#endif
> +	__ldcw_mb(a);
>  	*a = 1;
>  }
I'm retesting using an ordered store for the release.  So far, it's looking okay.

Dave

-- 
John David Anglin  dave.anglin@bell.net

