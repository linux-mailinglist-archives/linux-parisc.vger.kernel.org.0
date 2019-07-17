Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4DB26C0E7
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Jul 2019 20:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388695AbfGQSVJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 17 Jul 2019 14:21:09 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:49547 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727434AbfGQSVJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Jul 2019 14:21:09 -0400
X-Greylist: delayed 447 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Jul 2019 14:21:08 EDT
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190717181340.FJCE4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 17 Jul 2019 14:13:40 -0400
Received: from [192.168.0.101] (really [67.70.71.6]) by torspm02.bell.net
          with ESMTP
          id <20190717181340.JVJT30132.torspm02.bell.net@[192.168.0.101]>;
          Wed, 17 Jul 2019 14:13:40 -0400
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11946948.1Lt8Nslq4k@devpool21>
 <029de4f5-62db-7d74-7619-3c7888ce4f9c@gmx.de>
 <5e2ad677-7062-98d2-a6c5-577df02132d4@gmx.de>
 <1957442.0sSArhqTEx@daneel.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <a2c04d41-3406-69a7-1df6-0fbf80c1515f@bell.net>
Date:   Wed, 17 Jul 2019 14:13:27 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1957442.0sSArhqTEx@daneel.sf-tec.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hU8loedizDNeRB8d7hqiMTtbmCOWg9fcJ"
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_d a=vkxsL+t31Oi2TKkPQGm2Xg==:117 a=vkxsL+t31Oi2TKkPQGm2Xg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=0o9FgrsRnhwA:10 a=13zjGPudsaEWiJwPRgMA:9 a=FBHGMhGWAAAA:8 a=HuDKjS6Q_IhhQtS8kxYA:9 a=pILNOxqGKmIA:10 a=m69ebF8Kpi3HNELchV8A:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfGpUyfQpWaiUiYy3gRYGvZ1Ah52PVP5tRafTpHv7A8H8jsA5aNhEQprPOMPDkzo0GeZBVPWMKCuOlrfZRnUTK7ebVecciLqOtzj3XK8VVXeXRnxSyqQS L9vzXMQetZfyQlOzV66LL6XLwB+xokVEAcnOSCW6AvQzLxW0rqCopuiwfCjwCdS4ZbQquGCVxgXWeg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hU8loedizDNeRB8d7hqiMTtbmCOWg9fcJ
Content-Type: multipart/mixed; boundary="Mf07g5nnBWPIDWp2VleUzpUcdGPnBAEcC";
 protected-headers="v1"
From: John David Anglin <dave.anglin@bell.net>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>, linux-parisc@vger.kernel.org
Message-ID: <a2c04d41-3406-69a7-1df6-0fbf80c1515f@bell.net>
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
References: <11946948.1Lt8Nslq4k@devpool21>
 <029de4f5-62db-7d74-7619-3c7888ce4f9c@gmx.de>
 <5e2ad677-7062-98d2-a6c5-577df02132d4@gmx.de>
 <1957442.0sSArhqTEx@daneel.sf-tec.de>
In-Reply-To: <1957442.0sSArhqTEx@daneel.sf-tec.de>

--Mf07g5nnBWPIDWp2VleUzpUcdGPnBAEcC
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2019-07-17 1:52 p.m., Rolf Eike Beer wrote:
> I applied them on top of 5.2.0 and tested it on my C8000, it survived t=
he=20
> whole gdb 8.1.2 testsuite. The results are horrible, but the machine is=
 still=20
> up and running, just a couple of these:
Sadly, it hasn't been maintained for years.
>
> [ 4481.730278] INEQUIVALENT ALIASES 0x41000000 and 0x42e81000 in file k=
ill-
> detach-inferiors-cmd
> [ 8944.224759] INEQUIVALENT ALIASES 0x41ed2000 and 0x4171c000 in file m=
ulti-
> attach
Theoretically, these could crash machine.=A0 It would be useful to try to=
 debug how they occur.
I would guess it's a mmap issue.=A0 It shouldn't happen with linker.

Dave

--=20
John David Anglin  dave.anglin@bell.net



--Mf07g5nnBWPIDWp2VleUzpUcdGPnBAEcC--

--hU8loedizDNeRB8d7hqiMTtbmCOWg9fcJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAl0vZVUACgkQXb/Nrl8Z
TfGrhg/7B+u6P7HEH2tL7kg376FbGYU60MmZS2mn8Mq7pcPr/G8R89YxS91qbAdm
erqeL9CC7xIg8lU/aPLXdpdx3IETdwGjxIzt9yYaJsmVrD2g64Wmqf/rc4Co/eB3
wpCLGAh6tAaXH/tD5U6QCAyUmNktm2zqw1I2WHUcoShYRr1gUNcruq+Uog+ykHRm
5Ezse8EzFQ3LGkk1viO0+gEBYRZHBHgTSBb/tInWgcm8M1jgqfBF1YzlCSARN9py
1X7qcyJyrlylYWE8AeaJSIKpy4NiEi6MKQ1nDD+3m8bwkgOxjb+RCMnuP7cRgG9m
HFS7mcmPaP72Jip2YvJe9XjIAJo8R26mLhNKB/jWZ5tBNUBMbyTmhRjEkhRXGem9
fixIxwOG5DoeXAnV0tjRvFPh4CKOPg8DHrz2mqiw854p7pcxXyuLr74EacmSf5jY
zIiMWqLaOJ68p8linWs1Wrc+ne/d9R1Uw2OPIjPWrSfsxTl1qEFwn3xL/vcI+Y4A
PIEIFL5Iuaf71+7MHYZIXTCPSklyuEIBclaFZcNTVcZCuOYSkg88YhMB8Xv+i1Zb
avp5ECRbQu52591oeN8AhtYezKSHY30VZRacHXjt6yHGCsXqcrf0lsOj3k6p+mfC
EcN8R924IGdgN4RSjcj2EAzOfGXSa6oK+6bl3BKdxFAtcxjj4Z4=
=F6OM
-----END PGP SIGNATURE-----

--hU8loedizDNeRB8d7hqiMTtbmCOWg9fcJ--
