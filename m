Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93CE452B3DF
	for <lists+linux-parisc@lfdr.de>; Wed, 18 May 2022 09:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbiERHn5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 18 May 2022 03:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbiERHn4 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 18 May 2022 03:43:56 -0400
X-Greylist: delayed 1801 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 18 May 2022 00:43:52 PDT
Received: from outbound5i.eu.mailhop.org (outbound5i.eu.mailhop.org [35.156.234.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6977027FF9
        for <linux-parisc@vger.kernel.org>; Wed, 18 May 2022 00:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652857063; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=bRd8+Q46NgbENUyIchSjDUSeu2fpzdS4QFbCk3vZ6xZAERIsNy/gaMfx0PIl9XEav8rv6p8BAudUT
         rkfVYHRYAbn4MSeDjs3Oww5P0O5iJb5/NiJH/KjahLHDPAHQ3Ef+Azg/zyRxZ5iEMysWxzgrCvXqKb
         Usd9lrdm4khDKx6u1S3CpPHDwAw7ogvaUdXv81mEv7kZ80G7JvCgujIg0doSMAAeTw1U3mwG2xFUSa
         ElbzY9lMWlke9jToHpkMzQvgiRkeYS1iRFzsbhyPTyjcVI3mZLNC1fJtTDSb6PHWXWU/6vKvpJNINP
         ynNEv5NEZAciq2QxlHxGJza8SORv0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:dkim-signature:dkim-signature:from;
        bh=N/AKMdeBtgz5NQpWuWjsa101CdoV6t7LzXY8BMZ3fMw=;
        b=DoX9rQ7Nj2mhTjJsXWmcGMdx+Vq2rrWvcCdZXZaIhZauBSLZmxmg7TgKhJM/tLoRiEkwR4JS07tr2
         2wU/bUdDbcebSeA2vcn9fhnACg8xIpUXYULGgiSqMSkuzd/+eJSnqrDbk14Iu/HHryRafDZY5CXYIo
         oJA1GEM3vfzGU3vy92xaGx2tkSL5Ff2nmrZ/1kRdAffYK2OF6XVnikoGmEUUjcwPOaciT8CppC4BTW
         tQ6PKOcT0tN9mlD83r3wAgJQ/mvPLmKQnr3hZsjFziaNrCpM0yThviwXj+dtL2Te1O4SR3MVm/7U5y
         q/OAptRsCodZ2rbZKa+cIOQ2WKEJ9DQ==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=130.180.31.158;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=N/AKMdeBtgz5NQpWuWjsa101CdoV6t7LzXY8BMZ3fMw=;
        b=pjWBNuhmQMkaPfH2nDM9FJ6nIieBw9uWsU38qgsoGkvtQUpocZhvYWmaeHghKkHaVJuRfOvb97ibm
         bb5zWoWcAnK3HNzmJaune5ej2NjvARBt4pjOCu1aBdN6hPEIInkXlW+nSLGzAfzllvNqBm9w+5w/F5
         02TPwIepknJGPPD4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=N/AKMdeBtgz5NQpWuWjsa101CdoV6t7LzXY8BMZ3fMw=;
        b=C5JWoV/XCME7SRTZM9uEBf0N8H9VvOudCR3f6adjtyZyB8EP3j/i33zSJ9K/7Z9dHp0ug/xcnEbHN
         3bJ0/QVNNAsmX/FeUzQIPLPt+mydsAjWV3hUhcdjSOPGYanqiXnfjSg9fI7onzcJUjtBCWoOumojWp
         FrzdXoHwRzkIseoDPgWH93JYQKrde+/2AnlAy532NLH+Cm+3kw0fBPWltATu7GsutoVVVwukzvksxw
         Tonnb93MXbXL6MAAbNR9b8WY0CnGmHsW8vNbZvqsQfLMbur6RR0wvjpIszCMirwXHJV/2gSEZL+peD
         KekrsPMYXcG16hOlfTB5MAF6wVAARpg==
X-Originating-IP: 130.180.31.158
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: cd84c994-d677-11ec-bc05-4b4748ac966b
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (ip-130-180-031-158.um40.pools.vodafone-ip.de [130.180.31.158])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id cd84c994-d677-11ec-bc05-4b4748ac966b;
        Wed, 18 May 2022 06:57:40 +0000 (UTC)
Received: from ip-046-005-169-013.um12.pools.vodafone-ip.de ([46.5.169.13] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1nrDct-0000CC-IW; Wed, 18 May 2022 08:57:43 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Prevent using same register as soure and target
 in extru/shr
References: <YoOZy3A3R0i0DUWB@p100>
        <8b5c308a-f3ea-e07f-053a-ad086ce75c43@gmx.de>
Date:   Wed, 18 May 2022 08:57:36 +0200
In-Reply-To: <8b5c308a-f3ea-e07f-053a-ad086ce75c43@gmx.de> (Helge Deller's
        message of "Tue, 17 May 2022 14:54:44 +0200")
Message-ID: <87zgjfl44f.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Helge Deller <deller@gmx.de> writes:

> On 5/17/22 14:49, Helge Deller wrote:
>> In 2004 Randolph added the shr() assembly macro and noted that the
>> source and target register could not be the same.
>>
>> I did not find any confindence in the docs for this restriction. Maybe
>> it's related that on PA2.0 the upper bits may be clobbered?
>
> Looking at the generated kernel code from C-files, I'll find all over usages of
> 	extru source, x,y,  target
> where source and target are the same register.
> So, at least for 32-bit this restriction can't be true.

I did a quick objdump on the 64 bit HP-UX kernel and that one also uses
extrd/extrw where target and source are the same register. So i don't
think that restriction is true.
