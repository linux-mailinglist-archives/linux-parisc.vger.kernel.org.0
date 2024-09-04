Return-Path: <linux-parisc+bounces-2231-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5CF96AD9F
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Sep 2024 03:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AB11B2251F
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Sep 2024 01:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2372A63D;
	Wed,  4 Sep 2024 01:08:14 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B186AA7
	for <linux-parisc@vger.kernel.org>; Wed,  4 Sep 2024 01:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725412094; cv=none; b=uMuC65mrXtP0wXhSinJr2NpEWoMSR5Xv9WHXcvzMNOkNolwzLjy+HBaWKH1s/vXJLZioG4KPsTA9BZ5HLBIYCti/los134fYUxdLn/TsnuJ6fR3D6EdtYPrqQKapb5FEwDimpDbAvJaJnwsg6IEfFCmU0McQRBkYhJqN2QrT10M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725412094; c=relaxed/simple;
	bh=h2siSvw5jOYLfZPp8y/y0Kbmv1tbRr8nVni4/N6MSjA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CzW7L6/BB/cIGVbz/MeQnEPn3ij7tL7ploPe02eptlqvIKBW4V6Lm1d9/1WP2NS6lDBaFDRKmk7wFPCR+aJAege5RJDiCr09xThHrp1rPICOCFNxbmEJpiQv+jsGDoUBMc8OWIjKPY8mjz3TQsZu2WL7lNxX3O3tJ6Ebk00azjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wz45k6l79z1HJ8Z;
	Wed,  4 Sep 2024 09:04:42 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 0178C1A0190;
	Wed,  4 Sep 2024 09:08:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 4 Sep
 2024 09:08:09 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <James.Bottomley@HansenPartnership.com>, <deller@gmx.de>
CC: <linux-parisc@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next] parisc: pdc_stable: Constify struct kobj_type
Date: Wed, 4 Sep 2024 09:16:42 +0800
Message-ID: <20240904011642.2010258-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)

This 'struct kobj_type' is not modified. It is only used in
kobject_init_and_add() which takes a 'const struct kobj_type *ktype'
parameter.

Constifying this structure and moving it to a read-only section,
and can increase over all security.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/parisc/pdc_stable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 633266447e2f..16f4496bca95 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -483,7 +483,7 @@ static struct attribute *paths_subsys_attrs[] = {
 ATTRIBUTE_GROUPS(paths_subsys);
 
 /* Specific kobject type for our PDC paths */
-static struct kobj_type ktype_pdcspath = {
+static const struct kobj_type ktype_pdcspath = {
 	.sysfs_ops = &pdcspath_attr_ops,
 	.default_groups = paths_subsys_groups,
 };
-- 
2.34.1


