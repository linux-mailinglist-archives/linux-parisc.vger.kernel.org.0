Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C540F1AC6E
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 15:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfELNhN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 May 2019 09:37:13 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:36666 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726415AbfELNhM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 May 2019 09:37:12 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190512133711.NDDV4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 12 May 2019 09:37:11 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm02.bell.net
          with ESMTP
          id <20190512133711.GJWG30132.torspm02.bell.net@[192.168.2.49]>;
          Sun, 12 May 2019 09:37:11 -0400
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Carlo Pisani <carlojpisani@gmail.com>, Meelis Roos <mroos@linux.ee>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
 <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
 <57fc8e0d-c04d-e82e-04ad-2debec0284fb@linux.ee>
 <CA+QBN9AfShbQ1JbcEMr++roxH0oivnEq-ndKc5yt6tGRos+N_w@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <63286d01-212f-aa26-cc57-8831dd3ded99@bell.net>
Date:   Sun, 12 May 2019 09:37:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9AfShbQ1JbcEMr++roxH0oivnEq-ndKc5yt6tGRos+N_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=M1D_i-ApoYGPaDZT5ZcA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfC1HbDgb6HlxyGD28LilZwWkQ08ce9PTJCh3JUBHgztHOYaNo0kzciDGhW9N0AIPXvb+ixHMEubdGdY0wAfRofuKKLlIVJlGKM0LLHGPwvPX/2jrNpys ssp2N6LNRB7jWJbiUhS/SmALLtqubL7orGkJ432B5/Ny3xRNGojlpJZ5/MHwHC4cBHp7I5+w0Up2DQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-12 6:51 a.m., Carlo Pisani wrote:
>> Problems from test like this suggest a problem outside the libata drivers themselves.
>> To me, it sounds rather something like dma mapping/sync errors, or memory
>> management errors (possibly dependent on hppa bus(bridge types).
> It's not installed in our C3600 at the moment,
> but it seems what we observed 2 days ago with Highpoint RocketRAID
> 1640HTP374 card
> it's PCI 32bit, 4 SATA channels, it doesn't crash, but it randomly
> offers file corruptions.
> The dmseg shows a lot of DMA errors.
I agree.  The memory errors in the PIM dump are recorded by the PDC firmware and they don't
directly involve the linux drivers.  Might be hardware problem.

-- 
John David Anglin  dave.anglin@bell.net

