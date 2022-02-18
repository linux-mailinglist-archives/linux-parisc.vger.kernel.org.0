Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C214BC2A7
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Feb 2022 23:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbiBRWkl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Feb 2022 17:40:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233435AbiBRWkl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Feb 2022 17:40:41 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00865546B7
        for <linux-parisc@vger.kernel.org>; Fri, 18 Feb 2022 14:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645224016;
        bh=Wm552Cni7GA5drzrerY9mp+2IZGmK2tsRNjcuJ1Fr0g=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=RdfvQZ7vRIkb01G3iEWaT79ILJ8BgOeAjp45y8Y1ir4fzaMNlSOKZWe6pY9PkS8s6
         Iccovpe7nGy0ik302hkW5lCbK4d6S4P7uybBcSEaWp1PObY0v7KVnqG71Iic1pdwAj
         E+RR2VZQaNj/mof3caRmnoeNpEcmsKNlj3qU+U8I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.159.38]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1oMtMt0rbT-011isH; Fri, 18
 Feb 2022 23:40:16 +0100
Date:   Fri, 18 Feb 2022 23:40:14 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] Fix ldw() and stw() unalignment handlers
Message-ID: <YhAgTthQ/orMnNba@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:TNTFmCPKzro8Flv/41ZlcDpxK32dsrFvFxYGHNJKA0mIeOIanBb
 cEj0Gcw/qneKxIDLo1OAczwjXYVmqq+Q55sDyD1/lZ5h8MyhlmxitrWDkqIqSs77bmNgqow
 LkRLZoiUcYbu2S1kBfc6ykOKlRKDITxaDK6unFRQcG1c4PjCCCd1pocVZnnsfjbvbOCRUly
 CVEAznS8tWgd1I2zZEhAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1+EoGPxWa04=:otdlXB3/MOu6k/tOjGylah
 3lrGZgeZaZ+A/63ygSJBPviL8Kce2BWNI9t8xv7edqpaImjcgJlbvBKik3u+cbHvnjfryzJSm
 fLrIUJRUI6BOR7/hg8BFlN5+jc94jgYTW1mORbnguTnwS6gZnVjHFm6RPBfZ4vPSjw0Z0x4ou
 ajaQZgQFE/zKshkbz+o9is9cdbaIdG9+hv+1+BVdJ3CX8HpCyUOmMQNI25qHs89qAGGdUoeIT
 Bb0fIwlN05NlEHGo/ckLMOMMXEhwvU1gIUuYvi5CAeO71+1Gnj4HpKnqhYuAHiDUQDqXzXHf2
 ba2/1HWdcIhR7y8saFON0/J/188SNaiTWRaYMiUbnU1dyfSrqPBh0f9d8EI6/spZjxgWNQWbm
 chbMsRA5Jtr+N7tC9L0Gf4k23cjVWJ13f+Yvwar600SpXNnes/K1qd3ORl+TX3nPdPXP+Zk2W
 0cAyVW/MXlwwIjp/XXIov0dZXpWEOUeNxLCaGqNSTJcy+ZNrSewZP3huePdgclFgthLfMANhM
 zmU9hDPi+juIZwrYdikThubKt4g3IK3nomeqYsTWFjxaap6J8xlBI7cxZ+N+VqChYiilHOWoq
 cDOFov9QrkuIMvsHOc7YLAx3X96OPV0AHOHHPwySweUKMpn2zyAGxibzC5PIP5b+F+PK6DXSq
 cGGZqP5t1Rt0dy2wNuuQ+6KhqtH6SuLmfn6WmalAlHHNmlglEyifTLcsHOLPrbyNXhn+j9+6G
 T69Y/O3VSd5oKNjW/KEKtrJRLCDFk2sJBw3evQfhuB85R185rZ/KwcU8C0aHP9SY4h6mm8J1F
 iYoSiPBMejT6j3/9GStvioxfuisIMkd+CGFZj4cklkD/C99nseYxkkE7me5uPB2biHnfbjzYX
 KzGQBvn0PqvOERkel7RiQ8mb3/gLSX6VYBeApj+LRVEPNHMjV5q+4TpfybCnV1X9DdGwDqCT+
 q0zvK7YEywXqrsBO5cQeQlgihSjcXa29gQm6jERx+V1o+0+SGV+hKmFgupg9hm0oXKCQWpwII
 dbL6ZRsH7HTPQUaIIzeWPwPsnHPvB5qEpgAqOKY53enCWAcYJhEs83fPtfpjfDPfSpDOgJ001
 ivhhc2ZLR+CSaI=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix 3 bugs:

a) emulate_stw() doesn't return the error code value, so faulting
instructions are not reported and aborted.

b) Tell emulate_ldw() to handle fldw_l as floating point instruction

c) Tell emulate_ldw() to handle ldw_m as integer instruction

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned=
.c
index a238b7fe8908..02fd2ecf4b16 100644
=2D-- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -340,7 +340,7 @@ static int emulate_stw(struct pt_regs *regs, int frreg=
, int flop)
 	: "r" (val), "r" (regs->ior), "r" (regs->isr)
 	: "r19", "r20", "r21", "r22", "r1", FIXUP_BRANCH_CLOBBER );

-	return 0;
+	return ret;
 }
 static int emulate_std(struct pt_regs *regs, int frreg, int flop)
 {
@@ -619,10 +619,10 @@ void handle_unaligned(struct pt_regs *regs)
 	{
 	case OPCODE_FLDW_L:
 		flop=3D1;
-		ret =3D emulate_ldw(regs, R2(regs->iir),0);
+		ret =3D emulate_ldw(regs, R2(regs->iir),1);
 		break;
 	case OPCODE_LDW_M:
-		ret =3D emulate_ldw(regs, R2(regs->iir),1);
+		ret =3D emulate_ldw(regs, R2(regs->iir),0);
 		break;

 	case OPCODE_FSTW_L:
