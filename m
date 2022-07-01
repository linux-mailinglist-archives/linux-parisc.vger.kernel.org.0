Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67B66562C2C
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Jul 2022 09:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbiGAHBB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 Jul 2022 03:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbiGAHBA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 Jul 2022 03:01:00 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF69599D3
        for <linux-parisc@vger.kernel.org>; Fri,  1 Jul 2022 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656658844;
        bh=gi6zmtLjngw4kbZMieZfrTLbDpwfvLKQS8JlrOhGoQQ=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=PB/Xaz/VfcMwk1WvkwlT5Sd3+k/Hmk229+2DiLaK2EUiCGIvOCMEBU0UKdjCpuGyY
         TLxVAV3/NtQ3SyG3UqeJ2/RWAqqx0IiVDC9ZWZlzG6QviwCsmOxmtghtgFVEnKsEek
         VdtGxN8uro2RjtejrRAGvyfUQ+yzE/Jm6ywDCvEc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.182.192]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzyya-1njRDm3CiM-00x2L0; Fri, 01
 Jul 2022 09:00:44 +0200
Date:   Fri, 1 Jul 2022 09:00:41 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix vDSO signal breakage on 32-bit kernel
Message-ID: <Yr6bmeu5/eOXn3Cg@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:1wz0SH05ukC1JY0j/ofvfmVVUkXoec4HaWn4BIOLhhCdzsdMV/E
 gHoKBIERgT5wnN6nI2xNL4Euayl44MOqnlr4+/z5vCjc1xJxI1D62LufVZf9K61lWUwonsC
 9aArLkO+9p70zbOIxw5IgX7daH5bTPtXGovdfawu//B8WSfswHToCM16dQS7NCa4QpOkdH8
 QtCWIfQMMPV5wXy5hzWEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xFtXvTxNyiw=:aO2nMIbNOZxNkfVgW1jyw6
 AU8J2ZWluVczgnZjIzocwaOZBd5C/etYN+AWcNKbso6MGOGkDitJ/7EU7mcG5DC0maHCOtvhR
 HLq99Li96oKFDduPoZ7mCKVf/D19nKTRM5Mo/aNjX04sEiwYM33EpoN88Xfusqe4MskHILMfh
 8hOfu9hcO54XZS3U2o852DwpTveaqgtqxs4trmQ6ZG6aXv8JKDRA7ykl55Cl+kr1SutbDrWFg
 pIT9vwROxzNAJEPGRqeLAWxKTf8ueIWsFjpuHugm0L5QOeVF0ujnShWVmge/3v3vGmBXa/uLM
 +MPNFFY95cP6CKd/xvA57usnnuQEJuv0l+gMBZYzljSMYb+K8G891nEQp9PMm50FqYOKGakMv
 QWcXTiFukJz9zD27jHyrLzW/tqvaNICriv3b9Ilv+kpqcZreWWEvQ95wu1g2OhjxQ+1CAzvEh
 cY7UvTyZ/Z6pSmpjeKKdwj1TWbxlMk4Wn1M0/o4M1jEZBxPzIecBERVWBXuL/KDN1jRXZ+ApL
 AiwMIscujy2R+EzgUhr4kHDYqK1uOyPCDXVX6ixWj4wjqwmgp96KFvg2sIWJmgxRtaEwuNZi2
 THSU9dU5KlEi7ox1oqvjLtoHiskUWsZkpaAx4M7tvbdFfkUBN0NYtMGvG+FG7LIjFvT1ip4s0
 kjjeUly3CXhWoxzVIrc0z0rjuxwv0JOLUqtbGks84FVAFWOlV/SDwfQ0Jfev7fJXxr7Q1uOy7
 VHa8NSZPrVs7bgiNuQnHxfo3zi+ifW9JLuW6bMNvvpLol0kpgMFv4Z/5dKRqcVTMD92HUZbTj
 UfcS7wLOrRMkJ2Oc1bbzEDbu7kzegv7mZo7uOZW/5SsFl2fwR7n6d6m28dQFzVdu9JU/t13LM
 xZoIS9F7L2L9efAKVoB6KuaZYfZTt2hPXKGu1dXERs0geoNmb5RtCCkYfKeEGA6v96uEQ0hum
 rnO9ajC08e5jeIc5RY9gDhq8TEEuEXllBuv6JoNHq65AHskCsA9UW5W4jgjhkUIon6djE7Upi
 qQTwl+gaVQ3IMG1ah70+1DmsqPvctx+4i+U9MUJ5ueA4U8MV5slQVQB0wedlMtQcRO4H0fZhW
 qhRBlxttPQDtaKOSBFHQ3R+a887DNokph9ZZHbAAYVlzhWXBxqxJvnw5Q==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Addition of vDSO support for parisc in kernel v5.18 suddenly broke
glibc testcases on a 32-bit kernel which used signals.

The trampoline code (sigtramp.S) which is mapped into userspace
processes includes offsets to the context data on the stack, which are
used by gdb and glibc to get the correct data.

In a 32-bit kernel we used by mistake the offsets into the compat
context (which is valid on a 64-bit kernel only) instead of the offsets
into the "native" 32-bit context.

Signed-off-by: Helge Deller <deller@gmx.de>
Noticed-by: John David Anglin <dave.anglin@bell.net>
Fixes: 	df24e1783e6e ("parisc: Add vDSO support")
CC: stable@vger.kernel.org # 5.16+

diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index 2673d57eeb00..94652e13c260 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -224,8 +224,13 @@ int main(void)
 	BLANK();
 	DEFINE(ASM_SIGFRAME_SIZE, PARISC_RT_SIGFRAME_SIZE);
 	DEFINE(SIGFRAME_CONTEXT_REGS, offsetof(struct rt_sigframe, uc.uc_mcontext) - PARISC_RT_SIGFRAME_SIZE);
+#ifdef CONFIG_64BIT
 	DEFINE(ASM_SIGFRAME_SIZE32, PARISC_RT_SIGFRAME_SIZE32);
 	DEFINE(SIGFRAME_CONTEXT_REGS32, offsetof(struct compat_rt_sigframe, uc.uc_mcontext) - PARISC_RT_SIGFRAME_SIZE32);
+#else
+	DEFINE(ASM_SIGFRAME_SIZE32, PARISC_RT_SIGFRAME_SIZE);
+	DEFINE(SIGFRAME_CONTEXT_REGS32, offsetof(struct rt_sigframe, uc.uc_mcontext) - PARISC_RT_SIGFRAME_SIZE);
+#endif
 	BLANK();
 	DEFINE(ICACHE_BASE, offsetof(struct pdc_cache_info, ic_base));
 	DEFINE(ICACHE_STRIDE, offsetof(struct pdc_cache_info, ic_stride));
