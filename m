Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D88F55C2CE
	for <lists+linux-parisc@lfdr.de>; Tue, 28 Jun 2022 14:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiF0GP0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 Jun 2022 02:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbiF0GPZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 Jun 2022 02:15:25 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B332AC2
        for <linux-parisc@vger.kernel.org>; Sun, 26 Jun 2022 23:15:23 -0700 (PDT)
Content-Type: multipart/signed;
        boundary="Apple-Mail=_7CC86B1B-E132-455E-A04C-77DE1E1CE9BB";
        protocol="application/pgp-signature";
        micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: linux v5.18.3 fails to boot
From:   Sam James <sam@gentoo.org>
In-Reply-To: <faea80e5-de8f-f1ca-1412-43f513b3b45c@gmx.de>
Date:   Mon, 27 Jun 2022 07:15:13 +0100
Cc:     John David Anglin <dave.anglin@bell.net>,
        Kuniyuki Iwashima <kuniyu@amazon.com>, kuniyu@amazon.co.jp,
        linux-parisc@vger.kernel.org
Message-Id: <CAED4F1C-C219-4B58-946C-DFD156AA22E5@gentoo.org>
References: <07d91863-dacc-a503-aa2b-05c3b92a1e39@bell.net>
 <20220610160624.95035-1-kuniyu@amazon.com>
 <7beb6e90-4532-cba2-8121-4cfc413f4d3f@bell.net>
 <76323d1a-114b-2cf7-2f4a-05612b28c9e2@bell.net>
 <faea80e5-de8f-f1ca-1412-43f513b3b45c@gmx.de>
To:     Helge Deller <deller@gmx.de>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Apple-Mail=_7CC86B1B-E132-455E-A04C-77DE1E1CE9BB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 27 Jun 2022, at 01:08, Helge Deller <deller@gmx.de> wrote:
>=20
> On 6/10/22 20:18, John David Anglin wrote:
>> On 2022-06-10 12:49 p.m., John David Anglin wrote:
>>>> The commit was added to prevent compiler optimisation from =
splitting
>>>> read/write operations.  I think it can lead in a change in opcodes =
but
>>>> must be safe.  So I'm not sure why the commit causes boot failure =
for now.
>>> Neither am I.
>>>>=20
>>>> I'm not familiar with PARISC and this may be a stupid question =
though,
>>>> what does `ldd` exactly do? and which line is it executed in the =
func/file?
>>> ldd performs a 64-bit load to register rp (r2).  It is part of =
mpt_reply's epilogue.
>>> The prior "sync" instruction corresponds to the "mb()" at the end of =
mpt_reply.
>>>=20
>>=20
>> Possibly, this might affect Fusion MPT base driver but no patches are =
applied:
>>=20
>> [   29.971295] mptbase alternatives: applied 0 out of 3 patches
>> [   29.971295] Fusion MPT base driver 3.04.20
>> [   29.971295] Copyright (c) 1999-2008 LSI Corporation
>> [   29.971295] Fusion MPT SPI Host driver 3.04.20
>=20
> To sum it up - this issue war triggered by a few special situations:
>=20
> The kernel patching code uses the altinstructions table from kernel =
modules to patch
> in alternative assembly instructions.
> To read the entries it uses a 32-bit ldw() instruction since the table =
holds 32-bit values.
> Because of another issue this table was located at unaligned memory =
addresses.
> That's why then the kernel ldw() emulation jumped in and read the =
content.
> Commit e8aa7b17fe41 ("parisc/unaligned: Rewrite inline assembly of =
emulate_ldw()")
> broke the ldw() emulation and as such invalid 32-bit values were read =
back.
> This then triggered random memory corruption, because the kernel then =
patched addresses which it shouldn't.
>=20
> I just sent a patch to the parisc mailing list to fix up the ldw() =
handler, which
> finally fixed this issue here too.
>=20
> Everyone who runs kernel v5.18+ on parisc should better apply the =
patch I sent:
> =
https://patchwork.kernel.org/project/linux-parisc/patch/20220626233911.102=
3515-1-deller@gmx.de/
>=20

Appreciate you summarising - I was just wondering about this bug earlier =
:)

> Helge


Best,
sam

--Apple-Mail=_7CC86B1B-E132-455E-A04C-77DE1E1CE9BB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iNUEARYKAH0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCYrlK9F8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MAAKCRBzhAn1IN+R
kAZNAP0Y6x8MLbxdhMWeuLMeVFU8/0oeh2krcHYC74RAJp5QnwEA6hyHKkA12+uJ
knTYNlrGSByXFDyp2B24LOl95BSWHgQ=
=4yAM
-----END PGP SIGNATURE-----

--Apple-Mail=_7CC86B1B-E132-455E-A04C-77DE1E1CE9BB--
