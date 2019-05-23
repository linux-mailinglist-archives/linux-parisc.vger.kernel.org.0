Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CACC28CA9
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2019 23:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388166AbfEWVst (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 May 2019 17:48:49 -0400
Received: from mail-yw1-f42.google.com ([209.85.161.42]:35599 "EHLO
        mail-yw1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388136AbfEWVst (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 May 2019 17:48:49 -0400
Received: by mail-yw1-f42.google.com with SMTP id k128so2859325ywf.2
        for <linux-parisc@vger.kernel.org>; Thu, 23 May 2019 14:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kBubKVN61qvQJRdZnQNB4Gq4Rrx5XcT1d5yEYdRoiCk=;
        b=lKMeHcU2Sk/30/eD0qLhyI9A6X8mcj9t9vsxZlybXUy+lsm1j1K//mFNqIso2O71XN
         XnGrpkasUfx0+vuocuZaSw1qqTUb/URHyrbrLbfj5ydX3A5ObbcP8ojQnQ5eoI9MCiAS
         sSF56AaEIVHq22Nh1N2NPgm9Abi8wf0zL3UO986SaCyk9/3qOfV1YygLv+K3hZwlRnln
         TrKpMDMCJxHcJMMvU70u4wRWjf+cGHCgfmJEfHKlR2pe9phrOefvBM4q8arM26JyAaRI
         rVAvRLv/+9XnKw/spHigK4p7Q7pSZf8fPKYpZI711WE/wNyUhRgpn8g0+bZ/crd8GZ74
         rRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kBubKVN61qvQJRdZnQNB4Gq4Rrx5XcT1d5yEYdRoiCk=;
        b=svHewNJCu7L2WcVqeLPxvOAYZehpv/XT5WNhf5vfVOyv1PzxmMa/WMsTEyB8O+Lx0S
         0PeYHDsl2fCoA+MWATffBrEFJ/tuToalv28EkwaOdvXjt15BhpOGJWJNYj2ZweEe/jlB
         XHaWGHt+xwANUy13LSaiZEYO0y/G8240ETgL4nIxc1v89bluPwNAEUUyY5GJ78FuPiCY
         1ahykERTosoTsoRmQTZhrcw5ZPXzpjyymxTXht2doIb77VgvQdbrd/pRxwCykgsBbNXA
         uSjy+zgL9jkELRjDmu2meWs1PULFLlQfl/THCkn33NPy3wTHRxD6I2RS8syge7RtBcsU
         prqA==
X-Gm-Message-State: APjAAAWvBwRRBOmyAopyeOECZ87ZYs9o5RbUkqSxuZW0JBjb9s97LZud
        ONrLpXlrAyk+DZ3cKOVeW7zF//wARfw7yCO8ems=
X-Google-Smtp-Source: APXvYqwHK2Tdj0fndrnT5aD8qKYBhmT7S5J8Pwev/nbKeJCtb7fWmgozPwwhehZSkwDWNZot1VllBN/xp17HTPOHXBg=
X-Received: by 2002:a81:a189:: with SMTP id y131mr9953386ywg.245.1558648128296;
 Thu, 23 May 2019 14:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net> <CAP6odjiwmUXd8m2w-wf7R4t+qT60xiA5bE79RfBMP07xdvCpaw@mail.gmail.com>
 <7d252322-51dc-07ff-8843-b28cdc5a6762@bell.net>
In-Reply-To: <7d252322-51dc-07ff-8843-b28cdc5a6762@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Thu, 23 May 2019 23:48:48 +0200
Message-ID: <CA+QBN9DJ2gVwERTs-K=C+EG7mPOpf1OM63VndSNcXAV3BgxzeQ@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Grant Grundler <grantgrundler@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I have just recompiled the kernel with the SMP support and tested the
sil24 driver.
No dice, it has failed again.

I have a PCI64 SCSI card and a SCSI U160 harddrive, so I am going to
test it with the same workbench that I am using for testing SATA.
