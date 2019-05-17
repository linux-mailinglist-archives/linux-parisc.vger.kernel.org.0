Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2554D21D0B
	for <lists+linux-parisc@lfdr.de>; Fri, 17 May 2019 20:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfEQSFQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Fri, 17 May 2019 14:05:16 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:42949 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726422AbfEQSFQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 17 May 2019 14:05:16 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190517180515.YYVN4444.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Fri, 17 May 2019 14:05:15 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by mtlspm02.bell.net
          with ESMTP
          id <20190517180514.NRBV21689.mtlspm02.bell.net@[192.168.0.183]>;
          Fri, 17 May 2019 14:05:14 -0400
To:     Helge Deller <deller@gmx.de>, Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
References: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net>
 <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net>
 <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
 <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net>
 <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
 <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net>
 <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
 <20190514130151.GA530@t470p.stackframe.org>
 <922dc8c9-f401-ed07-ce83-a534fecefb04@bell.net>
 <CA+QBN9Did5PqWkp3rcCN15n+dFd11jqCe+L2q33sTr2d6Ow15g@mail.gmail.com>
 <9e2370bc-95e2-97fe-ebc8-7e6626d06deb@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: C3600, sata controller
Message-ID: <9e67ee59-4e13-40be-6c1d-2b3409127515@bell.net>
Date:   Fri, 17 May 2019 14:05:15 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9e2370bc-95e2-97fe-ebc8-7e6626d06deb@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=-wzH-NF5AAAA:8 a=VwQbUJbxAAAA:8 a=Vt2AcnKqAAAA:8 a=FBHGMhGWAAAA:8 a=i9sKdtlQC5FplkVCSfUA:9 a=QEXdDO2ut3YA:10 a=toNUCDOfUMIA:10 a=FPRfbEX2zZDZeLmPJQYD:22 a=AjGcO6oz07-iQ99wixmX:22 a=v10HlyRyNeVhbzM4Lqgd:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfOZiL5jLUQmQFQdjdTW7+Tw+/PBgkCqi6cblMqlKWjwo5n4aGyh+8ECMLbpHz+P2Qsw/I/7JmHMsa0Q/uew0OnA+9Fr5huDSFevM5rNS483l/VBhj27d Z9sP3K0YMtWfr1CLGIspmILkUqOrB7zR4kReSRtShEXm4QAM6ogKnED8Navd+R276cKqjj04ehBpbQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-17 1:21 p.m., Helge Deller wrote:
> Hi Carlo,
>
> On 17.05.19 17:43, Carlo Pisani wrote:
>> guys, new tests(1) with SYBA-SY-PCX40009 on C3600
>> tested on different slots: it always fails with the same behavior
>> (1) http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&t=337&p=1663
>>
>> I really do not understand the random failure, because it seems
>> working for a while, and then, it suddenly fails I don't know how to
>> investigate.
> Random failure could happen because of missing calls to DMA syncs in the driver.
> PCI device drivers on PA-RISC require that you strictly follow the rules as mentioned in:
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/DMA-API-HOWTO.txt
> and
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/DMA-API.txt
>
> Not following those rules may lead to the same device driver working on x86
> but failing on parisc, simply because x86 is much more relaxed regarding DMA
> and CPU caches.
>
> That said, I would not expect every device driver to work out of the box
> on parisc...
It seems likely to me that the sil24 driver depends on the card operating in PCI-X mode.  As noted
previously, PCI-X differs from PCI in interrupt handling.  The driver has this flag SIL24_FLAG_PCIX_IRQ_WOC.

There's this comment:
        /* If PCIX_IRQ_WOC, there's an inherent race window between
         * clearing IRQ pending status and reading PORT_SLOT_STAT
         * which may cause spurious interrupts afterwards.  This is
         * unavoidable and much better than losing interrupts which
         * happens if IRQ pending is cleared after reading
         * PORT_SLOT_STAT.
         */
Maybe the workaround shouldn't be applied when card is in PCI 66 MHz slot?  See drivers/ata/sata_sil24.c.
https://www.mail-archive.com/linux-ide@vger.kernel.org/msg11502.html
https://www.mail-archive.com/linux-ide@vger.kernel.org/msg11516.html

The card works in my c8000 PCI-X slot.

Dave

-- 
John David Anglin  dave.anglin@bell.net


