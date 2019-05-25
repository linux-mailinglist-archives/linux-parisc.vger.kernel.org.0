Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7778E2A650
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 20:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfEYSNK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 14:13:10 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:45020 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfEYSNK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 14:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
        bh=DvFZCPP4YDRbeJcBJojgRgaMGvTrgp+VyYAv5z8tfY4=; b=pnAVncTfMoo4ZMCdg22qJkmaJb
        XtLDaWHdy4u+v1Y5Wgt0Z6eNhKCIgX5WXV4z8ItqTbnKGGwCc3yZMInwBEWwMQILtSwQAdWqdb3Zl
        Xn4+dL2Qsb5Z3Q2TkCH0JheBva9k505K6xPtOvybkzLBdzHAnkgTVQ4ZoI0awmZGDr9c=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hUbAH-00084b-W9; Sat, 25 May 2019 20:13:06 +0200
Date:   Sat, 25 May 2019 20:13:04 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Grant Grundler <grantgrundler@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: HPPA problems with the PCI
Message-ID: <20190525181304.GA5637@t470p.stackframe.org>
References: <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org>
 <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
 <9aa6caf2-c9d0-8bbb-8f62-dc1becea841d@bell.net>
 <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
 <CA+QBN9A9jw-QsZXcDHUMZU03TY_m5=kfcmVhpUNyv-y3xy2Heg@mail.gmail.com>
 <55e937b6-a95e-d6e4-ef30-f9040f4daafd@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55e937b6-a95e-d6e4-ef30-f9040f4daafd@bell.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, May 25, 2019 at 01:50:01PM -0400, John David Anglin wrote:
> On 2019-05-25 1:19 p.m., Carlo Pisani wrote:
> >> Carlo, can you run "cat /proc/cpuinfo" and paste the output here?
> > # cat /proc/cpuinfo
> > processor       : 0
> > cpu family      : PA-RISC 2.0
> > cpu             : PA8600 (PCX-W+)
> > cpu MHz         : 552.000000
> > physical id     : 0
> > siblings        : 1
> > core id         : 0
> > capabilities    : os32 os64 nva_supported (0x03)
> > model           : 9000/785/C3600
> > model name      : Allegro W+
> > hversion        : 0x00005cf0
> > sversion        : 0x00000481
> > I-cache         : 512 KB
> > D-cache         : 1024 KB (WB, direct mapped)
> > ITLB entries    : 160
> > DTLB entries    : 160 - shared with ITLB
> > bogomips        : 1093.63
> > software id     : 2007455457
> > PCI failmode    : soft
> I think the PDC is buggy on c3600.  The NP (iopdir_fdc) bit is set on my c3750:
> [..] 

It's also set on my C3750, but not on my J5000 (PDC FW 5.0):

root@j5000:~# cat /proc/cpuinfo 
processor	: 0
cpu family	: PA-RISC 2.0
cpu		: PA8500 (PCX-W)
cpu MHz		: 440.000000
physical id	: 0
siblings	: 1
core id		: 0
capabilities	: os32 os64 nva_supported (0x03)
model		: 9000/785/J5000
model name	: Forte W 2-way
hversion	: 0x00005bd0
sversion	: 0x00000491
I-cache		: 512 KB
D-cache		: 1024 KB (WB, direct mapped)
ITLB entries	: 160
DTLB entries	: 160 - shared with ITLB
bogomips	: 875.72
software id	: 2006803539

processor	: 1
cpu family	: PA-RISC 2.0
cpu		: PA8500 (PCX-W)
cpu MHz		: 440.000000
physical id	: 1
siblings	: 1
core id		: 0
capabilities	: os32 os64 nva_supported (0x03)
model		: 9000/785/J5000
model name	: Forte W 2-way
hversion	: 0x00005bd0
sversion	: 0x00000491
I-cache		: 512 KB
D-cache		: 1024 KB (WB, direct mapped)
ITLB entries	: 160
DTLB entries	: 160 - shared with ITLB
bogomips	: 875.72
software id	: 2006803539

Sven
