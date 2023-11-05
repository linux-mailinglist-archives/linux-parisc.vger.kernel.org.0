Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A441F7E1736
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Nov 2023 23:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjKEWAo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Nov 2023 17:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjKEWAm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Nov 2023 17:00:42 -0500
X-Greylist: delayed 5252 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:00:39 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E89EB;
        Sun,  5 Nov 2023 14:00:39 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id 47FBD18E4B;
        Mon,  6 Nov 2023 01:57:30 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id 416FE19032;
        Mon,  6 Nov 2023 01:57:30 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id D12571B8223A;
        Mon,  6 Nov 2023 01:57:31 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id X_hgurO5-A5B; Mon,  6 Nov 2023 01:57:31 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 9C2BD1B8254A;
        Mon,  6 Nov 2023 01:57:31 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 9C2BD1B8254A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210651;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=RXUgtPkDW37/2CuNnF4/obdFDqglLetVWNmLiTD2RE4UCgHnW6TOUpm4UZw0iPw6l
         I/7oV+FBsDVk2BsDCa+kLfn7NNyCqua4mgzjBHW+Yv4+OgEFbaNtyRHXdhSlLICay9
         NLa72BMuV2Bfg9ZRF5WqZwdWAceXbrhKLjqVxCpWghlU/3IjQjBgRr/cnAASe4b7ey
         If0XYmCZjymf44fQtrK02jgV+5vTh5ULLo8mfLqyTkexbA9Et31xdcSFRTzPTfpryN
         Mf2nouQst/n4pdS2SHSCPUsukWqWlmV8yYVRtpImwpPx+27uOLWdoQpK6r2KqoWK0Y
         tJjkWSKAQBSzg==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id g2ahZkZcH1XH; Mon,  6 Nov 2023 01:57:31 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id 4EE261B82534;
        Mon,  6 Nov 2023 01:57:25 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:57:14 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185725.4EE261B82534@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

