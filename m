Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E33751D6A
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Jul 2023 11:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbjGMJiH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 13 Jul 2023 05:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234040AbjGMJhz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 13 Jul 2023 05:37:55 -0400
Received: from mail.208.org (unknown [183.242.55.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1912689
        for <linux-parisc@vger.kernel.org>; Thu, 13 Jul 2023 02:37:49 -0700 (PDT)
Received: from mail.208.org (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTP id 4R1qK70rr6zBRRLX
        for <linux-parisc@vger.kernel.org>; Thu, 13 Jul 2023 17:37:47 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :references:in-reply-to:subject:to:from:date:mime-version; s=
        dkim; t=1689241067; x=1691833068; bh=ffg9fpOGNhSuyyvfjkJBC7SqF9T
        qN7dHnY5U6zzt5gs=; b=cvcMze1BmjvlIIbs1hW7zh9pL+gPFO9xpa2C5lZzF77
        ifVMqkAKmdGfxH+4nBpqzUGGdRomLgUURNZ5oCiqwtzz5E03YtKOppuToRTKPIMs
        FGoq+bzeQcq1LhExrXoaNYgSwWEGULS2fcqC2oT9bwjPTH9pt7xDYxtUe5Q2ebue
        s8HqpbQJN4uWywUa5YyonqGETRUPSiWUmS2OUhXXKTy6rewNQ70+igCaBRi6lsmP
        GecYb2USSwBpGFrPDcK7l7fZfHC/HSNNMhg+3MywMbnrikR4Bo3xjKfPOv39pFM0
        zyxtZyK8a4a9v6c5/03H5oYEjIZKOxyRyGEwun+1z+Q==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
        by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 9i_FCoucNcHh for <linux-parisc@vger.kernel.org>;
        Thu, 13 Jul 2023 17:37:47 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTPSA id 4R1qK66CMhzBHXgh;
        Thu, 13 Jul 2023 17:37:46 +0800 (CST)
MIME-Version: 1.0
Date:   Thu, 13 Jul 2023 17:37:46 +0800
From:   hanyu001@208suo.com
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] parisc: math-emu: fcnvxf: Add space after that ','
In-Reply-To: <tencent_86762B5284E20421D8A676F4CC1B205D2F0A@qq.com>
References: <tencent_86762B5284E20421D8A676F4CC1B205D2F0A@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <a2ae26be540da062ea4912c36962093b@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE,SPF_HELO_FAIL,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


Fix Error reported by checkpatch.pl

arch/parisc/math-emu/fcnvxf.c:99: ERROR: space required after that ',' 
(ctx:VxV
)

Signed-off-by: maqimei <2433033762@qq.com>
---
  arch/parisc/math-emu/fcnvxf.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/math-emu/fcnvxf.c 
b/arch/parisc/math-emu/fcnvxf.c
index 6940179..f5f9376 100644
--- a/arch/parisc/math-emu/fcnvxf.c
+++ b/arch/parisc/math-emu/fcnvxf.c
@@ -96,7 +96,7 @@
                      Sgl_increment(result);
                  break;
              case ROUNDNEAREST:
-                Sgl_roundnearest_from_int(src,result);
+                Sgl_roundnearest_from_int(src, result);
          }
          if (Is_inexacttrap_enabled()) {
              *dstptr = result;
