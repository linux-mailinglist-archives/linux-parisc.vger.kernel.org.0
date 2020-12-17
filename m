Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027CE2DD59B
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Dec 2020 18:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgLQQ7h (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Dec 2020 11:59:37 -0500
Received: from mout.gmx.net ([212.227.15.19]:33029 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727303AbgLQQ7h (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Dec 2020 11:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608224278;
        bh=lp/OpSrrDxgWlKY7AkhcOL/VLOVOWqmZLaSVabGFVC4=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=ZgXI4G27VV/XAZ519YKVt+zEn+0F32r/Epw+C4diAsSXFLunct97AKV2lK1vSJG/a
         WL4BmywaQ8IHPCihnO0B/liJeezGypjJOPABLnodDHjIBFhqVmGzemneQlxJpXffXL
         mVAPqXLM4lItK+jMEupWPK4deAyjsKs6/FIOgUkY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.140.151]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmGZ-1kVvqR2aNt-00KCe5; Thu, 17
 Dec 2020 17:57:58 +0100
Date:   Thu, 17 Dec 2020 17:57:54 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Drop out of get_whan() if task is running again
Message-ID: <20201217165754.GA5561@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:8z14mVQBZRnXCrQT5oxraRgtdkFDlDKt5w/QuSonCKWRG6nJafb
 tSUmr7ZHaBFIhBXMLV1N2hor94ljfUvBIZ/iB/WpjpCpIS/+seJ8dmui8RgAqTRi/K+BlNM
 uZ7cngvBVq+JG121H177K1mcCN5OdZ/0i26NMdVH6jDW/UdkXBQ6hREsXajXylpGhoJXqSu
 mbVi2XtBQRcWxrSwjyY3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kfiTae8UHpw=:ZgjKMFYPXX2rLZzlHXgpwq
 OpRVxClDk/EI0tTIao9NPI+Z6dXllsG2B4ubFhjwlczUfOp/Yshr/HO/GysFFnrrOusPpG+yf
 3kGwRWo4GMby3LYP+IN/GjtUDcne4Y0XaDUkTcsjXL7DQdae1nCRPqvsnxH2phf8g/sNTKD3h
 NgtzPQRmoll0RnZraxO3tD6Xz2iMRNfyJYsDpLUsjK+JAhd1MJwAKYhED65FkQDWBd3L6APhF
 5XLBwq4jnpuAfNlefCJ8p8S3YBNxXdeAPczLFSHn1LCgSjiuQB4xELO8tyS17mV+GVkBg5r/O
 kTGTlKN/7zQxTy1i5axNe7zf7vdPgFcuV+p3IVp5lVO6Pdk56QlGLiPzxHqAgpuL0uaLzsqWw
 dxx7Fi3D8yKTjkUONN6tK8nfiIEDZ1Zka4bsYwmfT8dehte1GMRRAgXpYQIGmJ2LQ+fWVb9Ur
 X3MmTWHU8NrDtb88qbKUU/oMHqghH1pPLJby7Q2O/C2yytuXEWBCAUez+sTg2IAx4tYyKnqRN
 9kjY1VvzYDJjn3XCGRtBunK0kQN6MBSjXnkgvtKqz+KgfSPa6vEBJiS72RoKUobZu5om/hZeH
 f2/PhndvfW9s1PDOGK99jTl/a1eFUQRxqzDzvbAFcQMgvHfJalmiXglj3cWZ1493upE4bZjpJ
 q7iEvxonF1rworCUBS2c61y2Kdq2qcPSVc3uj8BEnqld9HhI2tQNZM4QppgtLLiilS+6HSI+v
 jIkNSWQejqlAgov0EnZTNw40hk5OvVkmyunK0AjFXpLgc1hXNoCDhamzKnk2uM/nO0Ymw4zlL
 um6Px1gaB7GLKRYhVe2EKB0toBYMVDpxk652A66vF8ZJ2YSP7uMXpIw1jp+bVYeMMnXCQKFkY
 dbkY3aEu+R51SdBrMbmQ==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index a92a23d6acd9..fda1c1a6a444 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -260,6 +260,8 @@ get_wchan(struct task_struct *p)
 	do {
 		if (unwind_once(&info) < 0)
 			return 0;
+		if (p->state == TASK_RUNNING)
+                        return 0;
 		ip = info.ip;
 		if (!in_sched_functions(ip))
 			return ip;
