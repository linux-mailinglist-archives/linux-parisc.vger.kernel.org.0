Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 151B62BB2C
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 22:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfE0UNE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 16:13:04 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:49358 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726657AbfE0UNE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 16:13:04 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190527201302.OBIX4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 27 May 2019 16:13:02 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by torspm02.bell.net
          with ESMTP
          id <20190527201302.VBMN30132.torspm02.bell.net@[192.168.0.183]>;
          Mon, 27 May 2019 16:13:02 -0400
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     Carlo Pisani <carlojpisani@gmail.com>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Sven Schnelle <svens@stackframe.org>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <7bb12d08-6a2a-11e0-774c-2498c7f8b607@bell.net>
Date:   Mon, 27 May 2019 16:13:02 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=cHUkyknzAAAA:8 a=FBHGMhGWAAAA:8 a=G2aKBvnys06ejr_7Pc4A:9 a=QEXdDO2ut3YA:10 a=lOJfQmpZbiwA:10 a=2w-UfRLKSRkA:10 a=_0NSq4RkwvYA:10 a=Awsxgdc2jwqaVR4UEmqk:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfIEskyfusTF49OFOmGcMwrM9OIwNRHlgM9WQg/Xi9WffrMNi1t7SO85e18erJ1Kab2FL1p3oOg6XYCGnEo6eF1/i0bS0jkrG6qyn4PTUrjUPItywg63p c6gr0/k7lUG/7M+A9UNC3kreA+SiuuhG3orzOsPQZSP8qEnSnFdDiGUuo9t1MlwH8k+Lkzmjg51snw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-27 3:35 p.m., Carlo Pisani wrote:
> isn't possible to burn the flash in the C3600 machine with the
> firmware of C3750?
> these two look similar.
>
Highly doubtful.  Don't know where you would find firmware for either.
Firmware needs to put on bootable device (tape drive!!!):
https://www.manualslib.com/manual/436656/Hp-Visualize-B1000-Workstation.html?page=187#manual

-- 
John David Anglin  dave.anglin@bell.net

