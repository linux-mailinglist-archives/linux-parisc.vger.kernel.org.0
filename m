Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6884E66B2
	for <lists+linux-parisc@lfdr.de>; Thu, 24 Mar 2022 17:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238183AbiCXQNu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 24 Mar 2022 12:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbiCXQNu (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 24 Mar 2022 12:13:50 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8075C2E6BF
        for <linux-parisc@vger.kernel.org>; Thu, 24 Mar 2022 09:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648138319;
        bh=4IgeKBKs0vKGsCN8KPBFTWVn/JKCfNJ58ZMopnse4KE=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=jmiZ+h2bXxoWiVwMv5evOj8J1rtNWCw/TO7CIdZEgFbLJ3yjvH+8U+Ly39OCZ+av5
         R21McSwfqQ4vPkjeNN2bCaStiXqmIM9TZZRgN5TXe2VQs89gQVOwtxz0gTj8fh8roU
         gqwmmzL3Xo5x1HEWl105/Ni+KBKimv+lCEv2NDvU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.161.116]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UZG-1nXyIO46T4-000fFd; Thu, 24
 Mar 2022 17:11:59 +0100
Message-ID: <1a915e38-be42-7252-91cd-cc65e090f7b0@gmx.de>
Date:   Thu, 24 Mar 2022 17:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: Fwd: Updated Debian Ports installation images
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     "debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <0357f0c9-81ec-31f1-5d96-2da27df679d5@physik.fu-berlin.de>
 <17f3c449-a37b-9903-24a7-ed52bd59df25@gmx.de>
In-Reply-To: <17f3c449-a37b-9903-24a7-ed52bd59df25@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:crPwOD2ZYYcSyadwxWlMwd/6jIPBW5i7fo2oYHrP5t4LkSkN/rT
 bZsV2xOm6YMJ0gGH+n8liC2b5HDGb5ibVW8VnP494WeEk+Y+q9h468FLRRuTzaCtbkvDubq
 Woy28VJ+G6tIGFedSurvq9FYoo7lnCCUlUQlPYW+Vc+BNCYRkZCAQhMVmCGljvq2VY5H7wE
 AgPyqZHgWtj5oZi8IryIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Egwr8IGNU9k=:BECskOx7lER4u7/d0SbF+k
 H9R+4TSzr5UxJjS4dhiXsEd3kpJkGDWfoZ9iqpKP45Gl9Lby0eJxLvWk8HhXSLlGcS6uZI6LE
 kTB/8aelugyJQWBJkyUCfvnIaXnlrRqgiRwlkOr8sSsmFBAsw6p/wNDYVJqK+X/XQzJWXxZDA
 njI2D3/EIR9f5PvhjbZB8Qauje10EHohvUe7+zmPKR+mT5+J2NfVaHofCXn0SPXrcIGWOPb/C
 s5rX4ltGXxmFgn4khepEdUkWFIDi2TLJdN4x6V/7ii8T2fsoPIxf90si0ggjCdGIT2xOdhXDF
 oua4Wa32WyjpKVr46wvB02kjNfT20AJObQzfTldIQL3pTN5o8VO9gLCJSe60UthX2+hCxx0MD
 zXjlavg3H83DceuKf09B5Ao43IMkl+3ts4SHrFm67NevYBmKnKH/nJYL9Valp+2yzmraA2HoN
 qDWcClXCZW7iPSjirrUmemCND+s3MdckpQXVa5dE81AXM3kXQ8uNNUihYn0nZUEfji05i2ZyX
 CgbVKB8BeRnm5otdN5Bxo9Dwvq5PDa1JrvW5LbnCP+Hx3rhtbnwTFFaXG+do3nxMf2l4w4ukN
 vg6+6dFZ+asreClGbWG4dz5VeMNWw1bqEumgPK/LGRg1yyN5W+lID/8URrB7cUSDtV3tjigV6
 polAp8vKEeScGBNT+7no9G9X/Hgjd9l5JIBN+jE5zOyr7fmkitn04/ZsNZccDEP6LGCoqnRHJ
 PnyurZzd7zCHzTPb/ysi01uyfi5Y1Jy1lBIr6LsZJ4CFQ42jOfjAScco9eqCY4+p9k7WcE923
 YQ36NgE7r0NcTmjvVE2MxVhlqhFCmEaYWlmoF39/3Q1tOdHTM1Dtbju3UM4q/7qOZTiSaRZ1V
 3h7MYVgRUJ8cZbEWbUpstg6YV9R91VSrV3UFjc+iaXPqldpzAHUw4hRhCxckQn6qTKJvkanu4
 aFj1SgVIy7u8cgyXslom63jon8SX78wKm9siao/kWUG958nXcLws1CXwXvSEblfmnzAa/zHeR
 aXFD5FhcdF7fXcZHGYxUoWtLw5j89CtV4biE0Rgd1BzsWe266M+e0TvgqPZRDbqEXHN+fUtf3
 PeGYXnmvRPYgYs=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Adrian,

I've sucessfully installed Debian-11 with your installation media
on a 64-bit rp5440 PA-RISC machine (via serial console).

I had issues with installing the same CD in a 32-bit qemu hppa VM,
because the stifb graphics driver didn't showed a screen in qemu.
That's probably a problem of the kernel or qemu, which I still
need to analyze.

Anyway, thanks so much for the new install medias!

Helge

On 3/21/22 19:30, Helge Deller wrote:
> -------- Forwarded Message --------
> Subject: Updated Debian Ports installation images
> Resent-Date: Fri, 18 Mar 2022 17:58:50 +0000 (UTC)
> Resent-From: debian-alpha@lists.debian.org
> Date: Fri, 18 Mar 2022 18:58:32 +0100
> From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> To: debian-alpha@lists.debian.org <debian-alpha@lists.debian.org>
>
> Hello!
>
> I have created the first set of installation images in 2022, these are
> available at the usual location in [1].
>
> The ISO image for sparc64 has been verified to work correctly, I don't
> know about the other architectures, however.
>
> I have also created the first images which include non-free firmware pac=
kages
> but these are completely untested and firmware installation might not wo=
rk
> correctly as DEP-11 information is not available on the Debian Ports mir=
rors.
>
> The non-free images can be found here [2].
>
> Adrian
>
>> [1] https://cdimage.debian.org/cdimage/ports/snapshots/2022-03-18/
>> [2] https://cdimage.debian.org/cdimage/ports/snapshots/2022-03-18/non-f=
ree/
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>

