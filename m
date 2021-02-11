Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CD2319684
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Feb 2021 00:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbhBKXY1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 Feb 2021 18:24:27 -0500
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:44612 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229480AbhBKXYS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:24:18 -0500
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20210211232334.ZZTZ17235.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 11 Feb 2021 18:23:34 -0500
Received: from [192.168.2.49] (really [70.50.109.22]) by torspm02.bell.net
          with ESMTP
          id <20210211232334.SUNT16325.torspm02.bell.net@[192.168.2.49]>;
          Thu, 11 Feb 2021 18:23:34 -0500
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
To:     Helge Deller <deller@gmx.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-parisc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>
References: <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box>
 <20210210145218.GA50561@roeck-us.net>
 <c7996434-198a-2a57-ac58-18ab6e1faf10@gmx.de>
 <288444d5-811f-db8f-6322-e26425527895@bell.net>
 <20210211012047.GA95605@roeck-us.net>
 <51fe1d4a-a2a0-b202-692f-c3db1843785c@bell.net>
 <20210211215131.GA127652@roeck-us.net>
 <06b31cea-61ce-a3a2-8abe-48aa5ab9dafb@bell.net> <YCW6RF/JiD/ezW3q@ls3530>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <fe161812-b27e-cc62-c1a1-42893eb75b9e@bell.net>
Date:   Thu, 11 Feb 2021 18:23:35 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCW6RF/JiD/ezW3q@ls3530>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.4 cv=e5fD9Yl/ c=1 sm=1 tr=0 ts=6025bc76 a=S6gQgrXzeH76ECG4GouVuA==:117 a=S6gQgrXzeH76ECG4GouVuA==:17 a=Q9fys5e9bTEA:10 a=qa6Q16uM49sA:10 a=FBHGMhGWAAAA:8 a=PCkXNUvKKdTXvwWsHLMA:9 a=PUjeQqilurYA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4xfO1DKrfAzFsgjpzypJ72oOPwqW6SXvveLOlH8Zn3//o/GPnrIJVQ03ebeGF/lsXV5tK/QBW1xw15wQrefx+ZjYCXqIyL9XMyHCOxhfO4nsXBNZj8bxph ERZNmPtZlK6/kkU5WOuvjwWFs0LpiPR33skahuXtbT+a+u9NxH1L2UfoCmnzCI4wpP/zyUQnQlUll5e02M0KXqCE+ziv+d6Sr5A=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-02-11 6:14 p.m., Helge Deller wrote:
> Yes, happens with latest version too.
>
>> It looks as if we might not need the ptl lock in set_pte_at() and probably elsewhere.
> Just removing the locks from set_pte_at() didn't solved it.
> After removing the others too, it works.
> Patch is attached below.
> I added a memory-barrier to set_pte() too.
You are ahead of me.  Should the memory barrier be a smp_mb()?

Dave

-- 
John David Anglin  dave.anglin@bell.net

