Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B17201ABE6
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 12:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfELKvs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 May 2019 06:51:48 -0400
Received: from mail-yw1-f53.google.com ([209.85.161.53]:44373 "EHLO
        mail-yw1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbfELKvr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 May 2019 06:51:47 -0400
Received: by mail-yw1-f53.google.com with SMTP id e74so8543311ywe.11
        for <linux-parisc@vger.kernel.org>; Sun, 12 May 2019 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SNVw3IlCbcojr1y/T/gRT9YOC6Jv0kBgshTheFETzDM=;
        b=Kmx9M6AZoGrYcuuwoukGg+uSojEGnEDW/9c6BmPcSgUDYNELXUJxTXJiHoa3Kbkwia
         z6gF0RTuEQAD0rMOzo9VgHLgJ7C9m3Qd1DbOuPoaWh2TxvEKBqmko8tYzTgqTwtSkahb
         Y063n0Yu1xygT8qiqOb/0LdnqSaZNGz85WZ6RPFLTtgBfNn+lsG9GBhsLNrVr34ZGCkw
         LNPODZvxgep3tDqf8+ucT4vU57et7zIeg8m8QOP80uwpiBrt+U7tqIk/IVSn1qYrT/8Y
         HhmvLR6eK8BtbjCBuWrTVE5ERXKOrqdFVo9AW4OYYDTFDgzxpSMyRCKXKOXq49PrqzXy
         xHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SNVw3IlCbcojr1y/T/gRT9YOC6Jv0kBgshTheFETzDM=;
        b=B37jMaV+6dktewFT1GkbVnk5kd2iZn1y1JdKeYrlTC/KR/G1NH2yoNJZQDQ026CW76
         XXDido3ByubIzHRFMmtHN2pGjynIwQi9x4XGMhM5bmJAiNxseaG8bvggGxHnwVy4dQtr
         lylJlOkNHPwPmatw/sH24fYAAQa8cHgksfX0aAuprvG6XfTbXJxcJSoIQp4M4vEYdXw/
         xJjJjNsCRobhM2hSRaS/2oavg7a0iKVts8RrmvDdjgJFTJ9bVw7J8nWtHM4L84DjTL6N
         YC0p2/U1be9LeaCgi+q0EdGFOFCz6zeDlTmrserDEHL4SxVcHnMiRAnAerBXwfTbWYGB
         95FQ==
X-Gm-Message-State: APjAAAV3G/gChRtJOW9mcuDFGX+QuTQmaZsKHjMHlBetqxP0+QyIuD22
        0R5ZYqAaWOGYecHmrCWJmwnVAMwu0gyCz100Yrg=
X-Google-Smtp-Source: APXvYqxyW17CLTUVx5orfIMxHNkUz42+Q3hHjMzs3o6D+wOFbrCHtzwccHLZSqKEWjQwag0wp8a8gOxyuMbaaMSSN6k=
X-Received: by 2002:a25:74ca:: with SMTP id p193mr10112494ybc.74.1557658307009;
 Sun, 12 May 2019 03:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de> <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
 <57fc8e0d-c04d-e82e-04ad-2debec0284fb@linux.ee>
In-Reply-To: <57fc8e0d-c04d-e82e-04ad-2debec0284fb@linux.ee>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sun, 12 May 2019 12:51:19 +0200
Message-ID: <CA+QBN9AfShbQ1JbcEMr++roxH0oivnEq-ndKc5yt6tGRos+N_w@mail.gmail.com>
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Meelis Roos <mroos@linux.ee>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> Problems from test like this suggest a problem outside the libata drivers themselves.
> To me, it sounds rather something like dma mapping/sync errors, or memory
> management errors (possibly dependent on hppa bus(bridge types).

It's not installed in our C3600 at the moment,
but it seems what we observed 2 days ago with Highpoint RocketRAID
1640HTP374 card
it's PCI 32bit, 4 SATA channels, it doesn't crash, but it randomly
offers file corruptions.
The dmseg shows a lot of DMA errors.

How to investigate? I am not a kernel developer, but rather an HDL-guy (FPGA)
