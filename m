Return-Path: <linux-parisc+bounces-1737-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E7391E123
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Jul 2024 15:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A937FB21287
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Jul 2024 13:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3138615B542;
	Mon,  1 Jul 2024 13:48:49 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from dellerweb.de (dellerweb.de [173.249.48.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB98158DA4
	for <linux-parisc@vger.kernel.org>; Mon,  1 Jul 2024 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.48.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719841729; cv=none; b=fSkWW1ogQdl2H40nJwDim2RteIdvPixZv/oxgeDdduZ+VpfsxFma+nTbozL7JrtcRyiM3SiubiWMMmahAu6BmlFQej9jMF30MYLZPL31OZTId+tgziCXQBA3vQFnbIHw9o0eo+lJrqtQvDdOryvkAJ6TEwYxYdZrs7tEjHFKD5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719841729; c=relaxed/simple;
	bh=sCqsFew4ycMDcgv2BsTDBSfjUBGS7Govt8NHSJCz3zM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BEJGqDUEklWn6bjt0T3E1VWEkSY7NLwhdiAXHi4qCkObLWzQ2XtjgOGRY4b4x/Ovn5bPHMoMlCmUwYIWfkmffZqSc4rVb/Mdg2JRmOGNRDyuZLYAj1avD7ScUoItsFucMNJn6Ii80Qe8OPRCEvMHihyru2R4xG74SLrP5NqKjAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mx3210.local; spf=pass smtp.mailfrom=parisc-linux.org; arc=none smtp.client-ip=173.249.48.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mx3210.local
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parisc-linux.org
Received: from mx3210.localdomain (unknown [70.52.162.67])
	by dellerweb.de (Postfix) with ESMTPSA id 0431D1600226;
	Mon,  1 Jul 2024 15:42:44 +0200 (CEST)
Received: by mx3210.localdomain (Postfix, from userid 1000)
	id 66F1BD6011A; Mon,  1 Jul 2024 09:42:41 -0400 (EDT)
Date: Mon, 1 Jul 2024 09:42:41 -0400
From: John David Anglin <dave@mx3210.local>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix warning at drivers/pci/msi/msi.h:121
Message-ID: <ZoKyUdlYiVBx-k7e@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ubaVx6vRBOxuFaRK"
Content-Disposition: inline


--ubaVx6vRBOxuFaRK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fix warning at drivers/pci/msi/msi.h:121.

Recently, I added a PCI to PCIe bridge adaptor and a PCIe NVME card
to my rp3440. Then, I noticed this warning at boot:

[   25.101978] WARNING: CPU: 0 PID: 10 at drivers/pci/msi/msi.h:121 pci_msi=
_setup_msi_irqs+0x68/0x90
[   25.104286] Modules linked in: nvme sr_mod(+) scsi_transport_sas nvme_co=
re cdrom sd_mod t10_pi ata_generic uas usb_storage crc64_rocksoft pata_cmd6=
4x sym53c8xx crc64 ohci_pci libata crc_t10dif ohci_hcd scsi_transport_spi e=
hci_pci crct10dif_generic ehci_hcd scsi_mod crct10dif_common tg3 usbcore li=
bphy scsi_common usb_common
[   25.129353] CPU: 0 PID: 10 Comm: kworker/u32:0 Not tainted 6.9.7-parisc6=
4 #1  Debian 6.9.7-1
[   25.129488] Hardware name: 9000/800/rp3440
[   25.169265] Workqueue: async async_run_entry_fn

We need to select PCI_MSI_ARCH_FALLBACKS when PCI_MSI is selected.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index dc9b902de8ea..9656e956ed13 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -86,6 +86,7 @@ config PARISC
 	select HAVE_SOFTIRQ_ON_OWN_STACK if IRQSTACKS
 	select TRACE_IRQFLAGS_SUPPORT
 	select HAVE_FUNCTION_DESCRIPTORS if 64BIT
+	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
=20
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used

--ubaVx6vRBOxuFaRK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmaCskcACgkQXb/Nrl8Z
TfF2zRAAqvfgZtEqS8JGVtr29q9SKAdUeYE75iuuuVpk1G1xYTEmwM9GnofLYz7g
4u6V1NrwIAv7c/tWj8ueKvbHtV2tVlMyD5wfOo0qoysoxuW5kR3z5bTihTORbyhO
1CLyNLyGbhJmVjqXkrpvvHsCwb9btlPe1nKdv9Su61eAGrOkLRxPXvldYCarHU2f
nmhkVdTXPH/CIMFdeb9ZtSTH9JlQpVKPm/PkY1AnRkDPuKNnQUv2doh6y3mBxnMI
X+nohBJ6QzdTRkpsS1snOSF1eSIX5yDw6K80P/sX6TJ1G2rUBPav0N07zZldzoTA
3syWODlMFyRVMmE+DX8CL+Qq5FWFXsDhCk32mIC41O08oecdl7EXAQnUo/4/7QG0
BA8rCqMoczttBF+re4M2vWfyiJzfq624H/Lm1P3jevA9XkHrwIRQpHxlm9vWkAug
VCwQKqXCJ3UdcJ+2pA+JSgiY8OM6k9rbdSUR1wSFQaUXgpqkwgdog65hnZC1ai+U
gp2u2fB9xC6FJJWsO4Jquw3v3NTLu7QflNkwt6py6+SHwJsaIMh9ETqVrGeM/oF+
rlJFD5EOu3TF0bX5j5QOrzU7/Mq33p1oj3kPJhRUBbZqH1WDz5rZzdf6lEJRN5ZT
mpcYJnSWjyf3eac27i/39h3gatqHe3dYU2IYaf05OEDzucEQjYA=
=5UF9
-----END PGP SIGNATURE-----

--ubaVx6vRBOxuFaRK--

