Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F728453252
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Nov 2021 13:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236242AbhKPMnV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Nov 2021 07:43:21 -0500
Received: from mout.gmx.net ([212.227.15.18]:36753 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232312AbhKPMnR (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Nov 2021 07:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637066415;
        bh=3yw44KaO9TaQT7zkUl+rpNqvGyWruQ+PZyaJRxQlB3I=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=EgybbxoWYNS+4sQL1hGThdWYCUEEJkhv8iMvQ0tN52ELF0jiaiem523vm95NYcfr9
         /W+5qSudOcbew6IfaXUKOCNmAgzoSqNTI7dmLAo9vCjy9/tRdT56iERMSmLV2aVMjS
         skuvjP+C/mUZD4uRVzsppTXPavjn+WUoDD204J8U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.177.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVNAr-1nDfJ21SX1-00SKkc; Tue, 16
 Nov 2021 13:40:15 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 3/4] parisc: Wire up futex_waitv
Date:   Tue, 16 Nov 2021 13:40:11 +0100
Message-Id: <20211116124012.1380455-3-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116124012.1380455-1-deller@gmx.de>
References: <20211116124012.1380455-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M28Hxq1Ypu9qRTVVcF2TNiCnz3w2cnwvlah37zAUkOAkJOgiCR3
 RLphMj0cuSqjrKL6edk2k6ztnbmHODYuMw0YdALnmgTQDK7dSeylxWhtRvXspYX27VkoGo7
 iP3V+PMJFNN+6CGEZX877J1nVvyev4yoc0V9GMaeTmQx5VxnU7L6rVGdw0qJlzfEh0OefcX
 s7IG2SXjvYpyZN+2+kbaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qs2ajeaahNA=:8jENSmbNfnJyYdeNEMg/Cu
 lvia7aSZ8kfMhEsT2uWF7LNYNzsoEUG5g+Bh50IuBUl9nFWKlmB0vzUe9J6DNJF1TQKoP3Csw
 aRm9Bns5p8jE2/2SSNMsiGD4SQQl/DOFAJ8LHkEDFGg4Mu7EwIPMHMAViyfxO+kll+Z3gC5v2
 6uQXBbbzfL3wUNbdn5NkzesVIQIJqJQiAv8cMy73IpkqdQTnnBbYmGkL8Ow61Elw7B7ESh2gn
 Vd0YXn3mXrOEM8yLj6WpdRmt2ds1Vwy30wAUVOHswUQq17lB/jZG2L1b4RT2mP4JRCBgtnPPQ
 GLM5+7vSPeY02vRb34DSz8n88G43nYQyshxHLTGtJL5HZ1JeY20SdjGUTFmVaV1dS+pQzqcuP
 sM5V2bimdO+DRwLQ75K3VWN6hApbXTvFxB+JRXC27VKdAFcBGPu1cPjvZvGcZm8TpjCvQCxWm
 6BnIRLGyuPKZlAT7BPsyFMqY36kA8TZWPe+7/LYeWJUKN2l6z8O9jjdlzOeU0n1OZT5JpTyr8
 Nb0y4P26y7k6X/SIrwfz0fzgnic4Wbgp/PyEHaK0hA9b2/9gLVfZT679vCwqdGEAqdGVUrpwJ
 0xn9ljlApVpdlEFBkAC889hBqu+ozH3aSIlDW9PSCbI0/RwE9AzsuXMADCqPbP12i0xNSQw6K
 zVzQPl7tkJ7Tu/lI78/5DDIdgH3/xQmU4X5Wrl8UTOiUbXG25QduAvMTz4sfXlFD06cF3f3X2
 kUQuibtrdvMhenHFIfJFVEhmFVhPZXCK+dE3bSb6ppqJQO1TDS9mxDR7GyingXbH/gtPOJhcG
 6karJ0tA9mjha1XwcxO2MvsfeEQtNig/eb/d41wX4sO7wOIbb81QWTvTTugj1fTcAIEdbuy7T
 /hvS8zsuFyguUuu1hs9dC5CSK6HDtzG2DQu090Vd+tIRPoHFJj9XbMJ2cksgHL7G/DQ5JTwxE
 +ac2+3EvivOK7kORqb3TL05w/xDEM+7tnREAJx/2N+90DULQyKSNAa1BAslUlO6KGnRMp4oRK
 TucM7c93T/D7jw0O3ypC8+ahXy5qFahSLtS0jX1t2RgiIZRrbT7K9Qg6mH3dZHaIJj5U/bq85
 5H9aJOX+bPh33s=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/syscalls/syscall.tbl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/=
syscalls/syscall.tbl
index bf751e0732b7..358c00000755 100644
=2D-- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -446,3 +446,4 @@
 446	common	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	common	process_mrelease		sys_process_mrelease
+449	common	futex_waitv			sys_futex_waitv
=2D-
2.31.1

