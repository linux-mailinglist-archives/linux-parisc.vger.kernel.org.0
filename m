Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C70A1AB7F
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 11:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfELJvY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 May 2019 05:51:24 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:54953 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbfELJvY (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 May 2019 05:51:24 -0400
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Carlo Pisani <carlojpisani@gmail.com>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
 <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <57fc8e0d-c04d-e82e-04ad-2debec0284fb@linux.ee>
Date:   Sun, 12 May 2019 12:51:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: et-EE
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> 1) copy a very big file cp data_16GB.bin copy.bin
> 2) compare the md5sum for checking the integrity

Problems from test like this suggest a problem outside the libata drivers themselves.

To me, it sounds rather something like dma mapping/sync errors, or memory
management errors (possibly dependent on hppa bus(bridge types).

-- 
Meelis Roos
