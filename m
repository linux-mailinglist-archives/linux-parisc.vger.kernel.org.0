Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C220606FFA
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Oct 2022 08:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiJUGZD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 21 Oct 2022 02:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiJUGZB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 21 Oct 2022 02:25:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B086C57207
        for <linux-parisc@vger.kernel.org>; Thu, 20 Oct 2022 23:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666333494;
        bh=e6lOPSbVSF1MlkdswW5kUGBZ410SlZGmoujoLv02/Jo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=EiwojKYXH32SBVrucru8mdQkTMm2DkZ3K62iIF71YigaGKVHLo5UFwAWuqYsQpmPq
         E5Tp++GcZAQOKIVF3s8OSfyWVv82Q5e64yhNzjdJR4ZnfztWYAeBqeYqsuZTZcJbBr
         UnVcl8CmHnFCNHJR74Kch7XY52wIKg4M4jOLZmDI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.168.94]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeMt-1oYIw11QGp-00Viqr; Fri, 21
 Oct 2022 08:24:54 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 1/2] parisc: Make 8250_gsc driver dependend on CONFIG_PARISC
Date:   Fri, 21 Oct 2022 08:24:44 +0200
Message-Id: <20221021062445.28701-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JrKEDW7qsb5o5cjTZtBrdpG6XiwEQacv8w6ZJDwkT+PDV2oQPX4
 1gt7XQ/NBT27EkVOhb7y00WMFQyNc54oGwjAB2RVukS0h4MxCITIB/6L7GXdjdYo/1DBh72
 29y+mNsR+qwu1wtIQammvv12Cv3mG/nc+mtJ9BSz87TMKZyeNhmyDmgfJLg3UeXuoI43aCD
 Y8YMkHT+b89YMbPN62jNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UpQUfAEEYnQ=:LSRJAXkDO3We0mTFUPM+wI
 ZAaF9f4+C8dChA06tBE518fF6sax790nVTlJYXCQ8vUcDUh2DipAoJ5Oe9UXmws5/oo2juoAS
 U3i1rgOIimiMaBDaQNK1ipmql8P3KbVu/Ui2kJsciXU2NsbaHPYpeUJYFElaax+uyQ5uGi61G
 A3HRPHoeyCUAkW0e2/iguMJDkOeIUdeaWdFGFIWw9vyaP40VQiKD8sXDZBQVlhuA2jYfy9+K2
 VJhVIM7vni0XO0VHkdiDm65RsWezYuu19RUs4rZnK1OGDRDTUdZ+Z30j/tft5yPBREVWDFIfU
 eRYlt+oOhch+NKp5jFXBmf6Bq5qLRJiwCoNvUepIY2eFcSORieYHs+UTpdRG9aTz5JXtRPGVs
 0tyBEMRLEtV9vCAE/538HJQYOPioN8wrgh9UC0mx57yl++Byy/7VJsV+JFWaqpvn9v560s/cT
 LOvgSk5AXSACfrSAl2V91Dgpu1gS1LVaJ+Sgv75wDDY/uqLjD78MC5PzDczTFuo5JKGCRp1jg
 +XZuajXOrXeqdwz1HcabLLO1IdMwxxDE4Sp+iRxIS4D3ZrN8prg/7EEKsVAfdn2BNe/2jyyVF
 35L5Evcm9hv2whi6iL6TfWqIMDsekjGxQl1BUbqanBjp/DLa+z1Rqh4ZAlgRJfsNTaEoZic2E
 6QjEYAzd//dK7+u+y52PtPMAQtNWTeCU+RN/1FtQ23gfinMxiOD8Y/tKGk+ZdlsKzttXyontl
 xIt/T5HUSmWvh7Gu1jwTEw/f0JV+BR7+X44TBGUhdCh0MnIbF+B1xdqekt8btHvfNznuQq1D1
 gU/pf+RIovuGGBD5OT9Y7jLFdJTJjIBy0DeJa8iKzf/XsGwIbqZXzU4bOwA5Df4PQjFDgVzLb
 WIy1YonVN2aad4WQxBxUmtgeF/At8o5x46DL+oc0TPyj23uqHQWApMQUPirl6NGMXC+35vzJ0
 HTO1nA+jN1vn6+EdwSZ3itk7Kn8LoBWPzpQ6+LBfU8CyvmVcY5TtSCetMMIeWmgUdMquiNiQ+
 2sK7TmW3fH3GdZWm653ymttkKO3h/VHxKUzeeizCNZYtB72OezAi4YdaYyEQiCJHVNi35M6+Z
 eUpLmgbjy+SWZpWGKZt6McT4u/+bZQIfbMRmuuA63U3X0SZONNS2+Hof7IHIqKG0Joh7wCb+q
 lCIa8RS8K3EklF132OwXPFF0lCBMK+LHM9yqDGpCSoYLvGliZv9vxnA3ov2/4q7Sy6mKrCceW
 TR5Iq0CZTpe4VYImbiVhzwpWmldT9YpGoXolCD/cptT7S/Y8HAvbWgcLPMrOwzTzbs2JQnBf+
 A5m9FEylJjawhIGTXN9Q6pZ/ufnds+Wj5D/35RVw27PNFaSt9NTx2rCeWmLMD2YCKrCJ955aI
 eaD8wyrOXnaNfUspmY5sEsHsjBnoGNcmYhm/vfO1NxukvNudW94CkF92erlR4ulPGlFWtX96O
 /kJyRvSTMtsSvX74HejDzjUgO57pfw5KVm67yMcnUTYMFjzMvBKxvNpjAqdGXaxb/v3BV907Z
 LBXu4k3QYrv2P5/oCmWG07rVNQhGNS3A3W0X4Dg+qNyZ1
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Although the name of the driver 8250_gsc.c suggests that it handles
only serial ports on the GSC bus, it does handle serial ports listed
in the parisc machine inventory as well, e.g. the serial ports in a
C8000 PCI-only workstation.

Change the dependency to CONFIG_PARISC, so that the driver gets included
in the kernel even if CONFIG_GSC isn't set.

Reported-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 drivers/tty/serial/8250/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kco=
nfig
index d0b49e15fbf5..7b3ffb7f50ab 100644
=2D-- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -118,7 +118,7 @@ config SERIAL_8250_CONSOLE

 config SERIAL_8250_GSC
 	tristate
-	depends on SERIAL_8250 && GSC
+	depends on SERIAL_8250 && PARISC
 	default SERIAL_8250

 config SERIAL_8250_DMA
=2D-
2.37.3

