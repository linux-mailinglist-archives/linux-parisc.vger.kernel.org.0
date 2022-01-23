Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8FA4971C5
	for <lists+linux-parisc@lfdr.de>; Sun, 23 Jan 2022 14:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236515AbiAWNve (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 23 Jan 2022 08:51:34 -0500
Received: from mta-tor-004.bell.net ([209.71.212.31]:40052 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S236615AbiAWNvc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 23 Jan 2022 08:51:32 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E5E7EC00834CCC
X-CM-Envelope: MS4xfNqcb6O7aPRPxgrqq4k9w4X0V++V6dXzZSMr6QdFnuTwe0eJ2rpFUORFWwAgLUm+GuxwhRDvcfrf6xz3u14QPpXYXWTXMqPlkhJfLhuzEOGwsq1VD9Ig
 qJkjtERcLey2fv3KmTVxd/1trJc6zKJ8h1a6hL8xCtHYdEJmwdnl/hHObgRZOIrww0F+5VUg8dXnMOdh2eDaWjILx++DDOtqi+61tH68v4+fL3IiwdzWS//R
 WIDZuyBoz9f1qdX3+S+aimbAv/EkSJjDnncfcA6JIxA=
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61ed5d5d
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=JGt2MYvg1O0DuCn6FcUA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E5E7EC00834CCC; Sun, 23 Jan 2022 08:51:25 -0500
Message-ID: <9f531648-c222-f203-8bf0-04f7199c115c@bell.net>
Date:   Sun, 23 Jan 2022 08:51:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: pagefaults and hang with 5.15.11
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
 <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
 <4372681.LvFx2qVVIh@eto.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <4372681.LvFx2qVVIh@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-01-23 6:53 a.m., Rolf Eike Beer wrote:
> Am Sonntag, 26. Dezember 2021, 18:22:12 CET schrieb John David Anglin:
>> On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
>>> [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613
>>> rcu_eqs_enter.constprop.0+0x8c/0x98
>> This is probably not reproducible. You might try this change from Sven
>> I haven't found 5.15.11 to be stable.
> When I was running 5.15.0 I had uptimes of 21 and 29 days before crashes, and
> then 5 days before I rebooted into 5.15.11 to test that.
>
> With 5.15.11 my longest uptime was 5 days.
>
> I have switched to 5.15.4 afterwards, which is now already up for 2 weeks. I
> see regular userspace crashes with that, usually gcc or ld as the machine is
> mainly building things, which seems to happen way more often than it has
> happened with 5.15.0 for me.
The problem is how to find the changes responsible for this instability?  I'm sure they aren't
caused by parisc specific changes.  It would take a very long time to bisect and test, and it would
be very easy to make a mistake bisecting because the issues are close to random.

So the best we can do is to analyze specific problems and try to fix them.

-- 
John David Anglin  dave.anglin@bell.net

