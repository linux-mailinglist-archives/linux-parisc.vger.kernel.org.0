Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB4F65E8B1A
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Sep 2022 11:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiIXJrt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 24 Sep 2022 05:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbiIXJrs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 24 Sep 2022 05:47:48 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C89B1288A1
        for <linux-parisc@vger.kernel.org>; Sat, 24 Sep 2022 02:47:47 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d11so2178299pll.8
        for <linux-parisc@vger.kernel.org>; Sat, 24 Sep 2022 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=3+pOaDQW9YjxLklfVNTeyrUxpQCI7rQ2FY27kMcvVNA=;
        b=HB9MKYQSVCpN/uOYAgHtfTu8vX+gh120MEMg6y8EIcdyz09xYzp2JSduLy24Dvszy4
         1P6BsSMu2mOvfjkp7zHTUtONSi2wbDo6M1uy9AKuN43KZoUA4/EqJvSPJHoKE8piFuiq
         TFDPTQqsUqfRalbN7HFLyt9F8n9Jwf+Qj+abU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=3+pOaDQW9YjxLklfVNTeyrUxpQCI7rQ2FY27kMcvVNA=;
        b=mqnWv6d3WvLJi/wmv6+JL79/5lVPzgvxtzCCX7Gw1eXwKUBzS2UMdFWKvWp7URinN+
         BRn6sunIY7iD2tfqfEdBBBopIO+Rlc8iiWPVdWl+zGAPewQOvsysrGMlXwmXCOW7Aaf+
         PBYINHBGYG8+WNYxLSYh/BxkRl3qEiP9k1K8p/E2PaLavH2pOMr2u8NivQeKlSJjsC3I
         tf4RqYCrBbxazHiyOgaMtTDmnQ8stl6M/8L62zcCpRbiY2rZ2lUZZr8NnX7KRRdoDfHw
         mwfeV/AHnEu9y3V35lTVeaxXdpKeQ34739bhcoXoXdUQOyZJWl2iHTZgtPmkiJa6loFZ
         zJZw==
X-Gm-Message-State: ACrzQf1NrD8IhTatQXeGhnEIhHIS0cKkbjIpU7W2Z9Lnj4UiUtgPHRqQ
        4ChO6UBlcn3JytYyfQSWEXdFAvoDPzasXA==
X-Google-Smtp-Source: AMsMyM50G4MkB+jPSoG0HzIFo+yOu3RUvfrllcNX4ltgLcfVL+PMcHqel4EXpC55kA3rQFQuMU8DdQ==
X-Received: by 2002:a17:90a:fe0a:b0:203:467b:9e64 with SMTP id ck10-20020a17090afe0a00b00203467b9e64mr14759009pjb.146.1664012866953;
        Sat, 24 Sep 2022 02:47:46 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:f4de:2419:efa3:8fed])
        by smtp.gmail.com with ESMTPSA id y23-20020aa78f37000000b0053e61633057sm7899715pfr.132.2022.09.24.02.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:47:46 -0700 (PDT)
Date:   Sat, 24 Sep 2022 18:47:38 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Sven Schnelle <svens@stackframe.org>,
        John David Anglin <dave.anglin@bell.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        linux-parisc@vger.kernel.org,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
        Aaron Tomlin <atomlin@redhat.com>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH printk 00/18] preparation for threaded/atomic printing
Message-ID: <Yy7SOp9wKWdDnbLM@google.com>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924000454.3319186-1-john.ogness@linutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On (22/09/24 02:10), John Ogness wrote:
> 
>    Patches  6 - 12:  Locking and list conversion
> 

A quick question: I wonder why xenfb_make_preferred_console() isn't
converted to list lock and for_each_registered_console()?
