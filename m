Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4175F5FF675
	for <lists+linux-parisc@lfdr.de>; Sat, 15 Oct 2022 00:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiJNW4D (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 14 Oct 2022 18:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJNW4C (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 14 Oct 2022 18:56:02 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0798C63850
        for <linux-parisc@vger.kernel.org>; Fri, 14 Oct 2022 15:55:59 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id h185so5520463pgc.10
        for <linux-parisc@vger.kernel.org>; Fri, 14 Oct 2022 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RHi4HpCHLZwzmmVvLyoysEi/wEu4tLve7AUDKL5ilC8=;
        b=TfDcFRxoh9JSWdkgsluQPfc445gYvwHsYt5Zprm5b/xnRRFf7WIG1yIKVO/urwJaQe
         XrJvKsMSxt3JvwSaecDb9OScGAt7js3FyJM+cl0jalhf9a6+KIy1TmutAwPU0VRV+JyZ
         tZz8WYSX1F6WdbhexdpZPCC1Rnd2Y44Z6Wd4a+DtMeJf0ciWkWKTrSpf4vW1LIRn1zEr
         EgsHmKWD5wcgXLbYwM71UrjZ8oeY3EvqPIjruk3A1nbHwxdbseICvJHkIBWnGufoCMUf
         Ecq3JK+nclHnsTh93hhoBN9EPRndSqRSgP5UA+gOrKsVotC1DPqb2wWGV5PVnmZdMt3I
         FxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHi4HpCHLZwzmmVvLyoysEi/wEu4tLve7AUDKL5ilC8=;
        b=m/HfsWSCCTkr6xvekCt6lI1q5ct1Ggp3Zm8qZ2xgceVl0ccETZuzMQxggFlLfe5+w7
         Y0q9oKcAtdTu9vBun2LNcf39cE5bmeydkPW4lVRVPW0qJ0d79JZ1LSKMm/KvMwwoFARm
         DuzHSwcNLkkSwUYhhYrQwqJHmAESbw9WTsQOUdunnbgK5Sweg9/WyiCUDG6qO613SqFT
         WjT1h2x/viLgJlxS8U9VeBJDbHlO24Zcc5H7kYaQhct82u7yhhIqgbHHleyvEy6fduLF
         8nsgpytgawqVhuZcfcmgjRSo4LwxMyXrLtVU/NmtHUQbHQr0umrSf2Olb/dIsi9xdAxK
         GTaA==
X-Gm-Message-State: ACrzQf2RFA27J92yCnTlmm0DmTFVZi5ck0MZl0YJCBN0ivTVrugGXmMo
        VniALrxtiso9XUANKEdieg7ts2s6bcGvuBpovzh5rrRYxdk=
X-Google-Smtp-Source: AMsMyM57NVR+Ef0sHZvHcjtWOeZ1z+6TfoejunFXJgizb6UKuxBGAf7JuPVffakqpcCMSV9pihbZnQ09SfgJLUY1XIs=
X-Received: by 2002:a63:2215:0:b0:43b:e00f:7c7b with SMTP id
 i21-20020a632215000000b0043be00f7c7bmr111875pgi.511.1665788159380; Fri, 14
 Oct 2022 15:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <Y0mwJrtT+XyXAjQS@p100>
In-Reply-To: <Y0mwJrtT+XyXAjQS@p100>
From:   Matt Turner <mattst88@gmail.com>
Date:   Fri, 14 Oct 2022 18:55:46 -0400
Message-ID: <CAEdQ38FKzAPjJpJikaiE6UuwuVf-MgKBT4oU7GeuUQP4RPoaJg@mail.gmail.com>
Subject: Re: [PATCH] parisc: fbdev/stifb: Align graphics memory size to 4MB
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Oct 14, 2022 at 3:14 PM Helge Deller <deller@gmx.de> wrote:
>
> Independend of the current graphics resolution, adjust the reported

Typo: independent
