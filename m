Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB564FEB9E
	for <lists+linux-parisc@lfdr.de>; Wed, 13 Apr 2022 01:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiDLXtb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Apr 2022 19:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbiDLXtO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Apr 2022 19:49:14 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18B3B863
        for <linux-parisc@vger.kernel.org>; Tue, 12 Apr 2022 16:45:22 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_9BCC6AC6-4A7C-40DE-B1C2-659CB21254ED";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
From:   Sam James <sam@gentoo.org>
In-Reply-To: <383d6dfa-bef1-e56f-8f82-dfc0682cdacc@bell.net>
Date:   Wed, 13 Apr 2022 00:45:14 +0100
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
Message-Id: <93BE3A28-6EBE-4DC4-92BE-867E7ACB255B@gentoo.org>
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
 <94439119-D2B6-4961-B61D-95784E09798D@gentoo.org>
 <cb19a0a0-69b2-ab14-7767-a0cd7bd671b0@bell.net>
 <383d6dfa-bef1-e56f-8f82-dfc0682cdacc@bell.net>
To:     John David Anglin <dave.anglin@bell.net>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_9BCC6AC6-4A7C-40DE-B1C2-659CB21254ED
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 12 Apr 2022, at 14:20, John David Anglin <dave.anglin@bell.net> =
wrote:
>=20
> On 2022-04-12 8:27 a.m., John David Anglin wrote:
>> On 2022-04-12 1:18 a.m., Sam James wrote:
>>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT =
ALIASES 0x411ee000 and 0x428c9000 in file bash
>>>>> ```
>>>> It seems all these messages result from a single call to =
flush_dcache_page.  Note the sequential behavior of old_addr
>>>> and addr, and message times.
>>> FWIW, from Helge's config on 5.10.108 (config changes on my end: =
just disabling unneeded devices to speed up build), I have the same
>>> horrible wall:
>> This change might help:
>> =
https://lore.kernel.org/linux-parisc/YlNw8jzP9OQRKvlV@mx3210.localdomain/T=
/#u
>>=20
>> It applies on top of Helge's current for-next tree which is based on =
5.18.0-rc1+.
>>=20
>> The messages will no longer appear with this patch on c8000/rp34xx. =
However, the loop corruption
>> might still occur.  If that happens, I think the stall detector will =
trigger, or maybe some other crash.
>>=20
>> The loop is changed to flush all mount points on machines with PA8800 =
or PA8900 processors as I
>> believe these CPUs don't support equivalent aliases.
>=20
> Thousands of messages aren't useful.  I would suggest adding a BUG_ON =
statement in the loop that
> triggers on the first message.  That might help find the circumstances =
that cause the problem.
>=20

Your change *seems* to have prevented the "bad wall"! But now we get =
some silent runtime corruption
and binaries crashing (5.18.0_rc2 + for-next + your patch).

So this seems like a good improvement given those crashes happened =
previously too, although maybe
less often.

Not sure how to get more debugging info yet, there is nothing helpful in =
dmesg (no messages at all when
it happens). Suggestions (given it is not hitting that loop)?

> I think the loop may get corrupted when the mapping code fails to find =
an address aligned on a 4MB
> boundary.  Another possibility might be a locking issue.  In both =
these cases, the messages are just a
> symptom of a problem elsewhere.

I think we are getting somewhere based on the above. Big thanks.

>=20
> Dave
>=20
> --
> John David Anglin dave.anglin@bell.net


--Apple-Mail=_9BCC6AC6-4A7C-40DE-B1C2-659CB21254ED
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYOpPv/uDUzOcqtTy9JIoEO6gSDsFAmJWDwpfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
RUE0RkJGRkI4MzUzMzM5Q0FBRDRGMkY0OTIyODEwRUVBMDQ4M0IACgkQ9JIoEO6g
SDshAggApp9/wdYr2uPymnGHIwg9/YNFygyyo+c+FVshhROOg9eMOZ0eVwva856r
IjGJpeuQdPc4gWT2+Gmqm3Fk5yHEdkfXp+e/5RL/KRl9fAN0Dj9brANqCcJY7Jtz
mNCIBuydc4xR83j/UAt85f2mX3MpT5qne1dAf8P0PTaeYO4S9In8PrVJQYHPALRq
dWUtf+is69vZAJ3j1Pwkpo68j5A91zqlpbnQgmDXzCYaW1MkzNBvtEIO3+ULkMe7
P1jK1JSwqDgInn3mVsJ1VHmR0k9YqqdLk/QQF8oIAwK+ehYxtY5abTjySbzUluK6
sZJ/kla3r1O8M55AmEfOozn6Uhsdtw==
=tAOc
-----END PGP SIGNATURE-----

--Apple-Mail=_9BCC6AC6-4A7C-40DE-B1C2-659CB21254ED--
