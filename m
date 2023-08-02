Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6B8976D842
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Aug 2023 21:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbjHBT5V (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 2 Aug 2023 15:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbjHBT5U (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 2 Aug 2023 15:57:20 -0400
X-Greylist: delayed 76 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Aug 2023 12:57:16 PDT
Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0161F19BE
        for <linux-parisc@vger.kernel.org>; Wed,  2 Aug 2023 12:57:15 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.198.148.3]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64C35282007278E1
X-CM-Envelope: MS4xfCGQ31r/wIKV8z37/fh6q7ay+7s1JVSsFaze70ibJsqHT8seQOyLsMZ9hFZAHcKDy+7a8W72aJYiLXkTDq+7SeJyLCTicyM5grhsbny20yXoGTohpTjs
 nM5EFodKBK3i3xgg7qlslomeWhVyPY4p2M9UFH/STKIDahmnwL1fB2GSnonum3E7d9seXB0/PV3I6dLn9DpXsoVaELCrQxPwmwGKrr/x57J6L6UtA5Gq2jHv
 564Rx2ZUoqwmFpIJKrv8cyH/avwmA1xLNovobLOyTwrZRAEXPM3a7qYWfJu0pWVGAruxtoz4H8yHhP0limcXV0a9GmAYEinkG3H1WqWOwf2cYELM/C3bLKr/
 Lgc4tAax
X-CM-Analysis: v=2.4 cv=W7Nb6Tak c=1 sm=1 tr=0 ts=64cab4c3
 a=yRCPfkTDioc6Jdt88VZLzg==:117 a=yRCPfkTDioc6Jdt88VZLzg==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=xZB5VeKnRI1nMPX0Mx4A:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (142.198.148.3) by cmx-mtlrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64C35282007278E1; Wed, 2 Aug 2023 15:55:47 -0400
Message-ID: <e310e8b3-28e8-5b38-1998-c66ebd69b456@bell.net>
Date:   Wed, 2 Aug 2023 15:55:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Regression with kernel 6.4 "swapper: page allocation failure:
 order:0, mode:0x100(__GFP_ZERO)
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        Mike Rapoport <rppt@kernel.org>
Cc:     linux-parisc@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
References: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
 <ZMooZAKcm8OtKIfx@kernel.org> <1691003952@msgid.manchmal.in-ulm.de>
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <1691003952@msgid.manchmal.in-ulm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-08-02 3:20 p.m., Christoph Biedl wrote:
> Mike Rapoport wrote...
>
>> Can you check if the patch helps:
>>
>> diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
>> index cc15d737fda6..ae3493dae9dc 100644
> (...)
>
> Yes, everything's fine now. Applied on top of v6.5-rc4, there
> were some offsets.
Same here.  Applied on v6.4.7 stable.

Dave

-- 
John David Anglin  dave.anglin@bell.net

