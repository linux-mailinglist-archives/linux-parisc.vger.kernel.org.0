Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245E6799F27
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Sep 2023 19:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbjIJRsb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 10 Sep 2023 13:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjIJRsb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 10 Sep 2023 13:48:31 -0400
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F24D180
        for <linux-parisc@vger.kernel.org>; Sun, 10 Sep 2023 10:48:27 -0700 (PDT)
Date:   Sun, 10 Sep 2023 19:48:23 +0200
From:   Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To:     linux-parisc@vger.kernel.org
Subject: Possible 6.5 regression: Huge values for "commited memory"
Message-ID: <1694366957@msgid.manchmal.in-ulm.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="75DDxtbFUa9ey2Ev"
Content-Disposition: inline
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_05,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--75DDxtbFUa9ey2Ev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

For the time being, just an observation: I monitor various parameters on
my systems, and among them is "Committed memory", the Committed_AS value
in /proc/meminfo.

Since upgrading to the 6.5.x series, I noticed the value there grows way
higher values then previously in hppa, even if the machine is idle.
Values seem to rise up to around 1.6 Gbyte, long-term average is rather
200-300 Mbyte. Also, I cannot see any memory hogs in top. The workload
hasn't changed in months.

To sum it up, I reckon something went wrong in the memory usage
accounting. Is this already on radar, or should I start bisecting? That
might take a lot of time, though.

    Christoph

--75DDxtbFUa9ey2Ev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmT+AV8ACgkQxCxY61kU
kv3k2g//UpXMb7ye1uD7cApG8TDO83eU0nfxZsr/67zkMja6bO4GfEQmB5Tj7mI3
oV+AcLkteLmTpvijrh3uo/Sn07k7FpF87fQcOuQCjqgu3NyMy82j2O46RrGTE8Jh
vSaRENzSAPqfXMpNdZp3B/BX+0+Jv76REICxBNdcOIqwSSwSB0P9iErl7cHBHz+6
io++kOmVvFBgP7u1Z4ZyeBT1X5NYG0cbvnNCy456csJZ4U7lBRFdFJ5jTkW7Ij7G
QvcuCTu4THj/4r0SHwrDlo0J39X36Og0fc/26a6XMi5bsW5/GSRkAbFCKlGSDc9p
cygcmrsupkQkP2suMp4a8qONexHQhes2p5gixDFqPiLESBTFm4GGvRnziOdIBvqL
4GjjuGj3H/2qodBVrEd3cV07hApLKIsYcyqeTmW4fV7txXKtZfOqt3i5v3Akp4iC
0Nr1jvWwwSM3KvEeC2FTcBc9w+sqIuULF2T6MQKU1KQpsQLSF9/4lGeKFt2GCIO1
4Fk2iXXHyQKEvGtb/mEWuGQkExoMcQBOFXQaL3ONjvBtq/6uym67TN4siO6inWrh
0f+dr1V/OTjh0oeNccICLnQ8fQz4Qe42o4PSTnj2H99kLuUSNM/zqMhVeMRr3oND
tg9QhKaZQl3qvNU2OLL1EeT4kXl0G0Kc0nvU/r+uqqP0d8/ZJcg=
=PILn
-----END PGP SIGNATURE-----

--75DDxtbFUa9ey2Ev--
