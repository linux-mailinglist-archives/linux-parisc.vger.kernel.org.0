Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF45B586E39
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Aug 2022 18:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbiHAQD6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 1 Aug 2022 12:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbiHAQD6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Aug 2022 12:03:58 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890983CBF4
        for <linux-parisc@vger.kernel.org>; Mon,  1 Aug 2022 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1659369827;
        bh=Lhb+GVJiG1RsKHIHfzJfH8QMK2zaLKZktbw4lPTcxTA=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=HSIrm6q8x0Z6ahUQplZZ735hM4GQl9XW2ICRrDK+nuG0PVfrto0WfSe4oke9uWfAf
         9+U5nGbg0YACNA+5Df+an3b9kb3s8pt8/gbrVCfnR0kPxG67De3PF+f/NbQM8ayGjZ
         GPP9oKe0zm6nSvJWYMHKY+m+Aj2txBhcQi9YIKYE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.150.19]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCbEp-1o8t6m3Jat-009e1s; Mon, 01
 Aug 2022 18:03:47 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: io_pgetevents_time64() needs compat syscall in 32-bit compat mode
Date:   Mon,  1 Aug 2022 18:03:46 +0200
Message-Id: <20220801160346.82008-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n0gCQg6gnv8VdQtHCV//D2snCVDk65bImso2CeWr98o8hzWVGWV
 wqGeq5x7qJtGCjIKEZrMl7DCSnSYj8iabSGKaj75qonzOtLxiwEfu/eYIew3iE9kKKB1ICP
 USTECGxSD0l0ivVPVpl/j8XowA1S3cTpcYTdtOExwVr9ridvBDpC+Ay8qd6cbgslhhLq6P8
 TmQjkJH6nGi0dKUzswdig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h0YdEZzGfuw=:sARitXAzd3dc0Vwg+G4L/0
 UR7D7E99X3U9bTlj6/6APV6Qqjbl9TxKnhsx+wMlmGhcYnM7JxsfiGQju8MftY9GcVjYOYHna
 9PWpdLUl37yhxykG0w9sma+y59IWcKMjItqI1IvCBk44QpeWn/jSjCEgPM5uGABbxBeEPk5bi
 xieyfm2cEfyJAgE4COkw6e1uFNmx6pRHBTgF+hFLIBh5388TozmbqPhOEPAgwgiHqxRCtyEVK
 ZZqWaZmRwgo5pBkoSA3FU/mWFP+GDTwWXtodjJg7voEhFyzIwGj40vUPZ0dvOKSudCobYS5oU
 6vw8F0nKQ2Nq5De64uTmc5x3WzZrX9aJzpUkCJ5nZLOpf9nsiWhxY+sFYFeEGCglXv4wGd7O+
 Fh1Tg0mH8La+CctnXBnYFRK3gxPuDK5wUH55ybgdEjV17zkUdwn5nmaidnsvIDjE58dhS2kGw
 5RwQU9JGDp8t3l0o2OVfE89NYuAewI2lbXtyjt/VdjJP/u7tAlTJnZuoOCSb/rekM8OrqfdIG
 134RcAqRWooKo46BpjROkKMVun+HYw1+eh8NoBB4+T8t2mZoENwPBz7xr1jpRPMQeLphHOdW3
 /ZD5ngterwQhZHEXH6K0yzH7PAL0a43PATpGNY2+n2u6oH7UqkDFFopvBDPC/bJBWRkffH42f
 JYnVwDnO4pHzMH5xVdfl3tmKOPkONpje138QK7dFXk478vzE6xjEQJnN+VI6eG661l+Xk4+Yj
 EUVCcjilYvj5b/Az5gJTVEt62TW0BlkGHPFFIpFzkIg2a+S6EE2ylBGjzGn0ZYMThC1z0A3rI
 Ro3ZkTRkiCnRiNZxQGegh/NswwIBSJ+WHuvYybTwFBDwQ0bnDkfPDVrnUP3T4rJfbc8mWAI/K
 WkuaZU5fbkj1xOlZtyaGrQuabaPiabbPcc+jg3v6pTrtIsBO4zkXLRGvNwOXejzPdy04xd8EW
 q8q1FqJ/T98Q0HKgLOBWRDw9xJW+AnRsbPawG7y1ygytVNvdtW3okNu17Wozqa0tOL2IdMkzZ
 Nr6Gkw29M9smWGPa8H9hPsM6VbXqGNB4IAuH0awAB7wZyXTdJDPpBv+TEf9CWZB0Ejd2xby/4
 Xg1LN2fPa0mGePx/MgrM04gBwRIs/LOqlBf50KBf/vXnqVLIiDffboREg==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

For all syscalls in 32-bit compat mode on 64-bit kernels the upper
32-bits of the 64-bit registers are zeroed out, so a negative 32-bit
signed value will show up as positive 64-bit signed value.

This behaviour breaks the io_pgetevents_time64() syscall which expects
signed 64-bit values for the "min_nr" and "nr" parameters.
Fix this by switching to the compat_sys_io_pgetevents_time64() syscall,
which uses "compat_long_t" types for those parameters.

Cc: <stable@vger.kernel.org> # v5.1+
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/syscalls/syscall.tbl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/=
syscalls/syscall.tbl
index 68b46fe2f17c..8a99c998da9b 100644
=2D-- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -413,7 +413,7 @@
 412	32	utimensat_time64		sys_utimensat			sys_utimensat
 413	32	pselect6_time64			sys_pselect6			compat_sys_pselect6_time64
 414	32	ppoll_time64			sys_ppoll			compat_sys_ppoll_time64
-416	32	io_pgetevents_time64		sys_io_pgetevents		sys_io_pgetevents
+416	32	io_pgetevents_time64		sys_io_pgetevents		compat_sys_io_pgetevents_=
time64
 417	32	recvmmsg_time64			sys_recvmmsg			compat_sys_recvmmsg_time64
 418	32	mq_timedsend_time64		sys_mq_timedsend		sys_mq_timedsend
 419	32	mq_timedreceive_time64		sys_mq_timedreceive		sys_mq_timedreceive
=2D-
2.37.1

