Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74BACACBCF
	for <lists+linux-parisc@lfdr.de>; Sun,  8 Sep 2019 11:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfIHJdS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 8 Sep 2019 05:33:18 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:38830 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbfIHJdS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 8 Sep 2019 05:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=tCMFC2g9zj0E7KakJvapqN4sMQongDl0XiMQ9WzlIto=; b=F04Fj3NuusXaCJFKUmszhFemwW
        zZ57JY1+aU74uZtKcEUL1+rXoXUmbBpP/QxkEOeNmJCTNnKIZsfPN0qtMXzaNuoo0g6Qs0QcJIXZZ
        qnAdz0kRXsLqMsQ7ivxeJGghgsZmSDwmebromTJq8NYwXe2aFPyhvuGW43hn6k4trCY0=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de ([46.5.233.221] helo=x280.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1i6tZM-0005Ro-LS; Sun, 08 Sep 2019 11:33:16 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 0/4] kexec support for PARISC
Date:   Sun,  8 Sep 2019 11:33:02 +0200
Message-Id: <20190908093306.31455-1-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

this series adds support for the kexec syscalls to the PARISC architecture.
Note that kexec() on PA8800/PA8900 doesn't work yet as i haven't figured
out how to restart the CPUs on these systems.

For testing you can use my patched kexec-tools:

https://git.stackframe.org/cgit/kexec-tools/log/

I will submit these patches as soon as kexec is merged into the linux
kernel.

Thanks,
Sven

Sven Schnelle (4):
  parisc: add __pdc_cpu_rendezvous()
  parisc: add kexec syscall support
  parisc: wire up kexec_file_load syscall
  parisc: add support for kexec_file_load() syscall

 arch/parisc/Kconfig                     |  23 ++++
 arch/parisc/include/asm/fixmap.h        |   1 +
 arch/parisc/include/asm/kexec.h         |  37 ++++++
 arch/parisc/include/asm/pdc.h           |   1 +
 arch/parisc/kernel/Makefile             |   2 +
 arch/parisc/kernel/firmware.c           |  13 +++
 arch/parisc/kernel/kexec.c              | 109 +++++++++++++++++
 arch/parisc/kernel/kexec_file.c         |  86 ++++++++++++++
 arch/parisc/kernel/relocate_kernel.S    | 149 ++++++++++++++++++++++++
 arch/parisc/kernel/smp.c                |   1 +
 arch/parisc/kernel/syscalls/syscall.tbl |   3 +-
 include/uapi/linux/kexec.h              |   1 +
 12 files changed, 425 insertions(+), 1 deletion(-)
 create mode 100644 arch/parisc/include/asm/kexec.h
 create mode 100644 arch/parisc/kernel/kexec.c
 create mode 100644 arch/parisc/kernel/kexec_file.c
 create mode 100644 arch/parisc/kernel/relocate_kernel.S

-- 
2.23.0.rc1

