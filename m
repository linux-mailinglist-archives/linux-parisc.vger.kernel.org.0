Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17DAE21ADD
	for <lists+linux-parisc@lfdr.de>; Fri, 17 May 2019 17:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbfEQPna (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 17 May 2019 11:43:30 -0400
Received: from mail-yb1-f177.google.com ([209.85.219.177]:41230 "EHLO
        mail-yb1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728958AbfEQPna (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 17 May 2019 11:43:30 -0400
Received: by mail-yb1-f177.google.com with SMTP id a13so2798760ybl.8
        for <linux-parisc@vger.kernel.org>; Fri, 17 May 2019 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=XkbfkMjcgOG43BBdT90bEQgkhSPdX2XDKrJO7UhLrcc=;
        b=krBPX81hkF632s+Q7RQUDj7OEipfNAoUavDRKLRhXnQ9X+jVQtKOLEK8lSrotL407A
         SM6y9Fx6ecN/Ud3y5GK4dslZufUWwDuCF4MSwqwVGqcAbCZNxuadHH+j82Uo5uPWZpyX
         KCe1qnzr6QG65OwJKpCaokJjV0SLzSe/UNOc9wFcXUiP2vuB74w+ns6yMmMAFr8bY9Qo
         FySETr+iQZkuYmh+bZtlJM1zOLvRgAlyVgGdMD+lV30b9ZpVa+gkAC3btr2circVr9Rv
         dSw98efFmsiya7DfocRC9W66zs+wSM3tRGxt0Ch/IQakJoYiiQZXJK/n6kWn/QAfIbri
         DWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=XkbfkMjcgOG43BBdT90bEQgkhSPdX2XDKrJO7UhLrcc=;
        b=J+x89fi9R8lwzpEM3/x/OyB7LvmJnbCTxYIXDh097T3jZfaw5SAAe6ZrWOke+9FVgL
         QXtgmsMOYyTAgN5WYtoYhuXAvCj6kteRLSF8wA/xFoNlskbsXCm6s7bOb7WGeJPxqJZ4
         zDPbNQBBPwwi4cC4InxvZOkZNrebISmoJjAltdLUkD1sA0o6yPTwzPBQztdUoTX//OYU
         GvtCylrk1mZbpuys0PxLKuPb8DY8ueIKnrL4bPbtXGTxX2JIykX1tNacOa05rpLNbdFI
         04uNlLduLDzC6fWdjQ97z9Oz3DGy5cJ1C/U6B8AAizNlVeUbJeayvXSocYbCMf67O2Fz
         oslA==
X-Gm-Message-State: APjAAAUqKvISSkJevX14u2LUp2fx7yD9biup69AC1FHKOOe6SZFbaLg3
        CWZikloWfkbaZdcKxNjXawU3os5zjoUfzJL+L9oXwM5U
X-Google-Smtp-Source: APXvYqyGLMyceKcHX/kflYGKdWvOaHQjfXNFN9H5E4Z6PEQaGnc6sFeHclg55QCFo6JFau0MO/H+GKatfDMSCQkDKgg=
X-Received: by 2002:a25:1dd5:: with SMTP id d204mr4905087ybd.34.1558107809035;
 Fri, 17 May 2019 08:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net> <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net> <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
 <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net> <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
 <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net> <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
 <20190514130151.GA530@t470p.stackframe.org> <922dc8c9-f401-ed07-ce83-a534fecefb04@bell.net>
In-Reply-To: <922dc8c9-f401-ed07-ce83-a534fecefb04@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Fri, 17 May 2019 17:43:23 +0200
Message-ID: <CA+QBN9Did5PqWkp3rcCN15n+dFd11jqCe+L2q33sTr2d6Ow15g@mail.gmail.com>
Subject: Re: C3600, sata controller
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

guys, new tests(1) with SYBA-SY-PCX40009 on C3600
tested on different slots: it always fails with the same behavior

I really do not understand the random failure, because it seems
working for a while, and then, it suddenly fails I don't know how to
investigate.

(1)
http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&t=337&p=1663
