Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4652DF91D
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Dec 2020 07:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgLUGFE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 21 Dec 2020 01:05:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgLUGFE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Dec 2020 01:05:04 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2423EC0613D3
        for <linux-parisc@vger.kernel.org>; Sun, 20 Dec 2020 22:04:24 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id j20so7936695otq.5
        for <linux-parisc@vger.kernel.org>; Sun, 20 Dec 2020 22:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=jArWfA3zV/7lnxiWgfjF6a4O9O1fNpc7xFr6lEcByt4=;
        b=Wyw5di4HrZsxF5UM4EosA/Scbt9eSVfkgza5jdx3MMoZZsikVuwO20/WUPi0OoesJ0
         pY8/wFtSy+itwmlhqtG1ZJdWSqFe+qPyhGWKw286pSwmcW6yUdlhWYVUdQfOZKg6bQg1
         pTuBjMlzMR9KeKLD8+CG6Pk86bUmywwplmNcgi787Er9c2lkFHvyyh9I5ZJmSPygKwff
         vXc+KQYF0WFa+ylLheaOM7Pd9AwCEIaw2EA4NhAPJiX1LaXhEp+376PVtuyB2AgJ8xmB
         i5IMaU0pg9ALqZgjeWzaWIpCyldVaHFGL8mtwQfb/uwMAdvnA/LjbUpZE+rKJ9tmADV8
         vfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=jArWfA3zV/7lnxiWgfjF6a4O9O1fNpc7xFr6lEcByt4=;
        b=TZVWkgajwK4ioSrorNE5LVisSUJ8YitFJ4dhvLWgX4g4IUaEcjIF7zZ61ZyarRDEJW
         piYw6Z9rTZrJaXlLl9PAwnYChZiUC6q1whMyMv5/G81uyOf6H5DqwAqVLEyvWivBW80X
         v0eaTNVwTL8gNKTExD8OLQm1PdLzumRgJKwPgJYNUyYiQA3uPkdxwlEvIcFP9Vbvekf/
         Jd0vJdU6Cy3RmO1NJ6h4GYZv5eoQsXE7MfV6RftOQOdixUDgoJJ4UZINvpT2ebYKTQvx
         m23YvewOkOvFLddF4v9KmYgcUfERnemQRmZp7vER1GiGPDH3fSxxqX4031sQKsdMyM8W
         t8eg==
X-Gm-Message-State: AOAM532iG/07/77EjkPO9Gjtw1ww6hZOTq8n1adf/w1rSmBr1azDmwcT
        JzkmNmcXBmRueDNpxqnYQ/EEoCHhtmHEFAyPURc6h3+3gEc=
X-Google-Smtp-Source: ABdhPJzCyqqbJ0fLENrLdD2inMt+L/aVmUnwh3pjMnEOpHZnq9ItloQaMpUl9jO+FZaixqXQwoYl5EGJnq99Ir3WZS8=
X-Received: by 2002:a05:6830:3106:: with SMTP id b6mr9764275ots.36.1608503575173;
 Sun, 20 Dec 2020 14:32:55 -0800 (PST)
MIME-Version: 1.0
Reply-To: afringawa@gmail.com
Sender: hassan.ahmed8@gmail.com
Received: by 2002:a05:6830:1412:0:0:0:0 with HTTP; Sun, 20 Dec 2020 14:32:54
 -0800 (PST)
From:   Afrin Gawa <afringawa6@gmail.com>
Date:   Sun, 20 Dec 2020 22:32:54 +0000
X-Google-Sender-Auth: IcUQMzcn2-FM9CYxufzulwQDJtc
Message-ID: <CAD8nQ4_UsDk+UPrDgNqez-sJDvXJ-qzPd5g+_8zvMMzhqYGa7Q@mail.gmail.com>
Subject: Please respond urgently
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Greetings,

I know that this mail will come to you as a surprise as we have never
met before, but need not to worry as I am contacting you independently
of my investigation and no one is informed of this communication. I
need your urgent assistance in transferring the sum of $11,300,000.00
USD immediately to your private account.The money has been here in our
Bank lying dormant for years now without anybody coming for the claim
of it.

I want to release the money to you as the relative to our deceased
customer (the account owner) who died along with his supposed NEXT OF
KIN since 16th October 2005. The Banking laws here does not allow such
money to stay more than 16 years, because the money will be recalled
to the Bank treasury account as an unclaimed fund.

By indicating your interest I will send you the full details on how
the business will be executed.

Please respond urgently and delete if you are not interested.

Best Regards,
Mr. Afrin Gawa
