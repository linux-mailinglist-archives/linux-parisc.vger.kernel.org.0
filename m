Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E24EDBB2F3
	for <lists+linux-parisc@lfdr.de>; Mon, 23 Sep 2019 13:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732229AbfIWLms (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 23 Sep 2019 07:42:48 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:39383 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726146AbfIWLms (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 23 Sep 2019 07:42:48 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190923114246.EHLK4584.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 23 Sep 2019 07:42:46 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20190923114246.WNDR39285.torspm01.bell.net@[192.168.2.49]>;
          Mon, 23 Sep 2019 07:42:46 -0400
Subject: Re: C8000, which is the max MTU of the built-in net card?
To:     Carlo Pisani <carlojpisani@gmail.com>, linux-parisc@vger.kernel.org
References: <CAK-9enMxA68mRYFG=2zD02guvCqe-aa3NO0YZuJcTdBWn5MPqg@mail.gmail.com>
 <20190917212844.GJ9591@lunn.ch>
 <CAK-9enOx8xt_+t6-rpCGEL0j-HJGm=sFXYq9-pgHQ26AwrGm5Q@mail.gmail.com>
 <df0f961d-2d53-63e3-8087-6f0b09e14317@bell.net>
 <f71e9773-5cfb-f20b-956f-d98b11a5d4a7@gmx.de>
 <CA+QBN9BepXXQKksDXBn3MpRdzSq3Aq=XzTwDh_F+vVjTvnFpBg@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <905e567a-3e82-969e-8062-5dd4c712929a@bell.net>
Date:   Mon, 23 Sep 2019 07:42:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+QBN9BepXXQKksDXBn3MpRdzSq3Aq=XzTwDh_F+vVjTvnFpBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=S9inP7kP c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=J70Eh1EUuV4A:10 a=FBHGMhGWAAAA:8 a=UOMpvLWk_2my8sRCpQgA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfJSUpwpyUpGNWQduSDLpNb6287IiyEtZaye+G2h8sKRJI45pbGqUJAkSZ943hBRcipH2daknZ67dDP7rCU193vWlY2QAWyiVUS6LECJpsU6TQZhoIzxH FSfuB3ReNoHcKam3/iFJeUX10YelqcxPMMpw5ytSnGr4VRAbSZRWH/XylSIkM74GxUmEyL/aZiAzUQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-09-23 6:43 a.m., Carlo Pisani wrote:
> I need 2000 MTU, 4000 MTU, 7000 MTU, or 9000 MTU
>
> can someone check the max MTU capability of the built-in lan on a C8000?
My c8000 has an intel e1000:
[   21.140119] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI

The driver supports jumbo packets up to 0x3F00:
dave@mx3210:~/linux/linux-stable/drivers/net/ethernet/intel/e1000$ grep  MAX_JUMBO_FRAME_SIZE *
e1000_hw.h:#define MAX_JUMBO_FRAME_SIZE         0x3F00
e1000_main.c:   netdev->max_mtu = MAX_JUMBO_FRAME_SIZE - (ETH_HLEN + ETH_FCS_LEN);
e1000_main.c:           /* Capable of supporting up to MAX_JUMBO_FRAME_SIZE limit. */

Dave

-- 
John David Anglin  dave.anglin@bell.net

