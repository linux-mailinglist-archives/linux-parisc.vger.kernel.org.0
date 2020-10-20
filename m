Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915FE294134
	for <lists+linux-parisc@lfdr.de>; Tue, 20 Oct 2020 19:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390249AbgJTRNk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 20 Oct 2020 13:13:40 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35659 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729952AbgJTRNk (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 20 Oct 2020 13:13:40 -0400
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Oct 2020 13:13:39 EDT
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud7.xs4all.net with ESMTPSA
        id Uv5ikmAg9ghRkUv5kkusC3; Tue, 20 Oct 2020 19:06:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603213594; bh=mfO1uOTWoObJIcAEdCIniXCelsLUccVV2U2+Xu6KnS4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=qH2k1M3wbim2VBCuGaj6XiJRirm/XB7HsAs6dvMZpHcaxEIUt3Vlw2V+4ljfPhWp5
         yczX/GC6d35iW8DXDAmW/HypZuu4JT1l7wifeqwa5k3qaFlBeMFiZTSszW457TT5Hj
         zv+bCE3k2l9o32k0PAYVrv3p3uG0wXp91xl9OAbJ3pOU7iJTNqGNYYnRgwj5PKiPP+
         8H91l8UgQtit4XF8kn4FqQblaGWKxf4DDJxXX1+PDBfNt5YVo3LEFmMvUorr9GMjcq
         LsVZmG6U5epRVFq4YRexHwusUwtc/p7MXkQvOaKtrThWGMeepJZCJEd53tjqox5HUQ
         02pzDLalhTu6Q==
Date:   Tue, 20 Oct 2020 19:06:29 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Kernel 5.8 and 5.9 fail to boot on C8000
Message-ID: <20201020190629.65c95d62@wim.jer>
In-Reply-To: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
References: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPHafdPEBrd4miPKzVMh9+M5DPctRga470oKhZnJDsGNyt4hnkP2xGlPuFwGNDWiROQ923bEn3VLEUSvPodgQurCuk+LqjDC9TOf873WaIoeceCd9/b0
 PJrxPXKRnZaH24Xiu3CJGetPd+THWlaEJyGxRq3LqUaAPWY5IMJrqOzTQoVJLJkKPswNFPOlN53i18aiijK146wvEOG/+PwXJYw5s84NE1D2hKX4luj+kboc
 09dG6SlpHRMfmqmSsT8a+eB44azHE2n2KRYiEOzS3XA=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 20 Oct 2020 15:45:27 +0200
Helge Deller <deller@gmx.de> wrote:

> Latest Linux kernels v5.8 and v5.9 fail to boot for me on the C8000
> machines with this error:
>  mptspi: probe of 0000:40:01.0 failed with error -12
>  mptbase: ioc1: ERROR - Insufficient memory to add adapter!
>  mptspi: probe of 0000:40:01.1 failed with error -12

> Do other people see this as well?

No, it works fine for me on a C8000. I am seeing another "memory
related" problem in 5.9 that I will report shortly, though.


Regards,
     jer
