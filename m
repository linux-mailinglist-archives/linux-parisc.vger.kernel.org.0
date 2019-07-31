Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 647AA7CFE7
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 23:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfGaVNu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 17:13:50 -0400
Received: from mout.gmx.net ([212.227.15.18]:37073 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726096AbfGaVNu (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 17:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564607620;
        bh=dOXhgfY8JE7KkChBUBbHj957QP4Hf3hnA5aGpa/7PB0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=k89QMkEY29FhAaK2szboCEfaiINGjo8oGUqay/ZWHbTmC/b2bU0y5l7Dt0qoLL+HO
         0hpe5VhRM6dNZosBUabm8F9JbWNNzwB7U/ouZ+AC115MWsvTez8MfH7vwLtMRuDam4
         qgXovk8kl3/oQB4hNM5mWkgX9RBGVzZRRIitl8Qg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.24]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MBmvH-1i2ahP1XRX-00ApIZ; Wed, 31
 Jul 2019 23:13:40 +0200
Subject: Re: Compressed kernels currently won't boot
To:     Sven Schnelle <svens@stackframe.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
References: <1564591443.3319.30.camel@HansenPartnership.com>
 <20190731173016.GA23520@t470p.stackframe.org>
 <1564595402.3319.40.camel@HansenPartnership.com>
 <1564602012.3319.45.camel@HansenPartnership.com>
 <20190731194413.GB23520@t470p.stackframe.org>
 <1564606894.3319.72.camel@HansenPartnership.com>
 <20190731210819.GE23520@t470p.stackframe.org>
From:   Helge Deller <deller@gmx.de>
Message-ID: <4a79ab9c-c791-0c61-0664-60eab3567125@gmx.de>
Date:   Wed, 31 Jul 2019 23:13:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731210819.GE23520@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wEiVfUXmvp9RMMZKFqiEPPXF1I7pSe+uCBMk5vLgCriNgxe42q9
 7s1ZGk5e48AEAMF545MdUYM+IgxEKB1+GBNSDjH/DzABVdeVhS8iuFrvyGQAYGK9XYYU93k
 AiWjU1IdyEWLtYFU2+uE2LgAfXqU6nM3GRpKzcyMfBg+a8CXEi5uKxoa8jPHH2AJwjb1SNH
 HQlZ2uBdc8ukPkvp8OGdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RjX6qADiTtY=:aYJLMmzmpV7sUCf+8F+VQC
 7IxT3hRrbv5g0RFg9pwSJUft9GCAeo4qparm8ZESsSrXAs3PvcxjYzd+0ME70bAj71GPLS+mi
 4fqMTQtECTJAP6/Gro0EffmK/YbTijFJ6pQmhs9hGxr+7IR9LvEy8znHRWgyV3rMP+to1LzIn
 gQuL2+cwmBI78Sbn/v/hv0Yb3r1VcfQAh6J80fb70mG1GSP+0pldGCSXjxp7Yz57hcTQbwrp+
 AKHJ2lVLgy2k8Gxom8lrXzz+f8q26k6V4bHsp+w4U29bLW5gEV7knu4lx3SzG7zb3N1uTju3D
 HMnyv3zs6ybgFxqH7YQpe/gkP2cShdmoaT3LleGgauEC5Np4Lu22Hk3X1iLzPv5O6O1Ajrr3h
 AoAbhOZNUGUxlxSt5JzNJeUfEwh5tw+QFIS/ZUM0nsxhsxEU4kSpCWr9QWhjTGsthE1LhMcN/
 vvZ8dMa/f4kwIH+chD1TssOH7BQeq5ONi8m844lIbF9/4rXedey5PrI0TO83R1ZHgyc3eCDGB
 jxfFVH/AJF1oVAL0vhhggE9rkUTHmIlpkZA9Ez2F6/0twxtQNANnsfLjhORm7TtAH3wIUbxf7
 SKH11ggGJenUR5EmsX97muFRTa/od0vTmJNOg0AotFTD+VspJ4uK3EuKLEplzL8OH5wEpV8za
 R9Oysa4s3qAo4r2BmVvCDFCz+9+tg7pSJpbP7mJ0X7qCQv9nRuyM9HAd4BImlTFyNbQa1muFp
 +JEV/t87Xk3QLWiMk4aXs1zn/DtWMse0fdq9+s00a1hkrR8fvQP25afr1HSw+bcyWkiTFZqaf
 j+7fOZ8CStG5LtJZbJFqsJHsLZJ1lnCW9yG/q+sOi6PVDsypNUhbxqMA1f6FT3Bsnflnsj6XA
 r+ytK8MtDklFLaE2ycL8GS6hOV5ncu13B4kJjGXDLgP0EMr9MUDRiYVGZFzEsajZZm171LzDx
 U6Wblv0OnRTsWwpc9Q0STJgnrJfDy2/AL4TI1iQwg6BlQtg4F1os2lLdVHfYL0WzjaKKQZ6/c
 9YU446KMPcImfpfxUtF3WSG1TbvdHfDIqGDmoMFXmaM16dH2SSv/NaBxucSyjC07Do6m0ez5q
 S+DILxuehQ/LAo=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 31.07.19 23:08, Sven Schnelle wrote:
> Hi,
>
> On Wed, Jul 31, 2019 at 02:01:34PM -0700, James Bottomley wrote:
>> On Wed, 2019-07-31 at 21:44 +0200, Sven Schnelle wrote:
>>> Hi James,
>>>
>>> On Wed, Jul 31, 2019 at 12:40:12PM -0700, James Bottomley wrote:
>>>
>>>> What about causing the compressed make to build both a stripped and
>>>> a non-stripped bzImage (say sbzImage and bzImage).  That way you
>>>> always have the stripped one available for small size things like
>>>> boot from tape or DVD?  but in the usual case we use the bzImage
>>>> with full contents.
>>>
>>> In that case we would also need to build two lifimages - how about
>>> adding a config option option? Something like "Strip debug
>>> information from compressed kernel images"?
>>
>> Actually, I just looked at what x86 does.  It has this in the
>> arch/x86/boot/compressed/Makefile:
>>
>> OBJCOPYFLAGS_vmlinux.bin :=3D  -R .comment -S
>> $(obj)/vmlinux.bin: vmlinux FORCE
>> 	$(call if_changed,objcopy)
>>
>> So it basically strips all the debug information from the kernel before
>> compressing, which argues there's no need to retain the information
>> because x86 doesn't bother.
>
> Nice. So we could convince Helge by saying "Look, x86 is also stripping =
it"! :-)

I'm fine with doing exactly why x86 does :-)

Helge
