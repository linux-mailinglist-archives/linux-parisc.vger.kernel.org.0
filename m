Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD794DE3DF
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Mar 2022 23:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236473AbiCRWFh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Mar 2022 18:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbiCRWFg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Mar 2022 18:05:36 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2001697A2
        for <linux-parisc@vger.kernel.org>; Fri, 18 Mar 2022 15:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647641049;
        bh=5IAtAKi12u5MDJHsXTpUpDL4a4fQBfHjxrWTMabEcEM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=I0V7dnLqrtb0ahw2oY45UXvdGKH2BTxfpavK8HvIGzHfX5no6TggERIWZdu9TaCvs
         COazb/iqVO2PxLRdCC18M9EnQt+7rM27nLfgmfLuj2WeorFJ4LzS8hXb27Id3aCDCB
         25zhPFx41ZuQahh9JyWrDzWLsduGIM+3drHnwkMU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.186.189]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDywo-1nLTLg3PzI-009uEz; Fri, 18
 Mar 2022 23:04:08 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Avoid flushing cache on cache-less machines
Date:   Fri, 18 Mar 2022 23:04:07 +0100
Message-Id: <20220318220407.58621-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nuhG4cisE+t957jrE34mxzHappbeRSLjyjeD5yFrhWJAVD17tP8
 AQQ1YQjMWRVTHhoKSiwneStLDK9khA+EDfk7iScONYXbyi8Rjr3pRdQgODMKRInz7etkRYT
 GHlk6juKmfMbG4NxMb2ycRvV/ofeBvFy0zkF8/aPY5vv/QMASvg42XsKHOXtqKhojYLSr7g
 Glx3efdJYfLA06XmWwSuw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ilHYAcFXIhw=:dSXec35q+6K4VNuY6/euAO
 9DCo8XpiNKXzOb33TnhgYbRsIXFbMtAtYdPNSPQAVh3uuP5CsRcMIMHSUwm7Fi3buTcuafnYv
 KbVzFLrPTomAOA0E9p/GyD21ABuO+iQqG0itdakFbPRtM535OnhLogXyg2OOLL3PUV0bcB8U5
 HWbIHq4NF7rWuKAd2RAIDvsjea9ZQNCArNcGsFYF+DM2B6HJW1Aegns+1W82/bnZwngvOyu3o
 BFn4mkf6Z6hmAJ6++RpMIB837X1ND7FBtXJIbVCgFWQ3AQCpJikR947xkPNerPkYc2ewwPA6x
 Ir/N8WJsje96HgtjA06XRAWyOXa628Fj1+rNhQx6uhLbihEoEV2YJGJuUb/EsPL0hp9GKl1N0
 YghPYBVmwnyk0spgIcEjB/FaXH48vtqzAKWWFWzPxamv2XBvkVxuP5lmCWfRJGcBqbTsinUF3
 iIrWQpt1ju8UdNMzY6djk+l76VAl+XFi7TMG3Bd8BeZ4XNnHYZLhVL9b32ctBfeJlJhHo6tWr
 6+4FOphQlkEbfVvw9UkEqsqT2LzVXvWDC7p0L31BxhibLXwDHvgltMRgPEALqiA9QKo9BAV0T
 6t9lePU0N8UibbBnM8xLFXSoo0DVQq5/AlfhldeEVzmRMknZNA7NpFWJRFP09VzI8uPU1eKJ4
 Sxlm+/wZjfpWtRnH0ap7INFDU3L+fv9V/TYCTqfExfFIx2kUyL8lSsAHFVmrvj9vJWrFespSp
 GdhL8NBc/vC60exwzjCHIo8q2jwdFfm6hfGSRJHFJZuxsK7vXysSchTqN8H72WSVyfd4QZ8Jf
 hR96edIaZD+STF4gHsefdxxvYxVwmovG0GgVGmq4N1iULLW1/63eof4G2yEXeUSoIKa1B+4g8
 wGkQ2a0a/tuPNlL7X13WSawamsxJBzCMaTl3BWk+GN8Zc3+tPn7pgmZLARGcyBoDORGQHrIiz
 oBkihu/mg0LUjY17IUnYaoCqXAAtaBOf8+5HOSk5ZG1YRXdd66bYo1XOBYTyePzDQvE4iLknE
 KDb184PpB7DABs4eorIQp5ARVeAbnWkTgyfUvsMcYBUiP8+dH55Iyz+M+JTIJYWDvUHE3MZPS
 y2ppVBR6iVhSp8=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Avoid flushing caches in __flush_cache_page() and __purge_cache_page()
if the machine hasn't data or instruction caches - as e.g. in qemu.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/cache.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 231cebb3fc0d..d41fee3a9874 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -315,6 +315,8 @@ static inline void
 __flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
 		   unsigned long physaddr)
 {
+	if (!static_branch_likely(&parisc_has_cache))
+		return;
 	preempt_disable();
 	flush_dcache_page_asm(physaddr, vmaddr);
 	if (vma->vm_flags & VM_EXEC)
@@ -326,6 +328,8 @@ static inline void
 __purge_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
 		   unsigned long physaddr)
 {
+	if (!static_branch_likely(&parisc_has_cache))
+		return;
 	preempt_disable();
 	purge_dcache_page_asm(physaddr, vmaddr);
 	if (vma->vm_flags & VM_EXEC)
=2D-
2.35.1

