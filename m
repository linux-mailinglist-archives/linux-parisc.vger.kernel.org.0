Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B720A772FF7
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Aug 2023 21:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjHGTzp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 7 Aug 2023 15:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbjHGTzo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 7 Aug 2023 15:55:44 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502121722
        for <linux-parisc@vger.kernel.org>; Mon,  7 Aug 2023 12:55:42 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-26890669c8eso1035303a91.1
        for <linux-parisc@vger.kernel.org>; Mon, 07 Aug 2023 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1691438141; x=1692042941;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1rlE6Lbiv7v87LfVDVV0XlxtwZt5i61uL3L217w1W8=;
        b=32kDFJr8AELTQzL2AyHx+hW0q6+fKxiKNuP8qcYmDwfEHqhAEFqcI4Q6xJDtB10q8F
         DRcDafxU8NN+xZ1ah+TZ/DvfUyJlb7FzCIeG6CNzKwckKOHi2ydiferKCg4ZkXJWTFIp
         lc58kb/qpln9Sha/ITdnbEGIuaKiT4cKIScOGhdvoeJMNKq3lj/RiDqOJn+yi7onJr5E
         9zx8ozwewXoBh3UrNVBSkvzV+yxdU60s6hD+FRPGepT3mJuDmyNnwfpAcF1hWJ+Aw8DN
         rZS6OlRYzUZl6h0Z/zn7pdhaexu/xjmFh/7KiKQ56ulXy/qCDvwl4N0dHxaTDWzAgMyo
         9pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691438141; x=1692042941;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1rlE6Lbiv7v87LfVDVV0XlxtwZt5i61uL3L217w1W8=;
        b=gXNvsuC1l8lAAI0vWgReC2n2iQLHmrn8omfqaIqQllcsdCRuHR6uP3yTWKwZKrkYsc
         FXJoOSoC2PQcgpT85jwp8yrNSUv35dsputvVvRVjHP2wHzhaZy449CoUpUHJISLaNv1D
         QY2M3f1TZTxwADoP2BoW9XdIDHdM5C75HBwU/mro4+Rj874jmMJcVjjHFBz2V9tgcYcD
         JPm2eoWr/pnlz6i3Ar+TNb5ERbQ53xqubILh+RKd7cWe+pe1l/xO0x08UeWYEvtoKC2u
         1OReJ450yOqnTW6jFroo9QuTf4sio3hRn+z/FdasATchLp1brMi899ak8HVqU/wCgDeU
         mC1w==
X-Gm-Message-State: ABy/qLbxC9A7XTS8uWP1M+uaXd3ezeD+DmmvVHtGHh5hW05ZfcoOim0R
        odD23glnZoOJejY2RFc10QQGQAJMaWFARAgQtxk=
X-Google-Smtp-Source: APBJJlEV4LiHr2iZGniWZnrPrKUlkJEOO1G+DqlAphV01toEwgcnPPpcc8wxa/99L7mKzBGG4BVN2Q==
X-Received: by 2002:a17:90a:1f83:b0:268:3dc6:f0c5 with SMTP id x3-20020a17090a1f8300b002683dc6f0c5mr26242828pja.0.1691438141323;
        Mon, 07 Aug 2023 12:55:41 -0700 (PDT)
Received: from smtpclient.apple ([206.181.83.18])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a19d700b0025645ce761dsm9672791pjj.35.2023.08.07.12.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 12:55:40 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Jens Axboe <axboe@kernel.dk>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] io_uring/parisc: Adjust pgoff in io_uring mmap() for parisc
Date:   Mon, 7 Aug 2023 12:55:28 -0700
Message-Id: <94C6EF57-1E8C-449E-BE34-96FFF42B4AB5@kernel.dk>
References: <1eb94cc3-1286-4e30-f891-a6b6dfa11ba9@gmx.de>
Cc:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-parisc@vger.kernel.org, io-uring@vger.kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <1eb94cc3-1286-4e30-f891-a6b6dfa11ba9@gmx.de>
To:     Helge Deller <deller@gmx.de>
X-Mailer: iPhone Mail (20F75)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Aug 7, 2023, at 12:33 PM, Helge Deller <deller@gmx.de> wrote:
>=20
> =EF=BB=BFOn 8/7/23 20:34, Jens Axboe wrote:
>>=20
>>> On Mon, 07 Aug 2023 20:04:09 +0200, Helge Deller wrote:
>>> The changes from commit 32832a407a71 ("io_uring: Fix io_uring mmap() by
>>> using architecture-provided get_unmapped_area()") to the parisc
>>> implementation of get_unmapped_area() broke glibc's locale-gen
>>> executable when running on parisc.
>>>=20
>>> This patch reverts those architecture-specific changes, and instead
>>> adjusts in io_uring_mmu_get_unmapped_area() the pgoff offset which is
>>> then given to parisc's get_unmapped_area() function.  This is much
>>> cleaner than the previous approach, and we still will get a coherent
>>> addresss.
>>>=20
>>> [...]
>>=20
>> Applied, thanks!
>=20
> That was fast :-)
> Actually I had hoped for some more testing from Christoph and other
> parisc guys first.
> Anyway, since you have a parisc machine in your test ring, you will
> notice if something breaks,
>=20
> What's important:
> Please add to the patch:
> Cc: stable@vger.kernel.org # 6.4

It=E2=80=99s not going upstream just yet, just easiser to apply for testing o=
n my end. I will test it locally too.

=E2=80=94=20
Jens Axboe

