Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58BCF4FE282
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Apr 2022 15:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355989AbiDLN1A (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Apr 2022 09:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356194AbiDLN0w (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Apr 2022 09:26:52 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 77BDF32D
        for <linux-parisc@vger.kernel.org>; Tue, 12 Apr 2022 06:20:28 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 624D96FC0091EE18
X-CM-Envelope: MS4xfDxwv0yQynDrdOr2zbG1sdweJ6SndfsUE04p20dSH6xQseBl5oM+VGsedRQpXSYaTKenTVb9B8H9LyHMVIgDYpuNk3kEIER9os5RhXYM2PTBscNL5GwS
 Kg3P8QgNwidBybx43zvr32LCukqxNR+M+SZI7Z2VXqNtvMwJVYPpkZyuHWP8F2FnzTBDpind25JC681nvb74ZkSJS4BGBG3bRj1xYZHwGEfW6LpAihAZVowK
 LHnZGQGmSgRUWeeo98kBUbcjj2ikllVNzKswzoKT5Df3J9HNmijCNDKWHE0uMpZv
X-CM-Analysis: v=2.4 cv=aKWTFZxm c=1 sm=1 tr=0 ts=62557c93
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=7mOBRU54AAAA:8 a=VwQbUJbxAAAA:8 a=FBHGMhGWAAAA:8
 a=Jnis4izeJgldjXVnqSMA:9 a=QEXdDO2ut3YA:10 a=wa9RWnbW_A1YIeRBVszw:22
 a=AjGcO6oz07-iQ99wixmX:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 624D96FC0091EE18; Tue, 12 Apr 2022 09:20:19 -0400
Message-ID: <383d6dfa-bef1-e56f-8f82-dfc0682cdacc@bell.net>
Date:   Tue, 12 Apr 2022 09:20:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Sam James <sam@gentoo.org>
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
 <94439119-D2B6-4961-B61D-95784E09798D@gentoo.org>
 <cb19a0a0-69b2-ab14-7767-a0cd7bd671b0@bell.net>
In-Reply-To: <cb19a0a0-69b2-ab14-7767-a0cd7bd671b0@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-04-12 8:27 a.m., John David Anglin wrote:
> On 2022-04-12 1:18 a.m., Sam James wrote:
>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x411ee000 and 0x428c9000 in file bash
>>>> ```
>>> It seems all these messages result from a single call to flush_dcache_page.  Note the sequential behavior of old_addr
>>> and addr, and message times.
>> FWIW, from Helge's config on 5.10.108 (config changes on my end: just disabling unneeded devices to speed up build), I have the same
>> horrible wall:
> This change might help:
> https://lore.kernel.org/linux-parisc/YlNw8jzP9OQRKvlV@mx3210.localdomain/T/#u
>
> It applies on top of Helge's current for-next tree which is based on 5.18.0-rc1+.
>
> The messages will no longer appear with this patch on c8000/rp34xx. However, the loop corruption
> might still occur.  If that happens, I think the stall detector will trigger, or maybe some other crash.
>
> The loop is changed to flush all mount points on machines with PA8800 or PA8900 processors as I
> believe these CPUs don't support equivalent aliases.

Thousands of messages aren't useful.  I would suggest adding a BUG_ON statement in the loop that
triggers on the first message.  That might help find the circumstances that cause the problem.

I think the loop may get corrupted when the mapping code fails to find an address aligned on a 4MB
boundary.  Another possibility might be a locking issue.  In both these cases, the messages are just a
symptom of a problem elsewhere.

Dave

-- 
John David Anglin  dave.anglin@bell.net

