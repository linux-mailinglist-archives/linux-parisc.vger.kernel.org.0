Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C097421A4B
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Oct 2021 00:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236902AbhJDWvu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 4 Oct 2021 18:51:50 -0400
Received: from mout.gmx.net ([212.227.15.18]:58485 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233501AbhJDWvt (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 4 Oct 2021 18:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633387798;
        bh=dGNccr1yjvRidYSXXhFJbz4gHTfWT+FVCZ5xqFFW23k=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=LEPjsqlhGDY0MdP0Itx45Ktp6niXPuZZCUHHVLZh/403ALijt1YQhfbMCaJORyLDO
         VSbtITIYayo5knTFUIPvq78Fb+q2IC0RGT6cTngQfX/jmh7/qKiEQ94MJL+r13YQCr
         bama55ukvGfnGvzoSF6gPUizzLHH5FTgFXEoxNeo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.151.97]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLR1V-1mFAqk3QSh-00IVxc; Tue, 05
 Oct 2021 00:49:57 +0200
Date:   Tue, 5 Oct 2021 00:49:48 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix ptrace check on syscall return
Message-ID: <YVuFDDWlPnzOKSsB@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:9JLzNYGQWPeuqT+n7ZCc3Lzomcn6+HW7fXFGmkxcXlKMTWm5pg4
 fhEUyFkJuPlcPeWsE6TbSutr29I99A9PHwH0sRp8sTt8oTCZId5KEyteDJ3MkWr6Aty71jV
 9naHy6uoRa43PIlHn1AtzIQx/eFujg/Ze3e/EhPWhDs52uzDRKRlv0pIWQCbc6dNS724hf9
 QY1DkpbtoCflwbst9/lZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mzx0RODuKoU=:TRlJimfZncn74lTlRelCb6
 coYP70aqfVH140id/v7JJHET51dEhGlRfEq3YfC5lb5M95+OFv5jBhTrdq6aybjQCOng6UKd0
 KkeWS5hTDM5gNZ/3VppV7QmMs+MBOzHw9zCZ9zY6VcLMxCdxvqz5cDolp0fsRLlPycX+jYsZj
 YvlUykB3Vj+qDpirYlosxGYfYE5PGb3ElWlTOzB8mKrRACebzR464hGtpzn3qaPBa0NxEoGaU
 5PRnwem3rflz2WnQnoU/m+H0OHfDC2a+f6lzy15Ng9ep6DYAVX0/emwIzhxhtqSrkmDC5jLt7
 dSYgV3qKHuDeei7CFvIVTn3zNXvc4RKtLEmg/4hIcxFlmDj4TgORFhceVDFuTWCZV24pVvzhg
 x2Nuj8ch1JLtlxJsgK+IXkFnlRaOQdimC2itzPitxBgdr6Q+fzySjCd2hUxLOVV5LebIcMSUe
 owxCXEaSFqFi9K3ZTDzbVTOYg4J9UIdCJ5yw+evd1jGt87CU4jIsx/RvPsi+LlVUOXqlxVayj
 vusXOf4KNJ6y+WtBHtRiq6xVPvBAOjBKkkdJkKHn/SG7WXj2cDOKXu5FM7bbyMgljC/pAYZmu
 Tndhtfu7DP6LczzJJwFFyy+gDrQC4YOSJPj5uAJtYPZ/fy6KpzFWEIrb4av4NdcejQX9gj2f5
 lnHXXFbUocxeDy3+xErFk0KzSs84ZPU7uysyE28ISwNwZf9vlOhgG6JYlZcmOMnWrBaJsiaAq
 TY/DO3fBBboTAv9F1Y2FMEeRHeh6vyrmV5zH2obycn4dkriYSCcq6QptUA0LK4P1Ea8oh6ZE2
 SAf4dANcZ0QZPjN4MRMrM26MAM2pSLUZk1xELWS1LrGaFCb1UfnYL4g1TFsiOH+37hKo7Z65x
 d5u+ltrXPoGL8xfyvjg7a3l7vWnD1HZTjkZWR7J8hYLK2grRUlMmpFIXEnKQk4htKuOtDP9xH
 z1Q086aeL/W7xKk3ebxboUF58H4CI95FDYTvpFRD68c9iTlvdnS3727XssLwNg5EnDSUeKGSa
 koDhNrTpbRgs+7aA8xFdsWYrXalVlc9M7pkxVeW1Y3JasJMNwXFWRM/GCFXl1OoMnQ==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

**untested**

The TIF_XXX flags are stored in the flags field in the thread_info
struct (TI_FLAGS), not in the flags field of the task_struct structure
(TASK_FLAGS).

It seems this bug has been in the kernel for 12 years (since v2.6.32).

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: ecd3d4bc06e48 ("parisc: stop using task->ptrace for {single,block}s=
tep flags")

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index f75d7d7efd25..c312aef175df 100644
=2D-- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1834,7 +1834,7 @@ syscall_restore:
 	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1

 	/* Are we being ptraced? */
-	ldw	TASK_FLAGS(%r1),%r19
+	LDREG	TI_FLAGS-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r19
 	ldi	_TIF_SYSCALL_TRACE_MASK,%r2
 	and,COND(=3D)	%r19,%r2,%r0
 	b,n	syscall_restore_rfi
