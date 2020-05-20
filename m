Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE1B1DC195
	for <lists+linux-parisc@lfdr.de>; Wed, 20 May 2020 23:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgETVsD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 20 May 2020 17:48:03 -0400
Received: from mout.gmx.net ([212.227.15.18]:58825 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728377AbgETVsC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 20 May 2020 17:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1590011252;
        bh=lMT1Z3woQPQixtyLrI77ysH24b3MpyHzOSPhCMsWsxo=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Z27k4hSv9BPrMhIs4/s3iBKy8x0l/iIoIMDsPI7R5J6qMgOaTEhwMEX7ITYdFW+3i
         AheN7rg5S5KH2mm0AWnxolNtsAEas47O+us/iCF0wb29kGNjkgIzV1AIki3zwZqbCT
         kP3JFX6pIGRjMdHxhYFNPj87hLUyWhoUwr2NfaKI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.87]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvrL-1j7R050w73-00hKjn; Wed, 20
 May 2020 23:47:32 +0200
Subject: Re: [PATCH palo] ipl: Ensure no GCC builtins replace string functions
To:     Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
References: <20200520103055.31943-1-jer@gentoo.org>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <240d8cd2-2c8f-c788-4b57-6cefa35d7d77@gmx.de>
Date:   Wed, 20 May 2020 23:47:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520103055.31943-1-jer@gentoo.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WhpggPV7Bn2GS49j9pOTFU9uNNrmLdrhzK+dbfGEJVmlIgOoO8h
 pUJPt98UikMCRUBHI7kIXf9E0lc7miv8MqFh9y9/rLmJTazvWdLg9ILOBQ/Mk0LL3XwkGsw
 uEyBWi1SBEJWzQI+mofSZzV0DX/MfEaU+8YK752NvR+0ynb/Zully3vMAZJ4Dr5T2OMwXoH
 PMCvgrOEsYN7Kv85Iz8Uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CD8pkj5Fgdc=:3x1C4GDvSHmQnt+p3DBo08
 dsOaaTdhED1wJ4qTe9OfeehHpKLN+q6zoQcq3TeY0CPjWWPg4YetbhsHa0f7tQ/KYL08Enau+
 CKOQmn+aOCAOPhGYVgy3lqbJNT5GTFd5fugOOxm7ng/44ZeS8GELFhhvG8UOlWsMY/qFm43Or
 6sBHjKX0kzxKp1kqEsxLVNvNLnZzCMBYwcbB7QdTlzmDYTzj1sXVhKDG2zVVLANherDFxlxVR
 pQKOfzCjQiUfQe4jvpFKtDMs/4QdzRFlbURjWs73latGmfvO0uPxCS+FpYLZeRpptBV2sdarz
 dxvpDGHEQLpXbjJBXkz4TmQvvSfs2FETJQGguz/doUCCF7oTzQF5Foq9Yly9aHgjUaux4jY+s
 dYLHg+wslf4GMZlDa9FPs6+jykGiYEK1eJ9gRK+K9aSergZ87jWmcYyHzzqpcABfGD4qRVr79
 sDIGJhOO3wwWV7eytlkKnlFFclF5GuMICDrwGSatDbWWdvRwR8MQNCyBicDf36OASL5mpg5iZ
 F8dJHC5qMLoWs+00ghNpnaSBG8aiU9oUjbWFqeBj4rl0wjVGRdPFNsUgMHtZywddRxQ+RyPBE
 fYo+o8ReiVR9FRnyqZ2VilDNrakCXpzCLly2Mh5Ozj1JcuwGD8rzYqUO2oc0/uGdkPTflhCXV
 wGfhEKIjP2ndn3gK9fwCoDailVhjhm6eKe39EEC7cabWIzRy6GTXTPB4CvsCHnJzPkkSj15fx
 MWKh+dW6XdnLNoxC+1paPlkydLl7mifzAIYUhd0tq/114Oc61hPqT/7WCzRx8geIEG34aIUCD
 4bcIsjMXQHrmfWqjB6SDjeCLdFdE+Eifr/Jr4GFR6sUuAf5eqrXe7oXqyhRHxqKRWYjruZVdV
 li0UMx7zpsgFUYk4LCwHzplYbLtO3xvlbbrfZathF2qvnLNuwSK5hvtx09tvgEOU4gZViypV7
 m3BQdFZG1MzXCoTpoDKJ0LYJ785qKEXSeAAyzC+ylCMkkA93SR3xw6AJBVb1uhmrIA7FQFz5N
 30HoZZGJZRw9m1KrY+LjEGXrMflJbRT+uTwYNtfG+XuBGItmzYFvpXV+6ylvbUXnKytjbBsjr
 yykJx1c2O3kbdf0IjlVVlkI8KfZwzJLvDRVBnIEVPp+QU0X5V4oCA6JuVukm6o3SP1cIZyIT3
 PSQTVcNTo310GWiN9fg9QCqI3Ot6tY3rgmUlz3LV65grPjSiQQeh1fo64ttI14oG9epS19RJG
 VkXhdpWIGk7jMGpmm
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 20.05.20 12:30, Jeroen Roovers wrote:
> With GCC 10, the ipl is built with the compiler overriding local
> definitions of some string functions, causing the ipl to trigger an
> HPMC. Fix this by setting the -fno-builtin compiler flag.
>
> Signed-off-by: Jeroen Roovers <jer@gentoo.org>

Thanks Jeroen!

I've applied your patch and am preparing for a palo v2.13 release...

Helge


> ---
>  ipl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/ipl/Makefile b/ipl/Makefile
> index 913ec66..c1d608b 100644
> --- a/ipl/Makefile
> +++ b/ipl/Makefile
> @@ -39,7 +39,7 @@ endif
>  VPATH=3D../lib:.
>
>  AFLAGS	=3D -I../lib
> -CFLAGS	=3D -DIPL_LOADER -I. -I../lib -I../include -O2 -mdisable-fpregs =
-Wall -fno-delete-null-pointer-checks
> +CFLAGS	=3D -DIPL_LOADER -I. -I../lib -I../include -O2 -mdisable-fpregs =
-Wall -fno-delete-null-pointer-checks -fno-builtin
>  LDFLAGS  =3D -N --section-start .init=3D0x60000 -e '$$START$$'
>
>  all:	iplelf
>

