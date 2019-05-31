Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D46131147
	for <lists+linux-parisc@lfdr.de>; Fri, 31 May 2019 17:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfEaP11 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 31 May 2019 11:27:27 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:43145 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfEaP11 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 31 May 2019 11:27:27 -0400
Received: by mail-ot1-f54.google.com with SMTP id i8so9531865oth.10
        for <linux-parisc@vger.kernel.org>; Fri, 31 May 2019 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A3ycwDTNHDJjf+UXsXjsHEYp84E0ELauwzth/G3nXLU=;
        b=hIdgrjJSJLTpQ3/0pSPz4Oq2k6i50HVJ8pIv+/yOw5KknEWh7VBmI/I8QY1Pmcm1CC
         E0KTat3qgIk7cpreDqh4kd3bqtACxWv06tmW/GI3EUD1G79DcamzWg4X3gnOjRiFbuX9
         ZK8J6ZI4U6NrViwsJuD6Wrkj0HAwUDBZVZaslJBw0Vm2ntPGYl9S/WlRBD8xD51Z9bvw
         A3urJN3w2p1eC0vyCRI6UFmPYDz6qYLz2DcC18LRJcfBiMPgdf88BRTaL7jxw0HYdHXH
         jrTILA43ksXJ4MlZdPvvYAKW9uLWScqhOzbRF54U1VCGkOqE0Ex+CLXc9kQmAT8+9qaZ
         F58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A3ycwDTNHDJjf+UXsXjsHEYp84E0ELauwzth/G3nXLU=;
        b=cWgqEqO2BxM/NVQCRuwA/AXfPUonJCSJoK7Ysgxo4tCgWvRzq8Qb3eh80zsj06Ho+t
         iZWTt9PbvWU6Byjgjie4Ty5g2pNXBL+E0P00RMoVqTAAJuwvsWlj5S93auzt3ZyI58eR
         PFQoNGU/uIFNcvntSk6lzHnmw1N1F2xLKuh+RyEN4R7yn5zHX4ymbgrw0xBTFBe72ecu
         JlBUl3Tja4Fs8gRCp52covFToV2rd1tsPgwgNFepKf1hKNy9HPjLBk83HUvxMsmNtX/t
         ywND9OicmkcTViFOYKBSm3/VVkEghzhjuZYCyfrKFJ9MwcIZMKbDeWHF/fVqMoPOprww
         S1rw==
X-Gm-Message-State: APjAAAUyx8je6hdwBGe7bEDLLsOUJAeGGRmAxWK64/XAulVc5zpx4iFR
        aZFw9UQ2OujdVBtXBEZfOkRRbdCoy/QbKGdu4hzkyA==
X-Google-Smtp-Source: APXvYqxvOME6++TMLIgyfD8hz61t0wWAndhmfHqLOHIWtzhci7hcTVnp2LqJdXkdN9+uLuOmeUfCPpNEG9aYspLfMz0=
X-Received: by 2002:a05:6830:106:: with SMTP id i6mr2318564otp.268.1559316446738;
 Fri, 31 May 2019 08:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net> <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net> <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org> <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <1d20e458-f0fa-982b-ce3c-37f62a9dd171@bell.net>
In-Reply-To: <1d20e458-f0fa-982b-ce3c-37f62a9dd171@bell.net>
From:   Grant Grundler <grantgrundler@gmail.com>
Date:   Fri, 31 May 2019 08:27:15 -0700
Message-ID: <CAP6odjgaOurD=fQyYaUqZUH16yu0bXGhfargcQC7C8Uk2oQYTQ@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>,
        Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, May 27, 2019 at 10:43 AM John David Anglin <dave.anglin@bell.net> wrote:
>
> Here is another question.  I see this comment in lba-pci.c:
>
> /* FIXME: B2K/C3600 workaround is always use old method... */
>         /* if (!LBA_SKIP_PROBE(d)) */ {
>                 /* original - Generate config cycle on broken elroy
>                   with risk we will miss PCI bus errors. */
>                 *data = lba_rd_cfg(d, tok, pos, size);
>                 DBG_CFG("%s(%x+%2x) -> 0x%x (a)\n", __func__, tok, pos, *data);
>                 return 0;
>         }
>
> Which machines are affected by this problem (i.e., are more recent elroy and mercury machines
> affected by this bug?

I've been hoping someone else would answer since I don't know. Sorry. :(

cheers,
grant
