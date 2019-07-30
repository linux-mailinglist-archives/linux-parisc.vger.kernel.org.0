Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB1C7B551
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jul 2019 23:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387860AbfG3Vyt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 30 Jul 2019 17:54:49 -0400
Received: from mout.gmx.net ([212.227.17.22]:37105 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387630AbfG3Vyt (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 30 Jul 2019 17:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564523684;
        bh=JHJbEZbM0oj+MYB+C3Vtftb7anuwgizWfaNzwRJaR1M=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=ZURXZKpfGrtgcHKRPqlFdy++9/nmcS/tOJpkpZbpEZ/q09HkJcxNXBiqqZZMJfAFF
         DifEa645bexPCSQRXUX4ObDZm9+Fodk3O+y3FWkRHnQdKNGm2pNm7AFE+4jrrTOw87
         NyJDTbIeO41e6YSlGyrBCSwKNCxHhk2nLBZDq6e0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.50]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1hvrrs1gxY-003MNF; Tue, 30
 Jul 2019 23:54:44 +0200
Subject: Re: Do NOT upgrade to palo v2.10
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <bff56161-3d9c-d4f1-c1cb-fd04de28eb59@gmx.de>
 <1564522225.4300.39.camel@HansenPartnership.com>
 <1564523273.4300.43.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <a9b20c26-d334-5626-5c59-8942879e374c@gmx.de>
Date:   Tue, 30 Jul 2019 23:54:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564523273.4300.43.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IKcTC3WVZzaibLAkWgikRNFp+kBxUrkN5lxLPWnYRzLi0Z+KNY9
 IhoFbJ0AHNWTf+rAybZrJmCqefV1WtWw1SnZ7v+EcR1N3Ke+XD6Q/EzFdSevhH4B37lqgIF
 5WhLJ/Tx6ctHl4DAq4wFmh1dIQ6tDn8jrFfmNFabvoT/wdC9GP6XfRg1qaxG9g9v4RD6B4k
 aoVjqqAu0fo+R91nztatQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8p70E1CqO8E=:Nb8m+Z3ixIETUU+EUclY6l
 gXd/2hrFJJjoF4z+/rY7SdiwMnd+Fg/HtxEBTJt6zg5HJucrZEKLR6TyHA2OpZq5Zy5OQr5rO
 VLpzXy88simal3M9cFxkKIF0zYeK9fBQ6VVRIQtWU8++iUeTu7xu5bcBJ9zu9ququlXc42Xvl
 fA86mg5qIkX1tZoLV55MyrtOxIUyGDW6HEEnwZFPVyYuoQIkok+DAaLuFDZ3EHePZU64/N7Hm
 zSGEyMGOGvn/V0gsrhh5BKxbd02WESfK8uFjZiBwICn62nnTidrBUQXcXhlCTdSD4KFDWMsAj
 yb1PEZoAOeoWMigSJ2mD80yUfcbEeNddYOvXybl8WOqU09v3Y6+c0Xvf3FCZjh135asIX+WXp
 Rmpuz+nScupPFAZTfGnzrgahg7j5xsQkzVFFyBhMuPnIkkC52OUr6h/xwHAvP6ZGq8crYFX15
 CYIenc5Sj6+4pnWVZ96ayDHTFn4UritKYvt88aGtd+jQmT/IXYVk6VvUpWPuFYjAA7a1ULQqV
 Qyx/3qLZuYQKZIIQ9GyFzfK62/wWy7DbTvUf0YWRBiksruh4FzlNtPJ80A2ODZr5EYJS7Q6rw
 EdQlp2ocevk0sBxMou9WrGLa9e48w7p1hj1QF4U8yrYLef95v37DtQzLGfRB0QcZh44ehsoL5
 xkOEUojY6hu+4eRddRyL3mhIELRwQO3x2iDYcT6j4q/EoOzfoWayWC8rIF0xE62fCIkpxtqa+
 rcjmqdAulPPPBJBFS0xRg8z5dTwgA7/h4MddfIgKhPb26ghyLX//iFAvc6DLLAJYtoa+otzzr
 c7toaBxARpPJDLgvosVCc7s4ynszo1uzCipYaweYuXJDB7exo19fREDoD8cd2b7m89GzQdMvN
 I2TyT+90NW0Zbxi1TwiSp/I/0uWMjdAL68QsbumMhUhTzHIzimW+lSCm+I/yBC6auanfgx9Hg
 oBFp9w5Jq5D6nseMsmL+7Dzd9IuWSWoTvTpwPnhpv471RAuJhv7f6w+cks/kW+2iDvCU4cDEK
 FYQZxflIronkwj+3J+Q7bc0KQZWupLfV1pKQg/SgUqZQ2u/i4sATOfdIOQA8HeC6c/w1D4gdt
 6Iq2tr1RSwW/gc=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 30.07.19 23:47, James Bottomley wrote:
> On Tue, 2019-07-30 at 14:30 -0700, James Bottomley wrote:
>> On Tue, 2019-07-30 at 22:58 +0200, Helge Deller wrote:
>>> PALO version 2.10 was released last week, but it has a bug
>>> which may prevent that you are able to boot your kernels:
>>>
>>> Entry 000e0000 first 000e0000 n 2
>>> Segment 0 load 000e0000 size 8249207 mediaptr 0x1000
>>> Abort: Would overwrite palo 00060000-000f8e30 or data 3faef580
>>> areas.
>>> ERROR: failed to load kernel
>>
>> Ah, that's unfortunate.  It must be an artifact of compressed kernels
>> because my uncompressed one boots here:
>>
>> Entry 00100000 first 00100000 n 5
>> Segment 0 load 00100000 size 508616 mediaptr 0x1000
>> Segment 1 load 0017d000 size 370864 mediaptr 0x7e000
>> Segment 2 load 00200000 size 12026224 mediaptr 0xd9000
>> Segment 3 load 00d79000 size 3850884 mediaptr 0xc52000
>> Segment 4 load 01200000 size 2690120 mediaptr 0xfff000
>> Loading ramdisk 24263780 bytes @ 3e8ca000...
>>
>> which would be why I never saw this.
>
> This is what I'm currently testing as the fix; it reduces the bss from
>
>    6 .bss          0008d8b0  0006b580  0006b580  0000b5f8  2**6
>                    ALLOC
>
> To
>
>    6 .bss          0003d8b0  0006b600  0006b600  0000b654  2**6
>                    ALLOC
>
> Which will get us under 0x000e0000 assuming that's the lowest address a
> kernel can be loaded at ...

It can be loaded everywhere as long it's not conflicting with palo.
The problem is that the released kernels all have 0x000e0000 as
starting point, so if palo is blocking this area we are stuck and
can't load existing kernels any longer.

For the future I think adding this patch to the kernel would make sense (c=
opy&pasted):

diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot/=
compressed/vmlinux.lds.S
index bfd7872739a3..71ccc6796c06 100644
=2D-- a/arch/parisc/boot/compressed/vmlinux.lds.S
+++ b/arch/parisc/boot/compressed/vmlinux.lds.S
@@ -16,7 +16,7 @@ SECTIONS
  {
         /* palo loads at 0x60000 */
         /* loaded kernel will move to 0x10000 */
-       . =3D 0xe0000;    /* should not overwrite palo code */
+       . =3D 0xfa000;    /* should not overwrite palo code */


Thanks for the patch below, I'll test tomorrow...

Helge

>
> James
>
> ---
> diff --git a/ipl/ext2.c b/ipl/ext2.c
> index 31b8469..d8b0c2f 100644
> --- a/ipl/ext2.c
> +++ b/ipl/ext2.c
> @@ -475,17 +475,25 @@ static int ext3_extent_node_find(struct ext2_inode=
 *ip,
>   static int ext3_extent_load_find(struct ext2_inode *ip, int leaf, int =
d,
>   				 int blkoff)
>   {
> -	static char blockbuf[EXTENT_MAX_DEPTH][EXT2_MAX_BLOCK_SIZE];
> +	static char *blockbuf;
>   	static int cached_blockno[EXTENT_MAX_DEPTH];
>   	struct ext3_extent_header *hdr;
>
> -	hdr =3D (struct ext3_extent_header *)blockbuf[d];
> +	if (!blockbuf) {
> +		blockbuf =3D malloc(EXTENT_MAX_DEPTH*EXT2_MAX_BLOCK_SIZE);
> +		if (!blockbuf) {
> +			printf("Failed to allocate memory for block buffer\n");
> +			return -1;
> +		}
> +	}
> +
> +	hdr =3D (struct ext3_extent_header *)&blockbuf[d * EXT2_MAX_BLOCK_SIZE=
];
>   	if (cached_blockno[d] !=3D leaf) {
>   		printf("load extent tree[%d] block at %d\n", d, leaf);
>
> -		if (cons_read(dev, blockbuf[d], sizeof(blockbuf[d]),
> +		if (cons_read(dev, hdr, EXT2_MAX_BLOCK_SIZE,
>   			      leaf * ext2_blocksize) !=3D
> -		    sizeof(blockbuf[d])) {
> +		    EXT2_MAX_BLOCK_SIZE) {
>   			printf("ext3_extent_load_find: read error\n");
>   			return -1;
>   		}
> @@ -504,7 +512,7 @@ static int ext3_extent_load_find(struct ext2_inode *=
ip, int leaf, int d,
>   		return -1;
>   	}
>   	if (sizeof(hdr) + sizeof(struct ext3_extent)*hdr->eh_entries >
> -	    sizeof(blockbuf[d])) {
> +	    EXT2_MAX_BLOCK_SIZE) {
>   		printf("ext3_extent_load_find: extent is larger than buffer\n");
>   		return -1;
>   	}
>

