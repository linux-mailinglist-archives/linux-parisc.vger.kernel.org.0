Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38EA44110C
	for <lists+linux-parisc@lfdr.de>; Sun, 31 Oct 2021 22:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhJaVil (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 31 Oct 2021 17:38:41 -0400
Received: from outbound5a.eu.mailhop.org ([3.124.88.253]:60603 "EHLO
        outbound5a.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbhJaVik (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 31 Oct 2021 17:38:40 -0400
X-Greylist: delayed 2763 seconds by postgrey-1.27 at vger.kernel.org; Sun, 31 Oct 2021 17:38:40 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1635713403; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=B+nTsdhpJ3fBsviOhaQFS9u/J1W/TH3oRveQgSOiiSx8qoyWvJh7FQv7kN/0vnCy0k2r6R7RydkTy
         BqA9a7pyKiQBJpyqD+AwPc1TsiiGeyEKxFd8UCgqRsAPt1maIIszlENd3f+LtzvSkamPUN2L+Gm5jm
         97+Dth9nXtUX7l4RfnycWQNwQ1lSPEC58uQp936FH86cQTqKHeTn8iBzXLoySQbCB5/be45uWdzPfl
         WjBKBL1K2dLXfGUP9EZfBJJtjPU/VLnZC/hJmpoOIcBtRdhDoc1zkt4QpNTsyoSm3/uxolZBoqOiTi
         7vjGU9+Oov3Ik0vLGhlaDpD+YJTFQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         dkim-signature:dkim-signature:from;
        bh=cQubjF0EXvBYecW2Artnyksm60phdJubB+Np+jtGM9g=;
        b=MqkbQNlXu/fBysmlmOF7XiFGW8kVEMSy/MDKD+pu1sLnmTWb/T/qIdnjS0vIApZdrN6dQ6Wfc7mKm
         i1B4kKpZbj4W/WEIlS7ooiMWAasPc+RgEvj6byg4qHgjHUjbt3xbZFmGHn7iHEPnL74aebamwXyVRg
         nHnVNV6EXhSEIq9yNeTYLpiU+t0uOiWnWfsvwxBQRYNQ/sPLSwhn2nVCswp/DWo3zK83U+3xTMYRJ4
         dJBpDJLHn54ijeXKynaTk2NVhcC58kRdz94eQPGedNOmD8nmJ3kYlrL00D+E9wb0i78M3rlqLozPxf
         Ji35VMSC89bf7mPTuN6y1tKNlWsz1fw==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=cQubjF0EXvBYecW2Artnyksm60phdJubB+Np+jtGM9g=;
        b=B2p+cwH7dlEyf9JsSXKxQ4cIElh2cczytZViWdn4xQtrYmxn9RI8sie+zRAvq/AW6JJCLD56yCZj3
         JiYlox+wneJQOQq/1Z8Bu0tMOWPC8i1DCB9Y93Q7achIDrjKi/XZygLOwBfvbvBR+fEe1pp5aDQKSq
         rl52IvwjGNQmYo4A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=cQubjF0EXvBYecW2Artnyksm60phdJubB+Np+jtGM9g=;
        b=PPyXPNmQtBzYwb1IpeHPD4DRNPBMyNRYRB8qjqgBtiesLTc6UeGUHpmW1UttTp+8Ym+2KhVbc1CrD
         9uLrglrFDKuYuSiJfs8/iW6vuAULXg33hPIxp8wWkV41umOTRza3r3r50aFmiUPh8dDY6lZEoYzVkO
         goq8iP9k+wHySbJiee2BwBG9Mm51hhjvNmpuCZtrfC+UE83fSl3unVkqmBHS5sFbIqFbeZRmO1Deuq
         gV+axAvmlDkrAg2C49CB0cZmU+7NpGbJC5jlb60/JtzK27w8Vn6a74HxKO3tgI8YKRGnyo8FcM7iwe
         g6anjucEN8c5SL6Bl6dpMfFTQWJrWjA==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 1db5e0a1-3a8c-11ec-843c-95b64d6800c5
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound3.eu.mailhop.org (Halon) with ESMTPSA
        id 1db5e0a1-3a8c-11ec-843c-95b64d6800c5;
        Sun, 31 Oct 2021 20:50:01 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by mail.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mhHmC-00DEq0-FB; Sun, 31 Oct 2021 22:50:00 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: 
Date:   Sun, 31 Oct 2021 21:49:51 +0100
Message-Id: <20211031204952.25678-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

i wrote a fbdev driver for the HP Visualize FX cards used some of the
PA-RISC workstations. It utilizes some of the 2D acceleration features
present in the card.

What is working right now:

- modesetting (tested all VESA modes between 640x480 - 1600x1200).
- hardware cursor
- 2D acceleration like imageblit and fillrect.

What is not (fully) working:

- X11 with fbdev. xinit + mwm looks almost ok, except some corruption
where the text cursor was drawn when it is moved.
- more advanced X11 programs. xfce4-session doesn't really show much.

I would be most interested if people could test this driver with their FX
cards and report. I know that Visualize FXe doesn't work because it uses
completely different register addresses. For FX10 i would hope that they
share the same register set as they are based on the same architecture.
Note that you have to disable the sticon driver, otherwhise that one would
hog the PCI card and visualizefx would never be probed.

Not sure about FX2/4/6. Might be different, might be not.

I obtained all the knowledge about the registers by watching what STI and the HP-UX
X Server writes into the card. So the register names might be called different
compared to what HP has written in their data books.

Sven.


