Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66E5453251
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Nov 2021 13:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbhKPMnV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Nov 2021 07:43:21 -0500
Received: from mout.gmx.net ([212.227.15.19]:52189 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236242AbhKPMnS (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Nov 2021 07:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637066415;
        bh=hGdjKiBG1Tx+R13mUJHlJY98twTbk5+FDTzZ2Ia0htw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=XgESevNNqbStlqV0dTsoqbCicnzcLCeu4xxK1wI5w7auKfVnZWyPq49hYKydKPpGy
         Zgf55nmW1h+oq+M2rhn3bf6FWMREc7E/QM7fWHj1q1rfD23Gc9nP1upuponzwZ/OD2
         s2GrBxntkhVeV9XI5P+qgfK5qha/RWJACSMoNBkE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.177.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHEP-1mAcw14BdT-00gsys; Tue, 16
 Nov 2021 13:40:15 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 1/4] parisc: Include stringify.h to avoid build error in crypto/api.c
Date:   Tue, 16 Nov 2021 13:40:09 +0100
Message-Id: <20211116124012.1380455-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Rxg5V/e4zP3NVKMa7YpNzXtv1w6gqNZ0v+gExNeSMe9ZssFMeKx
 GapH9H3es0oVZnENoS31MNfgygwxbCth+jNJx+wSdorxp6+p63CgX8vbQqS4mcfMgvrklBl
 OpKzlX7oFACsuO0hW+8HYzaNM0zlT4PQFLmeAklkRB2evhizITblj26gXKvbsq934A43e2y
 l78kNbvjbrHGXO/LtIguA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Plv1lTVEfHw=:whHHsWHnF9APOZ8L+JKJTJ
 aEUjPFU6hfT+yKZi9HLKzhef8P8lOxyYaPblT3kY/vGbGR0r0IUjflAxFga7/ClGaPxK2iaNT
 FujC0NKX/8akHDS0w0lhmB6RU4WEFLehJpbQaAFOev4aMkncNBcbmzz02yOooZa0wkYd/r4QL
 /+xGR/o5Dwf1/Vw8kohp2srTLcnv3JXtn+UEOYMj4pPo2AyYuPFp3CFzF6h9dUFJimZgoa+Ic
 AjgBskNQwheZqbMjSSDjrr6EZMs2ViN7Q77vlMDGolYDysDBiVgKxO9pqf8/BdXbfd3f86msj
 1uoLr03yLpdbDUX40r6/rh44YvalwShOfRB/M5nJqF3bpNdpFklhHunp4vclVoo+k3vkE1GCN
 diQMlgnrvr1xjYpIkcC8st23rg9AGEHC0vVWdBz5zzcMga9f6iSVar/4AHqRa/W+CgZgarHx0
 5wR8D9kHhn5D9O2Q9K/D5zsAilXTq4htRxZxhF8p+tFZJ96Z2LCMB6jYcCi7cppIeHIaQT5un
 cQvEfwc6+9GpuHGA+CVtVrIHkkyKpL5jLPV6MpGT3j2OGZhgERJkdgQm/xCGuCCTpn4EqO6mS
 Qkcc5jCarm6pNYcy4Xic4me0GZ/VfTLp6wwNGF0DMq4OzBGS6Oi972t+gvmReZBcQH75SVVE9
 cNaBF6HkvP80titCRGlXjzIGvaD4lb9qZwpjrsa5ANVLTFRyF02fjE4CoaeBh+FOfH5C6xmYB
 suwKsxvqPgTwWgzaFOwD7S7YSbsvFCSGSORXL4mTDo3xcKZLNqYWIcEVHMoY8NBwp+1qEkRiK
 okqEH1pMzc+C0E7/dMOH9UhNuPLkJtyetDJ3ohLShjH8OhFE/qlb6tvqKHKoQ4onrVspX3OAg
 +Grqp8KCkmsdQ4gV0LJ/lKVo82S2MpEo4mT6Fh/jwCNzWcZ/2i8dm4NEszJ279ym+VOD82exA
 NeOxoNZH8tUAmZXQz2MxFp01QrisTxVbGqvQQ5tQR0i453XwNw60uoij0GAYqYbUHK3hgy1B0
 i4pzCcyXwn+FflwaxvzucYetcnXkIIFVpttIW9y8sSM1lv43gwC6SoUuM7JJjeXlYcVBuJR7m
 w3whCLVf/w0tNg=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Include <linux/stringify.h> to avoid this build error:
 arch/parisc/include/asm/jump_label.h: error: expected ':' before '__strin=
gify'
 arch/parisc/include/asm/jump_label.h: error: label 'l_yes' defined but no=
t used [-Werror=3Dunused-label]

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/jump_label.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/include/asm/jump_label.h b/arch/parisc/include/as=
m/jump_label.h
index 7efb1aa2f7f8..af2a598bc0f8 100644
=2D-- a/arch/parisc/include/asm/jump_label.h
+++ b/arch/parisc/include/asm/jump_label.h
@@ -5,6 +5,7 @@
 #ifndef __ASSEMBLY__

 #include <linux/types.h>
+#include <linux/stringify.h>
 #include <asm/assembly.h>

 #define JUMP_LABEL_NOP_SIZE 4
=2D-
2.31.1

