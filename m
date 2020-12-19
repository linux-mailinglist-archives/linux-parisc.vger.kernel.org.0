Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0396D2DEE95
	for <lists+linux-parisc@lfdr.de>; Sat, 19 Dec 2020 12:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgLSLrO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 19 Dec 2020 06:47:14 -0500
Received: from mout.gmx.net ([212.227.15.18]:47737 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgLSLrN (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 19 Dec 2020 06:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608378342;
        bh=ZHOowcGJEh5XXq0EUSMNz5aqD7FxVtH4whK4BlR4Ync=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=LKy8xvS4NFHZvdqnWcQgDdF2fPd9bxeS/kaNM+oaGKjni+8hA993I8eNz6Htj2iD/
         BhdvsoOq+stcqJUtrZ2A2dwH70NdR0YWrnLlB4ZBJ6Xsq/F+LQdtU2zOwg2u8a9553
         M6JLjfOZdnmRmH5/OrCsS//Td4copFJstmlj3LKw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.150.61]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOiDd-1kRW5R16Q3-00QEyQ; Sat, 19
 Dec 2020 12:45:42 +0100
Date:   Sat, 19 Dec 2020 12:45:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Use the generic devmem_is_allowed()
Message-ID: <20201219114540.GA11316@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:hX9JTA0v6+J/6gM/UqrkI4mCWJqwmsZVHYkxWNQ9xraE1wz7oDx
 8bO95VPczy0IYTcqZNrjd+w6XWG2djnRSuhiijWgd31+ngSpTjkVSzjBUMAJqvvXMu3IrbE
 UCGkKMsO77bLQR2puOZqHnbsXSbZjYWJlCElyL8TMKokyrwLsVZiI/pthJwoYQN1+QK4YwB
 Bcv/QDTalPfgN5wxsXEgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:76tSwVDDtaU=:WMoIg2I7GP9cD3K7qU/epg
 vjLVPVRpvvF8jXoGHJG29RkHgGiX/xP1EGFaQBQOcOChUziF1r271o1+7FahzjthQ1R+Xd5jv
 eXzyNTmGupuLIb54dHXTqk3oYQar5Dhu9QFZIYTKMtPPq1uMsdnEktjlUq5/KRnMe3p3xnlxz
 H1yZc0YR+8hvTq+a+Q9oM/9z/aZN0RDi9ROJeW4YNhc07puOmatclGvobdcsuOrtRh1UwDE6S
 8tpaEgwl72zvmApFWye63KTM9lSjiA/frsZ71lhezryHwbDpJRMsJnLTNncScPeIv38PywLvG
 KR6R2jZVEP9Pay1p5DiluNPlf/2JmRG6faUU5KZ4Z5yk/LsIfAqhEAu6DcmNuGO+mS6J/6yhZ
 DKN/qVNpLd/LyvYgKbGK3J8lLvdWj79dbCsROZrW+OwH7KHlEysgZI06599Sl7kHu0C7mDULE
 vUuqu5hIN+fkjT5SYmp6zonWWMlNB/cDvuVF3kv4vbSoCTNry8LwnRWHEVZG2eUz5cQKX4VY4
 dWUVUesTmwM+Mmh8Mw0ZmkVKe5bm+qwKSLu54ak5osvM2zQ6I62YDv12g0fmYrli56VXRmW+O
 HzoSfq4dEaez4lJdafpkQKgrXyU/CBtTlXzO/MsP17bmO116VvdRzLBWePI5AjvWPo2Q7xJRT
 /diUpSBrRrM0q6DPwUnvSgIOd1z3ptn17GyB9jqicfGSmGdkt51iZ236jfCeeLAAEnGT+GCoG
 m83ILZm+HzF9kqF6VIhW3Uz9jQitGdvnAxorUiACp8bUdjIFuB725sOFI+S29b3lBRkwr9UIT
 h3CrSYb/uAccCrJCQCCM8DuZBztSeEVNzzh9ImKSneUwNeortlIN02HLZfE6uqli14QOFCEtn
 Loxp9wcOo1o6eJOW07Yw==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 78b17621ee4a..880a89835f39 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -35,6 +35,7 @@ config PARISC
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_CPU_DEVICES
 	select GENERIC_STRNCPY_FROM_USER
+	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	select SYSCTL_EXCEPTION_TRACE
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 45e20d38dc59..8a11b8cf4719 100644
=2D-- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -321,4 +321,6 @@ extern void iowrite64be(u64 val, void __iomem *addr);
  */
 #define xlate_dev_kmem_ptr(p)	p

+extern int devmem_is_allowed(unsigned long pfn);
+
 #endif
