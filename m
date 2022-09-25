Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28A35E9579
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 20:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiIYSrD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 14:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiIYSrC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 14:47:02 -0400
X-Greylist: delayed 154 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 25 Sep 2022 11:47:00 PDT
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79C22C13A
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 11:47:00 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.58.43]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6324753403FDC356
X-CM-Envelope: MS4xfDfDWcRtjV2QMAnmrB8O+V1KoUGg3AuPxM42EuGMyWkBpKR1c4tKxbh5FWkkkBwo8uMuLYePTmNQkjZ/Kjr6ICBPIQ9099fjT/+BaNrtveGu9KdZjdy+
 VMVJDWsWZ4O4jsHsIyGC4W5BRX84MqcfTJML0Q7M2N97/xUihBem4fQV8AF7pMVfZQRoAbHu5IBc8sQuQ8X4i/UxY/fM2RIQquFX1/dhWrQQ2QSvNjUz0xta
 XXGunpaFRLmWsMkOYfgk0Ci0N0PZOKi7BNRga0zgX6jVcDWhcZV11+wJWM8MQycPPCmiFFp4y3ymcPZ/ZDNfkSWMI9SeYeVTMmulbIQX6NQ=
X-CM-Analysis: v=2.4 cv=FMx4e8ks c=1 sm=1 tr=0 ts=6330a186
 a=oiJDitmlNOPgVxj52MZyFw==:117 a=oiJDitmlNOPgVxj52MZyFw==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=vyv49nM3nKlf-l5PmgsA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.58.43) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6324753403FDC356; Sun, 25 Sep 2022 14:44:22 -0400
Message-ID: <e2ffc031-0e62-8e2b-82eb-aac0460a453c@bell.net>
Date:   Sun, 25 Sep 2022 14:44:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on UP machines
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yy/7g0NzOi/igNi7@p100>
 <d195aae3-b76b-1365-6e53-28c6791c77e3@bell.net>
 <92a8b235-7d04-9931-a153-440adbc8802a@gmx.de>
 <bffa9fac-a6f6-fc7e-0e66-5df215aef2ba@bell.net>
In-Reply-To: <bffa9fac-a6f6-fc7e-0e66-5df215aef2ba@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-09-25 2:19 p.m., John David Anglin wrote:
>> One goal of that patch was to drop the CONFIG_PA20 ifdef case,
>> because a 32-bit kernel could be compiled for PA8000 in which case
>> the "pdtlb,l" will burn the machine.
> Don't think so.  "pdtlb,l" is available on all PA 2.0 machines. It's not 64-bit specific.
There is some difference in implementation between PA 1.1 and 2.0. 64-bit register
values are used in the PA 2.0 implementation.

Dave

-- 
John David Anglin  dave.anglin@bell.net

