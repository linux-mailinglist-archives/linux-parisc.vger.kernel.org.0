Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31B0821D46
	for <lists+linux-parisc@lfdr.de>; Fri, 17 May 2019 20:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfEQSZx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 17 May 2019 14:25:53 -0400
Received: from mail-yw1-f41.google.com ([209.85.161.41]:39586 "EHLO
        mail-yw1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfEQSZx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 17 May 2019 14:25:53 -0400
Received: by mail-yw1-f41.google.com with SMTP id w21so3109494ywd.6
        for <linux-parisc@vger.kernel.org>; Fri, 17 May 2019 11:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=NMD+tguRNcI0Wh532TzpRrR829CcjmIT9kkuNm9M3DM=;
        b=qmtQjbTxjJasuaGWXk6j9IfzQoUwZFp9C1kGYHdt1maQ1rt21/odkj0Kot5dVBXEAF
         8lz4duD2yuaaxKZ6a5Ub/3GmMbd+AhmR+LplCklSJM+AWpruwWDPrdgQqfv9UePyvALp
         SIP/hGI+dzOgRgYZ4zf9TJC7BdMUAGvuFsG80JQXD0GLLB6u6E6yxyRH59P8dmB5w4xK
         QeOoIA/V5Ry7GCRvEZWC8K2yzfLRp3gpVx2HxNlCIoVNdb2Lff83eEsob1T0XHfAKmn5
         oxk6jIHPH+ZVP5yx+J0MZJDPkJhXRtr746EC23O5NcIdQGaJMkNW4BNz5oyVsVy3rc77
         lVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=NMD+tguRNcI0Wh532TzpRrR829CcjmIT9kkuNm9M3DM=;
        b=Ms7STD5HhjVdxJokfYi3d+bbzOFTgU/lSWE5A9eRqrpI2kcwfmYv37G5P+24taAd5n
         YGXl5cvhhwEp2khrata0HYO6ij25zzD1L2VzSqe2weajt8IVIbYBPR7tfPPBF5Bo9htr
         NI8hWC7A+gfmCmzNXYYaZ9XG0zbbvJt7DCVXzxLLbxtaft/0T11OASga5xu42fPAOD2E
         G+GNKIJ314q069oh4oFjgNUwiBCr7Xs5RUThqlPyvtSh/j2hh+efiNyst97ghanqZX0F
         BFzb6uE+1dToL+sZDDoC+Actqr/LHKLoRzz6Gw1JIn1lwO1r48alooQV//JbUaMJ/yv/
         uyhQ==
X-Gm-Message-State: APjAAAWhfjuZmZH4fG4Rg6jggAe931eYDNiXNENvI8A7gGUNwhEHhPDK
        xDwu8j2XNjLuY6S1mj0/g+Ds8pbh6Ny/md5mmBZ1+DyL
X-Google-Smtp-Source: APXvYqz8PZbt8KBTFt0njphoViyQ48cafup2Nk33SzMYimWUehwa+cupV0T6ofyKoxQuaDo3lBQY+Z+0e9gPALhY+VA=
X-Received: by 2002:a0d:d711:: with SMTP id z17mr16491746ywd.128.1558117552704;
 Fri, 17 May 2019 11:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net> <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net> <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
 <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net> <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
 <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net> <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
 <20190514130151.GA530@t470p.stackframe.org> <922dc8c9-f401-ed07-ce83-a534fecefb04@bell.net>
 <CA+QBN9Did5PqWkp3rcCN15n+dFd11jqCe+L2q33sTr2d6Ow15g@mail.gmail.com>
 <9e2370bc-95e2-97fe-ebc8-7e6626d06deb@gmx.de> <9e67ee59-4e13-40be-6c1d-2b3409127515@bell.net>
In-Reply-To: <9e67ee59-4e13-40be-6c1d-2b3409127515@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Fri, 17 May 2019 20:25:47 +0200
Message-ID: <CA+QBN9ALLJLmcszQ3Xfhv3UQzgHh11Y3mffJhOG=G7qseMtR7A@mail.gmail.com>
Subject: Re: C3600, sata controller
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> > Random failure could happen because of missing calls to DMA syncs in the driver.

we have tested several drivers and cards, these show the same behavior
-a- Highpoint RocketRAID 1640 HTP374 (PCI)
-b- HighPoint RocketRAID 2224Marvell MV88SX6081 (PCI-X)
-c- SYBA-SY-PCX40009Silicon Image Sil3124 (PCI-X)

I don't know about the HTP374 because it hasn't yet been tested on our
PowerMac-G4, but about other cards:
- they perfectly work on the PowerMacG4 MDD
- they perfectly work on our x86-box (intel core duo)
- they randomly fail in the same way on the C3600

this might mean something. I Don't know.

Anyway, even the I/O performance is not good on our C3600: none of the
above move more than 20Mbyte/sec, while the internal SCSI moves
60Mbyte/sec.

So I wonder if there is something really really wrong with the DMA:
it's too slow!
