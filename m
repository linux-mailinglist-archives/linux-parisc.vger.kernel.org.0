Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A56E11FCFDF
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Jun 2020 16:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgFQOlp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 17 Jun 2020 10:41:45 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:39962 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726708AbgFQOlp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Jun 2020 10:41:45 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20200617144144.BSQH5779.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 17 Jun 2020 10:41:44 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20200617144144.EUDU16482.mtlspm02.bell.net@[192.168.2.49]>;
          Wed, 17 Jun 2020 10:41:44 -0400
Subject: Re: [PATCH] parisc: Prevent optimization of loads and stores in
 atomic operations
From:   John David Anglin <dave.anglin@bell.net>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net>
 <2690783.z6zax5hIIu@daneel.sf-tec.de>
 <02835c09-8b8f-6e48-11b5-162c5fa94b83@bell.net>
Message-ID: <2843d7e4-9088-8f83-9401-8fa04d9f935a@bell.net>
Date:   Wed, 17 Jun 2020 10:41:44 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <02835c09-8b8f-6e48-11b5-162c5fa94b83@bell.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=N659UExz7-8A:10 a=nTHF0DUjJn0A:10 a=FBHGMhGWAAAA:8 a=7pPSXpUZjiQxKSqFZ5YA:9 a=pILNOxqGKmIA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfBLZPS2SNyD04sidaZ8xwxQBNmwd4XR97bwdRVh3EBNjh4krHZwtR2b/F7UJpGFu0Uux4MrEqKNbGrYIH8/oV22p9p7d+i2rusIAFAmE/69MD5lJybCt EOTFt58kfvJ+ZPuOtXIPXAbLOlU9GYixstLfo/blc3erQZAJDYD6oCn5wOd2y2/QbE++zn3pteyu4w==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-06-16 10:57 a.m., John David Anglin wrote:I will post an updated patch against trunk in a day or two.  The debian gcc-snapshot package is
> building on mx3210 and phantom.  This package almost always failed to build on phantom.

Sadly, the patch doesn't fix problem:

watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [pr58417.exe:23900]
Modules linked in: dm_mod dax binfmt_misc ext4 crc16 jbd2 ext2 mbcache sg ipmi_watchdog ipmi_si ipmi_poweroff ipmi_devintf ipmi_msghandler nfsd
ip_tables x_tables ipv6 autofs4 xfs libcrc32c crc32c_generic raid10 raid1 raid0 multipath linear md_mod ses enclosure sd_mod scsi_transport_sas
t10_pi uas usb_storage sr_mod cdrom ata_generic ohci_pci ehci_pci ohci_hcd ehci_hcd pata_cmd64x sym53c8xx scsi_transport_spi usbcore libata
usb_common tg3 scsi_mod
CPU: 1 PID: 23900 Comm: pr58417.exe Tainted: G             L    5.6.18+ #2
Hardware name: 9000/800/rp3440

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001101111111100001111 Tainted: G             L
r00-03  000000ff0806ff0f 0000000040891dc0 000000004037d234 0000004123e50960
r04-07  000000004086fdc0 0000000040ab31ac 00000000001354d6 0000000000000ca8
r08-11  0000000040b24710 0000004123e50348 0000000040a1d280 0000004123e50a80
r12-15  0000004123e50994 0000000141e69ec8 00000000b8883cd5 0000004119979948
r16-19  0000000040b253b8 0000004123e50968 0000000000ce2e75 0000004123e50990
r20-23  000000000800000f 0000000e868fecc9 0de501fab0949db0 0000004119979983
r24-27  0000004123e50994 0000004123e50348 0000000141e69ec8 000000004086fdc0
r28-31  0000000000000001 0000004123e50a80 0000004123e50ab0 0000004123e50000
sr00-03  0000000008b81800 0000000000000000 0000000000000000 0000000008b81800
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004037d200 000000004037d204
 IIR: 51bc0060    ISR: 0000000000000000  IOR: 0000002c0000000b
 CPU:        1   CR30: 0000004123e50000 CR31: ffffffffffffffff
 ORIG_R28: 0000000000000000
 IAOQ[0]: d_alloc_parallel+0x100/0x688
 IAOQ[1]: d_alloc_parallel+0x104/0x688
 RP(r2): d_alloc_parallel+0x134/0x688
Backtrace:
 [<00000000403697bc>] __lookup_slow+0xa4/0x200
 [<000000004036a038>] walk_component+0x288/0x458
 [<000000004036a3e0>] link_path_walk+0x1d8/0x630
 [<000000004036ace4>] path_openat+0x10c/0x1370
 [<000000004036ed78>] do_filp_open+0x88/0x120
 [<000000004034f758>] do_sys_openat2+0x1e8/0x310
 [<00000000403513dc>] do_sys_open+0x64/0x88
 [<00000000403515e8>] compat_sys_openat+0x20/0x38
 [<0000000040180054>] syscall_exit+0x0/0x14

watchdog: BUG: soft lockup - CPU#3 stuck for 22s! [sh:23899]
Modules linked in: dm_mod dax binfmt_misc ext4 crc16 jbd2 ext2 mbcache sg ipmi_watchdog ipmi_si ipmi_poweroff ipmi_devintf ipmi_msghandler nfsd
ip_tables x_tables ipv6 autofs4 xfs libcrc32c crc32c_generic raid10 raid1 raid0 multipath linear md_mod ses enclosure sd_mod scsi_transport_sas
t10_pi uas usb_storage sr_mod cdrom ata_generic ohci_pci ehci_pci ohci_hcd ehci_hcd pata_cmd64x sym53c8xx scsi_transport_spi usbcore libata
usb_common tg3 scsi_mod
CPU: 3 PID: 23899 Comm: sh Tainted: G             L    5.6.18+ #2
Hardware name: 9000/800/rp3440

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001101100000000001111 Tainted: G             L
r00-03  000000000806c00f 00000000408a6dc0 000000004037af30 000000409ef1cab0
r04-07  000000004086fdc0 0000000000000ca8 0000000040b24710 00000040b7ba73a0
r08-11  0000000040b253b8 0000004127c7eab8 00000040b7ba73f8 000000409ef1ca80
r12-15  0000000000000019 00000040ec69907e 000000409ef1c338 000000000000002f
r16-19  000000409ef1c4e0 0000000000000001 0000000000000000 0000000000000001
r20-23  000000409ef1c000 0000000000000000 0000000000000000 00000040b7ba73db
r24-27  0000000000ce2e75 0000000000ce2e74 00000040b7ba73a0 000000004086fdc0
r28-31  00000040b7ba7469 000000409ef1ca80 000000409ef1cb60 0000000040ab31ac
sr00-03  0000000008b80800 0000000000000000 0000000000000000 0000000008b80800
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004037a5e0 000000004037a5e4
 IIR: 0d0010dc    ISR: 0000000000000000  IOR: 000000000000001f
 CPU:        3   CR30: 000000409ef1c000 CR31: ffffffffffffffff
 ORIG_R28: 00000000401dfa04
 IAOQ[0]: __d_lookup_done+0x1a8/0x1d0
 IAOQ[1]: __d_lookup_done+0x1ac/0x1d0
 RP(r2): d_add+0x228/0x270
Backtrace:
 [<000000004037af30>] d_add+0x228/0x270
 [<0000000040395fe4>] simple_lookup+0x64/0xa0
 [<00000000403697f8>] __lookup_slow+0xe0/0x200
 [<000000004036a038>] walk_component+0x288/0x458
 [<000000004036a3e0>] link_path_walk+0x1d8/0x630
 [<000000004036ace4>] path_openat+0x10c/0x1370
 [<000000004036ed78>] do_filp_open+0x88/0x120
 [<000000004034f758>] do_sys_openat2+0x1e8/0x310
 [<00000000403513dc>] do_sys_open+0x64/0x88
 [<00000000403515e8>] compat_sys_openat+0x20/0x38
 [<0000000040180054>] syscall_exit+0x0/0x14

-- 
John David Anglin  dave.anglin@bell.net

