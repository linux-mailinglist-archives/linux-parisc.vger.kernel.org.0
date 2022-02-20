Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 555384BCEC9
	for <lists+linux-parisc@lfdr.de>; Sun, 20 Feb 2022 14:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242304AbiBTNxf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 20 Feb 2022 08:53:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbiBTNxf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 20 Feb 2022 08:53:35 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98E338BA
        for <linux-parisc@vger.kernel.org>; Sun, 20 Feb 2022 05:53:13 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id q198-20020a1ca7cf000000b0037bb52545c6so11873839wme.1
        for <linux-parisc@vger.kernel.org>; Sun, 20 Feb 2022 05:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=T28r8IcApmahqshNb89Vq7Sss5daNXvHX2RvLjpVFBs=;
        b=SlCKWKod69KAmcIjiPEVjviPJa1v/IABUNXqexLWMmpJBQroZycp7zHnSEnKuUfLwX
         jSbWNMyJ9tsuw/WAkgYV4Yc+3bYY2qlNt/uCk0gqmLV/w0P4PEvwHjXAao450/hkGyOZ
         SnRNJ/edGWdlv56qO2BsLpqM+GMVeDqONnd6eimMl39Y6/1Vk1GT6uyAQTx7CJgm2KSS
         mheM/+nyUUkDv4Ib1AHHuzqutl2197cDkMmEGXc6O9DysaFGRu6KePXl4D2npABPVeiQ
         DAYURB3lzkqDVPVQQls+MluVDR1T/QbnGDhq1s1PelaR01BlIYOx3jt/WGXhP14UEDgA
         MjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=T28r8IcApmahqshNb89Vq7Sss5daNXvHX2RvLjpVFBs=;
        b=0K2u2k3KZR6HK/bti957440sd6HR9jiGy/Xudyq0vuIr+doDAjGIo2njC9bd13uIQj
         wf9bSoaDtTcXIwXXLOJhTxK4zXX5QU55WwgZCMSmEiaszIJ/vJb38m2IZ58itMWlamyt
         bev8Qr7SYsF/tLChWNE6QB7l8/S8vWIdFanXncNbQtKWELvZaAfUmxFG6NuXf9NO0O4t
         m+CX8svmV5xt5YrlYHppHE+EdQl33TE/dmYvpcCRuq7bLUTfcWhF9CeETyPdNjFDoKzv
         09uB5GlDGgu78c7hPWYmIumwtdeiBrWl/rKyq/+OCZHgNmf6opTelNWgAydp199RcRsg
         /3xQ==
X-Gm-Message-State: AOAM532rBcO/O0n9Eh/eQFuTXMHhs5xregmWIhXDCZDxdoHLqqhKlpro
        XOFqHxN5SEuQCO5QgaXCR78=
X-Google-Smtp-Source: ABdhPJxujwGGsTjHW60RvqjoWjL30taheu8STR+QGS+I9psA1fHDIMa5o68+nMUGLekW/MFKwPSjrw==
X-Received: by 2002:a05:600c:14d5:b0:37c:2f5d:a396 with SMTP id i21-20020a05600c14d500b0037c2f5da396mr17344921wmh.77.1645365192423;
        Sun, 20 Feb 2022 05:53:12 -0800 (PST)
Received: from [192.168.0.133] ([5.193.8.34])
        by smtp.gmail.com with ESMTPSA id e10sm13178510wra.103.2022.02.20.05.53.09
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Feb 2022 05:53:11 -0800 (PST)
Message-ID: <621247c7.1c69fb81.16d6d.0816@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <verahollinkv6@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <Mrs@vger.kernel.org>
Date:   Sun, 20 Feb 2022 17:53:05 +0400
Reply-To: mariaeisaeth001@gmail.com
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,TO_MALFORMED,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hallo, =


Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, die restlichen 25% dieses Ja=
hr 2022 an Einzelpersonen zu verschenken. Ich habe mich entschlossen, Ihnen=
 1.500.000,00 Euro zu spenden. Wenn Sie an meiner Spende interessiert sind,=
 kontaktieren Sie mich bitte f=FCr weitere Informationen.

Sie k=F6nnen auch =FCber den folgenden Link mehr =FCber mich lesen
https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
E-Mail: mariaeisaeth001@gmail.com
