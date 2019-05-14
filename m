Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAB6D1C839
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 14:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfENMKm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 14 May 2019 08:10:42 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:34421 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726036AbfENMKm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 14 May 2019 08:10:42 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190514121040.QEXB4444.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 14 May 2019 08:10:40 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by mtlspm01.bell.net
          with ESMTP
          id <20190514121040.CLYQ87666.mtlspm01.bell.net@[192.168.2.49]>;
          Tue, 14 May 2019 08:10:40 -0400
Subject: Re: C3600, sata controller
To:     Carlo Pisani <carlojpisani@gmail.com>
References: <20190502074519.61272b42@canb.auug.org.au>
 <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net>
 <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net>
 <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
 <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net>
 <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Message-ID: <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net>
Date:   Tue, 14 May 2019 08:10:40 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 cx=a_idp_d a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=uBuKx8GwAAAA:8 a=FBHGMhGWAAAA:8 a=l9yPeklnn_ZQln16ixgA:9 a=QEXdDO2ut3YA:10 a=wZgZ3yaTFkxMEWn-yT5t:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfK7BAkASVLgvyK1j+5abiCQP6X9VMxaysQdje89BR6WWrZ8yoamcltbNHqnkuqVO4Py2wnywzPyzl1hzZfipy6YmAsM6oO/nTzcjiuqt5D0Iih0MnjQC BGfEO5GdksSZwmh8MZFztzLg48PSxCB1+tssc7WHqrG/3Xah20vBQouIJEV3JtY7xFRECBzSsjNqXA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-14 4:15 a.m., Carlo Pisani wrote:
> I am surprised that a PCI-X chip isn't able to switch into PCI64 mode.
> Cards are usually declared "backward compatible", and it would be just
> a matter of "how" to handle the finite state machine that drives the
> PCI, plus the onboard PLL and synchronization.
I agree but it appears fallback requires BIOS or a QUIRK to configure card.  One would have to
look at driver and/or BIOS to see what is/can done. Maybe OpenBIOS has something.

There is ENABLE_HARDFAIL config option in lba_pci.c which determines whether HPMC occurs.
Soft fail might be useful to debug.  However, I doubt there's enough public information to configure
card given what Alan said.
>
>
>> Here are some Adaptec 64-bit cards that I found.
>> https://storage.microsemi.com/en-us/support/raid/sata/aar-2410sa/
>> https://storage.microsemi.com/en-us/support/raid/sata/aar-21610sa/
> as written here (1), we have already tested Adaptec 2410SA, and I have
> also recently received an email by AlanCox confirming that the card is
> x86-only!
>
>         Subsystem: Adaptec AAR-2410SA PCI SATA 4ch (Jaguar II)
>
> It fails on every non-x86 machine because it relies on PC-BIOS
> extension for the initialization of the onboard Intel i960 chip, and
> we do not have any Linux kernel driver able to do what the PC-BIOS
> does.
I had listed these cards because they are PCI64 and the Adaptec site didn't say Intel
architecture was required.  There was one card that claimed to be PCI-X and PCI64
(both 3.3 and 5V signalling) but it required Intel or AMD architecture.

Dave

-- 
John David Anglin  dave.anglin@bell.net

