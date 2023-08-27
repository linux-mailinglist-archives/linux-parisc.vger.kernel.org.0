Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69074789D42
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Aug 2023 13:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjH0L2X (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Aug 2023 07:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjH0L2F (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Aug 2023 07:28:05 -0400
X-Greylist: delayed 150 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 27 Aug 2023 04:28:01 PDT
Received: from mxe-1-507.seznam.cz (mxe-1-507.seznam.cz [IPv6:2a02:598:128:8a00::1000:507])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3E9130
        for <linux-parisc@vger.kernel.org>; Sun, 27 Aug 2023 04:28:01 -0700 (PDT)
Received: from email.seznam.cz
        by smtpc-mxe-75956598d6-h4jxl
        (smtpc-mxe-75956598d6-h4jxl [2a02:598:128:8a00::1000:507])
        id 75ed6ec8ba23317475b21b01;
        Sun, 27 Aug 2023 13:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
        s=szn20221014; t=1693135680;
        bh=HyTM6UqxGZj/J9pZNppyWWdXDs4oYIzpYgplJqlnpvU=;
        h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
         Content-Type:Content-Transfer-Encoding;
        b=jPhTMhlfRz8Fd09YTfgsUoXHpMxd84LHNvPV9pL9Ue+rD5EGMclF2Jz4eQAIQWeno
         vhc5jOlOXlQ7DPUbQtOZJE7+ezBorAuyuDCHgZWwp5p9ZTZVSuUddxwNOvBW6UVpDH
         k8YsY1TzPvxkDND171BvNrNHH8EG26UuQziPuPMLfGq9eb+kuRAZZOIZokMS03yGfn
         Rn922hhIljACjjWlbczWOLHSkISgyKWHoh9Yv/cp8/2tLrhKeEZV3VYe0VF6UVy98a
         qvU7k8WGHQBVTvDC1mtPOc9pD7ot94E76wQ1ucLr2NRw7yrr/vHb9NqaxAury95zLC
         5qFhbRPsiwXyQ==
Received: from unknown ([176.222.226.27])
        by email.seznam.cz (szn-ebox-5.0.161~newmaster-4) with HTTP;
        Sun, 27 Aug 2023 13:25:17 +0200 (CEST)
From:   <Vidra.Jonas@seznam.cz>
To:     <linux-parisc@vger.kernel.org>
Subject: Possible io_uring bug in PA-RISC kernel 6.1.46
Date:   Sun, 27 Aug 2023 13:25:16 +0200 (CEST)
Message-Id: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.32)
X-Mailer: szn-ebox-5.0.161~newmaster-4
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello,

on my C8000 workstation, I'm getting libuv aborts connected to io_uring
usage. I'm not sure whether this is a libuv bug or a kernel one, but
since libuv is pretty well tested on other archs, it's probably a
PA-RISC issue. I've encountered the problem in kernel versions 6.1.41
and 6.1.46. 6.1.4 seemed fine, but I updated other system packages in
the meantime, so I can't be sure.

The issue is that a call to
`io_uring_enter(fd, 2, 2, IORING_ENTER_GETEVENTS)`
returns 0, and libuv reacts to that by aborting, probably on this line:
https://github.com/libuv/libuv/blob/65dc822d6c20a9130fa100c7b46d751f8cf4d2=
33/src/unix/linux.c#L1252
(I'm saying probably, because gdb seems to be buggy on my machine and I
don't really trust its output, so I rely on strace instead, but that
doesn't support backtraces on the PA-RISC.)

Since min_complete is 2 here and IORING_SETUP_IOPOLL was not specified
during setup (the only flags that can be passed to io_uring_setup are 0
and IORING_SETUP_SQPOLL), the call should (if I understand the docs
correctly) block instead of returning.

The bug manifests as aborts in CMake when compiling KDE packages, as any=

call of `cmake -E cmake_autogen ...` fails.

Is this a known issue? I've seen a number of io_uring patches on the ML,=

but none seem relevant.
