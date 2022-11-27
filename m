Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650FC63997D
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Nov 2022 07:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiK0Gxy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Nov 2022 01:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiK0Gxy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Nov 2022 01:53:54 -0500
Received: from matoro.tk (unknown [IPv6:2600:1700:4b10:9d80::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1B4B63
        for <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 22:53:38 -0800 (PST)
DKIM-Signature: a=rsa-sha256; bh=0qTMKMZlpnpo2+S8wS8MwGrjhez8jrNeVwlR03hHmC8=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20221003; t=1669532008; v=1; x=1669964008;
 b=mY2f4J8SuJL5IZyzwg20LXo6cyZSfttxgxv1l7gUbAKmm2m8Qmj3QK0oVeSkCkANTYfa9nE2
 8Z/l7cJ9104xeXm1kaupYdVoJFkpR09cAK6xsmUENb9lV0svPvLlE8cA4r9pB+B4Dfb+1J2M07s
 ncfS0vExVuh2ie0u155hXcV6NUp56H2MgVUBY34nAX0C/KvTOER6qCRq/5pIZWEB1muzxkjr04i
 tmBQHPY2V2oqz1ks7pxOYiwCQ3lwJrSZ8/1WkSN2XWiB0K8MZNIggCzPHMQ118I3jAcTlwj1/aJ
 RzyeArhya6WxpprwfOs3K3sAH3CmuYN0Q6cmdGE2tQJnV/W/XsBkF/1doDTeFzSFEO8VFAnFe69
 fvyWpADQupk9c1gPlwm+bOVq1TKYaruT8FHLYSU/cxAcyTkckmrCZJW6s2sGh53Vy7N2E4Rf0SD
 Z1mI1vEj1uNuWIw9hzFqjIWHSLeXdfPIiBq9evjHBU0Yg1TSsd9txeSvtnRu5o4DfrcmZC8gY7F
 KqHn5lfBuDwca1G6BHS85T7ecmWvbPxmP33/h05njBGbT6l77YS2rCfVniRICN9982BoVVEyGSx
 93Hcj9xRi4/izjd5A8nBEtNOIs67pYbznToZH2+jtA10nzPrrQ2yG1GG3guLEZgIO0oPkiYqMuF
 Kv8dSxATjac=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 388c889c; Sun, 27 Nov
 2022 01:53:28 -0500
MIME-Version: 1.0
Date:   Sun, 27 Nov 2022 01:53:28 -0500
From:   matoro <matoro_mailinglist_kernel@matoro.tk>
To:     Ian Lance Taylor <iant@golang.org>
Cc:     John David Anglin <dave.anglin@bell.net>, deller@gmx.de,
        linux-parisc@vger.kernel.org, hppa@gentoo.org
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
In-Reply-To: <CAOyqgcWK4UhU-GhEvUo26X_UEK_GK-a1xzqr27J98HAe1J9VYg@mail.gmail.com>
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
 <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
 <cc3d9dc4727b3e7d76e76a2f0bb200ac@matoro.tk>
 <CAOyqgcXknGW0AvMy-noFZsSxYdiruoA_HxXaiuW+n-osyyzyMg@mail.gmail.com>
 <067345a4e47eed632a994084ae53856b@matoro.tk>
 <CAOyqgcWK4UhU-GhEvUo26X_UEK_GK-a1xzqr27J98HAe1J9VYg@mail.gmail.com>
Message-ID: <8d3b98ad973d3cd0ed807ec9d2edeaf2@matoro.tk>
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

Surprisingly yes, a trivial program does work.  Seems the problems only 
arise on anything more than that.

$ go version
go version go1.18 gccgo (Gentoo 12.2.1_p20221008 p1) 12.2.1 20221008 
linux/hppa
$ cat test.go
package main
import "fmt"
func main() {
     fmt.Println("Hello World!")
}
$ go build test.go
$ ./test
Hello World!

Main issue is that the exact stacktrace is different in between runs.  I 
tried setting GOMAXPROCS=1 in order to make it reproducible but that 
completely changed the error.

$ GOMAXPROCS=1 go install github.com/gokcehan/lf@latest
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x1 addr=0x40 pc=0x0]

goroutine 15 [running]:
memchr
         :0
created by net_1http.Transport.queueForDial
         
/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1418 
+0x37b

Here is as much info as I am able to get out of gdb:

$ GOMAXPROCS=1 gdb --quiet --args /usr/local/bin/go install 
github.com/gokcehan/lf@latest
Reading symbols from /usr/local/bin/go...
Reading symbols from 
/usr/lib/debug//usr/hppa2.0-unknown-linux-gnu/gcc-bin/12/go-12.debug...
(gdb) r
Starting program: /usr/local/bin/go install 
github.com/gokcehan/lf@latest
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
[New LWP 7838]
[New LWP 7839]

Thread 3 "go" received signal SIGSEGV, Segmentation fault.
[Switching to LWP 7839]
0xf7556aa8 in memcmp () from /lib/libc.so.6
(gdb) bt full
#0  0xf7556aa8 in memcmp () from /lib/libc.so.6
No symbol table info available.
#1  0xf8d41134 in net_1http.Transport.dialConn (t=0x41a90340, 
t@entry=0x41acc370, ctx=..., param=...)
     at 
/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1645
         trace = 0x0
         wrapErr = 0x433107ec
         cm = 0x4180b950
         pconn = 0x41acc370
         err = {__methods = 0x0, __object = 0x0}
#2  0xf8d42b7c in net_1http.Transport.dialConnFor (t=0x41acc370, 
w=0x4180b950)
     at 
/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1449
         pc = <optimized out>
         err = <optimized out>
         delivered = <optimized out>
#3  0xf8d42eb4 in net/http.go..thunk166 (__go_thunk_parameter=<optimized 
out>)
     at 
/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1418
No locals.
#4  0xf8ea2264 in runtime.kickoff ()
     at 
/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/proc.go:1316
         gp = 0x4180b950
         fv = 0x4180e5b8
         param = 0x41acc370
#5  0xf74f4284 in setcontext () from /lib/libc.so.6
No symbol table info available.
#6  0x00000000 in ?? ()
No symbol table info available.
Backtrace stopped: previous frame identical to this frame (corrupt 
stack?)

This seems to have something at least, is it useful?

-------- Original Message --------
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
Date: 2022-11-26 22:17
 From: Ian Lance Taylor <iant@golang.org>
To: matoro <matoro_mailinglist_kernel@matoro.tk>

On Fri, Nov 25, 2022, 9:39 PM matoro 
<matoro_mailinglist_kernel@matoro.tk>
wrote:

> Oh sorry, should have clarified.  I did all those parts already, just
> didn't include them because I assumed the at-fault piece would be in
> goarch.sh.  This is for Linux only.
> 
> All I did for the conditional stuff was add HPPA to all the 32-bit
> files, and add the two unique syscall numbers.  This was based on the
> instructions in configure.ac.  Here is the complete patch:
> https://dpaste.com/HVHNU9BKF.txt
> 
> Is there something I might be missing?
> 


Good to hear you have updated the build tags.  I don't know what is 
wrong,
tough.  Can you run the failing program under the debugger and find out
where that address is coming from?

But first: does a trivial hello world program work?

Ian



-------- Original Message --------
> Subject: Re: Correct goarch.sh settings for gccgo on hppa?
> Date: 2022-11-26 00:25
>  From: Ian Lance Taylor <iant@golang.org>
> To: matoro <matoro_mailinglist_kernel@matoro.tk>
> 
> On Fri, Nov 25, 2022 at 8:31 PM matoro
> <matoro_mailinglist_kernel@matoro.tk> wrote:
> >
> > Thank you both for the suggestions.  I tried the following values:
> >
> > diff --git a/libgo/goarch.sh b/libgo/goarch.sh
> > index 977f318b3..e0d6a3ad8 100755
> > --- a/libgo/goarch.sh
> > +++ b/libgo/goarch.sh
> > @@ -88,6 +88,16 @@ case $goarch in
> >                  ;;
> >          esac
> >          ;;
> > +    hppa)
> > +       bigendian=true
> > +       defaultphyspagesize=4096
> > +       family=HPPA
> > +       int64align=8
> > +       minframesize=64
> > +       pcquantum=4
> > +       ptrsize=4
> > +       stackalign=64
> > +       ;;
> >       ia64)
> >          family=IA64
> >          cachelinesize=128
> >
> > But unfortunately got the same result.  I wonder if there is something
> > else missing?
> >
> > Ian, if you have the time, I have a machine you can use to look at
> > this.
> 
> As far as I know gccgo has never been ported to parisc.  This requires
> a fair bit more than just fixing up goarch.sh.  There are a bunch of
> files in libgo that are conditionally compiled based on the GOARCH
> (processor) and GOOS (operating system) values.  These are marked in
> the files by comments that start with "+build" or "go:build".  Many of
> those comments will need to be adjusted to recognize parisc and
> whatever operating system you are using.  If this is for HP/UX, there
> is also operating specific code required in various places.
> 
> I'm happy to answer questions about doing the port, but it's not a
> trivial task.
> 
> Ian
> 
