Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14530733E10
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Jun 2023 06:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjFQEti (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Jun 2023 00:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjFQEth (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Jun 2023 00:49:37 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84EF10C1
        for <linux-parisc@vger.kernel.org>; Fri, 16 Jun 2023 21:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1686977369; x=1687582169; i=deller@gmx.de;
 bh=z89as7prZYkOlWIdQ6wVb6K8tfQ1T0RhUxn7zqaSOm8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GWC/gExJaY8ArqdfHXRspXfKwv88Ioffjz0IKxF+auwqkhL+G04xfg9t75Jiht4Cbvc2aMY
 5zmTeqHvESVyUOWkFZYLN2tzMPBMCorUU0GSmFEiHvP0Vus7dXjgd1DdKbR9W+F0pgHZOlzHb
 ontRrVuZzXy6VkXsubZdJ3hzi1oPAlmZLhTyR5nng07ydrA+BArHK306LD/p4C2Utcsehe63G
 4qGte9vEj6Sz1C+9FndX+d/AvEpXyWUm0NKoWzwl/tbf5L4D1tRJ/ng3gQmP0veGFTJb+bB7c
 WFR4hhQoBo3KaAoTTkrb/DV9n3z7p72la/O86PwkpzMOsRVOaUKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.147.114]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6qp-1pmXFi2ebr-00pboL; Sat, 17
 Jun 2023 06:49:29 +0200
Message-ID: <20fb2e70-0bba-1bc7-e0aa-3d1c864df8ac@gmx.de>
Date:   Sat, 17 Jun 2023 06:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] parisc: Delete redundant register definitions in
 <asm/assembly.h>
To:     Ben Hutchings <ben@decadent.org.uk>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Cc:     linux-parisc@vger.kernel.org
References: <ZIo4Yg+XszzDZCy5@decadent.org.uk>
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <ZIo4Yg+XszzDZCy5@decadent.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2oYWviSANTRVKwOyWfw/TKR8toOIF4kf5ko03t4s7/7evVBCzRG
 qnM3uMczmXgnQAgO+DUXaa/lK7jj99ssiUmjSkuv4Qx1hrV32bHWbFn9+dWXMTQV0S5EOTt
 TsN2wEPTKu/Asbe55FOuXWSZYEVkjCRag5h7YSzK6hg2gwQuIVRW1hwdvhXnNDEvEldv3Bw
 hM2fgOu0pCuom/J0ihXhA==
UI-OutboundReport: notjunk:1;M01:P0:u2Z8A8gJEOU=;qaauVqSC1kGy86a4rDDwMVKc+Ny
 PmCc8ypGEdjXLFUueW16dt3jkU3kY1USj/rOrdkd3R+pciKtJZQNaOKRnH6rywyep5grKx64x
 PFNB4kCLB4qmb3xsmj6VWuSHDDP3Twb/e95KZ2/fY1O4br5CDsERMma+XiO9L/ErT8+ODAuU1
 bPJF8w+HrYkGjyTBPAT0R9ZrgYjRKi3T1qtg3lryo983CERvfL9VopP/lAMS7Z1EQcbKblpbr
 gSN9BHG7sMP/3RE7/88oMzR4FdJgvPdluDl7eVxQJDkBuYcLRRC0iBowYqTf3/HU4Iz2tjfaf
 5oGbzOLZaqRR8VKWh0xyF+ka2PVl15qksWyu8N3tl0OAWDVuSe3AMJPGUcoMsnsA8cBdnXoIk
 XSjr76NvLmFaVd/DC+f8dCBrqoAgSNt7mB+78F9dr4HirnFyoNQmwgdiKWpVavS1YwiDBQ+xv
 zi03pq2HKrJAeTS6qrXehDaKYjE1FMIkeDssPIitivmjbzexf48KZu/QC2wvk9NHa3TrTXcze
 xQ6kf2wewNpjf6LixLASuxLF8PoaHucpS3oOCONyvZ9qeFpc8kT+i663tS7lgQjbiuICN4/pg
 i+B7bdsrklVYPPF+vLm4cOhXl9zINPNCNY3TNrrD52wRBgwb8+Zf7tOgAHSBwoFn2Pr+x5aAG
 eyCTrYmHP7KJK7ZuWMrwl3GE/h0Ms6wyH65jX1ABJyOzy5CqfwANDJoyX4i1ZZ1QvRuVO0Zt8
 yqVSODQYkx1MyZe2kQlzrSJNj9U4BtPLKB6uI/wa9EcP/dycG1DMHCPswdpnbKqJqMBxGKrcc
 /HHgeZgjqsNMnUgppRToRrHLzH04NwYVdhw1W8EqwVway9uC+TP/qITt2LrMjqmDcEnlB7urO
 W/pgheex2avSQzoIYd8hA0yUqsQLQwLggH3UcK8ETqRIf5Js9YzW3UZlZ3zZV6BqRdmjQvbEJ
 uM4qQM3SLLv5VMlkskEoJKHpELs=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 6/15/23 00:00, Ben Hutchings wrote:
> From: Ben Hutchings <benh@debian.org>
>
> We define sp and ipsw in <asm/asmregs.h> using ".reg", and when using
> current binutils (snapshot 2.40.50.20230611) the definitions in
> <asm/assembly.h> using "=3D" conflict with those:
>
> arch/parisc/include/asm/assembly.h: Assembler messages:
> arch/parisc/include/asm/assembly.h:93: Error: symbol `sp' is already def=
ined
> arch/parisc/include/asm/assembly.h:95: Error: symbol `ipsw' is already d=
efined
>
> Delete the duplicate definitions in <asm/assembly.h>.
>
> Also delete the definition of gp, which isn't used anywhere.
>
> Signed-off-by: Ben Hutchings <benh@debian.org>

applied to parisc git tree.

Thank you, Ben!

Helge


> ---
>   arch/parisc/include/asm/assembly.h | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/as=
m/assembly.h
> index 0f0d4a496fef..75677b526b2b 100644
> --- a/arch/parisc/include/asm/assembly.h
> +++ b/arch/parisc/include/asm/assembly.h
> @@ -90,10 +90,6 @@
>   #include <asm/asmregs.h>
>   #include <asm/psw.h>
>
> -	sp	=3D	30
> -	gp	=3D	27
> -	ipsw	=3D	22
> -
>   	/*
>   	 * We provide two versions of each macro to convert from physical
>   	 * to virtual and vice versa. The "_r1" versions take one argument

