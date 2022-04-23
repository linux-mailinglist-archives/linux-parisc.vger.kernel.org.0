Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E02550CD65
	for <lists+linux-parisc@lfdr.de>; Sat, 23 Apr 2022 22:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbiDWUhC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 23 Apr 2022 16:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236826AbiDWUhB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 23 Apr 2022 16:37:01 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0854A30F7B
        for <linux-parisc@vger.kernel.org>; Sat, 23 Apr 2022 13:34:02 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 625E3E3F00801461
X-CM-Envelope: MS4xfO+dTiLzReYDYPhj6zbiei+QI4Ba2sFsm6i1HROG9J11eqAd0SeXyP4xVb/YdJzLUM1u+PEF81z1Y78oq0OapNgGyheY0qgCsAICLj1LLVJUyOP+kwAP
 ep0O4717ycuu1XOY4Q1pAKVoHyeDNcPKTWcBEf7Tkui7QtXtu+zMacW3HG2wJPKTdr+1Jz+Cc9zpKdH43PZJZZjSXv0vKIRNS7hs3mdR2T/ObA7eZowv7VAF
 wchoylf+bPSK8uVToPCd6NrkHV2tgW54SKZykEIOm1QzYCJadGKo6yjVf3ugMrJ5
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=626462b2
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=7mOBRU54AAAA:8 a=FBHGMhGWAAAA:8 a=kDKcwGHOqwHdSojEfYcA:9
 a=QEXdDO2ut3YA:10 a=wa9RWnbW_A1YIeRBVszw:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 625E3E3F00801461; Sat, 23 Apr 2022 16:33:53 -0400
Message-ID: <cf860bf1-239d-bb14-4d7a-0f478c10e05f@bell.net>
Date:   Sat, 23 Apr 2022 16:33:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Sam James <sam@gentoo.org>, linux-parisc@vger.kernel.org
Cc:     hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
In-Reply-To: <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-04-05 5:13 p.m., John David Anglin wrote:
> On 2022-03-22 1:52 p.m., Sam James wrote:
>> In Gentoo, we've just got our hands on an RP3440 (PA8800) which seems to quite easily hit inequivalent aliasing issues.
>>
>> We've found that under some workloads, the machine copes fine, none of that appears in dmesg, and all is well - even for
>> over a week. But as soon as we start other workloads (the problematic one is building "stages" -- release media for Gentoo),
>> within 30m or so, the machine is in a broken state, with these messages flooding dmesg:
>> ```
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42994000 and 0x426e1000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x426e1000 and 0x41b56000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41b56000 and 0x41aae000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41aae000 and 0x42774000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42774000 and 0x41202000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41202000 and 0x428dd000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41e2c000 and 0x418f6000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x418f6000 and 0x42980000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42980000 and 0x426cd000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x426cd000 and 0x41b42000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41b42000 and 0x41a9a000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x41a9a000 and 0x42760000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x42760000 and 0x411ee000 in file bash
>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x411ee000 and 0x428c9000 in file bash
>> ```
> It seems all these messages result from a single call to flush_dcache_page.  Note the sequential behavior of old_addr
> and addr, and message times.
I had some messages from systemd:

[ 1738.323997] INEQUIVALENT ALIASES 0x42190000 and 0x4222d000 in file systemd
[ 1738.361116] INEQUIVALENT ALIASES 0x42186000 and 0x42223000 in file systemd
[ 1738.373668] INEQUIVALENT ALIASES 0x4218d000 and 0x4222a000 in file systemd
[ 1738.379494] INEQUIVALENT ALIASES 0x4217f000 and 0x4221c000 in file systemd
[ 1738.392740] INEQUIVALENT ALIASES 0x4217c000 and 0x42219000 in file systemd
[ 1738.394909] INEQUIVALENT ALIASES 0x42199000 and 0x42236000 in file systemd

root@hiauly6:/proc/892# cat maps
42219000-423a2000 r-xp 00000000 08:15 8918492                            /lib/systemd/systemd
423a2000-423c7000 r--p 00189000 08:15 8918492                            /lib/systemd/systemd
423c7000-423d3000 rwxp 001ae000 08:15 8918492                            /lib/systemd/systemd
42523000-4259b000 rwxp 00000000 00:00 0                                  [heap]
f0bfa000-f0c20000 r-xp 00000000 08:15 8913804 /lib/hppa-linux-gnu/libgpg-error.so.0.32.1
f0c20000-f0c21000 rwxp 00026000 08:15 8913804 /lib/hppa-linux-gnu/libgpg-error.so.0.32.1
f0ffa000-f0fff000 r-xp 00000000 08:15 16780132 /usr/lib/hppa-linux-gnu/libattr.so.1.1.2501
f0fff000-f1000000 rwxp 00005000 08:15 16780132 /usr/lib/hppa-linux-gnu/libattr.so.1.1.2501
f13fa000-f1656000 r-xp 00000000 08:15 16782647 /usr/lib/hppa-linux-gnu/libcrypto.so.1.1
f1656000-f1677000 rwxp 0025c000 08:15 16782647 /usr/lib/hppa-linux-gnu/libcrypto.so.1.1
f1677000-f167b000 rwxp 00000000 00:00 0
f17fa000-f17ff000 r-xp 00000000 08:15 8912981 /lib/hppa-linux-gnu/libcap-ng.so.0.0.0
f17ff000-f1800000 r--p 00005000 08:15 8912981 /lib/hppa-linux-gnu/libcap-ng.so.0.0.0
f1800000-f1801000 rwxp 00006000 08:15 8912981 /lib/hppa-linux-gnu/libcap-ng.so.0.0.0
f1bfa000-f1c55000 r-xp 00000000 08:15 16782725 /usr/lib/hppa-linux-gnu/libpcre2-8.so.0.10.4
f1c55000-f1c56000 rwxp 0005b000 08:15 16782725 /usr/lib/hppa-linux-gnu/libpcre2-8.so.0.10.4
f1ffa000-f206f000 r-xp 00000000 08:15 8913179 /lib/hppa-linux-gnu/libm-2.33.so
f206f000-f2070000 r--p 00075000 08:15 8913179 /lib/hppa-linux-gnu/libm-2.33.so
f2070000-f2073000 rwxp 00076000 08:15 8913179 /lib/hppa-linux-gnu/libm-2.33.so
f23fa000-f2423000 r-xp 00000000 08:15 8913216 /lib/hppa-linux-gnu/liblzma.so.5.2.5
f2423000-f2424000 rwxp 00029000 08:15 8913216 /lib/hppa-linux-gnu/liblzma.so.5.2.5
f27fa000-f28d4000 r-xp 00000000 08:15 16780194 /usr/lib/hppa-linux-gnu/libzstd.so.1.5.2
f28d4000-f28d6000 rwxp 000da000 08:15 16780194 /usr/lib/hppa-linux-gnu/libzstd.so.1.5.2
f2bfa000-f2c26000 r-xp 00000000 08:15 16783170 /usr/lib/hppa-linux-gnu/liblz4.so.1.9.3
f2c26000-f2c27000 rwxp 0002c000 08:15 16783170 /usr/lib/hppa-linux-gnu/liblz4.so.1.9.3
f2ffa000-f3001000 r-xp 00000000 08:15 16778902 /usr/lib/hppa-linux-gnu/libip4tc.so.2.0.0
f3001000-f3002000 rwxp 00007000 08:15 16778902 /usr/lib/hppa-linux-gnu/libip4tc.so.2.0.0
f33fa000-f350a000 r-xp 00000000 08:15 16778210 /usr/lib/hppa-linux-gnu/libgcrypt.so.20.4.1
f350a000-f3513000 rwxp 00110000 08:15 16778210 /usr/lib/hppa-linux-gnu/libgcrypt.so.20.4.1
f383d000-f3840000 r-xp 00000000 08:15 8913141 /lib/hppa-linux-gnu/libdl-2.33.so
f3840000-f3841000 r--p 00003000 08:15 8913141 /lib/hppa-linux-gnu/libdl-2.33.so
f3841000-f3842000 rwxp 00004000 08:15 8913141 /lib/hppa-linux-gnu/libdl-2.33.so
f3c3d000-f3c79000 r-xp 00000000 08:15 8913327 /lib/hppa-linux-gnu/libcrypt.so.1.1.0
f3c79000-f3c7a000 r--p 0003c000 08:15 8913327 /lib/hppa-linux-gnu/libcrypt.so.1.1.0
f3c7a000-f3c7b000 rwxp 0003d000 08:15 8913327 /lib/hppa-linux-gnu/libcrypt.so.1.1.0
f3c7b000-f3c83000 rwxp 00000000 00:00 0
f403d000-f4045000 r-xp 00000000 08:15 8913225 /lib/hppa-linux-gnu/libcap.so.2.44
f4045000-f4046000 rwxp 00008000 08:15 8913225 /lib/hppa-linux-gnu/libcap.so.2.44
f443d000-f449a000 r-xp 00000000 08:15 16777505 /usr/lib/hppa-linux-gnu/libblkid.so.1.1.0
f449a000-f449f000 rwxp 0005d000 08:15 16777505 /usr/lib/hppa-linux-gnu/libblkid.so.1.1.0
f483d000-f4846000 r-xp 00000000 08:15 16777796 /usr/lib/hppa-linux-gnu/libacl.so.1.1.2301
f4846000-f4847000 rwxp 00009000 08:15 16777796 /usr/lib/hppa-linux-gnu/libacl.so.1.1.2301
f4c3d000-f4dc1000 r-xp 00000000 08:15 8913099 /lib/hppa-linux-gnu/libc-2.33.so
f4dc1000-f4dc3000 r--p 00184000 08:15 8913099 /lib/hppa-linux-gnu/libc-2.33.so
f4dc3000-f4dc8000 rwxp 00186000 08:15 8913099 /lib/hppa-linux-gnu/libc-2.33.so
f4dc8000-f4dcf000 rwxp 00000000 00:00 0
f503d000-f505e000 r-xp 00000000 08:15 8913780 /lib/hppa-linux-gnu/libpthread-2.33.so
f505e000-f505f000 r--p 00021000 08:15 8913780 /lib/hppa-linux-gnu/libpthread-2.33.so
f505f000-f5060000 rwxp 00022000 08:15 8913780 /lib/hppa-linux-gnu/libpthread-2.33.so
f5060000-f5062000 rwxp 00000000 00:00 0
f543d000-f5452000 r-xp 00000000 08:15 16780912 /usr/lib/hppa-linux-gnu/libapparmor.so.1.8.2
f5452000-f5453000 rwxp 00015000 08:15 16780912 /usr/lib/hppa-linux-gnu/libapparmor.so.1.8.2
f583d000-f5858000 r-xp 00000000 08:15 16778597 /usr/lib/hppa-linux-gnu/libkmod.so.2.3.7
f5858000-f5859000 rwxp 0001b000 08:15 16778597 /usr/lib/hppa-linux-gnu/libkmod.so.2.3.7
f5c3d000-f5c5c000 r-xp 00000000 08:15 8913043 /lib/hppa-linux-gnu/libaudit.so.1.0.0
f5c5c000-f5c5d000 r--p 0001f000 08:15 8913043 /lib/hppa-linux-gnu/libaudit.so.1.0.0
f5c5d000-f5c5e000 rwxp 00020000 08:15 8913043 /lib/hppa-linux-gnu/libaudit.so.1.0.0
f5c5e000-f5c6e000 rwxp 00000000 00:00 0
f603d000-f604c000 r-xp 00000000 08:15 8913380 /lib/hppa-linux-gnu/libpam.so.0.85.1
f604c000-f604d000 rwxp 0000f000 08:15 8913380 /lib/hppa-linux-gnu/libpam.so.0.85.1
f643d000-f64a5000 r-xp 00000000 08:15 16777988 /usr/lib/hppa-linux-gnu/libmount.so.1.1.0
f64a5000-f64a9000 rwxp 00068000 08:15 16777988 /usr/lib/hppa-linux-gnu/libmount.so.1.1.0
f67fa000-f6828000 r-xp 00000000 08:15 8913119 /lib/hppa-linux-gnu/libselinux.so.1
f6828000-f6829000 r--p 0002e000 08:15 8913119 /lib/hppa-linux-gnu/libselinux.so.1
f6829000-f682b000 rwxp 0002f000 08:15 8913119 /lib/hppa-linux-gnu/libselinux.so.1
f682b000-f682c000 rwxp 00000000 00:00 0
f6bfa000-f6c02000 r-xp 00000000 08:15 8913828 /lib/hppa-linux-gnu/librt-2.33.so
f6c02000-f6c03000 r--p 00008000 08:15 8913828 /lib/hppa-linux-gnu/librt-2.33.so
f6c03000-f6c04000 rwxp 00009000 08:15 8913828 /lib/hppa-linux-gnu/librt-2.33.so
f73fa000-f76f3000 r-xp 00000000 08:15 8913458 /lib/systemd/libsystemd-shared-250.so
f76f3000-f76ff000 r--p 002f9000 08:15 8913458 /lib/systemd/libsystemd-shared-250.so
f76ff000-f7714000 rwxp 00305000 08:15 8913458 /lib/systemd/libsystemd-shared-250.so
f7714000-f7715000 rwxp 00000000 00:00 0
f77fa000-f7828000 r-xp 00000000 08:15 8912944                            /lib/hppa-linux-gnu/ld-2.33.so
f7828000-f7829000 r--p 0002e000 08:15 8912944                            /lib/hppa-linux-gnu/ld-2.33.so
f7829000-f782d000 rwxp 0002f000 08:15 8912944                            /lib/hppa-linux-gnu/ld-2.33.so
f7ae5000-f7afb000 rw-p 00000000 00:00 0
f7afb000-f7afc000 r-xp 00000000 00:00 0                                  [vdso]
f7afc000-f7b01000 rw-p 00000000 00:00 0
f922e000-f9250000 rwxp 00000000 00:00 0                                  [stack]

All the messages are associated with the mapping of the text section in the first region.

Dave

-- 
John David Anglin  dave.anglin@bell.net

