Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 586B029119
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 08:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388887AbfEXGjS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 02:39:18 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:36812 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388580AbfEXGjS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 02:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=t7FxIPGRaX15FYe2B+VUKDr5S28k9TFwjC3Q6tVuykI=; b=NvmficCXIn3J/9a1TKexfynORT
        7Mq7esEQlmqmeiSK5TS3b42fYNpYqjaGPaiij0JGrGOtjuDuEsgX3KcwP8lW7t7f4/n/7SSh2JN82
        iFcYAVXahkw+DE435RBwTjzHDtfCtEGfnDdTR+fWuU/6QM8E2eQ55uLKUqwB0tV9X7b4=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hU3rI-0002m7-43; Fri, 24 May 2019 08:39:16 +0200
Date:   Fri, 24 May 2019 08:39:09 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Grant Grundler <grantgrundler@gmail.com>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: HPPA problems with the PCI
Message-ID: <20190524063909.GA9661@t470p.stackframe.org>
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
 <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net>
 <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Grant,

On Thu, May 23, 2019 at 04:09:34PM -0700, Grant Grundler wrote:
> 
> AFAIK, parisc never used firmware to route IRQ lines. For starters,
> the CPUs never had an IRQ input and always used messages (equivalent
> to MMIO writes) directed at a CPUs EIEM register.

I think you mean EIRR here?

Regards
Sven
