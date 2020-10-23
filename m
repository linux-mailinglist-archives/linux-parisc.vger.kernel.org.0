Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B3C296B0E
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 10:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375765AbgJWITO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 04:19:14 -0400
Received: from mout.gmx.net ([212.227.17.22]:32783 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S374875AbgJWITM (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 04:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603441113;
        bh=PsQesSUnI/MDJPhgHrMLrVVNXnRpDBchRU86QC0E2V8=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=W4bpGuSH6Jm0BJqXEIvxcG/ycdATxIRssjboyGJxTyUl2L0zG9yqwq9AwuPYXmzEO
         pZ2hmCAr2Vzu8cWLBapvoWwhhMjPdS3uuh5EsvHTHQ279MldwbJC7Fij4PCOxjwcpm
         N2iRIr+goWKkJ+i6W+vmvhDXgaCJ4e2Q2rFDVeUU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.58] ([92.116.145.200]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1kzPlO2Q4V-00UZ0h; Fri, 23
 Oct 2020 10:18:33 +0200
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag
 usage
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Jeroen Roovers <jer@xs4all.nl>, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org
References: <20200829122017.GA3988@ls3530.fritz.box>
 <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
 <20201022164007.GA10653@ls3530.fritz.box> <5650648.lOV4Wx5bFT@eto.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <05c101c9-c790-68ec-40a6-d248452fe60d@gmx.de>
Date:   Fri, 23 Oct 2020 10:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5650648.lOV4Wx5bFT@eto.sf-tec.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YnPS2dRoSxjgQmybV0haL1lJP84zZx5TI"
X-Provags-ID: V03:K1:7P3NWmU8LP1mHS7W6OzeIbgoNd0fevEHVS1hVmlcVagPN16UvrQ
 0wSdP+Btp6nS96Juz44fQYhQ5yL/sjuzOVIEoH0z/vyeRG7bHji2gIVZRFCPQXQw8ZxL8m3
 ZrNbmbAQzgdBaCKkZY/LHylZZ0yhuRsAU2OZPj90OJOzQMUn3xzt5sRMJtMcq2vtBfJKik3
 mvOQu/tYF8Ytb/V0zTArw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3PiJOjyZ3Ic=:b3O6DIwt7dBQO8ZiXihl32
 yznR3m0nPgE8f8qroviYrUpXZ+vfQL0OJr15tkSogi5Mk9qFcXUJR0YyYS4GK3WDKHNlNksWq
 OcdNRzsgCKJefsw6KUEdWzOKWF+Zpk7A7QsDE+9S9dCj5GzWB2NN5A2OL2mpdF5gMFi/mLL/G
 Y2Vf16MYTZRrWD632ET/OzMBHMmFvPzxVuuoj31kY9qmf0sa5d8r0WieFRihsbL4WKADW9pMp
 F2LOKfuHtiJDStTfJuNpmwjGZq30MAuUFS2D9jjzJeO7/JJZruvCjiAL1V21cNvxsofwOHKYb
 GmhIkl56+T9sqDk4+yA73+96niRVHQ1avS3kDq/Y4iRAbHpLh6IgQLPZgQ5gzphZjRobBIQO4
 9rj3SFp670WpnhW1yOgRZTs03mfSGLgi3pyTow/2npYbpzmv5/U7L6rlhn4IukV7czBCGIH1r
 IEvKoDRcqpZURXz5glkqSRexfEw+pYM0OWbwaAC1p4moNwOSs7tMmwiEindYIC2l7FkDLI28q
 VEEl5zqcG0HJiUAIc68EH3xRhPyQSgpape66XJCA7nUzhV0OkYzqRtBaV/tp8VUPWyAhI03rV
 oczBXGT5CvmpUA9UffKRAzq26c3C1dFGlZ3ELR5BIioRqClgNSCFRQjvMjoJzwNwKXSsMDLxV
 R/0JuuTU5pAgyd5R/gew37+aD80khBmj+bDHN+opWguGnVqPbiddBYhkeXhQoHxjk3Si3amnX
 KI+d/Ypth71sJGrGIuvrHnjZxdiZlLUeL0aOcuend7p4NSMQv+OFtYS4+FN/OuaYoQqrw22Se
 93HrVMSsR8Aen8BHWrQtEmiRkzBBVjhWgpdnHfGoT6W1kntPldIPAxQtpGgjAdTs5po5kC2/i
 tKlp9BAX54jtJwVoifnA==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YnPS2dRoSxjgQmybV0haL1lJP84zZx5TI
Content-Type: multipart/mixed; boundary="lRXU1Gmfy4dA9TA6ZgAIpZJF2IbACgqd4"

--lRXU1Gmfy4dA9TA6ZgAIpZJF2IbACgqd4
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/23/20 9:25 AM, Rolf Eike Beer wrote:
>> +#define O_NONBLOCK_OLD		000200004
>> +#define O_NONBLOCK_MASK_OUT	(O_NONBLOCK_OLD & ~O_NONBLOCK)
>> +static int FIX_O_NONBLOCK(int flags)
>> +{
>> +	if (flags & O_NONBLOCK_MASK_OUT) {
>> +		struct task_struct *tsk =3D current;
>> +		pr_warn("%s(%d) uses old O_NONBLOCK value. "
>> +			"Please recompile the application.\n",
>> +			tsk->comm, tsk->pid);
>> +	}
>> +	return flags & ~O_NONBLOCK_MASK_OUT;
>> +}
>=20
> This will also trigger if I just pass 0x4 in flags, no? The check shoul=
d be=20
>=20
> 	if ((flags & O_NONBLOCK_OLD) =3D=3D O_NONBLOCK_OLD)

RIGHT!
That's a very good point.
I was thinking about what would happen if over time a new (unrelated) def=
ine
gets created which then gets 0x4 as value. My code would then have wrongl=
y=20
modified it.
I'll fix this.
=20
> because that would correctly reject a bare 0x4, at least I hope that th=
is=20
> would already happen with the strict checking you mentioned.
>=20
> Would a pr_warn_once make sense? Otherwise your log may get flooded by =
them if=20
> e.g. sudo is the problem and my nagios comes every minute to check some=
thing.

I like the idea.

Helge


--lRXU1Gmfy4dA9TA6ZgAIpZJF2IbACgqd4--

--YnPS2dRoSxjgQmybV0haL1lJP84zZx5TI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS86RI+GtKfB8BJu973ErUQojoPXwUCX5KR1gAKCRD3ErUQojoP
X/DUAP96xUfvkxNNjayt0RRh4eKWcroT4SsD3hgODWVsGw8QRQEAmZJgmav+WoM9
Qq8aVvaICPP2FI6Sk4xn7XE1W+ZSOg0=
=kOnf
-----END PGP SIGNATURE-----

--YnPS2dRoSxjgQmybV0haL1lJP84zZx5TI--
