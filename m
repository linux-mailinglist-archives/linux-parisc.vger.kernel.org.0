Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9826E4000A2
	for <lists+linux-parisc@lfdr.de>; Fri,  3 Sep 2021 15:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235767AbhICNjQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 3 Sep 2021 09:39:16 -0400
Received: from mta-tor-003.bell.net ([209.71.212.30]:40398 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S235169AbhICNjN (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 Sep 2021 09:39:13 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.52.221.220]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C8802C0442E023
X-CM-Envelope: MS4xfF9zhDcKXPUHo5BDmFfPJ9JoiiPHi6ZBECoiiiQJkQF8ExbTv0ZNVX7xRlkzuB3ASgWV9fP6OnWMBwYdtWr58MD/8F2MiubcaCAorskko2paP5xAcY7u
 +wHej8lxh6KBLXTauY52bF7okndmmrU/vkIvr6z/VWYQLYQXd5qT/QswYBNxeGHGIVsyu5aXcU6qyboZMjWXGG5LFcfuwfXlhJfq6jRJrtuBnyeh2iP+4XPQ
 djTpdkphW0A1NcTc29/PZdJyPBU0WUvekTUlLrlL48QIb20mTdNJoK9pDhYWVickgvIZf+O9nJdF5v9Qd3gNQjLyjRTy5H9L9uSCp/IhZkE=
X-CM-Analysis: v=2.4 cv=Zd5+iuZA c=1 sm=1 tr=0 ts=61322543
 a=YO5NLpPX/y/Fbmk87HoZTg==:117 a=YO5NLpPX/y/Fbmk87HoZTg==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=eIZ7jACLm3UFZmMTUCUA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.52.221.220) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C8802C0442E023; Fri, 3 Sep 2021 09:38:11 -0400
Subject: Re: [PATCH] parisc: Drop __arch_swab16(), arch_swab24(),
 _arch_swab32() and __arch_swab64() functions
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YTHWzLrVpZV/dk8n@ls3530>
 <bbd93244-9071-3dd9-bdb3-d3f5b1809358@bell.net>
 <2cfa60ad-8846-62a0-0d69-488cf2f4ab7d@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <80afaab0-c49f-ff14-5126-6f9af4008ea1@bell.net>
Date:   Fri, 3 Sep 2021 09:38:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2cfa60ad-8846-62a0-0d69-488cf2f4ab7d@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-09-03 9:12 a.m., Helge Deller wrote:
> On 9/3/21 2:41 PM, John David Anglin wrote:
>> Hi Helge,
>>
>> I don't believe the compiler can implement __arch_swab64() as efficiently as the inline assembly
>> code.  The compiler doesn't know about the permh or hsh instructions.
>
> Yes, it does.
You are correct.  bswaphi2, bswapsi2 and bswapdi2 patterns are implemented in pa.md.

Dave

-- 
John David Anglin  dave.anglin@bell.net

