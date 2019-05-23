Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 874B927C8B
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2019 14:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbfEWMQj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 May 2019 08:16:39 -0400
Received: from mail-yb1-f171.google.com ([209.85.219.171]:41677 "EHLO
        mail-yb1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbfEWMQj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 May 2019 08:16:39 -0400
Received: by mail-yb1-f171.google.com with SMTP id d2so2170671ybh.8
        for <linux-parisc@vger.kernel.org>; Thu, 23 May 2019 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HMmC9P+F136u7uIJxgXNbatXeoL9MIQLsfA8sdF9Ty0=;
        b=G9qN2XROMPqi/xVRm88IKk2b216HS2m9NKdRJMlj73D47eWxQD/JefmeTfotJdVFtY
         GP8Z+rqKIr6GBN8vHHWqG0w+AwZRMk5zyE++8xdJrtFYDMqFsL1hrsKwKz/yy9Hdhs7z
         jLc5rMoW1NcU92P4P7ZnvYyd0JhaCLpaU2KXX8AnYzjIRBGqRgrIsPuc7yAmhcHohWw9
         p0IRi/i/yCNYOZJZXP6fj7OT0SXutYDOddInhmmQWu/P481PDxoM8SDouoLx96LP2rxb
         C6A9Wff3Jg4RgA7RhGXClVCEgXH/UkG5//7tXav/y3+JD3THxpdHq0rOG1Ii3Hhw6BaL
         YJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HMmC9P+F136u7uIJxgXNbatXeoL9MIQLsfA8sdF9Ty0=;
        b=mIlXSkg0I9mh8bYTg3H2QI9dH77ASylEiVEtYyfT2z2uDNdntcvcayaTmcutntgsw8
         tIqpIjJF3IQdZXONpwVCVNh0BQiBOXbKqbWIJeCpJoqpaMy9TfC+ztm5H0iZXIM7HZaz
         /g8/FfrDm63tErr5QQNBs5d5GRPX3BDRfOO/gHWzUeH+ttm8xJAY2IJE8ptomSulg/X1
         rLY7Zn6RWrRdZfL062fvPGCYwhLlwlvPr4X4jmeb5dl95upIH0/c5YgZBiJOn9fivvie
         kFOFIUandZHOfDmtsDF+b1XtNA8esIr4igwu2e0ye1Db+DypG2r3BLuqNKVEw7NbKFT/
         SvxA==
X-Gm-Message-State: APjAAAWGG+10O2LVXt7UetpjuYJztvz5SLb7U2XY0nzZOx1lJ3fA9N0e
        7lMI6I6iFymdsMu83V1W4EvSqj/g9vw2Vec43kQ=
X-Google-Smtp-Source: APXvYqwwkk4bi6me8KxcVZNLkUtIxDfbeao3nqJYSKraeStjBQDGMLQZgX+ibfBBy8mDvr+5/1iP62ih5hTmW2NEx64=
X-Received: by 2002:a25:8890:: with SMTP id d16mr27103429ybl.360.1558613798134;
 Thu, 23 May 2019 05:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net> <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net>
In-Reply-To: <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Thu, 23 May 2019 14:16:39 +0200
Message-ID: <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Grant Grundler <grantgrundler@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> Carlo, are you testing with UP or SMP kernel?

Kernel without SMP.
I am recompiling with SMP just right now
