Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03FE638FD1
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Nov 2022 19:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiKYSb1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Nov 2022 13:31:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiKYSb0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Nov 2022 13:31:26 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0165317C6
        for <linux-parisc@vger.kernel.org>; Fri, 25 Nov 2022 10:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669401064; bh=o/SbUAaAf1WkxGw8Zojr4NOUG6039GH8GtUbF9HlTAs=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=hrpo7RdXY6E9ET9Em6V2Jenf0UEypM9NDvQ/nSs+b1cZ4UqAvWFIoXPHX4janqgit
         p6Lua/BvFZ09ktNRGV/GklRXYSE+UgIhTxogpPHEA7MkNUjLX2Ll9qXO761EOpA7w7
         zYI8WWfAwj5C0eRh/9TGjYMXSVAbozaW49l7oA2P59eYjAR/Ra/pCUVSh9QdAMoOVh
         gPlJXYKhuRsgbKsDNXY0qX+D7wZ0po7g2U0TinRuvuJnab7rUfKngdjx+jDD2mjryE
         c8Nvj7D/VNkHtczLQhEmIS3ZihtIV9fTpKIROWUWEAK9/RF6hnp8ZSt0tkYpGFTuhn
         88uYQk/Fbaslg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.145.226]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC34X-1pAUMv2mth-00CQcW; Fri, 25
 Nov 2022 19:31:04 +0100
Message-ID: <25427e83-18f8-0cf7-5f12-5bd1fe4e06d7@gmx.de>
Date:   Fri, 25 Nov 2022 19:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
To:     matoro <matoro_mailinglist_kernel@matoro.tk>,
        linux-parisc@vger.kernel.org
Cc:     Ian Lance Taylor <iant@golang.org>, hppa@gentoo.org
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IknVYhMYvdeLMCeEhYsbKVfdWzGtp0y37leeyJLqSZseXrJukPB
 tm6Wj/GZrXJVeN6ZNnTsXyUUzLY2radJt4i/EfWdFkBpNv3TSDGddSR4SvxMOO9HXlizVsb
 BmmpMJhA4k1Tdm3fVgrJWOTbSz8q321sv1admYb0FwMg6boYH5CTf6gekECz6kTOUsqKevl
 xaeYGlzVxH9Uf1VuUyijw==
UI-OutboundReport: notjunk:1;M01:P0:tHPnnRimo10=;330BzExzvctZSMEsbwJMmBbSqvi
 J1heRU8NsLvenrqI6nAUJI+iTqCWTc2cFoynRvlyTFslldw3AMax0Z4ZhYeVnFyG0rs4GDaJ3
 4s7jjGXuipuTYjWSX36oukQt8Wa+wsaD799mxmgK81EgVe7PAnUBcDMv88wIZO/ts82naTabv
 V+BCspEDF7BwyTAqJE0wi/LRuHWdcC2Bm/Y3eb5RucFDuFY31cCbrgnWWvDd0R/14z+yMf+Uf
 OT/h82eTG+UDHlD33PY7sYltI9o3M0vuNKafgyxv4ZYv3cGa/W937ObChmWp7CLfvia5J43ON
 WgcfBAe0Cw2ujPMw1FvOUXaYCNGkfR5B5yWK5Ys/cC4vePWKcYGlC7YlSdXWHvXJfgSIpvncy
 ILUcK4BXt7dWbjwDQlWrocec02AkkEumNxVDGZ7UURrDo3sdvX8XVL0qfs5bsM9Dun/Ewgu0u
 +Km+QuBqmUEI402ZjUoTXz63Qg6PYFo2MaMO2aX/0V2eTH20QYjVa2awXFJ/8aYLxzWYBVROa
 sWxO+c3Hq8FZEP46fCiAE7ooeme24v13Ulu9WHNMvLEMvfSvONdHKLuVL94f88UrBozF0aVKC
 sFkrUvSjcVrz2BTpsAA65InlyhqnGjuSFOE7vGYMDedbGTPY5AYnuGHjoyvlxwMKLKCefZZKo
 68eLpo/nkgxWtJT/0NeqUzwFHJHPYn5GtCK0SIdNXR/rrys52+70FwKi+spvBVfwrClMT68ax
 kkSX0L6pNyWiCXJds6HlcWsh7IqbOJNuncVjLlUMUAQWufAP2JjVnROwJd0/lT1Jk7l8eV+m7
 FZp8VTVEluaQ+6w0bJX3sBx89gU48A/GXuXksyz+t2ruBwyiiTbFs30v5cT1Ejd1Dm+hkv4/K
 UUHKvYFCDw8i2ixWaNDlVtYGIOOcT2c5Z5RF8Xs0r624JOerPdnYHhwkby0YnUQ7tALfS4D+T
 BKifHA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Matoro,

On 11/25/22 19:00, matoro wrote:
> Hi, I was recommended to ask here but I'm trying to enable gccgo to
> run on parisc,

That would be fantastic!!!

> however I am not sure what the proper values should be
> for the arch configuration settings.  The description is as follows:
>
> # Code in Makefile.am will invoke this script with two arguments.
> # The first is a GOARCH value.=C2=A0 The second is a keyword.
> # The script will print the value of that keyword for that GOARCH.
> # Keywords:
> # - bigendian: true or false

true

> # - cachelinesize: the cache line size in bytes
> #=C2=A0=C2=A0=C2=A0 (for performance only; it's not essential to get thi=
s right)

32

> # - defaultphyspagesize: the default physical page size in bytes
> #=C2=A0=C2=A0=C2=A0 (not currently used, but maybe some day)

4096 bytes

> # - family: the processor family, from ALLGOARCHFAMILY in configure.ac

I think "hppa", but could be "parisc" too...
uname reports back parisc (on 32bit kernel) or parisc64 (on 64-bit kernel)=
.

> # - int64align: alignment of int64 type in bytes

8 bytes

> # - maxalign: maximum alignment of values of Go types in bytes

?

> # - minframesize: size of smallest possible function frame in bytes
> #=C2=A0=C2=A0=C2=A0 (not currently used, may never be used)

I think 64 bytes.

> # - pcquantum: minimum size of a single instruction in bytes

Every assembler statement is always 4 bytes.

> # - ptrsize: size of a pointer in bytes

4 bytes   (would be 8 bytes for 64-bit userspace which we don't have yet).

> There is also an undocumented "stackalign" variable.

64 bytes.

> # Default values
> bigendian=3Dfalse
> cachelinesize=3D64
> defaultphyspagesize=3D4096
> family=3Dunknown
> int64align=3D8
> maxalign=3D8
> minframesize=3D0
> pcquantum=3D1
> ptrsize=3D8
> stackalign=3D8
>
> This was what I first attempted to set, according to a brief skim of the=
 ISA manual:
>
> diff --git a/libgo/goarch.sh b/libgo/goarch.sh
> index 977f318b3..ed40815ac 100755
> --- a/libgo/goarch.sh
> +++ b/libgo/goarch.sh
> @@ -88,6 +88,16 @@ case $goarch in
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>  =C2=A0=C2=A0=C2=A0=C2=A0 esac
>  =C2=A0=C2=A0=C2=A0=C2=A0 ;;
> +=C2=A0=C2=A0=C2=A0 hppa)
> +=C2=A0=C2=A0=C2=A0 family=3DHPPA
> +=C2=A0=C2=A0=C2=A0 bigendian=3Dtrue
> +=C2=A0=C2=A0=C2=A0 defaultphyspagesize=3D4096
> +=C2=A0=C2=A0=C2=A0 minframesize=3D16

this should be 64bytes.

> +=C2=A0=C2=A0=C2=A0 int64align=3D8
> +=C2=A0=C2=A0=C2=A0 stackalign=3D4
> +=C2=A0=C2=A0=C2=A0 pcquantum=3D4
> +=C2=A0=C2=A0=C2=A0 ptrsize=3D4
> +=C2=A0=C2=A0=C2=A0 ;;
>  =C2=A0=C2=A0=C2=A0=C2=A0 ia64)
>  =C2=A0=C2=A0=C2=A0=C2=A0 family=3DIA64
>  =C2=A0=C2=A0=C2=A0=C2=A0 cachelinesize=3D128
>
> However this was clearly wrong, because while it did build, the resultin=
g binary immediately segfaults.
>
> unexpected fault address 0x33d8effc
> fatal error: fault
> [signal SIGSEGV: segmentation violation code=3D0x1 addr=3D0x33d8effc pc=
=3D0xf58f4284]
>
> goroutine 4 [running]:
> runtime.dopanic__m
>  =C2=A0=C2=A0=C2=A0=C2=A0/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008=
/work/gcc-12-20221008/libgo/go/runtime/panic.go:1207
> runtime.fatalthrow
>  =C2=A0=C2=A0=C2=A0=C2=A0/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008=
/work/gcc-12-20221008/libgo/go/runtime/panic.go:1073
> runtime.throw
>  =C2=A0=C2=A0=C2=A0=C2=A0/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008=
/work/gcc-12-20221008/libgo/go/runtime/panic.go:1044
> runtime.sigpanic
>  =C2=A0=C2=A0=C2=A0=C2=A0/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008=
/work/gcc-12-20221008/libgo/go/runtime/signal_unix.go:714
> net_1http.connectMethod.scheme
>  =C2=A0=C2=A0=C2=A0=C2=A0/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008=
/work/gcc-12-20221008/libgo/go/net/http/transport.go:1829
> net_1http.Transport.dialConn
>  =C2=A0=C2=A0=C2=A0=C2=A0/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008=
/work/gcc-12-20221008/libgo/go/net/http/transport.go:1612
> net_1http.Transport.dialConnFor
>  =C2=A0=C2=A0=C2=A0=C2=A0/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008=
/work/gcc-12-20221008/libgo/go/net/http/transport.go:1449
> runtime.kickoff
>  =C2=A0=C2=A0=C2=A0=C2=A0/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008=
/work/gcc-12-20221008/libgo/go/runtime/proc.go:1316
> created by net_1http.Transport.queueForDial
>  =C2=A0=C2=A0=C2=A0=C2=A0/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008=
/work/gcc-12-20221008/libgo/go/net/http/transport.go:1418 +0x37b
>
>
> Is there anybody who might be able to advise on what these values should=
 be for parisc?

Helge
