Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F23EC5B168
	for <lists+linux-parisc@lfdr.de>; Sun, 30 Jun 2019 21:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfF3T7m (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 30 Jun 2019 15:59:42 -0400
Received: from mout.gmx.net ([212.227.15.18]:40963 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfF3T7m (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 30 Jun 2019 15:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561924754;
        bh=yQmwx2CGfCVjfOTD+RslXyGtkvidVTBGoQDWmjx7Ojk=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=kryxP2e3XRwwD4/JRZ56y2dOETD1/w2DG/Nsy8xkBJsbK4XXswsqmPB1sSr2ud6ck
         4R+EEYQZ+dgPUeCh3CNYuIoPGWk846DJlLlrDFpTughtgwR+1KXDeg7vCcTgHeiwv9
         orReupiG354g0gSmh2oD0GBX3CFky7p7kNJGOITc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.182]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MCLQ1-1hqEhX0U6r-009AJ0; Sun, 30
 Jun 2019 21:59:14 +0200
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11946948.1Lt8Nslq4k@devpool21>
 <16444139.ehY7rFqKE1@daneel.sf-tec.de> <2240883.3K8JbTncdJ@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Message-ID: <ea25ddf3-0e9c-534f-1dc6-41169dc3edcd@gmx.de>
Date:   Sun, 30 Jun 2019 21:59:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2240883.3K8JbTncdJ@daneel.sf-tec.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZPZMN320phLOqvch9itoCTF6q5+YACF32c33bW4j/eHcvHFxdJG
 WJ2rUQDYYL51shEGHzX81AEIiovdR8ozlRmnB0bAfujg/6jE1X92QSMKHzaA/aKwOq0HPGW
 BSZpCWKeUaNVlVvwQnNaYxPbHAXV4fMCrtZ06AeJ4MnJVNAPAUW7mgkedZ6ep4wa9VRmie4
 druFoqyBjHvJ5o14HAd/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6q8bKVC/s3M=:vIcz/u+rHzpkedtEAGlvqn
 +jNnrDKJa444KmhbpxP2XvKJOiNd4kWkZsse/lQZlyOZFKbHcvfF9k65geat5MVjZx8JHFylZ
 a2nEClxxoZhQstk+FZipX8GBFdOTuiEuf1DOU5GXbAfF7vd24GC+Ikqn27WUWLVhSBkiQIbfp
 OP4zAu71jesFBdZhCCQxt/93SoNoOzp2lQEIDDAbLj5SkOiIcPWkTNqomUW8zT8dst0JtEu2S
 ieM6u7t6WU2X/M+WHz5JNXExzqC9bmYtWrOaH69B9IOGJ6Vngw5Pz8tA7GGqPCdrlLHeIWytt
 lHzavp0RvzH3lVuscoo+7oRnCjDPZC1aqFSJ9yfAzvSuCmbYdjAQvNm6KAFiIyywc/d/GsMhM
 kykAPekaqQab8tcaRMUvEB7W4QcPo6WCQniWc3ypodiEJ3e5AmvLGMG4U9DHezbigJ4uE/hyj
 0pHpI9r/9Af+/9D833txNZKVDTz4KNRosmaXCN4ZC8ueEmBQYZie9t4r6Hb6l7xkQ79zD+jsh
 QAOO/2mUvXGHCAv85NcGtwpi8Af8Z7893+2Tjlf+CqATPK0CKoTUYWGLN5X2+FBjXG0ShiX/m
 r+cYMg5d6MqBHYkNjc2rcxWYm5s+JxdLYuZHf0WXBbHSDKKokU926+feTHC4MKIfReEQr3uBK
 KkYpwGcl3pFzZuAuGkY/86J61Vr64BS5hly8HTLp/nQ7BWJDABQaz0FOFnW1KhkhHJZm61cxo
 HMbBta+rWEUiR8WYXNHsGHnW63hCgsWvl4uo5DZnwXDhXziBGk+C9wjfYO0y7qz8AX41lqaiM
 qvn1mkX7t3kJXqbMmnp+zB0XE/Q9hMZ4BLC8Upo6YaJoqfDJMWLwRIkp9IUyc4/HKSXA6wTND
 bE9ilKfEYyTJwSWkB1e0iEJzFc6/26/mlPoYTC3mRjU5/3WnaQnqWRCLxyLd280fF2ryAflYZ
 PF6nqjLSijQjurvtdVSbK9Ska8c7n90uC1CsDn4Bc8rzGQ2pCv305M6gXv8Rpv8QcujzEo+uN
 XEIZ/qzq3OpP5zRdR5lZlK+6GDFp7pdQNEAe49qswc38pvqbH26u0fe7gfuN/os/6bZsqN/C3
 uxEzW1aV+GZtCE=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 30.06.19 15:43, Rolf Eike Beer wrote:
> Am Sonntag, 30. Juni 2019, 12:05:46 CEST schrieb Rolf Eike Beer:
>> Am Donnerstag, 25. Januar 2018, 09:59:03 CEST schrieb Rolf Eike Beer:
>>> The last message I had for the crash below is:
>>>
>>> Running
>>> /var/tmp/portage/sys-devel/gdb-7.12.1/work/gdb-7.12.1/gdb/testsuite/gd=
b.ba
>>> s
>>> e/bp-permanent.exp ...
>>
>> I just have been told it's still happening with the gdb 8.3 testsuite o=
n the
>> Gentoo test machine:
>>
>> Linux hake 4.19.52-gentoo #2 Tue Jun 18 13:51:01 EDT 2019 parisc PA8600
>> (PCX-W +) 9000/785/C3600 GNU/Linux
>
> This seems to be a minimal reproducer:
> https://481768.bugs.gentoo.org/attachment.cgi?id=3D361728

It doesn't crash for me on debian (other kernel, other userspace, older gd=
b).
But there is something fishy anyway.
It seems the "set tp =3D {0,0}" doesn't work as expected.
gdb prints the set zero-values correctly, but it doesn't seem to be stored=
 correctly to memory.
"set tp.a =3D 10" does work though.

Helge
