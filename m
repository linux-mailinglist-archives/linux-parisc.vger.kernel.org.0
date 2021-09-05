Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2484011DB
	for <lists+linux-parisc@lfdr.de>; Mon,  6 Sep 2021 00:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhIEVmw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Sep 2021 17:42:52 -0400
Received: from mout.gmx.net ([212.227.17.21]:56579 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238291AbhIEVmv (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Sep 2021 17:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630878096;
        bh=8AKypt1MSfKOdP3iVFRJMuaqSuf9ik5pSyfdp0YOQMM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=TObJIA1ASvfU6LemLYkmj0KzwO8Kzi0N4vHeMNLaWOAWcXIdpQKVYhsFSuVJO10sI
         3ZAJV/xmoUUPKo0xoY4aLzGM84w3SgeDghOD9WMPJkylukQrD5u2zUATppYlbg9vCD
         GP26AfO+OZ67irMq/1Q2kwn4dZFyCQVr6hqv4vlg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.147.61] ([80.187.121.82]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95eJ-1mzvhX0z8J-0165Zu; Sun, 05
 Sep 2021 23:41:36 +0200
Subject: Re: [PATCH v2] parisc: Fix boot with kernel v5.14
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <YS6VGsZ7fZtZeu/i@ls3530> <YTDaZAMvAipdvkaB@ls3530>
 <CAK8P3a0zwnEUK_ztPRBx0H9VGBoPVY-+aASFV97zSKrL=diXUA@mail.gmail.com>
 <51d6b8cb-a64f-0cf7-1545-4c2fee89799e@gmx.de>
 <CAK8P3a3oJo496dXpAWHQKG=Sdr+RSfScYbWKyGrk8HNfH5G1CQ@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <41e38a49-5a11-4f93-6771-b67d8184a673@gmx.de>
Date:   Sun, 5 Sep 2021 23:40:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3oJo496dXpAWHQKG=Sdr+RSfScYbWKyGrk8HNfH5G1CQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JAAEP01fNIo3K89c+w2/tPX/9l2sqFe/qtDoLNkvR4FO0+szt0Y
 E5dISmPME94IzkxbYV1YeZdkqbp8Ncpo6z0+FAGOJmGIy+A+UrSIxz+ls1vU/bHmawsEVWY
 5XyE5jsO2fl/1l6Qn+BMh0nTjxf6L/MCnlM7XMDsATFZj9NahDuOxz/38eXm11Ff4ZxrPht
 dCUUfOkmoKxpkvi42a+yg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ofs9fEaapQE=:Y1NYuMYbI3Q9El4nhLHYi5
 6ILOezsFrJZdKUisAZgpi+uLi/U11hyT3B/Ul6i8QIK5jULVz2hVq203bYVNQeo1LIaLFoUwK
 A/O7Psz5ZN3jxQwb4gemIrkRZaeoH9OlarcPn6E75bm7Q5yd7JZxZ3oJRAMjDjda84mkjNVjY
 Oqs64tNBQIPrqbn8CivTzkSiFGITVAkwYI9S//MJaQG6cgeDYYmZ1Uv49gFdNN8daWHBGn552
 Nz/etEoGiDf/RgGX6WVfzOhYSVFf19vfcC6ki0mqqP11WWY7l/YUjGRBoHEnqJo1twHyEzsKe
 VZ34l9kNzbVzaZjlBdukdJlwRTrn7vyi7SfMtUVuQazYqptO0ZVhT8QZstIeeFQLxuprsygMG
 +Byse0EsvKoKowHA68huJzv8b1anAphIQ8LYKr9L4vqqoVLPxSqV3av977kAfToiHoBv0/mDb
 UNsjBr9FrzCiX9x2LNtK8pMiBPcm4FSDI2JGM3XlQDaK8+iMlZUBmf7h2BVZp69XNkrOhIs4e
 JVKTnLwHhOg9VWP/KxYLBtp+EPmK6cqAh0ayyv3XEXHHIkVXOVsa3X4y+Nc2DDYBxBj7oFRjV
 zqnsA8cF6TecemLTbRAoFlIWKZKZjtFikUhOvfws++Pa62soiFrHuXQo4N0TrYH47OqdVczz6
 7wht6ka27niaKVHbx71BwJKazjx142lO5c5Dz4JpOQWa+FbgBst8HjjuZw9Yjze2LBZ2F3U08
 cFGhErTGivUXjrwnJxzVQRKyjgKwnAxFxZtynl4hBbIdZCPVaQ/U+VQMDT+OZuKv8Ikh2d/AJ
 NLscl58xwTqNd9p5me4pTNYhFUR4SJx7e5pkFIgqG/k3Zs81ITuPW3IfE9P019V3RVWrOpd8/
 DZkxXIkTAqholcjXcaQiOPBI8J+e6GkRkgGlRp8KMy8MUhjLr2cVSKzWfjht9HrkFFeue2wva
 xmBtk9+j/IE9su44WdxCuZg4+9xF6o6nYFb34ldgVKvWle4OEgrOojzrhQdCNHZXnxiDlStFX
 PFL665ak/uBIdatt4uiUsdKWPrqrL6mznSEdPn1TKpXpnd6Cc/LmisnTrQIAnyO6m33ztXiNh
 QBBcddQo2goUpmS3u9PQbrVDbmMpKMUy/beu0XeLZy55qZiRNmF+6HoLw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/2/21 10:41 PM, Arnd Bergmann wrote:
> On Thu, Sep 2, 2021 at 9:48 PM Helge Deller <deller@gmx.de> wrote:
>> On 9/2/21 8:35 PM, Arnd Bergmann wrote:
>>> On Thu, Sep 2, 2021 at 2:06 PM Helge Deller <deller@gmx.de> wrote:
>>>>
>>>> Kernel v5.14 has various changes to optimize unaligned memory accesse=
s,
>>>> e.g. commit 0652035a5794 ("asm-generic: unaligned: remove byteshift h=
elpers").
>>>>
>>>> Those changes break the bootloader and other places in kernel for par=
isc
>>>> which needs byte-wise accesses to unaligned memory.
>>>>
>>>> Here is an updated patch/hack which fixes those boot problems by addi=
ng
>>>> a compiler optimization barrier. More info and background can be foun=
d in BZ:
>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D102162
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> Right, this should fix it, but I tend to agree with what Andrew Pinski
>>> said: the existing version is actually correct and allows valid
>>> optimizations on static variables as long as those are correctly
>>> annotated in C.
>> Let's look at generic kernel code, e.g. in fs/btrfs/inode.c.
>> You will find many similiar cases all around the kernel.
>> ------------
>> struct dir_entry {
>>           u64 ino;
>>           u64 offset;
>>           unsigned type;
>>           int name_len;
>> };
>>
>> static int btrfs_filldir(void *addr, int entries, struct dir_context *c=
tx)
>> {
>>           while (entries--) {
>>                   struct dir_entry *entry =3D addr;
>>                   char *name =3D (char *)(entry + 1);
>>
>>                   ctx->pos =3D get_unaligned(&entry->offset);
>>                   if (!dir_emit(ctx, name, get_unaligned(&entry->name_l=
en),
>>                                            get_unaligned(&entry->ino),
>>                                            get_unaligned(&entry->type))=
)
>>                           return 1;
>>                   addr +=3D sizeof(struct dir_entry) +
>>                           get_unaligned(&entry->name_len);
>>                   ctx->pos++;
>>           }
>>           return 0;
>> }
>> -----------
>> According to Andrew Pinski's statement, the compiler will assume here t=
hat all of
>> those get_unaligned() calls will access naturally aligned memory and I'=
m pretty
>> sure the compiler will generate native 4/8 byte accesses on all platfor=
ms.
>> Most likely you will not notice on most platforms because it will get f=
ixed by
>> exception handlers or natively in hardware.
>> But anyway, it's not what the developers intended by adding get_unalign=
ed().
>
> No, this case is completely different: 'entry' points to dynamically all=
ocated
> memory that gets passed in via a void pointer, so gcc has no knowledge o=
f
> the alignment of the underlying storage, and it will do the access accor=
ding to
> the __packed constrains in the get_unaligned() helper. When you look at =
the
> assembler output for this function on a 5.14 parisc kernel, I'm sure you=
 will
> see the correct byte accesses, just like the trivial example I posted
> in bugzilla.
>
> The reason that the "output_len" access breaks is that gcc explicitly op=
timizes
> the bytewise access  into word accesses because it assumes that global v=
ariables
> are correctly declared, and that they are aligned according to the requi=
rements
> of the ABI.
> This may be surprising and even unfortunate, but I can see why they did
> this optimization, and that it helps in other cases as well.

Arnd, you were absolutely correct and I was wrong.

It seems to work nicely now after I changed the output_len variable to
become an "extern char".

Thanks!
Helge


>> I see no chance to change all those places in the kernel.
>
> No, that would mean changing all get_unaligned() accesses to pointer
> dereferences on types that are declared as __packed themselves.
> The get_unaligned()/put_unaligned() helpers generally do what they
> are designed for, it just breaks when you have misaligned global
> variables that are created by a linker script.

Yes.
