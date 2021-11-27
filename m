Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323F245FE3C
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 12:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbhK0LUP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 06:20:15 -0500
Received: from mout.gmx.net ([212.227.17.20]:47335 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238731AbhK0LSP (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 06:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638011655;
        bh=Nlv+YwyrFp5/js3l2+n5LajMQJNLn1j+N2+/9mUdcKg=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=B+Wmu2KOVvuxMvZhcBdM+q6ZTJlHVmjOBGRGFJFw2Fk6pxWVIerlTNd292tpfrml9
         cpwCIzwYso/O3Ru0TajwAqIWrxuI6IHy5pSIhdTZ0/sksQimeqaxdvyNT7cAY4qHOc
         T/Wm3o2uNl16pyeXkA1zeZuI6CZFga/BrqeVwh7Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.211]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKGP-1mp1rS0ycL-00Fnwd; Sat, 27
 Nov 2021 12:14:15 +0100
Message-ID: <ccc69a65-e0af-1c0d-282a-77f74e2cb918@gmx.de>
Date:   Sat, 27 Nov 2021 12:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] agp: parisc-agp: fix section mismatch warning
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        dri-devel@lists.freedesktop.org,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel test robot <lkp@intel.com>,
        Kyle McMartin <kyle@mcmartin.ca>,
        David Airlie <airlied@linux.ie>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-parisc@vger.kernel.org
References: <20211127045757.27908-1-rdunlap@infradead.org>
 <2606759.mvXUDI8C0e@eto.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <2606759.mvXUDI8C0e@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s/S3hVajaXU3IFbl/RCCQTkAOGE9EEE7socUcPTMvRQQ4v/GUMR
 3fQe+2FN/Hv4bcXs1X9tfeHopkPSNOFiEBN+5r7758JijR77xsCVO4iRPZZq1iNV2mWvt96
 B6mH8ednX6CVse3PtltSCsxCUHocbwpK7FevL5p5iUKbu4PR6Q1g+9APs9T70OiO2Mh7cBl
 9R3/zewuQ+sgpG8WW7ViA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4Z51+uuOfRk=:fhuN+hjtwu4XQKtmBTMGz/
 Xh35qNKnGPx29F2EDbizDb42NGQko5zizMGaVNu/c4HHxFJBzYBNMyakyQNdVPgA3pHtvNugJ
 fB0rLQrHclH3qUi/a2x0QEvQ7aPh1sqYmM6+hiPsngfFeLbvbJBZrNgcJQzUz8GKBKmELCJvz
 C3J6M9X93izlPdZfNzw/bb1RHVuKPMBpibN+OG+HVLiDi1sl/IUlWSTP2mSQG/39oaMDODOo4
 L0XR6RhwykV0S3urEQKGNqdUxmWfWVvSnOrT2VYBz1tJ3N2AeRNKxSZhlOCXs+WlGfn/368LX
 h4Lp4ZpHRTrxARBl1QiHMdIciokmBH3EI46a9jz8SdizxQkqqubHys5uFVoc6c3C2dDu+RNB1
 prtwv/nJYJsdxQQnP6xm24yWu9psRW9K6QKKf8p9L9HQapHCc3xinuo2dZttAiyd82EaV4PN8
 eYnoCx04OBxGLaMYv/bhZIC3D1r+mlFrN2hyFJfZ9LrM66f4tGtTF6aRgtMAEIQVMP0LAxZp5
 ekYPoH2JPByB/8u39UhWHlsYBaAiKJhfk9FNQVSQNLf6C0s5Jqyfjx6PbJqVNSZm48/hnNkuE
 i0LDCKiqKCcOnqzGtu0nr5BduFrJll1DaVZUyBU6gDSJafyPO50WdLSAMD36F8tG/Y2i2BmPN
 ysbFM+vi3qg24L2d+H8947B+LJv/oisMgCb2PiNbHOX7yjr431QBlBbovyWMaCf4/eTs8daSK
 waNug3jMwWuNZAtvmsSB7B8MeVeyMTOj8cOQeDfZPbQt0vKkSxBMbdvEvkdphk32KlrauzRP2
 WY1dxrJDu6FglkHncJCPvToLYnGgY8z5mCZV/3YNifkRNGBxhC1briyoL4OILSOJzTbCASI3r
 JqaJlQoqoadDqrMZ+/sDeTYmSAatDGFwp0zgja3uGNt75X6qsyHst2c5ShbbqzmTIria9LqE5
 Qiv8oXboqUfHKpb0BGQt0zq/fx2/SHkuk/nfXw1kjEig4enrbR3g56qNoWmVi+eXt9qFZNrLy
 rW/iP1rv3C45SKOcGLgLso46SKbyDdqnDbO70IeTyLJgs1nHdZBA+8vzfxgpEa274C1sm4P5r
 jh3UkgUGpK+O0k=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/27/21 11:56, Rolf Eike Beer wrote:
> Am Samstag, 27. November 2021, 05:57:57 CET schrieb Randy Dunlap:
>> Fix section mismatch warning in parisc-agp:

Thanks Randy!

> Too late ;)
>
> https://lore.kernel.org/linux-parisc/20211126154754.263487-1-deller@gmx.=
de/

Being late doesn't matter!
I'm really happy about all patches which are sent in for parisc and in the=
 past
often I applied the late-sent-in patches instead of mine, simply because t=
he
commit message was much better than mine.

So, patches are always welcome.

Helge
