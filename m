Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E16481C067
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 03:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfENBu1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 13 May 2019 21:50:27 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:38676 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726233AbfENBu0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 13 May 2019 21:50:26 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190514015025.WUEZ4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 13 May 2019 21:50:25 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm02.bell.net
          with ESMTP
          id <20190514015025.RMQH30132.torspm02.bell.net@[192.168.2.49]>;
          Mon, 13 May 2019 21:50:25 -0400
Subject: Re: C3600, sata controller
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
References: <20190502074519.61272b42@canb.auug.org.au>
 <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net>
 <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net>
 <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net>
Date:   Mon, 13 May 2019 21:50:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=8pif782wAAAA:8 a=uBuKx8GwAAAA:8 a=FBHGMhGWAAAA:8 a=VtTVRs8skqw8XmDOKlkA:9 a=-zMSWEylRd51bSRP:21 a=ZJskje-u05Y3Xvyc:21 a=QEXdDO2ut3YA:10 a=wZgZ3yaTFkxMEWn-yT5t:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfLxVWnYgo5plYIdwdy/AffxTFkIac49HjWop8UeYmzCSi7POqsoLqmYeFLxTv99yUWLcqvVT9XCnVjTi4jVdV7WDtUniRJMgeV+eBYZq59w8509bcDZl bNw9BMCjsbvPtVguy9HezswhiCx7wnQYodfuWE/pBf5YsmkP7P1aHu27h3VthkMD6Jz7ba7W8beHiA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-13 7:47 p.m., Carlo Pisani wrote:
> So levels should be compatible, but so what is the difference between
> 64-bit PCI slot and PCI-X slot?
There is no difference in the slots except PCI-X slots are always 3.3V and a 5V card won't work in them.
The difference is in the bus protocol and timing.

This is what I see in wikipedia:

"In PCI, a transaction that cannot be completed immediately is postponed by either the target or the initiator issuing retry-cycles, during
which no other agents can use the PCI bus. Since PCI lacks a split-response mechanism to permit the target to return data at a later time, the
bus remains occupied by the target issuing retry-cycles until the read data is ready. In PCI-X, after the master issues the request, it
disconnects from the PCI bus, allowing other agents to use the bus. The split-response containing the requested data is generated only when the
target is ready to return all of the requested data. Split-responses increase bus efficiency by eliminating retry-cycles, during which no data
can be transferred across the bus.

PCI also suffered from the relative scarcity of unique interrupt lines. With only 4 interrupt lines (INTA/B/C/D), systems with many PCI devices
require multiple functions to share an interrupt line, complicating host-side interrupt-handling. PCI-X added Message Signaled Interrupts
<https://en.wikipedia.org/wiki/Message_Signaled_Interrupts>, an interrupt system using writes to host-memory. In MSI-mode, the function's
interrupt is not signaled by asserting an INTx line. Instead, the function performs a memory-write to a system-configured region in host-memory.
Since the content and address are configured on a per-function basis, MSI-mode interrupts are dedicated instead of shared. A PCI-X system allows
both MSI-mode interrupts and legacy INTx interrupts to be used simultaneously (though not by the same function.)

The lack of registered I/Os limited PCI to a maximum frequency of 66 MHz. PCI-X I/Os are registered to the PCI clock, usually through means of a
PLL to actively control I/O delay the bus pins. The improvement in setup time allows an increase in frequency to 133 MHz."

Nominally, one would think a PCI-X card would fall back to PCI mode but maybe this needs firmware
support.

I still think the 3.3V signalling of a PCI-X card likely is incompatible with 5V signalling in c3600.  A 5V
card won't work in a PCI-X slot.  Only slot SL2 is 3.3V.

Wiki also says:

"Many 64-bit PCI-X cards are designed to work in 32-bit mode if inserted in shorter 32-bit connectors, with some loss of speed.[19][20] An
example of this is the Adaptec 29160 64-bit SCSI interface card.[21] However some 64-bit PCI-X cards do not work in standard 32-bit PCI slots.[22]"

So, I think you can only use 5V or universal conventional PCI cards in c3600 (except for slot SL2).

Here are some Adaptec 64-bit cards that I found.
https://storage.microsemi.com/en-us/support/raid/sata/aar-2410sa/
https://storage.microsemi.com/en-us/support/raid/sata/aar-21610sa/

Dave
-- 

John David Anglin  dave.anglin@bell.net

