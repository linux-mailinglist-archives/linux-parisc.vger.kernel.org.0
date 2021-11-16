Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616F54539B8
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Nov 2021 20:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239703AbhKPTFz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Nov 2021 14:05:55 -0500
Received: from mout.gmx.net ([212.227.15.19]:49457 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239717AbhKPTFx (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Nov 2021 14:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637089370;
        bh=/ZQUZnSu7tD5VF0/O8qlupkc+om8WQVmaTzLnvFt7gA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=PTShcMvPq45lZ4KfSOHQSG5p8S2Vr6KfQOb/vezrt4cSYnsO2Vn0wX1hfP02ZPmEE
         LeWf5XhGL4GbRpraNKeitSRqzNg0wgCdukFPUV6dgvtfkXNuMRIoxvpm6mLL3j/Ar/
         LIMbTlNwKjF2yAXWddq14QAohwgoB534TBDxRHGQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.177.193]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXtS-1nDYoE2rdg-00QS4J; Tue, 16
 Nov 2021 20:02:50 +0100
Message-ID: <0252eb72-2591-c117-6cc1-71b0bffc983b@gmx.de>
Date:   Tue, 16 Nov 2021 20:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] parisc: Reduce sigreturn trampoline to 3 instructions
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20210908204405.127665-1-deller@gmx.de>
 <20210908204405.127665-4-deller@gmx.de>
 <689b8410-5384-f77d-0724-eddbb4452368@bell.net>
 <b2abc63f-a898-c925-1fc7-af5cf4930f6d@gmx.de>
 <e6f05692-d275-589e-46aa-32e29765f373@bell.net>
 <c1ae6549-0c05-3dc2-30bf-20b1526cdbe9@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <c1ae6549-0c05-3dc2-30bf-20b1526cdbe9@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ba1JwGsvtlg/M0MDr4iBQ3mdBW1F4PshDMjrbZxlD7H5Wx0khwK
 /LFaCXChgjKyjZefpV3xt9uJGIYsIkIbKELKJPwcc0S62x9ap3bo0XsFkzf85FUTvXKC35o
 CtVc4RUEvi0PaZIsH+bGcq3cAk5Od5lvILjTkHgZFosVKTnyUqaNe2hzU4WUnE2QXiHi91v
 P+D6qtlYHDDp5sB5o3hnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F9ART34R/7Y=:swCj9Kfj1aTEDygg7frarp
 lplti8+BeEFN4DCzFvKx0Dt3v/lpytFfGJXn7oZ17OJMJjMRvwHO0SeviymVOS2scJbOImXuu
 Y6jNdCH2ZB9iz1/vmvQI5/Dl4oLCTdrLwxTgb82HDkHYkn0NRhXRqXD4bvoxY0ZjqMZHq0WLx
 aImp80krve65d4f/qUJ3ENUfyRfl975X7NXWl0SOjj12XDxyNv4/+YkC8zt1Px44WptMwL/mw
 kBd0K6yxqFCQ0E/1+PzWhBFPCwHG2ygTOGdFcMzZQl5IW5t+9rIyzlSWcQ3mEh8VPzq0hrHCu
 +eRsYAPJvp4q12zOIsFTGmwkRxazyYMkkWod2ZjjiwSdv7aKT6mz0QgDvZWqBnKsIqbF6/Xhz
 YVjUDuxs/TqmCm91ln/cRCnD0yKauJEeY4TTuN2GeC59CFhm/cFr1C97w6dHeU606SHk6xBkY
 SgLIO/z7+wD9dOZMXUKO27j3297FvGK69VAJq5qE5Htn810/YCsqRnK0lbMjb0GvykuwFueqx
 SfE6JY0KY4t5MREYcKYzZpmQt0omGDUvLhbiaR5u+05jNIUFUih5OQlIK3Ep1r9cImddm2ou4
 IygOm51+E/jBb9Zzrc2blZDzoRu7BjYQNNONwpK+BcSfZ2/fUv4ugUZH1CNKuW/A32qOZbwmU
 kxazEBrni0sM6qPI8z5OmZSO3OWdR3jJF62pwI51zbDCs9dHcgoabWllQa5v6ldVRjDdGjiyX
 vqpNEItIa9ELhfwVtT8/gIvi5bNc/2+7ZhfM8yyyWOvM0Aj5lXE28FcH6zf9fBqKXNNPgz6vB
 HURRj9fPeWwcgylOj2G2p6EZHX3A+zJdudsFwF3PmSPbnFVd+8+ndz0ixTRro3xT6eBnqZI+G
 XVnB6246+RaHQql6ON/OhaAeLq2YsZaXjMhOWWBO5RDlxX1C5vIhkJaFjMIKBxEV4sESswM5i
 A/XW6BVOROi1IAipqUNWow2yJaZOYMTjKwHCpYVAXRH5Q/eVlWAHaBPaZRHm7mtPKtJvd1lpQ
 1RUGGD1hruiZIqGbx0BxqwqcARhJ/0paobiwOUNCeVD08N27YBSo6ET9ByG4V+nAKORmY7/Sc
 gnr1KjzJS+y4k8=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/16/21 18:08, John David Anglin wrote:
> On 2021-11-16 10:31 a.m., John David Anglin wrote:
>> I=C2=A0don't=C2=A0know=C2=A0what's=C2=A0wrong=C2=A0with=C2=A0it.=C2=A0=
=C2=A0I=C2=A0have=C2=A0reverted=C2=A0it=C2=A0for=C2=A0now.
> I think problem must be with cache flush range.

Not sure. Seems like reverting SIGRETURN_TRAMP back to 4 fixes it.

Anyway, I'll revert the whole patch for now.
Maybe we can fix it in v5.17.

Helge
