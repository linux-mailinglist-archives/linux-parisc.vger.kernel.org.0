Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC19DAB0A
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Oct 2019 13:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439662AbfJQLRy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Oct 2019 07:17:54 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:46838 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2439661AbfJQLRy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Oct 2019 07:17:54 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20191017111753.WFIQ4444.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 17 Oct 2019 07:17:53 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm01.bell.net
          with ESMTP
          id <20191017111752.XTAG87666.mtlspm01.bell.net@[192.168.2.49]>;
          Thu, 17 Oct 2019 07:17:52 -0400
Subject: Re: Data TLB miss fault terminating ld on parisc in
 5.4.0-rc3-00037-g3b1f00aceb7a
To:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
References: <a016e30d-4e31-3582-9069-7da02944a401@linux.ee>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <94cbccf7-048e-b379-3c5a-e5e484ec5fea@bell.net>
Date:   Thu, 17 Oct 2019 07:17:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a016e30d-4e31-3582-9069-7da02944a401@linux.ee>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=CCpqsmhAAAAA:8 a=FBHGMhGWAAAA:8 a=aAlx2eK2OOD-6x7-UjwA:9 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfOtX2NIIvEsO+17igCpmCjgi2zzpBJ/eKuUP27dlTjJnL6TPTVaLqTxOzdaffJ+gdlFx1ixlmM//PJc+JZNiHJj1tB5rwKn91VeCHWlDQlcENW3zyZ1n ClGZoEEMGDErOAsdvfxvoLbUbnxIf6MKmuou7SxlNxLx3XSKlfY5UkHeqlD/Grzlh9ROeA1Z0y+Pag==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I think this fault may be related to this bug:
https://sourceware.org/bugzilla/show_bug.cgi?id=23296

It typically shows up during lazy binding of multi-threaded applications on SMP machines.

Working on it...

Dave

On 2019-10-17 1:47 a.m., Meelis Roos wrote:
> I just tested 5.4.0-rc3-00037-g3b1f00aceb7a on 3 parisc machines and did a gentoo world emerge
> after boot for test. On my rp3440, I got a build failure of one package and the
> following in dmesg. While userspace apps can crash with invalid behaviour any time, this
> one looks like kernel trouble to me - Data TLB miss fault. It was not easily reproducible, next
> world emerge ran fine past that package.
>
>
> [42140.123639] do_page_fault() command='ld' type=15 address=0x00000000 in libbfd-2.31.1.gentoo-sys-devel-binutils-st.so[f8644000+c5000]
>                trap #15: Data TLB miss fault
> [42140.123671] CPU: 0 PID: 23985 Comm: ld Not tainted 5.4.0-rc3-00037-g3b1f00aceb7a #226
> [42140.123675] Hardware name: 9000/800/rp3440
>
> [42140.123683]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [42140.123688] PSW: 00000000000001101111111000001111 Not tainted
> [42140.123694] r00-03  000000ff0006fe0f 00000000f8713cf8 00000000f86a672b 00000000faa13a48
> [42140.123700] r04-07  00000000f87144f8 0000000000000000 00000000426861d0 0000000000000000
> [42140.123707] r08-11  0000000000002b92 00000000f8712630 000000004251ffd0 00000000f87124a4
> [42140.123713] r12-15  00000000faa13a58 00000000faa13a0c 00000000faa13a04 0000000000208000
> [42140.123719] r16-19  00000000420a13fc 00000000420a0000 0000000000000000 00000000f87144f8
> [42140.123725] r20-23  00000000000000fd 00000000f8691804 00000000f86b13f4 0000000000000000
> [42140.123731] r24-27  00000000faa13a48 00000000faa13a48 0000000000000000 000000004209f000
> [42140.123738] r28-31  0000000000000000 00000000f81b0a6c 00000000faa13c40 00000000f8645114
> [42140.123744] sr00-03  000000000cc3e000 000000000cc3e000 0000000000000000 000000000cc3e000
> [42140.123750] sr04-07  000000000cc3e000 000000000cc3e000 000000000cc3e000 000000000cc3e000
>
> [42140.123757]       VZOUICununcqcqcqcqcqcrmunTDVZOUI
> [42140.123761] FPSR: 00000000000000000000000000000000
> [42140.123764] FPER1: 00000000
> [42140.123770] fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [42140.123777] fr04-07  3fcc58dcd6e825cf 4024000000000000 00067fa0f62430a5 3b10ba0000000000
> [42140.123783] fr08-11  0005e868ef76ad40 00006a1331052bda 001a7e5b84dd9db6 0009eea07d0ae4fa
> [42140.123789] fr12-15  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [42140.123795] fr16-19  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [42140.123801] fr20-23  0000000000000000 0000000000000000 0000000000000020 0000000200000000
> [42140.123807] fr24-27  0000000000388500 0000000000000000 3fd555555551305b 3ee45a79979bc1a6
> [42140.123813] fr28-31  40026bb4485fa06f 0000000000000000 0000000000000000 3fcffffffffffafc
>
> [42140.123822] IASQ: 000000000cc3e000 000000000cc3e000 IAOQ: 00000000f8691807 00000000f869180b
> [42140.123827]  IIR: 0f401015    ISR: 000000000cc3e000  IOR: 0000000000000000
> [42140.123832]  CPU:        0   CR30: 0000004104b94000 CR31: ffffffffffffffff
> [42140.123835]  ORIG_R28: 0000000000000000
> [42140.123839]  IAOQ[0]: 00000000f8691807
> [42140.123843]  IAOQ[1]: 00000000f869180b
> [42140.123847]  RP(r2): 00000000f86a672b
>
> The ambient temperature in the room was 32 degrees Celsius, so hot but not too hot hopefully.
> Nothing in BMC logs so hopefully not hardware trouble but slightly unsure.
>


-- 
John David Anglin  dave.anglin@bell.net

