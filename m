Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A9C19CDB
	for <lists+linux-parisc@lfdr.de>; Fri, 10 May 2019 13:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfEJLnq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 May 2019 07:43:46 -0400
Received: from mail-yw1-f53.google.com ([209.85.161.53]:45239 "EHLO
        mail-yw1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfEJLnq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 May 2019 07:43:46 -0400
Received: by mail-yw1-f53.google.com with SMTP id w18so4459665ywa.12
        for <linux-parisc@vger.kernel.org>; Fri, 10 May 2019 04:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VUFfxgXb1+0/lZck5qDm8v0Jhznk+t+haEu12y40m3M=;
        b=NOJBGNevbBLjq0Z0jG+d1OXNrJC81XKjniBlh+DVzTacXjnrQ7OXyyAEzRVD9vxsY2
         IpHo8arvpmJdSWMNnE/iOV1vIETiCPcnqacyAFYmnfgZhJ9a7bilQj6Hy6dwsLCHlk0k
         c8EWwd2nyftpV84ulffhJfV+TIs9Q5W98K1bXhkQt2w96EIAtEv9alM5FQngFCTBOxo9
         98UWAOJV7707fckxd2ziwMPnOYGrmc1xnI+DWKfhoFwnep8MeACsswkpnoTsbcEJ6sPs
         Yq96BYUNJVQaoWJlMtKDzRGCLAp3IYU+wWNG4JQsZyN7shR5Peh7exNpKDl1+nEm5ueG
         5wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VUFfxgXb1+0/lZck5qDm8v0Jhznk+t+haEu12y40m3M=;
        b=D1ID8AJDLT61NsAOneSerd36qqjui5lz45P7sQQ4zje34vdeToAVcaqOSlEWB1E6zl
         5fibsVZVrzNHZLGOSthysag/S50AQN5rjm+irARHe0Ch87Kq0YHYV2d7YgAqwH44BnXP
         bOoH+oS29Ae3EaB7sIhRyb9gIaAtiErgYa/rG7jhcQlFhjZgpUib8g0JlhdFD4M/pHIi
         F1cHSViUn4pt0Deh/dlsto6Y5fkj0BsIRtWznLy1CoJz8Kvbmdlp0X+EnsSJ78Y8EC+V
         udjGx5CPIEIpxu1Q4a0aeq7D6G4Gp0ANnKpwyGSjMjQ8ydQltm+ousqQ8X2CVVcYD8R0
         paAg==
X-Gm-Message-State: APjAAAU1LQqrdqCeKx99sUtl9BW3jTPhGLL6TfPoEzOCepy2IUPRS18a
        9mQMhUF5Yir1i8xG8FKooU8sETKBHOh9MACYYSk=
X-Google-Smtp-Source: APXvYqyvRKmYtyCVXehh7+wZjLhcbsHNPjDQ9wpJTGnOmX/xo5MFSK0y1NYe7ORJ/8b0clXQfRpxbsou/+vZIN6yNaA=
X-Received: by 2002:a25:4288:: with SMTP id p130mr5013592yba.118.1557488625503;
 Fri, 10 May 2019 04:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee> <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
In-Reply-To: <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Fri, 10 May 2019 13:43:20 +0200
Message-ID: <CA+QBN9Cuf+O8uKbdhPkfAdpP0YThM4FBkHJV-DdRPYe2M146aQ@mail.gmail.com>
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Helge Deller <deller@gmx.de>
Cc:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

hi
guys, unfortunately, it panics with Marvell MV88SX6081 sata controller.
I will publish more details later

I am testing a few sata controllers, see here
http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&p=1563

Il giorno mer 8 mag 2019 alle ore 21:15 Helge Deller <deller@gmx.de> ha scritto:
>
> On 08.05.19 16:23, Meelis Roos wrote:
> > Just tested v5.1-5445-g80f232121b69 git on A180c, rp2450, rp2470,
> > rp3410 and rp3440 and it seems to work everywhere for me.
>
> Great!
> Thanks for testing, Meelis!
>
> Helge
