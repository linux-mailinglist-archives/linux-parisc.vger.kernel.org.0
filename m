Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E319B424FE8
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Oct 2021 11:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240543AbhJGJVG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 7 Oct 2021 05:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240540AbhJGJVF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 7 Oct 2021 05:21:05 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B169DC061746
        for <linux-parisc@vger.kernel.org>; Thu,  7 Oct 2021 02:19:12 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id w11so3462008plz.13
        for <linux-parisc@vger.kernel.org>; Thu, 07 Oct 2021 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=0o38RlNpS0VozaLmVnBjOYFSWWJ631qWJOjGv14SsLg=;
        b=OWes+Oci6ah9UKR314/R2QFfdZ9oErt2FBiQPABaqt6xJ9CxEINwtb0esimvzZ0ESW
         fnaj5WVlGcivjUF9XJ2Bl2oqtHQCTzp152T92BtpXypdfbKW0u6D1eAPBEubruAP3XQB
         sd0egnvLaO6jzdGQypxzVki+aYY2MYWfSc0Mn4ZjZNyYqhl2EUBt+itGqftsX5sr1n4I
         kvaz+5nkngMddXgFiLc8a8quAaOqkyr0xRJoitJaK3TZyRxnrq/Xe4r3ixFSZw5kr2Cs
         lZW7e1etWrFy0iElvs8Kp/TZGljaX5Xbxhcf88kSn/qvzLuX0hIZ/yI+btQcjIzfwZ4k
         Fp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0o38RlNpS0VozaLmVnBjOYFSWWJ631qWJOjGv14SsLg=;
        b=uKUecs7UyVtp3Qb9zNpK+U9DfC/oD9Lo509FAE6kiujTead7pP65CX1K91zhlJSLjH
         QvGbjor8vFj3nRSXjgQUbwTVFHh0hq9Jj2bYaFyjdqMyLUkyD4a9D/I9ly6Z/GtScRuo
         OXu0nIU6PiksphTt6KtlA5vN3GptQGAI9wyw64GW3x4EgXmljF2986lBQYrVSfRA45QT
         GQ+SYqamAARckIDCSchfXaY4xtAz51guOq8UgEa5Z+YifIB8xhlEpJBisCiZ0aVzv4R3
         vTlV8czLzeHmf6pK4fEgfHV8i6TBXuS3Uu8wqZ7+ztBd4PSSvXNDhz8YnEsMEr+dZ9Z1
         wtTA==
X-Gm-Message-State: AOAM530VaZdQUCmmsbBJZJgEb+HghpDs5ZLRaLvUwgJdgDezAa+PDR8t
        rRRLMPfui6ay6qurl4z5EKMDeQRmpzK/sqW5YHctOBl6nDM=
X-Google-Smtp-Source: ABdhPJzZ31ZmpnbN+WNNmwkKZgtMm+ZjpDpBM4EHQncu9PAZ4M+BIWRY6ToSLgbRyB9FQ2Xm0m23WPMZRLrw9cwp4HM=
X-Received: by 2002:a17:90a:191a:: with SMTP id 26mr3623888pjg.79.1633598351940;
 Thu, 07 Oct 2021 02:19:11 -0700 (PDT)
MIME-Version: 1.0
From:   cp <carlojpisani@gmail.com>
Date:   Thu, 7 Oct 2021 11:19:16 +0200
Message-ID: <CA+QBN9AfL0Sa9CxPGQpocSk_b7_Nq3pY+2nxGe19y+2W3w0e8g@mail.gmail.com>
Subject: PCI-to-PCIe
To:     linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

hi
C36xx, C37xx and C8000 have PCI slots.
I wonder if a PCI-to-PCIe(1lane) adapter will work.

StarTech dot com has the "PCI1PEX1" adapter which looks interesting:
- (host side) PCI 32-bit
- (expansion) PCI Express Low-profile
- (host side) 3.3V/5V, 5V tolerant
- 40-60 Euro

I'd like to use it to adapt and test some PCIe sATA controllers, maybe
also some PCIe video cards.

opinions?

I haven't yet understood the problem related to the ATI AGP card that
doesn't correctly operate in acceleration mode. I don't understand
what's wrong with the AGP/PCI.

If someone can explain, "I am all ears" (local expression that means,
I would be very happy to listen and learn)

C.
