Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7122267999
	for <lists+linux-parisc@lfdr.de>; Sat, 12 Sep 2020 12:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgILKl0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 12 Sep 2020 06:41:26 -0400
Received: from mout.gmx.net ([212.227.15.18]:33967 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbgILKlZ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 12 Sep 2020 06:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1599907277;
        bh=eLubIRoGWMMoVr9G43W4F9W0rAlKFE7H/jPUWrHgRIE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=kLN5WYHksYr7opcPvQM5+WMfwwDida3P7gJdwvAfw6X6o44R++hViIAe6nD8ds7zA
         2rGqOuIRcDdqkOtFTufprVL2SKH3TGRORysAL/UmCxGh5s+Bdqle9ICXW8ODBE40uJ
         nhn3bpqyDSxgSds0902qZKDXMu3D7pZj1BKfWvEU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.134.185]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHAH-1kkMJK0xJL-00gsev; Sat, 12
 Sep 2020 12:41:17 +0200
Subject: Re: [PATCH] parisc: disable CONFIG_IDE in defconfigs
To:     Christoph Hellwig <hch@lst.de>,
        James.Bottomley@HansenPartnership.com
Cc:     linux-parisc@vger.kernel.org
References: <20200911102746.1287829-1-hch@lst.de>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <1efc3e4e-bf20-f7ca-6eb2-e04fb57ae175@gmx.de>
Date:   Sat, 12 Sep 2020 12:41:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200911102746.1287829-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MJ3FTuCGjNg4JF07ZYCgeasp35zKD9VDPGnv8g8YurdyLpIlrWt
 V4j3heALe1G+WX7sOV/XwdzqEtLP3g97bkdjgAKFj49bV9qBHXPGjxMeTvz+o5C8flrz+eV
 FWOlUrS3kobCdNRbszxWIbIoa9cNCNOyI4Gq3AndUUnZGtwOVQkSQd/M02sRZYmRYDJPHLD
 Xy0Klzwdz8ySD9qPjNhrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ucSBE6PF5c4=:Tnm1fAnEawM5b5g9jSZLlo
 itbpclDG46Hkcewg2tZ06IV0B8N6pnAAmAnTRBz9+AOqX3+cNXo99AiB9OaXBVC2Rkg4uKSZL
 nAUtyWaYGde26qCWxdsxexy2foNcCZ2ejXZhSfbjyHa1yhd4FkXOncQnCXsjofB8LXFXX5gLx
 xoGG4d7lZVvrpqJV80K8yq9HeWU/QcGE+oVK5wgN0h0O2J6Zb7rE8DzfJ0hmq58oiy9N+H2AJ
 +TcjwIG5O5gXbx1DnM2g0zPIeomofyMINo1XfHm03Za4cgbQOxym+PbL8IEP5QjLfDjU6gcLx
 K3hrYTfBmXKVJqt3v037vkA1ECciu+1NmP7/mNbxzw4wHHXyqAP/b07SzDNOD38q3/Y0SbZ2R
 yqA+Bm9aRdUsJCyyGQQIG5OUIOTjLTmLqSLkX7aEfIpwNPntXiA2XfdjlMDR9XbOVYAwM1dpU
 M7BOPkULztecNIhcRVQE4gILwaVuV3pbnzCUq66vsg+zNw7clTRO/zgltm9x52dQ6kCklXkak
 TJ0ttNNCMItEuZ3HVGOvr+tbgoY2UAKoke0w2aXEvOW+ZwvYoU24RRGvp7qS0+SzjsWu4363L
 R+YcN1Grq9pqBxxXVfnP1JJRcaZdpWFHE8xYqlWLEW3NTV1ayizel50a0Yt+ojaTmQuZZTfKd
 FUrxrIpFygoCZPH4cMAKA1FFePBX1jal7JnGVk3zmcP3ReS42rcB5GsJ34Q0WkHHihkkSGrev
 y3LBZoJ6EqWm+QYfI/qKkgGWiUmugbgsA31hKO8PZXKE98IZNksw18NH9FCdGyof0jtLVLLrS
 NLBTtqcODuH2APBchYjzGwszj9fwnK8yuEw3GXHUghkVBPIf3Nq9DkZrUO+Bm8CacVJSyuCIZ
 rCiHN9sqv0QoRKj69yz5bbstovFyA7zYGO+ZJnbzl1+IWkuDpe5gGqyKGCCWjz+YE/4yjiyqG
 CwEXe0y7xT0/8hqAOiP3rA+x9o8HPbyEk3yLeLNZ3qCKZqh0aprKGwC6A94X1NNb55ut7zJI2
 agcybqODy7ocEL/0O702RSELBy3oYRkPWWmHGbLrmE2d4HlT2KUlPpcsGhLlPtOJW6KsvYyyf
 IGX8K2Vqpf4h07i4XJ0zOXNU0OnlG3QQsSpNRviB4P6e6Ba+M7CpTgcV1/ZrcW+kGa7oQB+0R
 vOhkiP4D4RY6P71ITkfdPD7HxPeyyw6nCshpUMh7dvGsmWvefF3mzyH3riQQa0s16kuakj5UD
 djhNl50CfSG9Dfesh
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11.09.20 12:27, Christoph Hellwig wrote:
> Enable libata support for the Nat Semi NS87415 controller, and
> disable the soon to be removed legacy ide driver entirely.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Helge Deller <deller@gmx.de>

Helge

> ---
>  arch/parisc/configs/generic-32bit_defconfig | 6 ++----
>  arch/parisc/configs/generic-64bit_defconfig | 6 +-----
>  2 files changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/c=
onfigs/generic-32bit_defconfig
> index 61bac8ff8f228f..3cbcfad5f7249d 100644
> --- a/arch/parisc/configs/generic-32bit_defconfig
> +++ b/arch/parisc/configs/generic-32bit_defconfig
> @@ -52,10 +52,6 @@ CONFIG_BLK_DEV_LOOP=3Dy
>  CONFIG_BLK_DEV_CRYPTOLOOP=3Dy
>  CONFIG_BLK_DEV_RAM=3Dy
>  CONFIG_BLK_DEV_RAM_SIZE=3D6144
> -CONFIG_IDE=3Dy
> -CONFIG_BLK_DEV_IDECD=3Dy
> -CONFIG_BLK_DEV_GENERIC=3Dy
> -CONFIG_BLK_DEV_NS87415=3Dy
>  CONFIG_BLK_DEV_SD=3Dy
>  CONFIG_CHR_DEV_ST=3Dy
>  CONFIG_BLK_DEV_SR=3Dy
> @@ -65,6 +61,8 @@ CONFIG_SCSI_SYM53C8XX_2=3Dy
>  CONFIG_SCSI_ZALON=3Dy
>  CONFIG_SCSI_DH=3Dy
>  CONFIG_ATA=3Dy
> +CONFIG_ATA_GENERIC=3Dy
> +CONFIG_PATA_NS87415=3Dy
>  CONFIG_MD=3Dy
>  CONFIG_BLK_DEV_MD=3Dm
>  CONFIG_MD_LINEAR=3Dm
> diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/c=
onfigs/generic-64bit_defconfig
> index 59561e04e6593f..7e2d7026285ec5 100644
> --- a/arch/parisc/configs/generic-64bit_defconfig
> +++ b/arch/parisc/configs/generic-64bit_defconfig
> @@ -58,11 +58,6 @@ CONFIG_PCI_IOV=3Dy
>  CONFIG_DEVTMPFS=3Dy
>  CONFIG_DEVTMPFS_MOUNT=3Dy
>  CONFIG_BLK_DEV_LOOP=3Dy
> -CONFIG_IDE=3Dy
> -CONFIG_IDE_GD=3Dm
> -CONFIG_IDE_GD_ATAPI=3Dy
> -CONFIG_BLK_DEV_IDECD=3Dm
> -CONFIG_BLK_DEV_NS87415=3Dy
>  # CONFIG_SCSI_PROC_FS is not set
>  CONFIG_BLK_DEV_SD=3Dy
>  CONFIG_BLK_DEV_SR=3Dy
> @@ -76,6 +71,7 @@ CONFIG_SCSI_ZALON=3Dy
>  CONFIG_SCSI_QLA_ISCSI=3Dm
>  CONFIG_SCSI_DH=3Dy
>  CONFIG_ATA=3Dy
> +CONFIG_PATA_NS87415=3Dy
>  CONFIG_PATA_SIL680=3Dy
>  CONFIG_ATA_GENERIC=3Dy
>  CONFIG_MD=3Dy
>

