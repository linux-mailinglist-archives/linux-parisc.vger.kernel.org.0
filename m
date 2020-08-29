Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3A62568FD
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Aug 2020 18:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgH2QJj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Aug 2020 12:09:39 -0400
Received: from mout.gmx.net ([212.227.17.22]:47531 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgH2QJh (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Aug 2020 12:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1598717367;
        bh=YtUfNYNFxvvYxA815Sj35dbgWNuoRNCw0dw620yyQuI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=SjZ53tQBqBRO/tw+WafOUzb58zP/cg/zFjoRyi36+sR9jGazUykFd6Rg9sQdWF72J
         Nr9t8Tk5ZthgX/4tzNuI9tZzPWakj/ayMolhP99G+lTkJXTS2NaCdBFlJxJ6/69/1A
         YYvHt392NLl0xapy4fhBErIU61Z1UkJAbMuxoofE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.169.105]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmDIu-1ku9ax1vyy-00i8mI; Sat, 29
 Aug 2020 18:09:27 +0200
Date:   Sat, 29 Aug 2020 18:09:24 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Drop useless comments in uapi/asm/signal.h
Message-ID: <20200829160924.GA5329@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:DoQI6wx59dmCcqsy7G8eJwHt24guikioVKa3LSt3FCf8M6Qa2Ol
 pgKVroJmftibZhBCHvz4t8g0S8YH8N3K8kfLMxTiUMaAgXFV5NBQYi+8a15n1QeGK3EeDx9
 E21zmIsyXLH9hVH2F3TOJKmGUHNHsCNkDct48FXI3IE+YaITJ5GRGTZB2dlJfRjyV5/bltE
 cBnlpTWHjheMJWQ+92Krg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vhEOBaCKLmw=:tJAUk2snDaiQZ8Pxg9yuYv
 vXoSmjdXHcGCXeElJ5gTRWD8tdwDqoDvgMLGZ8jsLRVCs3KFXDPjuqhTMrxOyOOJdo7K+fXrg
 wl+tH18vU9aJv2k/QG1DgyVmH2LynpaOK4ONLVfV/4ZKrY0TU/rGhNx5IgO8MvzkWw3r0lJ3l
 jnWL0AM4Kh7m0wZiTopenixxLVyRxp1bIKwXQePMJvgknftUfNVNi9PlJyOmfFoMWSus3y1+P
 bqOgsz8kjTiMJEsWJqTpwHEGsm8NUwz5q4q1QLi1GwZISIktJr0AKhc0UXFP/JXvgtJTWmnXv
 KiAYaKqFbVqWZY6y8l25+wOpk7XFfApVYHnFe737+BA6TnEyFm8v5zYmG2JsNpCDYiKr6dGYJ
 l4DctEA8DIESo4CPpC1ajkmYqjpd925w5z7wEQCv0B28A0a1QCAOJxrZIJIQ5IImtEGGDEcTq
 KbiE6UdhwaKY/hnk29tBcXL9I5DPESQGgtwcaVtT2u1ShAXUUCrWZkTrTUl0Tu9yWPBJoDEM4
 QOrBavktcHbRQt2kLgsjqyLOe6QU5Qy6OREMqEIGQiu8JGJrzveFIEV0ccNIlOV5app2PLKN8
 jG9S7nvKxfogHF38FkP0DOok0gsvvJ9xEfXtOFqc5yyceBn7f66VRRW7i0wt776gMpcGiPYfn
 geKa0/eXLPB2Y3h0hxq0Xyzu0vTG1usus8CYfyPAqoydoYYT7XE6aN+2ztvephExllP1RVEus
 LTfKhhmhrLaPo/hxPCRy7WmjrdEQTzumDGgQrVOYuA+TA5gvOYHlh589qIEJqYjLDlE9+w0Dp
 sWSLVYYd8NlxHxAOpNKn0HAqjBRBgGhAqK9hKSu1ivTqpGV69S/1V5ZuK2qgOFJIUC9DDryvr
 XuOEgJGYS0RYqTYUzM3mX/1nrnJrQEzHErFCiyH/VdDpSCm26iImXtgw0SCJ7k9W/VaT1+RKY
 AK5lnGFQFJukLjhdCNuDvjp/VMMU51lex97hPOYiAOh2ID60dJtKqZheG67KQqX84X/MfCDtb
 krpv63HNpNdToamMYhrFKj8rUf0VtyTvxtbXtM3wsL7NuUvyL07u1AzpP5j4DWTXbOoMB+ms0
 ccIQZ4GD7myyTCTo5n06xUahoCidH1V2k41ew3x0YtUmRKkg/aBl+ZjfFjSyxDA/eqrdUUUxN
 EJTb/WTycTKpXgJxYy2I3DzDFx43ClJ0Tsw7GF6r3kpREjxFS9HJs2RLkdwwXOakVouW1ghD0
 Mr7Lk+guPQAzviWx9
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/u=
api/asm/signal.h
index 045fde6d2fac..e605197b462c 100644
=2D-- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -35,11 +35,11 @@
 #define SIGURG		29
 #define SIGXFSZ		30
 #define SIGUNUSED	31
-#define SIGSYS		31 /* Linux doesn't use this */
+#define SIGSYS		31

 /* These should not be considered constants from userland.  */
 #define SIGRTMIN	32
-#define SIGRTMAX	_NSIG /* it's 44 under HP/UX */
+#define SIGRTMAX	_NSIG

 /*
  * SA_FLAGS values:
