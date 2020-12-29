Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308EA2E72E5
	for <lists+linux-parisc@lfdr.de>; Tue, 29 Dec 2020 19:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgL2SFe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 29 Dec 2020 13:05:34 -0500
Received: from mout.gmx.net ([212.227.15.18]:43053 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbgL2SFd (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Dec 2020 13:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609265034;
        bh=AVmtbHl8OFCgfNryGIqBpV6ojvic5g4vHD3qYxdUdWk=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=KRWyakfBaxXSjjuHkEwOFZMA62joXu4rWuWagTxt1grCRJxw0ERCNTutha+W9U1cw
         Wc2RKQklR9i7enyes8EK46+AC6L6js6vQsRVdUvCqZ/2vsjcJfaB9GzXfrwRf9GVfH
         3/yP7d11JVcGD5HSwc3eJTfI3CVvZ1AoFG+N1FVY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.132]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzay-1kTG3M2IXi-00R4F5; Tue, 29
 Dec 2020 19:03:54 +0100
Subject: Re: [PATCH palo] remove useless files from directory listing
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <1966d5a160c16fffce4cf67466637f00f6aee3f8.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <a5a241ce-46be-ad86-1e22-450bd41912e4@gmx.de>
Date:   Tue, 29 Dec 2020 19:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1966d5a160c16fffce4cf67466637f00f6aee3f8.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+XSBwTqwnzuCLVeBVu9X/oqwnDVnuMg+m4AEzsT2l1fW1zEMTqw
 B1R4TQAWs5ldMQF6tOyVZatLhsCLC78XfK6M2jum4MOU0KwwH+m3ylVIlJKGGDPNljkxNZO
 MI8/hm+yz6/3vsNx8A+5kS5odNx/Ar/LK5JLLDfDdgzrIG9o+zqOJgGy5b8HoXh/iZ4dW7/
 lfIpIvHJgw+/EUyPOJiEQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cz+9THlIEOc=:rC6/AdcXNZHLAikCUkIzZo
 gFxkEf0aEtGIBp5+iLBFpX7lG3IOcRQXEu/4wOX+Ix5PQ8oH/ocQkZUOYJCZUulppiyjUb/AI
 UbYSzpHxWdZFMgwTcIkqfDK5wM0CYWRItA2OTJZXxSd2xfBaU9Gc/O4ofbIQFHUKy/iSU6jGS
 iQkrTMA8IxQkbxjbWHR7oM/hjDvgeKQ8KQcWpNYpJW6F/dfMTGLVCRc/EskHwwHm7vRK0+pmB
 QLBfXR2sfhnSuGKHC/eQj6qOigPbjLHjpa5PM/IHZdWXlw0bKbhDQ2XoYUGewS7crBvKKGPck
 Tsr3plWnoklBXpWIeIYZ3M9rsu/IThVmt/z/XAxUc/+9SAJx7ikHdonf0SJM8cLhOMGaBcNBQ
 4pr6nzc3j4Koff146kEEHSCXPhQ43VXYe+mChtHPhAbQKlSbUCeGMBVfpL+E3NjlKuq9GK2Kb
 6fag7yjSlb85pM8LeCxxBMREgyUozNLqrQCc5FDgU2KxzXfp1Q0X74TkkbZo0oRhx93wdfHSL
 YuFrnLvEMarzskMm7TeHFRqYovGfaKx/gIbowVLXPksQbU+yQ8LtR+il8Fek51t/WVH/sdus3
 VpbT7X7Sxis8978QxwEKtQ7GAlcfIj1IYpXi1hPEzjbfNyQFpccu+wx3mHp076mehbKQ+8E2n
 wJcEN3LCD2sefDjrW7bJqQrI8lrCjor9CHKnThLpVe2G4phFfd53M88Mdjx3kqj3Htf00jd1+
 jNpvPUge7BSz/Iq3FOzD5mXD5dgTEG+Tp4ag1STJKSjJkmVvQ+fgN09Tnz3gnjZHXBXlaRHVv
 nhqtMuk80vmsYyRMqgHfdGVF7qeJZ394MmUzMXSL58NPduWiZCQx3xgSPsMaIWo0GHPfvPION
 ZKg1XqAMedx7aQ7t/SLg==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/29/20 6:54 PM, James Bottomley wrote:
> The directory listing command 'l' currently shows deleted files plus
> other filetypes that couldn't possibly be booted.  Eliminate deleted
> files and make it show only regular/symlink and directory entries.
>
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

Thanks, applied !

Helge


> ---
>  ipl/ext2.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/ipl/ext2.c b/ipl/ext2.c
> index 86b8259..8a96b9b 100644
> --- a/ipl/ext2.c
> +++ b/ipl/ext2.c
> @@ -728,6 +728,7 @@ static struct ext2_dir_entry_2 *ext2_readdiri(struct=
 ext2_inode *dir_inode,
>  			return NULL;
>  	}
>
> + repeat:
>  #ifdef DEBUG
>  	printf("ext2_readdiri: blkoffset %d diroffset %d len %d\n",
>  		blockoffset, diroffset, dir_inode->i_size);
> @@ -751,6 +752,15 @@ static struct ext2_dir_entry_2 *ext2_readdiri(struc=
t ext2_inode *dir_inode,
>  	dp =3D (struct ext2_dir_entry_2 *) (blkbuf + blockoffset);
>  	swapde(dp);
>  	blockoffset +=3D dp->rec_len;
> +	/* ext2 deletes a file by zeroing its inode.  We skip deleted
> +	 * files, corrupt entries and entries that aren't a regular
> +	 * file or a symlink */
> +	if (dp->name_len =3D=3D 0 || dp->inode =3D=3D 0)
> +		goto repeat;
> +	if (dp->file_type !=3D EXT2_FT_REG_FILE &&
> +	    dp->file_type !=3D EXT2_FT_SYMLINK &&
> +	    dp->file_type !=3D EXT2_FT_DIR)
> +		goto repeat;
>  #ifdef DEBUG
>  	printf("ext2_readdiri: returning %p =3D %.*s\n", dp, dp->name_len, dp-=
>name);
>  #endif
>

