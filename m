Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691E5599DDE
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Aug 2022 16:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349236AbiHSO4E (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Aug 2022 10:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348695AbiHSO4D (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Aug 2022 10:56:03 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C5BF243D
        for <linux-parisc@vger.kernel.org>; Fri, 19 Aug 2022 07:56:02 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id n4so5452489wrp.10
        for <linux-parisc@vger.kernel.org>; Fri, 19 Aug 2022 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=tPcog03lOMlmDYTA/VZmxZ5X+gfPzW5wt/APF98WRZ4=;
        b=hzJdGAR/18inJqXDz/+gYiYF6bfYxUd1lkG9ckp+zQ91FGkGdorLjl3JXVO4QxG1cb
         JoyJRly/DbBvuIXOFgtM3FRH7zfGn3OggzMSGbPsXHsStz7LU2ouHuviKIy6g+GxMWzM
         fXf0R1r/eWMYwSStWBV8uaknxImeXEnlQ3yiO0aIalIBNLBcAonZrYjzkTlOPqTjwajl
         B3ygVDZGqIahx2ZlN78nKqnVTF2TGjp4qOUsAd3VutI4zEK2XdZtRrHIzkLWSe9NsM4T
         6nYgf3xv40HT9mR6Ltzs5JtepLZdb5NeyIK8OB9SGhTMEryMvW31FW7ceiUdAjOm0C0L
         paHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=tPcog03lOMlmDYTA/VZmxZ5X+gfPzW5wt/APF98WRZ4=;
        b=fHja55FWy3a1tYcOW3sKSFgV20UP8JjzcR3GV8Qa8VmWPqfzUeoWK6/XY0gRrTTD7x
         IsmnLlO1OzWenUiXDGGNot5aBYcP2gs/eTfDZhW/n3GO2Pk2TFgczUi7zpJiYLEWvqKT
         BErg9JZeyoy1FA0nYKQVHh30HiWxJmroWOZnMMuL7QdIYU86L6r1dChE4YA8TvazH2iu
         YgyZCU3Eds/iHAtbdGp2NU4Zfpa/9wPN+bdikTLUWpkocor+tWPwwTEjv1QlqETx4mwm
         agb7LyFZON5lsT5WPR3GU1XvgdeZOE7HpLQmJw5kXfy4FWvDTr1ATxyQdTxHH90n4sbf
         jCtg==
X-Gm-Message-State: ACgBeo3iNKiktQXZC3EiT333+d9NBQvzaVNg7qvuhgRf33Fik59B6hlZ
        sqETEku1umbR3BdL00ecjpEC7HiJJwvAzNWDMHE=
X-Google-Smtp-Source: AA6agR62okEkCXseU9qFZg0M9vQpSwtNiQI7783Hevk3Otd9DmdppwtRm4I6r4wWvkcAXxN88L3IN2fkviFgI1ORYDM=
X-Received: by 2002:adf:f2c1:0:b0:223:a7d2:4283 with SMTP id
 d1-20020adff2c1000000b00223a7d24283mr4283942wrp.485.1660920960582; Fri, 19
 Aug 2022 07:56:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:600c:228f:0:0:0:0 with HTTP; Fri, 19 Aug 2022 07:55:59
 -0700 (PDT)
Reply-To: sj7373313@gmail.com
From:   Sandra Johnson <idrissasouleymane159@gmail.com>
Date:   Fri, 19 Aug 2022 15:55:59 +0100
Message-ID: <CAF+DzuGm9oaHzG6AsfUGKvN0bA3Hwn8_bLCTtd1qQzyUVyG2rw@mail.gmail.com>
Subject: Sandra J
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:436 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4965]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [idrissasouleymane159[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [idrissasouleymane159[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sj7373313[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

HI,
Good day.
Kindly confirm to me if this is your correct email Address and get
back to me for our interest.
Sincerely,
Sandra J
