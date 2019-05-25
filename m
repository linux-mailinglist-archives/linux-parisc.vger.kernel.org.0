Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E982A687
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 20:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbfEYSan (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 14:30:43 -0400
Received: from mail-yw1-f46.google.com ([209.85.161.46]:37606 "EHLO
        mail-yw1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfEYSan (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 14:30:43 -0400
Received: by mail-yw1-f46.google.com with SMTP id 186so4984497ywo.4
        for <linux-parisc@vger.kernel.org>; Sat, 25 May 2019 11:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fwCT9SvPCEzzuSZDeRTMlJ0ckLlZU6u2X4HcvnAs6JI=;
        b=lVkGUGygKocSUxRAv2hs/xgtiBXimUGE4QLyNIxW6xVrQBQL94e7/aIbmFQhAoxCwp
         XH5k25XSBSD8rkFaNrsxSFzw2hNXllJdVbbI9amqOy4Alpp0/UI6SldJqwwca7uVDlZm
         cijQaqZs9qukW4n5jv5/RGiAZzpclRpuPr/bkRth5qwr5Wf7kaxVeGyAlVABcS9LMQbR
         Rj6YghjeHsgeqKN3733H4lEjcq9pSVjmsPvg+8MW0XRO4JiqDh5rnPA3qilJCYxHnaDs
         eSzzNfDTB+tXn/0b1bZc2AwlmtznthHaacg4ipYIcRL3Pm+4pFrkpJUrSGXd3zisPCQR
         P7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fwCT9SvPCEzzuSZDeRTMlJ0ckLlZU6u2X4HcvnAs6JI=;
        b=YaDhnH7HbAlwY0Mn4PWRRUOkQkfLxD+dYfWT+b9tClFgLIB/wOVuEHdamCLMDx6OPn
         v5C+h1ye1BNPAUDa7y3k02m8eUADN4MHkzXFYxw0mX4frQ3UMiUtPlbEs2slMiTOXyBe
         +/dSAS2bR/qtOhH0pRT/H0z+3uzDjaktXQJM9JFt5P0H70vPJVUew9g1tF4qoN7nAY4J
         HTn7IqBRvsdo7Ns32uZ4tPtc3fG6V2tub7OBukMiOraFJqOk22pxHIf5iiCOmvvMX7VW
         7T+fgxHz2a5dht3xVdNO9Rp5gG3KpTfED6x9b+lT+1PofbwLvE06YcINmHuFTu6AgUww
         uwNQ==
X-Gm-Message-State: APjAAAXEa2Yrf52sj9SCeKJSEe42PYfmOfN1XEjtBQE7fnBJQ/dmLTZj
        uGt6NmhLnCH8JQ1FLSKlu0luQ8dB2Nwcc2d7RDg=
X-Google-Smtp-Source: APXvYqyyTrS7SwgEdHnuqDPW6aA3I+Y/UBdlNrGg8hl/BZ6jJX4080iXg3/N+H2+4YXWbAghK3E/fCdM3hw99UbnH2Q=
X-Received: by 2002:a0d:dfd7:: with SMTP id i206mr51037539ywe.256.1558809042833;
 Sat, 25 May 2019 11:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org> <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
 <9aa6caf2-c9d0-8bbb-8f62-dc1becea841d@bell.net> <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
 <CA+QBN9A9jw-QsZXcDHUMZU03TY_m5=kfcmVhpUNyv-y3xy2Heg@mail.gmail.com>
 <55e937b6-a95e-d6e4-ef30-f9040f4daafd@bell.net> <20190525181304.GA5637@t470p.stackframe.org>
In-Reply-To: <20190525181304.GA5637@t470p.stackframe.org>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sat, 25 May 2019 20:30:37 +0200
Message-ID: <CA+QBN9DKvdJ+B82-O+xexH4URwMr=z0kXQnSjMjwnZ1XoBED7Q@mail.gmail.com>
Subject: Re: HPPA problems with the PCI
To:     Sven Schnelle <svens@stackframe.org>
Cc:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>,
        Grant Grundler <grantgrundler@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> It's also set on my C3750, but not on my J5000 (PDC FW 5.0):

maybe it's related to the firmware version?
