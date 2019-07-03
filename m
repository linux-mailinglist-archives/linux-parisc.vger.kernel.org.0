Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08D8A5DE25
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Jul 2019 08:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfGCGjH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Jul 2019 02:39:07 -0400
Received: from mout.gmx.net ([212.227.17.21]:33061 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbfGCGjH (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Jul 2019 02:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562135940;
        bh=vpUM99bDi7sZVc1DqC0DRk+wk/CuSK67cIO6ZYxYLtk=;
        h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
        b=WIoante6EnrbtFunrwNsXtqmjAJCTsCmAfUYbCzAQX34agFBdXSr0E/n7GIqqzj29
         n2fKfVUEZ9bHJeUtWXTjhaTU12R36QNGtQEw/mUYFnrLHr3MOfUiYIuC7NiixjM9n1
         AZSVc1eL8NbGgrEwvRNhJ6kdA3wH0JylitasGX0I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.112]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MQu9K-1i6ALy1biw-00UHWt; Wed, 03
 Jul 2019 08:39:00 +0200
Subject: Re:
From:   Helge Deller <deller@gmx.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20190703063132.GA27292@ls3530.dellerweb.de>
Message-ID: <1b48b0dc-b1f3-3f09-9fa9-bfe99b01331e@gmx.de>
Date:   Wed, 3 Jul 2019 08:38:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703063132.GA27292@ls3530.dellerweb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HVFnKQYv5cy1Lt+PV+pZ3cKbAN22yOmNPOA1WAJ/nVDZddIDTYo
 AWDmqIYi7zDnSrddx6hyokm/A/Z4eMLsU9OHxYe+X4M36EXeYxeArcLytTSw+neHvj5S3ks
 9GIQBPqYymuaAJhWRbhs86doCg6xiO+PDTRXyfvTVV3WnTqNGGmGtVcg8T/smwlZ94n3Tlm
 rhfnxz7LBtc0L4iRbyb0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YAAW8KBsUvQ=:m9wZE8aYso3leixicXeE9/
 zTyLDNsR7HwiXes075TFHgMlQfFPVPCXF/6ANBh6gAT8JipCNWKS4NWu2JBNtiHi96RDunV3Q
 z6s3bW1F8DlQ1qA3y6iuDEBYvOoPKo+rzY5kOwwoN8gwXGTFbtoaF6NnucFfle4/GWhvii2Gn
 Upxn4FU28EfHwBZV+bvWAs0SSXq0A/5rEPKhPEC5HTgdZ1yrMod8kBoyqmVyUAmBBFhQMTh/b
 a7/TjNJ83bMdzk43HKYPaiMW8QjFcsm9+O97YWUSJbBD74MM8tCBmUohJohi9UE9p4ryOjU7p
 GlaVR+xNRGrLI5LdPJNInx1TI87ojktnlDwHNam8m/QEZaP2rQx23JeXytqy8AowIlzR5RSWC
 4KduD3i//7vO5T905gacqhjWUjB9VFEobhfmdR+JvnuAQWXLNl5UWuvk9WIjba8ZSgaTU7AAb
 ayyb9omxF55aEWCw2JWiIau9kgpgGbEkXcSm+Mkr0qfV4jr8q3qVJaRh5puO4u7Y8PtEgmeU0
 LL1QqmVV9oCOX84newrXavq5D1vVjPmFUDl75lt8VxdsIz3HxzBPhip1/pob8nTjE/FgCMntR
 SxkXbeVXN+zSfF9ELTkrOb3x5Bvm/JRzxcHmOJuwmUsBljJApt+SIaVjs1l3yw/ZN+riJbjNY
 KEWrjDdN2HH4/OcTghlNCEZx2S1fxSXSmBhMRbjdfz05AbpleHVDnQwav9+E8pJKOrFBY1Xx+
 w3Y/iroed/mz2QeRJgR/nGwnVbnDlkmKQfgXpETl526OkHuxNaeemh5l8Y7n4LWu8fvXECKlU
 zHu3QTmtoT1R41ozqESfR1FABLvg44/VAQmWqPlxxb/kNIeZUUylPjewaSBWjqHA9dl1WKHvR
 Rwq1PQfCgkso4wVAS73WIbNXVOzcIcWzl1zlWKwIrBphja4X/3WfQem7DCkDAV4GPXuge2XMT
 7Gn8DKL6jJkwZKEmM6ecK9aOvD14JmbUBIhA2dRQ0CsfTZ2AsDxpPMWaWKYYPBSe2v8URTdRs
 m/i+zz8SpfVfwWK8r73nuwJIlOixlAoujRWyjN5+p6GlL4EQinVTmmHfJGK+s/qIH4+sMgjTj
 hxfcDBQzR/Bz2A=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Please ignore the last mail.
Somehow a newly-installed mutt misbehaved and sent out an empty email.
Helge
