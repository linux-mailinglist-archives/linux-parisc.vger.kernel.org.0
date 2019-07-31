Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B94117C776
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 17:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbfGaPuE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 11:50:04 -0400
Received: from mout.gmx.net ([212.227.17.20]:58623 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbfGaPuE (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 11:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564588197;
        bh=Zn0EkGYgTMM7CrOyPEUQHG+h2HhiNvIDy6gTwF/8g1s=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=SP3JXFRRdpp7j9SUY22t3YnbMwyL/MYXqKjOUTXDOE69bG3JtKQh4CokhzGEc6iep
         D617fE+xPuBLslvBdpQCZk5a/mi3TBEE85rL2BuS9rb5M7Eswwj/TMHEm6GN+XL+BG
         pHpdQXStdr7+CPJLuDKi+5bOO4Zo0ZcEJicQJoCw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.174.24]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUnp-1iGgJQ2Qxt-00xuyP; Wed, 31
 Jul 2019 17:49:57 +0200
Date:   Wed, 31 Jul 2019 17:49:53 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Mark expected switch fall-throughs in fault.c
Message-ID: <20190731154953.GB21186@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:s4H0VmMY5rSbWCSqIC5P1znWkH6hoTbN9IfVkBrzx8JDbcNQHFK
 Id9+VlmQHCCmivu+TGcXPkYazBixW5Aoq9ArVQOIsCmsUdbFfOqJVKjRCvlvL7nFMigLwVQ
 QF6p0jQNhVQ8TkWkZpW1+C5tWrvE9Ud8qvgonwdKnGdyYElV1Bwq3+JRuUarA1PO3mpT3nl
 RNNeeL+9DDLSvxweVCXqw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2I57wUeE+FI=:g1VEesnF5FmIZ6B/FGVT1h
 vIRdizmSg++XZ9hppvf4gY7SfgqbPofzXqUgRpLSXxxVHJSGkuTdCqbyHH9dl82h81swiBYkP
 YTGKO2rwIv40M9yJvS3uPjzsm7FDdMx9X3UzR0kpA/iwm3GUQ0/ztBiULYrKi5vQqxzOq0ONd
 fgKDtnfFrKaqA+SS/gCYrhiVdIEqdkjbx/xNGVVv6RoMXPgwQUGD9bj5nnqCCTtkl55MV9VBK
 8ONuzLjwyzc8KP6/pK5m3D4dqkuMtarFgrNHlRNXZ5wBe15TFE0H05uetdLXT+0hnk0FG7Jac
 A0+XXj2BO8tNox1lEXIbuu3eAi6DXLqYse837o2ZTphB3/Ojhz65eIsXuFlIaoYNb6ZlD60B6
 TgoLfGWBr2z1lhW7ATZA8vbdIGIMIO45aiyPpnks+mtgMr0fpFA5cKp92Mn8mkmOgkm+DpMMT
 bVTwonAfcb/xX2HTXyxFZf9mXFEy7AgXHO6ttbP7+87J8FdU+D4gosTy1DbOCbzkUIEAH+CN2
 in0000RWEPXYfCXaRQo0/0dbqfQZSw8Rd/TZoDPUmxivCxB015HhnTBgLUKcyeYMPa8pcD80W
 bkRFaeGpkpTNDH6pg10nzaB8ugHksnG7ssauHN9wbBtqWPOdy8zGIresRQjDlrg3Qi9aiSU0P
 a6wXFnCSHK70nW2gHvPkKx0R/bBBVYIQO++g/8ED/vhZT9L0zhg8u7o6fI8vWcLktnvy+CCsr
 atlSyS61OyLzyrHRoRWqhpA3y15rQ7kpTQoAuvWICdlLAmzchnh8Po9Z+N5KiYYskkwg0qXJU
 AqJXGzR7qLtb4gPLnF9BZIhp/qTJmK9hfJBizVUzhqVD3KiZKvukNosdlywcu68Ksdhdfjkns
 sDMhqa5WFb6xvhvJhNy5/2gNdVFKt0v5AjnpGi0P+Tg5DwX30OELwj17164zsFQqKOGfSsxH2
 rRNlRnDW3wqtddrIovQLU4u/TISD8MCzaMY4cLovZyBIAb/+CZdNAvUx967CDgQ60nd7Y/6Mc
 G8mdr1cIz+OJVoktAS04UqpkIbq0QHWba85Ewao2rN9s3FW3kiwa3vv3qU9Jyl0O0Q==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix a fall-through warning in fault.c.

Fixes: a035d552a93b ("Makefile: Globally enable fall-through warning")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 6dd4669ce7a5..adbd5e2144a3 100644
=2D-- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -66,6 +66,7 @@ parisc_acctyp(unsigned long code, unsigned int inst)
 	case 0x30000000: /* coproc2 */
 		if (bit22set(inst))
 			return VM_WRITE;
+		/* fall through */

 	case 0x0: /* indexed/memory management */
 		if (bit22set(inst)) {
