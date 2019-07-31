Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA5B7BB1A
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 10:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfGaIEj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 04:04:39 -0400
Received: from mout.gmx.net ([212.227.15.18]:46055 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfGaIEj (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 04:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564560275;
        bh=+1S+AIoxR3fHjed3APmwHxhEKZub3I5E0AQShGJbCuU=;
        h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
        b=PnU542za5iamaL+oXoHGCZjiN1GjNhp+At+rc0JdaBPDLe89yq851Bllag5VPRn5C
         G4OzIwT8T2azZrHr8lDwtqpYvWkEFzBIGaiKWFwmZdXKX8KKz1Z624YTCHpdjq0nVY
         MnouJL9dh74v9vrgYImn5G8E6YdvZ1XcV5CeshLE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.24]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUqL-1i58TV3PWZ-00D0pg; Wed, 31
 Jul 2019 10:04:34 +0200
Subject: Re: Do NOT upgrade to palo v2.10
From:   Helge Deller <deller@gmx.de>
To:     Parisc List <linux-parisc@vger.kernel.org>,
        HPPA porters <debian-hppa@lists.debian.org>
References: <bff56161-3d9c-d4f1-c1cb-fd04de28eb59@gmx.de>
Message-ID: <c4f057d7-399b-8dcf-3c5a-23e2e8235e98@gmx.de>
Date:   Wed, 31 Jul 2019 10:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bff56161-3d9c-d4f1-c1cb-fd04de28eb59@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CoXHrHXmTcN6uYdm+chFwB3k8Y5KPb0K9UE5ND15Mmg0KzEE+l0
 8V4PXRJiLeaptTXQvIdDTAl87MPi1C3OZulZy8trMDbVsdCRw/NSe3AOoDJjGWFoFeE5Y2U
 EfnqqntTfel1ndCbbaDW4DcXarc+oWnjX3/HxXvEQCM+WH57jta8Kb2tvi4/BvmvtRCAd81
 BJzZrKLTBewOF3dEN4MsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cnXytl+LuB0=:xjbyA9fQE4A3dmHgFv3KI7
 svlgx20dlhYBxfCrYeNaFp+SmtSBoMo+eresxKsZuB/PyCz4Lm7sXPhD/U0d2iVjXp38jYlsC
 s/bBqRPVvwabJCeNIc2izD3g5SRO92lUL7Xz5B3p8hD06U5fdMiqnjyvh0ZpmjZ8RZzeuipS4
 3PcfWWhH8vyXfs3Pgq+U4AZkC384ICW6veoEG1tVmWyT9dfI3h1wL4nHSYoNS/RZr8SVswXu9
 PRW+kYCeSBIcom3lPiGJMP2yqsYP6/P0Ogh9G4FUncDWOuBgl5fC0y0QG10CJi2AxbbuEBlHt
 dIAAdtpsgsas2appHzmVWcq2nrNlqFTk4DKzjgEt0oUjS8Tmv6KerX9GkSTkhNEI1udKWSIv1
 dJaOjuv2nRre9ttTGxD4ZDrbUF3/8nycZstq7qLWyqYppsOfZkyWOJNGT7dmfIAdQH14k0jNI
 Mgi3gnvQRd6FK52hZU1Gvvx7z8kxVTGeUvbEBgLxzgxgOSI6hbfoNtlsyCWHTsDz+GTMdFyb6
 oKRejf1Ol1RpagEk0erX1rk5Mrs8HcBuTpI1PvggIx+8N/HtRgNoLVivG0EEIynFGiJXILHu3
 YWiE1x+lGhkRhNfR/AXwhVndoBReEZd826ese9nKnhK+LxGHSME8ILbhuUvtjBnHLJrf86BnE
 VOdrZsTWXIYaOAALngl8StYdguClDIV9Yq3VxnyBMV5h+Sg0wa8D1KB1gJ2Xf3/o93aBxSsMn
 kGSEIlqTnU0b4Osz3W3qI8UyglTl9Mm7q6gT7C+Ghu27ENrKuhf2ngV5ojAUHsyUC7fzSC9xK
 K/wp6HKxBx9cpOUyshoABT3ExiFn5myleGvMmXbvecvD5fiu4FEYl5YkuaUpN0uHL0mTp1aDO
 bcr2+NMOzUKruhp8Rb7rWbjDZ/vrXNZU3oB/slG76LlnKDDYs62AIu3tAY/MjGLz/TV3ZVjH7
 MtLs6XesIwn3cA7WUPJl9lj8oa0TFKY6cO3zNVOYS9I2/2QYehIE/VIwnS/GFP9ijCJkRmnDl
 QObUW7Sz/KQ4zFSSip9Adhflq9zgHRhnFX+fGHu3V9YhxhyhN3z+WIBukZr618Ou9H6My9/7M
 DC9iiyYx7LCcfs=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 30.07.19 22:58, Helge Deller wrote:
> PALO version 2.10 was released last week, but it has a bug
> which may prevent that you are able to boot your kernels:
>
> Entry 000e0000 first 000e0000 n 2
> Segment 0 load 000e0000 size 8249207 mediaptr 0x1000
> Abort: Would overwrite palo 00060000-000f8e30 or data 3faef580 areas.
> ERROR: failed to load kernel

I've released a new palo version v2.11 at the official website:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git/

Until the new debian package reaches the repo, you may use
this prebuilt debian package in the meantime:
http://backup.parisc-linux.org/kernel/palo_2.11_hppa.deb

Helge
