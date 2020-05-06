Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CC61C7200
	for <lists+linux-parisc@lfdr.de>; Wed,  6 May 2020 15:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgEFNqF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 6 May 2020 09:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728616AbgEFNqE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 6 May 2020 09:46:04 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E99C061A0F
        for <linux-parisc@vger.kernel.org>; Wed,  6 May 2020 06:46:03 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t199so1749468oif.7
        for <linux-parisc@vger.kernel.org>; Wed, 06 May 2020 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=EfojLiI+GaT5nKyzQCVJ5TtAw/hxFgoXMKL9If5Pw1Q=;
        b=E3o9pPc1ZoXEocM/jmifmHtJy82dfAaDi9smdSI1/ND8+0ANKgwy7ebQ/fuiPn90tH
         JOIb3/cxU7T93LOKYK5qhICG2qKnFdyZTd9w8YQK5wqPVIKklhUW5HS9myYuX3n7nQ/0
         515nuzniM6oQw2HSfEd4/suNy/eLz2X4at8Kd20DzazMOs2FwcprsDTUhPf55cs/6l11
         TsBsar8RiWx0fC05N8qSlCV0aFU0RPjeMR0/Hu6tFe+RcUfByV72rKEkeI7pJFo54kq2
         B3iJQ6U9+IkXBqt9zEvLNxkAjtU1v7nUin4bQg57Dnf/EEsbsbTJokDVXt4/kI831kzW
         0GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=EfojLiI+GaT5nKyzQCVJ5TtAw/hxFgoXMKL9If5Pw1Q=;
        b=M1XFeBKm9bihx58H1CLL4oEtFwv7eUuHcR7K4qTlieDrBlpWGg4i7Fj9CsQrqquU6e
         4OAJaTySSUF6pQ2VdX2HwRqo69hmFRSMMInLK+hOtoFVWA2EVSF6xAc8svw+iE2ITPws
         mLzi5vMHl2w8xj8uaT9PnhE/rjBMR6gjK88wwDLcv3n91h05s1HPeBG+s1rIlt8TsOjd
         +Bk8XvIRfyBcw25RnZ8lhg0XRexC/8Do2qH0kcpbwbrPOtv7XLOdPv4HhMArbWx4D/bv
         4bJTEVlJMpRG//YWrq8xEntf+pWmi2VW28l5RgcPROvMXuEZCKUFW05UwgKMc1dnL/Sm
         2XaA==
X-Gm-Message-State: AGi0PuZPDuCmYpHPPR6PYx+BNvllcz0dVrfN6YMlkjD/jZwysy6nCdq6
        tKlz+4u1jcZDxGxh2k5N1rfBm4gwZWHtzK9Iz7o=
X-Google-Smtp-Source: APiQypL5QxTME/wpf4atraWDX6bqbuwXTmWe/LxnHmVLspSkuRnzc/10WdYzdwYmylHgHDdi4p+l+7Tb89h2iE3nL0M=
X-Received: by 2002:aca:c142:: with SMTP id r63mr2639661oif.84.1588772762412;
 Wed, 06 May 2020 06:46:02 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?5Lq/5LiA?= <teroincn@gmail.com>
Date:   Wed, 6 May 2020 21:45:49 +0800
Message-ID: <CANTwqXDmktrv=wTFdg7+2+eLqRGbmaQ6qHvOrUXa=CiLjcX1yA@mail.gmail.com>
Subject: is there a memleak in function pdcs_register_pathentries
To:     James.Bottomley@hansenpartnership.com, deller@gmx.de
Cc:     linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi all,
I notice that most of the usage of kobject_init_and_add in drivers are
wrong, and now some drivers code has maken it right,
please see commit dfb5394f804e (https://lkml.org/lkml/2020/4/11/282).

function pdcs_register_pathentries() in drivers/parisc/pdc_stable.c may
have the similar issue and leak kobject.
if kobject_init_and_add() failed, the entry->kobj  may already
increased it's refcnt and allocated memory to store it's name,
so a kobject_put is need before return.

static inline int __init
pdcs_register_pathentries(void)
{
..

for (i = 0; (entry = pdcspath_entries[i]); i++) {
...

    entry->kobj.kset = paths_kset;
    err = kobject_init_and_add(&entry->kobj, &ktype_pdcspath, NULL,
"%s", entry->name);
    if (err)
        return err;

    /* kobject is now registered */
    write_lock(&entry->rw_lock);
    entry->ready = 2;
    write_unlock(&entry->rw_lock);

    /* Add a nice symlink to the real device */
    if (entry->dev) {
        err = sysfs_create_link(&entry->kobj, &entry->dev->kobj, "device");
        WARN_ON(err);
    }

    kobject_uevent(&entry->kobj, KOBJ_ADD);
    }

    return 0;
}


Best regards,
Lin Yi
