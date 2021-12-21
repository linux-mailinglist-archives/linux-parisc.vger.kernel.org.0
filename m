Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3715647C65E
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Dec 2021 19:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241205AbhLUSV1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Dec 2021 13:21:27 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:13992 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S241199AbhLUSV1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Dec 2021 13:21:27 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197730202F3898D
X-CM-Envelope: MS4xfCISzGsjNk8zeVaVtZLzwTkG25Cz5bJQfh3QgvATfnmI55ABy+dVBlv569ixFHb1HPMWEblUzJruCTWaOIGpYQWI6JiMtdrvlF8BqoOOtCwwnC7I0540
 FA4lz6dpOfmljgQDe9efH0ZBrZaWMSStUTDEEb2kXzTsdvOA/BMvwghecbfZkkbvZqKRbpT557jGTVvgQNyj0V34n2XCRfnW9trspAawALzecGQThHkOnrdZ
 xY9T4/UDIn5d3K7xwRMdgUXuvpoOqGqjkBEviuF1EkC3Rv101PR0W4RgE60nEw17SDxIzMovgelZUTjhJmNLyjX65TRuw51hFWwK1xv5u1grrRkDRqRLuztn
 5WPN+dgA
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61c21b23
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=a802jQxfsxrbjbw-0jgA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197730202F3898D; Tue, 21 Dec 2021 13:21:23 -0500
Message-ID: <44843798-7888-345f-84b6-f961960867fa@bell.net>
Date:   Tue, 21 Dec 2021 13:21:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Correct completer in lws start
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Correct completer in lws start.

The completer in the "or,ev   %r1,%r30,%r30" instruction is reversed, so we are
not clipping the LWS number when we are called from a 32-bit process (W=0). We
need to nulify the depdi instruction when the least-significant bit of %r30 is 1.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index d2497b339d13..65c88ca7a7ac 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -472,7 +472,7 @@ lws_start:
  	extrd,u	%r1,PSW_W_BIT,1,%r1
  	/* sp must be aligned on 4, so deposit the W bit setting into
  	 * the bottom of sp temporarily */
-	or,ev	%r1,%r30,%r30
+	or,od	%r1,%r30,%r30

  	/* Clip LWS number to a 32-bit value for 32-bit processes */
  	depdi	0, 31, 32, %r20
