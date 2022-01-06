Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDC0485D4D
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Jan 2022 01:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343895AbiAFAkM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jan 2022 19:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343881AbiAFAkK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jan 2022 19:40:10 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF579C061245
        for <linux-parisc@vger.kernel.org>; Wed,  5 Jan 2022 16:40:09 -0800 (PST)
Received: (qmail 30038 invoked from network); 6 Jan 2022 00:39:55 -0000
Received: from p200300cf07141800183e67d29ced1f8c.dip0.t-ipconnect.de ([2003:cf:714:1800:183e:67d2:9ced:1f8c]:45316 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Thu, 06 Jan 2022 01:39:55 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: pagefaults and hang with 5.15.11
Date:   Thu, 06 Jan 2022 01:40:01 +0100
Message-ID: <8010710.T7Z3S40VBb@daneel.sf-tec.de>
In-Reply-To: <87pmpbds1r.fsf@x1.stackframe.org>
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de> <3407744.iIbC2pHGDl@daneel.sf-tec.de> <87pmpbds1r.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10012454.nUPlyArG6x"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart10012454.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 1. Januar 2022, 23:12:16 CET schrieb Sven Schnelle:

> Looks like you have a serial console connected? If yes, could you trigger a
> 'TOC s' from the BMC, and post the output from 'ser x 0 toc', where x is
> the processer number? This could help debugging this.

That command does not exist, I guess you meant this?

Service Menu: Enter command > ser 0 0 toc

ERROR: Unknown command

Service Menu: Enter command > pim 0 toc

FIRMWARE INFORMATION

   Firmware Version:           2.13
        BMC Version:          02.32


PROCESSOR PIM INFORMATION

-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000040c0d500  00000000402970f0  00000040b6e3cad0
04-07  0000000040b6a500  0000000041f50270  0000000040daf6c0  0000000040b22a00
08-11  0000000041f50278  0000000040c0d500  0000000040daf778  0000000000000004
12-15  0000000000000001  0000000041f50278  0000000040b22a00  00000000401902e0
16-19  0000000000000004  0000000040b92d00  0000000040b92d00  000000000000000e
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000001  0000000041f50278  0000000000000002  0000000040b6a500
28-31  0000000000000001  00000040b6e3cad0  00000040b6e3cb00  0000000041f8f2e0


                                                                 
Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000037c9a  0000000000000000  00000000000000c0  000000000000003d
12-15  0000000000000000  0000000000000000  0000000000197000  fff8000000000000
16-19  000037f770d420a2  0000000000000000  0000000040297124  000000000ff0109c
20-23  0000000000000000  0000000000000000  000000ff0804ff0f  8000000000000000
24-27  0000000000f87000  0000004076032000  fffffdfeffffdfff  00000000f7afde80
28-31  0000004076e6e374  fffffd7effffffff  00000040b6e3c000  fffffffffffdffff

Space Registers 0 - 7
00-03  0000000006f93400  0000000000000000  0000000000000000  0000000006f93400
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000040297128
CPU State                    = 0x9e000000

And this is the kernel bug:

[61412.598820] watchdog: BUG: soft lockup - CPU#0 stuck for 2998s! [cc1:7634]
[61412.598820] Modules linked in: 8021q ipmi_poweroff ipmi_si sata_via ipmi_devintf ipmi_msghandler cbc dm_zero dm_snapshot dm_mirror dm_region_hash dm_log dm_crypt dm_bufio pata_sil680 libata
[61412.598820] CPU: 0 PID: 7634 Comm: cc1 Tainted: G             L    5.15.11-gentoo-parisc64 #2
[61412.598820] Hardware name: 9000/785/C8000
[61412.598820]
[61412.598820]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[61412.598820] PSW: 00001000000001001111111100001111 Tainted: G             L
[61412.598820] r00-03  000000ff0804ff0f 0000000040c0d500 00000000402970f0 00000040b6e3cad0
[61412.598820] r04-07  0000000040b6a500 0000000041f50270 0000000040daf6c0 0000000040b22a00
[61412.598820] r08-11  0000000041f50278 0000000040c0d500 0000000040daf778 0000000000000004
[61412.598820] r12-15  0000000000000001 0000000041f50278 0000000040b22a00 00000000401902e0
[61412.598820] r16-19  0000000000000004 0000000040b92d00 0000000040b92d00 000000000000000e
[61412.598820] r20-23  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[61412.598820] r24-27  0000000000000001 0000000041f50278 0000000000000002 0000000040b6a500
[61412.598820] r28-31  0000000000000001 00000040b6e3cad0 00000040b6e3cb00 0000000041f8f2e0
[61412.598820] sr00-03  0000000006f93400 0000000000000000 0000000000000000 0000000006f93400
[61412.598820] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[61412.598820]
[61412.598820] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040297124 0000000040297128
[61412.598820]  IIR: 0ff0109c    ISR: 00000040b6e3c8f0  IOR: 000000000000000f
[61412.598820]  CPU:        0   CR30: 00000040b6e3c000 CR31: fffffffffffdffff
[61412.598820]  ORIG_R28: 00000000401db218
[61412.598820]  IAOQ[0]: smp_call_function_many_cond+0x20c/0x508
[61412.598820]  IAOQ[1]: smp_call_function_many_cond+0x210/0x508
[61412.598820]  RP(r2): smp_call_function_many_cond+0x1d8/0x508
[61412.598820] Backtrace:
[61412.598820]  [<00000000402974ec>] on_each_cpu_cond_mask+0x3c/0x48
[61412.598820]  [<000000004019c3b8>] flush_tlb_all+0x188/0x270
[61412.598820]  [<000000004019e224>] __flush_tlb_range+0x16c/0x178
[61412.598820]  [<000000004019ecb4>] flush_cache_range+0x384/0x410
[61412.598820]  [<00000000403144c0>] unmap_page_range+0xb8/0xc58
[61412.598820]  [<00000000403154dc>] unmap_vmas+0x9c/0xe0
[61412.598820]  [<000000004031fa78>] unmap_region+0x108/0x1b8
[61412.598820]  [<00000000403238d4>] __do_munmap+0x284/0x728
[61412.598820]  [<0000000040324754>] __vm_munmap+0xb4/0x148
[61412.598820]  [<0000000040325784>] sys_munmap+0x24/0x30
[61412.598820]  [<0000000040199f68>] syscall_exit+0x0/0x14

--nextPart10012454.nUPlyArG6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYdY6YQAKCRBcpIk+abn8
TnSKAJ4xu/yNue0VTxha9tKl7BYLWNJvKgCfTa9mxt/KEP6YWDgpaKOveQPQGM4=
=9/ti
-----END PGP SIGNATURE-----

--nextPart10012454.nUPlyArG6x--



