Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4162929DA
	for <lists+linux-parisc@lfdr.de>; Mon, 19 Oct 2020 16:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729606AbgJSO6B (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 19 Oct 2020 10:58:01 -0400
Received: from mout.gmx.net ([212.227.15.15]:38459 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729594AbgJSO6B (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 19 Oct 2020 10:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603119474;
        bh=QS8WsNELMyK6RIybv3KtF3B1dm54ecJpsHcbqt+Mw0I=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=BTr7RXvDdcbwHXM27LaOa5vRDzk7Jio4vtSTr2T9Ma34iuEPvRUhVnOKWHlB6gONK
         y8lz6kaKxdX6bwhEOtQ3qRchPyZIZ5r2NOz3+Puy7tDtLtll7sGhzCAlo8g5X6Ammz
         EUeSmlzYCGAbg0adKfX9mHoj+GavVXssz9kZMe+Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.136.179]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1knrCu0H8g-00PvR7; Mon, 19
 Oct 2020 16:57:54 +0200
Date:   Mon, 19 Oct 2020 16:57:50 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] hil/parisc: Disable HIL driver when it gets stuck
Message-ID: <20201019145750.GA17788@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:bZLeCzN7yhoj656+ds66kFR2HzWJot/i0UggulM8asbwZnKD8Ob
 2lv/1Rmwo2S49PMKMcy/KHp9e/kmzkSpw8tLiDGJ4Qz5dkzWjxZeFJN6Ys4ONaoI+7rmTXF
 tB1c42pXLf6eZDvcz4eK5cLJCyhgtpMXBAhRaxUeUK16I3wsauHB23pbNdK4FxopMPmpoMW
 oEEwxmZILRsH2QOY93rOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kjRXG3SryFA=:+UeCf5jHySdi78GJIQdTko
 8eiRO17lFh4voSaPXLi6pltRepkQl9GVm8X37dW8iTtqvHKmSNnpJyh7ZNpOY/zJmEC/gMkxB
 Yac+KE5K3CG1WGMeONA+vud7UHwd3xrvKDYTrw2qwGY0SR+kYfwzOHewSZuiSg7sRvcvd7moR
 R0CVDwgZv3BPqfrhaEZetTcV6m1thXb8pZx32AEJ1yCKJYjh0JzGvB6Omrb1/zk4MabfhNjAP
 gDZRv6H2X75uMXRQzqsJ89SnjcTEdOsB6oNoKZxPXSmA+8a58C9l6BbDHBzwzqYajr/HnKb1K
 DLJR22gfwn8HjPP7g6F3d2bGeUv4KikShvFBiuGvIjLrG7DuLrjv4fvA6dqpwDi9VKBYnT6Cc
 Pt/TZSjuSdxYCxfstClhhrF/COpTzkJc/5vsPKD0tEroMin2/lASCdLBVgiaqrnXVP2urIekh
 5vlZD9h5FAQCu4B3sJDt3B+XkswR4gfqNGdhgxOnrOb5S5vF3DNxsWDcaPMcTzgym4ebLNHxV
 ImzALVuNDymOLP2GQwJGvpiZ2ps6mjLn0t1zSaO2EubBBomjl7ruTYBOibOXsdUpcP92WfwXk
 6lfppXAmyRKcF7JHMqdwdJ5pWi8nkVeUA7oqrANdSwU7UG3HpLMs0350L547JesHXYZQOWmAU
 M14xIhCbU4llrtYpSnAceoJNE+vhWl8DpiQJ8CMMBK1nVTfAQQg1iAiJxrQJZvd4aWFYCFQ+E
 pgjL/XcuR4DIYexE06BGcW/UG7QaLCE5H9adqhZgfdI7AESNzUvI2qHJGX38jdWOAGDAzdlS2
 6mvSqZyluZO9c1TCYlt6NT/GTABxfXFmcG6FQWq9k22kXVzi2niCAz4bKdI2eIFN0KSE87S+2
 0vhijlv7AZJBhqyhxdFw==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When starting a HP machine with HIL driver but without an HIL keyboard
or HIL mouse attached, it may happen that data written to the HIL loop
gets stuck (e.g. because the transaction queue is full).  Usually one
will then have to reboot the machine because all you see is and endless
output of:
 Transaction add failed: transaction already queued?

In the higher layers hp_sdc_enqueue_transaction() is called to queued up
a HIL packet. This function returns an error code, and this patch adds
the necessary checks for this return code and disables the HIL driver if
further packets can't be sent.

Tested on a HP 730 and a HP 715/64 machine.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org>

diff --git a/drivers/input/serio/hil_mlc.c b/drivers/input/serio/hil_mlc.c
index 65f4e9d62a67..d36e89d6fc54 100644
=2D-- a/drivers/input/serio/hil_mlc.c
+++ b/drivers/input/serio/hil_mlc.c
@@ -74,7 +74,7 @@ EXPORT_SYMBOL(hil_mlc_unregister);
 static LIST_HEAD(hil_mlcs);
 static DEFINE_RWLOCK(hil_mlcs_lock);
 static struct timer_list	hil_mlcs_kicker;
-static int			hil_mlcs_probe;
+static int			hil_mlcs_probe, hil_mlc_stop;

 static void hil_mlcs_process(unsigned long unused);
 static DECLARE_TASKLET_DISABLED_OLD(hil_mlcs_tasklet, hil_mlcs_process);
@@ -702,9 +702,13 @@ static int hilse_donode(hil_mlc *mlc)
 		if (!mlc->ostarted) {
 			mlc->ostarted =3D 1;
 			mlc->opacket =3D pack;
-			mlc->out(mlc);
+			rc =3D mlc->out(mlc);
 			nextidx =3D HILSEN_DOZE;
 			write_unlock_irqrestore(&mlc->lock, flags);
+			if (rc) {
+				hil_mlc_stop =3D 1;
+				return 1;
+			}
 			break;
 		}
 		mlc->ostarted =3D 0;
@@ -715,8 +719,13 @@ static int hilse_donode(hil_mlc *mlc)

 	case HILSE_CTS:
 		write_lock_irqsave(&mlc->lock, flags);
-		nextidx =3D mlc->cts(mlc) ? node->bad : node->good;
+		rc =3D mlc->cts(mlc);
+		nextidx =3D rc ? node->bad : node->good;
 		write_unlock_irqrestore(&mlc->lock, flags);
+		if (rc) {
+			hil_mlc_stop =3D 1;
+			return 1;
+		}
 		break;

 	default:
@@ -780,6 +789,12 @@ static void hil_mlcs_process(unsigned long unused)

 static void hil_mlcs_timer(struct timer_list *unused)
 {
+	if (hil_mlc_stop) {
+		/* could not send packet - stop immediately. */
+		pr_warn(PREFIX "HIL seems stuck - Disabling HIL MLC.\n");
+		return;
+	}
+
 	hil_mlcs_probe =3D 1;
 	tasklet_schedule(&hil_mlcs_tasklet);
 	/* Re-insert the periodic task. */
diff --git a/drivers/input/serio/hp_sdc_mlc.c b/drivers/input/serio/hp_sdc=
_mlc.c
index 232d30c825bd..3e85e9039374 100644
=2D-- a/drivers/input/serio/hp_sdc_mlc.c
+++ b/drivers/input/serio/hp_sdc_mlc.c
@@ -210,7 +210,7 @@ static int hp_sdc_mlc_cts(hil_mlc *mlc)
 	priv->tseq[2] =3D 1;
 	priv->tseq[3] =3D 0;
 	priv->tseq[4] =3D 0;
-	__hp_sdc_enqueue_transaction(&priv->trans);
+	return __hp_sdc_enqueue_transaction(&priv->trans);
  busy:
 	return 1;
  done:
@@ -219,7 +219,7 @@ static int hp_sdc_mlc_cts(hil_mlc *mlc)
 	return 0;
 }

-static void hp_sdc_mlc_out(hil_mlc *mlc)
+static int hp_sdc_mlc_out(hil_mlc *mlc)
 {
 	struct hp_sdc_mlc_priv_s *priv;

@@ -234,7 +234,7 @@ static void hp_sdc_mlc_out(hil_mlc *mlc)
  do_data:
 	if (priv->emtestmode) {
 		up(&mlc->osem);
-		return;
+		return 0;
 	}
 	/* Shouldn't be sending commands when loop may be busy */
 	BUG_ON(down_trylock(&mlc->csem));
@@ -296,7 +296,7 @@ static void hp_sdc_mlc_out(hil_mlc *mlc)
 		BUG_ON(down_trylock(&mlc->csem));
 	}
  enqueue:
-	hp_sdc_enqueue_transaction(&priv->trans);
+	return hp_sdc_enqueue_transaction(&priv->trans);
 }

 static int __init hp_sdc_mlc_init(void)
diff --git a/include/linux/hil_mlc.h b/include/linux/hil_mlc.h
index 774f7d3b8f6a..369221fd5518 100644
=2D-- a/include/linux/hil_mlc.h
+++ b/include/linux/hil_mlc.h
@@ -103,7 +103,7 @@ struct hilse_node {

 /* Methods for back-end drivers, e.g. hp_sdc_mlc */
 typedef int	(hil_mlc_cts) (hil_mlc *mlc);
-typedef void	(hil_mlc_out) (hil_mlc *mlc);
+typedef int	(hil_mlc_out) (hil_mlc *mlc);
 typedef int	(hil_mlc_in)  (hil_mlc *mlc, suseconds_t timeout);

 struct hil_mlc_devinfo {
