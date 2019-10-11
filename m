Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39DF6D357A
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2019 02:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbfJKANX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Oct 2019 20:13:23 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38239 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbfJKANA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Oct 2019 20:13:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id h195so4950145pfe.5
        for <linux-parisc@vger.kernel.org>; Thu, 10 Oct 2019 17:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=l+J574mlC+dRmZJG9pHhpppQFEze5VvTPTaNiTnbyaQ=;
        b=C1PlvZ+0BEdj9jtliX0A0Huqq47ruf9nBVH5STuBjosSplWIN8Wr5Bj0uznajZR412
         88yKrget+DCqKxVlllcxd6K5szWGkcPAUypn6xoncOXOV6R6YV83ztEsCSkeh78n0AI2
         yKxfXdh2vdcul3D71BzoL2J/wyWHTxCQ4Jyq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=l+J574mlC+dRmZJG9pHhpppQFEze5VvTPTaNiTnbyaQ=;
        b=ejc/hnVKdwaMtVFDJVoamPLztUBw2buovzENjt3Uu9D22dxOaijk0wnloz7ir9bzCv
         LRW3S7taXARVkmXRprX+tSS91sVYled/h4SabrM7jpNukl1pHvG6guLar+ECAzVc4ZML
         ckjuJBrBbu0kktkEsAJauHd6CIa/PXbU2gdip8yVnbZJlZYixNi17XgX1TNwMOjfGOBG
         ftoJXh2pHPMygWz8P65fIQ7Ye6R1N8QjDfNqvrEplsN55vj0jl9ssivT9lF6fukBZ1WX
         xkg8UiLG81RdLWHOGzXgM5wU8sDgX7D1d4093HuWqje/o8Hfsoqv0S6AoJtc3nePBQLm
         1GVQ==
X-Gm-Message-State: APjAAAWUzPjYGqgEihlpw40d05f2x3SSBhiRIBgFHeFEg7P2pKbQFyFz
        O6pPD6bigMnxPZzueP9zNzwAfQ==
X-Google-Smtp-Source: APXvYqy4PLu05rX5bRRgJJfyDhm9F1ghOcCs3VwNTK0YfAFFK8MX8ZPUgv1lA3bQ8SclnhiYx4k3qw==
X-Received: by 2002:a63:44f:: with SMTP id 76mr14137515pge.164.1570752778758;
        Thu, 10 Oct 2019 17:12:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a8sm7285998pfa.182.2019.10.10.17.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:12:56 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/29] c6x: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 10 Oct 2019 17:05:59 -0700
Message-Id: <20191011000609.29728-20-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/c6x/kernel/vmlinux.lds.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/c6x/kernel/vmlinux.lds.S b/arch/c6x/kernel/vmlinux.lds.S
index a3547f9d415b..ac99ba0864bf 100644
--- a/arch/c6x/kernel/vmlinux.lds.S
+++ b/arch/c6x/kernel/vmlinux.lds.S
@@ -5,6 +5,9 @@
  *  Copyright (C) 2010, 2011 Texas Instruments Incorporated
  *  Mark Salter <msalter@redhat.com>
  */
+
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
 #include <asm/page.h>
@@ -80,8 +83,6 @@ SECTIONS
 		*(.gnu.warning)
 	}
 
-	EXCEPTION_TABLE(16)
-
 	RO_DATA(PAGE_SIZE)
 	.const :
 	{
-- 
2.17.1

