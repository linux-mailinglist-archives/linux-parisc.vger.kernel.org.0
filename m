Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C3E225202
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Jul 2020 15:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgGSNnY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 19 Jul 2020 09:43:24 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:53773 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726038AbgGSNnX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 19 Jul 2020 09:43:23 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20200719134322.IAEF5779.mtlfep01.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 19 Jul 2020 09:43:22 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm01.bell.net
          with ESMTP
          id <20200719134322.EWIC130487.mtlspm01.bell.net@[192.168.2.49]>;
          Sun, 19 Jul 2020 09:43:22 -0400
Subject: Re: [PATCH] parisc: Fix spinlock barriers
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
 <20200711005018.05540239@wim.jer>
 <31b55b8c-2db7-c26e-f0a5-7e1ac1e520af@bell.net>
 <6677672.SoggAjMoo5@daneel.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <ba88c766-c042-3bf9-49a9-2c7ebd7a2650@bell.net>
Date:   Sun, 19 Jul 2020 09:43:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6677672.SoggAjMoo5@daneel.sf-tec.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=N659UExz7-8A:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=58QHTjMU1FHTZKGKNDEA:9 a=pILNOxqGKmIA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfGgYadeV2SVpMiHHl8EoBSOtJQJ08HzW0mZnwJu7ojp0RCBzOLXEjAg9hCYaGzihYIrBPj9OznWkelpwMQJcfcj04N/9UU9NqqZSNn+TsbL2DmAKCxQi ierpN7zY2/nBCtc2UScRPc6XzmtPNBo1u9TLp31WnpDaNJQPZgLJtTy3jMm+yGPKR/NRviPU8dtycg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Eike,

Excellent, this is the backtrace which we needed to see.  This is same stall as the one I
see building libpreludedb.

I'm going to send a new patch with the real fix soon.  The previous patches just messed
with the timing of things.

On 2020-07-19 3:03 a.m., Rolf Eike Beer wrote:
> [835212.602791]  IAOQ[0]: d_alloc_parallel+0x424/0x668
> [835212.602791]  IAOQ[1]: d_alloc_parallel+0x428/0x668
> [835212.602791]  RP(r2): d_alloc_parallel+0x16c/0x668
> [835212.602791] Backtrace:
> [835212.602791]  [<000000004034a5f0>] __lookup_slow+0xb0/0x280
> [835212.602791]  [<000000004034c6a0>] walk_component+0x1d8/0x300
> [835212.602791]  [<000000004034cd88>] path_lookupat+0xd0/0x228
> [835212.602791]  [<000000004034fa64>] filename_lookup+0xac/0x1a8
> [835212.602791]  [<000000004034fccc>] user_path_at_empty+0x74/0x90
> [835212.602791]  [<000000004033c774>] vfs_statx+0xd4/0x1a0
> [835212.602791]  [<000000004033cdb8>] __do_sys_stat64+0x48/0xa0
> [835212.602791]  [<000000004033d5f0>] sys_stat64+0x20/0x30
> [835212.602791]  [<0000000040191018>] syscall_exit+0x0/0x14

Regards,
Dave

-- 
John David Anglin  dave.anglin@bell.net

