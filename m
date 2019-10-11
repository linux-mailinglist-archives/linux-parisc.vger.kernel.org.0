Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C793D4852
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2019 21:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbfJKTRt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 11 Oct 2019 15:17:49 -0400
Received: from mail-yw1-f42.google.com ([209.85.161.42]:40317 "EHLO
        mail-yw1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728776AbfJKTRt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 11 Oct 2019 15:17:49 -0400
Received: by mail-yw1-f42.google.com with SMTP id e205so3864237ywc.7
        for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2019 12:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=2blXQH4xpdxyI97yuUuQWy5lbIFQN+mGnSf3CJ9yl+c=;
        b=mz80xrkzkqqu9byRpPTgmFLVZmJZJlWcarfAbgqLNd157+Z3y3bmts5ou4+FmHS9sf
         xv6n7NAZCbH8S26QTWhmJf17VO8x4zCVSs+MPkvQnrvR/9GjamwTE+jE9RQ4GWM8ynho
         1F/MtiYm7of1Y4/b7yvfoPedUVcMn8MIPRFBzOZREUrAydkzJIv6lR7PHY5agNQdRhmx
         UtokylgUymvpAJJQglFYKf5lEFBsZX/ye7gffwvsRLTtz8o73+3V3bC0l+HGzoXEn9kU
         xJN9nJHrMxETW5aLy/4vkc82QXN73kXOB7/SeIcHcA1fWOScluU1vD4BEuepw0Um6wYP
         IFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=2blXQH4xpdxyI97yuUuQWy5lbIFQN+mGnSf3CJ9yl+c=;
        b=OhCuOeNnabWhWNnbqxcestw8/YCzSTeDR4aH8nj6RWIY83XDIoLHqrz6nFSx9tv59j
         awzyfWs3BTwOa8ISR6tOroBpQORdlVEPUY67IB1OrOnOBXLcTeHjQY9BsM0y8bULKWNM
         DYFzDP1L5ClTGyziXra27tno5RQFd3XohnxmFqo9n4YY+amyZd+f3rPI1YljYeI4NVpa
         9OpsKuZwl1c49TOS7qAXobEmX69CsYOuLJ2XJ9hJK+L0k1uLFIjw7bo5LEOy7yD9CwsM
         EeYGNxvQnQaLlVhN6hNLOPz2m4HnL0S32huEAreg26Zt4mboGZA0a59NcX+SdrJqqFsF
         /psA==
X-Gm-Message-State: APjAAAWZP5t1Yi0CFJ/A1P38g6bbEce4RYM9Svb8T1LDtu5mQ2v79BLj
        ekfqLcseX8UKThMPFRDuJeLmGRONYYX3EnPjF8qiDEFs
X-Google-Smtp-Source: APXvYqxD0w6WerN4ME1s6y7+XvO0XwIr6g18kQpOsD5WhlsaWk72YAAtftio+aay+AG19X24P19BqG2ceYmYR2FxyjQ=
X-Received: by 2002:a81:1a85:: with SMTP id a127mr3846084ywa.53.1570821468206;
 Fri, 11 Oct 2019 12:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190909133856.GA32746@ls3530.fritz.box> <20190930082026.6ac087ff@wim.jer>
 <66fcabcb-ba00-b6c4-7d46-c1fdd9b05283@gmx.de>
In-Reply-To: <66fcabcb-ba00-b6c4-7d46-c1fdd9b05283@gmx.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Fri, 11 Oct 2019 21:17:36 +0200
Message-ID: <CA+QBN9CPyOyZC5aeJS+X5CG0wdHvn0Mc4G7j9AXxbYBw=W-52w@mail.gmail.com>
Subject: pATA Promise Technologies PDC20265 (datasheet)
To:     linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

hi
perhaps a bit OT, but I really don't know where to ask.
I googled a lot these days, but couldn't find a datasheet about the
Promise Technologies PDC20265 chip.

does anyone happen to have a copy of it?

thanks
=)
