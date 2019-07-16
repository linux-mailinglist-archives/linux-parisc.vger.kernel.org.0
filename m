Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D8B6AFA5
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Jul 2019 21:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbfGPTQk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Jul 2019 15:16:40 -0400
Received: from mout.gmx.net ([212.227.15.15]:43895 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728137AbfGPTQk (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Jul 2019 15:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563304589;
        bh=nx3TDVu9odwu3APXuy12uA4VPFy/vgfsSCoLZJVUZ/4=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=KEdZ4UXKXBN4JE5KX8IxgwHRX5rfnD6Nc5IrknqAdS8YBGkYuTzl+Hi50EaDhCmOM
         PQpkTYkx626+b0hgpn9jsJaO+gY0GR5aPxM+m59nUwtiUy9iQgL8sFbK/T2PT7RyfS
         HwLoaE9b7zVeonnS3hKMnyu2SHOfhDYNnEL9T/ig=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.163.176]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0ML6qP-1hnk3I05GD-000OcI; Tue, 16
 Jul 2019 21:16:29 +0200
Date:   Tue, 16 Jul 2019 21:16:26 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Avoid kernel panic triggered by invalid kprobe
Message-ID: <20190716191626.GA6959@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:7NuhpNWOVnIfRCnpoYvhvgSgn78Ew8w7ohmMee36mLqMxjW7qV8
 EuLli6jfuTuASymIOhSjdOUqupJGBw98zWvSzaa0XjxTMxvsjaUMmCeAOQgXMqWVIqs8uZE
 2tX0YG2A2bXQyGs3htc+0vdd1nL5Pytl+BFsIkWUoQzawDbgLr6SsmfUBztC28cLzocsAxW
 XDYsIq4FO5+2YxKBc4YTg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K8S9sVcARG8=:OX6ohOUndBcyJrXvaBZwRW
 F7Zpv5wDsZ6QIHgH0PeM9ujzGeb5WTtbm4HJ6mViOqt4+sDHvr3r1JJJ+MklLTb8PgSk2Pqur
 bS8ewRE7NDkkiCGP1iUMy75e5pe6ii6vsY/DGigEDLZFRa1WUH96a72Tf7MZ8KAeeTQCZCTw6
 919b9L70XHaobNzp3mPnfkB8xt930rkIc22W5CQdudPA9B9IdDBSa/wL31JDKZuBtzYJw6XAJ
 fQA/kPo5Gc/qBeS+QkyqNwjFbmFKE/9QbMoro27YSRDBy6gQ+7rM3yW5KTy354ssAif7UHUmB
 gKuX/V8iKV53WzCEUtfbcsgoBx1miNgfB+OEvnN1JsSiQ96JQo9tZ/nSSyp+pITnl+DjYZWar
 BivehkGDg9/Bqo8bTPz/6zni98cyzD4j/1ekeUuSBadarWJjUWclQda8H0qF7A9GPI2FW4oKH
 UKOIutT7Lw+MSEbocXWOfMyldkc2asZIqt13H9wtqX3ut3PYP5uugh3rgzfqsuY4Yuj3eHpBB
 M1kF0qvDn6wz5xYLbSKq99YIsds/HrIYoqLJYIMqemO9ZiiNi+uTRbO2mky1RsZ93RePVpG2l
 xiyUQLoGbthcGwHgNQsUU3oWE5ZG3Yf5wiHVGQ3yhzn+AiQ6rJ1ye8bZQ5dTeBkmDZ9RIjN1t
 apolP/JpNeJdnhC8ir0KfkDzMAwj2e4JdgdhTK/WlWGpmnUTUbl/6WH0Bpt2wwdApsPgtqRZK
 rR7T+i33HkWv1MIRJAWyi8mm3fPw0TMe7u6A/Im9LjpvKdCgscOEWymuOlycPdF/l6ZSDYvWw
 B9ZRrX1phYVP7K8b9PfR5ia7ftK+mp5VfodhickOpYpdwDXn6tn44Zb9X5gQyZlKP58xixIRm
 I5lMYHWlTzdpQahV01Buom/jA+/sB7RfGlJWgsRwb8EjJuaCRl2KPnn2lTWJXo7z/PVA9lGTz
 zAcYnEXVG9EKe4+TtqNEv+qlOMHP4+CuWh/Qg58d90lusULLVxvxHxsGikGwfyh6MSBFAG8t9
 fO9f7AuhM6VBfOz4p7eE+oG1ihtS4Y+MMz/3eCCl1eWNLW4v6sg8llDYA8Dm+bBIdw==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When running gdb I was able to trigger this kernel panic:

 Kernel Fault: Code=3D26 (Data memory access rights trap) at addr 00000000=
00000060
 CPU: 0 PID: 1401 Comm: gdb-crash Not tainted 5.2.0-rc7-64bit+ #1053

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
 PSW: 00001000000001000000000000001111 Not tainted
 r00-03  000000000804000f 0000000040dee1a0 0000000040c78cf0 00000000b8d501=
60
 r04-07  0000000040d2b1a0 000000004360a098 00000000bbbe87b8 00000000000000=
03
 r08-11  00000000fac20a70 00000000fac24160 00000000fac1bbe0 00000000000000=
00
 r12-15  00000000fabfb79a 00000000fac244a4 0000000000010000 00000000000000=
01
 r16-19  00000000bbbe87b8 00000000f8f02910 0000000000010034 00000000000000=
00
 r20-23  00000000fac24630 00000000fac24630 000000006474e552 00000000fac1aa=
52
 r24-27  0000000000000028 00000000bbbe87b8 00000000bbbe87b8 0000000040d2b1=
a0
 r28-31  0000000000000000 00000000b8d501c0 00000000b8d501f0 00000000034240=
00
 sr00-03  0000000000423000 0000000000000000 0000000000000000 0000000000423=
000
 sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000=
000

 IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040c78cf0 0000000040=
c78cf4
  IIR: 539f00c0    ISR: 0000000000000000  IOR: 0000000000000060
  CPU:        0   CR30: 00000000b8d50000 CR31: 00000000d22345e2
  ORIG_R28: 0000000040250798
  IAOQ[0]: parisc_kprobe_ss_handler+0x58/0x170
  IAOQ[1]: parisc_kprobe_ss_handler+0x5c/0x170
  RP(r2): parisc_kprobe_ss_handler+0x58/0x170
 Backtrace:
  [<0000000040206ff8>] handle_interruption+0x178/0xbb8
 Kernel panic - not syncing: Kernel Fault

Avoid this panic by checking the return value of kprobe_running() and
skip kprobe if none is currently active.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # v5.2

diff --git a/arch/parisc/kernel/kprobes.c b/arch/parisc/kernel/kprobes.c
index d58960b33bda..0385a8fd74aa 100644
=2D-- a/arch/parisc/kernel/kprobes.c
+++ b/arch/parisc/kernel/kprobes.c
@@ -133,6 +133,9 @@ int __kprobes parisc_kprobe_ss_handler(struct pt_regs =
*regs)
 	struct kprobe_ctlblk *kcb =3D get_kprobe_ctlblk();
 	struct kprobe *p =3D kprobe_running();

+	if (!p)
+		return 0;
+
 	if (regs->iaoq[0] !=3D (unsigned long)p->ainsn.insn+4)
 		return 0;

