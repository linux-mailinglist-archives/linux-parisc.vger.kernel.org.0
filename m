Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD06A44F8EB
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Nov 2021 17:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhKNQMn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 14 Nov 2021 11:12:43 -0500
Received: from outbound5e.eu.mailhop.org ([52.28.168.19]:16273 "EHLO
        outbound5e.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhKNQMi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 14 Nov 2021 11:12:38 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1636906113; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=ZsGzM8hFVU+u99OLxclH3SZOye+bHN2uZsEg+GSo9bBZTYI9wkNTEs+HfJBeMEAefDhDM5c1qhdoA
         mnyuk8F9dZHqAmgV2egLUYesf5oCjgcCgKLc8xHF4HmFh19oxyinAXgDBp9+m3TcIno2ETBXzWb+Xz
         dr1ruLSJpj5D0GuW9no+6/kEmYhEw/jVG4rXItvlu56OSyFw4/ryMpGtfMpYnaxvVsHoN7bkc5BxxM
         os6HU1BARnArL6B6tiowa/qZhjZOaz2JPn3PeXnDg6eNIA/fTKTkCd5/2CpjSEz8qFtqaGubps+6PF
         C9XjYinDjvHiny0PwkaVJDk6q1eaUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         dkim-signature:dkim-signature:from;
        bh=eWAMjGDEcY7knDe+8FxWdgWrfdVZ5CDAHl+JU7Z95Xk=;
        b=Rl1c8KHvCUWue1VEcLmFkD7ga2JryvTFzQYBEM1+m2Ky0JN8WD6rjmjkc0Fr1tspTCoSRh7l6car6
         IqZoGJYSyyee57x/PjceuCqxPU1kpRKN5+tpRezcH1u9T6h9BHkDDRFjFtPOKpYFOpUXOusxvQdJlV
         MiM4qaEni2Sr5R69vy2imIiOrG6uip5zXPqry9rPWVRzMNr56YU7UTfrxboGwd+dYm9sG0Uoxs6vzG
         v8Dvg9En+tt60o56dD5IzqDBhOxjcCoLxEKLdGQ7ODBsRHEXI4Gfj3JYUh4LCYd/NticmrJzq+JW5r
         KE3pGYzSlM6C/Zru8v6ghz8M8p5kVEw==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=eWAMjGDEcY7knDe+8FxWdgWrfdVZ5CDAHl+JU7Z95Xk=;
        b=WucSc1gdmkT5OYwEh0GdvRKilmkD3or13n8T0hrHW68qWjF0PEV+yprDJdVvWijEmg/FP5cVPOh4u
         yZMOSIFkYQXNxFmATvxEgIQkcp1GMz6DJ/NDI6B98HCMvW3oOD6/rKPFGZQnKEoUZ49bMGnFeBEgwH
         FuSOXXJ9tDURDaJw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=eWAMjGDEcY7knDe+8FxWdgWrfdVZ5CDAHl+JU7Z95Xk=;
        b=AHgZaIZfwf6uaqcmEs1owi5t5/NldpYLoHYwMT0SrAXoZkFPtHbmadrm7UT0glUoNRWZFxbfh+w2K
         HsQBYmu5KuGSIwHpMIVVCTiHjV6bqFRmhIqg7yd6l1i3JZFJY3sd0iyZzCVeNkZVPZMR1LlozO3p+T
         kF5B4G+g2TzWyDwDgtvescPRGCVOZSMQ6G8huXT+ul6pbNGk1vBAQd1DfbtWgsxU1lyRP4yCXSJygn
         /Jzw1MV9Jmxec8OT8aVSmmAVKd0Ck8pgGYLasoue3JdSKHnm2Uyfef9r+8EvD+s476eU2/t0KGKSCf
         TSgkKcjxbfVjX78bVvYYB57oFPnow7Q==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 1beede59-4565-11ec-a072-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id 1beede59-4565-11ec-a072-973b52397bcb;
        Sun, 14 Nov 2021 16:08:30 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by mail.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mmI3R-00EhrF-Sb; Sun, 14 Nov 2021 18:08:30 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc/sticon: fix reverse colors
Date:   Sun, 14 Nov 2021 17:08:17 +0100
Message-Id: <20211114160817.6088-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

sticon_build_attr() checked the reverse argument and flipped
background and foreground color, but returned the non-reverse
value afterwards. Fix this and also add two local variables
for foreground and background color to make the code easier
to read.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 drivers/video/console/sticon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index 1b451165311c..40496e9e9b43 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -332,13 +332,13 @@ static u8 sticon_build_attr(struct vc_data *conp, u8 color,
 			    bool blink, bool underline, bool reverse,
 			    bool italic)
 {
-    u8 attr = ((color & 0x70) >> 1) | ((color & 7));
+	u8 fg = color & 7;
+	u8 bg = (color & 0x70) >> 4;
 
-    if (reverse) {
-	color = ((color >> 3) & 0x7) | ((color & 0x7) << 3);
-    }
-
-    return attr;
+	if (reverse)
+		return (fg << 3) | bg;
+	else
+		return (bg << 3) | fg;
 }
 
 static void sticon_invert_region(struct vc_data *conp, u16 *p, int count)
-- 
2.33.1

