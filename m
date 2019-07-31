Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 509407C772
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 17:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbfGaPtp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 11:49:45 -0400
Received: from mout.gmx.net ([212.227.15.19]:52929 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726755AbfGaPto (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 11:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564588178;
        bh=M53fzQKZDq0eyS7HLD/TvaYzfplY6POzjtWoWCWAfFo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=C77t4CA4QK7aiz5v8F96a95DH5fqwnk3KGpPSwQdR3mCIppF693fA9XwAKRqnUnrH
         aah/TrACV9s2p19U36KYGbqioqq1XT4e4TWhp7u+3VYTzS2ByYJeE2uZQ3gblJnW+a
         ULzrtwpuLuo9YdrqX3pA8xTohBCSwVwFdAgzOKKw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.174.24]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72sP-1i0o8r1oDv-008dRU; Wed, 31
 Jul 2019 17:49:38 +0200
Date:   Wed, 31 Jul 2019 17:49:34 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix fall-through warnings in fpudispatch.c
Message-ID: <20190731154934.GA21186@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:3RVRdKsMHOPROgo29ko4VCpkGKePDQljOB+4YKe7TtC9Mi9i3rS
 k2G9myCOwOQj+yyMmhDjsa5HkrSNp6hUp8o0iZcIa1oeuPmd5DhDvtHbUhR1lYZOIMmfN47
 n0psoqk+cj1Bgz6d19CHBttuvD3mHPaM7KPu3u/nBFPr8WeWD7eIqbIFellvhVSFji7HJEn
 CCv5Zu2SPxY8JC6CV5DoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MlOIgfVB+vY=:aiVmy0LLdMXfzmUryG+wWR
 PNbau1dU/ElLeg8QGaJkeg6TmXf1FZ86KvrjWdVAMFs3Ey5YCyd7PGqsOT9wNGxSYkqDDjaiD
 nfSl6wSGYqg5o4KAjphgPRUb6le2Y4kOYpM2eLAOiO8XiWusIX80GD8ItGps3znxPyVBb4VBw
 wCOryryH3bE80gjv9CcYW6jLMwt3Rl1g40rQMhqF8rAxpT4ulGT5x0qg3T9E3AM3X1N2bTuvy
 qQd4SV4PcRRPpskqF4Q8iYHra3dYpYz/SLKBDB+sueGSI8LxAVBQy9OIZGvBwMXsl8Goc5Xw6
 N8s864EjM5lXnY/PrienxIIiY2eeQiIB/NzBcOSblAznxPETF8TrCTgWYXgJP2L+4wA43Z23a
 Uv3ScE+9txeAi3LbOPfsMu78bSud3AC3tnVXzM1o0RwC0ocmAj7yOfR7P6Qws1dzaFaa1p3Ye
 V9eI8hlkb9IxZed7lrhFOAPeaP6vKpqEXd4A/JXTfoipVAS7siWjd0HAeYeFW3L5IhcA4uLBX
 p+osRfZQKY0csGfVN6NjVG0/SSJKjDIapRpG3OhO0KbV8XENigHjn6dKXXek5OJX3R74Rd63R
 CaKv+ink78TnE3xIj3kRvWMlisYKtKwwOIW75U2dHeTPAZE8dsck2JgCnfGOOQWU2hw2ZSoM+
 ueQoqHX40F4/vYhyKWHB++Uzk9Bkl02d06xFyKudLos1DA3pnuOQ2T094yaw04IJLw2DrXEHn
 KkIeH0iMUhCLRQqyXeQB+tvw5Bn+9HrhDFaStLyOPWIHm8re8Vz/Sr+Tb5Q11IirF8GJsMne3
 MJbVGycTgUSK1+ZgS6yBn9k4oFuw5WwESQyGhIciCE0B59/KFVw5bpKjk0O/UTzHHsa/A0453
 YyH/ttagvwMk0NkXTiq20hHBLbZ5uu9vGQhng5F6qNpfvlCCOfIhIwvJX4Q0fvE4C34Clmp0b
 Ahf/Ci5AiZHVVoCdJUqHDP+XcCPXz0nuXJ9l160120itXr9kQAELe1zMf5jVj+8+ZfEuhLEVi
 bLoF2q8z7Y2Uids9JGIANY4CHrEo/OUMGCeMPty2PtcFVMwCBMummclk02lIuZhRzg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In fpudispatch.c we see a lot of fall-through warnings, but for this file =
we
prefer to not mark the switches and instead keep it in it's original state=
 as
it's copied from HP-UX.

Fixes: a035d552a93b ("Makefile: Globally enable fall-through warning")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/math-emu/Makefile b/arch/parisc/math-emu/Makefile
index b6c4b254901a..55c1396580a4 100644
=2D-- a/arch/parisc/math-emu/Makefile
+++ b/arch/parisc/math-emu/Makefile
@@ -18,3 +18,4 @@ obj-y	 :=3D frnd.o driver.o decode_exc.o fpudispatch.o d=
enormal.o \
 # other very old or stripped-down PA-RISC CPUs -- not currently supported

 obj-$(CONFIG_MATH_EMULATION)	+=3D unimplemented-math-emulation.o
+CFLAGS_REMOVE_fpudispatch.o	=3D -Wimplicit-fallthrough=3D3
