Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63EE867A35
	for <lists+linux-parisc@lfdr.de>; Sat, 13 Jul 2019 15:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfGMNJG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 Jul 2019 09:09:06 -0400
Received: from mout.gmx.net ([212.227.17.21]:49173 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbfGMNJF (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 Jul 2019 09:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563023338;
        bh=UfLJkogxrlpGYeLgRA0kJbea/s+TTdmLHOX7LQ+RCXU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=gpkg8H0So9ITDE+4wcvBmSQfPRvaDGYflzWtQ1yC6GqlujrVlyTVePMbOAfbXY2gF
         b9e4hsckmsb7q1tF4bxyZ9W89mgAxro/u048Bw6NuxsyzciWy6yJ1ZOAf1CkqkNQDU
         081ShCChVAGVPW3HhdBEIQKgOYcVjDDxj9rHwQLs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.128.135]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MCtLD-1hdnB32RRz-009j64; Sat, 13 Jul 2019 15:08:58 +0200
Date:   Sat, 13 Jul 2019 15:08:54 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v2][RFC] parisc: sata_sil: Add quirk for Samsung SSD 850 drive
Message-ID: <20190713130854.GA6688@ls3530.dellerweb.de>
References: <20190711195957.GA26789@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711195957.GA26789@ls3530.dellerweb.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:UzS8ZXI/9p2zXJggo/AsFLBdVSkzoNBtBuBgSvQUTIn8QvMcC0v
 SIZSt1sD45EuzeCxIFFO936bkIFAAyufFOj/Zj84/rE//agbpT50ndTWGYFWXHaew81+Yw4
 vOBWlK/xaGIHJ36De0jO2sZhqq7Ez96qObi5e2gsFFD1SBDvg89J8eOWbwOgMQh1WCZrHdA
 IZJs9qbbvvmNFjYVSW77A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z3csye0vY9g=:Z9H8TbkCfC7PlbWcx4xA3/
 0NrF1wx9xFYE52tO8JWBr6lox9WL7irs2KapovaK6XRXJDPEK60i2zQDipf5vdPdERWzBAf3E
 4nxBDNgtA42CS4bOY4ycssXtfxtoQQTKclljHiF8y2IE5MGoOkQcuhd4pniXKgHjKBDc28bMb
 ndra8Ru6TEM3ootmUQOO5xDYHE7vgfuce+PqcSrj2/hwTWtAZzmo7M0Q3xZZtdDVKt+nUsKSm
 dQhV3XtCtA8Kaz0ewY49xIhLqXMsxFsyURETGrVjqTBzbK9koEQG/LBVgkAg2/9RBH2wxDekB
 g2TrTELUQcHVgQFeB/IfzjAPTI6tHmxa6YZnZDXpzLaBLckPLfXN1kmv1HsXfuSw969EatrBl
 /lb7QVKrbJVao5olIQtOf0K/jk4nIW5ZSoCkCDJh8z6lDpTQzWoQNW71ydgGCbMuvRC413A4E
 Q02GvIeI9kQcs2QBAjCcP/whOWmKIRW5Y/bfxavFbbxUXDTavfJqYN41Wcox8zElNvVBOeuxE
 2W85v2Bm4Ody2NmTJT9CrV/sGBHYCkNJgcrUHA8oVi+7FZ5Aeq9+ZGscz/aUXChUWxMcRe4XI
 yOUWeOVjLs3Pe76tQnUf7vF6pA1MAuKCEPprB3ZyfDE/Gg+cRRFaaMgcvSBDy57K+DmuS4AIA
 fbRfKmsabWNhzOblvTPZSBOgnZP0sJvrKMG1fAlQGmViJ48UIxJwR9NQka78JZp9KvGcsm2LF
 AgxKQOVdS2IqRzZ+j1/tnoRvM523RLXTn1TR2fOph601qPvTh3EwPAHMMX2GReS5qD58Xb2Td
 MEiInTmF6vBy4PdbP74GMjvSu0rk4yo1ub+F3fzgJLCsrN/lLbq4tpR18dDRBPRE29phrlpHo
 P3wUfmoTmWlwJMou8ySdk6nY02NKJKbmjhZ9oeI7pSgwlU0LyLzeqVff40K5fACUEz15GwOTZ
 8r/GumGfHFEg3P4yoNGMbChkAu+FAhlZKLDM9TVLq1cywwkADcIziHDshA9N6QCkP9BmMgBuf
 6PziASysaPe0B106kOSYNyhIb+KaS3ts1FLdmm+V37n6EccoBLmxekp7atIkmsLA/w==
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

--------------
Changes in v2:
- Use full ATA identity string


diff --git a/drivers/ata/sata_sil.c b/drivers/ata/sata_sil.c
index 25b6a52be5ab..9e851534306d 100644
--- a/drivers/ata/sata_sil.c
+++ b/drivers/ata/sata_sil.c
@@ -141,6 +141,7 @@ static const struct sil_drivelist {
 	{ "ST3120022ASL",	SIL_QUIRK_MOD15WRITE },
 	{ "ST3160021ASL",	SIL_QUIRK_MOD15WRITE },
 	{ "TOSHIBA MK2561GSYN",	SIL_QUIRK_MOD15WRITE },
+	{ "Samsung SSD 850 EVO 250GB", SIL_QUIRK_MOD15WRITE },
 	{ "Maxtor 4D060H3",	SIL_QUIRK_UDMA5MAX },
 	{ }
 };
