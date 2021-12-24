Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3545347F111
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Dec 2021 21:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbhLXUYu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 Dec 2021 15:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhLXUYt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 Dec 2021 15:24:49 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D58FC061401
        for <linux-parisc@vger.kernel.org>; Fri, 24 Dec 2021 12:24:49 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a9so19182404wrr.8
        for <linux-parisc@vger.kernel.org>; Fri, 24 Dec 2021 12:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=UtoF0r4yG8U/T8UOLxn8dacSd49m7zi2Qvhr7fGOaoo=;
        b=SrmxqTOoj/o9RqmbB+s3HefXWIgdxMq3xNHu7WB6sKhpJUSwwXaMFL2C6Fz9UyJ54o
         KjiAaQ3oC/XRtvKkfJ9Vi5tORLNafRcjyqOQxRR+WP8D0VixMO2RyUT83LNZslqV0+8A
         l5DySS88F4ySdI4KH9vrLBMPaSINp3LIq+k7fqXdHj0Yvd6jxXHkZThSFzm9tknQsogB
         5zQO1XfaY/4WE+9hBoaaXlIuDBLo4zmiqxCtY99XM3K6Zu//BJWIRsH469QWdXxwFJuX
         MBuIjH+QAEp4YpGVyyKrbtPyCFyUpB4kBowxMVvRyUtPvA99lptHQA5u07dq4Nm0IP6E
         Jdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=UtoF0r4yG8U/T8UOLxn8dacSd49m7zi2Qvhr7fGOaoo=;
        b=tqjzizqiz9a0sHM2VPDUeBG7Vwkvyq3Y9ivYmpgMkJDu2B+8bB+X8/6Mw8MWyw0aGk
         0hHWjU8QJ4hblicbo45ZThILCRVpicZ0XF6Q0POzY1sW7ikb08OqJ7BFf13MqCWhSbae
         ZD+udYU0jyrl1w6tWRxrUAlcL7JlfJ9aQD2ztf7CtLA2M/L6d4bOpYB3qw6cxnp5cH7l
         2yFcJ2DsoeA/uNKHBD6oTUS1Jc01pr+3FzRq+uJYU04aGYu+i1IhZmoKSDxx/AulYanY
         Vbct5HnKew7HtBA8VsITCSPEg7ZNmj1ML0lsawmq5NqFer0hm3gdNj8uo8/0pjS/sUt7
         x7Yg==
X-Gm-Message-State: AOAM532ldQUyZXG3KiJsAHWb834qgVjW6gFJwP6La3YCF32nzE//f22P
        W3pV7ItDdNxH4KRPG/eXvuc=
X-Google-Smtp-Source: ABdhPJwdZOrTT4l3SpZlOgyftlPsRANqFYZkhLBhdd3b/S8TBYOgYL5dAXw7zR0W9Ip6fCahRUN0jw==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr5288658wrq.50.1640377488069;
        Fri, 24 Dec 2021 12:24:48 -0800 (PST)
Received: from [192.168.9.102] ([197.211.59.108])
        by smtp.gmail.com with ESMTPSA id b2sm10268875wrd.35.2021.12.24.12.24.43
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Dec 2021 12:24:47 -0800 (PST)
Message-ID: <61c62c8f.1c69fb81.4858a.f1cc@mx.google.com>
From:   Margaret Leung KO May-yee <yusufyaumuhammad@gmail.com>
X-Google-Original-From: Margaret Leung KO May-yee
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?Gesch=C3=A4ftsvorschlag?=
To:     Recipients <Margaret@vger.kernel.org>
Date:   Fri, 24 Dec 2021 21:24:39 +0100
Reply-To: la67737777@gmail.com
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Bin Frau Margaret Leung Ich habe einen Gesch=E4ftsvorschlag f=FCr Sie, erre=
ichen Sie mich unter: la67737777@gmail.com

Margaret Leung
Managing Director of Chong Hing Bank
