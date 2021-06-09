Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C063A1B25
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Jun 2021 18:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbhFIQm3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Jun 2021 12:42:29 -0400
Received: from mta-mtl-003.bell.net ([209.71.208.13]:21626 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229519AbhFIQm2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Jun 2021 12:42:28 -0400
X-Greylist: delayed 353 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Jun 2021 12:42:28 EDT
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.147.238]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 606F70CF01EF6A98
X-CM-Envelope: MS4xfCEQ4v0e+TB/ozdFr7/v3qtjhc92FwxsjCaNimJaDnw/YgssrfzBojYWHHXmf9M+E7UHCLLfVMTV+iEjPZeO2Mnbzoq6ltRj2lOlisw0EEB0wom2S6yy
 q+QsNQi8DqslduDG4Nvmyw2OoGhJTi5imAM1VM8ErQ0ovNO8nnPbzVzCiYlhouhpmM47m76jG2XK4Hcq/JQLRpYAKOsNtoYbf17KWiRNhSP2/zhTVVaNhhmc
 IOxp9WwOcOxRUQwibMkFJRyHz9J2qTpevlWbV3C5Xq4hTVDnVeJrp8w6O9GwHIbw
X-CM-Analysis: v=2.4 cv=AO2bAPyd c=1 sm=1 tr=0 ts=60c0ed9d
 a=/cPhanApxV8nRKTAyWrE3w==:117 a=/cPhanApxV8nRKTAyWrE3w==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=1mxDF_HAhWba3j08bTEA:9 a=QEXdDO2ut3YA:10
 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.147.238) by cmx-mtlrgo002.bell.net (5.8.715) (authenticated as dave.anglin@bell.net)
        id 606F70CF01EF6A98; Wed, 9 Jun 2021 12:34:37 -0400
Subject: Re: linux-parisc compile failure in current git
To:     Meelis Roos <mroos@linux.ee>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
References: <892b6ab7-862c-1c0a-2996-0f8408e5043d@linux.ee>
 <1ebff319-ad1d-0b83-d0b8-e3c88a8f3e48@gmx.de>
 <eaaaaa72-d79e-27a2-9bdb-2e44c047e0ba@linux.ee>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <971a7a6f-03af-43d2-8329-9d283d5a72a9@bell.net>
Date:   Wed, 9 Jun 2021 12:34:37 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eaaaaa72-d79e-27a2-9bdb-2e44c047e0ba@linux.ee>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-06-09 11:31 a.m., Meelis Roos wrote:
> 09.06.21 14:04 Helge Deller wrote:
>> Does it still happens?
>
> Yes, it does still happen with v5.13-rc5-36-g368094df48e
I see same problem.

-- 
John David Anglin  dave.anglin@bell.net

