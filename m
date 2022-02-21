Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 790F84BDD57
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Feb 2022 18:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347956AbiBUJKN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 21 Feb 2022 04:10:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347766AbiBUJJO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Feb 2022 04:09:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7912ACB;
        Mon, 21 Feb 2022 01:01:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 85C79B80EB5;
        Mon, 21 Feb 2022 09:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F5BC340E9;
        Mon, 21 Feb 2022 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1645434095;
        bh=HKrIBi5m5CFXzZ+6/xBVUfB/8hJp8GunVilEDIKwwTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vX9efIz1vFJ7aHEm3c2eFptToGoYal1gHPx16+0MUOBBvRUBoR1M8TAbExjFRRazE
         I+GaDfqVniaS4XfADI0QKnLLX70sv0EFGMhapDZuEeBHnLGON34tvSizq3mIxcyx1U
         t7UcLKu6nzQtiC/5rhxhxXF2QgHC9ihY3wpeGVLE=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 5.10 011/121] serial: parisc: GSC: fix build when IOSAPIC is not set
Date:   Mon, 21 Feb 2022 09:48:23 +0100
Message-Id: <20220221084921.527901686@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221084921.147454846@linuxfoundation.org>
References: <20220221084921.147454846@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

commit 6e8793674bb0d1135ca0e5c9f7e16fecbf815926 upstream.

There is a build error when using a kernel .config file from
'kernel test robot' for a different build problem:

hppa64-linux-ld: drivers/tty/serial/8250/8250_gsc.o: in function `.LC3':
(.data.rel.ro+0x18): undefined reference to `iosapic_serial_irq'

when:
  CONFIG_GSC=y
  CONFIG_SERIO_GSCPS2=y
  CONFIG_SERIAL_8250_GSC=y
  CONFIG_PCI is not set
    and hence PCI_LBA is not set.
  IOSAPIC depends on PCI_LBA, so IOSAPIC is not set/enabled.

Make the use of iosapic_serial_irq() conditional to fix the build error.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/8250/8250_gsc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/tty/serial/8250/8250_gsc.c
+++ b/drivers/tty/serial/8250/8250_gsc.c
@@ -26,7 +26,7 @@ static int __init serial_init_chip(struc
 	unsigned long address;
 	int err;
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && defined(CONFIG_IOSAPIC)
 	if (!dev->irq && (dev->id.sversion == 0xad))
 		dev->irq = iosapic_serial_irq(dev);
 #endif


