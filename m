Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF00E32300
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jun 2019 12:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfFBK3a (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jun 2019 06:29:30 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:44456 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbfFBK33 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jun 2019 06:29:29 -0400
Received: by mail-yw1-f67.google.com with SMTP id m80so264047ywd.11
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jun 2019 03:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2ZFB2TeHmNPqfRuX+AG7l5k1dQ753LQ/bn58o5IXJk=;
        b=qYnKDGu3AkGanUfOpkoUqxBqDEge2B7zBrtytdPUYl5nVlyUFHW2IvR47Pu/zhPJhy
         /uga3vyq9drK8SXzXzP+Na7D9xC/csY3ejJhU0ge6P1TtOyGNtoYsWqpkUAHXIUmfynE
         S8AHHNI3Wu34m+s7QXn9Vb/tQLBV+PpCsvunhsPx5ZhJcb1s+mED035GTlyKsGWw1yFR
         D+xoO9iE/xff/DWbL3D9nyfhsFcT75ChCPnj3AprEmsirL702Pbc3DbmGbHKE9chUbxi
         u2q7ogbVTmghosumFx+jYtUP3F9LvW5n2PEWpu47Y4LSzJytXfEmPlrZ9qTdS2SysZBo
         YKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2ZFB2TeHmNPqfRuX+AG7l5k1dQ753LQ/bn58o5IXJk=;
        b=uORKo50SkoVKBHHlYvLwxa7bLlzrbd/UAUzVgijea3O6UxmYQG/kQPfecDxdnaY7aU
         Sb5iP7gIc7P8CMXbGetVZY0bDXYlsGvNazdUJadCpW6fJ0DkAS8IB+JlWV9gXK4+NFeW
         Kg63I8nafCf68xRD/kg4fpDy2+i028BXgx89C0HoE5yEU93fHe+03sx0uax0VGvUST4W
         kYE54GmgAbwXDgkl/lFNmKILUMEl7Vz/6+0pal8bYK4JEwGAcA/4H8WbFk4wZ3uRMzLx
         JoNobZXj/ybvGOP3YWcZ+dNkYwRix/Hne+ebQVYEBlw1D2f4z+M3FyHLUPFt5N8GxZXl
         nYtw==
X-Gm-Message-State: APjAAAUAdWXUQKc45nNdy279CrI3xzF5/rK2ExIbQoxGDgaEjNr6cTLZ
        aKN2tZHnwr3zD8ezYdzaVCh3VlJmtH4GvBvOTS4=
X-Google-Smtp-Source: APXvYqzjndsy6wJxu6bFicYGasrgu9uL91+4jYYLeGsRMWRNuC/TX55uEw4mMxKD+NXoXLDkVUMbcSNIrQ81SkcrRV8=
X-Received: by 2002:a81:2703:: with SMTP id n3mr2586899ywn.53.1559471369181;
 Sun, 02 Jun 2019 03:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190527192000.GA17551@ls3530.dellerweb.de> <20190528153815.GB16860@t470p.stackframe.org>
 <674f8b61-e897-f657-68a2-648babca00be@bell.net> <1943613.tnj53yOHQY@daneel.sf-tec.de>
 <20190528173922.GA32192@t470p.stackframe.org> <f782e9cd-0824-6c29-09bc-986813dd1e56@bell.net>
 <61253aef-2571-f8bb-756a-bf2018e533e4@gmx.de> <20190530195543.GB683@t470p.stackframe.org>
 <20190530205955.GD683@t470p.stackframe.org> <b7763436-cee8-6d8d-87cd-992947a9d651@bell.net>
In-Reply-To: <b7763436-cee8-6d8d-87cd-992947a9d651@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sun, 2 Jun 2019 12:29:10 +0200
Message-ID: <CA+QBN9Dt07Rt9Z5BSGYf4gWcPv=66wmU7aq5Z4KcdzMe9HL76w@mail.gmail.com>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

guys, can someone help me to create patches for solving the
PCI-problem on kernel 4.20?
currently, I am on kernel 5.1.*, but I also need to have a working 4.20
