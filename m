Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961233239D
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jun 2019 16:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfFBOqB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jun 2019 10:46:01 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:57504 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725977AbfFBOqB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jun 2019 10:46:01 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190602144600.IZCB7367.torfep02.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 2 Jun 2019 10:46:00 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20190602144600.FKQD39285.torspm01.bell.net@[192.168.2.49]>;
          Sun, 2 Jun 2019 10:46:00 -0400
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <20190528153815.GB16860@t470p.stackframe.org>
 <674f8b61-e897-f657-68a2-648babca00be@bell.net>
 <1943613.tnj53yOHQY@daneel.sf-tec.de>
 <20190528173922.GA32192@t470p.stackframe.org>
 <f782e9cd-0824-6c29-09bc-986813dd1e56@bell.net>
 <61253aef-2571-f8bb-756a-bf2018e533e4@gmx.de>
 <20190530195543.GB683@t470p.stackframe.org>
 <20190530205955.GD683@t470p.stackframe.org>
 <b7763436-cee8-6d8d-87cd-992947a9d651@bell.net>
 <CA+QBN9Dt07Rt9Z5BSGYf4gWcPv=66wmU7aq5Z4KcdzMe9HL76w@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <1f31afbe-a92b-1073-b0f9-ff8574c3cf3e@bell.net>
Date:   Sun, 2 Jun 2019 10:45:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+QBN9Dt07Rt9Z5BSGYf4gWcPv=66wmU7aq5Z4KcdzMe9HL76w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=dq6fvYVFJ5YA:10 a=FBHGMhGWAAAA:8 a=kwki-FSEuDxx4p2GG4sA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfIO46GsAg1XimMDKFDnyo1MqOI+t4FjjGhadduKXOUiEfhJxC96PnbgiItxYnBO9i6T1cmfzK3b9alIfNgWijeKuZurjs0Voz/4W2n7CSakFTJStL/hk 2yAA1MaAQ9skwuw0PQK7+VeWp+6UqapJrpBBfwC2K9YQi4f5pYpcE0nT87CdUze6o4rb6RxuTkTz9g==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-06-02 6:29 a.m., Carlo Pisani wrote:
> guys, can someone help me to create patches for solving the
> PCI-problem on kernel 4.20?
> currently, I am on kernel 5.1.*, but I also need to have a working 4.20
> 
As a hack, change this line
	ioc_needs_fdc = boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC;
in drivers/parisc/sba_iommu.c to
	ioc_needs_fdc = 1;

Dave
-- 
John David Anglin  dave.anglin@bell.net
