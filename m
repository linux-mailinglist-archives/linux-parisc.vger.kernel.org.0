Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D521D1C917
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 14:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfENM6M (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 14 May 2019 08:58:12 -0400
Received: from mail-yw1-f46.google.com ([209.85.161.46]:41839 "EHLO
        mail-yw1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfENM6M (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 14 May 2019 08:58:12 -0400
Received: by mail-yw1-f46.google.com with SMTP id o65so13874151ywd.8
        for <linux-parisc@vger.kernel.org>; Tue, 14 May 2019 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=FV+xKMBik/jZsGRxIWKhkflIB6ciAABEcMQWhOcNOsc=;
        b=Rw+3psM1FBu1jBzn0zw03T2C9fk7+VWtCy6jx81PDW8/Kn1dnzd9951Ly0UkEzIzhB
         0mPJs0HKNiiibl60k66l3Ou2EzZ1dOVpd9dM2YqQeP3VouNZ1XSpIMfpjDsPdzi5/Xbc
         anS/fsQGrmaEJJeueXY1hNqyuG270xEukw9NV4FOEsJHC8cvcGVl/x+lYh0GKEOYogkL
         +GUpaDSfuGUBJgIJmL/wchxzGYSh9BrSrh809DiHvgknoyiSTlHA0Qk5O3YrxSj4RSeI
         RgqWkepTPn0Vw+vQgHPlUXpfDQQvGKUIFYkx712IakTEOSgN7NWwRbHYiKOMfpVxQuDK
         wurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=FV+xKMBik/jZsGRxIWKhkflIB6ciAABEcMQWhOcNOsc=;
        b=Suqywd9tu9JLjDz+JtfQYCHARQSMtohkRifWskYa8AbejEpf/iormf/uMOFyB5HXVO
         N8QHoVZaTYHuYLLbzId5okUb3Y9Yq8JT85FIMHa8cMSRly9xfJUzXsZlTpeqSftLW3ic
         sE4Oo4ulEesnyNr4HDdIAtwusFYH1cn22jCWYzg4stpQDc/ZH66Bkd85gQ4SN8NoB49+
         wHzwlvYLjV7Iqjz3JTwtQscn1AClzXvtIVFIpa0TEHhgFO03vSvrqeRz09BJVZ4ATlaj
         H1ZE75PuZKi2U9AmBhbgbmaMXjW/E0Ni+KFmxJRJR790+jNJNjaAj2BLPy7qeP5OnUpZ
         bbJw==
X-Gm-Message-State: APjAAAWB2BoZddB0p2uNN2WTp1CoPbAJAW62T1UqXCWE5bZ+xxtVNWeA
        OKbwJVY2usZTiHBWHmxBfiRaG/EIXXgwTf0KRQSMsdaI
X-Google-Smtp-Source: APXvYqyEvGcmLe6686Fms6Jg5z0Yi4mVltCD9e3p1zT8Vds8bKER71GdXz3rs8ujupKCH63jxMThtdycqDYgsupFX8A=
X-Received: by 2002:a81:9284:: with SMTP id j126mr14992032ywg.445.1557838691322;
 Tue, 14 May 2019 05:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net> <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net> <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
 <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net> <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
 <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net> <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
In-Reply-To: <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Tue, 14 May 2019 14:57:40 +0200
Message-ID: <CA+QBN9C-UOCBVWdwPRh6zMp8UjR3Kp=OPhTVTWCAMnVP5JgNAw@mail.gmail.com>
Subject: C3600, optical Fibre Channel, any card?
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

hi guys
anyone has ever tried an optical Fibre Channel adapter with C36xx or C37xx?
e.g. QLA2302F is PCI-X, so ... I have some doubt.

let me know
