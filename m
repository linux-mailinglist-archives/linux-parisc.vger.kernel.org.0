Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAF8C7AB76B
	for <lists+linux-parisc@lfdr.de>; Fri, 22 Sep 2023 19:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233029AbjIVR3n (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 22 Sep 2023 13:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbjIVR3S (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 22 Sep 2023 13:29:18 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2765CE1
        for <linux-parisc@vger.kernel.org>; Fri, 22 Sep 2023 10:29:10 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-27489f78e52so1763338a91.1
        for <linux-parisc@vger.kernel.org>; Fri, 22 Sep 2023 10:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403749; x=1696008549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSa6oULDCwttnYj/UXkUGWzp9s7+1yQ+R9ugGfGb1B4=;
        b=W12qSJ2a5KmiFisUjHH7hkoQcfR59dH5U/g5DqfnK1X8qgWD7FJWHpvRjlyO3L06wD
         etWMl21Qgyl4m2ghvH16fNsvkac2IlGdqgg0iM/ab+qHVxMkbqYgbuJ+tjrVxBZ9Qede
         QVQcA9jLn2YqAKcTCwMx6gNG1lG2eObrAU6Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403749; x=1696008549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSa6oULDCwttnYj/UXkUGWzp9s7+1yQ+R9ugGfGb1B4=;
        b=irpJDQ3UG46Skw4hhg2Oc78SmIDK96HTU7rmH7q5niMxHa/33uexsyv3pfmN3oF5Rc
         lH+IARtFfbhyxHsdIHwl8aRjeAlddmgKRwkqryEFxb/mGex74RTHHVZm6NPzR526BcVJ
         ydI8Y78HgB9VmaBOZdUg5aqhw1zxhcK6/cGiPuDwZOZQtyGJgqaNok29mGKbSa4smzhg
         0TaexOs+b/9XbNhzkvkEqXY6m+0K8q3308H1LHHDrWBxjKjolvKOai1nszd+W9Cifz+q
         DpkeVJcTKeG3+BftYqHrWFzmJrUBS30DIrOH/PvlPogWZmM6M6GKuTX6R7HbaeNwknep
         x+iA==
X-Gm-Message-State: AOJu0YyiAxZf4JO3AbC7GKOuO4pYwgn/tefxie0FyJcsi1NSHNoxKDgH
        20JOiwAJtbF9RWJJql7ER66k8w==
X-Google-Smtp-Source: AGHT+IFMACdQpM2PQ0JNSQTykeftmkGGXvmE1SAn7R1rshOM558PtjRj77xUZoEQppX0U6JD12SJTQ==
X-Received: by 2002:a17:90b:1bc5:b0:277:1bd8:abe1 with SMTP id oa5-20020a17090b1bc500b002771bd8abe1mr303008pjb.30.1695403749534;
        Fri, 22 Sep 2023 10:29:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 26-20020a17090a1a1a00b00276fc32c0dasm3068784pjk.4.2023.09.22.10.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:29:04 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        Jamal Hadi Salim <jhs@mojatatu.com>,
        David Ahern <dsahern@kernel.org>,
        Martin KaFai Lau <martin.lau@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Yisen Zhuang <yisen.zhuang@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Long Li <longli@microsoft.com>,
        Ajay Sharma <sharmaajay@microsoft.com>,
        Alex Elder <elder@kernel.org>,
        Pravin B Shelar <pshelar@ovn.org>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, Simon Horman <horms@kernel.org>,
        linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-rdma@vger.kernel.org, dev@openvswitch.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: [PATCH 13/14] net: tulip: Annotate struct mediatable with __counted_by
Date:   Fri, 22 Sep 2023 10:28:55 -0700
Message-Id: <20230922172858.3822653-13-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922172449.work.906-kees@kernel.org>
References: <20230922172449.work.906-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=keescook@chromium.org;
 h=from:subject; bh=pEQ6m/Ojl8iZZMdU3eWLn6pX8bV9cI5eUZQsnPhAnjQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc7XkbXKZplSh9lbnY+7Kzc2rn8+8PrOJtg7N
 VYk6XUim8qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3O1wAKCRCJcvTf3G3A
 JlK4D/0a5nvQxsfMMYe9Iz6FtaE4ytVsQDcsZFdGmgQChSwGLCdG1Sa3F9I/G5YpqxGxJ9MNkss
 +nBxQtIkxud0XXfvo7iopnxIgD4mvFFE82jWjI5l+YqV7TCu70N8lRiKrnPnHt7F4pX/YBRSzP4
 Z4CSFFVLw4aHwapWBtYrbzgkkkOcawEXJ9SwIe5uQjCSi5cTm3Fhxi1Y3b3gnLG2UE19n3AAvV1
 MELt6/MIMajh61Zk7bylLfR1U9tDOz34sjH3t6DRsGC34XAypF/4EZFJ3HpQHdnPPo0b1WJN+R9
 I4X59+l8NGkwQHFOzJZS/jHa/7YBQAkymun70pKFQv4oEGS5anucsYwBt8F9W+lQ6it5Z8PWv4g
 nlHRBeEueC6LuAI+hB7sF6dD3LB/xaawEDJKiHZaHoG9CwxgxtXI+s9GBsAhetoUmE2b5GNdoEW
 Ix5esRXBd3MxDY2qQKgBHpxzkJCjVcBkSIDPfB+6QbvXKiugSApEqCw52zAoL4vZ1DIYTX+eULT
 aFDnk/QcBxCFto/Y/DDesSQa/0VZ+AkYXsY2Wo+QpAFR7HYoGmEub0VuATWQu8NsBJEZDh1tQ5N
 1uU8WV2UjWnZfw75hLVF3Biggl8OKiurzRsCNrHh5yDeGQp0hufJgv+TSoR9JC2NZtc69JniRcJ Urav/CBb855RzPA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mediatable.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc: netdev@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/dec/tulip/tulip.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/dec/tulip/tulip.h b/drivers/net/ethernet/dec/tulip/tulip.h
index 0ed598dc7569..bd786dfbc066 100644
--- a/drivers/net/ethernet/dec/tulip/tulip.h
+++ b/drivers/net/ethernet/dec/tulip/tulip.h
@@ -381,7 +381,7 @@ struct mediatable {
 	unsigned has_reset:6;
 	u32 csr15dir;
 	u32 csr15val;		/* 21143 NWay setting. */
-	struct medialeaf mleaf[];
+	struct medialeaf mleaf[] __counted_by(leafcount);
 };
 
 
-- 
2.34.1

