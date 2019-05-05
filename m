Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC356142A3
	for <lists+linux-parisc@lfdr.de>; Mon,  6 May 2019 00:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbfEEWDh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 May 2019 18:03:37 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:48832 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727295AbfEEWDg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 May 2019 18:03:36 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190505220335.FMMT4584.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 5 May 2019 18:03:35 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm01.bell.net
          with ESMTP
          id <20190505220335.QWZT39285.torspm01.bell.net@[192.168.2.49]>;
          Sun, 5 May 2019 18:03:35 -0400
Subject: Re: [PATCH] Rename LEVEL to PA_ASM_LEVEL to avoid name clash with
 DRBD code
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190505215434.GA25118@ls3530.dellerweb.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <eb66a85f-f5e7-d9ee-4a8d-8cd2759fb9f6@bell.net>
Date:   Sun, 5 May 2019 18:03:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505215434.GA25118@ls3530.dellerweb.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=Ar3uIOkb1bk2pXN9VYUA:9 a=QEXdDO2ut3YA:10 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfHEfMgOf2FN45cCRmaL+kLDuLgn2Y6a4cZwiNF0HRkv0k17bOlUG5zyIZMjB7ddws4elEKHorQQExI81qj0dHXa1ycIcWcDP62lMr8YpwBBW69u4X86a ep7Au72AMPyCRFZdctAn/7lO2CVW+/7dXcVBg9LVO4+uxoSXdYIrCGRS5JFOCKkAkoj105qRjV3Txg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-05 5:54 p.m., Helge Deller wrote:
> LEVEL is a very common word, and now after many years it suddenly
> clashed with another LEVEL define in the DRBD code.
> Rename it to PA_ASM_LEVEL instead.
I'm sure we used it first ;-)

Dave

-- 
John David Anglin  dave.anglin@bell.net

