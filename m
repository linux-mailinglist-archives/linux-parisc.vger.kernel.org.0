Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA7F1A9B1
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 00:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfEKWgR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 11 May 2019 18:36:17 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:44610 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726033AbfEKWgR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 11 May 2019 18:36:17 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190511223615.MJFR4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 11 May 2019 18:36:15 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm02.bell.net
          with ESMTP
          id <20190511223615.EPUW30132.torspm02.bell.net@[192.168.2.49]>;
          Sat, 11 May 2019 18:36:15 -0400
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Carlo Pisani <carlojpisani@gmail.com>, Helge Deller <deller@gmx.de>
Cc:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
 <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <fac5aa59-999f-e61e-774e-b43d0d28779c@bell.net>
Date:   Sat, 11 May 2019 18:36:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=ZfDTkB6afjhJ1xcQYUwA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfM8mO8rDns/wbhdZBKnaPhECeLo4AQnTL5LlkwNs/amnhyPD38Dn6JTj4OZnuDRYMLxPfSf6zbhD6cuzqDapK3MrUQ8QobgHkLrPzuMvrt/kr41vbpCu ZuIDDDXx5hYkNbN4zA+GbAMyazi1Rro59vkBXDt85dqU5Tw8rHq2JJPVLqSyZpA5x+0V7nyYtCpYCQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-11 5:41 p.m., Carlo Pisani wrote:
> guys, bad news!
> as described here (1) we are testing several sata controllers by a script that
> 1) copy a very big file cp data_16GB.bin copy.bin
> 2) compare the md5sum for checking the integrity
>
> we have a couple of SIL24 controllers, and they both work but only
> with small files <8Gbyte
> trying to copy a big file, 16GB, results in the following HPMC error
>
> A Data I/O Fetch Timeout occurred while CPU 0 was requesting
> information from a device at the path 10/6/2/0 (PCI slot 2).
I don't see problem on my c8000:

dave@atlas:~/big$ cp x x2
dave@atlas:~/big$ md5sum *
9e6b3d79358077360a55861a5054f878  x
9e6b3d79358077360a55861a5054f878  x2
dave@atlas:~/big$ ls -l
total 49152
-rw-r--r-- 1 dave dave 25165824 May 11 18:31 x
-rw-r--r-- 1 dave dave 25165824 May 11 18:31 x2

Note card is PCIX slot.

Dave

-- 
John David Anglin  dave.anglin@bell.net

