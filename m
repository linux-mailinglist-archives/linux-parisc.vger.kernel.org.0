Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB081DAD37
	for <lists+linux-parisc@lfdr.de>; Wed, 20 May 2020 10:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgETIYl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 20 May 2020 04:24:41 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:57016 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbgETIYl (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 20 May 2020 04:24:41 -0400
Date:   Wed, 20 May 2020 10:24:23 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, James.Bottomley@HansenPartnership.com
Subject: GCC 10.1.0 miscompiles PALO IPL, triggers HPMC
Message-ID: <20200520102423.40eda06b@wim.jer>
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I compiled PALO 2.12 with GCC 10.1.0 and that triggered an HPMC on a
C8000 when the PDC loads the IPL:


HARD Booted.
<Cpu0> 0000107e00e00000  0000000000000000  CC_BOOT_LAUNCH_IPL_PRI
<Cpu0> 0100142900e00000  fffffff0f0e0ac00  CC_CPU_INTRIGUE_LDB
<Cpu0> 3400082100e00000  0000000000000001  CC_BOOT_BOOT_COMPLETE
<Cpu0> e800009800e00000  00000000000640a8  CC_ERR_CHECK_HPMC
<Cpu0> 37000f7300e00000  8040004000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu0> f600105e00e00000  fffffff0f0c00000  CC_MC_HPMC_MONARCH_SELECTED
<Cpu0> 140003b200e00000  000000000000000b  CC_ERR_HPMC_STATE_ENTRY
<Cpu0> 400010bd00e00000  0000000000000000  CC_MC_OS_HPMC_CODE_ZERO
<Cpu0> 5600106400e00000  fffffff0f0435110  CC_MC_BR_TO_OS_HPMC_FAILED


https://bugs.gentoo.org/724264


Using built-in specs.
COLLECT_GCC=hppa2.0-unknown-linux-gnu-gcc-10.1.0
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/hppa2.0-unknown-linux-gnu/10.1.0/lto-wrapper
Target: hppa2.0-unknown-linux-gnu
Configured with:
/var/tmp/portage/sys-devel/gcc-10.1.0/work/gcc-10.1.0/configure
--host=hppa2.0-unknown-linux-gnu --build=hppa2.0-unknown-linux-gnu
--prefix=/usr --bindir=/usr/hppa2.0-unknown-linux-gnu/gcc-bin/10.1.0
--includedir=/usr/lib/gcc/hppa2.0-unknown-linux-gnu/10.1.0/include
--datadir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/10.1.0
--mandir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/10.1.0/man
--infodir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/10.1.0/info
--with-gxx-include-dir=/usr/lib/gcc/hppa2.0-unknown-linux-gnu/10.1.0/include/g++-v10
--with-python-dir=/share/gcc-data/hppa2.0-unknown-linux-gnu/10.1.0/python
--enable-objc-gc --enable-languages=c,c++,jit,objc,obj-c++,fortran
--enable-obsolete --enable-secureplt --disable-werror
--with-system-zlib --enable-nls --without-included-gettext
--enable-checking=release --with-bugurl=https://bugs.gentoo.org/
--with-pkgversion='Gentoo 10.1.0 p1' --disable-esp
--enable-libstdcxx-time --enable-host-shared --enable-shared
--enable-threads=posix --enable-__cxa_atexit --enable-clocale=gnu
--disable-multilib --disable-altivec --disable-fixed-point
--enable-libgomp --disable-libmudflap --disable-libssp --disable-libada
--disable-systemtap --disable-vtable-verify --disable-libvtv
--with-zstd --enable-lto --without-isl --enable-default-pie
--disable-default-ssp Thread model: posix Supported LTO compression
algorithms: zlib zstd gcc version 10.1.0 (Gentoo 10.1.0 p1)

palo version 2.12
http://www.parisc-linux.org - Wed May 20 09:34:54 CEST 2020https://rooversj.home.xs4all.nl/gentoo//sys-boot:palo-2.12:20200518-151820.log


The build log[0] showed some seemingly harmless and unrelated warnings
that are new with GCC 10.


Kind regards,
      jer


[0] https://rooversj.home.xs4all.nl/gentoo//sys-boot:palo-2.12:20200518-151820.log
