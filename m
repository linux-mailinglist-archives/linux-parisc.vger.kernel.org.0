Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9352D77B2
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Dec 2020 15:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406084AbgLKOU6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Fri, 11 Dec 2020 09:20:58 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:48860 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406107AbgLKOUs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 11 Dec 2020 09:20:48 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-53-s0AncPC_O7qxZEyLU7X13A-1; Fri, 11 Dec 2020 14:19:07 +0000
X-MC-Unique: s0AncPC_O7qxZEyLU7X13A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 11 Dec 2020 14:19:05 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 11 Dec 2020 14:19:05 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Thomas Gleixner' <tglx@linutronix.de>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>
CC:     Peter Zijlstra <peterz@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>,
        "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Michal Simek" <michal.simek@xilinx.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        "Tariq Toukan" <tariqt@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Jakub Kicinski" <kuba@kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        Saeed Mahameed <saeedm@nvidia.com>,
        "Leon Romanovsky" <leon@kernel.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [patch 14/30] drm/i915/pmu: Replace open coded kstat_irqs() copy
Thread-Topic: [patch 14/30] drm/i915/pmu: Replace open coded kstat_irqs() copy
Thread-Index: AQHWz72qwjNpP0n0UkWT70W8RrLS8qnx7xrw
Date:   Fri, 11 Dec 2020 14:19:05 +0000
Message-ID: <d6cbfa118490459bb0671394f00323fc@AcuMS.aculab.com>
References: <20201210192536.118432146@linutronix.de>
 <20201210194043.957046529@linutronix.de>
 <ad05af1a-5463-2a80-0887-7629721d6863@linux.intel.com>
 <87y2i4h54i.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87y2i4h54i.fsf@nanos.tec.linutronix.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Thomas Gleixner
> Sent: 11 December 2020 12:58
..
> > After my failed hasty sketch from last night I had a different one which
> > was kind of heuristics based (re-reading the upper dword and retrying if
> > it changed on 32-bit).
> 
> The problem is that there will be two seperate modifications for the low
> and high word. Several ways how the compiler can translate this, but the
> problem is the same for all of them:
> 
> CPU 0                           CPU 1
>         load low
>         load high
>         add  low, 1
>         addc high, 0
>         store low               load high
> --> NMI                         load low
>                                 load high and compare
>         store high
> 
> You can't catch that. If this really becomes an issue you need a
> sequence counter around it.

Or just two copies of the high word.
Provided the accesses are sequenced:
writer:
	load high:low
	add small_value,high:low
	store high
	store low
	store high_copy
reader:
	load high_copy
	load low
	load high
	if (high != high_copy)
		low = 0;

The read value is always stale, so it probably doesn't
matter that the value you have is one that is between the
value when you started and that when you finished.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

