Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5ED239FB8
	for <lists+linux-parisc@lfdr.de>; Sat,  8 Jun 2019 14:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfFHMwI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 8 Jun 2019 08:52:08 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:39628 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726984AbfFHMwI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Jun 2019 08:52:08 -0400
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jer)
        by smtp.gentoo.org (Postfix) with ESMTPSA id DCC723459F5;
        Sat,  8 Jun 2019 12:52:06 +0000 (UTC)
Date:   Sat, 8 Jun 2019 14:52:01 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     hppa@gentoo.org
Subject: [RESEND V2] modprobe: ERROR: could not insert 'ipv6': Exec format
 error / module ipv6: Unknown relocation: 72
Message-ID: <20190608145201.56c667f5@wim.jer>
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Second resend. Not sure why e-mail from my Gentoo account and private
account never arrive. Originally sent on 21 May 2019, but I still see
this issue in 5.2.0-rc3-JeR-00077-g16d72dd4891f. I attached the kernel
config in earlier attempts but I am leaving that out this time.


<Forwarded message:> 


# modprobe -v ipv6
insmod /lib/modules/5.2.0-rc1-JeR/kernel/net/ipv6/ipv6.ko
modprobe: ERROR: could not insert 'ipv6': Exec format error

dmesg:
module ipv6: Unknown relocation: 72

# modprobe -v nf_conntrack
insmod /lib/modules/5.2.0-rc1-JeR/kernel/net/netfilter/nf_conntrack.ko
modprobe: ERROR: could not insert 'nf_conntrack': Exec format error

dmesg:
module nf_conntrack: Unknown relocation: 72

Note that other modules are loaded properly. Any ideas?


Kind regards,
     jer



--
System information:

Linux karsten 5.2.0-rc1-JeR #60 SMP Mon May 20 09:34:40 CEST 2019
parisc64 PA8800 (Mako) 9000/785/C8000 GNU/Linux

Linux version 5.2.0-rc1-JeR (root@karsten) (gcc version 8.3.0 (Gentoo
8.3.0 p1.0)) #60 SMP Mon May 20 09:34:40 CEST 2019

at commit commit a188339ca5a396acc588e5851ed7e19f66b0ebd9 (HEAD, tag:
v5.2-rc1, origin/master, origin/HEAD, master)

 # hppa64-unknown-linux-gnu-gcc -v
Using built-in specs.
COLLECT_GCC=hppa64-unknown-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/hppa64-unknown-linux-gnu/8.3.0/lto-wrapper
Target: hppa64-unknown-linux-gnu
Configured
 with: /var/tmp/portage/sys-devel/kgcc64-8.3.0/work/gcc-8.3.0/configure
 --host=hppa2.0-unknown-linux-gnu --target=hppa64-unknown-linux-gnu
 --build=hppa2.0-unknown-linux-gnu --prefix=/usr
 --bindir=/usr/hppa2.0-unknown-linux-gnu/hppa64-unknown-linux-gnu/gcc-bin/8.3.0
 --includedir=/usr/lib/gcc/hppa64-unknown-linux-gnu/8.3.0/include
 --datadir=/usr/share/gcc-data/hppa64-unknown-linux-gnu/8.3.0
 --mandir=/usr/share/gcc-data/hppa64-unknown-linux-gnu/8.3.0/man
 --infodir=/usr/share/gcc-data/hppa64-unknown-linux-gnu/8.3.0/info
 --with-gxx-include-dir=/usr/lib/gcc/hppa64-unknown-linux-gnu/8.3.0/include/g++-v8
 --with-python-dir=/share/gcc-data/hppa64-unknown-linux-gnu/8.3.0/python
 --enable-languages=c --enable-obsolete --enable-secureplt
 --disable-werror --with-system-zlib --enable-nls
 --without-included-gettext --with-bugurl=https://bugs.gentoo.org/
 --with-pkgversion='Gentoo 8.3.0 p1.0' --disable-libstdcxx-pch
 --enable-poison-system-directories --disable-shared
 --disable-libatomic --disable-threads --without-headers
 --disable-bootstrap --enable-__cxa_atexit --enable-clocale=gnu
 --disable-multilib --disable-libgomp --disable-libmudflap
 --disable-libssp --disable-libquadmath --enable-lto --without-cloog
 --without-ppl Thread model: single gcc version 8.3.0 (Gentoo 8.3.0
 p1.0)

# hppa64-unknown-linux-gnu-ld -v
GNU ld (Gentoo 2.31.1 p5) 2.31.1

