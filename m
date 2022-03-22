Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27A24E45D8
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Mar 2022 19:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237386AbiCVSUq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Mar 2022 14:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237209AbiCVSUp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Mar 2022 14:20:45 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6B326E8E9
        for <linux-parisc@vger.kernel.org>; Tue, 22 Mar 2022 11:19:16 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 622804910137F711
X-CM-Envelope: MS4xfExuN+KItAYpOMCwGTZM+wAKHJ9cFSdnffSw64+cR9ZYL9Pgqi/s1qU22/KVc8FM2DKd/bU62jy1KLBCPcuyRGK7cZPYyADIoP61Ev5FkbgBtpEGWWV/
 fupTKtl4hMJ7OhdMozWuytWSki/1vfgrt1k+4Abi/t2DUuMXAGVToz8XmUCwlRgY4tOFRtYfeEi/qAZ2lqzIr3MCnDAiYAe99APmaSisdQeRfsxLhPRsHNWT
 qzpK3npP66z9bqO6MwsIq+966EEUZyCP2LpY0S1fQkApjTdI7etLGlBez8JRiW2G
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=623a1319
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=7mOBRU54AAAA:8 a=VwQbUJbxAAAA:8 a=FBHGMhGWAAAA:8
 a=KCBEL2QBZUns_gx1erwA:9 a=QEXdDO2ut3YA:10 a=wa9RWnbW_A1YIeRBVszw:22
 a=AjGcO6oz07-iQ99wixmX:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 622804910137F711; Tue, 22 Mar 2022 14:19:05 -0400
Message-ID: <b84f1c67-eea7-f07a-0163-6e06b0f5f650@bell.net>
Date:   Tue, 22 Mar 2022 14:19:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
To:     Sam James <sam@gentoo.org>, linux-parisc@vger.kernel.org
Cc:     hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-03-22 1:52 p.m., Sam James wrote:
> Hi all,
>
> In Gentoo, we've just got our hands on an RP3440 (PA8800) which seems to quite easily hit inequivalent aliasing issues.
>
> We've found that under some workloads, the machine copes fine, none of that appears in dmesg, and all is well - even for
> over a week. But as soon as we start other workloads (the problematic one is building "stages" -- release media for Gentoo),
> within 30m or so, the machine is in a broken state, with these messages flooding dmesg:
> ```
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42994000 and 0x426e1000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x426e1000 and 0x41b56000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41b56000 and 0x41aae000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41aae000 and 0x42774000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42774000 and 0x41202000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41202000 and 0x428dd000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41e2c000 and 0x418f6000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x418f6000 and 0x42980000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42980000 and 0x426cd000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x426cd000 and 0x41b42000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41b42000 and 0x41a9a000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41a9a000 and 0x42760000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42760000 and 0x411ee000 in file bash
> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x411ee000 and 0x428c9000 in file bash
I don't think this is new.  There are no changes to the code that detects INEQUIVALENT ALIASES in the latest pull.

I've seen this before but it's not occurring in my current builds for rp3440 and c8000.  I've been running for-next
changes on c8000 for several weeks.

I suspect a problem with shmat but I'm not sure.
> ```
>
> When it's in this state, GCC ends up ICEing at some point and other userland command fails too (e.g. last night
> I tried unpacking a kernel and 'xz' failed the first time, but worked the second). It might be of note that I think
> the failures end up happening during a HPPA 1.1 build.
>
> I appreciate this isn't really enough information to solve the problem, but I'm not sure what I need to obtain:
> any suggestions for how to debug this further & get more information to better receive assistance would be most welcome.
>
> The machine is currently running 5.17.0 along with Helge's tree up to (and including) Linus's pull for 5.18.0
> (https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=a04b1bf574e1f4875ea91f5c62ca051666443200).
>
> We're also using GCC 11.2 (but a snapshot from their stable 11 branch), glibc 2.34 (with latest patches), and latest
> Binutils 2.37 (with patches from upstream again).
>
> I've also attached the running kernel config in case any suggestions can be made there to either aid debugging or
> reduce the chances of this issue occurring.
>
> TL:DR: Lots of inequivalent aliases issues when running certain intensive workloads (but not others?), system ends up
> in a bad state and needs a reboot to function correctly (otherwise userland may misbehave/crash), need more help
> with how to debug/get more information out of it/narrow it down.
>
> Of course, if needed, we can provide access to the machine for kernel maintainers and show them how to induce a broken
> State (or do it for them repeatedly) if we can't find a smaller test case.
Dave

-- 
John David Anglin  dave.anglin@bell.net

