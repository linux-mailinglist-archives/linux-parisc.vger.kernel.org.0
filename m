Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07CB3035AF
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Jan 2021 06:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbhAZFuX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 26 Jan 2021 00:50:23 -0500
Received: from mout.gmx.net ([212.227.15.19]:38925 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730373AbhAYT3o (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 25 Jan 2021 14:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611602850;
        bh=F8zD3Fsy7SeBrsfRr+TzL4jP+tXaP7W1JQVw7TEI5Tg=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=UyKgn1KpZxShqptfnVGFkOhwiExRjoDf2QHupx1rqnCq+iGsQiRIF0/rullJiUZTf
         I4WdvebZL6P9Rgd4RnWuAKbQY63Jfkm3CkYyjfn9HtEQuDUrrUsXVO+nfWyi4rk42F
         ghAEfJc1ZULyXpZX3Ib9jXVP7eIMPp2jy6K0DVOo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.109]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdeR-1lFxt10IOT-00Eg1Y; Mon, 25
 Jan 2021 20:27:30 +0100
Subject: Re: Signal timing problems in python testsuite
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <5448233.DvuYhMxLoT@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <38479b0d-011d-bf53-c95e-4dfbbd824670@gmx.de>
Date:   Mon, 25 Jan 2021 20:27:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5448233.DvuYhMxLoT@daneel.sf-tec.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uGEIEjYK4Hs76rFNuymf8zamwsxOw0ios"
X-Provags-ID: V03:K1:InOTsaenMhpmZ467e416eqz30W211SoyvySxrqQnpeAHDXiUvSg
 fw6H37GGgyFSFVzE+VKHlRGAhiaYVl1sQr8RDMIJigCg/rS1D9js4Hw7nzNGzi2l1+R07oQ
 e/LXE8C3A5lfsMtmPVstNxkpzIRMNxxNZEvaHdlz2RV4CnW+TTRfW2MO1V/1A4yepoFzNYt
 J0qstjWJLwkZhWY/M6Imw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:w8vvxiWPYZA=:1Chw2D32t6QDddZQ4r/I3j
 6FNDCPtyo/bQmWOr+iHJEWUyolhZ3FR7SAWYY0FL4+kkf4wE/S1YOqw3/U6oPo0OK1kqYvwGw
 HhFUcnFUsZyhicYdHJeWhW+lnwcpYZ6sdSCk1iRM6vyAE4Bp8Wi1M2Ftfp3wtirpJxl3zZ2Km
 YBDptyQCAvPnw6MsPt9NKYgdWyQsFKOH5mWeRkqtcxoZgWn1SO9GYptopobh5rZG3Zr9ZIA9F
 awgPTOYgN14J0Ic25PzqovA69fvgaa5/RKiQeQscfkQKJ51I0uczyzBSX+Pa94YhbLGZZhjpL
 5K+ljjkl5YiWGxKqy+qvJb34AyLrJWc9OzRp7ZFwnalGG/Wrc0Ait4hCwuGptBS0Jw9UKYhNp
 2EtIFfNZCX4S5nUJCv+L/Ew726wSimRC8OQgDfRzHiLPKsh1QHapfR7J7H43OK4lt5JcPgW60
 J/XoLTw88wiEvhvsAtlGIfXOhO9nI1io7EBPM2XhJ4WnNiCHVpiuikrpNOs1W2jjqSJRNEuod
 ZObtickH7p1VxDLo5zpHaR+V0u54q6YY2II6bc2ybMA5VPUdyax4Sbkslp11iF5AXoW+Nv0nc
 wxwFunm1mrX5IhUo1ZmI4XKZVwxS21TLP6LsfbJPoRCm0dj5nJORqW3yWcJ6KZgLlU2e/LEJy
 Q2ZShPMQEvkYqWJDGoRL/sKhN1S/ELbsF+atuKuFx0M5j9ZYsQNvlZXhLQL11KtFtghFHuDaG
 SHGH27lQxF7Uvu/9Dx0mmA66UIzsf0uePZRqFBsFGxi8DTPxfioIYOAMx3u1hZyKJN8cyqR7H
 IUulWes2Abk69OXsQ2pgib9alwFQuvbhh4EL9/z0RI5NlqwHIU7NQf0V6kBnPc/42hOaRXpsc
 gEofxGCgbL4X34ivFosw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uGEIEjYK4Hs76rFNuymf8zamwsxOw0ios
Content-Type: multipart/mixed; boundary="CFQtLzYj7LTTLx1LCz8ceBAPYIbYhET30"

--CFQtLzYj7LTTLx1LCz8ceBAPYIbYhET30
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/23/21 4:39 PM, Rolf Eike Beer wrote:
> The Python testsuite in all versions of Python3 I remember fails the ei=
ntr=20
> tests with output like this:
>=20
> FAIL: test_poll (__main__.SelectEINTRTest)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/usr/lib/python3.9/test/eintrdata/eintr_tester.py", line 451, i=
n=20
> test_poll
>     self.assertGreaterEqual(dt, self.sleep_time)
> AssertionError: 0.19999999995343387 not greater than or equal to 0.2

There have been some changes in the generic timekeeping functions.
I see timing issues on a few of my machines too, e.g. in the xor
time measurement functions as reported at lkml.
Sadly I don't have time right now to look deeper into this.

Helge

=20
> There are 2 more failing tests with likewise output. This happens on my=
 4-core=20
> C8000. I have attached the testcase, when running it with "python3=20
> test_eintr.py" I also get that results.
>=20
> I suspect this could be some cross-cpu clock scew, but of course it can=
 be=20
> something entirely different. Could someone have a look what is up ther=
e?=20
> Kernel is currently 5.10.4, but this has been there for a while.
>=20
> Eike
>=20



--CFQtLzYj7LTTLx1LCz8ceBAPYIbYhET30--

--uGEIEjYK4Hs76rFNuymf8zamwsxOw0ios
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS86RI+GtKfB8BJu973ErUQojoPXwUCYA8boQAKCRD3ErUQojoP
X4sbAP9SRrgDyB48cZDSULVV/EzJv1qNNgRUBcSQqgLEm6HU6gD/SPZphPhqVwQI
NwShKSlyijaiXTqZOPkLoBg3osI0VA8=
=h1jG
-----END PGP SIGNATURE-----

--uGEIEjYK4Hs76rFNuymf8zamwsxOw0ios--
