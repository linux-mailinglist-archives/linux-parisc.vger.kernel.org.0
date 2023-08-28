Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEF478A405
	for <lists+linux-parisc@lfdr.de>; Mon, 28 Aug 2023 03:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjH1BqF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Sun, 27 Aug 2023 21:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjH1Bp6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Aug 2023 21:45:58 -0400
Received: from smtp.gentoo.org (dev.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE68113
        for <linux-parisc@vger.kernel.org>; Sun, 27 Aug 2023 18:45:56 -0700 (PDT)
References: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
 <7ce98f53-d80d-fc78-1bff-419eedaf8e36@bell.net>
 <f8be4af4-725a-902f-60a5-0f18c198b130@gmx.de>
User-agent: mu4e 1.10.6; emacs 30.0.50
From:   Sam James <sam@gentoo.org>
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>, Vidra.Jonas@seznam.cz,
        linux-parisc@vger.kernel.org
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Date:   Mon, 28 Aug 2023 02:45:33 +0100
Organization: Gentoo
In-reply-to: <f8be4af4-725a-902f-60a5-0f18c198b130@gmx.de>
Message-ID: <875y50gcrz.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


Helge Deller <deller@gmx.de> writes:

> On 8/27/23 22:35, John David Anglin wrote:
>> On 2023-08-27 7:25 a.m., Vidra.Jonas@seznam.cz wrote:
>>> The issue is that a call to
>>> `io_uring_enter(fd, 2, 2, IORING_ENTER_GETEVENTS)`
>>> returns 0, and libuv reacts to that by aborting, probably on this line:
>>> https://github.com/libuv/libuv/blob/65dc822d6c20a9130fa100c7b46d751f8cf4d233/src/unix/linux.c#L1252
>>> (I'm saying probably, because gdb seems to be buggy on my machine and I
>>> don't really trust its output, so I rely on strace instead, but that
>>> doesn't support backtraces on the PA-RISC.)
>> I have the attached io_uring patch on 6.1.46.  It's back ported from 6.4.
>>
>> libuv make check was successful on my system.
>
> Did the libuv check failed on 6.1.46 for you?
> I just tried plain 6.1.49 and my machine crashed....
>

I can't test 6.1.x right now, but fwiw, 6.4.12 passes libuv's test suite.

best,
sam
