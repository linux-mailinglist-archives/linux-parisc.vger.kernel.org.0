Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E293C1909
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Jul 2021 20:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhGHSPr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 8 Jul 2021 14:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhGHSPr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 8 Jul 2021 14:15:47 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD758C06175F
        for <linux-parisc@vger.kernel.org>; Thu,  8 Jul 2021 11:13:04 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id g8so5516312qth.10
        for <linux-parisc@vger.kernel.org>; Thu, 08 Jul 2021 11:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:mime-version:subject:from:in-reply-to:cc
         :date:message-id:references:to;
        bh=nz61/2ipllgpvLpgCGgX7r1d8pgsxg1IoMqza7C5vTI=;
        b=CcXG3sVPOSKXoFF+gaKVYgWrb8DR1EijPlJrLmlONIiTDa4P2vT11TLlDFjg69+uPt
         QHsex7kF/9kXGYrMJyOh/ab2f13XBz/jktm0MTRyl4eBUQiYh1UWGZXRDWEIN6YN7Up8
         SRsVYZPe3EvshEITV376tINcoQP64hpMURWixn3JcJdLQbRyAhSdTTGYZKt7lO3GX1IQ
         ux6X4oh/b8cl2YnLV6xgqpm/h5xJXm66Z9TqYoiqMfDHNaRDJ2IFs37Q7EUwVL6HRIpO
         S1Jg/KOIkgiNy5RZO2uOu1sitvNnHg3/b7d4pa5Pels9Gu76hSw+nd/mDHOMDb+JzuFM
         5TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:mime-version:subject
         :from:in-reply-to:cc:date:message-id:references:to;
        bh=nz61/2ipllgpvLpgCGgX7r1d8pgsxg1IoMqza7C5vTI=;
        b=HM8JcyAAG373AsoeLKy8KXclvDhlAxqt5mXXUeVdQ8MFClhFxLLXToUri9V6IWmJkp
         PH9MZfiipnzT7AdUdjv8p1obmnujE+JiC5sudJ7BRCbSn7rzSiiC4gJCzzyIgqisB4LC
         aimyLWIjaQjsIXV4UPkfhl9caWbIWQ9SS/0t3vYVuba7AmLrVTd+D/PUi6KMCRhh1igm
         9+QUQ72VMMfi58DFFnmJKaNJdUrg1rxS5oTqQc9KtF2dY2zzHm4altYex73VEzWWBWRP
         jbb6Gd6revO3vE7TFNbVkNu3Q/ySkDyNZshiSnfN9eLlIZvUsczXqNiyfIANrUW/SFBa
         XFiA==
X-Gm-Message-State: AOAM532ohRKoPyxllJP0Nx9ZCKgcm8NLxwK4bkd4z6kFSAar5oL29ZI2
        AZYcgrBE66cL8I4NiFlWxabZCw==
X-Google-Smtp-Source: ABdhPJxsKhx6k4o/ZjQtYmK/8qame8teaN4j1+lWv0q+KTN5pW0nVqWR8OgdwYOLslpoaE3pEYXJcg==
X-Received: by 2002:ac8:4b69:: with SMTP id g9mr23819103qts.123.1625767983994;
        Thu, 08 Jul 2021 11:13:03 -0700 (PDT)
Received: from smtpclient.apple ([50.225.136.98])
        by smtp.gmail.com with ESMTPSA id l6sm1330221qkk.117.2021.07.08.11.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 11:13:03 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH net-next v2] drivers: parisc: Remove unnecessary #if blocks
From:   bilbao@vt.edu
In-Reply-To: <YOc+EWQQUMJDZRCE@lunn.ch>
Cc:     James.Bottomley@hansenpartnership.com,
        Joe Perches <joe@perches.com>, deller@gmx.de,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 8 Jul 2021 14:13:02 -0400
Message-Id: <695234B5-445C-43F8-A438-29D644A56291@vt.edu>
References: <YOc+EWQQUMJDZRCE@lunn.ch>
To:     Andrew Lunn <andrew@lunn.ch>
X-Mailer: iPhone Mail (18F72)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello Andrew, following your suggestions I will just abandon this and resubm=
it next week with proper Subjects, etc.=20

> On Jul 8, 2021, at 2:04 PM, Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> =EF=BB=BFOn Thu, Jul 08, 2021 at 01:40:54PM -0400, Carlos Bilbao wrote:
>> Remove undefined #ifdefs and #if 0 from these two files.
>=20
> Hi Carlos
>=20
> This is not a network driver, so putting net-next in the subject is
> not useful.
>=20
> Also, at the moment, we are in the merge window. It is unlikely that
> any maintainer will accept your patches until the merge window closes,
> which should be this weekend. You can whoever still send patches, but
> please mark them RFC, and send them just to the appropriate list, not
> the maintainer.
>=20
>      Andrew
