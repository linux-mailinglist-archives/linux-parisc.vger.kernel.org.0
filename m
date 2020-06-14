Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6A91F891B
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Jun 2020 16:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgFNOEg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 14 Jun 2020 10:04:36 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:40279 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725815AbgFNOEg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 14 Jun 2020 10:04:36 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20200614140434.YFIX5779.mtlfep01.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 14 Jun 2020 10:04:34 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm01.bell.net
          with ESMTP
          id <20200614140434.VYK130487.mtlspm01.bell.net@[192.168.2.49]>;
          Sun, 14 Jun 2020 10:04:34 -0400
Subject: Re: [PATCH] parisc: Prevent optimization of loads and stores in
 atomic operations
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Rolf Eike Beer <eike@sf-mail.de>
References: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net>
 <aca3f8ae-1cf1-6920-ef6a-7a3585dd1d09@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <a0ba7407-b0d7-15a7-f79f-3b58b550a27e@bell.net>
Date:   Sun, 14 Jun 2020 10:04:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <aca3f8ae-1cf1-6920-ef6a-7a3585dd1d09@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=nTHF0DUjJn0A:10 a=FBHGMhGWAAAA:8 a=voJj5tcXdwHaTdewCWgA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfJRyvRG9bDY77N2Umf4+yMy614qWUNaDwJ7bza1/aiNe83iM6d/EeJHEnUYHqrgDJfavzyEFIzXvcbSr/unewjzPavst41A3DZVX+/tbfUnueLjeRDeF XL+2mvEPUqS5sLjdin+XKhauCPXgb+A7NMpWb23mbJABmF9YNMYuIIJJ92tMtS3X8oIo/av3XSZyyw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-06-13 7:08 p.m., Helge Deller wrote:
> Regarding your changes to bitops.c, can't we instead
> simply tag the parameter ptr with "volatile", e.g.
>  unsigned long __xchg64(unsigned long x, volatile unsigned long *ptr)
>  unsigned long __xchg32(int x, volatile int *ptr)
>  unsigned long __xchg8(char x, volatile char *ptr)
In developing this change, I intentionally avoided changing any interfaces.  This would certainly
have the same affect and is similar to what is done in the __cmpxchg_u64 and __cmpxchg_u32 routines.

Dave

-- 
John David Anglin  dave.anglin@bell.net

