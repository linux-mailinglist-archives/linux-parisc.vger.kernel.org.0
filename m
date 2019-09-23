Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B554BB262
	for <lists+linux-parisc@lfdr.de>; Mon, 23 Sep 2019 12:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729716AbfIWKn1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 23 Sep 2019 06:43:27 -0400
Received: from mail-yw1-f51.google.com ([209.85.161.51]:45421 "EHLO
        mail-yw1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729662AbfIWKn0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 23 Sep 2019 06:43:26 -0400
Received: by mail-yw1-f51.google.com with SMTP id x82so4959165ywd.12
        for <linux-parisc@vger.kernel.org>; Mon, 23 Sep 2019 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=bgfikG9k/IfJviqDM4OjqHQwEltltBCXQs2gU6b2qws=;
        b=UcuaChJDlp6brk8uUWwKaTfheRT0ZZg2Wj362MbR+pPQijZF/UiPPPWLEeo/mjamnT
         uxxSa1xWZtoZ6LuDAcGSevvmOXmNQyLK5F3n/OBYtm81MZKu/1HE01IOa0A4bZBfr24+
         Ii2/j1DngiiBEmhERonvSZsvoy5lp0SP4L9i07BXR4kJPzay6NLLjt624qgCYmheJzVc
         wSpJtsJoTJL6+hvo2tpqqrJS0Q8kpoUVEM6/yqwatlYeL32EtEjjW5AOqxjB7FUezfGt
         P3Z/ahIt4pcW1lnAK9O5qnT5z4fHREnP+VBP3E0mPklTZr7m77d9J7FjHFziqLHc8Pno
         gZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=bgfikG9k/IfJviqDM4OjqHQwEltltBCXQs2gU6b2qws=;
        b=S+VnH7c+765Y5uDbWdi/ypRdfykv2i6tfvj57+Q8WR9NqCyT9QVlTUIpdjJpPcDvAH
         OgTGp81jDwMskcFJd6Deh1gxpluyyvxtgsEknhKIiDBTT1vDBmalRGBY1wdqXUbyZBzw
         0JTWOtfjEUiIXaPyhHK3OTesOwyDfi50+BSYunPbzF8s7JWyS85TvU3AX+O3VkAUEJMS
         aDb5TwB4xQwK4ViYL+leLxx1IOWxoHmiQCIqwH+9nW7u4xDHTgm51egBoP8wpt6IIF38
         X87ok+eT/6XPTwxTn7ced2VO9JtwlOaPpmblCmZ9jma0MHzvn9FbphyKz/5kOzbiaNlR
         ZmnA==
X-Gm-Message-State: APjAAAUCxA9HfTDejOPDbC+FVyBOFjp7uFRzorcUrAZARrPjCN77hPJ1
        8Oi2i+4bdDMGYyY5CkxnMyQoa4ASS0NrJEjuiUnIzscJ8qo=
X-Google-Smtp-Source: APXvYqzf6qIE82kHWlNJu/Ar18I9x/XRRk6HJ/3XJHE6DGvBhi8QoXUYm8ZzwGGnabNWqMIrJhGrghjp1aHRQmikXNY=
X-Received: by 2002:a81:4702:: with SMTP id u2mr23381134ywa.53.1569235404579;
 Mon, 23 Sep 2019 03:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAK-9enMxA68mRYFG=2zD02guvCqe-aa3NO0YZuJcTdBWn5MPqg@mail.gmail.com>
 <20190917212844.GJ9591@lunn.ch> <CAK-9enOx8xt_+t6-rpCGEL0j-HJGm=sFXYq9-pgHQ26AwrGm5Q@mail.gmail.com>
 <df0f961d-2d53-63e3-8087-6f0b09e14317@bell.net> <f71e9773-5cfb-f20b-956f-d98b11a5d4a7@gmx.de>
In-Reply-To: <f71e9773-5cfb-f20b-956f-d98b11a5d4a7@gmx.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Mon, 23 Sep 2019 12:43:07 +0200
Message-ID: <CA+QBN9BepXXQKksDXBn3MpRdzSq3Aq=XzTwDh_F+vVjTvnFpBg@mail.gmail.com>
Subject: C8000, which is the max MTU of the built-in net card?
To:     linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

hi guys
for a special application, I need jumbo frames enabled in the network card.
I have just checked, and C3600 only allows 1500 MTU.

cat /sys/class/net/eth0/mtu
1500

I need 2000 MTU, 4000 MTU, 7000 MTU, or 9000 MTU

can someone check the max MTU capability of the built-in lan on a C8000?

ip link set eth0 mtu 1500

if you have "iproute2" installed, the above is an alternative command
to set the MTU, but it only works if the hardware does support it.

thanks =)
