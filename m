Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25426792D62
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Sep 2023 20:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241204AbjIES3m (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 5 Sep 2023 14:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240329AbjIES3l (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 5 Sep 2023 14:29:41 -0400
Received: from mxe-2-522.seznam.cz (mxe-2-522.seznam.cz [IPv6:2a02:598:64:8a00::1000:522])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32C8113
        for <linux-parisc@vger.kernel.org>; Tue,  5 Sep 2023 11:29:09 -0700 (PDT)
Received: from email.seznam.cz
        by smtpc-mxe-64ffbbb66d-k5m5t
        (smtpc-mxe-64ffbbb66d-k5m5t [2a02:598:64:8a00::1000:522])
        id 7dfa9b43b234c4ff7da5ee8a;
        Tue, 05 Sep 2023 20:27:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
        s=szn20221014; t=1693938475;
        bh=SS1x1jCPVEePoyamOj6pUKsAwho9UZqyCra2wZoHvmg=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:References:
         In-Reply-To:Mime-Version:X-Mailer:Content-Type:
         Content-Transfer-Encoding;
        b=GVLI+EKeLmbpRKL0ZWBEn0EThFnOup5zHZ/JtX1VdeD549fm+mWKXEFQWMZ8F4pMT
         xgORpbjkclULxsABcKiy0QAXderWB8nn5dRsvTQ7Lh+aqh1M4t5AKSQ3RjxQCWtwqt
         p+aNE2MgslbvbW9CCKuCDjLJXd6i2G2DORUZ6DtVW3auEW6PYlNoKLjKGgkUYnIv+r
         25lTI9Pdd16wUO6yMnDWVBcNdto9QXIDnTGQlYsz7IZs70kRwX/r6bLeg/nJrjju96
         dHJ/NUGNcxqrs9h3LibMF6RDCd8rCCv7TMn0ZJaiSvMh3OZWIXKPH5WunsiEogOw3Y
         zfUCZ6SOpOonA==
Received: from snat-11.cgn.sat-an.net (snat-11.cgn.sat-an.net [176.222.226.11])
        by email.seznam.cz (szn-ebox-5.0.161~newmaster-4) with HTTP;
        Tue, 05 Sep 2023 19:12:41 +0200 (CEST)
From:   <Vidra.Jonas@seznam.cz>
To:     "Helge Deller" <deller@gmx.de>
Cc:     "John David Anglin" <dave.anglin@bell.net>,
        <linux-parisc@vger.kernel.org>
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Date:   Tue, 05 Sep 2023 19:12:41 +0200 (CEST)
Message-Id: <1yX.NvPF.6kt2vjNkw{E.1azs69@seznam.cz>
References: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
        <7ce98f53-d80d-fc78-1bff-419eedaf8e36@bell.net>
        <f8be4af4-725a-902f-60a5-0f18c198b130@gmx.de>
        <d52e26aa-0c46-498b-0586-1fea2f94c58d@bell.net>
        <13c75691-ac65-93be-c217-89e7cfbed10e@bell.net>
        <d27ecc12-c507-f691-7be5-8344b72f713f@gmx.de>
        <1wd.NvQz.Gj}B593TXc.1azrF9@seznam.cz>
        <1xN.NvP9.1{VV8Csbz0.1azrZI@seznam.cz>
In-Reply-To: <1xN.NvP9.1{VV8Csbz0.1azrZI@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.32)
X-Mailer: szn-ebox-5.0.161~newmaster-4
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-09-05 18:35:30, Jonas Vidra wrote:
> On 2023-09-05 18:14:01, Jonas Vidra wrote:
>> I will try building a vanilla 6.1.46 with the patch by John David Angli=
n
>> applied and I'll report back. It might take me a while, though, as the=

>> PA-RISC system in question is not available 24/7.
>
> I did a dirty rebuild (no `make clean`) with the patch and it fixes the=

> issue as well.

I was too hasty. The failure is still present on patched 6.1.46, although=

it is now intermittent. With a vanilla 6.1.46, I hit the issue perhaps 10=

times, and it seemed that the problematic command fails every single time.=

On a patched 6.1.46, the problematic command ran 3 times but only failed=

twice =E2=80=93 it finished fine on the first run.

It might be just pure chance, though, if the actual failure frequency is=

something like 4/5 =E2=80=93 it is possible that both versions are identic=
ally
buggy.

I have no idea if the Helge's tree I tested previously is similarly
affected =E2=80=93 the failure rate there is 0/4, which too might be due t=
o
just exceptionally good luck. But I still hope it is fixed there.


> Is a minimal reproducer of the issue still desired? I can try to create=

> something from the strace output, but I'm not sure whether it's still
> necessary.

I'm now assuming it's really needed. I will prepare it, hopefully in the=

next few days.
