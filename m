Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DCD485AF2
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jan 2022 22:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbiAEVrK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jan 2022 16:47:10 -0500
Received: from mout.gmx.net ([212.227.17.20]:45815 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244572AbiAEVrF (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jan 2022 16:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641419211;
        bh=UCuSZqlueO8BK2BYs6xhwXWjNTuymxV0Zh8mUMX/yvA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ESiSN2AptVig7W2RL8IjZJIQmTBMo0fRxPIKaORbaRBIUrovr7uk1lLnxwSqBKVSw
         iwkR0Wvu5PQoE9/7pOoA3MaaHpV10F+iptkVE8cwFm7nt3wmbpI3zR9ra1F8+9JFLW
         raPPFtZ4+7WiBZMalNfEnGqFzY9Bgvybusw7BiWQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.146.36]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGz1f-1n9Mzo2Mex-00E8qd; Wed, 05
 Jan 2022 22:46:51 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/2] parisc: Provide a trivial PDC-based io_module for kgdb
Date:   Wed,  5 Jan 2022 22:45:52 +0100
Message-Id: <20220105214552.590606-2-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105214552.590606-1-deller@gmx.de>
References: <20220105214552.590606-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wlrWpE+4qYwC04Ah7kXa1FU9SIwwixKv7JTYT8btjcm13EaXzrl
 shjP7y3ZuKxWO7b1yfcFEr0UK2wEizpoL0k63f0InrKTWUcllXCiMwa5wnk2V6wZXRhJcVY
 XrqjsAR7lsTPW+fyDPsO7eXrC1eg3a6Xok/vHt2+evkNdPz79ScCq4elGI5R/Sj75+63xDr
 G1EHAlDfna/xojPNZhwnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LrbGm/YuwYs=:CMVEm/1exCVJivXbv1Xs/u
 vnqml14oKGxpWm7VZgBtSIL86tkHI5t5OcMdAffXrjGDfrpt6mjBrvokDViuxFYN8KWmEUt3E
 ja/dm3aYv8bTMw+Ffw83x+6sB4bQWmzjqyx8F9SrHHW0oBm1JDeakW0hWf/YLjooJVQB6GTqT
 T7ZjBXiPgpEvzaK6CVdpgpomKKv5pcfgQPDInYcmi5T48YxgTRSdimdjXOQnoiWiiQDHvv3cA
 rksG+h4QRLJ5NfFGvBZbVWUP2AB/GJ7hW9s5HtCs2GNwakzuoTjNT68aAeXatPzjE+maVQwYJ
 hMij6JSMf5C8wcDPqZqMtPxvTOZAt/DZTaEJxf6jf7SquUwMnIp8zzMkU4NXi8dJXuUF9GGP+
 RtsRPx1gMLgVFnPiyfBymiB5mL2X4C1LhQa+GcMQGUCD8HjfwcBf+IWIkS41YEDgwpesoBakT
 8fVte94JGQT8XMb+RHKmdPSqaJbpaKnAGl3PILwQAwWyaUnyXJVwG8mnuvepp3C84PtIaWhm2
 ZNoHXHrxKS2bwJifReXm9uUHqxY9W1x5nmXYOm8AoBpS+ufowZOyo7/Pp2b+LeDf2ZF+g1fI0
 Zzb7qdxAh7yl3b7YNgd+uyS0q6vEgxPRRKm7rvvFj9Kq8v0kzLs7K1qX3ep+4wdyDIiDnyaKl
 36uiWfkAR+rfkUyQZqkhNeDMRjSLeIDwGGZ6XBMtVuXSdjk17Dl7Nffn3HUAm3jXr7J0WJRTU
 UAOC+p5DS3KlpYHBzIPqoGpz9pHwO9oOkCu6WYvQa78z7LdBcmmzcvc5gVY/8UO1GEYrjA8ex
 /A83PHmAW4zwtE6n79szZf6LAS+oFRJEQf44uevvHaBACm/kW7mCQ/4s4MXVYf9v4l/bygBBT
 2vuIAJOCioqwJ0FSsSzjJtqEP9Pqkdz4zDZkSb7ZXoLRnHonWjPl5XxBBQsgAzRcTodNI3zEj
 K+Eojjl6Gm3nrtGhC8rb5Lrx64/PrZF5JXbOh7lrwJsdlx+85pNmxih1RxJeVXvo38/vuVRRu
 GmNS2XH8lUjpidsWuv2vxTzrTDfpD34Ap4VAFIc74gIb0/fkVgxcLeUP2KoCR4WN5P24mlTVp
 Q+d8sftBheNOjk=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add a simple keyboard driver for usage of PDC I/O functions
with kgdb. This driver makes it possible to use KGDB with QEMU.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/toc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/parisc/kernel/toc.c b/arch/parisc/kernel/toc.c
index 18327611cf8f..dfe7cccc086f 100644
=2D-- a/arch/parisc/kernel/toc.c
+++ b/arch/parisc/kernel/toc.c
@@ -109,3 +109,30 @@ static __init int setup_toc(void)
 	return 0;
 }
 early_initcall(setup_toc);
+
+
+#ifdef CONFIG_KGDB_KDB
+/* read a character, return -1 if no char can be polled. */
+static int kgdbpdc_read_char(void)
+{
+	return pdc_iodc_getc();
+}
+
+static void kgdbpdc_write_char(u8 chr)
+{
+	/* no need to print char. kdb will do it. */
+}
+
+static struct kgdb_io kgdbpdc_io_ops =3D {
+	.name		=3D "kgdb_pdc",
+	.read_char	=3D kgdbpdc_read_char,
+	.write_char	=3D kgdbpdc_write_char,
+};
+
+static int __init kgdbpdc_init(void)
+{
+	kgdb_register_io_module(&kgdbpdc_io_ops);
+	return 0;
+}
+early_initcall(kgdbpdc_init);
+#endif
=2D-
2.31.1

