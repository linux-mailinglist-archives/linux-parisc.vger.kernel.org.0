Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB142A5E3
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 19:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfEYRuD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 13:50:03 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:58939 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725838AbfEYRuD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 13:50:03 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20190525175001.SIRZ4947.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 25 May 2019 13:50:01 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20190525175001.ESCS21689.mtlspm02.bell.net@[192.168.2.49]>;
          Sat, 25 May 2019 13:50:01 -0400
Subject: Re: HPPA problems with the PCI
To:     Carlo Pisani <carlojpisani@gmail.com>, Helge Deller <deller@gmx.de>
Cc:     Grant Grundler <grantgrundler@gmail.com>,
        Sven Schnelle <svens@stackframe.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
 <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net>
 <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org>
 <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
 <9aa6caf2-c9d0-8bbb-8f62-dc1becea841d@bell.net>
 <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
 <CA+QBN9A9jw-QsZXcDHUMZU03TY_m5=kfcmVhpUNyv-y3xy2Heg@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <55e937b6-a95e-d6e4-ef30-f9040f4daafd@bell.net>
Date:   Sat, 25 May 2019 13:50:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+QBN9A9jw-QsZXcDHUMZU03TY_m5=kfcmVhpUNyv-y3xy2Heg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bJBo382Z c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=azY-JpmvhJSn3WS7toIA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfKu4Er5PP253Wjj7JmHEv3rvqA/jOc35lW4hrsqhzjMr1T86Z36XUmeFdDkNuJMJrO2uIisCdRKgYaISQ6WzGK+4NdtkhuY5omJHZiZlxgmJbCpGap8q 7EkJdIrzNR/Eb4X+lQZVgC6R8a6WAbC064U7D59XMNsrMcy3QL2KYOIIe3W9v7Tss6NyKNTE8+dgag==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-25 1:19 p.m., Carlo Pisani wrote:
>> Carlo, can you run "cat /proc/cpuinfo" and paste the output here?
> # cat /proc/cpuinfo
> processor       : 0
> cpu family      : PA-RISC 2.0
> cpu             : PA8600 (PCX-W+)
> cpu MHz         : 552.000000
> physical id     : 0
> siblings        : 1
> core id         : 0
> capabilities    : os32 os64 nva_supported (0x03)
> model           : 9000/785/C3600
> model name      : Allegro W+
> hversion        : 0x00005cf0
> sversion        : 0x00000481
> I-cache         : 512 KB
> D-cache         : 1024 KB (WB, direct mapped)
> ITLB entries    : 160
> DTLB entries    : 160 - shared with ITLB
> bogomips        : 1093.63
> software id     : 2007455457
> PCI failmode    : soft
I think the PDC is buggy on c3600.  The NP (iopdir_fdc) bit is set on my c3750:

dave@hiauly6:~/linux/D$ cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8700 (PCX-W2)
cpu MHz         : 875.000000
capabilities    : os32 os64 iopdir_fdc nva_supported (0x07)
model           : 9000/785/C3750
model name      : Allegro W2
hversion        : 0x00005dc0
sversion        : 0x00000481
I-cache         : 768 KB
D-cache         : 1536 KB (WB, direct mapped)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1737.72
software id     : 2011455108

Dave

-- 
John David Anglin  dave.anglin@bell.net

