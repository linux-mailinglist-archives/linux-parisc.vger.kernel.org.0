Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33486792979
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Sep 2023 18:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352285AbjIEQ0k (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 5 Sep 2023 12:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353707AbjIEHWy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 5 Sep 2023 03:22:54 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-003.bell.net [209.71.212.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D2BA8
        for <linux-parisc@vger.kernel.org>; Tue,  5 Sep 2023 00:22:49 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.198.135.111]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64C35117038AE48B
X-CM-Envelope: MS4xfB+Ai/pLvQ1KPnM4ICMWfLKej+yaWxVSDIysb2m710sNKU9Amp+eOKZVePidLF4UTdYynrjDrpkxMvMt0ilt1kY/3RAYZYxzTk36YUFA3geibzEGcGcS
 ltFVzXwmR2P2ODyCik8qj4WgpxZjsgkzVhP1/B1D/rcZrg0aoka/Ac0bX3rTCRVXB7Am7/VXc+ENWiMY+9jhJDzqIrMSIR+p8S4yyASISQSyJOdny5c6fhhz
 3WINkprR7B62VDbleOZU6mq1E406RS7DJ0g9XyeDwyNtNM1pSlcs7E1gyW+IG1oQUC857q7rSrMPAkxBMloPfw==
X-CM-Analysis: v=2.4 cv=GskhRm5C c=1 sm=1 tr=0 ts=64f6d6a7
 a=m0hBPjpnfWKpZW+YOe+Hqw==:117 a=m0hBPjpnfWKpZW+YOe+Hqw==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=FBHGMhGWAAAA:8
 a=9uc_M3vqSStlxrbWM7QA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (142.198.135.111) by cmx-torrgo002.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64C35117038AE48B; Tue, 5 Sep 2023 03:20:07 -0400
Message-ID: <1901598a-e11d-f7dd-a5d9-9a69d06e6b6e@bell.net>
Date:   Tue, 5 Sep 2023 03:20:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
From:   John David Anglin <dave.anglin@bell.net>
Subject: Page fault: bad address: Code=6 (Instruction TLB miss fault) at addr
 37dd3fa10c0
Cc:     Helge Deller <deller@gmx.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,HEXHASH_WORD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Boot on parisc has been broken for some time:

[...]
Run /init as init process
process '/usr/bin/sh' started with executable stack
Loading, please wait...
Starting systemd-udevd version 254.1-3
Backtrace:
  [<0000000040433d0c>] kmalloc_trace+0x3c/0x50
  [<00000000402fceb4>] do_init_module+0xa4/0x4d0
  [<00000000402ff130>] load_module+0xe48/0x1028
  [<00000000402ff6ec>] __do_sys_finit_module+0x104/0x168
  [<00000000402ff7bc>] sys_finit_module+0x2c/0x40
  [<0000000040203e5c>] syscall_exit+0x0/0x10


Page fault: bad address: Code=6 (Instruction TLB miss fault) at addr 37dd3fa10c0
CPU: 1 PID: 825 Comm: (udev-worker) Not tainted 6.4.0-rc2+ #14
Hardware name: 9000/785/C8000

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001101111100001111 Not tainted
r00-03  000000ff0804df0f 37dd3fa10c6712d0 000000000816704c 0000000053390520
r04-07  0000000008161000 00000000081611c0 00000000520915a0 00000000411d8000
r08-11  0000000000000000 000000004115ad88 0000000053390240 0000000000000000
r12-15  00000000081631b8 0000000053390370 00000000410b9e40 0000000008165174
r16-19  0000000000000000 0000000000000000 0000000053390288 0000000008169000
r20-23  000000005381b0b0 000000000eaaa000 00000000533904c8 0000000000000001
r24-27  0000000000000cc0 0000000000000000 0000000008165290 081a024770650030
r28-31  0000000000000000 0000000053390570 00000000533905a0 0000000008167000
sr00-03  00000000000c3800 0000000000000000 0000000000000000 00000000000c6400
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000037dd3fa1 0000000037dd3fa1 IAOQ: 37dd3fa10c6712d0 37dd3fa10c6712d4
  IIR: 43ffff80    ISR: 0000000040ca43a0  IOR: 0000000040c8c040
  CPU:        1   CR30: 00000000520915a0 CR31: ffffffffffffffff
  ORIG_R28: 000000000800000e
  IAOQ[0]: 0x37dd3fa10c6712d0
  IAOQ[1]: 0x37dd3fa10c6712d4
  RP(r2): usb_common_init+0x2c/0xfe0 [usb_common]
Backtrace:
  [<0000000040433d0c>] kmalloc_trace+0x3c/0x50
  [<00000000402fceb4>] do_init_module+0xa4/0x4d0
  [<00000000402ff130>] load_module+0xe48/0x1028
  [<00000000402ff6ec>] __do_sys_finit_module+0x104/0x168
  [<00000000402ff7bc>] sys_finit_module+0x2c/0x40
  [<0000000040203e5c>] syscall_exit+0x0/0x10

Kernel panic - not syncing: Page fault: bad address

I bisected this to the following commit:

dave@atlas:~/linux/linux$ git bisect good
ddb5cdbafaaad6b99d7007ae1740403124502d03 is the first bad commit
commit ddb5cdbafaaad6b99d7007ae1740403124502d03
Author: Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon Jun 12 00:50:52 2023 +0900

     kbuild: generate KSYMTAB entries by modpost

     Commit 7b4537199a4a ("kbuild: link symbol CRCs at final link, removing
     CONFIG_MODULE_REL_CRCS") made modpost output CRCs in the same way
     whether the EXPORT_SYMBOL() is placed in *.c or *.S.

     For further cleanups, this commit applies a similar approach to the
     entire data structure of EXPORT_SYMBOL().

     The EXPORT_SYMBOL() compilation is split into two stages.

     When a source file is compiled, EXPORT_SYMBOL() will be converted into
     a dummy symbol in the .export_symbol section.

     For example,

         EXPORT_SYMBOL(foo);
         EXPORT_SYMBOL_NS_GPL(bar, BAR_NAMESPACE);

     will be encoded into the following assembly code:

         .section ".export_symbol","a"
         __export_symbol_foo:
                 .asciz ""                      /* license */
                 .asciz ""                      /* name space */
                 .balign 8
                 .quad foo                      /* symbol reference */
         .previous

         .section ".export_symbol","a"
         __export_symbol_bar:
                 .asciz "GPL"                   /* license */
                 .asciz "BAR_NAMESPACE"         /* name space */
                 .balign 8
                 .quad bar                      /* symbol reference */
         .previous

     They are mere markers to tell modpost the name, license, and namespace
     of the symbols. They will be dropped from the final vmlinux and modules
     because the *(.export_symbol) will go into /DISCARD/ in the linker script.

     Then, modpost extracts all the information about EXPORT_SYMBOL() from the
     .export_symbol section, and generates the final C code:

         KSYMTAB_FUNC(foo, "", "");
         KSYMTAB_FUNC(bar, "_gpl", "BAR_NAMESPACE");

     KSYMTAB_FUNC() (or KSYMTAB_DATA() if it is data) is expanded to struct
     kernel_symbol that will be linked to the vmlinux or a module.

     With this change, EXPORT_SYMBOL() works in the same way for *.c and *.S
     files, providing the following benefits.

     [1] Deprecate EXPORT_DATA_SYMBOL()

     In the old days, EXPORT_SYMBOL() was only available in C files. To export
     a symbol in *.S, EXPORT_SYMBOL() was placed in a separate *.c file.
     arch/arm/kernel/armksyms.c is one example written in the classic manner.

     Commit 22823ab419d8 ("EXPORT_SYMBOL() for asm") removed this limitation.
     Since then, EXPORT_SYMBOL() can be placed close to the symbol definition
     in *.S files. It was a nice improvement.

     However, as that commit mentioned, you need to use EXPORT_DATA_SYMBOL()
     for data objects on some architectures.

     In the new approach, modpost checks symbol's type (STT_FUNC or not),
     and outputs KSYMTAB_FUNC() or KSYMTAB_DATA() accordingly.

     There are only two users of EXPORT_DATA_SYMBOL:

       EXPORT_DATA_SYMBOL_GPL(empty_zero_page) (arch/ia64/kernel/head.S)
       EXPORT_DATA_SYMBOL(ia64_ivt) (arch/ia64/kernel/ivt.S)

     They are transformed as follows and output into .vmlinux.export.c

       KSYMTAB_DATA(empty_zero_page, "_gpl", "");
       KSYMTAB_DATA(ia64_ivt, "", "");

     The other EXPORT_SYMBOL users in ia64 assembly are output as
     KSYMTAB_FUNC().

     EXPORT_DATA_SYMBOL() is now deprecated.

     [2] merge <linux/export.h> and <asm-generic/export.h>

     There are two similar header implementations:

       include/linux/export.h        for .c files
       include/asm-generic/export.h  for .S files

     Ideally, the functionality should be consistent between them, but they
     tend to diverge.

     Commit 8651ec01daed ("module: add support for symbol namespaces.") did
     not support the namespace for *.S files.

     This commit shifts the essential implementation part to C, which supports
     EXPORT_SYMBOL_NS() for *.S files.

     <asm/export.h> and <asm-generic/export.h> will remain as a wrapper of
     <linux/export.h> for a while.

     They will be removed after #include <asm/export.h> directives are all
     replaced with #include <linux/export.h>.

     [3] Implement CONFIG_TRIM_UNUSED_KSYMS in one-pass algorithm (by a later commit)

     When CONFIG_TRIM_UNUSED_KSYMS is enabled, Kbuild recursively traverses
     the directory tree to determine which EXPORT_SYMBOL to trim. If an
     EXPORT_SYMBOL turns out to be unused by anyone, Kbuild begins the
     second traverse, where some source files are recompiled with their
     EXPORT_SYMBOL() tuned into a no-op.

     We can do this better now; modpost can selectively emit KSYMTAB entries
     that are really used by modules.

     Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
     Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

  arch/ia64/include/asm/Kbuild      |   1 +
  arch/ia64/include/asm/export.h    |   3 --
  include/asm-generic/export.h      |  84 ++----------------------------
  include/asm-generic/vmlinux.lds.h |   1 +
  include/linux/export-internal.h   |  49 ++++++++++++++++++
  include/linux/export.h            | 101 +++++++++++++++---------------------
  include/linux/pm.h                |   4 +-
  kernel/module/internal.h          |  12 +++++
  scripts/Makefile.build            |   8 ++-
  scripts/check-local-export        |   4 +-
  scripts/mod/modpost.c             | 106 ++++++++++++++++++++++++++------------
  scripts/mod/modpost.h             |   1 +
  12 files changed, 190 insertions(+), 184 deletions(-)
  delete mode 100644 arch/ia64/include/asm/export.h

Dave

-- 
John David Anglin  dave.anglin@bell.net

