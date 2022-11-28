Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB2863B3F5
	for <lists+linux-parisc@lfdr.de>; Mon, 28 Nov 2022 22:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbiK1VIn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 28 Nov 2022 16:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbiK1VIW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 28 Nov 2022 16:08:22 -0500
Received: from matoro.tk (unknown [IPv6:2600:1700:4b10:9d80::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A1BBAA
        for <linux-parisc@vger.kernel.org>; Mon, 28 Nov 2022 13:07:33 -0800 (PST)
DKIM-Signature: a=rsa-sha256; bh=GjAviph7zzoiYR7Ai9KPvszU57YdYHHIqEGoe7yFStc=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20221003; t=1669669646; v=1; x=1670101646;
 b=SVEA+0vfQFqg1nH7Sm2TGLgbIpKMuKw66zneihLkJsuZlPCwrRj14FA2bJrP24S/E9cRoNum
 GarHMAfaFPJscCswL7Be+T/ime67dlbWNIsJ+nQPiqREghgE4d8jW/xjqeKxznIR9V7zwCSfshG
 sU2pYS1RgXxNW9bdah7r5zHz8v51pFzojj2qMvIyzCdoTTErIDCdebc+fhXRvTgS7v1mUWR/gcH
 NLSYjhg12ycVgIyOXUb6Y3XvKxvnHiuM1V2UaR556o5RzSeLtjm6XHctWdpmcDmcxzIOW7TevNX
 QE1nBpTOjCX51VcRuCeUUOk37uYnAtHqx06Gt686lwCiOk8R9ApejyMIbSFu+jfsZ46Qo0/Q3OT
 zrM7diSS0NzIAlJXjYh9jcs5/c6HjJRptg34b8/Y7FRGaOfHYQYBYefHRJBAA8qTNyP55iHU3YX
 RxaP1oywSn+6tEQGuyMzk3YuyrsemjR5OMeqDTsgdPwx6n9PIt/8QHN3k4hHBwscp1OlvG6wWk6
 li0PVtqdWjJxkgxYCAD6N7tDrhbRKh0CS+zUNy8VY+/BXEGl6GWDr3+h2yK4LQPegGT17NZ5uv9
 TRfMeuS4c7kK9BV5YOinPrgsLP7CKE0YvZ9iLRLZiaI2zDAFPi21JigceaBnbsaDbwO/qseabnt
 hCdEQND1D7o=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id d1d196c3; Mon, 28 Nov
 2022 16:07:26 -0500
MIME-Version: 1.0
Date:   Mon, 28 Nov 2022 16:07:26 -0500
From:   matoro <matoro_mailinglist_kernel@matoro.tk>
To:     Ian Lance Taylor <iant@golang.org>
Cc:     Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, hppa@gentoo.org
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
In-Reply-To: <CAOyqgcXbXHVX8qJzyFVgdV5J4hkZXwD_bwe+ZBzJsSdTQ7zbew@mail.gmail.com>
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
 <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
 <cc3d9dc4727b3e7d76e76a2f0bb200ac@matoro.tk>
 <CAOyqgcXknGW0AvMy-noFZsSxYdiruoA_HxXaiuW+n-osyyzyMg@mail.gmail.com>
 <067345a4e47eed632a994084ae53856b@matoro.tk>
 <CAOyqgcWK4UhU-GhEvUo26X_UEK_GK-a1xzqr27J98HAe1J9VYg@mail.gmail.com>
 <8d3b98ad973d3cd0ed807ec9d2edeaf2@matoro.tk>
 <e4ea795a-ad17-4c8c-0231-579906813839@gmx.de>
 <CAOyqgcXbXHVX8qJzyFVgdV5J4hkZXwD_bwe+ZBzJsSdTQ7zbew@mail.gmail.com>
Message-ID: <5e5c81e3b576674f769707c1def830f8@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

That seemed to do the trick!  Looks like it needs support added to 
golang.org/x/sys/unix:  https://dpaste.com/4K99E4DWH.txt

This is something I can look into on my own though.  I might come back 
to ask about the asm parts, but will try and figure it out.

So does this mean it is a GC bug?

-------- Original Message --------
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
Date: 2022-11-28 15:20
 From: Ian Lance Taylor <iant@golang.org>
To: Helge Deller <deller@gmx.de>

On Sun, Nov 27, 2022 at 12:19 AM Helge Deller <deller@gmx.de> wrote:
> 
> I don't know if it's relevant, but on hppa the stack grows upwards,
> while on all(?) other platforms the stack grows downwards.
> Maybe something is missing, esp. since setcontext() is involved where
> a new context including stack is set and this leads to the "corrupt 
> stack" ?

Interesting point and quite possibly relevant.  See the code in
runtime/stack.c.  More generally, see if the tests behave better with
the environment variable GOGC=off.  That disables the garbage
collector.

Ian
