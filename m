Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC3E46877B
	for <lists+linux-parisc@lfdr.de>; Sat,  4 Dec 2021 21:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbhLDUl7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 4 Dec 2021 15:41:59 -0500
Received: from mout.gmx.net ([212.227.15.18]:32841 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231989AbhLDUl7 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 4 Dec 2021 15:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638650305;
        bh=5DAGcvJsIOggRgn1qglZMJODsED+jQJnJescA0GOyTg=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=hmmyHJOtc+5i9ZCPEh6YScNaHVreHhmD+Aiu+T+tzjL8XWlY3VJGug3QJ4dw2PxhJ
         vFaqArlSiW7Bxwmp9et9fy+A8rqkRyYA+LpYi55zgZ5GRRf2mWR0TJj0BsI+HmRrXI
         /ucHP4+iU3xCIIPZnE+8/NM1tBOS6q7ro5RjosI8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.151.242]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2wL0-1msWPE3MS4-003Oh7; Sat, 04
 Dec 2021 21:38:24 +0100
Date:   Sat, 4 Dec 2021 21:38:16 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Mark cr16 CPU clocksource unstable on all SMP
 machines
Message-ID: <YavRuLrAUqtYyFW0@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:u6wuRk8wTizAF8sg9qYfo+ONiBqEGK+eJ5ToHQu568jwC4d1EKd
 QirsqhrBRUfSRB9np03ffCLgPPPz4of5nB1KbjBGDPVsZVV9cRWr5G7RiuVI8EdUIQcr27Q
 s/13tITxnWp+TVxmxBWK94SFX5bZuizjYVHq2QQLNSLUxGPyFE7Ynp6K75oX5Olu3ohUj9n
 dHqP9wADdqiG6FC9thrCg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oGIH0GAyGFw=:KiG+SEOsaa4fILfmfgHKm6
 fj6UfIZaaz5LJkuITZDexNL40A06jp8vU2AkGiPjmDBVcVZifMAa7PV5H0GGb8jLrSdHRrNmY
 O8TrKX8o1b+k8leqd09bzDYzxCzDXm3ImoGHOQh9y/fSRHQAgRBh/POYjiDp2wVYg4rq5Cv4C
 j1vQdxgvol6H8HLUFFDVpNJnYk0PKf6xyFVfmw/qiOfV0pgLo5cryTlIs7ZW2xZIexOqTU+8u
 rxaFjm5gj47GgpbYtg/rrV69aBTpwa5j3Wcq5QXa7vsz5ycLjHxUl4vCP9PvHr2HZo/WPi8O2
 e1v9UdgrvlkkhO9vNmc7qcdJECUwc85CMPWGUzeKos63j19NimVukzsDKaiOIlzL7brfTb5J2
 yvEyzLXOm2gEhirHrnGyEG9NmqwVHVUHS7ADhQ5Jmsl4fuH/DGvPSuMorrVWYeNu7jeagjZNY
 Uiqt5t2y6K8kJIrpU+RK+dRUJRJOFVcSrgOuujYOqXejROlk6xlV2eQIKFc5Cm2pSrvBguCDp
 TcqeYNsJXAfUKSj7Kzg13L1UYqG0/eD+CuiEOXpUJQD9Nduglud4QB8mrMIEfejI+VgWEkpl3
 j2rn/XZ0KKLcJidHM63IXXamuMjbua+j0tQqEROsnO7wBlWC89MIiMtqQprc8QySm+NuzbrOv
 qsGksS2oIKKUFU28kYjE5GyrgHaYqziDuadMPCBlsyQ5+LoEiJDDVR5tYpjHTmWs5EEVBxJED
 5rwGGW/VAUrL+JK83aFz/FunpH9RbzkGr7py3Swl7t8utCRP9HSHLcnzCW8j6/allYL8OE8bd
 AUC2ZdkmIa7L7XHK73MGessC43IPeYBZMRPtcHCEgUioWb1F3+oGBsu+IfdcI2w0qwM8IGg5o
 eG40MDAAUw6zYFYCshEKNwHWPO7dLz0d911faXVXnrTyR6CujQGfD+/FErPSmu05TUbbc/wui
 NY/mR0XtVEbRgWgdSD4z2MrCopYHB993vD8GDOKxU0gdWGaZ+hv+Nj2YhaVWE5E7JFRFfNgLs
 7iFUSrjX5pwO7Qjqe6XT2hQGvIwvqgDJykq45g/jEeLKdO19bLtAQe6fpT8yQqK00yYmagpRb
 9qMm3BzI52jLhc=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In commit c8c3735997a3 ("parisc: Enhance detection of synchronous cr16
clocksources") I assumed that CPUs on the same physical core are syncronou=
s.
While booting up the kernel on two different C8000 machines, one with a
dual-core PA8800 and one with a dual-core PA8900 CPU, this turned out to b=
e
wrong. The symptom was that I saw a jump in the internal clocks printed to=
 the
syslog and strange overall behaviour.  On machines which have 4 cores (2
dual-cores) the problem isn't visible, because the current logic already m=
arked
the cr16 clocksource unstable in this case.

This patch now marks the cr16 interval timers unstable if we have more tha=
n one
CPU in the system, and it fixes this issue.

Fixes: c8c3735997a3 ("parisc: Enhance detection of synchronous cr16 clocks=
ources")
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # v5.15+

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 9fb1e794831b..061119a56fbe 100644
=2D-- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -249,30 +249,16 @@ void __init time_init(void)
 static int __init init_cr16_clocksource(void)
 {
 	/*
-	 * The cr16 interval timers are not syncronized across CPUs on
-	 * different sockets, so mark them unstable and lower rating on
-	 * multi-socket SMP systems.
+	 * The cr16 interval timers are not syncronized across CPUs, even if
+	 * they share the same socket.
 	 */
 	if (num_online_cpus() > 1 && !running_on_qemu) {
-		int cpu;
-		unsigned long cpu0_loc;
-		cpu0_loc =3D per_cpu(cpu_data, 0).cpu_loc;
-
-		for_each_online_cpu(cpu) {
-			if (cpu =3D=3D 0)
-				continue;
-			if ((cpu0_loc !=3D 0) &&
-			    (cpu0_loc =3D=3D per_cpu(cpu_data, cpu).cpu_loc))
-				continue;
-
-			/* mark sched_clock unstable */
-			clear_sched_clock_stable();
-
-			clocksource_cr16.name =3D "cr16_unstable";
-			clocksource_cr16.flags =3D CLOCK_SOURCE_UNSTABLE;
-			clocksource_cr16.rating =3D 0;
-			break;
-		}
+		/* mark sched_clock unstable */
+		clear_sched_clock_stable();
+
+		clocksource_cr16.name =3D "cr16_unstable";
+		clocksource_cr16.flags =3D CLOCK_SOURCE_UNSTABLE;
+		clocksource_cr16.rating =3D 0;
 	}

 	/* register at clocksource framework */
