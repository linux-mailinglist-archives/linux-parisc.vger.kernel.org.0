Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62CA378A1B7
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Aug 2023 23:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjH0VCd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Aug 2023 17:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjH0VCJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Aug 2023 17:02:09 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9F1B5
        for <linux-parisc@vger.kernel.org>; Sun, 27 Aug 2023 14:02:02 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.198.135.111]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64C35282029E2262
X-CM-Envelope: MS4xfD8jRtdK651eJ2opxgkpgLs4fOFrlfipTYxuqwSugIr38ow6z6YxF73TBjzGGckLqBRoZayXwGKwnLc4uy9eaRHMMik7JyYsbsY1mM7xS7RFnP+QaQJD
 zu0qoQjgWEkiJChKXmWMiAQ+nOQGQAL3S9tNqgal2Z3CK3Y2lDss/5Aul+WStQu9qlTR6m7zOXFhm29Me1D0LrcrgbeHuYNne/0jpwPorcXKvh4NiUjqEOXj
 8S9g5wtGNL65ypobuG0RCOd4p8DO4FtOXUmEry1OdASY5OinaJRuTZ3ehQ6NeFHGsrqDV/UEPZl8sZl7pTGIOA==
X-CM-Analysis: v=2.4 cv=W7Nb6Tak c=1 sm=1 tr=0 ts=64ebb9c4
 a=m0hBPjpnfWKpZW+YOe+Hqw==:117 a=m0hBPjpnfWKpZW+YOe+Hqw==:17
 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=FBHGMhGWAAAA:8 a=QcoY8ClkhCMLAX4f6ngA:9
 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (142.198.135.111) by cmx-mtlrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64C35282029E2262; Sun, 27 Aug 2023 17:01:56 -0400
Message-ID: <d52e26aa-0c46-498b-0586-1fea2f94c58d@bell.net>
Date:   Sun, 27 Aug 2023 17:01:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, Vidra.Jonas@seznam.cz,
        linux-parisc@vger.kernel.org
References: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
 <7ce98f53-d80d-fc78-1bff-419eedaf8e36@bell.net>
 <f8be4af4-725a-902f-60a5-0f18c198b130@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <f8be4af4-725a-902f-60a5-0f18c198b130@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-08-27 4:41 p.m., Helge Deller wrote:
> On 8/27/23 22:35, John David Anglin wrote:
>> On 2023-08-27 7:25 a.m., Vidra.Jonas@seznam.cz wrote:
>>> The issue is that a call to
>>> `io_uring_enter(fd, 2, 2, IORING_ENTER_GETEVENTS)`
>>> returns 0, and libuv reacts to that by aborting, probably on this line:
>>> https://github.com/libuv/libuv/blob/65dc822d6c20a9130fa100c7b46d751f8cf4d233/src/unix/linux.c#L1252
>>> (I'm saying probably, because gdb seems to be buggy on my machine and I
>>> don't really trust its output, so I rely on strace instead, but that
>>> doesn't support backtraces on the PA-RISC.)
>> I have the attached io_uring patch on 6.1.46.  It's back ported from 6.4.
>>
>> libuv make check was successful on my system.
>
> Did the libuv check failed on 6.1.46 for you?
No. It was successful.
> I just tried plain 6.1.49 and my machine crashed....
Dave

-- 
John David Anglin  dave.anglin@bell.net

