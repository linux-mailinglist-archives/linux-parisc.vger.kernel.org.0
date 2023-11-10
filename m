Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54BC7E851B
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Nov 2023 22:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjKJVdx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Fri, 10 Nov 2023 16:33:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjKJVdx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Nov 2023 16:33:53 -0500
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C793A9
        for <linux-parisc@vger.kernel.org>; Fri, 10 Nov 2023 13:33:50 -0800 (PST)
References: <87lebjz9z6.fsf@gentoo.org> <875y2jro9a.fsf@gentoo.org>
 <0fec2446-a523-486f-9df7-4c6af9e2e0e3@gmx.de>
 <7409ec05-7a28-45fe-9604-519de5ae934e@bell.net>
 <cf75a1e4-c269-4530-b3aa-b02a81597acb@gmx.de>
 <b0a524df-9dab-4038-981f-33fc69043c1c@bell.net>
User-agent: mu4e 1.10.8; emacs 30.0.50
From:   Sam James <sam@gentoo.org>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, Sam James <sam@gentoo.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Subject: Re: prctl call wrongly succeeds on HPPA?
Date:   Fri, 10 Nov 2023 21:32:50 +0000
Organization: Gentoo
In-reply-to: <b0a524df-9dab-4038-981f-33fc69043c1c@bell.net>
Message-ID: <87sf5d8f9h.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


John David Anglin <dave.anglin@bell.net> writes:

> On 2023-11-10 3:38 p.m., Helge Deller wrote:
>> On 11/10/23 21:12, John David Anglin wrote:
>>> On 2023-11-10 3:01 p.m., Helge Deller wrote:
>>>>>> On HPPA, we still need executable stacks, so this option doesn't work
>>>>>> and leads to a segfault on boot.
>>>>
>>>> For kernel we don't need it any longer.
>>>> But there might be dependencies on glibc version and/or combination.
>>>> So, I've currently lost overview if we still need executable stacks...
>>> FWIW, I recently changed gcc-14 to enable GNU stack notes and fixed a bug in the
>>> 32-bit PA 2.0 trampoline template.  All execute stack tests in glibc now pass with gcc-14.
>>
>> Yes, I saw your commits.
>> So, any code compiled with >= gcc-14 should be fine with non-writeable stacks?
> Not exactly.  An executable stack is still needed for nested functions.  They are still called
> via a stack trampoline.  The GNU stack note indicates whether an object needs an executable
> stack or not.  These notes are collected by linker.  The glibc loader determines whether to setup
> an executable stack or not.
>> It would be easier if it would be a glibc dependency (for distribution maintainers)...
> I'm not aware of any glibc dependency...
>
> I think once gcc-14 becomes the default compiler, we will have to enable GNU stack notes in
> previous gcc versions.  We will still have executable stacks until everything is rebuilt.

We will need to update that default in Binutils too, I think. That
configure arg is working OK for me, but I did not try systemd yet.

>
> Dave

