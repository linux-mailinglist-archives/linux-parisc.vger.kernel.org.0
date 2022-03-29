Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC7F4EB5CB
	for <lists+linux-parisc@lfdr.de>; Wed, 30 Mar 2022 00:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236683AbiC2WVO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 29 Mar 2022 18:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236569AbiC2WVH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Mar 2022 18:21:07 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB73043395;
        Tue, 29 Mar 2022 15:19:23 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i4so7930006wrb.5;
        Tue, 29 Mar 2022 15:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=EI+WksCmVbRC/2kaUpDV4lImggCdl7hTG6lnDop5/l6Kc9iY6C4MKDJj/QS3/l7l99
         z6S2Dq4S04clTtMENKOXoINFp+eIVysNjKNNbnMOTf9hEPi1Ig9Kd8Bm2ZNnqfZNgZgI
         1gd2S/nMz7HLcTIz9IpLdbKKmQswv3a52kSESsbirj0Gs3+A+S2XhlE9C2A+AlHNVMNe
         Q+XGvt5635W8umVbOO9Wi0/xQsAmRCcH8iztu9CFT80wVuPXU/x5qir0d7vsoJf2MgsE
         GOcginJhIyJt9R11H7ZS1D91Vj8ALUWZkoGR60K/2hM2DTPnosbjqE6pjiWj/w9c/MzU
         nhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=hmhtMS6wGkwFYl3eqAjI1maU/iG2O5USpxqWFrvCQg0QF9MVxyusN10eyk3dHrC88R
         xdvagg5tEwbS2v0U6/hehFyYMI8oV48Jc/xZBSDdYCz3pKkUkgbT94hRDQgzRyrP/PfJ
         Vw9GoyWNsq1LefrmziezHNJ5cJeC0fY02fQ8g8+vX9G+HmwSk41BJzj8jVJ+p/AypFTA
         lPEUEVmVLwwaAz914B6iMXHlVyyOHbNlBS2De9W2HA2X6I7Bvtxg8swOfleUe+F2K7c3
         hH+Il5BZd40CSiQss8rAhJDgAir76Xes4ntdcbOqLT0S5ioROUwn3j4/m7L6hun4e0TJ
         papw==
X-Gm-Message-State: AOAM532k338wmQQYodoM/tv48m3gPrT2QyleV5pHvoiOrFUQZxowmxhv
        F+t7fwKUY6Ah5aU8oXkIaYY=
X-Google-Smtp-Source: ABdhPJzWpksgtbEr5QfXaQr88KyAkZFlEluaDdLac2gSTsfoF23Sff1aDHwgkak9pSTR7wqJ0Y/vOw==
X-Received: by 2002:a5d:4205:0:b0:205:7acf:d111 with SMTP id n5-20020a5d4205000000b002057acfd111mr34074731wrq.444.1648592362494;
        Tue, 29 Mar 2022 15:19:22 -0700 (PDT)
Received: from [172.20.10.4] ([197.210.71.189])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d6b43000000b001e317fb86ecsm15642619wrw.57.2022.03.29.15.19.15
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:19:20 -0700 (PDT)
Message-ID: <624385e8.1c69fb81.af85d.d5ce@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:19:07 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
