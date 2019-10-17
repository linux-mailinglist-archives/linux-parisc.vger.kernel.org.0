Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26943DA538
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Oct 2019 07:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392533AbfJQFy5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Oct 2019 01:54:57 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:57810 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392520AbfJQFy5 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Oct 2019 01:54:57 -0400
X-Greylist: delayed 390 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Oct 2019 01:54:57 EDT
To:     linux-parisc@vger.kernel.org
From:   Meelis Roos <mroos@linux.ee>
Subject: Data TLB miss fault terminating ld on parisc in
 5.4.0-rc3-00037-g3b1f00aceb7a
Message-ID: <a016e30d-4e31-3582-9069-7da02944a401@linux.ee>
Date:   Thu, 17 Oct 2019 08:47:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: et-EE
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I just tested 5.4.0-rc3-00037-g3b1f00aceb7a on 3 parisc machines and did a gentoo world emerge
after boot for test. On my rp3440, I got a build failure of one package and the
following in dmesg. While userspace apps can crash with invalid behaviour any time, this
one looks like kernel trouble to me - Data TLB miss fault. It was not easily reproducible, next
world emerge ran fine past that package.


[42140.123639] do_page_fault() command='ld' type=15 address=0x00000000 in libbfd-2.31.1.gentoo-sys-devel-binutils-st.so[f8644000+c5000]
                trap #15: Data TLB miss fault
[42140.123671] CPU: 0 PID: 23985 Comm: ld Not tainted 5.4.0-rc3-00037-g3b1f00aceb7a #226
[42140.123675] Hardware name: 9000/800/rp3440

[42140.123683]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[42140.123688] PSW: 00000000000001101111111000001111 Not tainted
[42140.123694] r00-03  000000ff0006fe0f 00000000f8713cf8 00000000f86a672b 00000000faa13a48
[42140.123700] r04-07  00000000f87144f8 0000000000000000 00000000426861d0 0000000000000000
[42140.123707] r08-11  0000000000002b92 00000000f8712630 000000004251ffd0 00000000f87124a4
[42140.123713] r12-15  00000000faa13a58 00000000faa13a0c 00000000faa13a04 0000000000208000
[42140.123719] r16-19  00000000420a13fc 00000000420a0000 0000000000000000 00000000f87144f8
[42140.123725] r20-23  00000000000000fd 00000000f8691804 00000000f86b13f4 0000000000000000
[42140.123731] r24-27  00000000faa13a48 00000000faa13a48 0000000000000000 000000004209f000
[42140.123738] r28-31  0000000000000000 00000000f81b0a6c 00000000faa13c40 00000000f8645114
[42140.123744] sr00-03  000000000cc3e000 000000000cc3e000 0000000000000000 000000000cc3e000
[42140.123750] sr04-07  000000000cc3e000 000000000cc3e000 000000000cc3e000 000000000cc3e000

[42140.123757]       VZOUICununcqcqcqcqcqcrmunTDVZOUI
[42140.123761] FPSR: 00000000000000000000000000000000
[42140.123764] FPER1: 00000000
[42140.123770] fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[42140.123777] fr04-07  3fcc58dcd6e825cf 4024000000000000 00067fa0f62430a5 3b10ba0000000000
[42140.123783] fr08-11  0005e868ef76ad40 00006a1331052bda 001a7e5b84dd9db6 0009eea07d0ae4fa
[42140.123789] fr12-15  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[42140.123795] fr16-19  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[42140.123801] fr20-23  0000000000000000 0000000000000000 0000000000000020 0000000200000000
[42140.123807] fr24-27  0000000000388500 0000000000000000 3fd555555551305b 3ee45a79979bc1a6
[42140.123813] fr28-31  40026bb4485fa06f 0000000000000000 0000000000000000 3fcffffffffffafc

[42140.123822] IASQ: 000000000cc3e000 000000000cc3e000 IAOQ: 00000000f8691807 00000000f869180b
[42140.123827]  IIR: 0f401015    ISR: 000000000cc3e000  IOR: 0000000000000000
[42140.123832]  CPU:        0   CR30: 0000004104b94000 CR31: ffffffffffffffff
[42140.123835]  ORIG_R28: 0000000000000000
[42140.123839]  IAOQ[0]: 00000000f8691807
[42140.123843]  IAOQ[1]: 00000000f869180b
[42140.123847]  RP(r2): 00000000f86a672b

The ambient temperature in the room was 32 degrees Celsius, so hot but not too hot hopefully.
Nothing in BMC logs so hopefully not hardware trouble but slightly unsure.

-- 
Meelis Roos <mroos@linux.ee>
