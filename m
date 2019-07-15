Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0457669CD7
	for <lists+linux-parisc@lfdr.de>; Mon, 15 Jul 2019 22:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731534AbfGOUda (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 15 Jul 2019 16:33:30 -0400
Received: from mout.gmx.net ([212.227.17.20]:49559 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731187AbfGOUda (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Jul 2019 16:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563222808;
        bh=NZSvw7g6SSytcFvSob+0MWjJHNuS5rSJvJPkgaN+gEY=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=fMtOg8NK5RAdE7y9Kda8m8yH4xseXwiuhtCMaEpPcLuRrnjUfQkm2BMK93OjBUO8m
         MijP2RpW62Zx880a/f3YXYPFUn6LRrZlU2SeCYbKqdzIt+NCTTKLPF8q0p1czAMT5o
         AoDHAk8mvO3r3jt6MCo6H+g10ntlrOjmifSW7r9E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.141.80]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatRT-1iKoWB2TwR-00cPvb; Mon, 15
 Jul 2019 22:33:28 +0200
Date:   Mon, 15 Jul 2019 22:33:26 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Christian Brauner <christian@brauner.io>
Subject: [PATCH] parisc: Wire up clone3 syscall
Message-ID: <20190715203326.GA25932@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:P4o/wtgvr4lTA1RvPEJ04+toVw3ndih8RZS12Cmu/WTqE064b9n
 7usOkeTOtTFJ5ijPrD2+ODXGZPuQ69S3RAjyq5Pjn5y9SFoRwFQVhdxjxYh6lKUi24zk41I
 /WXwlgV1uAVmFYkdUiO3UM3xr6qVNJnK8FiGv0EY6y201SIIfD9rF6SyO5n3zHexUmwOeVG
 gxwY4BmBp/9b24VE4jgRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NZzjQ6qBcEM=:pguxyy/CB9eQmM1YSXWEVQ
 492vKp4p6TYXL1aSywhsF1v7s0MagF6wBHvu2YpnT6fmVcAR66WI429IM1NJSZGFRxNe9cSo/
 7rqP4dQR+E++FbdEbHEWv9kjauIUuYEp3MG03Uw5713E5LTBlAk6BiMtxO9g6B/AwqwaXPUdK
 xUsHF7cowgrYX7uZ9SifooJAz5eb8KvyyxewhYWIJtlCWROffo0GL4wCdihxWRsydB200ZVz9
 ENJQo+H8hY1Zyh8bVXoXva/KbALJuuQ6zeeELr+bG6DaKtlTw+L/c9bhRxnsWC0NFNGcXKAeE
 wjSAsnIbxH1ER1Ddl+HdPdyXZFR4mFJlv04Y2GNgojlfN9LvvSb4gTxgNr4PBUvayx3KwDF11
 p67JYgxY67MZDWBqAYucpgoMgfzz8M5BAuBMe37EgNuYfo+O1oSC244U3x1UmQVfkia6ffcU5
 O3wo7Z+CaJzImwWEL21Z47gF8YruUoVoVujllvwc/fBud32+E5wDluDaVaIbQYBIh2U4+tlFG
 fYfU0Kujt9Be/wosuXndCMc8jaS0wHsQltfiV87iRiN1AJp4a/kVAkHsO6CXfR+cqcLJHQS8O
 40dypw2mlwVpXDInUZ+0C8xKSqtpyhuLqn2L/k1rEmzwaoowNdlJz7dGaQMVa8rNc4csv3khV
 QGVxmoj+hcsnjHQEhbwFgmMSavxiYzEaR4GDXiLPcNs4SQJJSi7DbyW0kkBxssPPbIll2WLPR
 D5PvRcZ+SRZCFQqArdsYKar2VcTOZ9VHiM4kpR35ST/KcfqZo8bD+grNOevW1BiTrRLbrBQnv
 X8HA/8rpe1aIgCpNY1mZtjuTwxe36kypydoKJvfCfpSccU+h8Nu3dHDhKFF5TcE4icrbYuNTC
 6FdWjrEwjqqLLoC/lZrtALuxY5YGVpW1+JZYNX17bruutAgAcEkP8b3NfTJCep+ns4PJ+W74J
 LbJdNBnGF4SUxm65J7xaFEjdkm9pBKd1Vkuhl3HymLgAoAhT93GoHuyeZcR1z7AwUaZKdj2k6
 MEYhgVBfX0BBKruA30C+7B8e27+lBu+VzRJ3HNVFeVlY0L3PJaB8VLt1I0Me/h9k8g==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Untested patch to wire up the clone3 syscall.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/un=
istd.h
index b0838dc4dfee..cd438e4150f6 100644
=2D-- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -166,6 +166,7 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4 ar=
g4, type5 arg5)	\
 #define __ARCH_WANT_SYS_FORK
 #define __ARCH_WANT_SYS_VFORK
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_SYS_CLONE3
 #define __ARCH_WANT_COMPAT_SYS_SENDFILE

 #ifdef CONFIG_64BIT
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 3e430590c1e1..d9d3387f7c47 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1732,6 +1732,7 @@ ENDPROC_CFI(sys_\name\()_wrapper)
 	.endm

 fork_like clone
+fork_like clone3
 fork_like fork
 fork_like vfork

diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/=
syscalls/syscall.tbl
index 5022b9e179c2..670d1371aca1 100644
=2D-- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -431,3 +431,4 @@
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
+435	common	clone3				sys_clone3_wrapper
