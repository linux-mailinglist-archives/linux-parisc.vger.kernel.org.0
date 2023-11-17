Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADA97EF4CF
	for <lists+linux-parisc@lfdr.de>; Fri, 17 Nov 2023 15:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbjKQO4A (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 17 Nov 2023 09:56:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjKQOz7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 17 Nov 2023 09:55:59 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4C1189
        for <linux-parisc@vger.kernel.org>; Fri, 17 Nov 2023 06:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1700232938; x=1700837738; i=deller@gmx.de;
        bh=j2S5VsbBOdURQ3/nzf6it0mNsGcPCQJvVimVwo8XZPw=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=f5V3NUds9Y6JcLLUi3Lwr8gwgZjnRnNG2ezyq/zXnRkP6bovuo6A+0IQAgCxDXAd
         RjuIVCMcjKmshHHfw996nHRx1SUa7rY/SPllkKBfcH24yjtA89yM2Ed7WIIAha8uU
         tRyARDvQn5qCIs8mOWJJ2fGC+SbqAIMzPgiuR4wKgooSY7AayxsjlKpyyi3ORtxNV
         IE5mVmt5dAZwYbEg90hNfrRaK4rJ46jna9ljDGTdys/ZRXn5z1HH9i2QN+b7BF974
         Hl185V6JggrEYLsl5UHsBCG6iYL67V0/cAJd2X1o+pgBdI5Zh1CLsCtFszhzexM74
         JFWcUHpN1XJ0Zyn57g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.147.146]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2wL0-1r55eP3YNA-003Oqu; Fri, 17
 Nov 2023 15:55:37 +0100
Message-ID: <0cec0dfb-7a13-41fb-8498-3844102d18a5@gmx.de>
Date:   Fri, 17 Nov 2023 15:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: prctl call wrongly succeeds on HPPA?
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Sam James <sam@gentoo.org>
Cc:     "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
References: <87lebjz9z6.fsf@gentoo.org> <875y2jro9a.fsf@gentoo.org>
 <0fec2446-a523-486f-9df7-4c6af9e2e0e3@gmx.de>
 <7409ec05-7a28-45fe-9604-519de5ae934e@bell.net>
 <cf75a1e4-c269-4530-b3aa-b02a81597acb@gmx.de>
 <b0a524df-9dab-4038-981f-33fc69043c1c@bell.net> <87sf5d8f9h.fsf@gentoo.org>
 <9bc4615d-122b-4c12-9537-b2eddc753a32@bell.net> <87leb58d45.fsf@gentoo.org>
 <7b4b838d-a3c2-40b4-b21e-0e5e73187bff@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <7b4b838d-a3c2-40b4-b21e-0e5e73187bff@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XV2vo2K6LgeJUzoJGRYHjKRAXO7RUM7lrKPNB444VdWs/koLVub
 mqrF25nVMgk2XIzKgw/joJzuKDlbTxlVi4YJinEwZ0WjTO4h8xl+3nRx+MMgm9HvVv95vk9
 zJ1Lrx9Cje22vysSaNhXuubUY+X0U74K7aMt9iNqgKAXHhL6uVXvAMS2eWHzu7h6i2ecUQm
 JXe9kTymTuyQ/ij4ug3Dw==
UI-OutboundReport: notjunk:1;M01:P0:/uV+rtua4UI=;tDl8/XS7KAtrzqUwCnnUouHAa/o
 q98Sd6t/+YR8kKs03ew+A8YzOsMziSEuKpWZZG6muA2arBDFWR9sgXnGsX9i5AdShcdNziJ4R
 ehuoL7U43CNrxQktExzF9jt4KVjnKX05kjM9QTF8fnv3DcYxujSzLSZpGADuSDBBIpi7bY95n
 ip4lLr1K5JrDvHEKU7QTyJL55CEhWL2Ulhhr8DHEV11aNcXGf9+acf1VzAOyTYL4Bt2fLN9HV
 g7TET8I5VNyriEFCJQtghU9YDxhzt2smakWVWzVKat95kca02x0T8CH0ROI5DRMaRwwc0A0A4
 Gh3APrBUp2ZvTttG5tKwjjzj+/L9480oMdqRyMzjyE6wvvIGIv4ImRrXoBUOgR9sGtsklWwSJ
 4QG/qS7woCSaX9j6L6nhm6kEqZ4pVPQU/neHLoxs2bdBn4JazmTr4dqBrzwAFxtpSdy4P5PfI
 u7Q97DtfUqK41lZEwG6BzYKfkH7sVy7hGEnxPl0iZZfEUW3CBizhQuzCJmSgoHhYe3fmCcsKP
 fVjtwjhp1TDLKbH7fkuXE4nAwvj5ZVpLRQRIT7L3piDdyWMt4U4H8qR1Q4tAusDK/5z5Jz2Ia
 /odRy1poiCgkWwnXrwsWwihBjqyw/VsV5SNQOSf1JdEv9TqOaJSG3hq+GzNwdHPZHTsrmaUfp
 K/RqUsbs72g6X6y5WKzwXBcn1nagUOyGBUvqufGTU++JvVzHA1pR1t9dbnZmR20pron1o0ScK
 fGpGQes7lo1Xt8QczsnBNwMwtw67o2atQU+UOKNfl9CT+rFEdZIqa10UpzbNALb0qHYieOfcM
 DxWsL+MxGXSgnHKxV1AjCo0TPb++4XD4hmEGl89A6sPvDTVtVMxH90nR6xb7J0Pa7ymkp2IDU
 jQiVFMX9s7ayPTzKf9RCO3My0XN/L2cPsg4pBDTnsQVmql326b76+Nk/U3kDaiPtWQcQqzhU2
 JjEQ/k7xoF5R/zCh/pafn5NaU4s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/11/23 00:02, John David Anglin wrote:
> On 2023-11-10 5:16 p.m., Sam James wrote:
>> John David Anglin <dave.anglin@bell.net> writes:
>>
>>> On 2023-11-10 4:32 p.m., Sam James wrote:
>>>> John David Anglin <dave.anglin@bell.net> writes:
>>>>
>>>>> On 2023-11-10 3:38 p.m., Helge Deller wrote:
>>>>>> On 11/10/23 21:12, John David Anglin wrote:
>>>>>>> On 2023-11-10 3:01 p.m., Helge Deller wrote:
>>>>>>>>>> On=C2=A0HPPA,=C2=A0we=C2=A0still=C2=A0need=C2=A0executable=C2=
=A0stacks,=C2=A0so=C2=A0this=C2=A0option=C2=A0doesn't=C2=A0work
>>>>>>>>>> and=C2=A0leads=C2=A0to=C2=A0a=C2=A0segfault=C2=A0on=C2=A0boot.
>>>>>>>> For=C2=A0kernel=C2=A0we=C2=A0don't=C2=A0need=C2=A0it=C2=A0any=C2=
=A0longer.
>>>>>>>> But=C2=A0there=C2=A0might=C2=A0be=C2=A0dependencies=C2=A0on=C2=A0=
glibc=C2=A0version=C2=A0and/or=C2=A0combination.
>>>>>>>> So,=C2=A0I've=C2=A0currently=C2=A0lost=C2=A0overview=C2=A0if=C2=
=A0we=C2=A0still=C2=A0need=C2=A0executable=C2=A0stacks...
>>>>>>> FWIW, I recently changed gcc-14 to enable GNU stack notes and fixe=
d a bug in the
>>>>>>> 32-bit PA 2.0 trampoline template.=C2=A0 All execute stack tests i=
n glibc now pass with gcc-14.
>>>>>> Yes, I saw your commits.
>>>>>> So, any code compiled with >=3D gcc-14 should be fine with non-writ=
eable stacks?
>>>>> Not exactly.=C2=A0 An executable stack is still needed for nested fu=
nctions.=C2=A0 They are still called
>>>>> via a stack trampoline.=C2=A0 The GNU stack note indicates whether a=
n object needs an executable
>>>>> stack or not.=C2=A0 These notes are collected by linker.=C2=A0 The g=
libc loader determines whether to setup
>>>>> an executable stack or not.
>>>>>> It would be easier if it would be a glibc dependency (for distribut=
ion maintainers)...
>>>>> I'm not aware of any glibc dependency...
>>>>>
>>>>> I think once gcc-14 becomes the default compiler, we will have to en=
able GNU stack notes in
>>>>> previous gcc versions.=C2=A0 We will still have executable stacks un=
til everything is rebuilt.
>>>> We will need to update that default in Binutils too, I think. That
>>>> configure arg is working OK for me, but I did not try systemd yet.
>>> Currently, there are no architecture dependencies in the ld --enable-w=
arn-execstack and --enable-default-execstack
>>> configure options.=C2=A0 The -z execstack and -z noexecstack ld option=
s can override the GNU notes, or lack thereof.=C2=A0 We
>>> may have to fix some assembly code.=C2=A0 Maybe binutils should be bui=
lt with --enable-warn-execstack once we switch
>>> to gcc-14.=C2=A0 I don't think we want --enable-default-execstack afte=
r switching to gcc-14.
>> Are you sure? I just did some more digging now...
>> * It looks like targets can set elf_backend_default_execstack in
>> bfd/elf-*.c to override the default, see e.g. 81cd0a49c9e5f28c0fec391e4=
49ea3272077c432 for cris.
>> * See acd65fa610df09a0954b8fecdadf546215263c5d where HPPA's default got=
 changed.
>> * ld/configure.tgt still has some suppression for HPPA's default for
>> warnings.
>>
>> I think we may need to, in due course, set elf_backend_default_execstac=
k
>> in bfd/elf32-hppa.c, and then drop those bits in ld/configure.tgt too?
> You are right about both.=C2=A0 We have in ld/configure.tgt:
> if test "${ac_default_ld_warn_execstack}" =3D 2; then
>  =C2=A0 case "${targ}" in
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # The HPPA port needs to support older k=
ernels that
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # use executable stacks for signals and =
syscalls.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Many MIPS targets use executable stack=
s.
>  =C2=A0=C2=A0=C2=A0 hppa*-*-* | \
>  =C2=A0=C2=A0=C2=A0 mips*-*-*)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ac_default_ld_warn_execstack=3D0
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>  =C2=A0=C2=A0=C2=A0 *)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>  =C2=A0 esac
> fi
>
> We also may need:
> #define elf_backend_default_execstack 0
> in elf32-hppa.c at some point.
>
> I think when GNU stack notes are present, they determine whether the sta=
ck in an executable will be executable or not.
> But I could be wrong =F0=9F=99=81
>
> I'll try building binutils with gcc-14.

Did it worked?

Btw, I added a small section about executable stacks in the TODO
section of the wiki:
https://parisc.wiki.kernel.org/index.php/TODO#executable_stack

Helge

