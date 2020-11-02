Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7B52A29D8
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Nov 2020 12:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgKBLsM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 2 Nov 2020 06:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbgKBLpw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 2 Nov 2020 06:45:52 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757E8C061A4C
        for <linux-parisc@vger.kernel.org>; Mon,  2 Nov 2020 03:45:46 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id y12so14218371wrp.6
        for <linux-parisc@vger.kernel.org>; Mon, 02 Nov 2020 03:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t4/hDwsvOptYgItp/Hg6I8g87o5PfiaXnk0Gr30j7xY=;
        b=IjD0gMxmeBMbl5Fxzs/adRvcFXbegxhnhe+EHvQBBVselVbzpYWyxza1xqm+HgVhMz
         Res+pm/vli1k3kxnF1AwcnrKx7OT+cI9CfKhWsxTUI8PKndeBGAr8JL9xUquPHF8b2/A
         ihGFlslj18W1noJW0ZGPuS0R+AvcIu2eTRYrnS4GN304H691qpO+Occf4Bvpv+hZ6nvv
         OI6K46SbUH3b2krhX6/UArGwBHsDmduwsZNMEbOCF+5iMLqtBbO7zeqXVjsXwH9Fyrvk
         SNAjxKcUsOfFcrUvl4x3jw52blAukAR4dRzDaD7swrOge33TIfD8pra6vrCxWayILnMm
         aXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t4/hDwsvOptYgItp/Hg6I8g87o5PfiaXnk0Gr30j7xY=;
        b=P0R83bzM4n0jkhKGZ9pV1ZjJ2dlMiouW4nOq5SXWZ7o7wva6z8iFhYnj4pPrgEGvxR
         sOF7OsfoUGbuC9jANMYMgtKYEavS+X9oEoahR8kZuBqXKLDgwLqm+p86W8HcSEdV18ad
         ZdnfKrG7vqhNCybak18qo3PeC7JvKl5eAscdUg9t64y3Ws7Jf7eEF7vH+UZT+cEDC461
         ZkAs588jp99r2DNCFDZECTZIcWzpyY7ANEBlol49w882vIZeFtLbWBDjU+9KpX91I0Ub
         O2NhTRPl8AGrEsSnlZDGuP1lsugf210LdQziZGy5C1ol4R+BnuAj6e5WXtcs8abcEqs1
         H6mA==
X-Gm-Message-State: AOAM530CTpj1eFdeA2mA4oijJUK/vBZrGTqQgAl8AkQEUqDdPAH1z3Fa
        uW9miX7bn+8yXOVNTbQJvlrRoJL7KXXmsA==
X-Google-Smtp-Source: ABdhPJyCgVL1JXYgDh/fD+3/EbFSvF9TbeAHn7Rmj+Ae+8dMfP4pXIDM8+T2FvgZ7NsyMssDD/cTGQ==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr18352866wrm.285.1604317545189;
        Mon, 02 Nov 2020 03:45:45 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id g66sm15545352wmg.37.2020.11.02.03.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 03:45:44 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     davem@davemloft.net
Cc:     Lee Jones <lee.jones@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [PATCH 21/30] net: ethernet: dec: tulip: tulip_core: 'last_irq' is only used when i386 or x86
Date:   Mon,  2 Nov 2020 11:45:03 +0000
Message-Id: <20201102114512.1062724-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102114512.1062724-1-lee.jones@linaro.org>
References: <20201102114512.1062724-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/net/ethernet/dec/tulip/tulip_core.c: In function ‘tulip_init_one’:
 drivers/net/ethernet/dec/tulip/tulip_core.c:1296:13: warning: variable ‘last_irq’ set but not used [-Wunused-but-set-variable]

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/ethernet/dec/tulip/tulip_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/dec/tulip/tulip_core.c b/drivers/net/ethernet/dec/tulip/tulip_core.c
index e7b0d7de40fd6..94f615869827c 100644
--- a/drivers/net/ethernet/dec/tulip/tulip_core.c
+++ b/drivers/net/ethernet/dec/tulip/tulip_core.c
@@ -1293,7 +1293,7 @@ static int tulip_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	static unsigned char last_phys_addr[ETH_ALEN] = {
 		0x00, 'L', 'i', 'n', 'u', 'x'
 	};
-	static int last_irq;
+	static int __maybe_unused last_irq;
 	int i, irq;
 	unsigned short sum;
 	unsigned char *ee_data;
-- 
2.25.1

