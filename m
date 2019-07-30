Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FE97B433
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jul 2019 22:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbfG3UQc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 30 Jul 2019 16:16:32 -0400
Received: from mout.gmx.net ([212.227.17.21]:35557 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfG3UQb (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 30 Jul 2019 16:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564517786;
        bh=CnNx+j8w1KNn+MWBbCWB/L3LOVHnZddHKtc8nEL2oDU=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=gBGqC/ojRA5H8oAhPf2TYs+mtX8nmzGXH3D4q+yIKHTtzuEZs6WCzJK52yD5Grp+d
         9okVeCNtYW8ddTDAvGpIlgZUEvjGrGuq9Wb3+WE9r/fcatmIGLwQR92216aiHJP2LL
         VDLRso6Ft/AA0eKpWPrQ0ZYpDqtYOJpG0B/1nMnU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.50]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MYbFe-1holD93eao-00VN5y; Tue, 30
 Jul 2019 22:16:26 +0200
Subject: Re: Do we have a buildd problem?
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <1564513941.4300.33.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <02fb2132-61b0-ef5f-6ceb-e8854d40d030@gmx.de>
Date:   Tue, 30 Jul 2019 22:16:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564513941.4300.33.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a4UCUq/dxObz7weOrMq3Y1H8c/h02te0sIoP2hgfLAnNVftHH3y
 142x78hofwSKofCq5Iu5i2FmszikMeGPN8C3s+wld8rRb9MH6GAbD4K9dMUiCffVrgc3JuE
 vtvlUlI+6oWLEYv4+0osWDrI/vU9qgVWJumZMOVbj9ST6B1f1aV6FRFddds2lhlO4SiZiT9
 ij2UaI/8QpWXnIHevNbGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nnGfHuQrbkg=:lBgmVobYvpbwK+DWGsOxYd
 N/o5INJFIMGQ3RP4uoHLWGMum0+n98ZrJrpN02yKT8Rwo55p50WVl8G/WcYnBlJmGWr/sKqEL
 egOSgLejdCbWNmE74xCin2oWQfnjqCUKbMzqnDrijK44Pw55sGvmRV6O15FZWgJcxrCE0uFL9
 ExA4pfnQBeHNaArDEWMF8MMG7LIao9WJBblUVQROgBQbgAZruD8yViJ+1MTppaGcLmP8yRuW+
 n0qwpAO8F3Gj87/Pt/0dofIwQ+oxxycoZ1X1+wC5pvPA3Wb2nfCftZF0H5r0zXVG7itUwDNjf
 M+GiLr1MNdLAB272mvmjcOr2JHwAlH/mTy/mTy3pJXp9b2Df8LRiN0bXX7k/+QM+NSNPgAu9E
 58IUA/sKe0xeJdm2XHdpR/BvLoEczE1TFRC1djWbOiFKtFDRW28ykxCJ6N2aWzX2OJm/+LfyU
 siLGwmS258G3Hr3Z8q/SVbpQC/Q3XYwxu1qrk53nRZqcH98TnHe8BT2K+TEoI+HldfxGG/kC1
 7v1WRVVMmXZJdzs/+MTDiHz6m6ETM/PUQnrX6BzyKF+P/7lwApsBka0XFMKvEw2Zd0xXWNCjN
 KgU/ayDkrlcKeUvMMkNPS1g51PxXKpf8nFQatLSGMU/KO5rnEMu3ytWfD+B8DuE6DbV4VFuuK
 Fy2jfC79WLPTe5vzCNZILa1DMPTDdKSMEzJg4cLJjHIwQyAMgNjFcvresgElr3AoAw9p2vAH5
 GeR7eDkqQfPYPH3YgHOX914sbqgTapHOc1qRzVuc++sqfj/aYhziq6EkBEI2As+EGCjy5IEU2
 Um69Bv4EeoZPT9PZMBNdkS3kS8fZd9t8jRVXC0x0yV0PvjtKgcEuHI+ANQKlDt5pX3wEqQp4X
 td5iFqPogRctgbw02YxIyO8G68y5VbeSq7rmxW/9sNeey5xasdOcT8jFXFwxs+JVUqtFpNsBN
 /nGnl/F1JWohcvD5MgK91QakpbWosEAM9TR1DsTt4nUDSZSj9YBghZC0/Ridx1K34WrrVljnb
 57GnocEPNotckxncPY/pfJHLfYARuuCIVcvfFuhoLRuiITGtcQ4zVSnxHLgwmq0+6dtiV/ybJ
 VzJEIaJYtIbw8o=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 30.07.19 21:12, James Bottomley wrote:
> Our ports archive is out of date.  I'm getting this problem trying to
> apt-get upgrade:
>
> The following packages have unmet dependencies:
>   git : Depends: git-man (< 1:2.22.0-.) but 1:2.23.0~rc0-1 is to be inst=
alled
> E: Unable to correct problems, you have held broken packages.
>
> The issue seems to be that our hppa version of git is
>
> http://ftp.ports.debian.org/debian-ports/pool-hppa/main/g/git/git_2.22.0=
-1_hppa.deb
>
> But the arch indep pool version of git-man is
>
> http://ftp.ports.debian.org/debian-ports/pool/main/g/git/git-man_2.23.0~=
rc0-1_all.deb
>
> Indicating our binaries are out of sync.  However, when I look at the
> buildd status:
>
> https://buildd.debian.org/status/package.php?p=3Dgit&suite=3Dsid
>
> It thinks the hppa version 2.23.0~rc0-1 built successfully, it's just
> not in the ports directory for some reason?

Works for me.

The following additional packages will be installed:
   git-man
Suggested packages:
   git-daemon-run | git-daemon-sysvinit git-doc git-el git-email git-gui g=
itk gitweb git-cvs git-mediawiki git-svn
The following packages will be upgraded:
   git git-man
2 upgraded, 0 newly installed, 0 to remove and 23 not upgraded.
Need to get 7.161 kB of archives.
After this operation, 1.199 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://ftp.ports.debian.org/debian-ports unstable/main hppa git-man =
all 1:2.23.0~rc0-1 [1.675 kB]
Get:2 http://incoming.ports.debian.org/buildd unstable/main hppa git hppa =
1:2.23.0~rc0-1 [5.486 kB]

It takes up to 6 hours until the git package gets moved to the standard po=
rts repository.
You can (temporarily) work around it by adding
   deb http://incoming.ports.debian.org/buildd unstable main
to /etc/apt/sources.list

Helge
