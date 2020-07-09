Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D419821A106
	for <lists+linux-parisc@lfdr.de>; Thu,  9 Jul 2020 15:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgGINjg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 9 Jul 2020 09:39:36 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:37998 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726859AbgGINjg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 9 Jul 2020 09:39:36 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200709133934.JUHZ6697.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 9 Jul 2020 09:39:34 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20200709133934.WDHW29322.torspm01.bell.net@[192.168.2.49]>;
          Thu, 9 Jul 2020 09:39:34 -0400
Subject: Re: [PATCH] parisc: Fix spinlock barriers
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
 <35432085.F4uqhuS8rR@daneel.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <595e592a-36a5-e90f-e661-c5e52ec7753d@bell.net>
Date:   Thu, 9 Jul 2020 09:39:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <35432085.F4uqhuS8rR@daneel.sf-tec.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=N659UExz7-8A:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=oklHn6CPSoCDtX3iL_YA:9 a=pILNOxqGKmIA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfO4iktd+SPnOUezhxHyQ7oWp09OvXJ92PwYdv60KrAzH39/7ADXH3fNiLwZoJSDpwOEWfVyDTHafTfYCI7q6eyzrmo0vC0dQKGF9qwE5BREk+6Wr77kn xpvh1GRRdxXV8r5gHBftPr9r2TYle8+ZxZHr/1YIX/5nIl3k1dhsjCDG7heL6MY+zIdOAOrYTyduSg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-07-09 9:26 a.m., Rolf Eike Beer wrote:
> Am Freitag, 3. Juli 2020, 22:32:35 CEST schrieb John David Anglin:
>> Stalls are quite frequent with recent kernels.  When the stall is detected
>> by rcu_sched, we get a backtrace similar to the following:
> With this patch on top of 5.7.7 I still get:
Suggest enabling CONFIG_LOCKUP_DETECTOR=y and CONFIG_SOFTLOCKUP_DETECTOR=y so
we can see where the stall occurs.

Dave

-- 
John David Anglin  dave.anglin@bell.net

