Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA51256774
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Aug 2020 14:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgH2MUp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Aug 2020 08:20:45 -0400
Received: from mout.gmx.net ([212.227.15.18]:55091 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgH2MUe (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Aug 2020 08:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1598703622;
        bh=oPY8dtGuNK6go8eV20vmHQjn00fQbMGBKyU1cfcRhMM=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=XwFCQo8G1/YHDZrdal47CV485XzLf580dgCuXeF4S6WU3XbfqSGf012YDAugI5LEV
         bFE7i+11w8zbNhebHriZlJ0iqUW2qKEXqdFtrNQ0hB8HEcpvNv3mVBb6O64Sxzl7AK
         g/21WSEOf5dOoXPsTwYfWU8OlCYQ+EY1v/RLmkGo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.169.105]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf4S-1ktcOq0BUo-00il0t; Sat, 29
 Aug 2020 14:20:22 +0200
Date:   Sat, 29 Aug 2020 14:20:17 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [RFC PATCH] parisc: Define O_NONBLOCK to become 000200000
Message-ID: <20200829122017.GA3988@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:47AneJ4Qv7Jau1YCz3yPS3I1YwOgQv6XZoMM1nRGziR9h6EicOJ
 3HEtSIr90ceftyU6wEL4FsiKi29W6ABEfJ0iVCLX1kxal7rJWSHf5H/VMCSid8n5C5FKlWU
 wqq0aVV41nf/E+UEoPFYLxew55rY4JsDskJKrbIko5MMQzbCwcTsOFUueUO9MCjDQcKyC0Q
 G51SXty77HCOok6IqSXJQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VIqXXN3ssKY=:KdiPMWU26oF9Acc3V7Kjb+
 hPGAq7X5b1bwt2a4MsyFzFcRsG3/OS6j6KjL/6xagovdvoT+XukWip1Ix8ip4uANspiObSv/I
 m5hFaMf5bFxlB19LovBPnyJ9kQFlT0EfAMqJnZw8T7NEQ2bA1a46nt88+k4qRpFxKZXiM0Obp
 Qd6bpv6ATAKJloJEYv+D4r6kcsQFAidbQEK+ahit35/YlYxmTCJ8js3PvffC59kUust6TDt+S
 +fnF59mokYoBYupaNBSlppgII9FtMoy/lOvAnjK7b5LZKwNWlZ98gESdZnS9VDJ6tDFngYsHV
 Gnjr3Cp/A0gWcX5FMUHxDeyiu56NotTR5BYDsAFMIOuRC6iAVn3Vv2Wx3rDj86QvaleMhwAut
 YE59PY4CVfrCfZZqC9GizbsY13WzerwmMCM/CKsfIlCiSffMJmwWBJi0fzAFx7Ylhd7bTnKn/
 aUCUP4h0k4sGJEQwkGLjSTYM2Qhb2IoKw9WRQ0rqSczGwh9u7/Itxbj3gtHRC0e88KLMVJqX0
 XBuVlTXQJs4QPfu+P89wLP+Mpp1DKf9vjDOwrd3SsmNxAnGzY8zKxD/vta6PEseCAeezmYWd0
 lVW6TmidJjfurOurJU55guTF9XbWi3EzOTNIoWVAJj2wTSPii0Nne7vAx9kAqEwPkdB5gB1Ep
 NMJkm8MLTpVrXg8KHV5QFl4GHksgfdd0ixCZQlxsRRkRpLkXl9uyEk2li/ihq86ZGMOKMVsCN
 hZ9a0Qdg7D8eaLarZ+UQ6JXAnKViof+x22ktEJmdpeyfMAEeIWBcCFyLXkFZK8gKBV6TK9UBe
 R5ShzhwiVRug3obAh+tIwR6sF3kwZmGnSU1WGfEC7IQ2bZQP9wytDQN1pa1ukH8R4/rQRelqx
 TZWpRxP1eeHkz1cexFBLRXdZkIAG86J3qQNYZJYKkug97YzQVcAwfyWXE+l7IBgdznACrypfH
 m39V5CM4bjsaiBQfibJgyMnrv3sLlcH00Z9C/wuJ5QL1+fuiXfvSaq7KGQ9SPqYn0FNDkv7tH
 9fMhANd69BqW0SCWJ290Z+xtGLVHq6I0rFPq1+3r+TzwXp5Q2lAhB0HsbHyhmgDElnzio/sD6
 nXpi3s4UMmbeTjLopXfOLoHVfME54Km+39bK7VC+/kCiynnCnZx7lsSKY3eXZ7iLg5XWGMtlM
 roAYRcL6hKIiGoWokzkhWVsCf+5GVa1XWDI0Iukxb5r3P6hGhhqGuvS9djqitZ4egqKv3Wb+Z
 SVbQtAxWhiu4YYH1h
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

HPUX has separate NDELAY & NONBLOCK values. In the past we wanted to
be able to run HP-UX binaries natively on parisc Linux which is why
we defined O_NONBLOCK to 000200004 to distinguish NDELAY & NONBLOCK
bits.
But with 2 bits set in this bitmask we often ran into compatibility
issues with other Linux applications which often only test one bit (or
even compare the values).

To avoid such issues in the future, this patch changes O_NONBLOCK to
become 000200000. That way old programs will still be functional, and
for new programs we now have only one bit set.

Update the comment about SOCK_NONBLOCK too.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/socket.h b/arch/parisc/include/asm/so=
cket.h
index 79feff1b0721..33500c9f6e5e 100644
=2D-- a/arch/parisc/include/asm/socket.h
+++ b/arch/parisc/include/asm/socket.h
@@ -4,8 +4,8 @@

 #include <uapi/asm/socket.h>

-/* O_NONBLOCK clashes with the bits used for socket types.  Therefore we
- * have to define SOCK_NONBLOCK to a different value here.
+/* O_NONBLOCK clashed with the bits used for socket types.  Therefore we
+ * had to define SOCK_NONBLOCK to a different value here.
  */
 #define SOCK_NONBLOCK	0x40000000

diff --git a/arch/parisc/include/uapi/asm/fcntl.h b/arch/parisc/include/ua=
pi/asm/fcntl.h
index e19adc65b1d0..03dee816cb13 100644
=2D-- a/arch/parisc/include/uapi/asm/fcntl.h
+++ b/arch/parisc/include/uapi/asm/fcntl.h
@@ -8,7 +8,7 @@
 #define O_LARGEFILE	000004000
 #define __O_SYNC	000100000
 #define O_SYNC		(__O_SYNC|O_DSYNC)
-#define O_NONBLOCK	000200004 /* HPUX has separate NDELAY & NONBLOCK */
+#define O_NONBLOCK	000200000
 #define O_NOCTTY	000400000 /* not fcntl */
 #define O_DSYNC		001000000
 #define O_NOATIME	004000000
