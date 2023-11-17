Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8077EF579
	for <lists+linux-parisc@lfdr.de>; Fri, 17 Nov 2023 16:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbjKQPmI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 17 Nov 2023 10:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbjKQPlx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 17 Nov 2023 10:41:53 -0500
Received: from cmx-torrgo001.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE8D1989
        for <linux-parisc@vger.kernel.org>; Fri, 17 Nov 2023 07:41:29 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.126.114.79]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 65569EED0010D5B6
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvkedrudegtddgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepiefgveehteelleeiuefhveelkedtkeefteevudekjedtffelgfehveegteejffetnecuffhomhgrihhnpehgnhhurdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepudegvddruddviedruddugedrjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddvrdeglegnpdhinhgvthepudegvddruddviedruddugedrjeelpdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghmsehgvghnthhoohdrohhrghdprhgvvhfkrfepsghrrghsqdgsrghsvgdqohhtfigrohhntdeltdei
        fidqghhrtgdqtdefqddugedvqdduvdeiqdduudegqdejledrughslhdrsggvlhhlrdgtrgdprghuthhhpghushgvrhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvght
X-CM-Envelope: MS4xfDwJ5eFpM9/Kpg6Wh/wGUJjL/Vd21cRe2iIp2PTP1ZpJFul9rKIJbgNWe/lrfSLnMUKoEHetavho0u0Xq9cw26+vxYZm19q7JJ2BU1jEPhdDI1VSadfG
 vx49PPXdRz3M7diJjyL71wOc58xa/wfm3a2IZpiTQPvexTPBacVPkVuCf0sanc0pKqC83JK9NA8MkSCGmWZJFPK6PzVlDZbFUm97Z/lYTcg+XAvgzvuMWaW7
 u6QjIoXF76N3phJzNUwvoY6CMdLj9ESs/qpOFiixCUc2y45ZVkzYITG6hkKEUfCtxwVBKEsaqAILgM+1/WCQ6A==
X-RazorGate-Vade-Verdict: clean 0
X-CM-Analysis: v=2.4 cv=Buj+fab5 c=1 sm=1 tr=0 ts=6557899e
 a=qwLmA0wx3TwW38sY+xTbUA==:117 a=qwLmA0wx3TwW38sY+xTbUA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=mDV3o1hIAAAA:8 a=VwQbUJbxAAAA:8
 a=QOliHeN2AkvvRaj7EhUA:9 a=QEXdDO2ut3YA:10 a=1zx8OqlqO4gA:10
 a=3Rn8qB5jpWcA:10 a=9gvnlMMaQFpL9xblJ6ne:22 a=_FVE-zBwftR9WsbkzFJk:22
 a=AjGcO6oz07-iQ99wixmX:22
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.114.79) by cmx-torrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 65569EED0010D5B6; Fri, 17 Nov 2023 10:41:18 -0500
Message-ID: <466ef8a1-92b3-4718-bb53-530c1e607ade@bell.net>
Date:   Fri, 17 Nov 2023 10:41:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: prctl call wrongly succeeds on HPPA?
To:     Helge Deller <deller@gmx.de>, Sam James <sam@gentoo.org>
Cc:     "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
References: <87lebjz9z6.fsf@gentoo.org> <875y2jro9a.fsf@gentoo.org>
 <0fec2446-a523-486f-9df7-4c6af9e2e0e3@gmx.de>
 <7409ec05-7a28-45fe-9604-519de5ae934e@bell.net>
 <cf75a1e4-c269-4530-b3aa-b02a81597acb@gmx.de>
 <b0a524df-9dab-4038-981f-33fc69043c1c@bell.net> <87sf5d8f9h.fsf@gentoo.org>
 <9bc4615d-122b-4c12-9537-b2eddc753a32@bell.net> <87leb58d45.fsf@gentoo.org>
 <7b4b838d-a3c2-40b4-b21e-0e5e73187bff@bell.net>
 <0cec0dfb-7a13-41fb-8498-3844102d18a5@gmx.de>
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <0cec0dfb-7a13-41fb-8498-3844102d18a5@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-11-17 9:55 a.m., Helge Deller wrote:
> On 11/11/23 00:02, John David Anglin wrote:
>> On 2023-11-10 5:16 p.m., Sam James wrote:
>>> John David Anglin <dave.anglin@bell.net> writes:
>>>
>>>> On 2023-11-10 4:32 p.m., Sam James wrote:
>>>>> John David Anglin <dave.anglin@bell.net> writes:
>>>>>
>>>>>> On 2023-11-10 3:38 p.m., Helge Deller wrote:
>>>>>>> On 11/10/23 21:12, John David Anglin wrote:
>>>>>>>> On 2023-11-10 3:01 p.m., Helge Deller wrote:
>>>>>>>>>>> On HPPA, we still need executable stacks, so this option doesn't work
>>>>>>>>>>> and leads to a segfault on boot.
>>>>>>>>> For kernel we don't need it any longer.
>>>>>>>>> But there might be dependencies on glibc version and/or combination.
>>>>>>>>> So, I've currently lost overview if we still need executable stacks...
>>>>>>>> FWIW, I recently changed gcc-14 to enable GNU stack notes and fixed a bug in the
>>>>>>>> 32-bit PA 2.0 trampoline template.  All execute stack tests in glibc now pass with gcc-14.
>>>>>>> Yes, I saw your commits.
>>>>>>> So, any code compiled with >= gcc-14 should be fine with non-writeable stacks?
>>>>>> Not exactly.  An executable stack is still needed for nested functions.  They are still called
>>>>>> via a stack trampoline.  The GNU stack note indicates whether an object needs an executable
>>>>>> stack or not.  These notes are collected by linker.  The glibc loader determines whether to setup
>>>>>> an executable stack or not.
>>>>>>> It would be easier if it would be a glibc dependency (for distribution maintainers)...
>>>>>> I'm not aware of any glibc dependency...
>>>>>>
>>>>>> I think once gcc-14 becomes the default compiler, we will have to enable GNU stack notes in
>>>>>> previous gcc versions.  We will still have executable stacks until everything is rebuilt.
>>>>> We will need to update that default in Binutils too, I think. That
>>>>> configure arg is working OK for me, but I did not try systemd yet.
>>>> Currently, there are no architecture dependencies in the ld --enable-warn-execstack and --enable-default-execstack
>>>> configure options.  The -z execstack and -z noexecstack ld options can override the GNU notes, or lack thereof.  We
>>>> may have to fix some assembly code.  Maybe binutils should be built with --enable-warn-execstack once we switch
>>>> to gcc-14.  I don't think we want --enable-default-execstack after switching to gcc-14.
>>> Are you sure? I just did some more digging now...
>>> * It looks like targets can set elf_backend_default_execstack in
>>> bfd/elf-*.c to override the default, see e.g. 81cd0a49c9e5f28c0fec391e449ea3272077c432 for cris.
>>> * See acd65fa610df09a0954b8fecdadf546215263c5d where HPPA's default got changed.
>>> * ld/configure.tgt still has some suppression for HPPA's default for
>>> warnings.
>>>
>>> I think we may need to, in due course, set elf_backend_default_execstack
>>> in bfd/elf32-hppa.c, and then drop those bits in ld/configure.tgt too?
>> You are right about both.  We have in ld/configure.tgt:
>> if test "${ac_default_ld_warn_execstack}" = 2; then
>>    case "${targ}" in
>>        # The HPPA port needs to support older kernels that
>>        # use executable stacks for signals and syscalls.
>>        # Many MIPS targets use executable stacks.
>>      hppa*-*-* | \
>>      mips*-*-*)
>>        ac_default_ld_warn_execstack=0
>>        ;;
>>      *)
>>        ;;
>>    esac
>> fi
>>
>> We also may need:
>> #define elf_backend_default_execstack 0
>> in elf32-hppa.c at some point.
>>
>> I think when GNU stack notes are present, they determine whether the stack in an executable will be executable or not.
>> But I could be wrong 🙁
>>
>> I'll try building binutils with gcc-14.
>
> Did it worked?
Build succeeds but there are about a dozen fails in ld testsuite which need investigation.

I got waylaid:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=112415

Jeff thinks the patch which I committed to gcc trunk to improve handling of REG+D addresses
will fail: https://gcc.gnu.org/pipermail/gcc-patches/2023-November/637018.html

There have been many problems with this over the years but I would prefer to see what breaks
with current implementation.  It fixes python build and we no longer need to disable inlining of
small functions.  A lot of water has passed under the bridge since Jeff worked on the issue.
>
> Btw, I added a small section about executable stacks in the TODO
> section of the wiki:
> https://parisc.wiki.kernel.org/index.php/TODO#executable_stack

Dave

-- 
John David Anglin  dave.anglin@bell.net

