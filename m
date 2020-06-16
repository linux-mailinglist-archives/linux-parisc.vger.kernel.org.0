Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8E11FB52D
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Jun 2020 16:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729259AbgFPO5J (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Jun 2020 10:57:09 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:60220 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729353AbgFPO5J (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Jun 2020 10:57:09 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20200616145707.YUCS13212.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 16 Jun 2020 10:57:07 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm02.bell.net
          with ESMTP
          id <20200616145707.TGUD16325.torspm02.bell.net@[192.168.2.49]>;
          Tue, 16 Jun 2020 10:57:07 -0400
Subject: Re: [PATCH] parisc: Prevent optimization of loads and stores in
 atomic operations
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net>
 <2690783.z6zax5hIIu@daneel.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <02835c09-8b8f-6e48-11b5-162c5fa94b83@bell.net>
Date:   Tue, 16 Jun 2020 10:57:07 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2690783.z6zax5hIIu@daneel.sf-tec.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=KfusTjQD c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=N659UExz7-8A:10 a=nTHF0DUjJn0A:10 a=FBHGMhGWAAAA:8 a=acxhyn3327axTssayr0A:9 a=pILNOxqGKmIA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfAPkQEr0FsZuxjmSgM45iCAmRYidvBuErEf1aYA8Xu1HzbIuYpiRfrJkwG3JAHv7JuSSd4JPKB5CSVCT6CgPrND6XcwHwO7cPzuB6sBhRJx/peWeBghV Opuvm6+dK31wJNQePtpaZCLdisF2VdubHr6e49eV8jFkwI5F+C7rNXD2kaUCM3gmRU2PTRlF23jG4w==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256
 
On 2020-06-16 10:46 a.m., Rolf Eike Beer wrote:
> It does not cleanly apply to 5.7.2, but the parts that do apply have made my
> C8000 run longer in the gcc testsuite than before. I will run it for a few
> days more to be sure, but it looks good so far.
The important parts are to atomic.h and possibly futex.h.  The routines are inlined and subject
to the optimization problem that I mentioned in the original post.

I will post an updated patch against trunk in a day or two.  The debian gcc-snapshot package is
building on mx3210 and phantom.  This package almost always failed to build on phantom.

Dave

- -- 
John David Anglin  dave.anglin@bell.net
-----BEGIN PGP SIGNATURE-----
 
iQIzBAEBCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAl7o3bsACgkQXb/Nrl8Z
TfGbng/8CBoMlVdYSzdFZiljEUNh1lTjkbnoL73GisnhD3wUksNc3N3BbUggp6q6
D6O9ueydFg+lUEBNIh7LmEpsm6n5CmjFJjlEQr7/+pJ8HMtmhezqYEYr/Vh/+Y4J
XjX2V7dwtPaQ/SxRclw/ePW8NjU1eTDm2+4MWulwEGKgb7dIdEG2VgT74rB+eYsn
nF7rUojFPrVSNITKhrH+gYJzXzA0Wub4btt8jy1rlwwMG5vm6o2ZRqAtXiwOUW1F
Y7Gq9yK4jFUUCEY1Y7KvHooysu16n5EfgrS6CKF7JDustC3wFA3tAlfdsYg01TEL
qLfZGcm9XPvaMNWEvobZNzobrdgprL7ykzwwalzYwu9lpj1qTqT8IBcrtl1gsBts
SN5aXG1wogqVtKv4FKNfJFPQzy5h2O4FYb/4C4hp2kSEM5vc1+0T+TvB5Pc9qxp+
5mVAJ8X27WfQuyyvjZiMy9Mh/gf1+NHeqvD1tSzhrTu3Mym/5JZdACGy1iwNNzkg
8tx3jvv41ZjNoJY+BYl7uUar79EL/yi0I0GumG5+EHuTmQ8wYhgoXkS1nGmbNmIw
8w+0iAXL1VqV4GfUhYxkNLyqT1PFakSoohu5IAdRM3ofbpM2P1ypPcOld4IcanZP
v2ebiUh+N+wEHagy+b/v0rBUUzN7dm1FJgSlRoEIqKaK9ImYWkQ=
=c/GD
-----END PGP SIGNATURE-----

