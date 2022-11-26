Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3192639403
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Nov 2022 06:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiKZFjr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 26 Nov 2022 00:39:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiKZFjp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Nov 2022 00:39:45 -0500
Received: from matoro.tk (unknown [IPv6:2600:1700:4b10:9d80::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF781DF02
        for <linux-parisc@vger.kernel.org>; Fri, 25 Nov 2022 21:39:29 -0800 (PST)
DKIM-Signature: a=rsa-sha256; bh=rRYXhZE8iXwwzsvSbuJ7sRpQMfVhOpkt0NnNjG+IThc=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20221003; t=1669441164; v=1; x=1669873164;
 b=L135vICtZ+kUyc3dkgSccA2yB1mogG3zg9fGtTEo9pMQk9ILISsKoZYRjzE5BCRWhGzAfoby
 JQL7WFgX6JGdY4hfBatGQd8wanmsx8JkrYeqjp5/hOMxxa6ih/cLDwnqIW/ggZ4xHjc14BHSCbG
 rF1EXCX/VC1+u1mSmsuMK0n1n5sIBqo38yxGTinBOGc/HnhHPFUfLSVdrOoK0/nCGdK1kxpO2G4
 hVUeGmeXqlSR9A87N1Tw5qM7rHDzm8oUFUPoeGMUTSRskJqHdv+vdW4Pd6TyF0ricgbu20mD+Yl
 gsEuBXsak4L7WdmWpCb81+K9K3CFgwSe3HcNGabdCnCeHXsw0GgqkyYi8UOExOHDMknWfRzx6WZ
 EAmXpjIC23MG6UolnrSJZuXN/+KwSL+3l8Hhu/fM5rRhk+5eTHxmpzNw/DhaErd4kDPRO4iUxx7
 xetaYFvms6l+jR9TOiGrGdNZ/cp+wqlyXKh4cM7sDxY8LVMA5yT9r3aOHH5jxAwk4xUfLLYbjn5
 yMQZPF1c4ja/ShdnyNuE891XT8I2bIkL9S34v+kpnzbN/a97pvTXluomOOgpUl/PjqFEFhT6bN9
 bSZapThvgujGiXByFUvmjg2W8+d6UQSaJcOp6YABytP0pWXvF6w3+i5QRK2wVyjfG/yKZ2HRkAV
 qMcGVlpu78c=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 91e889f3; Sat, 26 Nov
 2022 00:39:24 -0500
MIME-Version: 1.0
Date:   Sat, 26 Nov 2022 00:39:24 -0500
From:   matoro <matoro_mailinglist_kernel@matoro.tk>
To:     Ian Lance Taylor <iant@golang.org>
Cc:     John David Anglin <dave.anglin@bell.net>, deller@gmx.de,
        linux-parisc@vger.kernel.org, hppa@gentoo.org
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
In-Reply-To: <CAOyqgcXknGW0AvMy-noFZsSxYdiruoA_HxXaiuW+n-osyyzyMg@mail.gmail.com>
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
 <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
 <cc3d9dc4727b3e7d76e76a2f0bb200ac@matoro.tk>
 <CAOyqgcXknGW0AvMy-noFZsSxYdiruoA_HxXaiuW+n-osyyzyMg@mail.gmail.com>
Message-ID: <067345a4e47eed632a994084ae53856b@matoro.tk>
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

Oh sorry, should have clarified.  I did all those parts already, just 
didn't include them because I assumed the at-fault piece would be in 
goarch.sh.  This is for Linux only.

All I did for the conditional stuff was add HPPA to all the 32-bit 
files, and add the two unique syscall numbers.  This was based on the 
instructions in configure.ac.  Here is the complete patch:  
https://dpaste.com/HVHNU9BKF.txt

Is there something I might be missing?

-------- Original Message --------
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
Date: 2022-11-26 00:25
 From: Ian Lance Taylor <iant@golang.org>
To: matoro <matoro_mailinglist_kernel@matoro.tk>

On Fri, Nov 25, 2022 at 8:31 PM matoro
<matoro_mailinglist_kernel@matoro.tk> wrote:
> 
> Thank you both for the suggestions.  I tried the following values:
> 
> diff --git a/libgo/goarch.sh b/libgo/goarch.sh
> index 977f318b3..e0d6a3ad8 100755
> --- a/libgo/goarch.sh
> +++ b/libgo/goarch.sh
> @@ -88,6 +88,16 @@ case $goarch in
>                  ;;
>          esac
>          ;;
> +    hppa)
> +       bigendian=true
> +       defaultphyspagesize=4096
> +       family=HPPA
> +       int64align=8
> +       minframesize=64
> +       pcquantum=4
> +       ptrsize=4
> +       stackalign=64
> +       ;;
>       ia64)
>          family=IA64
>          cachelinesize=128
> 
> But unfortunately got the same result.  I wonder if there is something
> else missing?
> 
> Ian, if you have the time, I have a machine you can use to look at 
> this.

As far as I know gccgo has never been ported to parisc.  This requires
a fair bit more than just fixing up goarch.sh.  There are a bunch of
files in libgo that are conditionally compiled based on the GOARCH
(processor) and GOOS (operating system) values.  These are marked in
the files by comments that start with "+build" or "go:build".  Many of
those comments will need to be adjusted to recognize parisc and
whatever operating system you are using.  If this is for HP/UX, there
is also operating specific code required in various places.

I'm happy to answer questions about doing the port, but it's not a 
trivial task.

Ian
