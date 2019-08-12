Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34E088A411
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Aug 2019 19:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfHLRNa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Aug 2019 13:13:30 -0400
Received: from mout.gmx.net ([212.227.15.15]:36765 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726453AbfHLRNa (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Aug 2019 13:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565630002;
        bh=gKKcz4GomVjhqEauCc109MXXbtAfCWQvj2NnMKWc6uc=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=an7Ni2DpV5lmIqaPs+N0UwUwZyGry8aFeGQr76Nu934HhovixnpeyIZLGzZF0Ziei
         e/Nq0uY7MZSo4bi0GFwRVfOMzbgAPFtSdKQEiWdG65r/XWKHmgHXjZLwqM5t5gmB4Y
         rXT9mde5Z+kQ23iM3MXM7Z+81WpYUmI/HPTYKbbI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.135.102]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Md3ZK-1hgEzo19oA-00ICcg; Mon, 12
 Aug 2019 19:13:22 +0200
Date:   Mon, 12 Aug 2019 19:13:20 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: speed up flush_tlb_all_local with qemu
Message-ID: <20190812171320.GA28951@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Provags-ID: V03:K1:sP2S7DEzjCythPBwlL0fbbPVWl9L4xQXoLA2i9vb9TnWoBuM/tr
 kbmes35iA68rFYPm4pGO/yVERPUsEYpeZk85V4F9tvEgZsT1smD0Q4XlXm2JRU1Q49kgZUa
 fAnXJxjcbo+C56DzzoBqT778Nim9o82GIqHwk+VSw8GBYT0c7uN2k2zDS7UTEqca4NJIaag
 cjo0J/yEc+Xdes7u5y6kQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p/0r0j0tSsw=:GzR8otoD0hqCY/EPiyfH6J
 /q4apXgkY+zpo6w6BK+SMNgdRWmudfQ/5y7G29QE2dntqj6FquBQwzGq1IXx3QwSk2p1ff0Et
 Er7vvURrpw1H1Oxcvk2KwKV1PLCgzZ9fQldIEXCtYYcZCrxQClKaD2dMmnKG4/w81e0ClP2oD
 YTgIrmT4+hJ0/8Py8SYbxFzGrbb37549FizMoFudbcVIAwCY7hKVKaF/eQLb/RqvykBCW46AQ
 Kji4MbObKYE8PGMZGNbcFf5FTYSkFBqPHg7I6TTbzFqiQjGEF3yDgkgkPU41VRH7SFwUX02fp
 stjTFvkgV15QNvfupf8tAcipdGFB5QDUgYXm18GUxbc0+kqW1VFRge7/tC8g9DXRPqfmwWd6M
 c96/Tw8lReASSHG6gDWJIIy+C2/rfA8YdpKYZzx197phlvSbyjcLxpAyCSPmErp4tZ7r1EDHF
 95jB/F9i1E6bAKP93LXTwgbvaIsV7JcIyi05Bpthu+xatnV7vsw6jKnmyFd6JWgvYKSHBnm5s
 Rjo07eJQdye1OivISYx/iHzuBeRwEvyPPjxGfNjW9wYEOf1KVwuxta5vpJwPbp6xSwJFHEST3
 sc4ISINiXNDAus9GBh9XNnUVpKjZm6ehBMHEQmWpRp6l5NWNFpl8jrv9VUkPGdp1yTe8pFNJG
 hnE/YnNq8UQJ0SfpU6zBUmmJOzNqqcuZeG+0ePmkqdt2naXVlzqJnFhDg9m/HzdyvW+GEOtAe
 LCwPvk1v7yJHZ0o3zt2GUGmQGv54EOlqT9kS3z/H1SlZxRFLObvLcdIWIxNnH5vTr1YYwcwxX
 JbQ20WrdeUwIr5PyDHMhTk+D2ujeLyizkLM+t8CrR/rMnXTLxoAqMQC+SQmyR5HFhpdaVqM8i
 B1HLAeXY5yn2tBp8zObeX3JxIis41gqIihp/uIqNRQzJ7K866ayqkle3cFhcKx92Ni/uKHxzR
 UT1hyOeBt1Sv9Hb9KfLNtSIOeJoH9wJOI6P2sOnyG80IaUjosUJn5cqqZYOg2WGBeGOt7HnB/
 NDjflQc88mqh2LSWl5twxPeW+unfkLZ1kfPInkCjJNLPzEilHyWdG8384knnb5QGUeu6j13XW
 ZUG2SDqhYh2OnD3b4zyxxjm0ixHz2hKJgfyl7nFxCZP3KszEo+2kEd3kQ==
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When started in qemu, we know that qemu will drop all local TLB entries
on any pxtlbe instruction. So, if we detect qemu, replace the whole
flush_tlb_all_local function by one pdtlbe instruction.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index df46b0e5a915..fa092ed1e837 100644
=2D-- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -174,6 +174,15 @@ fdtdone:

 2:      bv		%r0(%r2)
 	nop
+
+	/*
+	 * When running in qemu, drop whole flush_tlb_all_local function and
+	 * replace by one pdtlbe instruction, for which QEMU will drop all
+	 * local TLB entries.
+	 */
+3:	pdtlbe		%r0(%sr1,%r0)
+	bv,n		%r0(%r2)
+	ALTERNATIVE_CODE(flush_tlb_all_local, 2, ALT_COND_RUN_ON_QEMU, 3b)
 ENDPROC_CFI(flush_tlb_all_local)

 	.import cache_info,data
