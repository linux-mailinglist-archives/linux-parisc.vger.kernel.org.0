Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9823F8A1B
	for <lists+linux-parisc@lfdr.de>; Thu, 26 Aug 2021 16:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhHZOb7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 26 Aug 2021 10:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbhHZOb6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Aug 2021 10:31:58 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94287C061757
        for <linux-parisc@vger.kernel.org>; Thu, 26 Aug 2021 07:31:10 -0700 (PDT)
Received: (qmail 7755 invoked from network); 26 Aug 2021 14:30:33 -0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69]:43188 HELO webmail.sf-mail.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Thu, 26 Aug 2021 16:30:33 +0200
MIME-Version: 1.0
Date:   Thu, 26 Aug 2021 16:30:33 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's
 max_cycles value
In-Reply-To: <2191464.ElGaqSPkdT@daneel.sf-tec.de>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de>
 <2573804.mvXUDI8C0e@daneel.sf-tec.de>
 <dc93df38-d2c4-362e-0e22-b8885509c2ea@gmx.de>
 <2191464.ElGaqSPkdT@daneel.sf-tec.de>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <edac32ae14afeaf416e002f1f366534a@sf-tec.de>
X-Sender: eike-kernel@sf-tec.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Am 2021-03-14 13:08, schrieb Rolf Eike Beer:
> Am Sonntag, 14. März 2021, 12:16:11 CET schrieben Sie:
>> On 3/14/21 10:47 AM, Rolf Eike Beer wrote:
>> > Am Mittwoch, 3. März 2021, 15:29:42 CET schrieb Helge Deller:
>> >> On 3/1/21 7:44 PM, Rolf Eike Beer wrote:
>> >>> Am Montag, 1. März 2021, 17:49:42 CET schrieb Rolf Eike Beer:
>> >>>> Am Montag, 1. März 2021, 17:25:18 CET schrieb Rolf Eike Beer:
>> >>>>> After upgrade to 5.11 get this multiple times per second on my C8000:
>> >>>>>
>> >>>>> [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger than
>> >>>>> allowed by the 'jiffies' clock's max_cycles value (10): time overflow
>> >>>>> danger [   36.998705]          timekeeping: Your kernel is sick, but
>> >>>>> tries
>> >>>>> to cope by capping time updates
>> >>
>> >> I know I have seen this at least once with a 32-bit kernel in qemu as
>> >> well....
>> >>
>> >>>> Not 5.11, but 5.10.11. 5.10.4 is fine. It could be a bad upgrade
>> >>>> attempt,
>> >>>> I'll retry once I have built a proper 5.11 kernel.
>> >>>
>> >>> Ok, it's there also in 5.11.2:
>> >> You don't see it in 5.11, but in 5.11.2.
>> >> Sadly none of the changes between those versions seem related
>> >> to this problem.
>> >>
>> >> Do you still see this?
>> >> I'd like to get it anaylzed/fixed.
>> >
>> > Me too. What do you need?
>> 
>> I actually don't know.
>> First of all it would be great if we could reproduce it.
>> Right now I don't see this issue any longer, so I have nowhere to 
>> start
>> from.
> 
> I get it every time if I boot that kernel.

I still see it in 5.13.12, so I'm in the bad situation now that I don't 
have a working kernel on that machine anymore and need to think about 
how to restore it. While the latter is exactly my problem I would still 
love to see the kernel problem solved.
