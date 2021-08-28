Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F4F3FA6DB
	for <lists+linux-parisc@lfdr.de>; Sat, 28 Aug 2021 19:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhH1Q5b (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 28 Aug 2021 12:57:31 -0400
Received: from mta-mtl-001.bell.net ([209.71.208.11]:16336 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhH1Q5b (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 28 Aug 2021 12:57:31 -0400
X-Greylist: delayed 329 seconds by postgrey-1.27 at vger.kernel.org; Sat, 28 Aug 2021 12:57:30 EDT
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.52.221.220]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C89382040090F5
X-CM-Envelope: MS4xfCQEaZ8Gg7t5VWFL5uOECepon7jeQOWNd11QLQcFrS0GlP1EQw04HBoU1FG7weQmX3m9As/07E21Q8L9UFJ47imGAO6MDPNIYzvxhIfNNY27O0wF68e8
 5STTAl+ve2jsY7XZOub1y8DLcGOGsi53t6lWTHwUYW1aUZcMRXYZHbO+u5QrnQe8AkFH86FY3ZaxBBcpkcKMTPDA4NE+BswfsPsPW24GnluTjhlj0DgLfYk2
 IeGAJkpE1Om3j/971DG+5XQY0e02ir5sUDdU21n9iTHEu7dquG45hvtrTqR3oJmR
X-CM-Analysis: v=2.4 cv=Z6GPoFdA c=1 sm=1 tr=0 ts=612a697d
 a=YO5NLpPX/y/Fbmk87HoZTg==:117 a=YO5NLpPX/y/Fbmk87HoZTg==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=JzE_yj-0rGZXMqE1_KYA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.52.221.220) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C89382040090F5; Sat, 28 Aug 2021 12:51:09 -0400
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's
 max_cycles value
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de>
 <2573804.mvXUDI8C0e@daneel.sf-tec.de>
 <dc93df38-d2c4-362e-0e22-b8885509c2ea@gmx.de>
 <2191464.ElGaqSPkdT@daneel.sf-tec.de>
 <edac32ae14afeaf416e002f1f366534a@sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <b80db465-f53b-f251-1bf8-98dc24da86ce@bell.net>
Date:   Sat, 28 Aug 2021 12:51:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <edac32ae14afeaf416e002f1f366534a@sf-tec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-08-26 10:30 a.m., Rolf Eike Beer wrote:
> Am 2021-03-14 13:08, schrieb Rolf Eike Beer:
>> Am Sonntag, 14. März 2021, 12:16:11 CET schrieben Sie:
>>> On 3/14/21 10:47 AM, Rolf Eike Beer wrote:
>>> > Am Mittwoch, 3. März 2021, 15:29:42 CET schrieb Helge Deller:
>>> >> On 3/1/21 7:44 PM, Rolf Eike Beer wrote:
>>> >>> Am Montag, 1. März 2021, 17:49:42 CET schrieb Rolf Eike Beer:
>>> >>>> Am Montag, 1. März 2021, 17:25:18 CET schrieb Rolf Eike Beer:
>>> >>>>> After upgrade to 5.11 get this multiple times per second on my C8000:
>>> >>>>>
>>> >>>>> [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger than
>>> >>>>> allowed by the 'jiffies' clock's max_cycles value (10): time overflow
>>> >>>>> danger [   36.998705]          timekeeping: Your kernel is sick, but
>>> >>>>> tries
>>> >>>>> to cope by capping time updates
>>> >>
>>> >> I know I have seen this at least once with a 32-bit kernel in qemu as
>>> >> well....
>>> >>
>>> >>>> Not 5.11, but 5.10.11. 5.10.4 is fine. It could be a bad upgrade
>>> >>>> attempt,
>>> >>>> I'll retry once I have built a proper 5.11 kernel.
>>> >>>
>>> >>> Ok, it's there also in 5.11.2:
>>> >> You don't see it in 5.11, but in 5.11.2.
>>> >> Sadly none of the changes between those versions seem related
>>> >> to this problem.
>>> >>
>>> >> Do you still see this?
>>> >> I'd like to get it anaylzed/fixed.
>>> >
>>> > Me too. What do you need?
>>>
>>> I actually don't know.
>>> First of all it would be great if we could reproduce it.
>>> Right now I don't see this issue any longer, so I have nowhere to start
>>> from.
>>
>> I get it every time if I boot that kernel.
>
> I still see it in 5.13.12, so I'm in the bad situation now that I don't have a working kernel on that machine anymore and need to think about
> how to restore it. While the latter is exactly my problem I would still love to see the kernel problem solved.
I don't see this either.  So, it probably has to do with your config.

Since it fails consistently on your system, you could use git bisect to find the change which introduced problem.

Dave

-- 
John David Anglin  dave.anglin@bell.net

