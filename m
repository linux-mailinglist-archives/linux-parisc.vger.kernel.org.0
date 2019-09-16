Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E7BB4033
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Sep 2019 20:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732489AbfIPST7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 Sep 2019 14:19:59 -0400
Received: from mout.gmx.net ([212.227.15.19]:56367 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732262AbfIPST7 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 Sep 2019 14:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1568657971;
        bh=5JYExOoizKoku5K5TgA/HNnjAWp4gGtovIt70J4r0CE=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=a1xUXMngN8A/VYMs9yfw5Er1SMSHUY2BnPHoljlQicXB85OqvWN0s7XeC1kNw/vOy
         cCVPd9wzjQRcXUj1dfFZpFljWGPBY6cQgvUrONPah0xtkmxd378kG9Xlslx5QHUWK0
         yQKbgFCWxluwn0RvAnIkTsM5/kwcm0NBxIILSEn4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.141.197]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MVMgI-1hbEuT36Uw-00Ymeq; Mon, 16
 Sep 2019 20:19:31 +0200
Date:   Mon, 16 Sep 2019 20:19:25 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>,
        Jeroen Roovers <jer@gentoo.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [GIT PULL] parisc architecture updates for kernel v5.4
Message-ID: <20190916181925.GA7698@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Provags-ID: V03:K1:dDYuydDYelHVLCS548gk0UyJbeIQsck4F+4fj2HfgT9aQrwTtLM
 ymITBXU8bMI69QKeq5X7yIYTbcE1V+0pkTpIuN/F7H8mZ2AM7FsZekUqIaiP6a3FunBo2CD
 9qeoKIL+/DP/sG3M59W7o0QybxZw41DYgL6yauYCvqlZYqylu/AxR1v/pqpr6ZLFE0FFe9D
 W8GVWwvL7Ek0zqpwaQ/3w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qRYIt3cfNyA=:IW7cwNCTWf6ShoRiFoTJqi
 swbptmyCe5MucNnnKnx4CEzOrIjau9DlXKEfUNDTkdv8ffzNzXWj44WdZQKZEwAbL/dZzya9z
 E4yfzhUg32xWsZPIoS4g8AAuW9unPkmjN2KlstRFyaci4VTpw0eR1qMkIOUWFpjHAb/Rou97P
 fauvYwmcytCnq8RbFi28RJWH/wm5mtjiX2z4JFQhRSqyO5AQCzYYQkp/jjgTqmxpVIduqSDEv
 wDU4t/Bw5NgIQr5MLuMNHK4jFEXD5lUxuUyx3shl5+20/1gDIwVqKPynxhyMsmPolF0PWXj5N
 hXzju+705AGzQqPqg6+vWHDFR1Hja4plJ39k9qQRCkfskiRhACNhDAA97IizSmiavDXFsEkwM
 Z0yWN0cC3q9CWz2gjCHTWTpvaPO0uSLEljnW7o9pGBS9I+0Oi5Bg/tw0QHnnWgoaP+mCq5Dmg
 GmDd1dQTqOk/bXyd5HrEQ+j2u03ufh1+obAdQJs50+eYtZD03usQ4SNX+hRMt/ucNQOXB5jEj
 zev/BLuy27v/9emrlhyPSMlC/F4wOpr49m0CvfOdhNGS8wL27iDEOAjGu3QOtAu/Ns3A6ekE/
 rSrXp02hNobgvhhto+6bufjSJi9cuOEgPIMlhi7Ce3iD7sqdRwpvzIQZLxjvq02RUIH4iXk3D
 QmeGWsr9K/KW5cZ7w95Q0EiZFkeP79anoFnpWHy7zMzPT1fwa3DONFKBq/RbRiHoMw4uQs/DN
 /AWVuJ2eptpymghQ3fEtILotVy6+3Nu3+7oNJeYsS444nEhGGh6k0q404CoJmthWvtZTkoxq7
 PMaqlMTGuz6qW4zZAamsJz6TRwjrAw8qBVp4tZ8H558LvV9KJTB+7epI0OCd7mejpGf0gbvpe
 w4UHQn/cE2Bnluh79bGKSNpAbAEJixp+Bl1q66s9w/4iTTC5OAnNU9ciLXlpqAwklQ6OUFRWs
 1BLvCSStZMOX+toPgzRDeHQXQdg/TJl0PG3w1iuaRI4BjV8mIYJqTKStxKhM1DNVD3dv9PBDB
 jTQgSv7l3zNlYrZjqpSaLlFrqOPyeWKS7iBcZpb4mOSq+cfaij+sLZ6+F6dFxE9ig/ZFHSFGn
 V0s67lEUMzKlnsScAoWPUZMlijEnrJxG6u1DxpqkKpx2wF5dmGSOH3XDwVzOX7fTXn80swUoj
 b8RNZImLo8WbCKmthNS43gnbVURtncvfvoRpgMH9plPXoYDM2tB67cqjmnVFci8iZsF2tP41m
 t29Y4ftLu69US2wsm/umDo9jtBy6dGkbDE+/xKA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Linus,

please pull the parisc architecture updates for kernel 5.4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.4-1

Major changes:
* Make the powerpc implementation to read elf files available as a public
  kexec interface so it can be re-used on other architectures (Sven)
* Implement kexec on parisc (Sven)
* Add kprobes on ftrace on parisc (Sven)
* Fix kernel crash with HSC-PCI cards based on card-mode Dino
* Add assembly implementations for memset, strlen, strcpy, strncpy and strcat
* Some cleanups, documentation updates, warning fixes, ...

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (8):
      parisc: Add assembly implementations for memset, strlen, strcpy, strncpy and strcat
      parisc: Add ALTERNATIVE_CODE() and ALT_COND_RUN_ON_QEMU
      parisc: speed up flush_tlb_all_local with qemu
      parisc: Avoid warning when loading hppb driver
      parisc: Convert eisa_enumerator to use pr_cont()
      parisc: Drop comments which are already in pci.h
      parisc: Save some bytes in dino driver
      parisc: Disable HP HSC-PCI Cards to prevent kernel crash

Jeroen Roovers (1):
      parisc: Have git ignore generated real2.S and firmware.c

Jisheng Zhang (1):
      kprobes/parisc: remove arch_kprobe_on_func_entry()

Sven Schnelle (15):
      parisc/ftrace: Add ARCH_SUPPORTS_FTRACE_OPS support
      parisc/ftrace: Add KPROBES_ON_FTRACE
      parisc: Update feature list
      parisc: trigger die notifier chain in parisc_terminate()
      kexec: add KEXEC_ELF
      kexec_elf: change order of elf_*_to_cpu() functions
      kexec_elf: remove parsing of section headers
      kexec_elf: remove PURGATORY_STACK_SIZE
      kexec_elf: remove Elf_Rel macro
      kexec_elf: remove unused variable in kexec_elf_load()
      kexec_elf: support 32 bit ELF files
      parisc: add __pdc_cpu_rendezvous()
      parisc: add kexec syscall support
      parisc: wire up kexec_file_load syscall
      parisc: add support for kexec_file_load() syscall

 .../features/core/jump-labels/arch-support.txt     |   2 +-
 .../debug/kprobes-on-ftrace/arch-support.txt       |   2 +-
 arch/Kconfig                                       |   3 +
 arch/parisc/Kconfig                                |  25 +
 arch/parisc/boot/compressed/.gitignore             |   2 +
 arch/parisc/include/asm/alternative.h              |  11 +-
 arch/parisc/include/asm/fixmap.h                   |   1 +
 arch/parisc/include/asm/ftrace.h                   |   1 +
 arch/parisc/include/asm/kexec.h                    |  37 ++
 arch/parisc/include/asm/pdc.h                      |   1 +
 arch/parisc/include/asm/string.h                   |  15 +
 arch/parisc/kernel/Makefile                        |   2 +
 arch/parisc/kernel/alternative.c                   |  23 +-
 arch/parisc/kernel/entry.S                         |  99 ++++
 arch/parisc/kernel/firmware.c                      |  13 +
 arch/parisc/kernel/ftrace.c                        |  64 ++-
 arch/parisc/kernel/kexec.c                         | 112 +++++
 arch/parisc/kernel/kexec_file.c                    |  86 ++++
 arch/parisc/kernel/kprobes.c                       |   4 -
 arch/parisc/kernel/pacache.S                       |   9 +
 arch/parisc/kernel/parisc_ksyms.c                  |   4 +
 arch/parisc/kernel/pci.c                           |  11 -
 arch/parisc/kernel/relocate_kernel.S               | 149 ++++++
 arch/parisc/kernel/smp.c                           |   1 +
 arch/parisc/kernel/syscalls/syscall.tbl            |   3 +-
 arch/parisc/kernel/traps.c                         |   2 +
 arch/parisc/lib/Makefile                           |   4 +-
 arch/parisc/lib/memset.c                           |  91 ----
 arch/parisc/lib/string.S                           | 136 +++++
 arch/powerpc/Kconfig                               |   1 +
 arch/powerpc/kernel/kexec_elf_64.c                 | 545 +--------------------
 drivers/parisc/dino.c                              |  30 +-
 drivers/parisc/eisa_enumerator.c                   |  10 +-
 drivers/parisc/hppb.c                              |  11 +-
 include/linux/kexec.h                              |  23 +
 include/uapi/linux/kexec.h                         |   1 +
 kernel/Makefile                                    |   1 +
 kernel/kexec_elf.c                                 | 430 ++++++++++++++++
 38 files changed, 1289 insertions(+), 676 deletions(-)
 create mode 100644 arch/parisc/include/asm/kexec.h
 create mode 100644 arch/parisc/kernel/kexec.c
 create mode 100644 arch/parisc/kernel/kexec_file.c
 create mode 100644 arch/parisc/kernel/relocate_kernel.S
 delete mode 100644 arch/parisc/lib/memset.c
 create mode 100644 arch/parisc/lib/string.S
 create mode 100644 kernel/kexec_elf.c
