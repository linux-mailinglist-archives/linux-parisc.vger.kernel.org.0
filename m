Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779F2311E0E
	for <lists+linux-parisc@lfdr.de>; Sat,  6 Feb 2021 15:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhBFOzz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 6 Feb 2021 09:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhBFOzz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Feb 2021 09:55:55 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A5FC061788
        for <linux-parisc@vger.kernel.org>; Sat,  6 Feb 2021 06:55:15 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id f14so17629420ejc.8
        for <linux-parisc@vger.kernel.org>; Sat, 06 Feb 2021 06:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=sBW6V9Hrb2SVq5rYwKsWZbacr3pcuZJbyTrQAoSbOpScuAB4kEaDUiI2QiX5eUSNvF
         +dpLFCiLjqakMXH52v82cpQsYE5lFVkB7ixD2vO3mXkOelQjUjvAGQNhA0FS7RlKBq0Z
         eiNV7/xam17/+hi02flHMdDlkBZtQPrZL2N9zGGha53rBjAy8FhMFMZ1HLZxUsbp94yi
         5Kf7atGD69xxEl+/zNu4kWvfoeX6kmDI+aS1DBkaEqBPe7EcYM5RtmPJGVk/VokRMK6+
         6RMvGS61XTV2PIuDsI4GgUyBMzEF8J6RxU6PhAXwtLhjymZonJ71GHW9XkDX5mu41BZx
         tPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=WkLrgbIOagUUQii5vuNY0e6PAU94NOUvDK9Tln9cCh1jfWH1+HbwfE1GHtmJZl5G9X
         G2DvZ4evqVz0l1rNCYIZWqbLIO0pcT0NrICAQUI6b6DhFR6NVFjJkC1CkKxSayOj7r8C
         PVKo9BvzLijgphkDsvW+xIhPznycUN4l+LVy0BeRB7rjhiy/VBC7XmKq9bUcFi4Zlbb7
         GKXU67PnZlYGvqTX8uhEFLsV6/w0tVswjKpy1iiAPAS5v65fJgRg5CL1ZdzaL0o6HY/G
         fRAiFzQmE/NElx4i48Y+xY3239XGwxa7HnKpB40iFeq4BiWu40UpAwI+S+Zu/AGxSQT9
         bm6w==
X-Gm-Message-State: AOAM533Xpr9vci9UgqGFgR9ElJKOyFH7abuMI1QoYvFlNUuv6DJTYQIE
        /Ho2kVDuWsnjwO5l+Hz90sPC0BZr1dhLCfZQmpE=
X-Google-Smtp-Source: ABdhPJxTH2a/LOeGvTbtXFctiLtCojn7Kl54IErt0v77D9xMX5kMK/IIh7/69weiMuj91CyF1kDOjnjoCe0P/oSPouw=
X-Received: by 2002:a17:906:408b:: with SMTP id u11mr8880302ejj.299.1612623314201;
 Sat, 06 Feb 2021 06:55:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:55:13
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:55:13 +0100
Message-ID: <CAGSHw-DbF4OYAkLYeS0vfSYxMBb9C=SZYfUukeq39rFo82gsjw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
