Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602164BCED5
	for <lists+linux-parisc@lfdr.de>; Sun, 20 Feb 2022 14:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244012AbiBTN4l (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 20 Feb 2022 08:56:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244011AbiBTN4j (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 20 Feb 2022 08:56:39 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2D73206B
        for <linux-parisc@vger.kernel.org>; Sun, 20 Feb 2022 05:56:18 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so7240639wmb.1
        for <linux-parisc@vger.kernel.org>; Sun, 20 Feb 2022 05:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=T28r8IcApmahqshNb89Vq7Sss5daNXvHX2RvLjpVFBs=;
        b=IWfNhHqriNFgl0b4N/jl74kzBi19GJJGPxQETTb+phnbpAM5cosb6sRWWnQPl8Ox6V
         hWpvTQ98kczed2cuWQvO/oXB+NLrU+YDZJYrI3dbHg66Rgef/R4CvcuayNcSbL2k62jM
         mvNhDKl/KmHM3zPTeRcE5vncx4630TBBSqK0Q2mpvQql0SOyjT8OUyI2VLCpi3FQK+7Q
         17nB3Fi1P/2oDKtwSEUMWdtHNIPB5mRks+t5VdjVTfLDUCgXHXm5993ncz5Y2QW1/oFT
         jNxZ8ksSZq/xQkEVqnFGEFPI3p+b/mz2RnXjUfU/3fiyX7oO5rfid+aF2Xoz06t7iUz1
         FiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=T28r8IcApmahqshNb89Vq7Sss5daNXvHX2RvLjpVFBs=;
        b=S9AamODoVgHoesJP4PjubYQTfWf2IHrcJEq6f/svxyYEFfOLMolrQ6y3v5idCV/eFV
         pQwLI0zfbKsTPgoSZp8RP4XvoJ8+RkRJ2NX72upFb5gHy38CeBXs0T9IiGN1FwDvil7T
         UIzJbg+9ReuJwGoAbdX+lL0phX9IsuD9FxOsUk5+OvnRj855Ka9YHVh320+Fti7q5D82
         LVEj5p5h1Q9mGyDGUFSj9V+kxoJEt2wl2dzGqWC2G4qjK1LuP8+0lzIzZPMrlz7tEqND
         7IXBHbroqyRxt4DYRskrgsOTLjWGEgqfVnFVd93Ci23fjHAwKlIeLCxui3jOR9RSLwLN
         ubPQ==
X-Gm-Message-State: AOAM5331BmHlFaOEt0rU67Y5wXLodwvynMYcXATDjRHpg/+MmcDjpS1T
        3GpEj8DnzN/X/Owv+nQekbs=
X-Google-Smtp-Source: ABdhPJwOPMVfeY1aoafGEo7Q+M9o28Yj6/b4jEfIdKXxkerSq0vYXOpO8Vw2vZfESni3sv/ckuSDUA==
X-Received: by 2002:a7b:cb46:0:b0:37b:dd79:e1c4 with SMTP id v6-20020a7bcb46000000b0037bdd79e1c4mr14467556wmj.39.1645365376588;
        Sun, 20 Feb 2022 05:56:16 -0800 (PST)
Received: from [192.168.0.133] ([5.193.8.34])
        by smtp.gmail.com with ESMTPSA id m12-20020a7bce0c000000b0037bed2a6fbfsm4778100wmc.37.2022.02.20.05.56.13
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Feb 2022 05:56:16 -0800 (PST)
Message-ID: <62124880.1c69fb81.865a6.0117@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <verahollinkv6@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <Mrs@vger.kernel.org>
Date:   Sun, 20 Feb 2022 17:56:09 +0400
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
