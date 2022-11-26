Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD8EA6393D8
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Nov 2022 05:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbiKZEb5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Nov 2022 23:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiKZEb4 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Nov 2022 23:31:56 -0500
Received: from matoro.tk (unknown [IPv6:2600:1700:4b10:9d80::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A0A49B78
        for <linux-parisc@vger.kernel.org>; Fri, 25 Nov 2022 20:31:46 -0800 (PST)
DKIM-Signature: a=rsa-sha256; bh=o4yXA3/ctAP1Adfw2fp92IijtxJGAKubj5wqALQGFCM=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20221003; t=1669437093; v=1; x=1669869093;
 b=P2dnPpXf19oPcj4gNJAOEfJHhcZISDWAYuMTctWMzKqMgZ9PcG+rBscJr4qv2XwJV/r6EuLX
 WCenpCR92/UDPpYAO4SuefFTKlTuvNuSHT7OZLYEdaLAql9+UMeoASVPD1dOiYtPQZHL2T/GXS7
 3HpRn1Lta73Pj1SBc37PRlDNPeNEyd3IcEhSdDvGY3oUzA0S72eoQu7JUdmEtqBvqj8fi9SYcB4
 lipLuZftHXAxXgiTxglNSKIL1QbrCImpO/uCgSJJgksT/94TFXRpTEIfV1t2cex68dfu1h7FiuJ
 ZY5JgW1DfQRzlM320C4Chq8UoBzSDw7fppDGK5JXdoeNEhlxzYW57tTO6JCya72tcLJbN4xYCmp
 S3efckwwrMO1G7cwmq1JSGGAcTPOy1MNDpAO3kw6SaPc0wEJuDkjBRxeZfUsg6p2Iq/RBvMhoS9
 zhWO7qeLD8R2H4FN5ZFoUhMXJZqPo2Cj79p5COCJ8vJGdcSIX9k5qf4Mkszffqor+4XxHSeLhd9
 eXWakQntasHdTUgiIcOV3sF5Gc31QLiRsNf5b/WU9bXP9mB8DVCjQ8PBV/8eG7JTZMaK4WKG9BG
 GmQaAqmKGPwVmUs/Lnu1QttkKsCAG1OMMZcrdUYHs77+m+ZaqUafYQuP4nhsJJ242++eqzcYVpF
 G+sZxYiSxDo=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 07578dc6; Fri, 25 Nov
 2022 23:31:33 -0500
MIME-Version: 1.0
Date:   Fri, 25 Nov 2022 23:31:33 -0500
From:   matoro <matoro_mailinglist_kernel@matoro.tk>
To:     John David Anglin <dave.anglin@bell.net>, deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Ian Lance Taylor <iant@golang.org>,
        hppa@gentoo.org
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
In-Reply-To: <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
 <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
Message-ID: <cc3d9dc4727b3e7d76e76a2f0bb200ac@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Thank you both for the suggestions.  I tried the following values:

diff --git a/libgo/goarch.sh b/libgo/goarch.sh
index 977f318b3..e0d6a3ad8 100755
--- a/libgo/goarch.sh
+++ b/libgo/goarch.sh
@@ -88,6 +88,16 @@ case $goarch in
                 ;;
         esac
         ;;
+    hppa)
+       bigendian=true
+       defaultphyspagesize=4096
+       family=HPPA
+       int64align=8
+       minframesize=64
+       pcquantum=4
+       ptrsize=4
+       stackalign=64
+       ;;
      ia64)
         family=IA64
         cachelinesize=128

But unfortunately got the same result.  I wonder if there is something 
else missing?

Ian, if you have the time, I have a machine you can use to look at this.

-------- Original Message --------
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
Date: 2022-11-25 13:45
 From: John David Anglin <dave.anglin@bell.net>
To: matoro <matoro_mailinglist_kernel@matoro.tk>, 
linux-parisc@vger.kernel.org

I added some comments below.

Some years ago we hacked on gcc to add the go language but we didn't get 
it working.

Dave

On 2022-11-25 1:00 p.m., matoro wrote:
> Hi, I was recommended to ask here but I'm trying to enable gccgo to run 
> on parisc, however I am not sure what the proper values should be for 
> the arch configuration settings.  The description is as follows:
> 
> # Code in Makefile.am will invoke this script with two arguments.
> # The first is a GOARCH value.  The second is a keyword.
> # The script will print the value of that keyword for that GOARCH.
> # Keywords:
> # - bigendian: true or false
> # - cachelinesize: the cache line size in bytes
> #    (for performance only; it's not essential to get this right)
> # - defaultphyspagesize: the default physical page size in bytes
> #    (not currently used, but maybe some day)
> # - family: the processor family, from ALLGOARCHFAMILY in configure.ac
> # - int64align: alignment of int64 type in bytes
> # - maxalign: maximum alignment of values of Go types in bytes
> # - minframesize: size of smallest possible function frame in bytes
> #    (not currently used, may never be used)
> # - pcquantum: minimum size of a single instruction in bytes
> # - ptrsize: size of a pointer in bytes
> 
> There is also an undocumented "stackalign" variable.
> 
> # Default values
> bigendian=false
> cachelinesize=64
Depends on processor.  Max is 128 on machines with PA8800/PA8900 
processors.
> defaultphyspagesize=4096
> family=unknown
> int64align=8
> maxalign=8
> minframesize=0
> pcquantum=1
> ptrsize=8
> stackalign=8
> 
> This was what I first attempted to set, according to a brief skim of 
> the ISA manual:
> 
> diff --git a/libgo/goarch.sh b/libgo/goarch.sh
> index 977f318b3..ed40815ac 100755
> --- a/libgo/goarch.sh
> +++ b/libgo/goarch.sh
> @@ -88,6 +88,16 @@ case $goarch in
>          ;;
>      esac
>      ;;
> +    hppa)
> +    family=HPPA
> +    bigendian=true
> +    defaultphyspagesize=4096
> +    minframesize=16
I think this should be 0 when frame isn't needed.  In 32-bit runtime, 
minimum frame size is 64
when a frame is allocated.
> + int64align=8
> +    stackalign=4
This probably should be 16.  It needs to be at least 8 for double and 
int64_t.  It was set to 16
for ldcw semaphores. This was needed for the original pthread 
implementation. Malloc alignment
is 16.  However, this causes some issues with over alignment in some 
package builds.
> + pcquantum=4
> +    ptrsize=4
> +    ;;
>      ia64)
>      family=IA64
>      cachelinesize=128
> 
> However this was clearly wrong, because while it did build, the 
> resulting binary immediately segfaults.
> 
> unexpected fault address 0x33d8effc
> fatal error: fault
> [signal SIGSEGV: segmentation violation code=0x1 addr=0x33d8effc 
> pc=0xf58f4284]
One would need to debug to find the cause...
> 
> goroutine 4 [running]:
> runtime.dopanic__m
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/panic.go:1207
> runtime.fatalthrow
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/panic.go:1073
> runtime.throw
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/panic.go:1044
> runtime.sigpanic
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/signal_unix.go:714
> net_1http.connectMethod.scheme
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1829
> net_1http.Transport.dialConn
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1612
> net_1http.Transport.dialConnFor
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1449
> runtime.kickoff
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/proc.go:1316
> created by net_1http.Transport.queueForDial
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1418 
> +0x37b
> 
> 
> Is there anybody who might be able to advise on what these values 
> should be for parisc?

