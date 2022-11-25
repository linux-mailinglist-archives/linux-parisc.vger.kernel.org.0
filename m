Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0B363900C
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Nov 2022 19:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiKYSsp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Nov 2022 13:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiKYSso (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Nov 2022 13:48:44 -0500
X-Greylist: delayed 167 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Nov 2022 10:48:33 PST
Received: from cmx-torrgo001.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6C41EC5B
        for <linux-parisc@vger.kernel.org>; Fri, 25 Nov 2022 10:48:32 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.50.166]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 637F765C008049BD
X-CM-Envelope: MS4xfO3SBkpSVMD8pdmJDKTZKzHnBit7g+696JDCoHU90Wu8UKMp3qnyzMgvRwF/o8bwZN+CpvBozFOabaT9W+mA8D+HSqlmgylMtPwavOUsoVXbFO/cNNIm
 m+S/jAAW16/Tlzcj4zc/0SnQPcqDVfHlwXPavmaGMxWeufK2Zj71y7CvGFwjsdy4QCJvmtlRl+ESXK8hLjeGl8sBwz4a4b5SSGItH0/et364s7s9ev7CHLcT
 pOF69qNXZUpeYy6xp/au0XOFsu+l8fYS6LatcE3wjYG6G4AtOVH2yG0YH55CL9OfaS049xWXitkvzSmgJrCp8TgfzkYwtzzUt7KuYoY6s6d6SSa+x7/Jy96S
 p5f6uGi1
X-CM-Analysis: v=2.4 cv=VfAxfnl9 c=1 sm=1 tr=0 ts=63810d57
 a=DujhYzqEYufUJi90e8Godg==:117 a=DujhYzqEYufUJi90e8Godg==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=P0K5ZDqzwHwGOH-N4EcA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.50.166) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 637F765C008049BD; Fri, 25 Nov 2022 13:45:43 -0500
Message-ID: <67cd6ed7-e2cb-0e0a-5611-e4cd57eb8feb@bell.net>
Date:   Fri, 25 Nov 2022 13:45:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Correct goarch.sh settings for gccgo on hppa?
Content-Language: en-US
To:     matoro <matoro_mailinglist_kernel@matoro.tk>,
        linux-parisc@vger.kernel.org
Cc:     Ian Lance Taylor <iant@golang.org>, hppa@gentoo.org
References: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I added some comments below.

Some years ago we hacked on gcc to add the go language but we didn't get it working.

Dave

On 2022-11-25 1:00 p.m., matoro wrote:
> Hi, I was recommended to ask here but I'm trying to enable gccgo to run on parisc, however I am not sure what the proper values should be for 
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
Depends on processor.  Max is 128 on machines with PA8800/PA8900 processors.
> defaultphyspagesize=4096
> family=unknown
> int64align=8
> maxalign=8
> minframesize=0
> pcquantum=1
> ptrsize=8
> stackalign=8
>
> This was what I first attempted to set, according to a brief skim of the ISA manual:
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
I think this should be 0 when frame isn't needed.  In 32-bit runtime, minimum frame size is 64
when a frame is allocated.
> + int64align=8
> +    stackalign=4
This probably should be 16.  It needs to be at least 8 for double and int64_t.  It was set to 16
for ldcw semaphores. This was needed for the original pthread implementation. Malloc alignment
is 16.  However, this causes some issues with over alignment in some package builds.
> + pcquantum=4
> +    ptrsize=4
> +    ;;
>      ia64)
>      family=IA64
>      cachelinesize=128
>
> However this was clearly wrong, because while it did build, the resulting binary immediately segfaults.
>
> unexpected fault address 0x33d8effc
> fatal error: fault
> [signal SIGSEGV: segmentation violation code=0x1 addr=0x33d8effc pc=0xf58f4284]
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
>     /var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1418 +0x37b
>
>
> Is there anybody who might be able to advise on what these values should be for parisc?


-- 
John David Anglin  dave.anglin@bell.net

