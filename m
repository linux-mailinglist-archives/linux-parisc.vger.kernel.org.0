Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15C94578CB
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Nov 2021 23:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhKSWcS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Nov 2021 17:32:18 -0500
Received: from mta-tor-002.bell.net ([209.71.212.29]:39504 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230392AbhKSWcR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Nov 2021 17:32:17 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61976487000BFB62
X-CM-Envelope: MS4xfNMfBse6HPxRsw7wJyiS7be17ptV+WdKiu8PrNz4lZWkeKKBeSJR6aC15MeOF47Ln8Nm+cdxuTXdoTNo/LPUFgY0O4hkbT9nodcgurZXw+LqUQ5ocPZz
 IPZqM1qpp8xvpLcWouCCH9OSGL3s3SSNpZNih66JxweZPfZMURoYp7IVWLHMwIDPqO54N2F64bqYfCt1jj2xBrVNjpKm+rQfEmNQ/2Qe/T+AdIyvdMeGhGjz
 n/CbxVnUDpVWNU+x5zu/NMFlF7+QzDhINLJIgBEVSDJKES9Y9yDkpwuAcbvnAwpmQ8LXKnnKRFkv92LNoPh3Jtv90osOjMV3kv7qAWwpCS+oFpWg6GV5FayB
 7AdUCI+/p3BTkngK+g/XKpjIdmolgg==
X-CM-Analysis: v=2.4 cv=W7Vb6Tak c=1 sm=1 tr=0 ts=6198253a
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=jaAiz0gFaRuETUzI4n8A:9 a=QEXdDO2ut3YA:10
 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61976487000BFB62; Fri, 19 Nov 2021 17:29:14 -0500
Message-ID: <093e8bd8-73ab-b33f-8488-00080e3a040c@bell.net>
Date:   Fri, 19 Nov 2021 17:29:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/4] parisc: Increase FRAME_WARN to 4096 bytes on parisc
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Sven Schnelle <svens@stackframe.org>,
        kernel test robot <lkp@intel.com>
References: <20211119222042.361671-1-deller@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <20211119222042.361671-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-19 5:20 p.m., Helge Deller wrote:
> PA-RISC uses a much bigger frame size for functions than other
> architectures. So increase it to 2048 for 32- and 64-bit kernels.
The title says 4096.

Dave

-- 
John David Anglin  dave.anglin@bell.net

