Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 993764E49D8
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Mar 2022 00:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240808AbiCWAA4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Mar 2022 20:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiCWAAz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Mar 2022 20:00:55 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F37F32980
        for <linux-parisc@vger.kernel.org>; Tue, 22 Mar 2022 16:59:27 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 621B30220294EFB5
X-CM-Envelope: MS4xfILKJcisbRXav26JZNfNie8OQFwa8x7+YT8Ufou/yqNXrnWYtWT0OAUZKIWU88c7Z2b4suIWR6oJi7f8XSIA1zTll/cIhURh1ibqsCfr6aYOgJ4MaYGo
 ecRoPP27A7kkdTdUu28kd0/VjEgMAIwOe/7XBGXiDydUyOrTIqwlAaokN22jvrfvXoG42LK7SKU1/OsQZmyAWHbd97JrrSzpADG0od1ew72bNR7/fInMuK/w
 vSK5uXVCAxEL5jSP84CIVW9j9BvcUuA06M6zEjeqnTb41L/LHZOsAsWzCQGg6JL1
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=623a62d6
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=4kdaShGxUNUxmyNJHXsA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 621B30220294EFB5; Tue, 22 Mar 2022 19:59:18 -0400
Message-ID: <89051efe-7b06-1d67-dfc4-1f17024f9ed9@bell.net>
Date:   Tue, 22 Mar 2022 19:59:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
To:     Sam James <sam@gentoo.org>
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <b84f1c67-eea7-f07a-0163-6e06b0f5f650@bell.net>
 <309C1399-6AA2-44BD-8EB9-FDB66F5D972E@gentoo.org>
 <73bf3336-9207-ba0e-1950-8cb1b7d6adc3@bell.net>
 <f7a714d9-b620-5100-a0e7-51360419eeda@bell.net>
 <17C0A3CF-01B8-4457-B040-8E96A10AE2DF@gentoo.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <17C0A3CF-01B8-4457-B040-8E96A10AE2DF@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-03-22 4:43 p.m., Sam James wrote:
>> In order to debug, one needs to find the circumstances that cause it.
>>
> Understood & agreed. I'm going to try Helge's config w/ 5.10.x, then yours with 5.16.x, and try get some
> more information on how to reproduce too. I'll report back.
Looking back at my notes, I see that INEQUIVALENT ALIASES occur building gnuradio on debian.

Dave

-- 
John David Anglin  dave.anglin@bell.net

