Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368AA7EACD9
	for <lists+linux-parisc@lfdr.de>; Tue, 14 Nov 2023 10:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbjKNJRi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 14 Nov 2023 04:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232538AbjKNJRU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 14 Nov 2023 04:17:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BF21A1
        for <linux-parisc@vger.kernel.org>; Tue, 14 Nov 2023 01:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699953436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9Fpb4buOo5I36YwmyhVRRBioZPTsvySAZR5lDiiIpxI=;
        b=Ps15drUEG3cLssdFevxepBRlfN4PaSWPHTCHjKmILqt6STQTsBC7xaZ4k4n8FtRZxlJ0rv
        ED4EfKPRsIXlZUiKQu6CKpgI07jbXdFuZDFlimm5mEiR2CX8S1FR2o86W6QADBJuAHiWM3
        iMm4piNqFsu+CIpFItJDVh718eZJWOU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-5-PljBhzhMNE6KZtfoQgWXVg-1; Tue,
 14 Nov 2023 04:17:10 -0500
X-MC-Unique: PljBhzhMNE6KZtfoQgWXVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 505471C05149;
        Tue, 14 Nov 2023 09:17:10 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.231])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4199D2166B26;
        Tue, 14 Nov 2023 09:17:05 +0000 (UTC)
From:   Baoquan He <bhe@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     kexec@lists.infradead.org, x86@kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        akpm@linux-foundation.org, ebiederm@xmission.com,
        takahiro.akashi@linaro.org, Baoquan He <bhe@redhat.com>
Subject: [PATCH 1/2] resource: add walk_system_ram_res_rev()
Date:   Tue, 14 Nov 2023 17:16:57 +0800
Message-ID: <20231114091658.228030-2-bhe@redhat.com>
In-Reply-To: <20231114091658.228030-1-bhe@redhat.com>
References: <20231114091658.228030-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This function, being a variant of walk_system_ram_res() introduced in
commit 8c86e70acead ("resource: provide new functions to walk through
resources"), walks through a list of all the resources of System RAM
in reversed order, i.e., from higher to lower.

It will be used in kexec_file code to load kernel, initrd etc when
preparing kexec reboot.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/linux/ioport.h |  3 +++
 kernel/resource.c      | 61 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 14f5cfabbbc8..db7fe25f3370 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -331,6 +331,9 @@ extern int
 walk_system_ram_res(u64 start, u64 end, void *arg,
 		    int (*func)(struct resource *, void *));
 extern int
+walk_system_ram_res_rev(u64 start, u64 end, void *arg,
+			int (*func)(struct resource *, void *));
+extern int
 walk_iomem_res_desc(unsigned long desc, unsigned long flags, u64 start, u64 end,
 		    void *arg, int (*func)(struct resource *, void *));
 
diff --git a/kernel/resource.c b/kernel/resource.c
index 866ef3663a0b..12bce44a2c08 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -27,6 +27,8 @@
 #include <linux/mount.h>
 #include <linux/resource_ext.h>
 #include <uapi/linux/magic.h>
+#include <linux/string.h>
+#include <linux/vmalloc.h>
 #include <asm/io.h>
 
 
@@ -429,6 +431,65 @@ int walk_system_ram_res(u64 start, u64 end, void *arg,
 				     func);
 }
 
+/*
+ * This function, being a variant of walk_system_ram_res(), calls the @func
+ * callback against all memory ranges of type System RAM which are marked as
+ * IORESOURCE_SYSTEM_RAM and IORESOUCE_BUSY in reversed order, i.e., from
+ * higher to lower.
+ */
+int walk_system_ram_res_rev(u64 start, u64 end, void *arg,
+				int (*func)(struct resource *, void *))
+{
+	struct resource res, *rams;
+	int rams_size = 16, i;
+	unsigned long flags;
+	int ret = -1;
+
+	/* create a list */
+	rams = kvcalloc(rams_size, sizeof(struct resource), GFP_KERNEL);
+	if (!rams)
+		return ret;
+
+	flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+	i = 0;
+	while ((start < end) &&
+		(!find_next_iomem_res(start, end, flags, IORES_DESC_NONE, &res))) {
+		if (i >= rams_size) {
+			/* re-alloc */
+			struct resource *rams_new;
+			int rams_new_size;
+
+			rams_new_size = rams_size + 16;
+			rams_new = kvcalloc(rams_new_size, sizeof(struct resource),
+					    GFP_KERNEL);
+			if (!rams_new)
+				goto out;
+
+			memcpy(rams_new, rams,
+					sizeof(struct resource) * rams_size);
+			kvfree(rams);
+			rams = rams_new;
+			rams_size = rams_new_size;
+		}
+
+		rams[i].start = res.start;
+		rams[i++].end = res.end;
+
+		start = res.end + 1;
+	}
+
+	/* go reverse */
+	for (i--; i >= 0; i--) {
+		ret = (*func)(&rams[i], arg);
+		if (ret)
+			break;
+	}
+
+out:
+	kvfree(rams);
+	return ret;
+}
+
 /*
  * This function calls the @func callback against all memory ranges, which
  * are ranges marked as IORESOURCE_MEM and IORESOUCE_BUSY.
-- 
2.41.0

