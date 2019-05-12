Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45CBC1AD07
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 18:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfELQWN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 May 2019 12:22:13 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:33087 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726586AbfELQWN (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 May 2019 12:22:13 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190512162212.NXLR4444.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 12 May 2019 12:22:12 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by mtlspm02.bell.net
          with ESMTP
          id <20190512162211.LRPU21689.mtlspm02.bell.net@[192.168.2.49]>;
          Sun, 12 May 2019 12:22:11 -0400
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Helge Deller <deller@gmx.de>, Meelis Roos <mroos@linux.ee>,
        linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
 <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
 <fac5aa59-999f-e61e-774e-b43d0d28779c@bell.net>
 <CA+QBN9D6yQiB2zZAvg51LWoAgFAzO9LeuJQyadRvn3y4+hUxMg@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <3f9c31a6-7fd0-3ecb-f890-cac0b2744d9c@bell.net>
Date:   Sun, 12 May 2019 12:22:10 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9D6yQiB2zZAvg51LWoAgFAzO9LeuJQyadRvn3y4+hUxMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=djjhsy-zAAAA:8 a=JoQWYm39AAAA:8 a=FBHGMhGWAAAA:8 a=qKj4x21hgWvU5zUXobMA:9 a=QEXdDO2ut3YA:10 a=T-j7vH17oXcA:10 a=EotaCPLNDJkJNB2bz6rd:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfBG1mIFY5SR3HspEKtOHS2MoRrwVOxgNys8+a0Fet3ha481e8Ry88SjwPDPqOcx/FdmsP9utO+q85ZMGAEt+8Hap1AVCFS5qDu8sFeqy5h/mTyWiI5g5 lo8CJ/3G+5L4uyMQff3g5ii9hOn/VTXiC/cVt8xggXKDMFuJ/kQNE4pEOK65lIfpfNewb9Dbdjh+IA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-12 2:28 a.m., Carlo Pisani wrote:
> tested on a C3600
> with a Silicon Image Sil3124
> the first card's brand is "SYBA-II" (from Amazon dot com)
> it's 4 SATA channels, PCI 32bit
There is also this card with Silicon Image Sil3512:
https://www.sybausa.com/index.php?route=product/product&product_id=171&search=SD-SATA150R
https://www.amazon.ca/Syba-Controller-Silicon-Software-Components/dp/B000BU7XNG?th=1
Keying looks universal.

-- 
John David Anglin  dave.anglin@bell.net

