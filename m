Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A046C6FE50A
	for <lists+linux-parisc@lfdr.de>; Wed, 10 May 2023 22:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbjEJU3u (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 10 May 2023 16:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbjEJU3t (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 May 2023 16:29:49 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518F94C16
        for <linux-parisc@vger.kernel.org>; Wed, 10 May 2023 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1683750583; i=deller@gmx.de;
        bh=z5CJ5oTR66tzK1Wjf4cJaAZ8atqR224Po11WasvnlVA=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=Xf6V+BksAdSBrp4fUrDq66pJaXVpG8s+xEbQdqcASBO55IXrz0bMRwRIkVBKbdqsp
         ErBDM2LkDMJqVWkFh3k4R/LPi6E0GjNkNcAO1WgKrSiMCDhamah2PYYlIGWYjz5ntm
         Q8TIaEPww8B2Urkk/4u1YXPSSC8Pit/bUXdkq9okYq+8Xp5LAxMH6XV5UXnxfxKYVY
         2exCTq0U340ZhAB9TuwuU8dzmKmq5K0/7U4Ec1NTbqS+OC7BjZW6QVVYiKDXvoZLSA
         AiUvmrh3aFvHRrKV1dZ2NOrp9RiPsDLT/nW2hIA/tTlJ/O53qhOs8kmzeD/WpcFDN0
         sDwpiILl2G5tA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.155.121]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYv3-1qBCdI2VDv-00tyQy; Wed, 10
 May 2023 22:29:43 +0200
Message-ID: <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
Date:   Wed, 10 May 2023 22:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
Content-Language: en-US
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-parisc@vger.kernel.org
References: <1683740497@msgid.manchmal.in-ulm.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <1683740497@msgid.manchmal.in-ulm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u8lHbphbRypBU+HSW2geH27jrUOwrdbgQZuoTg2D77SKCkCl5mo
 LvZCd0LtknLU7rUSWjAfX6EUYyjivCrTgsmuqo16PBiAVeiIjDxQR+eoyNIPWbazpxa3GIv
 IRCpviKcNIK3gwfoNOEmG9FCFlZU7/Ql6Pm1YnIdZg2m1MqQvq9MGx1uG8lVpTCNQQaXCuY
 333jZ2Y9s8A8vQO5R3snw==
UI-OutboundReport: notjunk:1;M01:P0:j3eUWVg3Iik=;+zg7wWZwLqev2k0ZAs/dJJctq2p
 BVo9j2RWL77ZXU5nzOab0RqsCxSOjzP4F6bb/4XyezmyhodeF8RX8nzZwHXtk56q8tA0tSiyj
 o/E/OFQSeSrHzaINTdvURuyxwrRL3g0O98lyVQldQDPSbxbXbQ9WaZbCsb5vf48MM521d93PU
 kjuBGkmvaZyuXpt7V+NZcmuF3M8SxhskFRYiDZNtzaK4rhxej3JgNql7ytcoAHqaAEFkGL1yV
 zvqZPQ57Y1OVnZr9NGHeKHXq7njV/0/Js/1qL9pokqT3p7droxezdJ62PXodtMKPMk0tVVJAP
 3At05+4KYI688yarjraG+4KKLR6c5ivd/V3ewT0uu/vRqazaVXToSJL6FOlRWptsz+DHwb5J/
 4CZcPhg5j72fZi1ixNs6UaiaNFqlax3AH20f0rKN0onzyBhB1d5WkD+CH/i+PRPBxHwoM55NE
 7LBmmJ+YRXzOGhn8kXK2TBkEA9eELpaN68K4C2Gms9uqXMihTMhNLLFCiQK03dmGEQz2d4vYj
 jjFU9fqI6CUolpCIOo1Q31XJPo5odoPIGMIzm/YJR9ZpeMrFU8Ab8+pbnQ0UzmWTT3p3nfPbv
 rGi6nVtgaJqDHX8lWnu3XiXKGQ/gXg+ZFYl5Zd5bhidnNqTQjhBwK3JOORECd+sQGh87V1Y3k
 h2Emp3U4Bwvb3QxS2jwCEHFtfLFq37WsS+MnfSY5sSnTewhGgVxd0lDaeAD057guSGjSmxGC1
 Jl9D8mYe3UABcuQneo3cKF66Bnu5OdOc/Qau+zZ5R0LM+40TfhxOmion1oxxpBDskuWBRazk7
 f81o+urRGCACF2pJZ1o5FpnG+R2Aw6fhe7Xmui4G71+RgDBei7K8Ke13zsFK6gpCL77EbizCh
 Nzwtjc9zuX0m5YCee9dBW4ZVFC2qdu3xLepywHnCxRPmKGZgkb+HQ6VpImtiHt2Fa2DkQfmps
 dWrrGw==
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Christoph,

On 5/10/23 19:56, Christoph Biedl wrote:
> after upgrading from 6.2 to 6.3, my old HPPA box becomes inresponsive
> after 10-30 minutes, possibly with some memory pressure involved
> (building some Debian packages), kernel messages below. This is 100%
> reproducible, switching back to some 6.2 kernel is a workaround.
>
> Userland is Debian unstable, the affected process (as far as I could
> see) is either ntpd or ntpq. A reboot is needed to resolve the
> situation.
>
> As this still happens with 6.3.2-rc1 which includes "parisc: Ensure page
> alignment in flush functions": Has this been spotted earlier, is there
> some tentative fix somewhere?
>
> So far, I haven't tried bisecting between 6.2 and 6.3 yet. While I'm
> able to do this, it would take days since I don't have a quick
> reproducer, and I don't want to do this work in vain. If you can
> provide hints how to speed up this, let me know.

I haven't used kernel 6.3 much yet, but the kernel BUG below seems
to be triggered by CONFIG_MIGRATION.
You could try to disable that config option first to verify if
it fixes your crash.
This might help to narrow down the problem....

Helge

> [  828.356408] kernel BUG at include/linux/swapops.h:472!
> [  828.361679] CPU: 0 PID: 7119 Comm: ntpq Not tainted 6.3.1 #1
> [  828.367392] Hardware name: 9000/785/C3600
> [  828.371440]
> [  828.372962]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [  828.377695] PSW: 00000000000001001111011100001111 Not tainted
> [  828.383483] r00-03  0004f70f 11294f90 105c6408 31578540
> [  828.388744] r04-07  00000c73 114157c0 00000000 f66326c7
> [  828.394004] r08-11  4f855a58 31455c60 31455c60 00004000
> [  828.399257] r12-15  00000873 00000006 4f855530 4f855530
> [  828.404528] r16-19  00000002 00000100 31455c60 00000000
> [  828.409789] r20-23  70000000 0000001b 0098b000 4f855a58
> [  828.415060] r24-27  2970de30 315aa8c8 00000000 10e72f90
> [  828.420325] r28-31  00000000 129ecf94 315785c0 129ecf00
> [  828.425578] sr00-03  00000029 00000000 00000000 00000029
> [  828.430925] sr04-07  00000000 00000000 00000000 00000000
> [  828.436265]
> [  828.437780] IASQ: 00000000 00000000 IAOQ: 10559284 10559288
> [  828.443389]  IIR: 03ffe01f    ISR: 10240085  IOR: 5e178584
> [  828.448900]  CPU:        0   CR30: 4f855530 CR31: 11111111
> [  828.454422]  ORIG_R28: 00000006
> [  828.457594]  IAOQ[0]: migration_entry_wait_on_locked+0x254/0x274
> [  828.463663]  IAOQ[1]: migration_entry_wait_on_locked+0x258/0x274
> [  828.469701]  RP(r2): __migration_entry_wait+0x64/0x6c
> [  828.474807] Backtrace:
> [  828.477195]  [<105c6408>] __migration_entry_wait+0x64/0x6c
> [  828.482732]  [<105c6444>] migration_entry_wait+0x34/0x44
> [  828.488085]  [<1058c608>] do_swap_page+0x710/0x894
> [  828.492926]  [<1058d07c>] handle_mm_fault+0x4e4/0xcb4
> [  828.498009]  [<10406490>] do_page_fault+0xd0/0x42c
> [  828.502852]  [<10408d60>] handle_interruption+0x4cc/0x6c8
> [  828.508303]  [<10403070>] intr_check_sig+0x0/0x38
> [  828.513051]
> [  828.514568] CPU: 0 PID: 7119 Comm: ntpq Not tainted 6.3.1 #1
> [  828.520245] Hardware name: 9000/785/C3600
> [  828.524269] Backtrace:
> [  828.526651]  [<104084e0>] show_stack+0x34/0x48
> [  828.531124]  [<10cdb894>] dump_stack_lvl+0x38/0x54
> [  828.535953]  [<10cdb8cc>] dump_stack+0x1c/0x2c
> [  828.540424]  [<104085fc>] die_if_kernel+0xec/0x1b0
> [  828.545241]  [<10408eac>] handle_interruption+0x618/0x6c8
> [  828.550668]  [<10403070>] intr_check_sig+0x0/0x38
> [  828.555399]
> [  828.556936] ---[ end trace 0000000000000000 ]---
> [  828.562457] ------------[ cut here ]------------
> [  828.567151] kernel BUG at include/linux/swapops.h:472!
> [  828.572394] CPU: 0 PID: 3059 Comm: in:imklog Tainted: G      D       =
     6.3.1 #1
> [  828.579997] Hardware name: 9000/785/C3600
> [  828.584045]
> [  828.585567]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [  828.590306] PSW: 00000000000001001111011100001111 Tainted: G      D
> [  828.597546] r00-03  0004f70f 11294f90 105c6408 13030540
> [  828.602837] r04-07  00000c73 114157c0 00000000 f5a32bef
> [  828.608094] r08-11  13035a58 137df5e8 137df5e8 00004000
> [  828.613363] r12-15  00000873 00000006 13035530 13035530
> [  828.618623] r16-19  00000002 00000100 137df5e8 00000000
> [  828.623885] r20-23  70000000 0000001b 0000000e 13035a58
> [  828.629144] r24-27  1472c1f0 4fbdf8c8 00000000 10e72f90
> [  828.634412] r28-31  00000000 1373b094 130305c0 1373b000
> [  828.639667] sr00-03  00000029 00000000 00000000 0000000e
> [  828.645014] sr04-07  00000000 00000000 00000000 00000000
> [  828.650361]
> [  828.651874] IASQ: 00000000 00000000 IAOQ: 10559284 10559288
> [  828.657476]  IIR: 03ffe01f    ISR: 00000000  IOR: 00000000
> [  828.662997]  CPU:        0   CR30: 13035530 CR31: 11111111
> [  828.668510]  ORIG_R28: 00000000
> [  828.671688]  IAOQ[0]: migration_entry_wait_on_locked+0x254/0x274
> [  828.677739]  IAOQ[1]: migration_entry_wait_on_locked+0x258/0x274
> [  828.683788]  RP(r2): __migration_entry_wait+0x64/0x6c
> [  828.688888] Backtrace:
> [  828.691289]  [<105c6408>] __migration_entry_wait+0x64/0x6c
> [  828.696809]  [<105c6444>] migration_entry_wait+0x34/0x44
> [  828.702162]  [<1058c608>] do_swap_page+0x710/0x894
> [  828.706993]  [<1058d07c>] handle_mm_fault+0x4e4/0xcb4
> [  828.712087]  [<10406490>] do_page_fault+0xd0/0x42c
> [  828.716924]  [<10408d60>] handle_interruption+0x4cc/0x6c8
> [  828.722375]  [<10403070>] intr_check_sig+0x0/0x38
> [  828.727116]
> [  828.728639] CPU: 0 PID: 3059 Comm: in:imklog Tainted: G      D       =
     6.3.1 #1
> [  828.736223] Hardware name: 9000/785/C3600
> [  828.740252] Backtrace:
> [  828.742627]  [<104084e0>] show_stack+0x34/0x48
> [  828.747099]  [<10cdb894>] dump_stack_lvl+0x38/0x54
> [  828.751928]  [<10cdb8cc>] dump_stack+0x1c/0x2c
> [  828.756399]  [<104085fc>] die_if_kernel+0xec/0x1b0
> [  828.761218]  [<10408eac>] handle_interruption+0x618/0x6c8
> [  828.766643]  [<10403070>] intr_check_sig+0x0/0x38
> [  828.771376]
> [  828.772915] ---[ end trace 0000000000000000 ]---
> [  828.810379] ------------[ cut here ]------------
> [  828.815050] kernel BUG at include/linux/swapops.h:472!
> [  828.820241] CPU: 0 PID: 261 Comm: systemd-journal Tainted: G      D  =
          6.3.1 #1
> [  828.828273] Hardware name: 9000/785/C3600
> [  828.832339]
> [  828.833861]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [  828.838585] PSW: 00000000000001001111111100001111 Tainted: G      D
> [  828.845841] r00-03  0004ff0f 11294f90 105c6408 4f830540
> [  828.851108] r04-07  00000c73 11415fe8 00000002 f69b63af
> [  828.856362] r08-11  4f857698 12951168 12951168 00004000
> [  828.861630] r12-15  00000873 00000006 4f857170 4f857170
> [  828.866884] r16-19  00000002 00000100 12951168 00000000
> [  828.872151] r20-23  70000000 0000001b 0000000e 4f857698
> [  828.877406] r24-27  129621f0 130726d8 00000000 10e72f90
> [  828.882674] r28-31  00000000 4f8c7898 4f8305c0 4f8c7800
> [  828.887925] sr00-03  00000029 00000000 00000000 00000004
> [  828.893274] sr04-07  00000000 00000000 00000000 00000000
> [  828.898612]
> [  828.900137] IASQ: 00000000 00000000 IAOQ: 10559284 10559288
> [  828.905736]  IIR: 03ffe01f    ISR: 102400fe  IOR: 0c030584
> [  828.911258]  CPU:        0   CR30: 4f857170 CR31: 11111111
> [  828.916768]  ORIG_R28: 00000006
> [  828.919940]  IAOQ[0]: migration_entry_wait_on_locked+0x254/0x274
> [  828.925999]  IAOQ[1]: migration_entry_wait_on_locked+0x258/0x274
> [  828.932047]  RP(r2): __migration_entry_wait+0x64/0x6c
> [  828.937136] Backtrace:
> [  828.939530]  [<105c6408>] __migration_entry_wait+0x64/0x6c
> [  828.945059]  [<105c6444>] migration_entry_wait+0x34/0x44
> [  828.950414]  [<1058c608>] do_swap_page+0x710/0x894
> [  828.955242]  [<1058d07c>] handle_mm_fault+0x4e4/0xcb4
> [  828.960336]  [<10406490>] do_page_fault+0xd0/0x42c
> [  828.965167]  [<10408d60>] handle_interruption+0x4cc/0x6c8
> [  828.970618]  [<10403070>] intr_check_sig+0x0/0x38
> [  828.975358]
> [  828.976880] CPU: 0 PID: 261 Comm: systemd-journal Tainted: G      D  =
          6.3.1 #1
> [  828.984897] Hardware name: 9000/785/C3600
> [  828.988929] Backtrace:
> [  828.991311]  [<104084e0>] show_stack+0x34/0x48
> [  828.995783]  [<10cdb894>] dump_stack_lvl+0x38/0x54
> [  829.000613]  [<10cdb8cc>] dump_stack+0x1c/0x2c
> [  829.005084]  [<104085fc>] die_if_kernel+0xec/0x1b0
> [  829.009901]  [<10408eac>] handle_interruption+0x618/0x6c8
> [  829.015328]  [<10403070>] intr_check_sig+0x0/0x38
> [  829.020059]
> [  829.021590] ---[ end trace 0000000000000000 ]---
> [  829.304173] ------------[ cut here ]------------
> [  829.308873] kernel BUG at include/linux/swapops.h:472!
> [  829.314076] die_if_kernel() recursion detected.

