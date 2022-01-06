Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CEB486874
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Jan 2022 18:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241806AbiAFR3K (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 6 Jan 2022 12:29:10 -0500
Received: from mail-pj1-f44.google.com ([209.85.216.44]:55077 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241807AbiAFR3K (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 6 Jan 2022 12:29:10 -0500
Received: by mail-pj1-f44.google.com with SMTP id oa15so2182650pjb.4
        for <linux-parisc@vger.kernel.org>; Thu, 06 Jan 2022 09:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnERUge+6ed3o5d+QRnvFtDYX6uq9HYYzjAY0J/tNa4=;
        b=teIrprN/QuBHSoPGJWL2o+0x5OC+0fDGC3VBNiaxyCHfWaKpehfP6OQmnkRK8YcRrN
         xGchBsNzgmPAa13/HTaFCy8pP9mpk0GgXBUWFqoYR6MhCViokblSv89QjsCZkz5FNU7I
         UbtLyFPsjpYPM2q7MJGwSOc3h2fL3K6PWCRDF5ay9lONEv0ePtOBhqau9PEt3jweXqhr
         anFZicwJheifYOMzCUHAulkcWSz2vBqt525AnciIGE5cPHPNpOUAN2zGMpl3/TNoM2e0
         4jiTKMxrvOHSN+WOxtId1BllxiIXFbTvp47VtFktYAbo3xrBeyD0SQ9iAkkz6UxTmVFr
         JxsQ==
X-Gm-Message-State: AOAM530/u4kemiKdf9RWoOdGOL2oxsTAf1HHo7edomMUG5fXQEBxz797
        LIDFwGP0xaeNPtyCZOnwt8U=
X-Google-Smtp-Source: ABdhPJyV28n+iWVSp/2h2u2qmtfE0J27+DOyDmV5GxAgThjmvcXMbkHL0SFgCERjVwcZlNccMGmM9g==
X-Received: by 2002:a17:90a:9316:: with SMTP id p22mr9740394pjo.70.1641490149435;
        Thu, 06 Jan 2022 09:29:09 -0800 (PST)
Received: from bvanassche-linux.mtv.corp.google.com ([2620:15c:211:201:7834:87f8:4eac:10ab])
        by smtp.gmail.com with ESMTPSA id 24sm2571340pgv.60.2022.01.06.09.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 09:29:08 -0800 (PST)
From:   Bart Van Assche <bvanassche@acm.org>
To:     "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     Bart Van Assche <bvanassche@acm.org>, Helge Deller <deller@gmx.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-parisc@vger.kernel.org
Subject: [PATCH, RESEND] parisc: io: Improve the outb(), outw() and outl() macros
Date:   Thu,  6 Jan 2022 09:29:00 -0800
Message-Id: <20220106172900.122992-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch fixes the following build error for source file
drivers/scsi/pcmcia/sym53c500_cs.c:

In file included from ./include/linux/bug.h:5,
                 from ./include/linux/cpumask.h:14,
                 from ./include/linux/mm_types_task.h:14,
                 from ./include/linux/mm_types.h:5,
                 from ./include/linux/buildid.h:5,
                 from ./include/linux/module.h:14,
                 from drivers/scsi/pcmcia/sym53c500_cs.c:42:
drivers/scsi/pcmcia/sym53c500_cs.c: In function ‘SYM53C500_intr’:
./arch/parisc/include/asm/bug.h:28:2: error: expected expression before ‘do’
   28 |  do {        \
      |  ^~
./arch/parisc/include/asm/io.h:276:20: note: in expansion of macro ‘BUG’
  276 | #define outb(x, y) BUG()
      |                    ^~~
drivers/scsi/pcmcia/sym53c500_cs.c:124:19: note: in expansion of macro ‘outb’
  124 | #define REG0(x)  (outb(C4_IMG, (x) + CONFIG4))
      |                   ^~~~
drivers/scsi/pcmcia/sym53c500_cs.c:362:2: note: in expansion of macro ‘REG0’
  362 |  REG0(port_base);
      |  ^~~~

Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 arch/parisc/include/asm/io.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 0b5259102319..837ddddbac6a 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -273,9 +273,9 @@ static inline int inl(unsigned long addr)
 	return -1;
 }
 
-#define outb(x, y)	BUG()
-#define outw(x, y)	BUG()
-#define outl(x, y)	BUG()
+#define outb(x, y)	({(void)(x); (void)(y); BUG(); 0;})
+#define outw(x, y)	({(void)(x); (void)(y); BUG(); 0;})
+#define outl(x, y)	({(void)(x); (void)(y); BUG(); 0;})
 #endif
 
 /*
