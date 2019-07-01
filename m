Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E10B15C518
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Jul 2019 23:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfGAVln (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 1 Jul 2019 17:41:43 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:34394 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726678AbfGAVln (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Jul 2019 17:41:43 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 0B2DB8EE0E3;
        Mon,  1 Jul 2019 14:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562017303;
        bh=Ila4b5XRd2YsZN9gdowvmlkMYONzuykQXYhspC147MI=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=dkzckDMObvDAmP120q0eBDrXj3o1gkvfxOPV//8EsXFzh6UT3kegFO83USiT1PLWc
         wNd/aVJ+ALanRO65HECqdfb2qoobFABYnBn2+DFK40rmP9zwLmhSOJlwxNK1fc/MZU
         hDCQyznmRlG8rIxDw6rftjVizQPrTyhen/Y1cWw4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uaRqzyMKV8mD; Mon,  1 Jul 2019 14:41:42 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id A3D3B8EE0E0;
        Mon,  1 Jul 2019 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562017302;
        bh=Ila4b5XRd2YsZN9gdowvmlkMYONzuykQXYhspC147MI=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=h6EHEXdw6NKlBvAsNq1aCJCTkOEYIVOrXryWqiZfDrxI7WjclA+bxnoBtPYZzpvIc
         ldaI+rPsfNUPMmGjTy2sW7myhI+3ACAyIvxK1baZ+w4eK8UJ4bXqhpk4GN2HASz+DY
         lXLkKcm6O2cLE3D8fTMjmiSXKUAOE9hgLbdH3FfU=
Message-ID: <1562017301.2762.21.camel@HansenPartnership.com>
Subject: Re: palo not working on ext2/ext3 partitions
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Date:   Mon, 01 Jul 2019 14:41:41 -0700
In-Reply-To: <1562016779.2762.19.camel@HansenPartnership.com>
References: <1562010854.2762.8.camel@HansenPartnership.com>
         <cec14b8a-4230-8320-990c-f4808f0ab9f8@gmx.de>
         <1562016779.2762.19.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, 2019-07-01 at 14:32 -0700, James Bottomley wrote:
[...]
> Empirically, I've found that as long as the badblocks don't include
> any block from 0-250 ext2/3 seems to be happy creating a valid
> filesystem.  Unfortunately with the label being 64k (so even if the
> palo partition is first it starts at an offset of 64k) and our
> alignment being on 256k  absolute, we usually end up starting the
> badblocks at around block 224.

Based on this observation, this fixes palo for me ... at least I can
create and check a palo ext2 partition after this.

James

---

diff --git a/palo/palo.c b/palo/palo.c
index 68b85cf..ce36612 100644
--- a/palo/palo.c
+++ b/palo/palo.c
@@ -443,8 +443,9 @@ do_cdrom(int media, int kernel32, int kernel64,
 #define EXT2_HOLE	((MAXBLSIZE + 1) / EXT2_BLOCKSIZE)
 
 /* offset in bytes before start of hole,  ext2 doesn't allow holes at
- * to cover the first four blocks of the filesystem */
-#define EXT2_OFFSET	(4*EXT2_BLOCKSIZE)
+ * to cover the first four blocks of the filesystem
+ * FIXME: a problem in mke2fs doesn't allow bad block under 250 */
+#define EXT2_OFFSET	(251*EXT2_BLOCKSIZE)
 
 int
 do_formatted(int init, int media, const char *medianame, int partition,
