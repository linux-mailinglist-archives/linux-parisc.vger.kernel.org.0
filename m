Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61F564FE15E
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Apr 2022 14:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243806AbiDLM72 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Apr 2022 08:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354753AbiDLM4L (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Apr 2022 08:56:11 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A9C563DDF8
        for <linux-parisc@vger.kernel.org>; Tue, 12 Apr 2022 05:29:59 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 624B12C700C3B734
X-CM-Envelope: MS4xfA7iYP0LLxnJxwzoTIf/PA4cIdkp9mubW65gy87qcJX9hcxgQQ0CaKuxDLnUPy1i7Joljmr9MuIe3UDgNzBABFj9xDzoz6opwQF+Dr492PcaTHMy4Urk
 ir4scaWb7b4YzAcAPLkvwwYnQKoc8e966qikRCjZKtZSQf2SVzkAdS1dKhy1W8bLbweFONiPpw3+gH/5QIQGPpvrls7QBIj/Ms3rz55Hwqm7bzoZCQrOI2b6
 EcSc1UTU6j9UUKQDkN0dn1Mkx5hO01u2ADrxh2yRGKrZu1stvKwYL29sZ4LzEwFv
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=6255701e
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=7mOBRU54AAAA:8 a=VwQbUJbxAAAA:8 a=FBHGMhGWAAAA:8
 a=nKDW0jC8DGCiTJ8odYsA:9 a=QEXdDO2ut3YA:10 a=wa9RWnbW_A1YIeRBVszw:22
 a=AjGcO6oz07-iQ99wixmX:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 624B12C700C3B734; Tue, 12 Apr 2022 08:27:10 -0400
Message-ID: <cb19a0a0-69b2-ab14-7767-a0cd7bd671b0@bell.net>
Date:   Tue, 12 Apr 2022 08:27:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
To:     Sam James <sam@gentoo.org>
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
 <94439119-D2B6-4961-B61D-95784E09798D@gentoo.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <94439119-D2B6-4961-B61D-95784E09798D@gentoo.org>
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

On 2022-04-12 1:18 a.m., Sam James wrote:
>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x411ee000 and 0x428c9000 in file bash
>>> ```
>> It seems all these messages result from a single call to flush_dcache_page.  Note the sequential behavior of old_addr
>> and addr, and message times.
> FWIW, from Helge's config on 5.10.108 (config changes on my end: just disabling unneeded devices to speed up build), I have the same
> horrible wall:
This change might help:
https://lore.kernel.org/linux-parisc/YlNw8jzP9OQRKvlV@mx3210.localdomain/T/#u

It applies on top of Helge's current for-next tree which is based on 5.18.0-rc1+.

The messages will no longer appear with this patch on c8000/rp34xx. However, the loop corruption
might still occur.  If that happens, I think the stall detector will trigger, or maybe some other crash.

The loop is changed to flush all mount points on machines with PA8800 or PA8900 processors as I
believe these CPUs don't support equivalent aliases.

Dave

-- 
John David Anglin  dave.anglin@bell.net

