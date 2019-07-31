Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCCAF7CD16
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 21:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbfGaTqK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 15:46:10 -0400
Received: from mout.gmx.net ([212.227.15.15]:42999 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbfGaTqK (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564602365;
        bh=CflCvjOb0L97/v7viWvbhAbIkL+9e3QCvG9YIUVbFKY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=K9Fu8eUW+mowBfbll0HrVAjYR/NwR0SZzGsz3xukXBDuvDVjYALrtTxfBkK9SNNXi
         YSq/wf8BJ4H9xdYDPo6JvXuH/iIJ76b0VlIhjm59dSa6aesPImnts/cs8whiOnZmM/
         nkIAp1a/DMx+k432QlXekTD41j4X2G4WyCvI/dKM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.24]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MLO9y-1htSVq3WuA-000fzv; Wed, 31
 Jul 2019 21:46:04 +0200
Subject: Re: Compressed kernels currently won't boot
To:     Sven Schnelle <svens@stackframe.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
References: <1564591443.3319.30.camel@HansenPartnership.com>
 <20190731173016.GA23520@t470p.stackframe.org>
 <1564595402.3319.40.camel@HansenPartnership.com>
 <1564602012.3319.45.camel@HansenPartnership.com>
 <20190731194413.GB23520@t470p.stackframe.org>
From:   Helge Deller <deller@gmx.de>
Message-ID: <0084df92-ca9f-7600-187d-bc6123f30fd1@gmx.de>
Date:   Wed, 31 Jul 2019 21:46:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731194413.GB23520@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JhIKvtYU6jfn9YcFL3YxMO8V0aB1xF5UrGJbEMcq5bR1/uDUTyA
 qM10C6ejKVCNmXsclbKewf75r9ekXa/o0lWTG95XA/QlbFhL1WQ+z72M4yMms2e/QZOzXXM
 BHlXAPodx6VrgGHQX74pNT0+acrMvnUxSBmnXg6OYqKZRnGpxmMM0d9elot7lfTNZfI57Ty
 rwurYseXib2EwMjfJyeXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iqkzcYQjUPM=:ZTegSBkCRwhIwLV+c41HAE
 DF1/MiLxz0esUIgcw5spL98xY4qm0q9q6HWkQLMOSLXivrIvGcLyZ2+IF5yo3f5Xf8EpnKsFz
 nlqqFIa0GVAt2bijrKwcIpLRdyrTPVZ0IWyoRfE6cdW5ndSWNNX/ZS8iNWMIsX+yZFRXpeOZS
 Son64bER2U9yZ9jcmMXkLROiNGxdEJp/ClN3MyHXJxZHpT/iodFGJkh7AtFPAaKLDj+uR1dsM
 Ts1G0AcuHqkg0VlFK6kYO3tk/4gf/QhOach79TqblyueXOz/E64+1GM/jY/S23sh++BAAmGQd
 M3GhvdJE4GSyRpfanCJp0neQ9Kztd44NQHpdivTSbU6PTJdfn97r4Z2ubsq84k+s3pmfgFybv
 Mu0osciLDdDGmoV/Qz9PkCTRExjYEhkL+GJlsteFX/iE0V8o78uME8H38KL95y/v9iIdIyFuy
 +sCjbo80xfKdaYul0xs9HLFHoCn2BHoqnVx/GnbzM8P8uvzt/d1hidr59Dxd0AIL9dsJgUu7D
 /AoMvstJfKImyTBc4bJq7HC50nggBdIaurAse6uYQmps5ms8KLjT9XMCq74f4YtAgT0hRj4nQ
 KKHYOgcwde10gt0jjmw71d9e2zQRoGIlab/+unQjwt55CcazoHfA2x8fYalbOwT3aM8Qktlqg
 6aVD6yAbSTx3rWqzAuxWXjDm1UdtM22n01px3uzvqWBfLVqmYT3MqX4IMvvQr4/YS64a1R293
 pWTk7pz28OQ7QNS2EvkGUxyYdxKB6TsVfThirc0JNGyzoCq1TBizkgB/rd0GakJdupBHFIEwc
 DJKk0yu75WdclTy80IRRC8z6zNcn0xoawiHdVGRfmamv4N6gzWoT37D5NM6qoJ/Wo01GjVZ3Y
 ixcnSGZqlfV5DVlkhWPQefa8bH9uVnCg4xDAy5RfPYij3ofSHblT2bFvs1rdNYVvycDCnG2OV
 KpLruxJ1jsh+KWW7PVKwzlyepFRh5cIH9DSW/K81mL1x2zXcOW/O9zclbPqG8Z7gbXucsQPqm
 CIMB1NJXqN/5DxYm1O2gxyJSOyeRccBNWisZtJQa4QfSuiaFA2goK3XUfJ57UxwT/mYr8L/1K
 kSRMgH+7B6gY/Q=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 31.07.19 21:44, Sven Schnelle wrote:
> Hi James,
>
> On Wed, Jul 31, 2019 at 12:40:12PM -0700, James Bottomley wrote:
>
>> What about causing the compressed make to build both a stripped and a
>> non-stripped bzImage (say sbzImage and bzImage).  That way you always
>> have the stripped one available for small size things like boot from
>> tape or DVD?  but in the usual case we use the bzImage with full
>> contents.
>
> In that case we would also need to build two lifimages - how about addin=
g
> a config option option? Something like "Strip debug information from com=
pressed
> kernel images"?

I agree, two lifimages don't make sense. Only one vmlinuz gets installed.
Instead of the config option, I tink my latest patch is better.

Helge
