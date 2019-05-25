Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D133D2A714
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 22:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfEYUyE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 16:54:04 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:55993 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725951AbfEYUyE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 16:54:04 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190525205402.EPTR4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 25 May 2019 16:54:02 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm02.bell.net
          with ESMTP
          id <20190525205402.KXFZ30132.torspm02.bell.net@[192.168.2.49]>;
          Sat, 25 May 2019 16:54:02 -0400
Subject: Re: HPPA problems with the PCI
To:     Carlo Pisani <carlojpisani@gmail.com>,
        Grant Grundler <grantgrundler@gmail.com>
Cc:     Sven Schnelle <svens@stackframe.org>,
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
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <9e99f63d-7811-6006-3f7d-d7e94ba599ee@bell.net>
Date:   Sat, 25 May 2019 16:54:03 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=7f2vBml7QJuxi8-2h5kA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfD3Sp2mjTOgfFeu4WtcnM2mPbHrmQMgg4mnSFsnxyRZkSB9q+DUeJWuK5ZMwm94GelBukILsebez6JNgHFdLsiWg6hMAtwQ5D4lZ021Llg9eWQOJnIJN Y7IHgrS89pO0DGnWkXJFmW+eh9C5cTl0qCN0Iv/quqWhPw1kYhGI4yXXYmhlLmAz6tjrJarZMCprZA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-25 5:01 a.m., Carlo Pisani wrote:
> on  kernel 5.1, from the git repository, compiled with SMP
>
> dmesg | grep altern
> [    2.551002] alternatives: applied 156 out of 175 patches
>
Prior to the patch which added ALT_COND_NO_IOC_FDC support, sba_iommu.c checked
the capability bit directly and set the variable ioc_needs_fdc.  This explains why earlier kernels
didn't work for Carlo (ioc_needs_fdc would need to be 1 to get flushes).

Carlo, would you confirm that Helge's "fix alternative coding for PCX-U CPUs" patch with "pcxw"
changed to "pcxw2" fixes the Syba SATA card?

Dave

-- 
John David Anglin  dave.anglin@bell.net

