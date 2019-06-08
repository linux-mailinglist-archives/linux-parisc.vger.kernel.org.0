Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 701F73A00B
	for <lists+linux-parisc@lfdr.de>; Sat,  8 Jun 2019 15:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfFHNut (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 8 Jun 2019 09:50:49 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:44212 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726967AbfFHNus (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Jun 2019 09:50:48 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190608135047.CYZQ4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 8 Jun 2019 09:50:47 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm02.bell.net
          with ESMTP
          id <20190608135047.SZVI30132.torspm02.bell.net@[192.168.2.49]>;
          Sat, 8 Jun 2019 09:50:47 -0400
Subject: Re: [RESEND V2] modprobe: ERROR: could not insert 'ipv6': Exec format
 error / module ipv6: Unknown relocation: 72
To:     Jeroen Roovers <jer@gentoo.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     hppa@gentoo.org
References: <20190608145201.56c667f5@wim.jer>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <9c3811a6-bbce-d3fc-8a3d-8d85c242915f@bell.net>
Date:   Sat, 8 Jun 2019 09:50:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608145201.56c667f5@wim.jer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=dq6fvYVFJ5YA:10 a=FBHGMhGWAAAA:8 a=I5gVDNyalyELh64daLMA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfKlWK5bN7Ao/Tx4qUqXAt95EzZF2EkgPqxp3wsDAZBc53rPHIMl8XgW8UmAByuk25UZF0U4d6lV3PWYHsV191BGH7RhJt/OpjCSokGhYykpmOE6MbTI2 K+2oSP/7s8BUBjx9wkQCxg3o1diK2o+N3Gg+y64cu1olh2UOAtCWGfbsG6GiFRnFj63YwjhBPrk9jg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-06-08 8:52 a.m., Jeroen Roovers wrote:
> Second resend. Not sure why e-mail from my Gentoo account and private
> account never arrive. Originally sent on 21 May 2019, but I still see
> this issue in 5.2.0-rc3-JeR-00077-g16d72dd4891f. I attached the kernel
> config in earlier attempts but I am leaving that out this time.
> 
> 
> <Forwarded message:> 
> 
> 
> # modprobe -v ipv6
> insmod /lib/modules/5.2.0-rc1-JeR/kernel/net/ipv6/ipv6.ko
> modprobe: ERROR: could not insert 'ipv6': Exec format error
> 
> dmesg:
> module ipv6: Unknown relocation: 72

Relocation 72 is R_PARISC_PCREL64.  It would be created in assembler using
something like:

	.dword symbol-.

> 
> # modprobe -v nf_conntrack
> insmod /lib/modules/5.2.0-rc1-JeR/kernel/net/netfilter/nf_conntrack.ko
> modprobe: ERROR: could not insert 'nf_conntrack': Exec format error
> 
> dmesg:
> module nf_conntrack: Unknown relocation: 72
> 
> Note that other modules are loaded properly. Any ideas?

You could find how it's created by looking at assembler for nf_conntrack.

Dave
-- 
John David Anglin  dave.anglin@bell.net
