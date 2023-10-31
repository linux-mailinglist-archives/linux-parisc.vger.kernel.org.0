Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB85B7DC563
	for <lists+linux-parisc@lfdr.de>; Tue, 31 Oct 2023 05:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjJaEeM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 Oct 2023 00:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjJaEeM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 Oct 2023 00:34:12 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1269EA9
        for <linux-parisc@vger.kernel.org>; Mon, 30 Oct 2023 21:34:10 -0700 (PDT)
User-agent: mu4e 1.10.7; emacs 30.0.50
From:   Sam James <sam@gentoo.org>
To:     "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Subject: prctl call wrongly succeeds on HPPA?
Date:   Tue, 31 Oct 2023 04:32:36 +0000
Organization: Gentoo
Message-ID: <87lebjz9z6.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I recently hit an issue with systemd-254 which tries to use the new
prctl(PR_SET_MDWE) for systemd's MemoryDenyWriteExecute functionality.

On HPPA, we still need executable stacks, so this option doesn't work
and leads to a segfault on boot.

Should this call be succeeeding on HPPA, or should we reject it for
now until we have things wired up?

Reported to systemd at https://github.com/systemd/systemd/issues/29775.

thanks,
sam
