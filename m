Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C47CC64FF11
	for <lists+linux-parisc@lfdr.de>; Sun, 18 Dec 2022 15:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiLROOi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 18 Dec 2022 09:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiLROOh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 18 Dec 2022 09:14:37 -0500
X-Greylist: delayed 172 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 18 Dec 2022 06:14:35 PST
Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDD1644D
        for <linux-parisc@vger.kernel.org>; Sun, 18 Dec 2022 06:14:35 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.50.166]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 637E1DE80428B04F
X-CM-Envelope: MS4xfPpYa7oVse2jnUC18koDMFcs4k0XfNgIZJokBVJp0Tw4ZKkL5DssyvApn4M+spnvYgB9lundP+sk+Wrn9kPzPcQX0zUzC4O7ZEdArwJ4wWWJEaWYUSPo
 2oZY6rC1M0UQaRnU8olG19WAvC+5HDJ8O4k5qNreQlDMrzrL6vfeX47ST2IHi4AlMwyre9XCUxRI6uy8UMFbeOUqDr1KxnQ/mj2yykquCze25jLIQ5cwLVA9
 RhdcR3Y0n3FeoH7fH9i31IpecyAi2j63COYTrT65YdwP+QcUMu/SVqX8iKpWgAkz
X-CM-Analysis: v=2.4 cv=drYdSXs4 c=1 sm=1 tr=0 ts=639f1f92
 a=DujhYzqEYufUJi90e8Godg==:117 a=DujhYzqEYufUJi90e8Godg==:17
 a=IkcTkHD0fZMA:10 a=fxJcL_dCAAAA:8 a=7mOBRU54AAAA:8 a=VwQbUJbxAAAA:8
 a=FBHGMhGWAAAA:8 a=LiFgAxUCjRtKjVKMQZ4A:9 a=QEXdDO2ut3YA:10 a=z4btgmanz7IA:10
 a=wa9RWnbW_A1YIeRBVszw:22 a=AjGcO6oz07-iQ99wixmX:22
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.50.166) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 637E1DE80428B04F; Sun, 18 Dec 2022 09:11:30 -0500
Message-ID: <f1e1830e-8cd6-65bb-9a27-44b14125234f@bell.net>
Date:   Sun, 18 Dec 2022 09:11:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Way to kill processes with unaligned access?
To:     Sam James <sam@gentoo.org>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
References: <1Mf07E-1oQMEy3JxS-00gYTD@mail.gmx.net>
 <2407F312-9FFD-4872-B172-405787E99C1E@gentoo.org>
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <2407F312-9FFD-4872-B172-405787E99C1E@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

It's controlled by /proc/sys/kernel/unaligned-trap.

Sadly, glibc (I believe) still generates some:
dupload(8822): unaligned access to 0xf8b3630d at ip 0xf720c88b (iir 0xee8104d)
http(6292): unaligned access to 0xfab011cd at ip 0xf720c9c3 (iir 0xd481043)

Dave

On 2022-12-18 6:41 a.m., Sam James wrote:
>
>> On 18 Dec 2022, at 11:25, Helge Deller <deller@gmx.de> wrote:
>>
>> https://manpages.ubuntu.com/manpages/focal/man1/prctl.1.html
>>
> Thanks, this looks perfect!
>
>> -------- Ursprüngliche Nachricht --------
>> Von: Helge Deller <deller@gmx.de>
>> Datum: 18.12.22 12:23 (GMT+01:00)
>> An: Sam James <sam@gentoo.org>, linux-parisc@vger.kernel.org
>> Betreff: RE: Way to kill processes with unaligned access?
>>
>> See prctl manpage, PR_SET_UNALIGN.
>> -------- Ursprüngliche Nachricht --------
>> Von: Sam James <sam@gentoo.org>
>> Datum: 18.12.22 10:14 (GMT+01:00)
>> An: linux-parisc@vger.kernel.org
>> Betreff: Way to kill processes with unaligned access?
>>
>> Hi all,
>>
>> I'm wondering if there's a way to configure the kernel such that
>> it kills processes when an unaligned access occurs.
>>
>> I often get messages like:
>> ```
>> [18531.277742] conftest(4066): unaligned access to 0xf7fa1715 at ip 0x426cb787 (iir 0xf801094)
>> [18531.487681] conftest(4066): unaligned access to 0xf7fa1716 at ip 0x426cb793 (iir 0xf80109c)
>> ```
>>
>> I know what they are, but it's a real pain to figure out *which* configure test in a given
>> case is causing the problem. If there's some way to make the kernel kill such naughty processes,
>> it'd make it way easier for me to locate.
>>
>> (Sometimes when I've built hundreds of packages, I have a lot of these I want to go investigate
>> after a week or two, but it's hard to track it down afterwards because of this.)
>>
>> Any ideas?
>>
>> Thanks!
>>
-- 
John David Anglin  dave.anglin@bell.net

