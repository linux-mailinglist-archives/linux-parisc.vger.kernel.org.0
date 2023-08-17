Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E341F780019
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Aug 2023 23:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237139AbjHQVpb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Aug 2023 17:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355413AbjHQVpI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Aug 2023 17:45:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CB3E4F
        for <linux-parisc@vger.kernel.org>; Thu, 17 Aug 2023 14:45:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8748F6327A
        for <linux-parisc@vger.kernel.org>; Thu, 17 Aug 2023 21:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DEFC433C8;
        Thu, 17 Aug 2023 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692308706;
        bh=LK/UEqDgVmZrzlN54Lt5lIYVrIJlV5OM8Fj8hGwjYMY=;
        h=From:To:Cc:Subject:Date:From;
        b=jGLi07xuRi50R4dE5fCFyaesoz1rjpQskcDcS7nFVJfojTZbu3IX9anIqBJGOfpS5
         igEjtthp1JtfxVNcJ9XeTu7FmCddRv541vyfs8zixOUcIyGcEBNgL7N6jheLLIPauU
         l+Jo9Brl1GeR0Zl+/WompjY2VXnyIKmuwwHOAK0Jzxk9UUy6WAL3aPrgpzgGJcOJ1L
         7751RB0kdVkyCRJpRQAuQfW0jmChDT0mWw36zOH5SKErYYvhtx+UY1MKWVBOFQLQVk
         UWl7UGkzO65KFCdRXdg09prBntFuOeaMN6yv7kq6xLEsLZ1hx1KSPQxEelPY4Xg5/M
         0gcWi0DMGQxFA==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH 0/5] parisc: Add natie eBPF JIT compiler for parisc
Date:   Thu, 17 Aug 2023 23:44:57 +0200
Message-ID: <20230817214503.108660-1-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

A first patch series to support eBPF natively on parisc,
for 32- and 64-bit kernels.
Tested with the in-kernel eBPF testsuite (CONFIG_TEST_BPF).

Please test!

Helge

Helge Deller (5):
  parisc: Add 32-bit eBPF JIT compiler
  parisc: Add 64-bit eBPF JIT compiler
  parisc: Add eBPF JIT compiler glue code and Makefile
  parisc: Fix comment on Elf64 Function descriptor
  parisc: Wire up eBPF code

 arch/parisc/Kbuild               |    2 +-
 arch/parisc/Kconfig              |    2 +
 arch/parisc/include/asm/elf.h    |    3 +-
 arch/parisc/net/Makefile         |    9 +
 arch/parisc/net/bpf_jit.h        |  479 +++++++++
 arch/parisc/net/bpf_jit_comp32.c | 1615 ++++++++++++++++++++++++++++++
 arch/parisc/net/bpf_jit_comp64.c | 1209 ++++++++++++++++++++++
 arch/parisc/net/bpf_jit_core.c   |  207 ++++
 8 files changed, 3523 insertions(+), 3 deletions(-)
 create mode 100644 arch/parisc/net/Makefile
 create mode 100644 arch/parisc/net/bpf_jit.h
 create mode 100644 arch/parisc/net/bpf_jit_comp32.c
 create mode 100644 arch/parisc/net/bpf_jit_comp64.c
 create mode 100644 arch/parisc/net/bpf_jit_core.c

-- 
2.41.0

