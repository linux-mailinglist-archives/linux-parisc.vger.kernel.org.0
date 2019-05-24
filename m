Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9E429DCE
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 20:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbfEXSNH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 14:13:07 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:35311 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfEXSNG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 14:13:06 -0400
Received: by mail-oi1-f176.google.com with SMTP id a132so7717069oib.2
        for <linux-parisc@vger.kernel.org>; Fri, 24 May 2019 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mTDqcEdLjxOsidvog6NugiJfJxRqi3RUsqUZomhRaOc=;
        b=RQw0GPSE3k1ARiUzeCF7Ek0grkO3VFYmP1UfjXQ+lxk8SrcJuZV+FZSLcl9PfSV8s5
         6TViDnahsvv0DvKFeFdRgz91df9YfkxauYloUL25XBxkyn4In2dIDkm+dy24YDgQ7uzt
         geSf0lYOLC/zZ846B8XVidmzextkrljWUZPUWvrW9z08Hi3U0x4SXV+sqTuZp4aHtIzH
         +tjrVfkQfcAV+ay+Ql2WCjO96qBnEeNFBxjLAuaK0u3uLSXkyNdApv2xznO7EJ4uZg0c
         8BL9SZKFiQsEPwcS78x2mu/S/if9wRyGI95FDI3o5vLnVsWIoDwyFE7w6KBVTcDUj/Nc
         o5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mTDqcEdLjxOsidvog6NugiJfJxRqi3RUsqUZomhRaOc=;
        b=Mt2mIUNPHmR3Fj6xLVv7JuppPWRO5+pu2j1TN9o2TUORxUXHOOORNuUNBLTUZw4a1A
         PPjQX8Cg/4Gh2xbcIwYb1PbyVnxl4h1v6rdnXKVUGrOtYtNP53T2cATvgFQ2m0l52r4B
         q+3Tixe1oAaSo2yzG/ZWUdrVgaJ1/1C9DQHVscTntSTYP7aFENLB2jT9HWjQXfxWLN71
         AsJPeGmuTDI7yWEqJjqh/gjocyPNwed+CGNNOayE1ezVX+NZLVO6p2MWblgpGYNyFsEt
         fSKYVL4vX+9fYU11nxjaKdB90WicfSemo+4VoZB2Y08ZpCv9foYWyYIZS3Xxb9UaCHkS
         9zGg==
X-Gm-Message-State: APjAAAU+6y4nILDsSk0WusVed0PBPOT+h0Xx9lnGoOdF0fm5czZUcld5
        0aIcVxukKhNARI/RrHoI9CrRxLCnCnRU04x9IBU=
X-Google-Smtp-Source: APXvYqyLvvNnoKXRARo2k3i5CYqtHvS/xMBtFI8weymrsxnZ6YrjTO/VMcRANIMYBVe9QQWuwxjhTxIok8OUxOTkWW4=
X-Received: by 2002:aca:3d46:: with SMTP id k67mr536819oia.66.1558721585766;
 Fri, 24 May 2019 11:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net> <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net> <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com> <20190524063909.GA9661@t470p.stackframe.org>
In-Reply-To: <20190524063909.GA9661@t470p.stackframe.org>
From:   Grant Grundler <grantgrundler@gmail.com>
Date:   Fri, 24 May 2019 11:12:54 -0700
Message-ID: <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     Sven Schnelle <svens@stackframe.org>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, May 23, 2019 at 11:39 PM Sven Schnelle <svens@stackframe.org> wrote:
>
> Hi Grant,
>
> On Thu, May 23, 2019 at 04:09:34PM -0700, Grant Grundler wrote:
> >
> > AFAIK, parisc never used firmware to route IRQ lines. For starters,
> > the CPUs never had an IRQ input and always used messages (equivalent
> > to MMIO writes) directed at a CPUs EIEM register.
>
> I think you mean EIRR here?

Yes - most likely. :D

"EIEM" just slipped out more naturally. :D

cheers,
grant

>
> Regards
> Sven
