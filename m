Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22FC966055
	for <lists+linux-parisc@lfdr.de>; Thu, 11 Jul 2019 22:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbfGKUAI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 Jul 2019 16:00:08 -0400
Received: from mout.gmx.net ([212.227.17.22]:55225 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbfGKUAI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Jul 2019 16:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562875200;
        bh=yhqLUDAXxG/5n8cF9kAMzOTlBtbgLZDQxrJBNHO1vAg=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=iw5MN/5/qA+OaxZqD6c/8hfvQcnyozPc8OIVvkTwBhXC2Myjan3EKcc8fgBeaY45U
         NObPgMskOnAJAlxnhJtq9G7ChFTtoBO9LaV55tFQFkAg+SJv23l1xGL1I9ITe7iFVU
         1wf+t3pNvNTwoAomapx59J6A+IUNPutNw3ZJ4YUU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.130.163]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MrQEx-1iEPjE46Jb-00oaRr; Thu, 11 Jul 2019 22:00:00 +0200
Date:   Thu, 11 Jul 2019 21:59:57 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH][RFC] parisc: sata_sil: Add quirk for Samsung SSD 850 drive
Message-ID: <20190711195957.GA26789@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:R/trbqJjWGQ0+8CXvGcOYzDvXO3VLNZ51pRlcIa9OqPZWiVRlmH
 yQwQ8JjkB2URX3H9xxI51wjF0pfG10TY4yDhRL8srqEXi63LKCFOBtgWhnIsFC31WkdAk+e
 1f7YvZknBa25HBjRhZVOiBBBKbbpREPyNKxgtwyf+fGYXzZcS7GBkhqEbdu4qZdH5Q38XOf
 bdAz3ei5QkkPv2Ez9lKMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1JN6M2PL33U=:7S/pP1z/1reqxJw88ERFku
 F55ken9JJQiYz1TgjK1i5wGQ8QaACV/mEOuVw66+vnk5m9k1U48YK9i2kuFanpFTb+EDLCuOB
 g9M1k8g6+Nc6BsKdT3zl5B4QQzBUEJdoQmOVFnAD9asyYV2p7XTsJPfQopaVzCEqwEjsl2XmL
 84ULuiZsVz8sywYBSQ8qHzzPN8gIC+GegyUhzdQjGiGqmToATtYdrWgzXT7BZpolXsBTfc95T
 Wx1iKeXx7ydcHAiINg7CiNt/Jki9Mv3LbTitAkng+qFRcIaTnJMrjNURLA8rSk5P0/jcjUBWb
 LC0nHuJgXm23278LtiKPTe4mCDaBQE8+8TO7IfxBsq+KOtLcim6WXqVEU2xyhusbvAqTfDMxA
 Zh8KZvMEpQiLj1+72ie1H+x9M957s0Xl6a8/uTbtYjCN6TBecoTvFYETMtb+YRsDqWIMjKJhd
 Fxp/f2IahL82tNbX293rCS4lnzLwwguDrC6ShikAwjN5WkQYAypoOrwLkx6n++r0MwfB9TRv5
 UctCwZYzaaMld5/VIOLdxCmQWnG1HzS3JcwMkMAwGPxwYcY9AHBCpJ+TiUXvQaiU9iJ3tOaNk
 3VkRXN9EGjL3FXloPJaqFtdDbflllOglX4Spp0ciLQ+yIyR4Atrj9RQeP5Eyyjk9gTfW3Lsbc
 pbvmk62a11rZOJrqUuQwcnW0fz/njSZ3cyPUSqbsA3h18R5GzmJuxw5FFF8+T1eg5dsrmq4U4
 lUNebhhDNtFWKJwEPmIQGScjFWaLNCn18pd2Z8keC1ddgt3PmlZk2I4C8iY6Popntc9jM8wHw
 Nk2OYa4X62DvttfXthejScFIVulRCVn84RdG3bZNMEfazroX/IujDX3i46IEezYCh7yMaxReU
 F3wLFEcOr2cDskgfMuRUfUDrTplBv9cz40NHNLiAtOpjhGnb5Fvb639bx54Nqgi+sOnZyR7n0
 sfss07sO6NqTIOzoy54tDfAgPy32jDZgSOxcn+N5HqSgVozi9Hs2MPTPovtCGYEjStOZc5wyk
 IA1PzenWNbZ44pEiQH1e16w20Xjh7POo5GmPA/D8B6JifxInRVKpanV5zxc8Pzs29Q==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The Samsung SSD 850 drive needs a quirk to limit ATA requests to 15
sectors, otherwise one will face lots of read/write errors.
Alternatively the "sata_sil.slow_down=1" kernel module option can be set
on the command line to limit all attached drives.

Tested on a HP C8000 PA-RISC workstation.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/ata/sata_sil.c b/drivers/ata/sata_sil.c
index 25b6a52be5ab..8b8522d9166c 100644
--- a/drivers/ata/sata_sil.c
+++ b/drivers/ata/sata_sil.c
@@ -141,6 +141,7 @@ static const struct sil_drivelist {
 	{ "ST3120022ASL",	SIL_QUIRK_MOD15WRITE },
 	{ "ST3160021ASL",	SIL_QUIRK_MOD15WRITE },
 	{ "TOSHIBA MK2561GSYN",	SIL_QUIRK_MOD15WRITE },
+	{ "Samsung SSD 850",	SIL_QUIRK_MOD15WRITE },
 	{ "Maxtor 4D060H3",	SIL_QUIRK_UDMA5MAX },
 	{ }
 };
