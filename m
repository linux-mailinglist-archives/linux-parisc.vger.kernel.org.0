Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251FB128257
	for <lists+linux-parisc@lfdr.de>; Fri, 20 Dec 2019 19:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfLTSq0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 20 Dec 2019 13:46:26 -0500
Received: from mout.gmx.net ([212.227.15.19]:34875 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727394AbfLTSq0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 20 Dec 2019 13:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576867580;
        bh=ozhm70U2WiBRv4FB3mIrsDBLO8nuhxdC+43oNb8DtVs=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=DppS8y/s2KhMcBjA4f3aiiMMPR9K6DQtXHnwWvv1lLI+L6858a6sZjTFw5felfwyg
         xIHAPVvcDllyL6fyRqelXMPpcSEDT/0+FS8v1sJJcFtEKBcDoVCQVxO1RcWRQSjCAo
         nVZUiFloBGz2SEDZw10il4NstX2dKoJzIICCR7/E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.172.235]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5G9n-1hhdkX1CNh-0117NG; Fri, 20
 Dec 2019 19:46:20 +0100
Date:   Fri, 20 Dec 2019 19:46:17 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: soft_offline_page() now takes the pfn
Message-ID: <20191220184617.GA16345@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:6QULxCrbmwRHieC32YkCo4jEfI25ahfN5OhcmzYJ+DA6vHrHErr
 1YeveAbz/bxAdXrbQn+y561NP0424P74vdnggqP76DOIvl9QiNuMNg5f7BpXeUf7cGk0MtS
 bty8AtVxpkTniH0aJrKkY/hNqnAiI7h04w0U0+ydcvZox6Bzy24Nr7mX3bfZkvc80ld/DWs
 mgeb37//m7TpJVa+5M9mQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lQRZFFy4bkE=:+ICuD7Gp2Evyx4meH1Innc
 DAEqisW83g2D92EggF8K7RTAhufkj2iiNtUY6be6+F2naXF3i82y+LvAs3nvZrfmFl7S7QT/n
 2jMcyZeaDzPWmkwo2YW5xqvZ221qj3b+aNLy4Tr6fRwsVZkj6rupkh9Dj2L9MXcgR/tBJ7NCl
 vHC9J6uB/Rw/qxz1BPLc70BANdtbVnDx/xXfXY+i1AtEsvmlFN2zftyTEhgcfIgBckpaorLZS
 8KJJ9+gmC7mFgzuj23TZRU7kj7xtYWJiufzKGZ5KsCcSx+/5LBkTbQVl1HSQ/XqLX8nqSFgr/
 qVh6T7mKSkAIAP9Y3mVJA/gpvmvXyf+14j3SKetJOVo00J9LCCnjrraoPe5rqVzAjRM4yqUe6
 BSLDVEKvTppgB4hhpeGW4LUapllJgiIQIiCw3Qc9hEpo1wy45BTWFoCi1F4obCbVvFcbeiSZa
 kkB9iKFlT6ifcje8GR6JBPjSMMF2Ma2n8DdUQ+Gy44LQDrsYQRxo/7brWu+LeHrTcZPccAVlz
 w6Yc452Qhnn/TcfJNAFT2uGdxxEUd2yH3MdblMBowgVj53NljRhdWI0F2m79uoajyqKqrSA9v
 gt3UkSdk4O/tzV0Qe6Hpeeo4zzGM8RTbEncZ50Xp4ccR8JHKi5vbxsuWcUATsfMfmh2QCAWOk
 lWrYNX+6NkkwSkK5zQvStkkib26ur0/etQMvTKmCf6BiQ/5N39TFf6Sbd3sxawIWxOCSF15Zk
 Fm2XrBxCS7ZB3MfkUPG8wf7R4l9Xn1zrh+WxDIf7UCoeZt8wWRhfDRQXx45TjMyjtqEdMzpw1
 PT79JRnKNg1CLCcBKS6zMLteJzGREX+EHD0N92wjXwxXpltqKFFWn8ChnImUyYGW4Zsv940ux
 +TZV7qz1d9nBnElEWChf1sjvjUNVhXExR2CfOtg0ebTq31gSWimCrS9jSSqJmHbw8Mfo+iWiB
 C6UmnG80IrHgpk7wgPopU4dB1iohYWTmKPed/niyT3A66RCFOcP+1kLkTf4JFl+N+i4XQPl7E
 WkrQoBUFBNjgQeO9xTVeei1BJyIIPPnG6aXLm6qdX0R6VRnj/T5MqtulrOFNL/m3NleWBch90
 417rZatKvUiAuxAso76mlM8qcF5Uif5F2xW5prlKzar48TmfyUGHwhpoABls5zLBAagR8H6xE
 1v+PI7W3lfWIpb13wIMZqnrx1c9Dn+tDgB2S6ibB/fDXYgPaR4jFwleiof+CIs6Ss4DOv40B3
 ubEOHRNFSFnrQuqkPb0NjVJLlFPf3euUTyNuYSQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Switch page deallocation table (pdt) driver to use pfn instead of a page
pointer in soft_offline_page().

Fixes: feec24a6139d ("mm, soft-offline: convert parameter to pfn")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 36434d4da381..749c4579db0d 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -327,8 +327,7 @@ static int pdt_mainloop(void *unused)
 			    ((pde & PDT_ADDR_SINGLE_ERR) == 0))
 				memory_failure(pde >> PAGE_SHIFT, 0);
 			else
-				soft_offline_page(
-					pfn_to_page(pde >> PAGE_SHIFT), 0);
+				soft_offline_page(pde >> PAGE_SHIFT, 0);
 #else
 			pr_crit("PDT: memory error at 0x%lx ignored.\n"
 				"Rebuild kernel with CONFIG_MEMORY_FAILURE=y "
