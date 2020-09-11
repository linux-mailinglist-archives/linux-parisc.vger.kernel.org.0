Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86FE265DD3
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Sep 2020 12:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgIKK1v (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 11 Sep 2020 06:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgIKK1v (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 11 Sep 2020 06:27:51 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B628C061573
        for <linux-parisc@vger.kernel.org>; Fri, 11 Sep 2020 03:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=skXTEAaQAa0DM6z2RpC3bzmnDEa0Qoj++b8K2MiDj54=; b=dyjL7JMkvJ9m8TxdBlZ7KZdf2Q
        LN5/zr4BXDgUqu7wlPU0Vw0jX1055cLJ/vvXWIRgU5tSXdIkD8ZEiP4hJbInP6jBNVlwA54VDjW+c
        P8E+qFgKEQQP7/pvKNhOGAoON84CqsWTYKJTSMD+jgCphXshdUScPB2tXFta4BWXNxm6jHfINsd14
        17UgXcuKhxuplQJ3pBSoCJH8cmclVZXLpcutfq1HLPgNCc15raoROSNugeMairUGgOxIWW8r6wg+K
        M2t6H8gYLpo4Vc6KwqHzkn3093lHKEwI5NPm9Uzr2HIBI+LPg9ZBYc6kHdoEDtpWstN14bhOVI8UU
        IIIKcWfA==;
Received: from [2001:4bb8:184:af1:f3a9:a7a5:a666:7e03] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kGgHT-0006sd-4i; Fri, 11 Sep 2020 10:27:47 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     James.Bottomley@HansenPartnership.com, deller@gmx.de
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: disable CONFIG_IDE in defconfigs
Date:   Fri, 11 Sep 2020 12:27:46 +0200
Message-Id: <20200911102746.1287829-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Enable libata support for the Nat Semi NS87415 controller, and
disable the soon to be removed legacy ide driver entirely.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/parisc/configs/generic-32bit_defconfig | 6 ++----
 arch/parisc/configs/generic-64bit_defconfig | 6 +-----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index 61bac8ff8f228f..3cbcfad5f7249d 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -52,10 +52,6 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=6144
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_NS87415=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=y
 CONFIG_BLK_DEV_SR=y
@@ -65,6 +61,8 @@ CONFIG_SCSI_SYM53C8XX_2=y
 CONFIG_SCSI_ZALON=y
 CONFIG_SCSI_DH=y
 CONFIG_ATA=y
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_NS87415=y
 CONFIG_MD=y
 CONFIG_BLK_DEV_MD=m
 CONFIG_MD_LINEAR=m
diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/configs/generic-64bit_defconfig
index 59561e04e6593f..7e2d7026285ec5 100644
--- a/arch/parisc/configs/generic-64bit_defconfig
+++ b/arch/parisc/configs/generic-64bit_defconfig
@@ -58,11 +58,6 @@ CONFIG_PCI_IOV=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
-CONFIG_IDE=y
-CONFIG_IDE_GD=m
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=m
-CONFIG_BLK_DEV_NS87415=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
@@ -76,6 +71,7 @@ CONFIG_SCSI_ZALON=y
 CONFIG_SCSI_QLA_ISCSI=m
 CONFIG_SCSI_DH=y
 CONFIG_ATA=y
+CONFIG_PATA_NS87415=y
 CONFIG_PATA_SIL680=y
 CONFIG_ATA_GENERIC=y
 CONFIG_MD=y
-- 
2.28.0

