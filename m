Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7AF4B3D58
	for <lists+linux-parisc@lfdr.de>; Sun, 13 Feb 2022 21:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbiBMURK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 13 Feb 2022 15:17:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbiBMURJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Feb 2022 15:17:09 -0500
X-Greylist: delayed 401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 13 Feb 2022 12:17:02 PST
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A70532DE
        for <linux-parisc@vger.kernel.org>; Sun, 13 Feb 2022 12:17:02 -0800 (PST)
Received: (qmail 32439 invoked from network); 13 Feb 2022 20:08:33 -0000
Received: from p200300cf070bc0006843b1fffef17acc.dip0.t-ipconnect.de ([2003:cf:70b:c000:6843:b1ff:fef1:7acc]:35786 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sun, 13 Feb 2022 21:08:33 +0100
From:   Rolf Eike Beer <eike@sf-mail.de>
To:     linux-parisc@vger.kernel.org
Subject: BUG: soft lockup in on_each_cpu_cond_mask() from do_exit()
Date:   Sun, 13 Feb 2022 21:10:13 +0100
Message-ID: <4689005.GXAFRqVoOG@eto.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1808483.tdWV9SEqCh"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,WEIRD_PORT autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart1808483.tdWV9SEqCh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Just happened on my C8000 using kernel 5.15.4:

[1775820.602907] watchdog: BUG: soft lockup - CPU#0 stuck for 674s! [python3.9:28328]
[1775820.602907] Modules linked in: 8021q ipmi_poweroff pata_sil680 sata_via ipmi_si libata ipmi_devintf ipmi_msghandler
[1775820.602907] CPU: 0 PID: 28328 Comm: python3.9 Tainted: G             L    5.15.4-gentoo-parisc64 #4
[1775820.602907] Hardware name: 9000/785/C8000
[1775820.602907] 
[1775820.602907]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[1775820.602907] PSW: 00001000000001001111111100001111 Tainted: G             L   
[1775820.602907] r00-03  000000ff0804ff0f 0000000040c0c3c0 0000000040296ec0 0000000184090a90
[1775820.602907] r04-07  0000000040b693c0 0000000041f52270 0000000040db26c0 0000000040b219c0
[1775820.602907] r08-11  0000000041f52278 0000000040c0c3c0 0000000040db2778 0000000000000004
[1775820.602907] r12-15  0000000000000001 0000000041f52278 0000000040b219c0 00000000401902e0
[1775820.602907] r16-19  0000000000000004 0000000040b91bc0 0000000040b91bc0 000000000000000e
[1775820.602907] r20-23  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[1775820.602907] r24-27  0000000000000001 0000000041f52278 0000000000000002 0000000040b693c0
[1775820.602907] r28-31  0000000000000001 0000000184090a90 0000000184090ac0 0000000041f912e0
[1775820.602907] sr00-03  000000000440c400 0000000000000000 0000000000000000 000000000440c400
[1775820.602907] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[1775820.602907] 
[1775820.602907] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040296ef4 0000000040296ef8
[1775820.602907]  IIR: 0ff0109c    ISR: 0000000040b22120  IOR: 000000000001920d
[1775820.602907]  CPU:        0   CR30: 0000000184090000 CR31: fffffffffffdffff
[1775820.602907]  ORIG_R28: 000000000000001c
[1775820.602907]  IAOQ[0]: smp_call_function_many_cond+0x20c/0x508
[1775820.602907]  IAOQ[1]: smp_call_function_many_cond+0x210/0x508
[1775820.602907]  RP(r2): smp_call_function_many_cond+0x1d8/0x508
[1775820.602907] Backtrace:
[1775820.602907]  [<00000000402972bc>] on_each_cpu_cond_mask+0x3c/0x48
[1775820.602907]  [<000000004019c3b8>] flush_tlb_all+0x188/0x270
[1775820.602907]  [<000000004019e928>] flush_cache_mm+0x460/0x468
[1775820.602907]  [<0000000040325974>] exit_mmap+0xa4/0x420
[1775820.602907]  [<00000000401ca634>] mmput+0xdc/0x2a0
[1775820.602907]  [<00000000401d6c58>] do_exit+0x578/0x1338
[1775820.602907]  [<00000000401d9728>] do_group_exit+0x68/0x130
[1775820.602907]  [<00000000401ede30>] get_signal+0x318/0xe38
[1775820.602907]  [<00000000401adc4c>] do_signal+0x74/0x860
[1775820.602907]  [<00000000401ae498>] do_notify_resume+0x60/0x108
[1775820.602907]  [<00000000401990b8>] intr_check_sig+0x38/0x3c
[1775820.602907] 
[1775835.870907] watchdog: BUG: soft lockup - CPU#1 stuck for 690s! [ebuild.sh:28327]
[1775835.870907] Modules linked in: 8021q ipmi_poweroff pata_sil680 sata_via ipmi_si libata ipmi_devintf ipmi_msghandler
[1775835.870907] CPU: 1 PID: 28327 Comm: ebuild.sh Tainted: G             L    5.15.4-gentoo-parisc64 #4
[1775835.870907] Hardware name: 9000/785/C8000
[1775835.870907] 
[1775835.870907]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[1775835.870907] PSW: 00001000000001001111111100001111 Tainted: G             L   
[1775835.870907] r00-03  000000ff0804ff0f 0000000040c0c3c0 0000000040296ec0 00000041063588a0
[1775835.870907] r04-07  0000000040b693c0 0000000041f70270 0000000040db26c0 0000000040b219c0
[1775835.870907] r08-11  0000000041f70278 0000000040c0c3c0 0000000040db2778 0000000000000004
[1775835.870907] r12-15  0000000000000001 0000000041f70278 0000000040b219c0 0000000040191060
[1775835.870907] r16-19  0000000000000004 0000000040b91bc0 0000000040b91bc0 000000000000000d
[1775835.870907] r20-23  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[1775835.870907] r24-27  0000000000000001 0000000041f70278 0000000000000002 0000000040b693c0
[1775835.870907] r28-31  0000000000000001 00000041063588a0 00000041063588d0 0000000041f92060
[1775835.870907] sr00-03  000000000440bc00 0000000000000000 0000000000000000 000000000440bc00
[1775835.870907] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[1775835.870907] 
[1775835.870907] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040296ef4 0000000040296ef8
[1775835.870907]  IIR: 0ff0109c    ISR: 000000000800000f  IOR: 0000000040b693c0
[1775835.870907]  CPU:        1   CR30: 0000004106358000 CR31: fffa7fffff7f9fd7
[1775835.870907]  ORIG_R28: 0000000001de3000
[1775835.870907]  IAOQ[0]: smp_call_function_many_cond+0x20c/0x508
[1775835.870907]  IAOQ[1]: smp_call_function_many_cond+0x210/0x508
[1775835.870907]  RP(r2): smp_call_function_many_cond+0x1d8/0x508
[1775835.870907] Backtrace:
[1775835.870907]  [<00000000402972bc>] on_each_cpu_cond_mask+0x3c/0x48
[1775835.870907]  [<000000004019c3b8>] flush_tlb_all+0x188/0x270
[1775835.870907]  [<000000004019e928>] flush_cache_mm+0x460/0x468
[1775835.870907]  [<0000000040325974>] exit_mmap+0xa4/0x420
[1775835.870907]  [<00000000401ca634>] mmput+0xdc/0x2a0
[1775835.870907]  [<00000000401d6c58>] do_exit+0x578/0x1338
[1775835.870907]  [<00000000401d9728>] do_group_exit+0x68/0x130
[1775835.870907]  [<00000000401d9814>] sys_exit_group+0x24/0x28
[1775835.870907]  [<0000000040199f68>] syscall_exit+0x0/0x14

--nextPart1808483.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYgllpQAKCRBcpIk+abn8
TqMwAJ9LJ4/R7CoSd8x1fDCl0/tPsMOWjACgp5+AKCGO8vcpNcATcrvyP8g1HHc=
=SvfY
-----END PGP SIGNATURE-----

--nextPart1808483.tdWV9SEqCh--



