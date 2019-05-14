Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5430C1CA2D
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 16:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfENOXw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 14 May 2019 10:23:52 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:59023 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725854AbfENOXw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 14 May 2019 10:23:52 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190514142351.VMBI4444.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 14 May 2019 10:23:51 -0400
Received: from [192.168.0.183] (really [64.231.94.175])
          by mtlspm01.bell.net with ESMTP
          id <20190514142351.EGZS87666.mtlspm01.bell.net@[192.168.0.183]>;
          Tue, 14 May 2019 10:23:51 -0400
Subject: Re: C3600, sata controller
To:     Sven Schnelle <svens@stackframe.org>,
        Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
References: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net>
 <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net>
 <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
 <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net>
 <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
 <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net>
 <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
 <20190514130151.GA530@t470p.stackframe.org>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <922dc8c9-f401-ed07-ce83-a534fecefb04@bell.net>
Date:   Tue, 14 May 2019 10:23:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514130151.GA530@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 cx=a_idp_d a=BQ4/tlW0byS+YqYqK5JCyg==:117 a=BQ4/tlW0byS+YqYqK5JCyg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=RLqBYu2tszeTHraToI8A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfGQCLFq3NePjHMYYCcQppEuc0yqto0lcDkaY8/2qBC92FWMNs/qu5DcQtlW7iUiH9phVSxsy6BVkPkrg2ChH9Afv4XzW3czpuOsh92EfdNVVO+Rrg9HD sa9kh81qqddap7ydcMHzuWtsc8g4sFLrNde4aU7PxlR9z+6Nnuo44HVuqiV+fZRmzMdPkI7mzOIOhA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-14 9:01 a.m., Sven Schnelle wrote:
> On Tue, May 14, 2019 at 02:29:07PM +0200, Carlo Pisani wrote:
>>> I had listed these cards because they are PCI64 and the Adaptec site didn't say Intel
>>> architecture was required.
>> So, if you put the Adaptec AAR-2410SA SATA-card into a non-x86
>> computer ... the BIOS extension is not expected, [..]
> I think the ATI FireGL card in the C8000 Workstation is a normal x86 graphics
> card and PDC just emulates the stuff required to execute the VGA BIOS. Would
> be interesting whether it would also execute a BIOS on a PCI-X card, but i would
> guess not. So a x86 BIOS in the C8000 is not always unexpected.
Maybe this is why SY-PCX40009 works in c8000 and not in c3600.  It would be interesting to try
AAR-2410SA in c8000.

Dave

-- 
John David Anglin  dave.anglin@bell.net

