Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BA66399BA
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Nov 2022 09:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiK0IVV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Nov 2022 03:21:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiK0IUx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Nov 2022 03:20:53 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102BEB7F2
        for <linux-parisc@vger.kernel.org>; Sun, 27 Nov 2022 00:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669537181; bh=r5Oi2GSLGFLUgiSl2TFO88eS824Gm7JMQZrLQSL4qk8=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=H3rZw02tiTeR9xH0XPwG9cx7vq/VA2SIqOqdN2BBCCF8b2nDd+XE/GONZzh7uKu3x
         47VQTh9WDASxRFgAnf6fYW6Ce5XE+PYaGcHWh0HAgofi8KvBuuJD3+LCRREKmRRWVZ
         41hO+5ud9ILYBOt1/lycRmjSZb5oHbO5o0d8hbp1ayRZ61fU3qLeQqYFWz0zLmzOP4
         H16t2w06nD1WeiCmBdkDAppaXUapAZdhZcjzSILKqzSn/Vy4Bx/SK1JRGi5A2Dll7q
         /YTU88CmPtrkJoGdOkuuJAlG8xZcHMoitT+rRBb94LdiBJUvA2WJLXwOzyJcWh9YDV
         IsWdEF7p7+oNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.135.29]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0Fxf-1omT5W1pjj-00xIAp; Sun, 27
 Nov 2022 09:19:41 +0100
Message-ID: <e4ea795a-ad17-4c8c-0231-579906813839@gmx.de>
Date:   Sun, 27 Nov 2022 09:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
Content-Language: en-US
To:     matoro <matoro_mailinglist_kernel@matoro.tk>,
        Ian Lance Taylor <iant@golang.org>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, hppa@gentoo.org
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
 <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
 <cc3d9dc4727b3e7d76e76a2f0bb200ac@matoro.tk>
 <CAOyqgcXknGW0AvMy-noFZsSxYdiruoA_HxXaiuW+n-osyyzyMg@mail.gmail.com>
 <067345a4e47eed632a994084ae53856b@matoro.tk>
 <CAOyqgcWK4UhU-GhEvUo26X_UEK_GK-a1xzqr27J98HAe1J9VYg@mail.gmail.com>
 <8d3b98ad973d3cd0ed807ec9d2edeaf2@matoro.tk>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <8d3b98ad973d3cd0ed807ec9d2edeaf2@matoro.tk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zqoAul320ExiT/BuVRGHkkhg2p11OPTl9orUHdR/Yc9VYtEVTtL
 NT2Xg5+pJGEoIq6qK8A2L2zoifN/mF/0aBXTh0Tci6iAdg2xxjA6VhV2E5ZnCkCIeWUqd0V
 N/WpVs0o1Y2L4/kE1ToEhgvbdWcfJycN50v6xoOdhNtgQcOW1hihXlEmBtexRS6R4Ql9gS5
 qgGkeTe0ihqkYudMu7ZWQ==
UI-OutboundReport: notjunk:1;M01:P0:JsWhmHv2vJw=;D0cAHEden4rcQU4wnZM6FU86hly
 sileu1VyIBaQVoYwlUTjKqyW+aNd7VRXPboTAzxUdAFufo4WYF8omdSpg+p1AWzNbfvIg7njB
 92/5n0HBXcsmjlB3ea5HVUHE1JegerE7jdHVaAa9pbWGtlqSFFS76a1tqo7m7wcmsNAc1pjNW
 irw7TmmoTXvnT3IkcHBFyCfXt1ui2Y4HmkSe7XSAShF8LH/r4uRZof0ll+uC/MwBg4jsqdASF
 PtYbp5HeA47tBH0BKS1kMWwzKDwWYMfZ1HK5Ci1czGuQLIvatLHTk9JBTMQQHhbcbb+3AF5IR
 N3s+ga1pj8XwYC1YNwM9oE1qbuImHigHbbRwEfZW5d0HLdxBgB/UmqGopqGGPf/W8SYcsjxmB
 +7bQLvOKN7yLmOa5SJq7AiNtUI2+JFhcMJD9pUlIiH6vztAG5Pcp488GmN0QQZRp00xnEz3Cg
 tmyKlaaPxpN7D11vkUmQw5xJOF+hNhKP3lbDJn2IdcfxPykgY2nCUH7nubKYADqh36el5ml5b
 nv+Tyr7b6CwClQPlz6PywI0S9pRSqXof79o8VzepjBvuNY5fY2Y5yf1Czn34ZepE0v40rMFA8
 85McZMn8R5kL1FVy6FPRg9+x6G2kq9fV4+9toCDE7tyMN1oq8SnqlJP7PVJWAhrIx0bsYfVHj
 pB1YfasW+ic8btKl4DRFTcUTJOYEW/N3bpduwgyny6a3GKyaUTNTG0b241jj73zOgJjWG3PfU
 bW3P8g35KQoxE/mf8uR47cEEBaykh4GeMCd7QIxSSbyOOLL3vp3fzwKcbwih7KynV5hQnKjvV
 kTFpI9uJT15MpH6upPBu57ZO0cIS4BOQGmd/q3eyuNa73sFktdzJtbAxGI78TpPuYdk3JqdLF
 ibvq6FLTH4voa175Lmc1DzR8s+vxA/mRotIdgN8ndpzcewavjtcF/y91IQPI6D8QZcwWk2jgZ
 dyy1Fd8spXd6WF1gY+6A40AQ8OU=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/27/22 07:53, matoro wrote:
> Surprisingly yes, a trivial program does work.=C2=A0 Seems the problems =
only arise on anything more than that.
>
> $ go version
> go version go1.18 gccgo (Gentoo 12.2.1_p20221008 p1) 12.2.1 20221008 lin=
ux/hppa
> $ cat test.go
> package main
> import "fmt"
> func main() {
>  =C2=A0=C2=A0=C2=A0 fmt.Println("Hello World!")
> }
> $ go build test.go
> $ ./test
> Hello World!
>
> Main issue is that the exact stacktrace is different in between runs.=C2=
=A0 I tried setting GOMAXPROCS=3D1 in order to make it reproducible but th=
at completely changed the error.
>
> $ GOMAXPROCS=3D1 go install github.com/gokcehan/lf@latest
> panic: runtime error: invalid memory address or nil pointer dereference
> [signal SIGSEGV: segmentation violation code=3D0x1 addr=3D0x40 pc=3D0x0]
>
> goroutine 15 [running]:
> memchr
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :0
> created by net_1http.Transport.queueForDial
> /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/lib=
go/go/net/http/transport.go:1418 +0x37b
>
> Here is as much info as I am able to get out of gdb:
>
> $ GOMAXPROCS=3D1 gdb --quiet --args /usr/local/bin/go install github.com=
/gokcehan/lf@latest
> Reading symbols from /usr/local/bin/go...
> Reading symbols from /usr/lib/debug//usr/hppa2.0-unknown-linux-gnu/gcc-b=
in/12/go-12.debug...
> (gdb) r
> Starting program: /usr/local/bin/go install github.com/gokcehan/lf@lates=
t
> warning: Unable to find libthread_db matching inferior's thread library,=
 thread debugging will not be available.
> [New LWP 7838]
> [New LWP 7839]
>
> Thread 3 "go" received signal SIGSEGV, Segmentation fault.
> [Switching to LWP 7839]
> 0xf7556aa8 in memcmp () from /lib/libc.so.6
> (gdb) bt full
> #0=C2=A0 0xf7556aa8 in memcmp () from /lib/libc.so.6
> No symbol table info available.
> #1=C2=A0 0xf8d41134 in net_1http.Transport.dialConn (t=3D0x41a90340, t@e=
ntry=3D0x41acc370, ctx=3D..., param=3D...)
>  =C2=A0=C2=A0=C2=A0 at /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/w=
ork/gcc-12-20221008/libgo/go/net/http/transport.go:1645
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace =3D 0x0
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wrapErr =3D 0x433107ec
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cm =3D 0x4180b950
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pconn =3D 0x41acc370
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D {__methods =3D 0x0, =
__object =3D 0x0}
> #2=C2=A0 0xf8d42b7c in net_1http.Transport.dialConnFor (t=3D0x41acc370, =
w=3D0x4180b950)
>  =C2=A0=C2=A0=C2=A0 at /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/w=
ork/gcc-12-20221008/libgo/go/net/http/transport.go:1449
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc =3D <optimized out>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D <optimized out>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delivered =3D <optimized out=
>
> #3=C2=A0 0xf8d42eb4 in net/http.go..thunk166 (__go_thunk_parameter=3D<op=
timized out>)
>  =C2=A0=C2=A0=C2=A0 at /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/w=
ork/gcc-12-20221008/libgo/go/net/http/transport.go:1418
> No locals.
> #4=C2=A0 0xf8ea2264 in runtime.kickoff ()
>  =C2=A0=C2=A0=C2=A0 at /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/w=
ork/gcc-12-20221008/libgo/go/runtime/proc.go:1316
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gp =3D 0x4180b950
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fv =3D 0x4180e5b8
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 param =3D 0x41acc370
> #5=C2=A0 0xf74f4284 in setcontext () from /lib/libc.so.6
> No symbol table info available.
> #6=C2=A0 0x00000000 in ?? ()
> No symbol table info available.
> Backtrace stopped: previous frame identical to this frame (corrupt stack=
?)
>
> This seems to have something at least, is it useful?

I don't know if it's relevant, but on hppa the stack grows upwards,
while on all(?) other platforms the stack grows downwards.
Maybe something is missing, esp. since setcontext() is involved where
a new context including stack is set and this leads to the "corrupt stack"=
 ?

Helge



> -------- Original Message --------
> Subject: Re: Correct goarch.sh settings for gccgo on hppa?
> Date: 2022-11-26 22:17
> From: Ian Lance Taylor <iant@golang.org>
> To: matoro <matoro_mailinglist_kernel@matoro.tk>
>
> On Fri, Nov 25, 2022, 9:39 PM matoro <matoro_mailinglist_kernel@matoro.t=
k>
> wrote:
>
>> Oh sorry, should have clarified.=C2=A0 I did all those parts already, j=
ust
>> didn't include them because I assumed the at-fault piece would be in
>> goarch.sh.=C2=A0 This is for Linux only.
>>
>> All I did for the conditional stuff was add HPPA to all the 32-bit
>> files, and add the two unique syscall numbers.=C2=A0 This was based on =
the
>> instructions in configure.ac.=C2=A0 Here is the complete patch:
>> https://dpaste.com/HVHNU9BKF.txt
>>
>> Is there something I might be missing?
>>
>
>
> Good to hear you have updated the build tags.=C2=A0 I don't know what is=
 wrong,
> tough.=C2=A0 Can you run the failing program under the debugger and find=
 out
> where that address is coming from?
>
> But first: does a trivial hello world program work?
>
> Ian
>
>
>
> -------- Original Message --------
>> Subject: Re: Correct goarch.sh settings for gccgo on hppa?
>> Date: 2022-11-26 00:25
>> =C2=A0From: Ian Lance Taylor <iant@golang.org>
>> To: matoro <matoro_mailinglist_kernel@matoro.tk>
>>
>> On Fri, Nov 25, 2022 at 8:31 PM matoro
>> <matoro_mailinglist_kernel@matoro.tk> wrote:
>> >
>> > Thank you both for the suggestions.=C2=A0 I tried the following value=
s:
>> >
>> > diff --git a/libgo/goarch.sh b/libgo/goarch.sh
>> > index 977f318b3..e0d6a3ad8 100755
>> > --- a/libgo/goarch.sh
>> > +++ b/libgo/goarch.sh
>> > @@ -88,6 +88,16 @@ case $goarch in
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 esac
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> > +=C2=A0=C2=A0=C2=A0 hppa)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bigendian=3Dtrue
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defaultphyspagesize=3D4096
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 family=3DHPPA
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int64align=3D8
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minframesize=3D64
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcquantum=3D4
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptrsize=3D4
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stackalign=3D64
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ia64)
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 family=3DIA64
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cachelinesize=
=3D128
>> >
>> > But unfortunately got the same result.=C2=A0 I wonder if there is som=
ething
>> > else missing?
>> >
>> > Ian, if you have the time, I have a machine you can use to look at
>> > this.
>>
>> As far as I know gccgo has never been ported to parisc.=C2=A0 This requ=
ires
>> a fair bit more than just fixing up goarch.sh.=C2=A0 There are a bunch =
of
>> files in libgo that are conditionally compiled based on the GOARCH
>> (processor) and GOOS (operating system) values.=C2=A0 These are marked =
in
>> the files by comments that start with "+build" or "go:build".=C2=A0 Man=
y of
>> those comments will need to be adjusted to recognize parisc and
>> whatever operating system you are using.=C2=A0 If this is for HP/UX, th=
ere
>> is also operating specific code required in various places.
>>
>> I'm happy to answer questions about doing the port, but it's not a
>> trivial task.
>>
>> Ian
>>

