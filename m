Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879B8799687
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Sep 2023 08:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjIIGMB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Sep 2023 02:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbjIIGMA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Sep 2023 02:12:00 -0400
Received: from mxe-2-af5.seznam.cz (mxe-2-af5.seznam.cz [IPv6:2a02:598:64:8a00::1000:af5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F0619BA
        for <linux-parisc@vger.kernel.org>; Fri,  8 Sep 2023 23:11:55 -0700 (PDT)
Received: from email.seznam.cz
        by smtpc-mxe-785cd4949-ksbtx
        (smtpc-mxe-785cd4949-ksbtx [2a02:598:64:8a00::1000:af5])
        id 390383b1f6cddc0d395cf678;
        Sat, 09 Sep 2023 08:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
        s=szn20221014; t=1694239900;
        bh=fE7nwBQ2cREDISYtqwOwXuB6TSLN/udjeBhc7lt6l0c=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:References:
         In-Reply-To:Mime-Version:X-Mailer:Content-Type:
         Content-Transfer-Encoding;
        b=dcsmmyC4xKaDg+8rEADLUBdTpTPMwsk4A9aIWPjrA+oBBf/iEPA2Ld5yF9TtJ2Ftv
         pW4yTTyIUQwiNcgxOk6AnIuUekfWSLQdao/a5qjZSmN+6CBNonWrYFWbC1pSbpu+TE
         TorpDk99NupCLc0CVJAqcdudNRRXULkReNYSV7f0lK4+hY/kmv7IIJcigoSg1cGpFu
         n/ssciAbXsvqD816rQCiR/90x50sRwVCbQK4NgFqxP7jv0lw53QIaVPwSbwj1X+NmC
         JdJd141UE19MVW9GoEu7cDWOFbZGJWxPViLMUTfIAZn4x+A7lN7NwxOZblhm+Qwgd1
         MtgNth1qjQbvA==
Received: from unknown ([176.222.226.11])
        by email.seznam.cz (szn-ebox-5.0.161~newmaster-4) with HTTP;
        Sat, 09 Sep 2023 08:11:37 +0200 (CEST)
From:   <Vidra.Jonas@seznam.cz>
To:     "Helge Deller" <deller@gmx.de>
Cc:     "John David Anglin" <dave.anglin@bell.net>,
        <linux-parisc@vger.kernel.org>
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Date:   Sat, 09 Sep 2023 08:11:37 +0200 (CEST)
Message-Id: <3rz.NvOL.1UBWO8RA7lO.1a}0oP@seznam.cz>
References: <1yX.NvPF.6kt2vjNkw{E.1azs69@seznam.cz>
        <1M4b1y-1qfpu42R6s-001mPw@mail.gmx.net>
In-Reply-To: <1M4b1y-1qfpu42R6s-001mPw@mail.gmx.net>
Mime-Version: 1.0 (szn-mime-2.1.32)
X-Mailer: szn-ebox-5.0.161~newmaster-4
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-09-07 11:39:14, Helge Deller wrote:
> Please try kernel 6.1.51 or newer.

I just tested 6.1.52 and it seems to work fine.
