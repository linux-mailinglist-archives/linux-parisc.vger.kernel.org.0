Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8C71ACA0
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 16:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfELObG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 May 2019 10:31:06 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:44063 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726442AbfELObG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 May 2019 10:31:06 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190512143105.UIQH4684.torfep02.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 12 May 2019 10:31:05 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm01.bell.net
          with ESMTP
          id <20190512143105.HDDG39285.torspm01.bell.net@[192.168.2.49]>;
          Sun, 12 May 2019 10:31:05 -0400
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Meelis Roos <mroos@linux.ee>, Helge Deller <deller@gmx.de>,
        linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
 <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
 <57fc8e0d-c04d-e82e-04ad-2debec0284fb@linux.ee>
 <CA+QBN9AfShbQ1JbcEMr++roxH0oivnEq-ndKc5yt6tGRos+N_w@mail.gmail.com>
 <63286d01-212f-aa26-cc57-8831dd3ded99@bell.net>
 <CA+QBN9DLCT2WGWEPUg4yrOswUkB1PepkbuGnzwEAmxokOgX74g@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <5e1ee7c5-9d3e-d221-ce74-c7ae42982f8d@bell.net>
Date:   Sun, 12 May 2019 10:31:03 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9DLCT2WGWEPUg4yrOswUkB1PepkbuGnzwEAmxokOgX74g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=_3lBfDQrve_lhuiAFZ8A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfAML5ZALOjQ1pdJoDCs0YRIOswRycBq2LllQ8WI7j6ayjGHVGTeIFtkKE/TxVqI8/r1i9ZEFxb4Ilfm+4uvCljv5DHYdmJQYgVuyoNeTvoazq0SmmpbR RPyzBMGdQ4GKV2NJN9/beOARUTAZOSy3QJkv76b+LXZRAJ2XYws6m+2ksMLtMAzYRqgn0xRPoO2K7g==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-12 9:45 a.m., Carlo Pisani wrote:
>> I agree.  The memory errors in the PIM dump are recorded by the PDC firmware and they don't
>> directly involve the linux drivers.  Might be hardware problem.
> which kind of error problem?
|Memory Error Log Information:

Timestamp =
  Sat May  11 11:37:53 GMT 2019    (20:19:05:11:11:37:53)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

This log displays the contents of memory specific registers when the
HPMC occurred.  If there are multiple memory errors, the order they are
listed is not indicative of the order they occurred.

                                   Trans  Addr
   Memory Error Type(s)  OV  MID    ID    par  CP   DIMM       Runway Address
   --------------------  --  ---  -----  ----  --  -------  -------------------
1) Correctable Mem       1   0x6  0x a   na    na  05       0x       0036c76b40

                                                Syndrome
                                           ------------------
                                        1) 0x94
<Press any key to continue (q to quit)>

I/O Module Error Log Information:

Timestamp =
  Sat May  11 11:37:53 GMT 2019    (20:19:05:11:11:37:53)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc2a9   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------
|
>
> those two cards have no problem when tested on PowerMac-G4
> and we have a second C3600, reporting the same behavior
>
> so, supposing those cards are OK, and C3600s are OK
> what might be wrong about the hardware?
>
-- 
John David Anglin  dave.anglin@bell.net

