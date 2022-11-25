Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3E95638F8B
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Nov 2022 19:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiKYSQ1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Nov 2022 13:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiKYSQ1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Nov 2022 13:16:27 -0500
X-Greylist: delayed 914 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Nov 2022 10:16:15 PST
Received: from matoro.tk (unknown [IPv6:2600:1700:4b10:9d80::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2862746661
        for <linux-parisc@vger.kernel.org>; Fri, 25 Nov 2022 10:16:15 -0800 (PST)
DKIM-Signature: a=rsa-sha256; bh=02A7ndLDm/846o6bkCsGJcR71fhXkof8o+a7YevB9YI=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20221003; t=1669399258; v=1; x=1669831258;
 b=Ec2IgKxzFAksa2bvI6Hdvieh78Br4ULCIAAnK4EbIARdcwKqT8EokZXwslVVAjqZdYypMdRS
 D7qTOcEfrP36JPz4falwCCfDBjG0Qq8fx9NthgTBQlh1DJo+tG40EdQCBmhijb7IcvIESIEUHgi
 IkF6q4RSn/OxOVlPqkccsUcS+6YeB1dEbMSQtI9ppnDQobQwfggIBaYVTHYpDV7o1FMXXf5Jq2l
 RVIZp1QvHIPVNvtOr0itSBcHree/kzrZO8ACn1Oww0gQEZV4EB5ytHjWMPXB1pWWTrZZvg6BQr4
 l59e1jPMJyZ3uZkPnPr4yOZXQItkMKflHs0D0BcD3fOPNaiNJa8M/A9BVrJa6k7v6JfSVGlD+LF
 eH/QdgEcjXqOv2udXBmBtQQf5UqeqysNccJ80MHu9K5oKmejuJL6CZuQUqCWPSR39v4+y0u3Hvm
 DS6mvOXLHu14Ohs2GGfsj1lgt4kwy67aCyBcEKCDzmGcEbLzGuyI5VvC6GR2ukuuATBi22w5tNe
 bwzckvE08/5UBkwUAh6SrBpjJkoKrezitxRJQhGAhdaCorp/+pMBT9dJYg5NUOO+AxxVzVxoPR9
 Yp7iykswNDybtofajFVPE4Op5saQxEWHyabrwP1pt28eJLdc7b+MgADiFF/V7xlBG+J1+pwMl9Y
 DktclfSi1mU=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id b849efb4; Fri, 25 Nov
 2022 13:00:58 -0500
MIME-Version: 1.0
Date:   Fri, 25 Nov 2022 13:00:58 -0500
From:   matoro <matoro_mailinglist_kernel@matoro.tk>
To:     linux-parisc@vger.kernel.org
Cc:     Ian Lance Taylor <iant@golang.org>, hppa@gentoo.org
Subject: Correct goarch.sh settings for gccgo on hppa?
Message-ID: <7013a3e7d6c9c77c5010bc1c72971758@matoro.tk>
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

Hi, I was recommended to ask here but I'm trying to enable gccgo to run 
on parisc, however I am not sure what the proper values should be for 
the arch configuration settings.  The description is as follows:

# Code in Makefile.am will invoke this script with two arguments.
# The first is a GOARCH value.  The second is a keyword.
# The script will print the value of that keyword for that GOARCH.
# Keywords:
# - bigendian: true or false
# - cachelinesize: the cache line size in bytes
#	(for performance only; it's not essential to get this right)
# - defaultphyspagesize: the default physical page size in bytes
#	(not currently used, but maybe some day)
# - family: the processor family, from ALLGOARCHFAMILY in configure.ac
# - int64align: alignment of int64 type in bytes
# - maxalign: maximum alignment of values of Go types in bytes
# - minframesize: size of smallest possible function frame in bytes
#	(not currently used, may never be used)
# - pcquantum: minimum size of a single instruction in bytes
# - ptrsize: size of a pointer in bytes

There is also an undocumented "stackalign" variable.

# Default values
bigendian=false
cachelinesize=64
defaultphyspagesize=4096
family=unknown
int64align=8
maxalign=8
minframesize=0
pcquantum=1
ptrsize=8
stackalign=8

This was what I first attempted to set, according to a brief skim of the 
ISA manual:

diff --git a/libgo/goarch.sh b/libgo/goarch.sh
index 977f318b3..ed40815ac 100755
--- a/libgo/goarch.sh
+++ b/libgo/goarch.sh
@@ -88,6 +88,16 @@ case $goarch in
  		;;
  	esac
  	;;
+    hppa)
+	family=HPPA
+	bigendian=true
+	defaultphyspagesize=4096
+	minframesize=16
+	int64align=8
+	stackalign=4
+	pcquantum=4
+	ptrsize=4
+	;;
      ia64)
  	family=IA64
  	cachelinesize=128

However this was clearly wrong, because while it did build, the 
resulting binary immediately segfaults.

unexpected fault address 0x33d8effc
fatal error: fault
[signal SIGSEGV: segmentation violation code=0x1 addr=0x33d8effc 
pc=0xf58f4284]

goroutine 4 [running]:
runtime.dopanic__m
	/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/panic.go:1207
runtime.fatalthrow
	/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/panic.go:1073
runtime.throw
	/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/panic.go:1044
runtime.sigpanic
	/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/signal_unix.go:714
net_1http.connectMethod.scheme
	/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1829
net_1http.Transport.dialConn
	/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1612
net_1http.Transport.dialConnFor
	/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1449
runtime.kickoff
	/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/runtime/proc.go:1316
created by net_1http.Transport.queueForDial
	/var/tmp/portage/sys-devel/gcc-12.2.1_p20221008/work/gcc-12-20221008/libgo/go/net/http/transport.go:1418 
+0x37b


Is there anybody who might be able to advise on what these values should 
be for parisc?
