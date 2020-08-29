Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECED256777
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Aug 2020 14:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgH2MXU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Aug 2020 08:23:20 -0400
Received: from mout.gmx.net ([212.227.17.20]:49345 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgH2MXK (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Aug 2020 08:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1598703754;
        bh=UDnLXURZAZAVrNX9nP8f1REhbgfrcc5cbjafczhe4UQ=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=SGaxfFCMO5UeUmhdbSfxIMymxXJIh5MzCkW28DJp5GE/S35Psg1g/T8tiQAcnuI/a
         S++KSfUI5U5sXiTWsBSqHP4J/FOFLxPL2L49gvGjgcAVSv4KMCIsHl79HYVd29Epf7
         RsmYBaX4E/ZqKUsKOpGiWOVDx6e/zq4IYsEen+Dg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.105]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacSY-1kiZjk2WwE-00c7v6; Sat, 29
 Aug 2020 14:22:34 +0200
Subject: Re: [PATCH] parisc: Drop HP-UX specifix fcntl and signal flags
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20200829105112.GA863@ls3530.fritz.box>
 <8645899.CDJkKcVGEf@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <ac0aaa25-2314-e580-c70c-93cf4700c764@gmx.de>
Date:   Sat, 29 Aug 2020 14:22:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8645899.CDJkKcVGEf@daneel.sf-tec.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CCns4jO9uHXwctbB1m44q6JoOt1HhyDfN"
X-Provags-ID: V03:K1:3umfbtBAijX8W2GJAlUnUs2ziqiKE5/nOLAT8YfkJ/DvBF/I5Dt
 Zf8p0miq2QkMJz8/knK+Lq9gfKT8YXyUngLDXNQdtlwZZQ+pyupMhsJw2MTKPsrIZ9Dyd17
 BAoBFuVIuztgbqnnMzDH5mZkCwbmS89qM1l+jlPc/ADU1vctALqcr99doq6NHcKe4xT/VLj
 IIHlT/Qe2xLPk2FLaRG/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vkNBws4ZXGg=:IZ1g+MNjLGhSa2wapuO8fT
 3MrEUgTU4GqKbziHPv8z9GQQ64Bw+QYfyVE3HobbEZKPpzMsac8D/f2F8CiRtJKgVKt+7aBe/
 5f9T0xBaFfTICtYXQ0nWIQySgUdmHJBEmlCnUQ6giyRk6F9fBvJkoFjFTQ/EUk7f07DzeuVxo
 wkkzJcrCgn7EH13anhcU6r+7Vens/CLJ5IXFbrJgcR7pcQvL+EB3z4wtHMDCbBbLJyXNc7gke
 lmpFxDr5h+W/yXFLQ7XP9x61eMBZSzMtjBsWG6aftxQwVhgl9JD2T+yMRJ3q7eNyHGofy1j8g
 pK3XhCaBYizbb9HglXn6zXaaNLLuJObTFB7UezhwDOfUUxd/VtHPBu4Rm/AyXfftzc0SPp/Cs
 VPoK0agkItK+8271G4VLMnivNx+9kzQJidpF1rgCsVHY+1UvJnqwvhNfTwya1WCsttCYB3sBW
 E0+hAo/uDJlJr7tdSkkZhi3DxpEYGzptrmpXdcEamn6hYZ+D0tGGKUsKiHdOl9Ea+OGnD8x9q
 eqcI3r0eXW2OSkcuHH0XBen9CzfcpwKo2kpqqIVeNqBpihFJX5CIfV0jCpjDYc+b7W5DpglWL
 aBi++HLcOUKkt+Kd1g3XrlqmnPtkhAkANCG+El5UZtz4PR7RAMMYa79EQkvbzR3Qg5Fp2CNTo
 zSdN7DaKMab+/dgVjKOjs1wErF/3fdabPTqC18jElLOthZh0F2WpyovgvyN3p3THPsaU0ARNc
 31kpG10CUvCT7FpUyWKKqfSvvYlvp/iUTVsy2lY/Wl0A+sLHVwR7+W2ofUftFBg0udlhPnn+O
 c/eFNM0Vxfy0ypNkz53jvO6RWfvYimPhk62c8Ak9QEB/dFkUFHSpkZ5rX26iW1CFKbtFLcdJc
 2KLAzGZ8QRbO4/7zg/nmGGrPQbntGYGuY8s6izL9z/Z9UF428xlmCyyDu9Wt0+jKnmFqu+mOu
 VquIFkjUba6ycT6zSQCBssS+Ud0zNGS8NdZofztxp96faL2KHsy0dL4CIgc89zdyclckL3/5w
 EQTzMmz1hkdapMm8vgswGoWLn7AKBvN/LFgmU5fYJ0OO+77EDYLx40J2c3qd5F1Vwkf56dZw7
 SrYYK6/UehXPggtooZh4MrmcVmdgRedcWZlPCBdq4bv0X7U52BfVcTmr7aV1wR1HgepSvbXgX
 RnSIrZc38l/mMt50cHTiBgg5PVFzF4JGgP07dOCb5Ltp2HGHWaNoNiQ6OBCblIyVmEIvwkmfN
 iutTqY+ivXJnu/pMO
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CCns4jO9uHXwctbB1m44q6JoOt1HhyDfN
Content-Type: multipart/mixed; boundary="YMwj5f6gwm56R3zkeoHD1TuVr80h7LwJj"

--YMwj5f6gwm56R3zkeoHD1TuVr80h7LwJj
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 29.08.20 13:26, Rolf Eike Beer wrote:
> Am Samstag, 29. August 2020, 12:51:12 CEST schrieb Helge Deller:
>> Those flags are nowhere used in the Linux kernel and were added when w=
e
>> still wanted to support HP-UX in a compat mode. Since we never will
>> support HP-UX, drop those flags.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/include/uapi/asm/fcntl.h
>> b/arch/parisc/include/uapi/asm/fcntl.h index 03ce20e5ad7d..4289ee732c4=
c
>> 100644
>> --- a/arch/parisc/include/uapi/asm/fcntl.h
>> +++ b/arch/parisc/include/uapi/asm/fcntl.h
>> @@ -3,7 +3,6 @@
>>  #define _PARISC_FCNTL_H
>>
>>  #define O_APPEND	000000010
>> -#define O_BLKSEEK	000000100 /* HPUX only */
>>  #define O_CREAT		000000400 /* not fcntl */
>>  #define O_EXCL		000002000 /* not fcntl */
>>  #define O_LARGEFILE	000004000
>> @@ -12,13 +11,11 @@
>>  #define O_NONBLOCK	000200004 /* HPUX has separate NDELAY & NONBLOCK *=
/
>>  #define O_NOCTTY	000400000 /* not fcntl */
>>  #define O_DSYNC		001000000 /* HPUX only */
>> -#define O_RSYNC		002000000 /* HPUX only */
>=20
> So, what about O_DSYNC? Either it should go away the same if it is HPUX=
 only,=20
> or the comment needs to be fixed.

That's true.
I had it fixed already in my git tree:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/c=
ommit/?h=3Dfor-next&id=3D297f57686b3f634306b6a67a90d5a146392693c2

Helge


--YMwj5f6gwm56R3zkeoHD1TuVr80h7LwJj--

--CCns4jO9uHXwctbB1m44q6JoOt1HhyDfN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS86RI+GtKfB8BJu973ErUQojoPXwUCX0pIhwAKCRD3ErUQojoP
X64vAP4vHflDwuXc6BtLkE0o/f65Z7irt5neMMmvhs7gC3TgawEAmfXMrxa0pQ0l
KxsCkgf6i0B05zWwGn8t1DAUVhQAOws=
=1j8g
-----END PGP SIGNATURE-----

--CCns4jO9uHXwctbB1m44q6JoOt1HhyDfN--
