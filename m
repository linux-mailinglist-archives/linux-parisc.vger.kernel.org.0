Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD1F2746457
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 22:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjGCUml (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jul 2023 16:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGCUmk (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jul 2023 16:42:40 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB9AE5D
        for <linux-parisc@vger.kernel.org>; Mon,  3 Jul 2023 13:42:39 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51d805cb33aso6138678a12.3
        for <linux-parisc@vger.kernel.org>; Mon, 03 Jul 2023 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688416958; x=1691008958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ijJxlaJRztSEYO9jtYbvIWX/pyHBzuO2XJufLm4d5Y0=;
        b=P1cXLRJQAcIdtW5zSvCi/TynoKFrtpVKnIuWB+P4Ojw04mqCR3n/cDVNCVwuP07DU6
         +z2L7zqogaU8zpYiNF7sK2sjCD8tDyO86MI4AFsC7Yqc/J/nwD7pr+Djoi5O+3gOafak
         ALXIQf4W4aekFO2hHK+LG9YyNS4Ic6C8LCTX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688416958; x=1691008958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijJxlaJRztSEYO9jtYbvIWX/pyHBzuO2XJufLm4d5Y0=;
        b=KmOlVrxgYMNW7yhM8o0iQ46F8tWNcT9b2tT6wh3G85NYUPzkR4QAk0aHAG+gS8HHyV
         skefCbe9plNtmv+U85yA8LyPUkScydFpaesXiK6KQdbCWJzeo56vAPUe7oDk5ldgAQ75
         CxLEmT4TV6tE+hi+J1UMcyXaPEQ9QoC/QSJrWh4DZIe42+zzffTnlMmhFWg4Ah7zk1eL
         YbPWryAKVhnZsJ04NT1MwDTpAIK1fs7Mjk/QSWHrHsJrQIkhOJQT1tkTQ24t3pqJdMgP
         kBKpMqP0AeV6ljiMmXvRvY+/hs1/GoQ3seMMNHSMSBzMsU2/lWMaZwSEolU+BYEZeShg
         HCiQ==
X-Gm-Message-State: ABy/qLaJeOi4JgZg3y/+ncAFBdk9KPRqPae7z8fqcuPHM6EYpoIj+PFA
        L+SH2K6VH3fg/+8AB78NjtgQSdBTkl3syP0mzwP5e9WB
X-Google-Smtp-Source: APBJJlGbrwnxYHTEdJWHeY7EhlzV3lfsVMIE6vsJTkdLEjUMwvzUDa0tznyAkc45dkLRjhr2zRPaKA==
X-Received: by 2002:aa7:d78b:0:b0:51e:d60:b6b5 with SMTP id s11-20020aa7d78b000000b0051e0d60b6b5mr3608242edq.41.1688416958069;
        Mon, 03 Jul 2023 13:42:38 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id q7-20020aa7d447000000b005183ce42da9sm10794123edr.18.2023.07.03.13.42.37
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 13:42:37 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51cb40f13f6so6127850a12.2
        for <linux-parisc@vger.kernel.org>; Mon, 03 Jul 2023 13:42:37 -0700 (PDT)
X-Received: by 2002:aa7:c64c:0:b0:51e:ca7:a107 with SMTP id
 z12-20020aa7c64c000000b0051e0ca7a107mr4224909edr.31.1688416956905; Mon, 03
 Jul 2023 13:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <ccadf5d7-e22a-ab5b-21e8-18a788251845@redhat.com>
 <CAHk-=wj=vEtN54KzMHDrguaS8zNg4ppoFP4mm7vVThotGo53nQ@mail.gmail.com> <a8a1cd41-1246-e2cd-10ea-9bc571148afe@redhat.com>
In-Reply-To: <a8a1cd41-1246-e2cd-10ea-9bc571148afe@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Jul 2023 13:42:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=whEMfVA2EOQVdo03vZbTLs_0q=1xg9dCeZ12mv=WhnUqw@mail.gmail.com>
Message-ID: <CAHk-=whEMfVA2EOQVdo03vZbTLs_0q=1xg9dCeZ12mv=WhnUqw@mail.gmail.com>
Subject: Re: [PATCH] parisc: fix inability to allocate stack pages on exec
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Vegard Nossum <vegard.nossum@oracle.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Frank Scheiner <frank.scheiner@web.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave@parisc-linux.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-parisc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, 3 Jul 2023 at 13:40, Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> (please, also send this patch to Greg, so that it will be included in
> 6.4.2)

Already part of the -rc1 review commits

    https://lore.kernel.org/lkml/20230703184519.261119397@linuxfoundation.org/

Thanks,

            Linus
