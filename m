Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3832921A0CD
	for <lists+linux-parisc@lfdr.de>; Thu,  9 Jul 2020 15:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGIN03 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 9 Jul 2020 09:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbgGIN03 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 9 Jul 2020 09:26:29 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27550C08C5CE
        for <linux-parisc@vger.kernel.org>; Thu,  9 Jul 2020 06:26:28 -0700 (PDT)
Received: (qmail 25780 invoked from network); 9 Jul 2020 13:24:23 -0000
Received: from p548d5453.dip0.t-ipconnect.de ([::ffff:84.141.84.83]:55472 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <dave.anglin@bell.net>; Thu, 09 Jul 2020 15:24:23 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix spinlock barriers
Date:   Thu, 09 Jul 2020 15:26:13 +0200
Message-ID: <35432085.F4uqhuS8rR@daneel.sf-tec.de>
In-Reply-To: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2293833.NV2VNcvjgP"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2293833.NV2VNcvjgP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 3. Juli 2020, 22:32:35 CEST schrieb John David Anglin:
> Stalls are quite frequent with recent kernels.  When the stall is detected
> by rcu_sched, we get a backtrace similar to the following:

With this patch on top of 5.7.7 I still get:

pioneer login: [14567.086716] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14567.086716] rcu:     1-...!: (1 GPs behind) idle=2be/1/0x4000000000000000 softirq=1301330/1301331 fqs=6
[14567.086716] rcu:     2-...!: (1 GPs behind) idle=de2/1/0x4000000000000000 softirq=1324750/1324751 fqs=6
[14567.086716]  (detected by 0, t=15002 jiffies, g=2903305, q=43)
[14567.086716] Task dump for CPU 1:
[14567.086716] sh              R  running task        0 28260  28257 0x00000012
[14567.086716] Backtrace:
[14567.086716]
[14567.086716] Task dump for CPU 2:
[14567.086716] sh              t    0 28253  28247 0x00000011
[14567.086716] Backtrace:
[14567.086716]
[14567.086716] rcu: rcu_sched kthread starved for 14990 jiffies! g2903305 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=3
[14567.086716] rcu: RCU grace-period kthread stack dump:
[14567.086716] rcu_sched       R  running task        0    10      2 0x00000000
[14567.086716] Backtrace:
[14567.086716]
[14747.106716] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14747.106716] rcu:     1-...!: (1 GPs behind) idle=2be/1/0x4000000000000000 softirq=1301330/1301331 fqs=6
[14747.106716] rcu:     2-...!: (1 GPs behind) idle=de2/1/0x4000000000000000 softirq=1324750/1324751 fqs=6
[14747.106716]  (detected by 0, t=60007 jiffies, g=2903305, q=43)
[14747.106716] Task dump for CPU 1:
[14747.106716] sh              R  running task        0 28260  28257 0x00000012
[14747.106716] Backtrace:
[14747.106716]
[14747.106716] Task dump for CPU 2:
[14747.106716] sh              t    0 28253  28247 0x00000011
[14747.106716] Backtrace:
[14747.106716]
[14747.106716] rcu: rcu_sched kthread starved for 59995 jiffies! g2903305 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=3
[14747.106716] rcu: RCU grace-period kthread stack dump:
[14747.106716] rcu_sched       R  running task        0    10      2 0x00000000
[14747.106716] Backtrace:
[14747.106716]
[14927.126716] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14927.126716] rcu:     1-...!: (1 GPs behind) idle=2be/1/0x4000000000000000 softirq=1301330/1301331 fqs=6
[14927.126716] rcu:     2-...!: (1 GPs behind) idle=de2/1/0x4000000000000000 softirq=1324750/1324751 fqs=6
[14927.126716]  (detected by 0, t=105012 jiffies, g=2903305, q=43)
[14927.126716] Task dump for CPU 1:
[14927.126716] sh              R  running task        0 28260  28257 0x00000012
[14927.126716] Backtrace:
[14927.126716]
[14927.126716] Task dump for CPU 2:
[14927.126716] sh              t    0 28253  28247 0x00000011
[14927.126716] Backtrace:
[14927.126716]
[14927.126716] rcu: rcu_sched kthread starved for 105000 jiffies! g2903305 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=3
[14927.126716] rcu: RCU grace-period kthread stack dump:
[14927.126716] rcu_sched       R  running task        0    10      2 0x00000000
[14927.126716] Backtrace:
[14927.126716]
[15107.146716] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15107.146716] rcu:     1-...!: (1 GPs behind) idle=2be/1/0x4000000000000000 softirq=1301330/1301331 fqs=6
[15107.146716] rcu:     2-...!: (1 GPs behind) idle=de2/1/0x4000000000000000 softirq=1324750/1324751 fqs=6
[15107.146716]  (detected by 0, t=150017 jiffies, g=2903305, q=43)
[15107.146716] Task dump for CPU 1:
[15107.146716] sh              R  running task        0 28260  28257 0x00000012
[15107.146716] Backtrace:
[15107.146716]
[15107.146716] Task dump for CPU 2:
[15107.146716] sh              t    0 28253  28247 0x00000011
[15107.146716] Backtrace:
[15107.146716]
[15107.146716] rcu: rcu_sched kthread starved for 150005 jiffies! g2903305 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=3
[15107.146716] rcu: RCU grace-period kthread stack dump:
[15107.146716] rcu_sched       R  running task        0    10      2 0x00000000
[15107.146716] Backtrace:
[15107.146716]
[15287.166716] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15287.166716] rcu:     1-...!: (1 GPs behind) idle=2be/1/0x4000000000000000 softirq=1301330/1301331 fqs=6
[15287.166716] rcu:     2-...!: (1 GPs behind) idle=de2/1/0x4000000000000000 softirq=1324750/1324751 fqs=6
[15287.166716]  (detected by 0, t=195022 jiffies, g=2903305, q=43)
[15287.166716] Task dump for CPU 1:
[15287.166716] sh              R  running task        0 28260  28257 0x00000012
[15287.166716] Backtrace:
[15287.166716]
[15287.166716] Task dump for CPU 2:
[15287.166716] sh              t    0 28253  28247 0x00000011
[15287.166716] Backtrace:
[15287.166716]
[15287.166716] rcu: rcu_sched kthread starved for 195010 jiffies! g2903305 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=3
[15287.166716] rcu: RCU grace-period kthread stack dump:
[15287.166716] rcu_sched       R  running task        0    10      2 0x00000000
[15287.166716] Backtrace:
[15287.166716]

--nextPart2293833.NV2VNcvjgP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXwca9QAKCRBcpIk+abn8
TtBdAJ94p3reNwUM4B3vR+860JtFYlpTWwCglUxPq0Am7ORZ1s1o7QYq5jM/TrQ=
=54K3
-----END PGP SIGNATURE-----

--nextPart2293833.NV2VNcvjgP--



