Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 106EA134C50
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Jan 2020 21:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgAHUFr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Jan 2020 15:05:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:58198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbgAHUFr (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Jan 2020 15:05:47 -0500
Received: from localhost.localdomain (unknown [83.218.167.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D70120705;
        Wed,  8 Jan 2020 20:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578513946;
        bh=7+a0M4QeXOG9b8lMwdfVaJAPohBMh++kbzQxdvukK48=;
        h=From:To:Subject:Date:From;
        b=evYOx5KdUdG0Jr/Vc38MOswPxNnF7vRlb4Tb199FZpqwnzGTIvL+ezoR/DMzbuceA
         kFY/nO2cZ4Rz6kmSrTr6FWXXDO9kMP2CReYBBlel+BAJjwJUXV7GF+gCcHoo1B+vS3
         sn9Be5nqVhaTYIYYOT8RQp0qbzzYGBxIewpxHquo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ben Skeggs <bskeggs@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jiri Slaby <jirislaby@gmail.com>,
        Nick Kossifidis <mickflemm@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Dave Jiang <dave.jiang@intel.com>,
        Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, linux-ntb@googlegroups.com,
        virtualization@lists.linux-foundation.org,
        linux-arch@vger.kernel.org
Subject: [PATCH v2 0/9] iomap: Constify ioreadX() iomem argument
Date:   Wed,  8 Jan 2020 21:05:19 +0100
Message-Id: <20200108200528.4614-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,


Changes since v1
================
https://lore.kernel.org/lkml/1578415992-24054-1-git-send-email-krzk@kernel.org/
1. Constify also ioreadX_rep() and mmio_insX(),
2. Squash lib+alpha+powerpc+parisc+sh into one patch for bisectability,
3. Add Geert's review,
4. Re-order patches so all optional driver changes are at the end.


Description
===========
The ioread8/16/32() and others have inconsistent interface among the
architectures: some taking address as const, some not.

It seems there is nothing really stopping all of them to take
pointer to const.

Patchset was not really tested on all affected architectures.
Build testing is in progress - I hope auto-builders will point any issues.


volatile
========
There is still interface inconsistency between architectures around
"volatile" qualifier:
 - include/asm-generic/io.h:static inline u32 ioread32(const volatile void __iomem *addr)
 - include/asm-generic/iomap.h:extern unsigned int ioread32(const void __iomem *);

This is still discussed and out of scope of this patchset.


Merging
=======
Multiple architectures are affected in first patch so acks are welcomed.

Patches 2-4 depend on first patch.
The rest is optional cleanup, without actual impact.


Best regards,
Krzysztof


Krzysztof Kozlowski (9):
  iomap: Constify ioreadX() iomem argument (as in generic
    implementation)
  net: wireless: rtl818x: Constify ioreadX() iomem argument (as in
    generic implementation)
  ntb: intel: Constify ioreadX() iomem argument (as in generic
    implementation)
  virtio: pci: Constify ioreadX() iomem argument (as in generic
    implementation)
  arc: Constify ioreadX() iomem argument (as in generic implementation)
  drm/mgag200: Constify ioreadX() iomem argument (as in generic
    implementation)
  drm/nouveau: Constify ioreadX() iomem argument (as in generic
    implementation)
  media: fsl-viu: Constify ioreadX() iomem argument (as in generic
    implementation)
  net: wireless: ath5k: Constify ioreadX() iomem argument (as in generic
    implementation)

 arch/alpha/include/asm/core_apecs.h           |  6 +-
 arch/alpha/include/asm/core_cia.h             |  6 +-
 arch/alpha/include/asm/core_lca.h             |  6 +-
 arch/alpha/include/asm/core_marvel.h          |  4 +-
 arch/alpha/include/asm/core_mcpcia.h          |  6 +-
 arch/alpha/include/asm/core_t2.h              |  2 +-
 arch/alpha/include/asm/io.h                   | 12 ++--
 arch/alpha/include/asm/io_trivial.h           | 16 ++---
 arch/alpha/include/asm/jensen.h               |  2 +-
 arch/alpha/include/asm/machvec.h              |  6 +-
 arch/alpha/kernel/core_marvel.c               |  2 +-
 arch/alpha/kernel/io.c                        | 12 ++--
 arch/arc/plat-axs10x/axs10x.c                 |  4 +-
 arch/parisc/include/asm/io.h                  |  4 +-
 arch/parisc/lib/iomap.c                       | 72 +++++++++----------
 arch/powerpc/kernel/iomap.c                   | 28 ++++----
 arch/sh/kernel/iomap.c                        | 22 +++---
 drivers/gpu/drm/mgag200/mgag200_drv.h         |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  2 +-
 drivers/media/platform/fsl-viu.c              |  2 +-
 drivers/net/wireless/ath/ath5k/ahb.c          | 10 +--
 .../realtek/rtl818x/rtl8180/rtl8180.h         |  6 +-
 drivers/ntb/hw/intel/ntb_hw_gen1.c            |  2 +-
 drivers/ntb/hw/intel/ntb_hw_gen3.h            |  2 +-
 drivers/ntb/hw/intel/ntb_hw_intel.h           |  2 +-
 drivers/virtio/virtio_pci_modern.c            |  6 +-
 include/asm-generic/iomap.h                   | 28 ++++----
 include/linux/io-64-nonatomic-hi-lo.h         |  4 +-
 include/linux/io-64-nonatomic-lo-hi.h         |  4 +-
 lib/iomap.c                                   | 30 ++++----
 30 files changed, 156 insertions(+), 156 deletions(-)

-- 
2.17.1

