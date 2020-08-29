Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3066925691A
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Aug 2020 18:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbgH2QjD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Aug 2020 12:39:03 -0400
Received: from mout.gmx.net ([212.227.15.15]:44475 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgH2QjA (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Aug 2020 12:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1598719130;
        bh=7GScJlVWcrsKh0VbR80SpJlNc3H7KU4sl4q7FEj42h8=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=DciaXo176IjJRi/IE62bb72BtwaldrmeybE1j3sG0wEPoe0AdIlUd6eUR3Pukt1EL
         43fsliGJz1IAYHWBGCAuOVLyMneUxChKffSvyKWn8PwpbU55kGRUy/9HGw+Ilu5srz
         oc1f6RLo6l2g57T+O10pjt+yaZlAsZS7C7iu8TA0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.105]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5eR-1jvu4V07sL-00J1AX; Sat, 29
 Aug 2020 18:38:50 +0200
Subject: Re: [PATCH] parisc: Drop useless comments in uapi/asm/signal.h
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20200829160924.GA5329@ls3530.fritz.box>
 <94f89eec-5792-0521-ea90-15e3da56bfab@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <703e3e67-4dc3-41c2-2494-3cb2292c8d7d@gmx.de>
Date:   Sat, 29 Aug 2020 18:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <94f89eec-5792-0521-ea90-15e3da56bfab@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:+gr7OVdHubmfBmPZytYjcNPi9r2kmZy2/LDCoKja8uzIy/spkbO
 2IahucfpAgAzO/Iw/7JR0YSbP3z90DSfcpjvjksI5TEieG+Pr4W/4D+SqwJNy0v4ZfL4+XE
 +w/JRhmyvJvx6skFJV1DvhO39XR0htTpzp0LYj2nm08kkTaCBEzEpTGtZUfw7VnobD9TO5R
 pY6ltxWB8W79AaS+0E2DA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YTe7H5+NOcQ=:RRhzVdrTPs7e/wLnHCq0Ne
 AOv+Gc+5zrtOS1EByqLqLwchWvBJlOw8b74Md55G7Ks/ZbiRdOvtpry9T6nrQRRRrk3Sl+/YS
 l1ug7LNZkxOuieSj/c/LXmbdrojH7A1cxTiSyOh8PDZlWXBATItI7F1xiyiv/c75C4suaSTNv
 /BiHokvfE0D0ifiCYCe+/kBjCzV4x64sE9qMRnYNVFRmbAW02WtNszbtIPphaJ20C8Jm+nX7M
 cp7oSe1ZutsIU6Mc6mDYdBsAO8puLC2QsENTAlfT5DMsBERXxwBpmCiBnAVYqk2lkz+bygWJ5
 tGkjR7kJwf7swO9/B/j/qKuc1B6zRJFiK0afDy1BTI+QMARLNDq6IGIC04cDnsa8Bags3wk+N
 lefatMirKH4KEG0TuWSY9YSeZcMzUolW/g+en9QgAKdvV2Ia/khoFw0ABbe1FHVNf6KJbcB+X
 DDlMIfYSkzEAoj48Uk3Jl1LUa1SPDTDjfokXYsUtpUEySqkFawVxpb6PHUDvkGPVUJHVnNLd6
 SK+VsVpSsA+XVTamKwWavr2v+Uztdcl3Wz/L3Vs6PdvQV+K4WEB6X+tlms0gs2yROl17QK46W
 Uzst+aHLyRCc9xXeISvN5us16YXzP9t8f165+mpDTS6ObkWMuuP/0lQniIgEWaJTPQCqvVoiN
 9/WyD+Pl4EzS0e8PD19StaFZBRbqmYT0xR96QIy0j53ZKnqGLqUX+bbT5kxoeoRnVxs92nmzh
 A7P/GJggczn8qtzRs9whvMOGRhoEuOeMl62v00idN2sFfDU4jrkSsvqFAU10eVjapv4e9KxXd
 r8qG/SiDrX76jbVyYdDovIZjGDTXnzXEnU4+8nsH+p+7ejjbgJxCp/aDlGtbsnnUAtfRS6y72
 ksgUnRyk73IEYtPKGVP+hF17F3qxwueDxzR0DZAqzBr0IgEO/dGRakfaY2PhXCDSFiM913HPh
 5zBA+4R3bnHINP0MA8UIHoZlXDLl2FnLnLbDuVLkaZr2KmFAJcOU7VOaji9WY3p9uC7IN+4+j
 eM4DFRNWrU1XfIlIl5bmJtlKtpFmBEw3eU7DHrDCYcoohdlek+Ko1aHjD/KqbmHSsh8qJFz24
 uqB1NEMgHVOpYNniiZdpMnCbXm+biQqx+0wHCSU+IQ63evPam1gPrJg0M7CIZR3VIMZVvgCLz
 7tgd1ijpQDHCvX0/jExxe2cqFKVmCbz75lJJ/hI+QbCGHcqz4v7JxzaEzKDAxmF76hxM93l6e
 ssk3preFH+B/SG5wG
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 29.08.20 18:25, John David Anglin wrote:
> On 2020-08-29 12:09 p.m., Helge Deller wrote:
>> -#define SIGSYS		31 /* Linux doesn't use this */
>> +#define SIGSYS		31
> ?

Yeah. I don't know why the comment was there.
Other arches don't have this comment either.

Helge
