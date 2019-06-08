Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C953A0F7
	for <lists+linux-parisc@lfdr.de>; Sat,  8 Jun 2019 20:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfFHSE6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 8 Jun 2019 14:04:58 -0400
Received: from mout.gmx.net ([212.227.17.21]:40103 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727220AbfFHSE6 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Jun 2019 14:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1560017095;
        bh=G4XROv9O95ldVl2afem0cmrBKF4gz3NZgbP2rsFrb5U=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=V9I8db8kAz8s1hv7U6t2ctyN5Du06waZ9RTj02cp5gyBSvnrEKCJVZaTPe66Sdkk9
         KNs0VAI70yF8YhRX6QZSZcz81NPeVRzJeHPW/xo1rne0EHlUzqGP6Ggc5MDkWAgikl
         5yttoey9IhQD6ns241FbjfQHg6ur+cB0Mc2emJnw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.188.248]) by mail.gmx.com
 (mrgmx102 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0Lkiqm-1h1RLu352C-00aZL8; Sat, 08 Jun 2019 20:04:54 +0200
Date:   Sat, 8 Jun 2019 20:04:46 +0200
From:   Helge Deller <deller@gmx.de>
To:     Jeroen Roovers <jer@gentoo.org>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>, hppa@gentoo.org
Subject: [PATCH] parisc: Fix module loading error with JUMP_LABEL feature
Message-ID: <20190608180446.GA18954@ls3530.dellerweb.de>
References: <20190608145201.56c667f5@wim.jer>
 <f3b34093-1b01-f321-3b98-6708cdc25434@gmx.de>
 <487d5cc9-742b-82f1-604c-f24848c1580c@gmx.de>
 <20190608164914.1b8d546f@wim.jer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608164914.1b8d546f@wim.jer>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:3N1t5S7hv6LI/ZJPDKw8m0sciNv66OswcUzu5C2zOJ12rIIY0Lo
 3ibKOMzFiPw1FDwJzoEl38EIn2eZfU4/XwwUpBDR/x4KzMGhIECyPZ0ryzuivJD0SnHVqDW
 rIGByAMCgINNvBrjYVmccuseZaQL4L/FXSXBrA1Chg/c+e76PD3QH98unbObziAwPVI/D4t
 qj75jspB250DO1AWU1Yhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+AUHy1fCm9w=:tvL7Br6bZv87ZSOm/GA+ad
 gf5npAZJVLHjQyv/Nv0BBjo1Q+6RgIJoPgCCmw3FwHJNdzjryMdLfMD/6i/NaUOd06V9OBiRU
 gQ3Ul+i4q2/2+Bn/a+BGwFZk1VlcgZN+ml/n2n20DEOL5jelCTdraqIezPbdvuOhlSpUWqu1W
 R1SHrU9jgAj8R/SUGIAPSLfK9mWKMM7ZY/gUkY6qKkCY/epxKlD3RuRqq0U31EXx9DCLgnCA+
 cxysFcd/5CULeojNbkgCGpMQtQECiRulxUAE3WtTkXN8qxE1YMs/rk1emKcj3dz1ADkQ3stV5
 Wap6cNZz80QX9PCEJ00QE4OnSkE/5I0A1VFd3Qsf4nmCgtRfxWvXeNFxEP4SQ8QNwuDnTg6n7
 q7fiG42HSrOq9JllwOodhTIUfDOyb56cNeevQtk4yoNVJhCE3ZZufNDkr2sYY161iZQ8AxsDx
 rGluCiXBHiF0xy948Aj2XPUaDEYC9hKdVTtb3ZHjYYRA/2V+g1d/Pf8dNIQQraVaHYu5w6RbQ
 4aOedMVHot1bVAg7mJrf/ZdGK0FQyGd8X9ly6okcc0GkIrFrp0JUtxvttSv2dbwb4sSFaEya2
 dA2+KW/dFHPCvfPoiEo8JAHHRykkDASCYVYAD1HWHXa0Trd7Hl16qHs4g6JuC9DvJ82e1Px6A
 QPerkIOAdr4mtJpLqNKQuewJtE7YmASs4SOR65YEAUTk5iQH5CYYefjOFVi1HH4AHe8PL+w2a
 KahXPRiw6ZcbNp+nnJCh8rBMhRGsmCOkQQjzS6St9s/CKL5LpmOmgSseNofKY9fxEYswcD8V9
 vzOdB3TSZvbm7pWx9l676QQygFT1FDXTOtQquducLZJO/mMGgjKnttpgoBWfY5cAkTV/o8xl/
 /cNqisjC9HIzNPAwCfC/dIjcF9SqvOqPRtAImO3LLymwglgXviwtXqwsmVTsQs4wdF4AtpGft
 bl+TN1paRxKCZu9VlHGgzt5F0dvlvN8x/rd1Xk9vjZ7j6RZCuroNX
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Commit 62217beb394e ("parisc: Add static branch and JUMP_LABEL feature") missed
to add code to handle PCREL64 relocations which are generated when creating a
jump label on a 64-bit kernel.

This patch fixes module load errors like this one:
# modprobe -v ipv6
insmod /lib/modules/5.2.0-rc1-JeR/kernel/net/ipv6/ipv6.ko
modprobe: ERROR: could not insert 'ipv6': Exec format error
dmesg reports:
module ipv6: Unknown relocation: 72

Reported-by: Jeroen Roovers <jer@gentoo.org>
Tested-by: Jeroen Roovers <jer@gentoo.org>
Fixes: 62217beb394e ("parisc: Add static branch and JUMP_LABEL feature")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index f241ded9239b..1f0f29a289d3 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -786,6 +786,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			/* 32-bit PC relative address */
 			*loc = val - dot - 8 + addend;
 			break;
+		case R_PARISC_PCREL64:
+			/* 64-bit PC relative address */
+			*loc64 = val - dot - 8 + addend;
+			break;
 		case R_PARISC_DIR64:
 			/* 64-bit effective address */
 			*loc64 = val + addend;
