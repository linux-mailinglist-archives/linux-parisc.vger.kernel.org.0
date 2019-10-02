Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E949C8D00
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2019 17:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfJBPip (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 2 Oct 2019 11:38:45 -0400
Received: from mout.gmx.net ([212.227.15.19]:35521 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbfJBPip (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 2 Oct 2019 11:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570030696;
        bh=Z3YZ5wrLV1A1hnmAzdWXztUxKtRNjwbuCL2LZXOz1XU=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=UxXQMVrXEt21x3htAfSOT6eumLxp1yqIA1UrpBsz498DyrbGfe2GdEatyX/d47jfZ
         oV/b4YAvtMgfBmSQajbjeIqB7TyWRkjdQJalJBX54O6gmMO2bHsHdh3Zo+/3aR2VO6
         EcjT9ep+8V/CWLol8V0sfT8Y/FKurt74a2qlDaHs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.43.192] ([80.187.96.151]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvY2-1ibfWy0wy0-00UqaU; Wed, 02
 Oct 2019 17:38:16 +0200
Subject: Re: [PATCH] parisc: Fix vmap memory leak in ioremap()/iounmap()
To:     Jeroen Roovers <jer@gentoo.org>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
References: <20190909133856.GA32746@ls3530.fritz.box>
 <20190930082026.6ac087ff@wim.jer>
From:   Helge Deller <deller@gmx.de>
Message-ID: <66fcabcb-ba00-b6c4-7d46-c1fdd9b05283@gmx.de>
Date:   Wed, 2 Oct 2019 17:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190930082026.6ac087ff@wim.jer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ibZOtxxvOtFYxzlqF5UgLloYLH7h7IZ3Jp2UqlyJ5u+bmyb9doT
 7a0yl3BzJgyLxG1PbgIpiOktAttjAAfJjS0JJeHiM75wOLE2xJm3+Nyg+vUf8IxNA7GAZJm
 L8fXASg7dAql4fn0qg/TYY7POu8lMELcQEHqcg6hScOJLrz+p+1L2ce8hOoGMyB+wHTrMqn
 zmPNRWyFs2z0LAMZMLf3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kljvVSVF5DU=:UMd/IBDrJe5wFbEqFk0voq
 b2xFZYxX9oySFmJOQnCklNemTH7z4E5qr60uxcv61BlM2H8bIqbExfwIHTM1kYqYGDTFIc7wN
 zCOkSjlgzl1ThlL1MoCNx8Nnb3plplPRC5shQbYwUj3KBJSMMS2Es00P1Ibrw0HQNCCs6oVz3
 NucOYH6zRBCFz0IwpBqtcpyEBgNOlTJb8txJ5/FZ27BFQfBDqRLxwNH/iU5G9xjuwiB4l8e8p
 Vqh3CbM5Jg1R37hEkmOKdz6b28e+jTD1Hmgbb6mv2+5iiEebaWpkwGMp+vdislc2EKAfrGLqn
 9hJFMtDzR6lVq74HVSu1q2DEJFmRQy4p8dweHOstXfulW6ctL7IZUSXMyWlhfnyZpdbpvsvUJ
 dVn9RT1AOki0K95vuyLyjXnxSWvDmIwTeMQzNFFxaPZUEtEhV6EnkxpofP30f0YteI2AKZf2y
 aH9Kc0PBNBVdYiHWlD3AKap/p+lNXbgWhXe72bCeA5cwB+PoJAlGW2gQoOtP6YQWaNricwXy8
 nMggvWsOQQB29aTC+Xdkp4Pux8atFcgeaUid/1OK8fSTHOhMZ44bOFbEMLjzdKCVrUCC89pej
 YEMypf39Qp4J9ukKSDyZCZ6gBv6zGUAeIUoQVaehwemVc3MSDBbO4wzgV9bRUuoraBCeL7cPO
 oRdRO1jvHEm51hKXsLyc7X8LIQukkmJUuk3DahzwoUe64Pd5Xmx+RyasmV3l1BjoziNvVb3Ka
 Vnuz2kL0e6sNQubXdgYihVMqJ8hHobHcj4BrOKn0FSRfmcDUHQBEAe/OZYUUFFlFqmYsdFYAe
 hL5WWyZCu6Q4F9erADhagZn8YXb2EHSv5fJ8hW5PI8DUqSOumVU6+thg714Ye69TOA/F04tnv
 9K77IJPceTx/MnrZymx8P2KHtgW5VykJsXEXs9OVi7IjoK0V1y5rdpRcp7w6mDV+wFF4DHJli
 RqJh3SOa6t1D95lY5Z/sK5muszTHXNGeYZVP9S7OcLwTE4bkaYMiePIqsE02Ex0dFk3gWNhlq
 ft7ehYnLFlFrmeFU9oCCKLJeFSedydybVGD37PJ0Glc9shXz34aubB97Rl4T4wf0N6C8ldEBG
 kZLJYVVpQDRkjIvMpFsh+VEOD5uvayj2Puyqd40vJ2UxJk4c5xs981dd4eT1gx9CLO3ApVI0P
 keYhqUv9P86Zk18r5JqZkVlcj3ANs/SsvNt4JHxx1s4uELxzTu8baByzzXtebZIDgdLYuthbh
 Nz/hU3vg1o2ZTzD9oQJl9jQCjitqbkEspFVy3OQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 30.09.19 08:20, Jeroen Roovers wrote:
> On Mon, 9 Sep 2019 15:38:56 +0200
> Helge Deller <deller@gmx.de> wrote:
>
>> Sven noticed that calling ioremap() and iounmap() multiple times leads
>> to a vmap memory leak:
>> 	vmap allocation for size 4198400 failed:
>> 	use vmalloc=3D<size> to increase size
>>
>> It seems we missed calling remove_vm_area() for ioummap().
>
> That patch seems to work (tested on a C8000 for a couple of weeks).
Did you actually stress-tested it?
modprobe/rmmod is not used that often if you have the patch simply
compiled in...

> I was surprised it wasn't part of the "parisc architecture updates for
> kernel v5.4" pull request.

My hope was that some mm-knowledgeable person would doublecheck.
It seems we could e.g. use vunmap() instead of remove_vm_area() & kfree().=
..

The patch is not forgotten, it just needs some more thoughts/discussions.

Helge
