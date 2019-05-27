Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3C92B97A
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 19:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfE0RnH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 13:43:07 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:34559 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726670AbfE0RnH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 13:43:07 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190527174305.QMIW4684.torfep02.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 27 May 2019 13:43:05 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by torspm01.bell.net
          with ESMTP
          id <20190527174305.UJAC39285.torspm01.bell.net@[192.168.0.183]>;
          Mon, 27 May 2019 13:43:05 -0400
Subject: Re: HPPA problems with the PCI
To:     Grant Grundler <grantgrundler@gmail.com>,
        Sven Schnelle <svens@stackframe.org>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
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
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <1d20e458-f0fa-982b-ce3c-37f62a9dd171@bell.net>
Date:   Mon, 27 May 2019 13:43:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=9wbTzrEA347dwEE-F2oA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfPceazX+wxVnEY+qArk+2VD3HofYWNWOo8eOjbAsDsEDJu8hXHAA51j6fYl4r7w9cieBGKLAq/4X3Usuu52tLnygDc4ckaWBr3X2ujH/ezJxJeyhpLLc pXdU3v7EfRBkIqcjwyKkxozpum3/5NZH32E1wYqhVGip2Xf1fDoejZpTSXc/X5XwTw+PxQGmVUFOzg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Here is another question.  I see this comment in lba-pci.c:

/* FIXME: B2K/C3600 workaround is always use old method... */
        /* if (!LBA_SKIP_PROBE(d)) */ {
                /* original - Generate config cycle on broken elroy
                  with risk we will miss PCI bus errors. */
                *data = lba_rd_cfg(d, tok, pos, size);
                DBG_CFG("%s(%x+%2x) -> 0x%x (a)\n", __func__, tok, pos, *data);
                return 0;
        }

Which machines are affected by this problem (i.e., are more recent elroy and mercury machines
affected by this bug?

Dave
-- 

John David Anglin  dave.anglin@bell.net

