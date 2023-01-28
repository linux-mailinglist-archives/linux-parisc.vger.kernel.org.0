Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E2D67F768
	for <lists+linux-parisc@lfdr.de>; Sat, 28 Jan 2023 11:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbjA1K7Q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 28 Jan 2023 05:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbjA1K7P (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 28 Jan 2023 05:59:15 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273D715570
        for <linux-parisc@vger.kernel.org>; Sat, 28 Jan 2023 02:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1674903544; bh=0AsZTp4KYHGzvOutkRxBudlgIvWfMyuWKUE3cxaKDfA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=avIY8f10yeHu+kV16Ai4LOU2RkMoRr//X/SQZsXOMiqqklhfcgEZwPHthqc2EtAM3
         vi2L+GLJTKarY3z8Fwk8bVLnGV0rUiIczx8UpiwHChtiUJTvGSjglXtPBgsMOJNb4q
         Nmvr4tSU84Qh0p28x47wEiethGZ/WtcClFYaJiWxwX/Dx6Wb47FMs5CsbPe9p+K8BW
         APzkhcBNopxCUO7moNu2jp7FFNxuJIl/jKz9vn0JPNqi68dw+L9zndPhnu9OYyKewk
         9VlJG/88i6E5RqpvYlzUhyDAfRc3iVvIya61gssxDtDO2YI/tuFepjSRogdeVKkpUa
         NYh6aS8uY2cnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.166.9]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0JM-1oxLOJ3a0m-00kPsv; Sat, 28
 Jan 2023 11:59:03 +0100
Message-ID: <f1722f22-ecdd-a5c6-f498-5f86173b40ef@gmx.de>
Date:   Sat, 28 Jan 2023 11:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] parisc: Ensure page-aligned addresses in cache flush and
 copy functions
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-parisc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Ira Weiny <ira.weiny@intel.com>,
        "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
References: <20230127213941.83967-1-deller@gmx.de>
 <Y9Rgor0T8dSzPgiX@casper.infradead.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <Y9Rgor0T8dSzPgiX@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:acFYJ6bi78I0SbTYHQ3CNKSxWT+isCZOoMwQw8DVwE27w5+o8fe
 wm/kZC+dXd1KmU3ql8vFADwq4/Mb087VpOYEcVNwhuXe3z4Ol+gj19hc4UdoxMlQQT3ko2r
 Yku8aZ+OB3ExKhLo+scvQ0QpxsQeRd3UVgeff8di8Ae70ObLfq+2NfhE3b2YsrNCQHrEgT8
 o9/1cDyfgVW2T1b4xtUag==
UI-OutboundReport: notjunk:1;M01:P0:fZq3tv7o3Kg=;yAZ2/uS1YPvc9+39rBtnh6kJLV6
 wJdzvuRR96Y4u4E9nVGQTmUG5p7ZG2TQmPFFnME+iNo/5Ia/RKBOE6lFrE7yb35B1Z/FlVY79
 M4xq/9pgurKODBRmPfRdjJfnAYDnTBvXlgRB2l5c4vWr7n0icxiLwY2kITNKPIj48xxpBkQvA
 CcHUwkNbRY5tkqXS70mBKCpv1jX9Rm8mA8HAq8xW7iFM/ejX0f81WGcncZWDpVlzbe+b9Tjru
 4vM7aYn3afF6rLxoRZpPBb0nTqEtLK6CXPE+BI3iFWaoF583vYcd/GxwL9KDeFPI52iCL7cqd
 4Hm2gmQr8q4gJesRngQjdIUVG/74xqRfg0Gsgl0+vc7/N1ZAW/gachBWU7nm264qp2J8Po3b1
 VAKv+PAmOeFYtZpVBdGzJNn/+8bYFOs6cLRW+EcvtPqjmde9hO88Lh4DEa2VQuAfo0alLm1Af
 DOKetSynsZMpkwUInWl2C2GidydMZp0wfBT6sUKjiWEsZI3dFPLB79FT6/olR0yiKrEta8bqs
 303BnMwDoP3wjXjPT1ROV1KDmGzj+WMNYt28zMOOdh4OTE6n9GovAaK6is44Q68LRb31hOyAY
 rLs2QisZ0Xg/Z1ARqFSSASndTM6vTSBlBN9+BuKChhHiOPyYfrAKvT8mlvkk57XbSS063srFh
 sDAScgGmitvwco3luf125lj89nL/uNOZzWELYsBTROmVTnjsjpE6LP/POHZQE8hkFKLrbZ1JS
 cjFXhTKiSMeICkGSVoCMeeF7pFH0sUR3cGSAq4Dsf8PCM1p0hEhfF/1hBaoHTBUyoHnvJoas4
 azJqHn6b0bcBCrGffc2CgQ1GE3FCb3Pqg0+gO0VM0Ma+JmseY+3jSScONbTrWvSednPXnTOjt
 WL9RJk531dEVjFpHv+E+m+znCVgf7tuy1B2Aadc0vuadcXUV6trmldO4MhGz3W6DTif5pQrcT
 4oPPO+YRmjMPL3dnLmbXAPBuUuI=
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/28/23 00:39, Matthew Wilcox wrote:
> On Fri, Jan 27, 2023 at 10:39:41PM +0100, Helge Deller wrote:
>> Matthew Wilcox noticed, that if ARCH_HAS_FLUSH_ON_KUNMAP is defined
>> (which is the case for PA-RISC), __kunmap_local() calls
>> kunmap_flush_on_unmap(), which may call the parisc flush functions with
>> a non-page-aligned address and thus the page might not be fully flushed=
.
>>
>> To prevent similiar cases, page-align any given address in the
>> following parisc low-level calls:
>> - clear_page_asm(),
>> - copy_page_asm(),
>> - copy_user_page_asm(),
>> - clear_user_page_asm(),
>> - flush_kernel_dcache_page_asm(),
>> - purge_kernel_dcache_page_asm() and
>> - flush_kernel_icache_page()
>
> I don't think this is the right way to go.  Imagine that we enable
> large folios on architectures that don't support TRANSPARENT_HUGEPAGE
> (ie PA-RISC).  Then folio_zero_range() is going to call kmap_local()
> and kunmap_local() once per folio instead of once per page, and so we'll
> need to flush the entire folio, not just the page.

Don't the functions mentioned above in my patch operate on standard 4k pag=
e size
for all architectures? So, if you want to flush a whole folio you will pro=
bably
not want to call those functions by iterating over the folio-memory, but c=
all
some other function, right?
In that case flush_kernel_dcache_range_asm() is probably better suited the=
n, as it
doesn't page-align the given address.

Helge
