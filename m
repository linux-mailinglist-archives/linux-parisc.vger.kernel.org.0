Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3F8777B71
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Aug 2023 16:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234051AbjHJO56 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Aug 2023 10:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235249AbjHJO56 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Aug 2023 10:57:58 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFE42694
        for <linux-parisc@vger.kernel.org>; Thu, 10 Aug 2023 07:57:57 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.198.148.3]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64C354070130985E
X-CM-Envelope: MS4xfJ07uiSYwmAzwkKOW6Txr7CkvTVSCYR2590ERDd6Jfzk/upRSuKPBCJJ8POE1MQANehMC7L3+zYMMpsFx5+NnV2IO2WsjRYSpwvz2PVh+x5NDOZ29gt1
 9f8kORp1xcCQOvfrlSj56RfrfORZ/e628qZ8CBMBvjwqFcFSY/54rj0Z2LiG3/tlwyg9yj7AGaXQyqr3tAQWGLtNw7wuOvBjHZCw9+Ic83X8hrjxxt5Ko+Kv
 hTx6Ew7N2S66HGaZnzzqNtnAJ3Rdf9Ia9aDk261IS70=
X-CM-Analysis: v=2.4 cv=QbcFAuXv c=1 sm=1 tr=0 ts=64d4faf2
 a=yRCPfkTDioc6Jdt88VZLzg==:117 a=yRCPfkTDioc6Jdt88VZLzg==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=VwQbUJbxAAAA:8 a=rtbVTMtHOJr7CGVfIp0A:9
 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22 a=AjGcO6oz07-iQ99wixmX:22
Received: from [192.168.2.49] (142.198.148.3) by cmx-mtlrgo002.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64C354070130985E; Thu, 10 Aug 2023 10:57:54 -0400
Message-ID: <a28de2c8-edce-0f2b-0d2a-075fcbf05e3f@bell.net>
Date:   Thu, 10 Aug 2023 10:57:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] parisc: Fix lightweight spinlock checks to not break
 futexes
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <ZNM8Rz5f5/d/ZAI8@p100>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <ZNM8Rz5f5/d/ZAI8@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-08-09 3:12 a.m., Helge Deller wrote:
> The lightweight spinlock checks verify that a spinlock has either value
> 0 (spinlock locked) and that not any other bits than in
> __ARCH_SPIN_LOCK_UNLOCKED_VAL is set.
>
> This breaks the current LWS code, which writes the address of the lock
> into the lock word to unlock it, which was an optimization to save one
> assembler instruction.
>
> Fix it by making spinlock_types.h accessible for asm code, change the
> LWS spinlock-unlocking code to write __ARCH_SPIN_LOCK_UNLOCKED_VAL into
> the lock word, and add some missing lightweight spinlock checks to the
> LWS path. Finally, make the spinlock checks dependend on DEBUG_KERNEL.
>
> Noticed-by: John David Anglin<dave.anglin@bell.net>
> Signed-off-by: Helge Deller<deller@gmx.de>
> Cc:stable@vger.kernel.org  # v6.4+
> Fixes: 15e64ef6520e ("parisc: Add lightweight spinlock checks")
Fixes system crash in glibc testsuite.

Tested-by: John David Anglin <dave.anglin@bell.net>

-- 
John David Anglin  dave.anglin@bell.net

