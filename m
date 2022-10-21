Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A633607100
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Oct 2022 09:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiJUHZr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 21 Oct 2022 03:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiJUHZl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 21 Oct 2022 03:25:41 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4401757A3
        for <linux-parisc@vger.kernel.org>; Fri, 21 Oct 2022 00:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666337122;
        bh=rWG7dHkEe8fm6kb/956VXTz5+Yt10EEtWE7AYQ99LiY=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=MDS6RanWSr3Q2ATsN0IEDT6ZYCN2vGC2sv/THW3LD4pCgXGcwKcomLePe/hYBo4n3
         KoVureMBc0nUx7DWY3/fY9BODpV/L7kga05zuypNFv2QaP9eclSLFJEFGYp9c0IHlH
         PPp3EhcF1d8Nhaouh4roM4bykU76WfGjoGfrxnbI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.94]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4b1o-1omKu41ixK-001iGZ; Fri, 21
 Oct 2022 09:25:22 +0200
Message-ID: <bf9fc3a5-5591-f2d1-6a19-faa4987a15eb@gmx.de>
Date:   Fri, 21 Oct 2022 09:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [linux-next:master] BUILD REGRESSION
 acee3e83b493505058d1e48fce167f623dac1a05
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc:     linux-parisc@vger.kernel.org
References: <63522a57.pwxlK8v2/w+DMFI9%lkp@intel.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <63522a57.pwxlK8v2/w+DMFI9%lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rV+MCPq5jouwLprEolJ65PJUM469ANdW0fOaywiKXBEsncf3YcJ
 LaiaIbt9MBajoqGKvSPFXBohEDStmvcaOLUH7kP48pcIEJuRgv0y+7Fzjpe3wQAptoaN2O8
 MLUJAd9CybKl95NGKfbVAhGRwEy++VegDZfwXIUdUSkQ+FViF51VEEqnZ1olMhrYwQFZZYA
 S+8POmtIeuBptzBcS2UIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JeDJs6nCG9Q=:rVamZ2mEsfl2Ed0OUpRBBV
 yeyAN3EpfBGBK9IqLhNo9NWWXD/Zo0UxiUtAU/gwzy4LpWxM7JaMtUx7gkEbR2xZTgBbjptUN
 NeDSPfqWQ5bd2MwYFtY5wjwSwEy6f6fXu1saYSpUsnfNgQ4zLup9ZmeUHR6IK5+llvf6xKBl3
 YIa9Er4tPP6UvgLTeW7Nx9t6Oz//LPN3CxVHrTsDW/i/6iwYZJHRo58mON2Xm/jCZ1XrTcxEI
 mZnh5S+Ym06GCSjrBzYBDbaO3ODeRZh5xiHA8DT4N7jtucbwnd+8CHxWXtKy6+yX2RQxynHT4
 lZGzVVDOc1dlEubkSXHfjrChwBDSG6qPlrD6yAq5Y/Xzu4ZYZah5789mw1OUOGjI3GbxNczic
 9r7ORBiu77wh3kVfFtHLOdwULid7UXytlYErtfUS8n7OboQpzTEFqU0hhlwn4E/gnCsSgyJV2
 HQiR7GsEJZT5JaVqy6XAZhGEemWEWTDvCCHRZMKgKbvXAUiLIyYHUpk0gx+Pzn95rnbjBZ8QK
 Y7CGbrhIXWr4AWlhDZX91mrpaBltwXGbh83B4EeDf4QcUCyceZM16PdRM58bujd65z714Ytjd
 VdLxbXD2FhKRBcH455O1D52MczF6Gm4LfA/Y4nlbKZHZvcZ4+vtPRvpe5CngWD5CbCoKDe663
 QmqKEqvugzQDIOq1U/Wd8SUZDHzN1FAVe9J1RukOZVDczqtZxAaFQUV2BxYCn3CQemq65yw2F
 +p1un9TG42FJ2JOmIY/ke6OWBkW3NzmJgcTAyYfBQZd2DIr2/Nglp2OyDBpJBka0S89//aAcb
 IMD3211COAm6RBYtpwymnemGjOc2vMPD/5gXiJMEhHHF0cOTQiZkJAmXrCPDGAmnVI1LnuF3m
 UPyUyMyy6Hansfzls0LEvcHyuqHNiwWE5ipT85NPZZP/T0x+nEROt7nkFEc8fOvA0U+iBmfzA
 vlF8O7e8r1O4pX2eZKtd1UAnmG40o11LQj5b4Ktbwmoj+U2FsUKYGkqmp7y2/jRqVPMFnEMzh
 xYV2Hv0gfZ6AwbSI50+NzCZKbQlBYrfe7Q5iy73nGojylzeRCHb7DW6kwHeZVRIJzHAeQ2Sab
 r1eKxl27YxFYfFEtyZRdYbCbxFWzdWKHx5teQAHPVPZmpEWhxq1Kk+xzTWdfimr4aO2FYiFek
 NTiTHpID0PWkq3Am1vs4CYaXsAv1mhg/dwqcfQyE6Bk/bu+FHQRweHQ81FLZJDfJaoGyp6/fJ
 GvpcN9gyBZOlO3WCOUaZc0iidlY8hfXcl/G/CvpsdWDRq3NWOjZQMh6NL+8eyPLblz8Vwklfo
 3gBk7uq+RvnbSF0zr41YCNkCn7LRFQ9FZap9dnmLzAEvlaoIrred1Ldq38rjRCZdZ7mXDZ95J
 w2zG0xZNH3/jBpDfYkfSO7TiPNlfH0MGi38AvRSRssRfrw5LClvkDg6+qCnZMVo0rTE8bFSme
 VnyvoXBVxcPrxJidXqzfoO/n922AfWiDZHn2dRiC2cfNioSw+9Y/HbQXs2LLCkRKwiYRVTNzH
 564YAMZ+XgAzEhHXt/Xdfir1hhQh464QaHQo2ryTS1qzf
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/21/22 07:12, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git master
> branch HEAD: acee3e83b493505058d1e48fce167f623dac1a05  Add linux-next sp=
ecific files for 20221020
>
> Error/Warning reports:
>
> https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
> https://lore.kernel.org/linux-mm/202210110857.9s0tXVNn-lkp@intel.com
>
> Error/Warning: (recently discovered and may have been fixed)
>
> arch/parisc/kernel/drivers.c:337 print_hwpath() warn: impossible conditi=
on '(path->bc[i] =3D=3D -1) =3D> (0-255 =3D=3D (-1))'
> arch/parisc/kernel/drivers.c:410 setup_bus_id() warn: impossible conditi=
on '(path.bc[i] =3D=3D -1) =3D> (0-255 =3D=3D (-1))'
> arch/parisc/kernel/drivers.c:486 create_parisc_device() warn: impossible=
 condition '(modpath->bc[i] =3D=3D -1) =3D> (0-255 =3D=3D (-1))'
> arch/parisc/kernel/drivers.c:759 hwpath_to_device() warn: impossible con=
dition '(modpath->bc[i] =3D=3D -1) =3D> (0-255 =3D=3D (-1))'

This is due to Jason's patch to treat char as always unsigned.
I've cleaned it up for parisc and pushed a patch into the parisc git tree
(for-next branch) to fix it.

Helge
