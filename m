Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6731A2CD1F
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 19:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfE1RGv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Tue, 28 May 2019 13:06:51 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:50305 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726236AbfE1RGv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 13:06:51 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190528170648.NQVM4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 28 May 2019 13:06:48 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by torspm02.bell.net
          with ESMTP
          id <20190528170648.BCUW30132.torspm02.bell.net@[192.168.0.183]>;
          Tue, 28 May 2019 13:06:48 -0400
To:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
 <20190527201538.GD29337@t470p.stackframe.org>
 <20190528110627.GA16860@t470p.stackframe.org>
 <e81b7ae4-3126-5fda-58e4-4a83bd4fcfcf@bell.net>
 <3396728e-622c-eb88-dbf6-bb577e045600@gmx.de>
 <20190528153815.GB16860@t470p.stackframe.org>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <674f8b61-e897-f657-68a2-648babca00be@bell.net>
Date:   Tue, 28 May 2019 13:06:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528153815.GB16860@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=MvuuwTCpAAAA:8 a=FBHGMhGWAAAA:8 a=11cp6PRm3TdN9swb0AMA:9 a=QEXdDO2ut3YA:10 a=dVHiktpip_riXrfdqayU:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfEdLzU14liuQlhHjQcpBjt2mleAy5SoNy6Fj4ZtHgJggZuST8JLgFTWKeQZa+DSdjztTLR9GBSjaSQGjJfecDrkv0vh/3J+7stbuE+FtoJHVMnF/VhuA SaUa7QEeMvQxk1UN+SrlZSyIo5gc2orWuJvdRh/0wxcu9o0kMw3zm9N/AeKNLGX9+jl3+W+2iz3L9A==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-28 11:38 a.m., Sven Schnelle wrote:
> Interesting. Now that you mention it i see that my C3750 reports the same. Google
> returned the following page https://support.hpe.com/hpsc/swd/public/detail?swItemId=PF_CCJ70020
>
> Which is 2.0, and only mentions "C3650/C3700/C3750/J6700/J6750 firmware" So maybe
> these machines have NP set, and machines "below" (like C3600) don't have it set.
>
> I wonder what happens if you try to flash a 5.0 firmware to such a box.
From what I see, the "C3650/C3700/C3750/J6700/J6750" and "HP 9000 Model B1000/C3000/J5000/J7000"
use different firmware.

Dave

-- 
John David Anglin  dave.anglin@bell.net


