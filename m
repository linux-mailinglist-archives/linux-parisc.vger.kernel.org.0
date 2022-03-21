Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECEF54E3005
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Mar 2022 19:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352185AbiCUScp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 21 Mar 2022 14:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352180AbiCUSco (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Mar 2022 14:32:44 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6D76D95B
        for <linux-parisc@vger.kernel.org>; Mon, 21 Mar 2022 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647887458;
        bh=ZUhx6p7AyY+Ugf0+XSfxADI1/HQ6JP4j7bifTjlavTA=;
        h=X-UI-Sender-Class:Date:Subject:References:To:Cc:From:In-Reply-To;
        b=UXKAC5SnzzqTMsThfIUvMYQ7ELc0vNhQjzgdsCrhTTMKUyg9gSmp7yq3hqYbfVWen
         hq4qJqY/dk4nZpTTI1x3X5PemBCrbjXZl1fzLEKZPmFymH9WN8AAW6hhiy8TqDOi5N
         q55vsVw1knaAW+Ncq3bnKry28Oe3lerDO4pxm7/4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.171.242]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59C8-1nXSje318e-0016KG; Mon, 21
 Mar 2022 19:30:58 +0100
Message-ID: <17f3c449-a37b-9903-24a7-ed52bd59df25@gmx.de>
Date:   Mon, 21 Mar 2022 19:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Fwd: Updated Debian Ports installation images
Content-Language: en-US
References: <0357f0c9-81ec-31f1-5d96-2da27df679d5@physik.fu-berlin.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <0357f0c9-81ec-31f1-5d96-2da27df679d5@physik.fu-berlin.de>
X-Forwarded-Message-Id: <0357f0c9-81ec-31f1-5d96-2da27df679d5@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mihOeRH4C4p0EQQmxLqNH7sswIyugs23nUAUEcx1ggsG2A2/E/Y
 0GMLeES/EPifgzOOMHpM7l2swT7JYS7FDi/l8hsyU2Suw1fpV4BlHJdKSwOA7fl30mmyj6Y
 +7820LCel0w2QwAyuM5mI+j2ZNrwZBLQfC2rgIaY113m+BapEcjiq5xWCnIgvaVy6CAYAzR
 3YEnEbTmegMLoMw4b+5jA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JWj3hiw8DeQ=:FkQ/J0WUfC77hFqTYS06P3
 uuMtWIy6peftpm97ixJ6ZlnC9bnTqZnxzZfCvAvuZAddYogUJyuJ3kCfY3Bzl7wICPlItkiZf
 c/G5oaq1A0R9jO8f3XgPy9tznSuNgc1ljQcxNCvP35+MsHLlXDjaW2ZDv59wUPvVwwaIy9A3B
 UpNwE2/l8o5fCPHKEDNdIEUCFx/ejA++MOfRMAXQhFv+YS9QdvmVEjAe7jxVToii4fExQ0C7p
 LmYRjP/PTMePpFBPEQOAztIa6ZdXJSElPQ0p/wHUhAQpO6dOJXjN/qlKRQPDCi+u/eDY9aS2R
 gIf1kX9JQ3iByYh2iciA1KzzYewOxSQQ2qBiicDbxCGneO4MMp3O9b89JvSt6jfp+qZrfslfR
 RctHwdeQAuulU6Hoi8+maQbGlZcSthwTlg4nay+pSrAQUAYpzx39zF4q/NsdyKAjaf8G164FA
 hw50dkiNUVg6gb1gcskl0E7WT49cAQG7MN9XS2tNuwiADMdPTqltRDYHRa7DJSngTYz4yt3Qp
 DnFle8NTtagjtoWAjLcJ49JWDAMmIoOSWqTcYe3m/8gJCf2lP5dWAvort8RGlNWk71Mzk27pI
 ozX67kY0g538qaQmywx1m4cxaXfB13rdoI1yeKMpOSeuaWfD2OvNJukOo4mlA5HjrkDtTyQa4
 STodMH8YmK6cI/4hovxinDRffjjeJgK8X+U7aWiTMY8Mi7gV7VpbZLNfbeB6Tq8qYq2sVCK6I
 OrdS1iUqn/G9rUshudTVsFDUCwY642qerWBIwQBXK/31K7p2Cw/zmTWKVg2+z/IOX7OPDgMpj
 H3lwzuiDb++6RRnUbsSzkgJXbgXT+lmHWaFpoVAuaaJs/BLWsfo0g2PdW55KTDYuW6Fye+fh4
 2dNBalxI+Ysn7CggF1Tf+8viFjzeKddFeyN6x/OTjPl5TAPL9qbqL58JjzDay2n5soccNtCT7
 nOuS4kf1D+FTXfI92lXLE/vT2CCyRApBTS4aOSvlYFYDraEcDLtsi6w8Ah1esS/fpknIEOCsO
 wkXmUnu32KYKcabXjSF3PEkYPoOmTnCspNPCUDKXsbg4XyNY6rUYBxxGd7SJc1TV1AOz5SCYT
 beExZJAo2wxgvQ=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

=2D------- Forwarded Message --------
Subject: Updated Debian Ports installation images
Resent-Date: Fri, 18 Mar 2022 17:58:50 +0000 (UTC)
Resent-From: debian-alpha@lists.debian.org
Date: Fri, 18 Mar 2022 18:58:32 +0100
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-alpha@lists.debian.org <debian-alpha@lists.debian.org>

Hello!

I have created the first set of installation images in 2022, these are
available at the usual location in [1].

The ISO image for sparc64 has been verified to work correctly, I don't
know about the other architectures, however.

I have also created the first images which include non-free firmware packa=
ges
but these are completely untested and firmware installation might not work
correctly as DEP-11 information is not available on the Debian Ports mirro=
rs.

The non-free images can be found here [2].

Adrian

> [1] https://cdimage.debian.org/cdimage/ports/snapshots/2022-03-18/
> [2] https://cdimage.debian.org/cdimage/ports/snapshots/2022-03-18/non-fr=
ee/

=2D-
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

