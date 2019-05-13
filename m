Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4681BF4E
	for <lists+linux-parisc@lfdr.de>; Mon, 13 May 2019 23:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbfEMV6h (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 13 May 2019 17:58:37 -0400
Received: from mail-yw1-f41.google.com ([209.85.161.41]:44613 "EHLO
        mail-yw1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbfEMV6h (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 13 May 2019 17:58:37 -0400
Received: by mail-yw1-f41.google.com with SMTP id e74so12251034ywe.11
        for <linux-parisc@vger.kernel.org>; Mon, 13 May 2019 14:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=uKdPBrpaoeoUxwYNXcYzWZeCjz+6AmUeuERaTcwDnJs=;
        b=KsW1jtBMOAHcX6aLAZJzOSIxFVGEg5wJ+G+nFNtL/lSN0kl9k13WZQltvzfrY+I8mn
         WpNshMMPNZgQPnP5pM969IpCi0gR6R0HkYuuOAVRl+HfYUKak44qgwQ4OIlr7QYP4psm
         37InEl8YIe/3UG7tZ8/+HQXENMV/zDl4P0mDpoMH6V2JlWjXc8IOfkuFmejtgbCuLa7l
         dZee6AnJzv8a1rKJnIDu55IvJoxXa3mcc4yQeHOGFEqr1lBmPUDqNyVuSGORLN8naO0w
         cKB0r1jWWwREZAs/a4zXUnVv1bb43eYvQHaW61gm7PysZFsGC3syXvIyEayaTGsLyJ0W
         vQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=uKdPBrpaoeoUxwYNXcYzWZeCjz+6AmUeuERaTcwDnJs=;
        b=j4GIzUi2OX8ErZlABhk1YspryAJUAhvZWduVEHpQWRPJ5qXPPIiqYtXgIKTpIoTbwg
         By0xrGpfjHQjpZgOou07MduLvn0oY5jaEm+G3HIK9bSjvU1a2384sCPTTHzTHZ+nSU/b
         gXPVND196/uVxzRljsd/umELO8E1O8asAjp2fONAZuCD0OsNrpYvtBuprTMmUYpVgS8u
         e4HBHrKLi2+daQOvgzpLSZFf/+Pu/Me5zOvboBy5PA3ryhnqWEkt3liZMdgHvmrKLtV/
         PS9sgT379IE+9mVDfnS6eStoBNZZBed1ZLQdrw3rWkv/RaM9wT0Ka/qG2/m94aZc8nu7
         RDRA==
X-Gm-Message-State: APjAAAWVrf0UKWKUo4k3Wp+mqkngOdSzEkkTIHTeNkLSU6gCG077pCQF
        pBkV0QnGZsQJeoqZlNuE6nnbVmJX4Ix4zm9mQ1QBig==
X-Google-Smtp-Source: APXvYqxgCvMAdP+eaV80OYQpEn5FeAU84N89/daSmzuq7sn2ROnU6Xh2EILcknMxZqBNiAMdKRDlXTN3c/zzU1+zxfc=
X-Received: by 2002:a81:7915:: with SMTP id u21mr8328781ywc.501.1557784716791;
 Mon, 13 May 2019 14:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com> <CA+QBN9CN=n556f0KYj2LZ4q9wY+wx9mbWpaMcC44GufUqbsgEg@mail.gmail.com>
In-Reply-To: <CA+QBN9CN=n556f0KYj2LZ4q9wY+wx9mbWpaMcC44GufUqbsgEg@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Mon, 13 May 2019 23:58:06 +0200
Message-ID: <CA+QBN9DQ9kzNZMV=mmU-hG-kYyVyh23v+C0Wu5zGE_MtF8gGoQ@mail.gmail.com>
Subject: Re: C3600, sata controller
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

about C3600 and C3750, is there any known working PCI-X card?

anyone has ever tried:
- optical fiber channel cards?
- Infiniband cards?

I ask this because none of our  PCI-X SATA cards seems to be working
we will try with a PCI-X SCSI card, but first, we have to buy a couple
