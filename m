Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B784410F9
	for <lists+linux-parisc@lfdr.de>; Sun, 31 Oct 2021 22:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhJaVZ1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 31 Oct 2021 17:25:27 -0400
Received: from mout.gmx.net ([212.227.17.21]:51527 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229982AbhJaVZ1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 31 Oct 2021 17:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635715373;
        bh=6Y4V2K6GJm2c7mSIB+WiWdqjqFX+Qn3jNAX1KMO8Y0Y=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=PKFd73+GA8bMiU3pqyNgynJsvPNTUgCTRaByFpjJR6BcBEwWZiS62MN68U3h4ntY7
         GSTSqpMkuDSuPa8Kf7/F60KpIUh8UbbBiSqAKlrpzwBFAGahQMYUjUIvCdTrAUGGJB
         be1Ho9XXzUYOwUb4RF1LJm3sxot+goWZ3tZayX2U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.201]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRjt-1nE9493xiD-00bwdc; Sun, 31
 Oct 2021 22:22:52 +0100
Message-ID: <0a068f90-84bb-dbe1-b8b3-6fd7709b814a@gmx.de>
Date:   Sun, 31 Oct 2021 22:22:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: fixmap problem on PA11 hardware
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <3b8410fd-f688-862f-3c3c-7ccf5d523075@gmx.de>
 <a10ff403-3869-9eb1-8213-b51e6ca8d219@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <a10ff403-3869-9eb1-8213-b51e6ca8d219@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zCKF2/Egbw7BbJkBMEIH8mG8VN+TLbHMg6dVaywB/efVyTJ2LXl
 VaWrb/Q2KYbnCcebTte6Y+V3f+yFnE8miLwNyU6TsboSRidPj96MOroMRarvyOdAv6zAtb3
 B2jzoEVGZNEusx/aV3/hGWMQEZK86ySRBLvBfjg5T90grMLvAliT1v0PbuyWXSvPdQlob3r
 vP6vhjcP3Q/26DtEuvE9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TCkbQFIbFRM=:Gxh5UeDpYFNAA721yJYs2T
 zFKlC1gQ3mUSWGxj1G1XVqF4F+4RqK34DbPLwuGF5UeaN+1P3TiW/4G7oTguBg7+eVfF+DW65
 K4Shx1HFzhxWFWzHwFNlXxPNGAhJPzACCvAHQK8j5r2XkNY8Gj2rS4fPbugs7L13SbCLUhTgT
 Yb+2S2A8yFesxA5DRpv3XiJxwstarU9LQLPkf1ozWd1TGkgX0Xd+kg8GuOpHvlwwwMSKjBM/Z
 6T8NKRbWSWwiNlmqhv0e598TCVW4BdAxp7nGemqGvZ5kVg+KOBkmdnLcBpQc1TLr+k6wzJoYw
 XHznFq0NyRCgt+vB0UtbYLW6fy5UaIOfGuNEP40N0oo8AqCNPLH8x/T4fM6IGNFszroYObsIZ
 Y6rHiNrs9u0K9RtvQb4SPj9XLBZ34FdsikX8sy7ztbXGNiypAFEvT+dvxcyVgyAXuEiGfs86z
 bahpe6y7xMOkWD61kaRNxeibXkKY9HZgRPFV7+43MdiG2trDX81JYPSb1AnfjM4dTuLPG+g1T
 gkMo53ZLlkCvsbeap+/SMkvQb9M/Mkg+hhSNnFa3HVRlYDEY/7qS9xC6UVoujl6GD8G8MeiJd
 hRiZaoPSJGH8oJezq9yjB8sCxn3qq+1dhXScmsXVOlSwqPzjdIQzfvhd0WV9DcwjOLYW9YdCE
 NCU6DNWAGoeNoh8bdq/tkgucU24tjak0l2VnBJtfkvFEP+A1IqhsYJd4cgoLRadulEOMbzniy
 p7pBnyfxCjkwrnGo1oJSss8YL5UEbPvq3or9T2v1ufmYMGvX2FkvuJYT+qyBpqlaCfEAJipGz
 UkXllba+2XpIwFuDx+4Tp+1oZEsmljqyTtDCyFK0n4kbHg0elBdjxhHVqGnea04VIm1alec4h
 KRCwDJeTYmgJGBhH4PWGa82bo1ruteH8ygSneClUook5frxqyL9brrYOueuSpHHe15UX6anhu
 atnJPptctdHtuOSyoj0hLBOwh7rkp+wWpmI9pLC7rNXjT+CfZ8kPDutk3YWyZYj2nm3kU7IHH
 kzzWB2B7bQiknFSq+1z3DNfjR10PgIRSrzT4MJ6kY2T9DEZXjk66/Z36YcDod6ETL0Erix/CZ
 BCi0NbBdYcCjHw=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/27/21 22:14, John David Anglin wrote:
> On 2021-10-27 3:09 p.m., Helge Deller wrote:
>> In the archives I found this old thread, which might be related:
>> https://www.spinics.net/lists/linux-parisc/msg09391.html
> These seems unlikely as both 7100LC and 7300LC are PA-RISC 1.1 processor=
s (1.1c vs. 1.1e).=C2=A0 Big difference
> seems to be cache.

Yes, there were at least two problems.
I just sent two patches to the list which fix the crashes.
But FTRACE still doesn't work on PA1.x machines as expected,
while the same code seems to work on PA2.x machines (running the same 32bi=
t kernel).

The PA7100LC reports (machine: 715/64):
Kprobe smoke test: started
Kprobe smoke test: kretprobe handler not called
Kprobe smoke test: kretprobe handler not called
Kprobe smoke test: kretprobe handler2 not called
Kprobe smoke test: BUG: 3 error(s) running handlers

On the PA7300LC (machine B160L):
Kprobe smoke test: started
Kprobe smoke test: kprobe pre_handler not called
Kprobe smoke test: kprobe post_handler not called
Kprobe smoke test: kprobe pre_handler not called
Kprobe smoke test: kprobe post_handler not called
Kprobe smoke test: kprobe pre_handler2 not called
Kprobe smoke test: kprobe post_handler2 not called
Kprobe smoke test: kretprobe handler not called
Kprobe smoke test: kretprobe handler not called
Kprobe smoke test: kretprobe handler2 not called
Kprobe smoke test: BUG: 9 error(s) running handlers

On the PA8x00 (machine C3000):
Kprobe smoke test: started
Kprobe smoke test: passed successfully

Helge
