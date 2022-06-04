Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4A453D737
	for <lists+linux-parisc@lfdr.de>; Sat,  4 Jun 2022 16:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235423AbiFDO1I (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 4 Jun 2022 10:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236341AbiFDO1F (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 4 Jun 2022 10:27:05 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E353B2B6
        for <linux-parisc@vger.kernel.org>; Sat,  4 Jun 2022 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1654352807;
        bh=MK7DuyiZdK1YpKOOq0sNLlM/dwzCP4yHWHcA3XxuvMQ=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=BOCRUqW6BBKlnUOr5xhcCtPIJY0sMnlPMhXg2H8/4HmqMdVo7qn9YmfuirVykZLMz
         paE7rF4M2BWqG/8H0DrnCe2anZIXDo5RwGAzHrq1qHWdA4s8MOAGVGbPkyf7OfQFFk
         oLQymJneyjuUdwuaSdnsN/h3l2dp23XHPQwSjELo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.176.199]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17YY-1nly7p18eY-012Z8L; Sat, 04
 Jun 2022 16:26:47 +0200
Date:   Sat, 4 Jun 2022 16:26:43 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Mikulas Patocka <mpatocka@redhat.com>
Subject: [GIT PULL] more parisc architecture fixes/updates for v5.19-rc1
Message-ID: <Yptro6e0a8xyXVRI@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:EFN/OgPgciWyJ2X23D2hHvITcGUIgS6J/6uoJ8xuz59XHQn4iKF
 KljBpBeKd77e+9U7AsvZH2J3x4MhIUD5xHo9MXdD7sorMJoKffIqk94oz/urEcRzEKfFfKL
 lwDPspoU7HU9+dTh8gtIlY+NTtWGwiuxG1ayvwbXO5X/jUMUSbCdZE+MqU5mASdYueFapVL
 AJb1UL7oucpZJvgQc3j2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zPOzDRZVDII=:U9mLl6f6CQKe7XLLTxfLNi
 9Kktd2o14wR1R2YuLAF0BerWyNqWFKak1MrQ7rC8UKQQ2NAKkCRvoRsW4TSAfzsGVG7qZIoGq
 2UnxpibnmEKUN96MGaOIT2V+hxkUz+oXXoS9k93bzYY5TVhErotBYTk54QPBEddDscFNlqDO/
 JlgeDs1zc+8e+8Egl08+BhJMqR4zqoAlzxvdZ27ArZldQkv55Q14jE6gp0FD9eCw3kwQ+tBoi
 AI1safZFwjTJUh7Egt8khFEOigJQAuZABHabH9eg50CkapbJC+vqY8of5YjAZPTuarItNCyIC
 3VzpRKMPzWwC4fSExA8GBQh7ilr+NNdEqnfdnaMZzZOWCuUfh/HD3WnHvrA6HA1oPLl7OKVCX
 zpavC6LLcVwO5+PTLRLuD0GYyq7FDIW0PDDfKQjFnJcdNIlaWXOIe25RRh0I2Q0oWP220txCr
 cGl3TJJflBLSSHO8nUJkf6pyWRTZwTmpufJAjE/cWNQdjlqu5SIGGNY0gvFc6oQVca6P8P9wT
 MSbP1fo1PnmGJGYR9a0l+GDkGzXRJeRb0aIwstmYAnhZS9oawgCHWFOBU6yNLpZgKUIiDejvX
 kkfeo6XYtMtCxvFe7E8vy60noEeXauh4gtyH1Uy6cB5ZQmcU1XVjpvMM1h2JDfOux6toZXLxM
 eWqmJxLpoeP3SESjiEq18q8t4hjbd1bQpfW7d2Cdgju+3XPM57ecSrlWUYaClF1uXXJzkIyfq
 dUKit5cUvbmV+jJcJbCbOqUPujwfw/VMg+7KnVanNut/0KVzQnPWVFnFaC7JNpQ+LhrX8FknG
 TBZwof/gimDQuNTds1NSDqrbXUCvqQSOn1m7alZShEv972U7oKeLKY/YgR/Z2rdYCNUjnThqk
 Y/LOhRy87XntSYbbReU0v0WnCemtcDdhqjhX+A6RLIG0mwaMEEgpFE1gU3XfRO+pKodckMUVB
 9nOPfF3UYQl3BM5nS+IeH2nTNP4yPcu99efummUqiqx1/QLUn6a3hS6Ym5IMWfPSj0+Xzxd//
 VrH2j/PMNJq2Xz4VRf4zely6cW/onIQoa2GrF06iNeTgYpuIAG26F8sIz3fNxzV3Ge6U+UmE1
 w+3dO4CQu8wv3yTazvIV7mBrP0zKBtHnPEYYF44KfyKM6qk6Dy6SFDv3w==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Linus,

please pull some additional parisc architecture fixes and updates for kernel v5.19-rc1:

Mikulas noticed that his C8000 workstation hangs at bootup with v5.18 if
CONFIG_SCHED_MC is enabled.  His fix rearranges the topology setup and thus
prevents the problem.

The other two patches enhance the info from the STI (text) console driver and
add the missing fb_is_primary_device() function which helps the framebuffer
driver to detect the primary STIfb framebuffer.

All patches are marked for stable v5.10+.

Thanks,
Helge

----------------------------------------------------------------
The following changes since commit 4b0986a3613c92f4ec1bdc7f60ec66fea135991f:

  Linux 5.18 (2022-05-22 09:52:31 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/for-5.19/parisc-2

for you to fetch changes up to b046f984814af7985f444150ec28716d42d00d9a:

  parisc/stifb: Keep track of hardware path of graphics card (2022-06-04 15:47:03 +0200)

----------------------------------------------------------------
parisc architecture fixes & updates for kernel v5.19-rc1

A fix to prevent crash at bootup if CONFIG_SCHED_MC is enabled, and
add auto-detection of primary graphics card for framebuffer driver.

----------------------------------------------------------------
Helge Deller (2):
      parisc/stifb: Implement fb_is_primary_device()
      parisc/stifb: Keep track of hardware path of graphics card

Mikulas Patocka (1):
      parisc: fix a crash with multicore scheduler

 arch/parisc/include/asm/fb.h    |  4 ++++
 arch/parisc/kernel/processor.c  |  2 --
 arch/parisc/kernel/topology.c   | 16 +---------------
 drivers/video/console/sticon.c  |  5 ++++-
 drivers/video/console/sticore.c | 32 ++++++++++++++++++++++++--------
 drivers/video/fbdev/sticore.h   |  3 +++
 drivers/video/fbdev/stifb.c     |  4 ++--
 7 files changed, 38 insertions(+), 28 deletions(-)
